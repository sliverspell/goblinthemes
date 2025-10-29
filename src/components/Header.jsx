import { useState } from 'react';
import { Link } from 'react-router-dom';
import './Header.css';

export default function Header() {
  const [isDropdownOpen, setIsDropdownOpen] = useState(false);

  return (
    <header className="header">
      <nav className="nav">
        <ul className="nav-links">
          <li>
            <Link to="/">Home</Link>
          </li>
          <li>
            <Link to="/theme-store">Theme Store</Link>
          </li>
          <li
            className="dropdown"
            onMouseEnter={() => setIsDropdownOpen(true)}
            onMouseLeave={() => setIsDropdownOpen(false)}
          >
            <button className="dropbtn">Generators</button>
            {isDropdownOpen && (
              <div className="dropdown-content">
                <Link to="/table-generator">Table Generator</Link>
                <Link to="/snippet-library">Snippet Library</Link>
              </div>
            )}
          </li>
          <li>
            <Link to="/documentation">Documentation</Link>
          </li>
        </ul>
      </nav>
    </header>
  );
}
