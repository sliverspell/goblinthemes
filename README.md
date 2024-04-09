# GoblinThemes

Custom CSS themes for the Goblin Notebook, offering aesthetic enhancements across backgrounds, fonts, and markdown containers.

**Explore more**: [Goblin Notebook](https://www.the-goblin.net/notebook)

## Table of Contents

- [Introduction](#introduction)
- [Updates](#updates)
- [Contact and Suggestions](#contact-and-suggestions)
- [Supporting GoblinThemes](#supporting-goblinthemes)
- [ThemeHacks](#themehacks)
- [Using Themes](#using-themes)
- [Table Styles](#table-styles)
- [Note Styles](#note-styles)
- [Snippets](#snippets)
- [FAQ](#faq)

---

## Introduction

GoblinThemes offers a range of CSS modifications for the Goblin Notebook, including background and font changes.

## Updates

Stay tuned for new themes, hacks, and notes additions.

## Contact and Suggestions

For changes or add-on suggestions, reach out via Goblin's Notebook Discord or DM [@sliverspell](https://discord.com/channels/885441039538745374/channel-browser).

## Supporting GoblinThemes

To support my work, consider a donation through [Ko-Fi](https://ko-fi.com/sliverspell).
<iframe id='kofiframe' src='https://ko-fi.com/sliverspell/?hidefeed=true&widget=true&embed=true&preview=true' style='border:none;width:100%;padding:4px;background:#f9f9f9;' height='712' title='sliverspell'></iframe>

## ThemeHacks

Enhancements for text, images, columns, etc. Import with:

```css
@import url('https://cdn.jsdelivr.net/gh/sliverspell/goblinthemes/theme-hacks/layout.css');
@import url('https://cdn.jsdelivr.net/gh/sliverspell/goblinthemes/theme-hacks/responsive.css');
@import url('https://cdn.jsdelivr.net/gh/sliverspell/goblinthemes/theme-hacks/container.css');

# Using Themes
Themes can be utilized by subscribing on Patreon and editing CSS in settings. Import the desired stylesheet to apply a theme.

# Table Styles
Discover a variety of table styles:

medieval-table
neon-table
phb-table
cyberpunk-table
elegant-table
grey-table
horror-table
steampunk-table
space-table
underwater-table
enchanted-forest-table
digital-cybernetics-table
phbgreen-table
newspaper-table
desert-table
mothership-table
Styles and instructions available at Table Styles on GitHub.

### How do add and use a tablestyle?
First add this link on TOP in ANY note:
<link rel="stylesheet" href="https://sliverspell.github.io/goblinthemes/tablestyles/tables.css">

You can either use HTML tables divs or markdown tables.
There are different ways for both.
If you paste this inside a page where you have added the style, you can simply change the name of the class to those that are available.
Examples are then cahnge this
<table class="medieval-table">
to
<table class="elegant-table">
or
<table class="neon-table">
or 
any otther names that are on this github. Then you will see the style of the table changes automagically. ;)



**HTML TABLE EXAMPLE**
```
<div>
  <table class="medieval-table">
    <tr>
      <th>Planet</th>
      <th>Distance from Earth</th>
      <th>Exploration Status</th>
      <th>Dice</th>
    </tr>
    <tr>
      <td>Earth</td>
      <td>54.6 million km</td>
      <td>Ongoing Missions</td>
      <td>1D12</th>
    </tr>
    <tr>
      <td>Jupiter</td>
      <td>588 million km</td>
      <td>Planned Missions</td>
      <td>1D12</th>
    </tr>
      <td>Mars</td>
      <td>588 million km</td>
      <td>Planned Missions</td>
      <td>1D12</th>
 <tr>
       </tr>

  </table>
</div>

```

**MARKDWON TABLE EXAPMLE**

```
<div class="digital-cybernetics-table">

##### The Concierge

| Level | Proficiency Bonus | Features             | Hermetic Geography |
|:-----:|:-----------------:|:---------------------|:------------------:|
|  1st  |        +2         | Seismological Alchemy|         2          |
|  2nd  |        +2         | Torque Interfacer    |         2          |
|  3rd  |        +2         | Divinatory Mineralogy|         3          |
|  4th  |        +2         | Genetic Banishing    |         3          |
|  5th  |        +3         | Biochemical Sorcery  |         3          |
|  6th  |        +3         | Genetic Banishing    |         4          |
|  7th  |        +3         | Divinatory Mineralogy|         4          |
|  8th  |        +3         | Civil Divination     |         4          |
|  9th  |        +4         | Gunpowder Torturer   |         4          |


</div>

```


# Note Styles
Add styles to your notes:
Add this on TOP in ANY note:
<link rel="stylesheet" href="https://sliverspell.github.io/goblinthemes/notestyles/notes.css">

---
!NOTE This can sometimes take some time to update due to how CDN delivery works.
So sometimes when things are updated it can take a few minutes, but sometimes even hours, or up to a day. This depends on the worlds CDN servers.

There is also a few other tricks you can do here. Read the notes behind the code
```
.note2 {
    padding: 40px;
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
    background-image: url('https://i.pinimg.com/originals/11/b2/c0/11b2c0d0d3618b138dca11b32e40999d.png');
    background-color: transparent; /* Placeholder for no initial background color */
    color: rgba(0, 0, 0, 0); /* Fully transparent black as a placeholder */
    border-radius: 20px;
    border: 1px solid transparent;
    border-color: black; /* Keeping border color as black */
}

```
### Description of Border Styles
CSS borders have several style properties that determine the look of the border drawn around an element. Here are some of the most common border-style values:

solid: A single solid line.
dotted: A series of dots.
dashed: A series of short dashes.
double: Two solid lines. The sum of the two lines and the space between them equals the border-width value.
groove: Appears 3D, as though it were carved into the page (the effect depends on the border-color value).
ridge: The opposite of groove, giving the appearance of a 3D ridge around the page.
inset: Makes the box appear embedded in the page.
outset: The opposite of inset, making the box stand out from the page.
none: No border is drawn (this will override any border-width or border-color values).
hidden: Similar to none, but specifically used in table borders.

# Snippets

Inside goblin notebook you can add snippets.
Snippets are markdwon or html code that can be inserted into a notebook.
So if you have read all the above, you can make snippets for themes, tables, and notes.
Example:
If you make 1 snippet for each and call it, paste in the link into the snippet and save.
Style theme: <link rel="stylesheet" href="https://sliverspell.github.io/goblinthemes/themes/medieval.css"> , change then /medieval.css to any other theme
Style notes: look above for an example of code, then just change .note2. to .note3 and so on
Style tables: see examples in the markdwon table and html table above, and adjust as wanted


# FAQ
Regular updates and fixes are applied to all tables and styles.


