import './Documentation.css';

export default function Documentation() {
  return (
    <div className="documentation">
      <h1>Documentation</h1>

      <section className="doc-section">
        <h2>Getting Started</h2>
        <p>
          GoblinThemes provides free CSS themes for Goblin Notebook. All themes
          can be imported directly into your notebook using simple link tags.
        </p>
      </section>

      <section className="doc-section">
        <h2>Using Table Styles</h2>
        <p>
          To use table styles, first import the table stylesheet at the top of
          your page:
        </p>
        <pre>
          <code>
            {`<link rel="stylesheet" href="https://sliverspell.github.io/goblinthemes/tablestyles/tables.css">`}
          </code>
        </pre>

        <p>Then wrap your table with the desired style class:</p>
        <pre>
          <code>
            {`<div class="medieval-table">

| Header 1 | Header 2 | Header 3 |
|----------|----------|----------|
| Data 1   | Data 2   | Data 3   |

</div>`}
          </code>
        </pre>
      </section>

      <section className="doc-section">
        <h2>Using Page Themes</h2>
        <p>
          Page themes change the entire look of your notebook page. Import them
          in your main CSS settings:
        </p>
        <pre>
          <code>
            {`<link rel="stylesheet" href="https://sliverspell.github.io/goblinthemes/themes/medieval.css">`}
          </code>
        </pre>
        <p>
          You can change themes by simply replacing the theme name in the URL
          (e.g., medieval.css, neon.css, mothership.css).
        </p>
      </section>

      <section className="doc-section">
        <h2>Table Generator</h2>
        <p>
          Our Table Generator helps you create custom tables quickly:
        </p>
        <ol>
          <li>Choose a theme or enable custom styling</li>
          <li>Set the number of rows and columns</li>
          <li>Click "Generate Table"</li>
          <li>Copy the HTML or Markdown output</li>
          <li>Paste into your Goblin Notebook</li>
        </ol>
      </section>

      <section className="doc-section">
        <h2>Available Table Themes</h2>
        <div className="theme-list">
          <ul>
            <li>medieval-table</li>
            <li>neon-table</li>
            <li>cyberpunk-table</li>
            <li>horror-table</li>
            <li>steampunk-table</li>
            <li>space-table</li>
            <li>underwater-table</li>
            <li>enchanted-forest-table</li>
            <li>digital-cybernetics-table</li>
            <li>mothership-table</li>
            <li>mork-table</li>
            <li>And many more...</li>
          </ul>
        </div>
      </section>

      <section className="doc-section">
        <h2>Customization</h2>
        <p>
          All themes can be customized by copying the CSS and modifying it in
          your Goblin Notebook's CSS editor. This allows you to:
        </p>
        <ul>
          <li>Change colors</li>
          <li>Adjust fonts and sizes</li>
          <li>Modify spacing and padding</li>
          <li>Add your own background images</li>
        </ul>
      </section>

      <section className="doc-section">
        <h2>Support</h2>
        <p>
          Need help? Join the{' '}
          <a
            href="https://discord.com/channels/885441039538745374/channel-browser"
            target="_blank"
            rel="noopener noreferrer"
          >
            Goblin Notebook Discord
          </a>{' '}
          or open an issue on{' '}
          <a
            href="https://github.com/sliverspell/goblinthemes"
            target="_blank"
            rel="noopener noreferrer"
          >
            GitHub
          </a>
          .
        </p>
      </section>
    </div>
  );
}
