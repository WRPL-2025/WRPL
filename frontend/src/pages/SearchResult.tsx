import { useState, useEffect } from 'react'
import axios from 'axios'

export default function SearchResult() {
  const [searchResults, setSearchResults] = useState<any[]>([])

  useEffect(() => {
    const fetchSearchResults = async () => {
      const response = await axios.get<any[]>('/api/search')
      setSearchResults(response.data)
    }

    fetchSearchResults()
  }, [])

  return (
    <div>
      <h1>Search Results</h1>
      <ul>
        {searchResults.map((result) => (
          <li key={result.id}>{result.name}</li>
        ))}
      </ul>
    </div>
  )
}
