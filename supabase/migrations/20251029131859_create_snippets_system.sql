/*
  # Markdown Snippet Library System

  1. New Tables
    - `snippet_categories`
      - `id` (uuid, primary key)
      - `name` (text) - Category name (e.g., "Layout", "Character Sheets", "Tables")
      - `icon` (text) - Icon or emoji for the category
      - `order` (integer) - Display order
      - `created_at` (timestamptz)
    
    - `snippets`
      - `id` (uuid, primary key)
      - `title` (text) - Snippet title
      - `description` (text) - Brief description
      - `category_id` (uuid, foreign key to snippet_categories)
      - `tags` (text[]) - Array of tags (e.g., ["5e", "fantasy", "combat"])
      - `markdown_content` (text) - The actual markdown snippet
      - `html_content` (text) - HTML version of the snippet
      - `requires_css` (boolean) - Does this need special CSS classes?
      - `css_classes` (text[]) - Array of CSS classes needed (e.g., ["medieval-table", "note2"])
      - `preview_image` (text) - Optional preview image URL
      - `rpg_system` (text) - RPG system (e.g., "D&D 5e", "OSR", "Universal")
      - `is_featured` (boolean) - Featured snippets
      - `created_at` (timestamptz)
      - `updated_at` (timestamptz)

  2. Security
    - Enable RLS on all tables
    - Public read access (anyone can view snippets)
    - Only authenticated users can add/edit (for future admin panel)
*/

-- Create snippet_categories table
CREATE TABLE IF NOT EXISTS snippet_categories (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  icon text DEFAULT '📝',
  order_num integer DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

ALTER TABLE snippet_categories ENABLE ROW LEVEL SECURITY;

-- Public can read categories
CREATE POLICY "Anyone can read snippet categories"
  ON snippet_categories
  FOR SELECT
  TO public
  USING (true);

-- Create snippets table
CREATE TABLE IF NOT EXISTS snippets (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  description text NOT NULL,
  category_id uuid REFERENCES snippet_categories(id) ON DELETE CASCADE,
  tags text[] DEFAULT '{}',
  markdown_content text NOT NULL,
  html_content text NOT NULL,
  requires_css boolean DEFAULT false,
  css_classes text[] DEFAULT '{}',
  preview_image text,
  rpg_system text DEFAULT 'Universal',
  is_featured boolean DEFAULT false,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

ALTER TABLE snippets ENABLE ROW LEVEL SECURITY;

-- Public can read snippets
CREATE POLICY "Anyone can read snippets"
  ON snippets
  FOR SELECT
  TO public
  USING (true);

-- Insert default categories
INSERT INTO snippet_categories (name, icon, order_num) VALUES
  ('Layout', '📐', 1),
  ('Character Sheets', '👤', 2),
  ('Items & Equipment', '⚔️', 3),
  ('Tables', '📊', 4),
  ('Note Boxes', '📝', 5),
  ('Locations', '🗺️', 6),
  ('Quests & Adventures', '🎲', 7),
  ('Combat & Mechanics', '⚔️', 8),
  ('Headers & Titles', '📰', 9)
ON CONFLICT DO NOTHING;
