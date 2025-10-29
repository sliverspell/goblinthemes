/*
  COMPLETE PAGE LAYOUTS FOR GOBLIN NOTEBOOK
  ==========================================

  These are full page layouts combining multiple sections.
  Copy and paste these INSERT statements into your Supabase SQL Editor.

  INSTRUCTIONS:
  1. Go to your Supabase project
  2. Navigate to SQL Editor
  3. Copy the INSERT statements you want
  4. Replace the category_id with actual UUIDs from your snippet_categories table
  5. Run the query

  To find your category IDs, run:
  SELECT id, name FROM snippet_categories;
*/

-- ============================================
-- CHARACTER SHEET COMPLETE LAYOUT
-- ============================================

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
  'D&D 5e Character Sheet - Complete Layout',
  'Full character sheet layout with header, stats block, abilities section, equipment, and notes. Includes responsive columns and themed styling.',
  (SELECT id FROM snippet_categories WHERE name = 'Character Sheets' LIMIT 1),
  ARRAY['5e', 'character', 'complete-layout', 'stats', 'dnd'],
  E'# Character Name - Level X Class

<div class="character-header">

## Character Overview
**Race:** Human | **Background:** Soldier | **Alignment:** Lawful Good
**Experience:** 6,500 XP | **Next Level:** 14,000 XP

</div>

---

<div class="stats-container">

## Ability Scores

| Ability | Score | Modifier | Save |
|---------|-------|----------|------|
| **STR** | 16 | +3 | +6 |
| **DEX** | 14 | +2 | +2 |
| **CON** | 15 | +2 | +5 |
| **INT** | 10 | +0 | +0 |
| **WIS** | 12 | +1 | +1 |
| **CHA** | 8 | -1 | -1 |

## Combat Stats
**AC:** 18 (Plate Armor)
**HP:** 52 / 52
**Initiative:** +2
**Speed:** 30 ft.
**Hit Dice:** 5d10

</div>

---

<div class="note2">

## Class Features & Abilities

### Fighting Style: Defense
+1 bonus to AC when wearing armor

### Second Wind (1/Short Rest)
Bonus action to regain 1d10 + 5 HP

### Action Surge (1/Short Rest)
Take one additional action on your turn

### Extra Attack
Attack twice when you take the Attack action

</div>

---

## Equipment & Inventory

### Weapons
- **Longsword +1** - +7 to hit, 1d8+4 slashing (1d10+4 versatile)
- **Javelin** - +6 to hit, 1d6+3 piercing, range 30/120

### Armor & Gear
- Plate Armor (AC 18)
- Shield (+2 AC)
- Backpack with adventuring gear
- 50 ft. rope
- Healing potions (2)

### Currency
**GP:** 347 | **SP:** 28 | **CP:** 42

---

<div class="note3">

## Personality & Background

**Personality Traits:** I face problems head-on. I''m always polite and respectful.

**Ideals:** Responsibility. I do what I must and obey just authority.

**Bonds:** I would still lay down my life for the people I served with.

**Flaws:** I have little respect for anyone who is not a proven warrior.

</div>

---

## Notes & Journal

*Campaign notes, quest reminders, and character development go here...*',
  '<div class="character-sheet-complete"><h1>Character Name - Level X Class</h1></div>',
  true,
  ARRAY['note2', 'note3', 'character-header', 'stats-container'],
  'D&D 5e',
  true,
  'complete',
  'intermediate',
  ARRAY['Header Section', 'Stats Block', 'Ability Table', 'Combat Stats', 'Class Features Box', 'Equipment List', 'Currency Tracker', 'Personality Box', 'Notes Section']
);

-- ============================================
-- LOCATION PAGE COMPLETE LAYOUT
-- ============================================

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
  'Fantasy Tavern - Complete Location Layout',
  'Full location page with description, map placeholder, NPC list, menu table, rumors, and plot hooks. Perfect for taverns, inns, and social hubs.',
  (SELECT id FROM snippet_categories WHERE name = 'Locations' LIMIT 1),
  ARRAY['location', 'tavern', 'npc', 'complete-layout', 'fantasy'],
  E'# The Prancing Pony Tavern

<div class="location-header">

**Type:** Tavern & Inn | **District:** Market Square | **Atmosphere:** Lively & Welcoming
**Proprietor:** Barnaby Thornhill | **Reputation:** ⭐⭐⭐⭐

