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

To support my work, consider a donation through
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/N4N8IAAPM)


## ThemeHacks

Enhancements for text, images, columns, etc. 
These can be added into the CSS 
settings, css, edit and add the links:

```
@import url('https://cdn.jsdelivr.net/gh/sliverspell/goblinthemes/theme-hacks/layout.css');
@import url('https://cdn.jsdelivr.net/gh/sliverspell/goblinthemes/theme-hacks/responsive.css');
@import url('https://cdn.jsdelivr.net/gh/sliverspell/goblinthemes/theme-hacks/container.css');
```

You can also add all hacks into the CSS of goblin notebook, and just refer to the in div styles, covered later in this tutorial.
Make sure you read the read me text under inside the themehacks also:

# Using Themes
Themes can be utilized by adding a theme stylesheet from this github.
So first just add this link into any page:

```
<link rel="stylesheet" href="https://sliverspell.github.io/goblinthemes/themes/medieval.css">

```
you can then change to any theme I have in here by simply changing its name /themes/neon.css
Like this

```
<link rel="stylesheet" href="https://sliverspell.github.io/goblinthemes/themes/neon.css">

```
This will instantly change the theme
To make it even easier you can add this link as a snippet:
Then when you are on any page you can just add the snippet, and change to the theme you want.

https://github.com/sliverspell/goblinthemes/assets/10817448/3822cae2-056c-429d-8609-b3c2bed99769


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



https://github.com/sliverspell/goblinthemes/assets/10817448/8eebf525-72cd-4f4a-a40b-5140f4b9874d



You can either use HTML tables divs or markdown tables.
There are different ways for both.
If you paste this inside a page , you can simply change the name of the class to those tables that are available.
Examples of this are.

<table class="medieval-table">
to
<table class="elegant-table">
or
<table class="neon-table">
or any otther names that are on this github. Then you will see the style of the table changes automagically. ;)

(ps! in the futire I will also add snippets to "code" your own style the easy way.
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

```
<link rel="stylesheet" href="https://sliverspell.github.io/goblinthemes/notestyles/notes.css">
```
---
Or use CDN
```
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/sliverspell/goblinthemes@main/notestyles/notes.css
```
!NOTE This can sometimes take some time to update due to how CDN delivery works.
So sometimes when things are updated it can take a few minutes, but sometimes even hours, or up to a day. This depends on the worlds CDN servers.

There is also a few other tricks you can do here. Read the notes behind the code.
Add shit code as an example:
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


https://github.com/sliverspell/goblinthemes/assets/10817448/87837de4-2f63-4120-9fd0-9472a302cd56



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
Style theme: 
```
<link rel="stylesheet" href="https://sliverspell.github.io/goblinthemes/themes/medieval.css"> 
```
change then /medieval.css to any other theme
Style notes: look above for an example of code, then just change .note2. to .note3 and so on
Style tables: see examples in the markdown table and html table above, and adjust as wanted


# FAQ
Regular updates and fixes are applied to all tables and styles.


