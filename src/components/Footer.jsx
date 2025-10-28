import './Footer.css';

export default function Footer() {
  return (
    <footer className="footer">
      <div className="footer-content">
        <p>
          GoblinThemes - Custom CSS themes for{' '}
          <a
            href="https://www.the-goblin.net/notebook"
            target="_blank"
            rel="noopener noreferrer"
          >
            Goblin Notebook
          </a>
        </p>
        <p>
          Created with love by the community |{' '}
          <a
            href="https://github.com/sliverspell/goblinthemes"
            target="_blank"
            rel="noopener noreferrer"
          >
            GitHub
          </a>
        </p>
        <p>
          <a
            href="https://ko-fi.com/N4N8IAAPM"
            target="_blank"
            rel="noopener noreferrer"
          >
            Support on Ko-fi
          </a>
        </p>
      </div>
    </footer>
  );
}