</div>

---

## Description

<div class="note2">

A three-story timber-framed building with a distinctive sign showing a prancing white pony. The common room features a large stone fireplace, oak tables worn smooth by years of use, and the sweet smell of pipe smoke and roasting meat. Mounted trophy heads decorate the walls, and a bard''s stage sits in the corner near the hearth.

**Sights:** Crackling fire, travelers from distant lands, locals playing dice
**Sounds:** Laughter, clinking mugs, the strum of a lute
**Smells:** Roasted meat, fresh bread, ale and pipe smoke

</div>

---

## Key NPCs

| Name | Role | Description | Disposition |
|------|------|-------------|-------------|
| Barnaby Thornhill | Owner | Jovial halfling, ex-adventurer | Friendly |
| Mira Thornhill | Cook | Barnaby''s wife, keeps everyone fed | Helpful |
| "Red" Erik | Bouncer | Scarred half-orc, surprisingly gentle | Neutral |
| Elara Songweaver | Bard | Elven musician seeking stories | Curious |

---

## Menu & Services

<div class="note3">

### Food & Drink
- **Ales & Wines:** 3-8 cp per mug
- **Hearty Stew:** 5 cp (includes bread)
- **Roasted Chicken:** 1 sp
- **Specialty Pie:** 8 cp (changes daily)

### Lodging (Per Night)
- **Common Room:** 2 sp
- **Private Room:** 5 sp
- **Suite:** 1 gp (includes bath)

### Other Services
- Stable your mount (1 cp/night)
- Hot bath (5 cp)
- Message delivery (2 sp)

</div>

---

## Rumors & Gossip (d6)

| d6 | Rumor |
|----|-------|
| 1 | Strange lights seen in the old ruins north of town |
| 2 | Merchant caravan three days overdue from the mountain pass |
| 3 | Local lord''s daughter sneaking out to meet someone |
| 4 | Rats in the sewers grown unusually large and aggressive |
| 5 | Traveling merchant selling "magic" items of dubious quality |
| 6 | Hermit in the woods offering gold for rare mushrooms |

---

<div class="note2">

## Plot Hooks

### The Missing Shipment
Barnaby confides that his ale supplier hasn''t delivered in two weeks. The brewery is only a day''s travel away. He offers free lodging for a week if the party investigates.

### The Mysterious Stranger
A hooded figure in the corner has been asking about the party specifically. They claim to have information about one character''s past but won''t talk in public.

### The Bard''s Request
Elara seeks brave souls to explore the Singing Caves, where she believes she can find inspiration for an epic ballad. She''ll compose a song about the party''s deeds.

</div>

---

## Map Notes

*Sketch your tavern layout here or paste a map image*

**Ground Floor:** Common room, kitchen, private dining room
**Second Floor:** 6 guest rooms, shared washing room
**Third Floor:** Thornhill family quarters, storage
**Basement:** Ale cellar, storage, secret smuggler''s tunnel (unbeknownst to Barnaby)',
  '<div class="location-complete"><h1>The Prancing Pony Tavern</h1></div>',
  true,
  ARRAY['location-header', 'note2', 'note3'],
  'Universal',
  true,
  'complete',
  'intermediate',
  ARRAY['Location Header', 'Description Box', 'Sensory Details', 'NPC Table', 'Menu/Services Box', 'Random Rumors Table', 'Plot Hooks Section', 'Map Placeholder']
);

-- ============================================
-- QUEST/ADVENTURE COMPLETE LAYOUT
-- ============================================

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
  'One-Shot Quest - Complete Adventure Layout',
  'Complete quest structure with hooks, objectives, encounters, NPCs, rewards, and complications. Perfect for one-shot sessions or side quests.',
  (SELECT id FROM snippet_categories WHERE name = 'Quests & Adventures' LIMIT 1),
  ARRAY['quest', 'adventure', 'complete-layout', 'oneshot', 'dm-tools'],
  E'# Quest: The Stolen Heirloom

<div class="quest-header">

**Level:** 3-5 | **Duration:** 3-4 hours | **Type:** Investigation & Combat
**Setting:** Urban/Dungeon | **Party Size:** 3-5 players

</div>

---

## Quest Overview

<div class="note2">

