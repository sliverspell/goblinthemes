import { useState } from 'react';
import './ThemeCard.css';

export default function ThemeCard({ theme, themeType }) {
  const [showCopied, setShowCopied] = useState(false);

  const getImportCode = () => {
    const baseUrl = window.location.origin;
    if (themeType === 'table') {
      return `<link rel="stylesheet" href="${baseUrl}${theme.cssPath}">`;
    } else {
      return `<link rel="stylesheet" href="${baseUrl}${theme.cssPath}">`;
    }
  };

  const copyToClipboard = async () => {
    const code = getImportCode();
    try {
      await navigator.clipboard.writeText(code);
      setShowCopied(true);
      setTimeout(() => setShowCopied(false), 2000);
    } catch (err) {
      console.error('Failed to copy:', err);
    }
  };

  return (
    <div className="theme-card">
      <div className="theme-preview" style={{
        background: `linear-gradient(135deg, ${theme.colors[0]}, ${theme.colors[1] || theme.colors[0]})`
      }}>
        <div className="color-swatches">
          {theme.colors.slice(0, 3).map((color, index) => (
            <div
              key={index}
              className="color-swatch"
              style={{ backgroundColor: color }}
              title={color}
            />
          ))}
        </div>
      </div>

      <div className="theme-info">
        <h3>{theme.name}</h3>
        <p className="theme-description">{theme.description}</p>

        <div className="theme-tags">
          {theme.tags.slice(0, 3).map((tag) => (
            <span key={tag} className="tag">
              {tag}
            </span>
          ))}
        </div>

        {theme.font && (
          <div className="theme-font">
            <span>Font: {theme.font}</span>
          </div>
        )}

        <div className="theme-actions">
          <button
            className="copy-btn"
            onClick={copyToClipboard}
          >
            {showCopied ? '✓ Copied!' : 'Copy Import Code'}
          </button>
        </div>

        <details className="code-preview">
          <summary>View Code</summary>
          <pre>
            <code>{getImportCode()}</code>
          </pre>
        </details>
      </div>
    </div>
  );
}
