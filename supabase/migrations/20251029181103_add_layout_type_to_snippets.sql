/*
  # Add Layout Type Support to Snippets

  1. Changes
    - Add `layout_type` column to snippets table
      - Values: 'single' (individual snippet) or 'complete' (full page layout)
      - Default: 'single'
    - Add `complexity_level` column to snippets table
      - Values: 'basic', 'intermediate', 'advanced'
      - Default: 'basic'
    - Add `component_list` column to snippets table
      - Array of component names included in this layout
      - Helps users understand what's included in complete layouts
    
  2. Purpose
    - Distinguish between single reusable snippets and complete page layouts
    - Allow filtering by layout complexity
    - Document components included in complete layouts
*/

-- Add layout_type column
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'snippets' AND column_name = 'layout_type'
  ) THEN
    ALTER TABLE snippets ADD COLUMN layout_type text DEFAULT 'single' CHECK (layout_type IN ('single', 'complete'));
  END IF;
END $$;

-- Add complexity_level column
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'snippets' AND column_name = 'complexity_level'
  ) THEN
    ALTER TABLE snippets ADD COLUMN complexity_level text DEFAULT 'basic' CHECK (complexity_level IN ('basic', 'intermediate', 'advanced'));
  END IF;
END $$;

-- Add component_list column
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'snippets' AND column_name = 'component_list'
  ) THEN
    ALTER TABLE snippets ADD COLUMN component_list text[] DEFAULT '{}';
  END IF;
END $$;