Lady Marissa Blackwood''s family heirloom—an ornate music box with magical properties—has been stolen from her manor. The trail leads to the Thieves'' Guild operating in the city sewers. The party must navigate guild politics, avoid deadly traps, and recover the heirloom before it''s sold to a dangerous buyer.

**Tone:** Mystery with action
**Key Theme:** Not all thieves are evil, and not all nobles are good

</div>

---

## Quest Hooks

1. **The Desperate Noble:** Lady Marissa posts a 500 gp reward for the music box''s return, no questions asked
2. **Guild Business:** A party member with criminal contacts is approached by a rival thief faction
3. **The Pawn Shop:** Characters spot the heirloom in a fence''s shop, but it''s quickly hidden when they show interest
4. **Old Debt:** An NPC ally asks the party to help, as they owe Lady Marissa their life

---

## Key NPCs

| Name | Role | Motivation | Secret |
|------|------|------------|--------|
| Lady Marissa Blackwood | Quest Giver | Desperate to recover family heirloom | The music box contains evidence of her father''s crimes |
| Fingers McKeen | Thieves'' Guild Leader | Profit and guild reputation | Plans to retire after this score |
| The Collector | Mysterious Buyer | Acquiring magical artifacts | Actually an archfey in disguise |
| Rat | Street Urchin Informant | Survival, helping friends | Secretly working for two different factions |

---

## Three-Act Structure

### Act 1: Investigation
<div class="note3">

**Scene 1 - The Manor:** Interview Lady Marissa, investigate the crime scene
- **Clue:** Fresh boot prints leading to a sewer grate
- **Clue:** Thieves'' guild calling card (ace of spades with bite taken out)
- **Challenge:** Perception DC 14 to find hidden lockpick left behind

**Scene 2 - The Streets:** Gather information from contacts
- Visit the Broken Chalice tavern (thieves hangout)
- Persuasion DC 13 to get Rat to talk
- Learn about the Sewer entrance and the guild''s fence operation

</div>

### Act 2: Infiltration
<div class="note3">

**Scene 3 - Sewer Access:** Navigate the dangerous sewers
- **Encounter:** Otyugh guarding territory (can be bypassed with food)
- **Trap:** Poison gas trap (Investigation DC 15, Dexterity save DC 14)
- **Environmental:** Rising water puzzle—three valves must be turned in correct order

**Scene 4 - Guild Hall:** Infiltrate or negotiate with thieves
- **Social Path:** Persuasion/Deception DC 16 to convince Fingers to help
- **Stealth Path:** Stealth DC 14 to sneak past guards
- **Combat Path:** 4 bandit thugs + 1 bandit captain

</div>

### Act 3: The Exchange
<div class="note3">

**Scene 5 - The Deal:** Interrupt the sale to The Collector
- **Revelation:** Party learns the music box contains evidence
- **Decision:** Return it to Lady Marissa, blackmail her, or destroy the evidence
- **Encounter:** The Collector''s bodyguards (2 fey knights) if negotiations fail
- **Twist:** Fingers offers to testify against Marissa in exchange for amnesty

</div>

---

## Important Encounters

### Combat Encounter: Guild Hall Fight

**Enemies:**
- Fingers McKeen (Bandit Captain, 65 HP, AC 15)
- 2 Bandit Thugs (11 HP each, AC 12)
- 1 Apprentice Mage (22 HP, AC 11, knows shocking grasp, sleep)

**Tactics:** Thieves use hit-and-run tactics, hiding behind cover. Mage focuses on disabling strongest party member.

**Treasure:** 134 gp, 2 potions of healing, thieves'' tools (masterwork), letter from The Collector

---

## Rewards & Consequences

<div class="note2">

### Standard Completion
- 500 gp reward from Lady Marissa
- +1 reputation with local nobility
- XP: 1,400 per character

### Alternative Outcomes

**Sided with Thieves:**
- 300 gp + fence discount (20% off magic items)
- +2 reputation with Thieves'' Guild
- -1 reputation with nobility

**Exposed Lady Marissa:**
- 800 gp reward from city guard
- +2 reputation with common folk
- Powerful enemy (Blackwood family)

**Kept the Music Box:**
- Magical item: *Music Box of Memory* (stores up to 5 messages, speaks them when opened)
- Both nobility AND thieves guild become enemies
- The Collector sends agents to recover it

</div>

---

## Complications & Random Events (d6)

