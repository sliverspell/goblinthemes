# What is goblinthemes?
Goblin themes are my CSS theme style modifications for the awesome goblin notebook
https://www.the-goblin.net/notebook

## What will change with the CSS themes? 
Some themes change the background and font on both main page, as well as container for markdown. Some change more than others

### Will there be any updates?
Oh yes, we are constantly adding new themes, new hacks, new tables and new notes.

#### Can I suggest changes or sugest addons? and how can I contact you?
For sure, you can hit me up at discord in the goblins notebook discord, or DM me @sliverspell

## How can I support your work?
If you find my work of use, and you want to support me, simply donate here.
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/N4N8IAAPM)

### What are themehacks and how can I import it?
Themehacks makes different changes on default theme, and it adds different improvements on how text, iamges, columns, wrap text around pictures and so on works. That means when you add pictures it makes it possible to wrap text.
You can add these into your CSS
Go to settings
Allow custom CSS
Edit CSS
Add the follwoing lines:
@import url('https://cdn.jsdelivr.net/gh/sliverspell/goblinthemes/theme-hacks/layout.css');
@import url('https://cdn.jsdelivr.net/gh/sliverspell/goblinthemes/theme-hacks/responsive.css');
@import url('https://cdn.jsdelivr.net/gh/sliverspell/goblinthemes/theme-hacks/container.css');

!NOTE This can sometimes take some time to update due to how CDN delivery works.
So sometimes when things are updated it can take a few minutes, but sometimes even hours, or up to a day. This depends on the worlds CDN servers.

### Where can I find the themes
In my githib under goblinthemes
Inside themes there are several css files. Each have a nameofthetheme.css infront.

### Do I have to know CSS to use this?
Noop not at all, all you need todo is to import what is called a stylesheet into your container.
You can paste this code inside any page:
<link rel="stylesheet" href="https://sliverspell.github.io/goblinthemes/themes/medieval.css">
If you want to change theme, simply change the name of the theme. 
Like this, this now uses the mothership css styles.
<link rel="stylesheet" href="https://sliverspell.github.io/goblinthemes/themes/mothership.css">

## How can I use it?
You need to subscribe on the patreon to be able to edit the CSS. And I highly suggest that you do.
When you do you can then go to edit css in the settings and add the CSS.

## Can I use it other ways?
Hmm well yes, you can actually add different themes directly inside the markdwon container box on any object.
I would suggest you make a snippet inside goblin themes.
Then add one stylesheet for themes, and one for tables

## What are table hacks?
I also made lots of different tables.
You can import these styles in any page by using this link:
<link rel="stylesheet" href="https://sliverspell.github.io/goblinthemes/tablestyles/tables.css">

### How do add and use a tablestyle?
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


/*CODE*/
**HTML TABLE EXAMPLE**
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
/*CODE*/


**MARKDWON TABLE EXAPMLE**

/*CODE*/
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

/*CODE*/

## What is notes hacks?
In markdwon we have the quote
> Which is shown like this 

But I have taken this way further. You can now add different styles for notes.
You can import these styles into any goblin notebook by simply pasting this into your note:
<link rel="stylesheet" href="https://sliverspell.github.io/goblinthemes/notestyles/notes.css">

You can also override it inside the edit, so you can change borders, colors, gradients and so on.
But the main styles is changed easily just changing the number behind the note.

So as an example, this is note2
/* Styles for .note2 */
.note2 {
    padding: 40px;
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
    background-image: url('https://i.pinimg.com/originals/11/b2/c0/11b2c0d0d3618b138dca11b32e40999d.png');
    border-radius: 20px;
    border: 1px solid transparent;
}



