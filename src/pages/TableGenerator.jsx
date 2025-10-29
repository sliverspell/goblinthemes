import { useState } from 'react';
import { TABLE_THEMES } from '../config/themes';
import './TableGenerator.css';

export default function TableGenerator() {
  const [columns, setColumns] = useState(4);
  const [rows, setRows] = useState(4);
  const [selectedStyle, setSelectedStyle] = useState('');
  const [includeStyling, setIncludeStyling] = useState(false);
  const [headerColor, setHeaderColor] = useState('#000000');
  const [evenRowColor, setEvenRowColor] = useState('#FFFFFF');
  const [oddRowColor, setOddRowColor] = useState('#F5F5F5');
  const [rowFontColor, setRowFontColor] = useState('#000000');
  const [fontSize, setFontSize] = useState(12);
  const [fontColor, setFontColor] = useState('#000000');
  const [wideTable, setWideTable] = useState(false);
  const [showInstructions, setShowInstructions] = useState(false);
  const [htmlOutput, setHtmlOutput] = useState('');
  const [markdownOutput, setMarkdownOutput] = useState('');
  const [copiedHtml, setCopiedHtml] = useState(false);
  const [copiedMd, setCopiedMd] = useState(false);

  const escapeHTML = (html) => {
    return html
      .replace(/&/g, '&amp;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;')
      .replace(/"/g, '&quot;')
      .replace(/'/g, '&#039;');
  };

  const generateTable = () => {
    const tableClass = selectedStyle ? `class="${selectedStyle}"` : 'class="custom-table"';
    let tableHTML = `<table ${tableClass}>\n`;
    let markdown = '';

    tableHTML += '<thead>\n';
    tableHTML += `<tr style="background-color: ${headerColor}; color: ${fontColor};">\n`;
    markdown += '|';

    for (let c = 1; c <= columns; c++) {
      tableHTML += `  <th>Header ${c}</th>\n`;
      markdown += ` Header ${c} |`;
    }

    tableHTML += '</tr>\n';
    tableHTML += '</thead>\n';
    markdown += '\n|' + '-----------|'.repeat(columns) + '\n';

    tableHTML += '<tbody>\n';
    for (let r = 1; r <= rows; r++) {
      const rowColor = r % 2 === 0 ? evenRowColor : oddRowColor;
      const rowFont = r % 2 === 0 ? fontSize : parseInt(fontSize) + 2;
      tableHTML += `<tr style="background-color: ${rowColor}; color: ${rowFontColor}; font-size: ${rowFont}px;">\n`;
      markdown += '|';

      for (let c = 1; c <= columns; c++) {
        const cellData = `Data ${r}-${c}`;
        tableHTML += `  <td>${cellData}</td>\n`;
        markdown += ` ${cellData} |`;
      }

      tableHTML += '</tr>\n';
      markdown += '\n';
    }

    tableHTML += '</tbody>\n';
    tableHTML += '</table>\n';

    setHtmlOutput(tableHTML);
    setMarkdownOutput(markdown);
  };

  const clearOutputs = () => {
    setHtmlOutput('');
    setMarkdownOutput('');
  };

  const copyToClipboard = async (content, type) => {
    try {
      await navigator.clipboard.writeText(content);
      if (type === 'html') {
        setCopiedHtml(true);
        setTimeout(() => setCopiedHtml(false), 2000);
      } else {
        setCopiedMd(true);
        setTimeout(() => setCopiedMd(false), 2000);
      }
    } catch (err) {
      console.error('Failed to copy:', err);
    }
  };

  return (
    <div className="table-generator">
      <h1>Table Generator</h1>

      <div className="toggle-container">
        <button
          className="toggle-button"
          onClick={() => setShowInstructions(!showInstructions)}
        >
          {showInstructions ? '▼' : '►'} How to Use the Goblin Table Generator
        </button>
        {showInstructions && (
          <div className="toggle-content">
            <p>
              This generator creates both HTML and Markdown tables. You can
              either choose a style from the dropdown, or press "Include
              Styling" to customize colors.
            </p>
            <p>
              Choose the number of columns and rows, then press "Generate Table".
            </p>
            <p>
              If using GoblinTheme CSS table styles, add this link above your
              table:
            </p>
            <code>
              &lt;link rel="stylesheet"
              href="https://sliverspell.github.io/goblinthemes/tablestyles/tables.css"&gt;
            </code>
          </div>
        )}
      </div>

      <div className="generator-form">
        <div className="form-group">
          <label htmlFor="styleSelect">Choose a Table Style:</label>
          <select
            id="styleSelect"
            value={selectedStyle}
            onChange={(e) => setSelectedStyle(e.target.value)}
          >
            <option value="">None</option>
            {TABLE_THEMES.map((theme) => (
              <option key={theme.id} value={theme.id}>
                {theme.name}
              </option>
            ))}
          </select>
        </div>

        <div className="form-group checkbox-group">
          <label>
            <input
              type="checkbox"
              checked={includeStyling}
              onChange={(e) => setIncludeStyling(e.target.checked)}
            />
            Include Custom Styling
          </label>
        </div>

        {includeStyling && (
          <div className="styling-options">
            <div className="form-group">
              <label htmlFor="headerColor">Header Color:</label>
              <input
                type="color"
                id="headerColor"
                value={headerColor}
                onChange={(e) => setHeaderColor(e.target.value)}
              />
            </div>

            <div className="form-group">
              <label htmlFor="evenRowColor">Even Row Color:</label>
              <input
                type="color"
                id="evenRowColor"
                value={evenRowColor}
                onChange={(e) => setEvenRowColor(e.target.value)}
              />
            </div>

            <div className="form-group">
              <label htmlFor="oddRowColor">Odd Row Color:</label>
              <input
                type="color"
                id="oddRowColor"
                value={oddRowColor}
                onChange={(e) => setOddRowColor(e.target.value)}
              />
            </div>

            <div className="form-group">
              <label htmlFor="rowFontColor">Row Font Color:</label>
              <input
                type="color"
                id="rowFontColor"
                value={rowFontColor}
                onChange={(e) => setRowFontColor(e.target.value)}
              />
            </div>

            <div className="form-group">
              <label htmlFor="fontSize">Font Size:</label>
              <input
                type="number"
                id="fontSize"
                min="8"
                max="32"
                value={fontSize}
                onChange={(e) => setFontSize(e.target.value)}
              />
            </div>

            <div className="form-group">
              <label htmlFor="fontColor">Font Color:</label>
              <input
                type="color"
                id="fontColor"
                value={fontColor}
                onChange={(e) => setFontColor(e.target.value)}
              />
            </div>

            <div className="form-group checkbox-group">
              <label>
                <input
                  type="checkbox"
                  checked={wideTable}
                  onChange={(e) => setWideTable(e.target.checked)}
                />
                Wide Table
              </label>
            </div>
          </div>
        )}

        <div className="form-group">
          <label htmlFor="columns">Number of Columns:</label>
          <input
            type="number"
            id="columns"
            min="2"
            max="20"
            value={columns}
            onChange={(e) => setColumns(parseInt(e.target.value))}
          />
        </div>

        <div className="form-group">
          <label htmlFor="rows">Number of Rows:</label>
          <input
            type="number"
            id="rows"
            min="2"
            max="20"
            value={rows}
            onChange={(e) => setRows(parseInt(e.target.value))}
          />
        </div>

        <div className="form-actions">
          <button onClick={generateTable}>Generate Table</button>
          <button onClick={clearOutputs}>Clear</button>
        </div>
      </div>

      <div className="output-container">
        <div className="output-section">
          <h3>HTML Table</h3>
          <div className="output-box">
            {htmlOutput ? (
              <pre>{escapeHTML(htmlOutput)}</pre>
            ) : (
              <p>Your generated table will appear here...</p>
            )}
          </div>
          <button
            onClick={() => copyToClipboard(htmlOutput, 'html')}
            disabled={!htmlOutput}
          >
            {copiedHtml ? '✓ Copied!' : 'Copy HTML'}
          </button>
        </div>

        <div className="output-section">
          <h3>Markdown Table</h3>
          <div className="output-box">
            {markdownOutput ? (
              <pre>{escapeHTML(markdownOutput)}</pre>
            ) : (
              <p>Markdown version will appear here...</p>
            )}
          </div>
          <button
            onClick={() => copyToClipboard(markdownOutput, 'markdown')}
            disabled={!markdownOutput}
          >
            {copiedMd ? '✓ Copied!' : 'Copy Markdown'}
          </button>
        </div>
      </div>
    </div>
  );
}