| d6 | Complication |
|----|--------------|
| 1 | City guard patrol stumbles upon the party in the sewers |
| 2 | Rival adventuring party also seeks the heirloom |
| 3 | The music box is cursed, causing magical mishaps |
| 4 | Rat betrays party location to highest bidder |
| 5 | Sewer flood forces rushed timeline |
| 6 | The Collector arrives early for the exchange |

---

## DM Notes & Tips

- The music box evidence proves Lord Blackwood (deceased) embezzled from orphanages
- Fingers is actually a Robin Hood figure who donates to those same orphanages
- The Collector works for the Summer Court and wants the box as leverage
- Lady Marissa will pay up to 750 gp if characters negotiate (Persuasion DC 13)
- Rat can become a recurring NPC and informant for future sessions',
  '<div class="quest-complete"><h1>Quest: The Stolen Heirloom</h1></div>',
  true,
  ARRAY['quest-header', 'note2', 'note3'],
  'D&D 5e',
  true,
  'complete',
  'advanced',
  ARRAY['Quest Header', 'Overview Box', 'Quest Hooks', 'NPC Table', 'Three-Act Structure', 'Scene Breakdown', 'Combat Encounter', 'Rewards Section', 'Complications Table', 'DM Notes']
);

-- ============================================
-- COMBAT ENCOUNTER COMPLETE LAYOUT
-- ============================================

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
  'Goblin Ambush - Complete Combat Encounter',
  'Full combat encounter with setup, enemy stat blocks, tactics, terrain, loot, and scaling options. Ready to drop into any session.',
  (SELECT id FROM snippet_categories WHERE name = 'Combat & Mechanics' LIMIT 1),
  ARRAY['combat', 'encounter', 'complete-layout', 'goblin', 'ambush'],
  E'# Combat Encounter: Goblin Ambush

<div class="encounter-header">

**Difficulty:** Medium (Level 2-3) | **Enemies:** 6 goblins, 1 goblin boss | **Environment:** Forest Road
**Expected Duration:** 20-30 minutes | **XP:** 550 total

</div>

---

## Encounter Setup

<div class="note2">

The party travels along a forested road when they notice signs of a recent struggle—overturned cart, scattered supplies, arrows stuck in trees. As they investigate, goblins hidden in the trees spring their ambush!

**Setup Clues (if players investigate):**
- Perception DC 12: Small footprints circling the cart
- Survival DC 11: Tracks lead into dense brush on both sides
- Investigation DC 14: Cart was emptied selectively—food and weapons taken, valuables ignored (suggests goblins)

**Surprise Round:** If passive Perception < 13, goblins get surprise round

</div>

---

## Enemy Stat Blocks

### Goblin Scout (6)
**AC** 13 (leather armor) | **HP** 7 (2d6) | **Speed** 30 ft.

| STR | DEX | CON | INT | WIS | CHA |
|-----|-----|-----|-----|-----|-----|
| 8 (-1) | 14 (+2) | 10 (+0) | 10 (+0) | 8 (-1) | 8 (-1) |

**Skills:** Stealth +6
**Senses:** Darkvision 60 ft., Passive Perception 9

**Abilities:**
- **Nimble Escape:** Bonus action to Disengage or Hide

**Actions:**
- **Shortbow:** +4 to hit, range 80/320, 1d6+2 piercing
- **Scimitar:** +4 to hit, reach 5 ft., 1d6+2 slashing

---

### Goblin Boss Grark (1)
**AC** 15 (leather armor + shield) | **HP** 21 (6d6) | **Speed** 30 ft.

| STR | DEX | CON | INT | WIS | CHA |
|-----|-----|-----|-----|-----|-----|
| 12 (+1) | 14 (+2) | 10 (+0) | 10 (+0) | 10 (+0) | 10 (+0) |

**Skills:** Stealth +6, Survival +2
**Senses:** Darkvision 60 ft., Passive Perception 10

**Abilities:**
- **Pack Tactics:** Advantage on attack if ally within 5 ft of target

**Actions:**
- **Multiattack:** Two attacks with scimitar
- **Scimitar:** +4 to hit, reach 5 ft., 1d6+2 slashing
- **Leadership (Recharge 5-6):** For 1 minute, allies get +1 to attack and damage rolls

---

## Battlefield & Tactics

<div class="note3">

