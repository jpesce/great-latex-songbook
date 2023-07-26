<p align="center">
  <p align="center">
   <img src="https://user-images.githubusercontent.com/1228352/165809316-b4199537-bd0a-4225-929f-d1ff540c3b9f.jpg" alt="The Great LaTeX Songbook Mockup">
  </p>
  <h1 align="center"><b>The Great LaTeX Songbook</b></h1>
  <p align="center">
   Songbook generator powered by LaTeX
  </p>
</p>

The Great LaTeX Songbook is a template for generating songbooks in a modern layout with support for lyrics, chords, chord diagrams and tablatures. It features:
* **Multiple instruments**: compile multiple songbooks, one for each instrument. Define which parts of the song will show up for all instruments (_e.g._ lyrics and chords) and which parts will show up only for individual instruments (_e.g._ a solo).
* **Lyrics and chords**: lyrics with section and chord changes via `leadsheets`
* **Chord diagrams**: chord diagrams via `guitarchordschemes`
* **Tablature and sheet music**: tablature and sheet music excerpts via `musixtex`

## Requirements
Requires LaTeX. On Mac OS (using [brew](https://brew.sh/)):
```
brew install --cask mactex-no-gui
```
Also requires `fswatch` if you want to keep watching and recompiling files:
```
brew install fswatch
```
## Installation
Clone the repo:
```
git clone git@github.com:jpesce/great-latex-songbook.git
```
## Usage
Generate PDFs for all instruments and clean up:
```
make all
```
Generate PDF for one instrument (_e.g._ ukulele):
```
make instrument-ukulele
```
Recompile when files change (requires `fswatch`):
```
make watch
```

## Adding content
### Adding a song
Add a new `tex` file to `src/songs/`. Here’s Guided By Voices’ _You’re Not an Airplane_ as an example (see [leadsheets’ documentation](https://ctan.math.washington.edu/tex-archive/macros/latex/contrib/leadsheets/leadsheets_en.pdf) for the complete syntax):
```latex
\begin{song}{
  title=You're Not an Airplane,
  band=Guided by Voices,
  composer=Tobin Sprout
}

\begin{intro}
  \writechord{E} \writechord{D} \writechord{A}
\end{intro}

\begin{verse}
  Well, ^{A}come on now and see the course that ^{Asus}never fields the game of choice\\
  and ^{A}cold allies of steel couldn't ^{Asus}buy the way it feels\\
  ^{E}Rusty and divided steel the ^{D}race is yet to ^{A}come
\end{verse}

\end{song}
\newpage
```
Then add it to `src/songs.tex` in your position of choice
```latex
\input{src/songs/your-new-song-file.tex}
```
<img width="600" alt="Guided by Voice's You're Not and Airplane chords" src="https://user-images.githubusercontent.com/1228352/171166993-42e591df-f8c2-4b97-8316-19167dc22f5f.png">

### Adding tablature and sheet music
To add a notation section, use MusiXTeX. Here’s The Beatles’ _Two of Us_ intro on ukulele
(see the complete syntax on [MusiXTeX’s documentation](https://linorg.usp.br/CTAN/macros/musixtex/doc/musixdoc.pdf)):
```latex
\begin{music}
  \setlines14
  \setstaffs1{1}
  \setclefsymbol1{\tabclef}
  \nobarnumbers
  \let\extractline\leftline
  \startextract
    \Notes \tab{3}{2} \tab{1}{2} \tab{3}{2} \tab{1}{2} \en
    \bar
    \Notes \tab{3}{2} \tab{1}{2} \tab{3}{2} \tab{2}{0} \en
  \endextract
\end{music}
```
<img width="346" alt="intro" src="https://github.com/jpesce/great-latex-songbook/assets/1228352/a179c5e3-8396-4a10-be92-4ef2a401f811">


### Conditional sections
Some parts may only be relevant to certain instruments. For example, the intro [shown before](#adding-tablature-and-sheet-music)
is tabbed specifically for ukulele. To make it appear only on the ukulele songbook use the following command:
```latex
\ifx\instrument\ukulele
  % Ukulele-specific part
\fi
```

### Adding chord diagrams
Chord diagrams are drawings that usually appear before the lyrics and show chord fingerings for a specific instrument.

Chord definitions for each instrument are located in `src/chords/chords-instrument-name.tex`. See [guitarchordschemes’ documentation](http://mirrors.ctan.org/macros/latex/contrib/guitarchordschemes/guitarchordschemes_en.pdf) for the complete syntax.

After defining the chord names, simply add them at the beggining of the song:
```latex
\gchord
\cchord
\cbbasschord
```

<img width="130" alt="Chord diagrams for G C and C/B" src="https://user-images.githubusercontent.com/1228352/171168367-41b7313e-af6b-4c6a-b453-2e83394fcd6f.png">

**Note:** Make sure all chord names are defined for all instruments or create a [conditional section](#conditional-sections) if the chord name is only defined for a certain instrument.

## Adding new instruments
Add an entry in `src/instruments-available.tex`:
```diff
  \def\newinstrument{ukulele}
+ \def\newinstrument{newinstrument}
```

Create a chords definition file for the new instrument at `src/chords/chords-newinstrument.tex`. Remember to wrap it with a [conditional section](#conditional-sections):
```latex
\ifx\instrument\newinstrument
  % Here be chords
\fi
```

Include the new chord definition file in `src/songbook.tex`
```diff
  \input{src/chords/chords-ukulele.tex}
+ \input{src/chords/chords-newinstrument.tex}
```

Add a command to `makefile`’s `all` target:
```diff
  all: $(INPUT_PATH)
+   make instrument-newinstrument
    make instrument-ukulele
    make instrument-generic
```

---
The project name is a reference to [The Great American Songbook](https://en.wikipedia.org/wiki/Great_American_Songbook)
