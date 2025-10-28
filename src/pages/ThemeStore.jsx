import { useState } from 'react';
import { TABLE_THEMES, PAGE_THEMES, CATEGORIES } from '../config/themes';
import ThemeCard from '../components/ThemeCard';
import './ThemeStore.css';

export default function ThemeStore() {
  const [selectedCategory, setSelectedCategory] = useState('all');
  const [searchQuery, setSearchQuery] = useState('');
  const [themeType, setThemeType] = useState('table');

  const themes = themeType === 'table' ? TABLE_THEMES : PAGE_THEMES;

  const filteredThemes = themes.filter((theme) => {
    const matchesCategory =
      selectedCategory === 'all' || theme.category === selectedCategory;
    const matchesSearch =
      theme.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
      theme.description.toLowerCase().includes(searchQuery.toLowerCase()) ||
      theme.tags.some((tag) =>
        tag.toLowerCase().includes(searchQuery.toLowerCase())
      );
    return matchesCategory && matchesSearch;
  });

  return (
    <div className="theme-store">
      <div className="store-header">
        <h1>Theme Store</h1>
        <p>
          Browse our collection of free CSS themes for Goblin Notebook.
          Click any theme to preview and get the import code.
        </p>
      </div>

      <div className="store-filters">
        <div className="theme-type-toggle">
          <button
            className={themeType === 'table' ? 'active' : ''}
            onClick={() => setThemeType('table')}
          >
            Table Themes ({TABLE_THEMES.length})
          </button>
          <button
            className={themeType === 'page' ? 'active' : ''}
            onClick={() => setThemeType('page')}
          >
            Page Themes ({PAGE_THEMES.length})
          </button>
        </div>

        <div className="search-bar">
          <input
            type="text"
            placeholder="Search themes..."
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
          />
        </div>

        <div className="category-filters">
          {CATEGORIES.map((category) => (
            <button
              key={category.id}
              className={
                selectedCategory === category.id
                  ? 'category-btn active'
                  : 'category-btn'
              }
              onClick={() => setSelectedCategory(category.id)}
            >
              <span className="category-icon">{category.icon}</span>
              {category.name}
            </button>
          ))}
        </div>
      </div>

      <div className="theme-grid">
        {filteredThemes.length > 0 ? (
          filteredThemes.map((theme) => (
            <ThemeCard key={theme.id} theme={theme} themeType={themeType} />
          ))
        ) : (
          <div className="no-results">
            <p>No themes found matching your criteria.</p>
            <button onClick={() => { setSearchQuery(''); setSelectedCategory('all'); }}>
              Clear Filters
            </button>
          </div>
        )}
      </div>
    </div>
  );
}