### Terrain Features
- **Overturned Cart:** Half cover, can be climbed (5 ft. movement)
- **Dense Trees:** Three-quarters cover, difficult terrain
- **Hidden Pit Trap:** 15 ft. behind cart, camouflaged (Investigation DC 14), 10 ft. deep, 1d6 fall damage
- **Supply Crates:** Scattered around, can provide half cover

### Goblin Tactics

**Round 1-2:** Goblins shoot from tree cover, focusing on lightly armored targets. Boss uses Leadership.

**Round 3-4:** Two goblins attempt to flank, using Nimble Escape. Boss engages in melee if archer is harassing goblins.

**Round 5+:** If 3+ goblins die, survivors attempt to flee into forest. Boss fights to death to save face.

</div>

---

## Loot & Rewards

<div class="note2">

### Goblin Loot
- 23 gp, 47 sp, 89 cp (combined)
- 6 shortbows, 6 scimitars (serviceable)
- 2 potions of healing
- Crude map showing goblin lair (nearby cave)

### Cart Supplies (if recovered)
- 50 lbs. dried food (worth 5 gp)
- 3 barrels of ale (worth 12 gp total)
- Merchant''s ledger (can return for 25 gp reward)

</div>

---

## Scaling Options

**Easier (Level 1-2):**
- Remove 2 goblins
- Boss has 15 HP
- No surprise round

**Harder (Level 4-5):**
- Add 3 more goblins
- Add 1 goblin shaman (casts cure wounds on boss, knows burning hands)
- Boss has 35 HP and +1 scimitar
- Hidden wolf allies (2) join fight round 3

---

## Aftermath & Consequences

<div class="note3">

**If party wins:**
- Merchant from nearby town thanks them if supplies recovered
- Map leads to goblin lair (could be future session)
- Local guard offers 10 gp per goblin ear bounty

**If goblins win/retreat:**
- Goblins report to lair leader about "dangerous adventurers"
- Lair prepares defenses or moves location
- Road becomes more dangerous

**Complications:**
- Goblin captive can be interrogated (reveals lair location, recent increase in goblin activity)
- Cart belonged to ruthless merchant who demands "compensation" for damaged goods

</div>

---

## DM Notes

- This can serve as introduction to larger goblin threat
- Grark carries a love letter from a hobgoblin paramour (comic relief or plot hook)
- If goblins are fleeing, creative players might try to track/follow them
- Consider environmental storytelling: goblin graffiti, tribal symbols, recent campfire remains',
  '<div class="encounter-complete"><h1>Combat Encounter: Goblin Ambush</h1></div>',
  true,
  ARRAY['encounter-header', 'note2', 'note3'],
  'D&D 5e',
  true,
  'complete',
  'intermediate',
  ARRAY['Encounter Header', 'Setup Box', 'Clue System', 'Enemy Stat Blocks', 'Terrain Map', 'Tactical AI', 'Loot Table', 'Scaling Options', 'Aftermath Section']
);

-- ============================================
-- SESSION NOTES COMPLETE LAYOUT
-- ============================================

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
  'Session Notes Template - Complete Layout',
  'Comprehensive session tracking with recap, key events, NPC tracker, loot log, and next session planning. Perfect for DMs and players.',
  (SELECT id FROM snippet_categories WHERE name = 'Headers & Titles' LIMIT 1),
  ARRAY['session-notes', 'tracking', 'complete-layout', 'dm-tools', 'campaign'],
  E'# Campaign: [Campaign Name] - Session #X

<div class="session-header">

**Date:** October 29, 2025 | **In-Game Date:** 15th of Highsun
**Party Level:** 5 | **Location:** City of Waterdeep
**Session MVP:** [Player Name] - [Reason]

</div>

---

## Quick Recap

<div class="note2">

*Brief 2-3 sentence summary of what happened this session*

The party infiltrated the Thieves'' Guild hideout, negotiated with the mysterious "Fingers" McKeen, and discovered evidence of noble corruption. After a tense standoff, they recovered the stolen music box but now face a difficult choice about what to do with the evidence it contains.

</div>

---

## Key Events & Timeline

| Time | Event | Importance |
|------|-------|------------|
| 00:15 | Arrived at Broken Chalice tavern, met informant Rat | 🔵 Info |
| 00:45 | Discovered sewer entrance, fought Otyugh | ⚔️ Combat |
| 01:30 | Found Thieves'' Guild hall, negotiated with Fingers | 🔴 Major |
| 02:15 | Learned about The Collector, discovered evidence in music box | 🔴 Major |
| 02:45 | Tense standoff with guild, agreed to temporary truce | 🔵 Info |
| 03:00 | Returned to surface, debating next move | 🟡 Minor |

