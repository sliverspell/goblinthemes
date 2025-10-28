# GoblinThemes - React Version

A modern React application for browsing and generating CSS themes for Goblin Notebook.

## Features

- **Theme Store**: Browse 30+ table and page themes with visual previews
- **Table Generator**: Create custom HTML and Markdown tables with live preview
- **Theme Categories**: Filter by fantasy, sci-fi, horror, modern, and more
- **Search**: Find themes by name, description, or tags
- **Copy Import Codes**: One-click copy for CSS import links
- **Documentation**: Complete guides on using themes

## Quick Start

### Development

```bash
npm install
npm run dev
```

Visit `http://localhost:3000` to see the app.

### Build for Production

```bash
npm run build
```

The built files will be in the `dist/` directory.

## Project Structure

```
/
├── src/                      # React application source
│   ├── components/          # Reusable components (Header, Footer, etc.)
│   ├── pages/              # Page components (Home, ThemeStore, etc.)
│   ├── config/             # Theme configurations
│   ├── styles/             # Global styles
│   └── App.jsx             # Main app component
├── public/                  # Static files served as-is
│   ├── themes/             # Page CSS themes (medieval.css, etc.)
│   ├── tablestyles/        # Table CSS styles
│   ├── notestyles/         # Note CSS styles
│   └── theme-hacks/        # CSS utility hacks
├── index.html              # Entry HTML file
└── vite.config.js          # Vite configuration
```

## Important: CSS Files for External Use

All CSS files in the `public/` directory are preserved and accessible for external imports. Users can still import themes using:

```html
<link rel="stylesheet" href="https://yoursite.com/themes/medieval.css">
<link rel="stylesheet" href="https://yoursite.com/tablestyles/tables.css">
```

**Nothing breaks for existing users!** All import URLs continue to work exactly as before.

## Pages

### Home
- Landing page with featured themes
- Quick start guide
- Statistics and feature cards

### Theme Store
- Browse all table and page themes
- Filter by category (fantasy, sci-fi, horror, etc.)
- Search themes by name or tags
- Visual color palette previews
- Copy import codes with one click

### Table Generator
- Create custom HTML and Markdown tables
- Choose from 24+ pre-built table styles
- Custom color styling options
- Live output preview
- Copy generated code to clipboard

### Documentation
- How to use themes in Goblin Notebook
- Step-by-step integration guides
- List of all available themes
- Customization tips

## Technology Stack

- **React 19** - UI framework
- **Vite 7** - Build tool and dev server
- **React Router 7** - Client-side routing
- **CSS Modules** - Scoped component styling
- **Supabase** - Backend (ready for future features)

## Adding New Themes

### Table Themes

1. Add CSS to `public/tablestyles/tables.css`
2. Add theme definition to `src/config/themes.js` in the `TABLE_THEMES` array

### Page Themes

1. Add CSS file to `public/themes/yourtheme.css`
2. Add theme definition to `src/config/themes.js` in the `PAGE_THEMES` array

## Future Features

- User accounts and authentication
- Save favorite themes
- Community theme submissions
- AI-powered theme generator
- Theme remix and fork functionality
- Advanced table templates
- Export themes as npm packages

## Contributing

Contributions are welcome! Please open an issue or pull request on GitHub.

## License

MIT License - Free to use for personal and commercial projects.

## Support

- [Discord](https://discord.com/channels/885441039538745374/channel-browser)
- [GitHub Issues](https://github.com/sliverspell/goblinthemes)
- [Ko-fi](https://ko-fi.com/N4N8IAAPM)

---

Created with 💚 for the Goblin Notebook community
