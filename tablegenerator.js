// Escapes HTML to ensure it displays correctly in <pre> tags
function escapeHTML(html) {
    return html
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;")
        .replace(/'/g, "&#039;");
}

// Toggles the visibility of the styling options based on the checkbox state
function toggleStylingOptions() {
    const stylingOptions = document.getElementById("stylingOptions");
    stylingOptions.style.display = document.getElementById("styling").checked ? "block" : "none";
}


// ____________________________________________________________________________________
// Generates the table and updates the output containers
function generateTable() {
    const style = document.getElementById("styleSelect").value;
    const columns = parseInt(document.getElementById("columns").value, 10);
    const rows = parseInt(document.getElementById("rows").value, 10);
    const includeStyling = document.getElementById("styling").checked;
    const wideTable = document.getElementById("wideTable").checked;
    const headerColor = document.getElementById("headerColor").value;
    const evenRowColor = document.getElementById("evenRowColor").value;
    const oddRowColor = document.getElementById("oddRowColor").value;
    const rowFontColor = document.getElementById("rowFontColor").value;
    const fontSize = document.getElementById("fontSize").value;
    const fontColor = document.getElementById("fontColor").value;

// Get the selected theme
const theme = style !== "" && style !== "None" ? style : null;

let tableHTML = "<table class=\"custom-table\">\n";
let markdownOutput = "";

// Generate table headers
tableHTML += "<thead>\n";
tableHTML += "<tr style=\"background-color: " + headerColor + "; color: " + fontColor + ";\">\n";
markdownOutput += "|";
for (let c = 1; c <= columns; c++) {
    tableHTML += `  <th>Header ${c}</th>\n`;
    markdownOutput += ` Header ${c} |`;
}
tableHTML += "</tr>\n";
tableHTML += "</thead>\n";
markdownOutput += "\n|" + "-----------|".repeat(columns) + "\n";

// Generate table rows
tableHTML += "<tbody>\n";
for (let r = 1; r <= rows; r++) {
    const rowColor = r % 2 === 0 ? evenRowColor : oddRowColor;
    const rowFontSize = r % 2 === 0 ? fontSize : (parseInt(fontSize) + 2) + "px"; // Increase font size for odd rows
    tableHTML += `<tr style="background-color: ${rowColor}; color: ${rowFontColor}; font-size: ${rowFontSize};">\n`;
    for (let c = 1; c <= columns; c++) {
        const cellData = `Data ${r}-${c}`;
        tableHTML += `  <td>${cellData}</td>\n`;
    }
    tableHTML += "</tr>\n";
}

// Generate Markdown output with correct formatting
markdownOutput += "|";
for (let c = 1; c <= columns; c++) {
    markdownOutput += ` Header ${c} |`; // Generate header cell data
}
markdownOutput += "\n";

// Generate data rows
for (let r = 1; r <= rows; r++) {
    markdownOutput += "|";
    for (let c = 1; c <= columns; c++) {
        const cellData = `Data ${r}-${c}`; // Generate cell data
        markdownOutput += ` ${cellData} |`; // Add cell data between pipe symbols
    }
    markdownOutput += "\n"; // Add a newline character at the end of each row
}

tableHTML += "</tbody>\n";
tableHTML += "</table>\n";

// Display the generated table and Markdown table
let outputHTML = theme ? `<div class="${theme}">\n\n${tableHTML}</div>` : tableHTML;
let markdownDiv = `<div class="${theme || ''}">\n\n${markdownOutput}\n\n</div>`;


    document.getElementById("tableOutput").innerHTML = `<pre>${escapeHTML(outputHTML)}</pre>`;
    document.getElementById("markdownOutput").innerHTML = `<pre>${escapeHTML(markdownDiv)}</pre>`;
}



// DO NOT DELETE THESE --------------------------------------------------------------------

// Set up initial state or bindings when the DOM is fully loaded
document.addEventListener('DOMContentLoaded', () => {
    document.getElementById('generateTableButton').addEventListener('click', generateTable);
});

// Set up initial state or bindings when the DOM is fully loaded
document.addEventListener('DOMContentLoaded', () => {
    document.getElementById('generateTableButton').addEventListener('click', generateTable);
});


// Clears the output containers
function clearOutputs() {
    document.getElementById("tableOutput").innerHTML = "Your generated table will appear here...";
    document.getElementById("markdownOutput").textContent = "Markdown version will appear here..."; // Change innerHTML to textContent
}

// Copy the HTML content to the clipboard
function copyHTMLToClipboard() {
    const content = document.getElementById("tableOutput").innerText;
    navigator.clipboard.writeText(content)
        .then(() => alert("HTML copied to clipboard!"))
        .catch(err => console.error("Failed to copy HTML:", err));
}

// Copy the markdown content to the clipboard
function copyMarkdown() {
    const content = document.getElementById("markdownOutput").textContent; // Get the text content
    navigator.clipboard.writeText(content)
        .then(() => alert('Markdown copied to clipboard!'))
        .catch(err => console.error('Failed to copy Markdown:', err));
}

// Copy the content of a specific output container to the clipboard
function copyToClipboard(contentId) {
    const content = document.getElementById(contentId).innerText; // Use innerText to get the rendered text
    navigator.clipboard.writeText(content)
        .then(() => alert(`${contentId.replace("Output", "")} copied to clipboard!`))
        .catch(err => console.error(`Failed to copy ${contentId}:`, err));
}


document.querySelector('.toggle-button').addEventListener('click', function() {
    this.classList.toggle('active');
    var content = this.nextElementSibling;
    if (content.style.display === "block") {
        content.style.display = "none";
    } else {
        content.style.display = "block";
    }
});