**Legend:** 🔴 Major Plot | 🔵 Information | 🟡 Minor Event | ⚔️ Combat | 💰 Loot

---

## NPCs Encountered

<div class="note3">

### New NPCs

| Name | Description | Attitude | Notes |
|------|-------------|----------|-------|
| Fingers McKeen | Thieves'' Guild leader, ex-adventurer | Wary → Helpful | Offered evidence against Lady Marissa. Has Robin Hood tendencies. |
| The Collector''s Agent | Mysterious robed figure, fey accent | Hostile | Left before party arrived. Seeking magical artifacts. Fey connection? |
| Rat | Street urchin, age 12, scrappy | Friendly | Paid 5 gp for info. Could be recurring contact. |

### Returning NPCs
- **Lady Marissa Blackwood:** Still waiting for music box return. Party hasn''t decided what to tell her.
- **Barnaby Thornhill:** Mentioned in passing, not present this session

</div>

---

## Character Moments & Development

<div class="note2">

**[Character 1 Name]:** Had excellent roleplay moment trying to convince Fingers peacefully. Used Persuasion with advantage, nat 20! Growing more confident as party face.

**[Character 2 Name]:** Clever use of Misty Step to bypass trap in sewers. Saved party 2d10 poison damage each.

**[Character 3 Name]:** Struggled with moral decision about evidence. Good character conflict between law (return evidence) and justice (expose corruption).

**[Character 4 Name]:** Comic relief MVP - tried to befriend the Otyugh by offering rations. Rolled Animal Handling nat 1, nearly got grabbed.

</div>

---

## Loot & Rewards Acquired

### Items
- [ ] *Music Box of Memory* (magical) - Currently held by [Character Name]
- [ ] Masterwork Thieves'' Tools (Fingers'' gift)
- [ ] 2x Potions of Healing
- [ ] Letter from The Collector (clue for future plot)

### Currency Gained
- **Gold:** 134 gp (split among party)
- **Gems:** 1x sapphire (50 gp value)

### Quest Progress
- "The Stolen Heirloom" - **95% complete** (need to decide what to do with box)
- Side Quest: "Rat''s Favor" - **Started** (Rat asked party to check on his missing friend)

---

## Combat Summary

<div class="note3">

### Encounter 1: Otyugh in Sewers
**Result:** Victory
**Duration:** 4 rounds
**Tactics:** Party focused fire, barbarian grappled tentacle
**Damage Dealt:** ~47 damage total
**Damage Taken:** 23 HP (mostly to barbarian)
**Resources Used:** 1 spell slot (2nd level), 1 rage, 1 potion of healing

### Encounter 2: None (avoided through negotiation)

</div>

---

## Decisions & Consequences

<div class="note2">

### Major Decision: What to do with the evidence?

**Option A - Return to Lady Marissa:** 500 gp reward, maintain noble relations, corrupt evidence hidden
**Option B - Give to City Guard:** 800 gp reward, justice served, make powerful enemy
**Option C - Keep it:** Gain magical item, make enemies of both factions, moral ambiguity
**Option D - Give to Fingers:** Money + guild favor, nobles angry, help common folk

**Party Vote (next session):** To be decided

### Minor Decisions
- ✅ Spared the Otyugh (fed it rations instead of killing)
- ✅ Paid Rat fairly for information (5 gp instead of 1 gp)
- ✅ Promised to help investigate Rat''s missing friend

</div>

---

## Next Session Prep

<div class="note3">

### Immediate Hooks
1. **Decide fate of music box** - Party needs to make decision at start of session
2. **Rat''s missing friend** - Young girl named "Sparrow" hasn''t been seen in 3 days
3. **The Collector''s interest** - Will send agents to retrieve music box
4. **Lady Marissa''s patience** - She''ll start getting suspicious if party delays

### Possible Encounters
- Meeting with Lady Marissa (social)
- City Guard questioning (if they involve authorities)
- The Collector''s agents attack (combat)
- Searching for Sparrow (investigation + possible combat)

