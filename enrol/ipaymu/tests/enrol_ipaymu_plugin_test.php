<?php
// If PHPUnit's base TestCase isn't available, define a simple one
if (!class_exists('\PHPUnit\Framework\TestCase')) {
    require_once 'PHPUnit/Autoload.php';
}

// Use PHPUnit's base TestCase if advanced_testcase isn't available
if (!class_exists('advanced_testcase')) {
    class advanced_testcase extends \PHPUnit\Framework\TestCase {
        protected function resetAfterTest() {
            // Do nothing in standalone mode
        }
        
        protected function setAdminUser() {
            global $USER;
            $USER = (object)['id' => 2, 'firstname' => 'Admin', 'lastname' => 'User'];
        }
    }
}

// Include the class we want to test
require_once(__DIR__ . '/../../../lib.php');

class enrol_ipaymu_plugin_test extends advanced_testcase {

    protected function setUp(): void {
        $this->resetAfterTest();
    }

    public function test_add_instance_with_cost() {
        global $DB;

        $this->setAdminUser();
        $course = $this->getDataGenerator()->create_course();
        $plugin = enrol_get_plugin('ipaymu');

        $fields = [
            'courseid' => $course->id,
            'type' => 'ipaymu',
            'name' => 'iPaymu Enrolment',
            'enrol_ipaymu_cost' => '150.50', // Cost as string, might be localized
            'enrol_ipaymu_currency' => 'IDR',
            'enrol_ipaymu_roleid' => 5, // Student role
            'status' => 0, // Enabled
        ];

        // Simulate form data structure for add_instance
        $formdata = new stdClass();
        $formdata->cost = $fields['enrol_ipaymu_cost'];
        $formdata->currency = $fields['enrol_ipaymu_currency'];
        $formdata->roleid = $fields['enrol_ipaymu_roleid'];
        $formdata->status = $fields['status'];
        // Other fields like enrolperiod, enrolstartdate, enrolenddate can be added if needed

        $instanceid = $plugin->add_instance($course, (array)$formdata);
        $this->assertNotEmpty($instanceid);

        $instance = $DB->get_record('enrol', ['id' => $instanceid]);
        $this->assertNotFalse($instance);
        $this->assertEquals(150.50, (float)$instance->cost);
        $this->assertEquals('IDR', $instance->currency);
    }

    public function test_update_instance_cost() {
        global $DB;

        $this->setAdminUser();
        $course = $this->getDataGenerator()->create_course();
        $plugin = enrol_get_plugin('ipaymu');

        // Create an initial instance
        $initial_formdata = new stdClass();
        $initial_formdata->cost = '100.00';
        $initial_formdata->currency = 'IDR';
        $initial_formdata->roleid = 5;
        $initial_formdata->status = 0;
        $instanceid = $plugin->add_instance($course, (array)$initial_formdata);
        $instance = $DB->get_record('enrol', ['id' => $instanceid]);
        $this->assertNotFalse($instance);

        // Data for update
        $updatedata = new stdClass();
        $updatedata->id = $instance->id;
        $updatedata->cost = '250.75'; // New cost
        // Other fields like currency, roleid, status can be updated too

        $result = $plugin->update_instance($instance, $updatedata);
        $this->assertTrue($result);

        $updated_instance = $DB->get_record('enrol', ['id' => $instanceid]);
        $this->assertNotFalse($updated_instance);
        $this->assertEquals(250.75, (float)$updated_instance->cost);
    }
    
    public function test_enrol_after_payment() {
        global $DB;
        
        $this->setAdminUser();
        $user = $this->getDataGenerator()->create_user();
        $course = $this->getDataGenerator()->create_course();
        $plugin = enrol_get_plugin('ipaymu');
        
        // Create enrollment instance
        $formdata = new stdClass();
        $formdata->cost = '100.00';
        $formdata->currency = 'IDR';
        $formdata->roleid = 5; // Student role
        $formdata->status = 0; // Enabled
        $formdata->enrolperiod = 86400; // 1 day
        
        $instanceid = $plugin->add_instance($course, (array)$formdata);
        $instance = $DB->get_record('enrol', ['id' => $instanceid]);
        
        // Before enrollment, user should not be enrolled
        $context = context_course::instance($course->id);
        $this->assertFalse(is_enrolled($context, $user));
        
        // Simulate enrollment after payment
        $plugin->enrol_user($instance, $user->id, $instance->roleid);
        
        // After successful payment and enrollment, user should be enrolled
        $this->assertTrue(is_enrolled($context, $user));
    }

    public function testDummy() {
        // Add a simple test that will always pass to verify setup
        $this->assertTrue(true);
    }
}
