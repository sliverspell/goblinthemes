import { useState, useEffect } from 'react';
import { supabase } from '../config/supabase';
import './SnippetLibrary.css';

export default function SnippetLibrary() {
  const [categories, setCategories] = useState([]);
  const [snippets, setSnippets] = useState([]);
  const [filteredSnippets, setFilteredSnippets] = useState([]);
  const [selectedCategory, setSelectedCategory] = useState('all');
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedRpgSystem, setSelectedRpgSystem] = useState('all');
  const [selectedLayoutType, setSelectedLayoutType] = useState('all');
  const [selectedComplexity, setSelectedComplexity] = useState('all');
  const [selectedSnippet, setSelectedSnippet] = useState(null);
  const [copiedId, setCopiedId] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchData();
  }, []);

  useEffect(() => {
    filterSnippets();
  }, [selectedCategory, searchQuery, selectedRpgSystem, selectedLayoutType, selectedComplexity, snippets]);

  const fetchData = async () => {
    try {
      const [categoriesResult, snippetsResult] = await Promise.all([
        supabase.from('snippet_categories').select('*').order('order_num'),
        supabase.from('snippets').select('*').order('created_at', { ascending: false })
      ]);

      if (categoriesResult.data) setCategories(categoriesResult.data);
      if (snippetsResult.data) setSnippets(snippetsResult.data);
    } catch (error) {
      console.error('Error fetching data:', error);
    } finally {
      setLoading(false);
    }
  };

  const filterSnippets = () => {
    let filtered = [...snippets];

    if (selectedCategory !== 'all') {
      filtered = filtered.filter(s => s.category_id === selectedCategory);
    }

    if (selectedRpgSystem !== 'all') {
      filtered = filtered.filter(s => s.rpg_system === selectedRpgSystem);
    }

    if (selectedLayoutType !== 'all') {
      filtered = filtered.filter(s => s.layout_type === selectedLayoutType);
    }

    if (selectedComplexity !== 'all') {
      filtered = filtered.filter(s => s.complexity_level === selectedComplexity);
    }

    if (searchQuery) {
      const query = searchQuery.toLowerCase();
      filtered = filtered.filter(s =>
        s.title.toLowerCase().includes(query) ||
        s.description.toLowerCase().includes(query) ||
        s.tags.some(tag => tag.toLowerCase().includes(query))
      );
    }

    setFilteredSnippets(filtered);
  };

  const copyToClipboard = async (content, id) => {
    try {
      await navigator.clipboard.writeText(content);
      setCopiedId(id);
      setTimeout(() => setCopiedId(null), 2000);
    } catch (err) {
      console.error('Failed to copy:', err);
    }
  };

  const rpgSystems = ['all', ...new Set(snippets.map(s => s.rpg_system))];

  if (loading) {
    return <div className="snippet-library loading">Loading snippets...</div>;
  }

  return (
    <div className="snippet-library">
      <header className="snippet-header">
        <h1>Markdown Snippet Library</h1>
        <p>Copy-paste ready markdown snippets for Goblin Notebook. Each snippet includes proper styling and works with theme imports.</p>
      </header>

      <div className="snippet-filters">
        <div className="filter-group">
          <label>Category:</label>
          <div className="category-buttons">
            <button
              className={selectedCategory === 'all' ? 'active' : ''}
              onClick={() => setSelectedCategory('all')}
            >
              All
            </button>
            {categories.map(cat => (
              <button
                key={cat.id}
                className={selectedCategory === cat.id ? 'active' : ''}
                onClick={() => setSelectedCategory(cat.id)}
              >
                {cat.icon} {cat.name}
              </button>
            ))}
          </div>
        </div>

        <div className="filter-group">
          <label>RPG System:</label>
          <select
            value={selectedRpgSystem}
            onChange={(e) => setSelectedRpgSystem(e.target.value)}
          >
            {rpgSystems.map(system => (
              <option key={system} value={system}>
                {system === 'all' ? 'All Systems' : system}
              </option>
            ))}
          </select>
        </div>

        <div className="filter-group">
          <label>Layout Type:</label>
          <select
            value={selectedLayoutType}
            onChange={(e) => setSelectedLayoutType(e.target.value)}
          >
            <option value="all">All Types</option>
            <option value="single">Single Components</option>
            <option value="complete">Complete Layouts</option>
          </select>
        </div>

        <div className="filter-group">
          <label>Complexity:</label>
          <select
            value={selectedComplexity}
            onChange={(e) => setSelectedComplexity(e.target.value)}
          >
            <option value="all">All Levels</option>
            <option value="basic">Basic</option>
            <option value="intermediate">Intermediate</option>
            <option value="advanced">Advanced</option>
          </select>
        </div>

        <div className="filter-group">
          <label>Search:</label>
          <input
            type="text"
            placeholder="Search snippets..."
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
          />
        </div>
      </div>

      <div className="snippet-grid">
        {filteredSnippets.map(snippet => (
          <div key={snippet.id} className="snippet-card">
            <div className="snippet-card-header">
              <h3>{snippet.title}</h3>
              {snippet.is_featured && <span className="featured-badge">Featured</span>}
            </div>

            <p className="snippet-description">{snippet.description}</p>

            <div className="snippet-meta">
              <span className="rpg-system">{snippet.rpg_system}</span>
              <span className={`layout-type-badge ${snippet.layout_type || 'single'}`}>
                {snippet.layout_type === 'complete' ? '📄 Complete Layout' : '🧩 Component'}
              </span>
              <span className={`complexity-badge ${snippet.complexity_level || 'basic'}`}>
                {snippet.complexity_level || 'basic'}
              </span>
              {snippet.requires_css && (
                <span className="requires-css" title="Requires CSS classes">
                  CSS: {snippet.css_classes.join(', ')}
                </span>
              )}
            </div>

            <div className="snippet-tags">
              {snippet.tags.map(tag => (
                <span key={tag} className="tag">{tag}</span>
              ))}
            </div>

            <div className="snippet-actions">
              <button
                onClick={() => setSelectedSnippet(snippet)}
                className="btn-preview"
              >
                Preview
              </button>
              <button
                onClick={() => copyToClipboard(snippet.markdown_content, snippet.id)}
                className="btn-copy"
              >
                {copiedId === snippet.id ? '✓ Copied!' : 'Copy Markdown'}
              </button>
            </div>
          </div>
        ))}
      </div>

      {filteredSnippets.length === 0 && (
        <div className="no-results">
          <p>No snippets found matching your filters.</p>
        </div>
      )}

      {selectedSnippet && (
        <div className="preview-modal" onClick={() => setSelectedSnippet(null)}>
          <div className="preview-content" onClick={(e) => e.stopPropagation()}>
            <button className="close-preview" onClick={() => setSelectedSnippet(null)}>×</button>

            <h2>{selectedSnippet.title}</h2>
            <p>{selectedSnippet.description}</p>

            <div className="snippet-preview-meta">
              <span><strong>Type:</strong> {selectedSnippet.layout_type === 'complete' ? 'Complete Layout' : 'Single Component'}</span>
              <span><strong>Complexity:</strong> {selectedSnippet.complexity_level || 'basic'}</span>
              <span><strong>System:</strong> {selectedSnippet.rpg_system}</span>
            </div>

            {selectedSnippet.component_list && selectedSnippet.component_list.length > 0 && (
              <div className="preview-notice">
                <strong>Components Included:</strong>
                <ul>
                  {selectedSnippet.component_list.map((comp, idx) => (
                    <li key={idx}>{comp}</li>
                  ))}
                </ul>
              </div>
            )}

            {selectedSnippet.requires_css && (
              <div className="preview-notice">
                <strong>Required CSS:</strong> This snippet requires the following CSS classes: {selectedSnippet.css_classes.join(', ')}
                <br />
                <small>Import the appropriate theme CSS in your Goblin Notebook page.</small>
              </div>
            )}

            <div className="preview-tabs">
              <div className="preview-section">
                <h3>Markdown Code</h3>
                <pre className="code-block">{selectedSnippet.markdown_content}</pre>
                <button
                  onClick={() => copyToClipboard(selectedSnippet.markdown_content, `modal-${selectedSnippet.id}`)}
                  className="btn-copy-modal"
                >
                  {copiedId === `modal-${selectedSnippet.id}` ? '✓ Copied!' : 'Copy to Clipboard'}
                </button>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