### DM Prep Needed
- Stat blocks for The Collector''s agents (likely 2x Fey Knights)
- Map of Marissa''s manor for potential infiltration/meeting
- Info on Sparrow''s disappearance (tied to different quest line?)
- Consequences flowchart based on party decision

</div>

---

## DM Notes & Observations

**What Worked:**
- Players loved the moral ambiguity of the situation
- Negotiation with Fingers was tense and engaging
- Sewer crawl had good atmosphere

**What to Improve:**
- Otyugh combat was too easy, should have had more environmental hazards
- Need to tighten up NPC voice for Fingers (was inconsistent)
- Better lighting descriptions for sewers (players were confused about visibility)

**Player Feedback:**
- Loved the Robin Hood aspect of Fingers
- Want more time for roleplay between characters
- Request: More map handouts for complex locations

---

## Quotes of the Session

> "I''d like to roll to befriend the trash monster." - [Player Name]

> "So you''re telling me the noble is corrupt AND the thieves are heroes? My paladin oath is having a crisis." - [Player Name]

> "Does the Otyugh speak Common? Because I want to negotiate." - [Player Name] (spoiler: it does not)

---

## Homework & Follow-Up

- [ ] **DM:** Prepare The Collector encounter
- [ ] **DM:** Create Sparrow''s rescue mini-quest
- [ ] **Players:** Decide on music box fate before next session
- [ ] **[Player Name]:** Level up to level 6! (reached XP threshold)
- [ ] **All:** Fill out character bonds with Fingers/Rat if relevant',
  '<div class="session-notes-complete"><h1>Session Notes</h1></div>',
  true,
  ARRAY['session-header', 'note2', 'note3'],
  'Universal',
  true,
  'complete',
  'advanced',
  ARRAY['Session Header', 'Quick Recap', 'Timeline Table', 'NPC Tracker', 'Character Development', 'Loot Log', 'Combat Summary', 'Decision Tracker', 'Next Session Hooks', 'DM Notes', 'Quotes Section', 'Homework Checklist']
);

-- ============================================
-- SIMPLE COMPONENT SNIPPETS
-- ============================================

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
  'Simple Stat Block - NPC/Monster',
  'Basic stat block template for quick NPCs and monsters. Can be used standalone or as part of larger layouts.',
  (SELECT id FROM snippet_categories WHERE name = 'Combat & Mechanics' LIMIT 1),
  ARRAY['stats', 'npc', 'monster', 'component', 'quick'],
  E'### [Creature Name]
**AC** XX | **HP** XX | **Speed** XX ft.

| STR | DEX | CON | INT | WIS | CHA |
|-----|-----|-----|-----|-----|-----|
| XX (+X) | XX (+X) | XX (+X) | XX (+X) | XX (+X) | XX (+X) |

**Abilities:** [Special abilities]

**Actions:**
- **[Attack Name]:** +X to hit, Xd6+X damage',
  '<div class="stat-block"></div>',
  false,
  ARRAY[],
  'Universal',
  false,
  'single',
  'basic',
  ARRAY['Stat Block']
);

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
  'Info Box - Note Style 2',
  'Stylized info box for important information, using note2 CSS class. Works with medieval and fantasy themes.',
  (SELECT id FROM snippet_categories WHERE name = 'Note Boxes' LIMIT 1),
  ARRAY['note', 'info', 'component', 'styled'],
  E'<div class="note2">

## Important Information

Your text here. This creates a styled box perfect for highlighting key details, rules, or atmospheric descriptions.

</div>',
  '<div class="note2"><h2>Important Information</h2></div>',
  true,
  ARRAY['note2'],
  'Universal',
  false,
  'single',
  'basic',
  ARRAY['Info Box']
);

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
  'Simple Loot Table',
  'Quick loot table template for treasure drops. Can be customized for any encounter.',
  (SELECT id FROM snippet_categories WHERE name = 'Tables' LIMIT 1),
  ARRAY['loot', 'treasure', 'component', 'table'],
  E'## Loot

| Item | Value | Quantity |
|------|-------|----------|
| Gold Pieces | - | XXX gp |
| [Item Name] | XX gp | X |
| [Item Name] | XX gp | X |
| [Magic Item] | - | 1 |',
  '<table><thead><tr><th>Item</th></tr></thead></table>',
  false,
  ARRAY[],
  'Universal',
  false,
  'single',
  'basic',
  ARRAY['Loot Table']
);
