# Guide: Adding Snippets to Your Supabase Database

This guide explains how to add markdown snippets and complete page layouts to your Goblin Themes snippet library using Supabase.

## Table of Contents

1. [Understanding Snippet Types](#understanding-snippet-types)
2. [Database Schema Reference](#database-schema-reference)
3. [Method 1: Using Supabase SQL Editor (Recommended)](#method-1-using-supabase-sql-editor)
4. [Method 2: Using Supabase Table Editor](#method-2-using-supabase-table-editor)
5. [Finding Your Category IDs](#finding-your-category-ids)
6. [Example Snippets Ready to Add](#example-snippets-ready-to-add)

---

## Understanding Snippet Types

### Single Components vs Complete Layouts

**Single Components** (`layout_type: 'single'`):
- Individual reusable pieces like stat blocks, info boxes, or tables
- Can be combined to create custom layouts
- Generally simpler and faster to use
- Examples: NPC stat block, loot table, info box

**Complete Layouts** (`layout_type: 'complete'`):
- Full page layouts combining multiple sections
- Pre-designed for specific purposes (character sheets, location pages, quest templates)
- Include multiple components in one snippet
- Save time but less flexible
- Examples: Complete character sheet, full location writeup, session notes template

### Complexity Levels

- **Basic**: Simple, straightforward snippets requiring minimal customization
- **Intermediate**: Multi-section layouts with some complexity
- **Advanced**: Complex layouts with many components, relationships, and CSS requirements

---

## Database Schema Reference

### snippets Table Structure

| Column | Type | Required | Description |
|--------|------|----------|-------------|
| `id` | uuid | Auto | Primary key (auto-generated) |
| `title` | text | Yes | Snippet title (shown in cards) |
| `description` | text | Yes | Brief description of what the snippet does |
| `category_id` | uuid | Yes | Foreign key to snippet_categories |
| `tags` | text[] | No | Array of tags (e.g., `ARRAY['5e', 'combat']`) |
| `markdown_content` | text | Yes | The actual markdown code to copy |
| `html_content` | text | Yes | HTML version (can be minimal) |
| `requires_css` | boolean | No | Does this need special CSS classes? |
| `css_classes` | text[] | No | Array of required CSS classes |
| `preview_image` | text | No | Optional preview image URL |
| `rpg_system` | text | No | RPG system (default: 'Universal') |
| `is_featured` | boolean | No | Show as featured? (default: false) |
| `layout_type` | text | No | 'single' or 'complete' (default: 'single') |
| `complexity_level` | text | No | 'basic', 'intermediate', or 'advanced' (default: 'basic') |
| `component_list` | text[] | No | List of components included in layout |

---

## Method 1: Using Supabase SQL Editor (Recommended)

This method is best for adding multiple snippets at once or using the pre-made examples.

### Step 1: Access SQL Editor

1. Go to your Supabase project dashboard
2. Click on **SQL Editor** in the left sidebar
3. Click **New query** to create a blank query

### Step 2: Get Your Category IDs

First, you need to know the IDs of your snippet categories. Run this query:

```sql
SELECT id, name, icon FROM snippet_categories ORDER BY order_num;
```

Copy the UUIDs for the categories you'll use. Example result:
```
id: 123e4567-e89b-12d3-a456-426614174000 | name: Character Sheets
id: 234e5678-e89b-12d3-a456-426614174001 | name: Locations
```

### Step 3: Add Snippets Using INSERT

You have two options:

#### Option A: Use the Pre-Made Examples

1. Open the file `supabase/example_layouts.sql`
2. Copy the INSERT statements you want
3. Paste into SQL Editor
4. Replace `(SELECT id FROM snippet_categories WHERE name = 'Category Name' LIMIT 1)` with your actual category UUID if needed
5. Click **RUN** to execute

#### Option B: Create Your Own

Use this template:

```sql
INSERT INTO snippets (
  title,
  description,
  category_id,
  tags,
  markdown_content,
  html_content,
  requires_css,
  css_classes,
  rpg_system,
  is_featured,
  layout_type,
  complexity_level,
  component_list
) VALUES (
  'Your Snippet Title',
  'Brief description of what this snippet does',
  '123e4567-e89b-12d3-a456-426614174000', -- Replace with your category UUID
  ARRAY['tag1', 'tag2', 'tag3'],
  E'# Your Markdown Content Here

Put your full markdown snippet here. Use E'' for multi-line strings.
Use \\n for line breaks if needed.',
  '<div class="snippet"></div>', -- Minimal HTML is fine
  true, -- Set to false if no CSS required
  ARRAY['note2', 'note3'], -- Required CSS classes
  'D&D 5e', -- Or 'Universal', 'OSR', etc.
  false, -- Is featured?
  'single', -- 'single' or 'complete'
  'basic', -- 'basic', 'intermediate', or 'advanced'
  ARRAY['Component 1', 'Component 2'] -- List what's included
);
```

### Step 4: Verify Addition

Run this query to see your new snippet:

```sql
SELECT title, layout_type, complexity_level, rpg_system
FROM snippets
ORDER BY created_at DESC
LIMIT 5;
```

---

## Method 2: Using Supabase Table Editor

This method is better for adding one snippet at a time with a visual interface.

### Step 1: Access Table Editor

1. Go to your Supabase project dashboard
2. Click on **Table Editor** in the left sidebar
3. Select the **snippets** table

### Step 2: Add New Row

1. Click the **Insert row** button (green plus icon)
2. Fill in each field:

**Required Fields:**
- **title**: Enter your snippet title
- **description**: Enter a brief description
- **category_id**: Click and select from dropdown (it will show category names)
- **markdown_content**: Paste your markdown code
- **html_content**: Enter minimal HTML (or copy markdown)

**Optional Fields:**
- **tags**: Click to add tags one by one (or type `["tag1", "tag2"]`)
- **requires_css**: Check if CSS is needed
- **css_classes**: Click to add CSS class names (or type `["note2", "note3"]`)
- **rpg_system**: Enter system name (default: Universal)
- **is_featured**: Check to feature this snippet
- **layout_type**: Select 'single' or 'complete'
- **complexity_level**: Select basic/intermediate/advanced
- **component_list**: Click to add components (or type array format)

### Step 3: Save

Click **Save** to add the snippet to your database.

---

## Finding Your Category IDs

### Using SQL Editor

```sql
SELECT id, name FROM snippet_categories ORDER BY name;
```

### Using Table Editor

1. Go to Table Editor
2. Select **snippet_categories** table
3. View the **id** column for each category
4. Copy the UUID you need

### Available Categories (Default)

- Layout
- Character Sheets
- Items & Equipment
- Tables
- Note Boxes
- Locations
- Quests & Adventures
- Combat & Mechanics
- Headers & Titles

---

## Example Snippets Ready to Add

All example snippets are available in `supabase/example_layouts.sql`. Here's what's included:

### Complete Layouts (layout_type: 'complete')

1. **D&D 5e Character Sheet** - Full character sheet with stats, abilities, equipment
2. **Fantasy Tavern Location** - Complete location writeup with NPCs, rumors, plot hooks
3. **One-Shot Quest** - Full adventure with three-act structure, encounters, rewards
4. **Goblin Ambush Combat** - Complete combat encounter with tactics, stat blocks, loot
5. **Session Notes Template** - Comprehensive session tracking with timeline, NPCs, decisions

### Single Components (layout_type: 'single')

1. **Simple Stat Block** - Quick NPC/monster stats
2. **Info Box (Note Style 2)** - Styled information box
3. **Simple Loot Table** - Quick treasure table

---

## Tips & Best Practices

### Markdown Content Tips

1. **Use Proper Escaping**: When using SQL, escape single quotes with `''` or use `E''` for multi-line strings
2. **Test Separately**: Test your markdown in Goblin Notebook before adding to database
3. **Include Headers**: Always start with a clear header (`# Title`)
4. **Use Divs for Styling**: Wrap sections in `<div class="note2">` for themed boxes

### Tagging Strategy

Good tags help users find snippets:
- Include RPG system tags: `5e`, `osr`, `pf2e`, `universal`
- Include content type: `combat`, `social`, `exploration`, `npc`
- Include use case: `template`, `example`, `quick`, `detailed`
- Include theme requirements: `medieval`, `scifi`, `fantasy`

### Component Lists

For complete layouts, list all major components so users know what's included:
- "Header Section"
- "Stats Block"
- "NPC Table"
- "Loot Table"
- "Plot Hooks"
- "Notes Section"

### CSS Requirements

If your snippet requires CSS:
1. Set `requires_css` to `true`
2. List all required CSS classes in `css_classes` array
3. Mention which theme CSS files work best in the description
4. Common classes: `note2`, `note3`, `character-header`, `stats-container`

---

## Quick Reference: Adding a Simple Snippet

The absolute minimum SQL to add a basic snippet:

```sql
INSERT INTO snippets (title, description, category_id, markdown_content, html_content)
VALUES (
  'My Snippet',
  'What this snippet does',
  (SELECT id FROM snippet_categories WHERE name = 'Tables' LIMIT 1),
  E'# My Markdown\n\nContent here',
  '<div></div>'
);
```

---

## Troubleshooting

### Error: "violates foreign key constraint"
**Solution**: Your `category_id` doesn't exist. Run the category query to get valid UUIDs.

### Error: "invalid input syntax for type uuid"
**Solution**: Make sure you're using a valid UUID format for `category_id`.

### Snippet doesn't show up
**Solution**: Check that:
1. The snippet was actually inserted (run SELECT query)
2. Your filters in the UI aren't hiding it
3. The category exists and is valid

### Tags/Arrays not working
**Solution**: Use proper PostgreSQL array syntax:
- In SQL: `ARRAY['tag1', 'tag2']`
- In Table Editor UI: `["tag1", "tag2"]`

### Markdown not rendering correctly
**Solution**:
1. Check for unescaped quotes in SQL
2. Use `E''` prefix for multi-line strings
3. Test the markdown in Goblin Notebook first

---

## Need Help?

- Check `supabase/example_layouts.sql` for working examples
- Review the database schema in `supabase/migrations/`
- Test snippets in Goblin Notebook before adding to database
