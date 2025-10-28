import { Link } from 'react-router-dom';
import './Home.css';

export default function Home() {
  return (
    <div className="home">
      <section className="hero">
        <h1>Welcome to GoblinThemes</h1>
        <p className="hero-subtitle">
          Custom CSS themes for Goblin Notebook - Free and open source
        </p>
        <div className="hero-buttons">
          <Link to="/theme-store" className="hero-btn primary">
            Browse Themes
          </Link>
          <Link to="/table-generator" className="hero-btn secondary">
            Table Generator
          </Link>
        </div>
      </section>

      <section className="features">
        <div className="feature-card">
          <div className="feature-icon">🎨</div>
          <h3>Theme Store</h3>
          <p>
            Browse our collection of beautiful themes for tables and pages.
            From medieval fantasy to cyberpunk sci-fi.
          </p>
          <Link to="/theme-store">Explore Themes →</Link>
        </div>

        <div className="feature-card">
          <div className="feature-icon">⚡</div>
          <h3>Table Generator</h3>
          <p>
            Create custom HTML and Markdown tables with live preview. Choose
            from 20+ pre-built styles or create your own.
          </p>
          <Link to="/table-generator">Generate Tables →</Link>
        </div>

        <div className="feature-card">
          <div className="feature-icon">📚</div>
          <h3>Documentation</h3>
          <p>
            Learn how to use GoblinThemes with your Goblin Notebook. Step-by-step
            guides and code examples.
          </p>
          <Link to="/documentation">Read Docs →</Link>
        </div>
      </section>

      <section className="quick-start">
        <h2>Quick Start</h2>
        <div className="quick-start-content">
          <div className="quick-start-step">
            <div className="step-number">1</div>
            <h4>Choose a Theme</h4>
            <p>Browse the theme store and pick one you like</p>
          </div>
          <div className="quick-start-step">
            <div className="step-number">2</div>
            <h4>Copy the Import Link</h4>
            <p>Click the copy button to get the CSS import code</p>
          </div>
          <div className="quick-start-step">
            <div className="step-number">3</div>
            <h4>Add to Your Notebook</h4>
            <p>Paste the link into your Goblin Notebook CSS</p>
          </div>
        </div>
      </section>

      <section className="stats">
        <div className="stat">
          <div className="stat-number">24+</div>
          <div className="stat-label">Table Themes</div>
        </div>
        <div className="stat">
          <div className="stat-number">10+</div>
          <div className="stat-label">Page Themes</div>
        </div>
        <div className="stat">
          <div className="stat-number">100%</div>
          <div className="stat-label">Free</div>
        </div>
      </section>
    </div>
  );
}
