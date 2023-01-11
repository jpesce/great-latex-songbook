<p align="center">
  <a href="#">
    
  </a>
  <p align="center">
   <img src="https://user-images.githubusercontent.com/1228352/165809316-b4199537-bd0a-4225-929f-d1ff540c3b9f.jpg" alt="The Great LaTeX Songbook Mockup">
  </p>
  <h1 align="center"><b>The Great LaTeX Songbook</b></h1>
  <p align="center">
   Songbook generator powered by LaTeX
  </p>
</p>

The Great LaTeX Songbook is a template for generating songbooks in a modern layout with support for lyrics, chords, chord diagrams and tablatures. It features:
* **Multiple instruments**: compile multiple songbooks, one for each instrument. Define which parts of the song will show up for all instruments (_e.g._ lyrics and chords) and which parts will show up for individual instruments (_e.g._ a solo).
* **Lyrics and chords**: lyrics with section and chord changes via `leadsheets`
* **Chord diagrams**: chord diagrams via `guitarchordschemes`
* **Tablature and sheet music**: tablature and sheet music excerpts via `musixtex`

## Requirements
Requires LaTeX. On Mac OS:
```
brew install --cask mactex-no-gui
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
Recompile when files change (requires `fswatch` — `brew install fswatch`):
```
make watch
```
## Adding content
### Adding a song
Add a new `tex` file to `src/songs/`. Here’s Guided By Voices’ _You’re Not an Airplane_ as an example (see [leadsheets’ documentation](https://ctan.math.washington.edu/tex-archive/macros/latex/contrib/leadsheets/leadsheets_en.pdf) for the complete syntax):
```
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
```
\input{src/songs/your-new-song-file.tex}
```
<img width="600" alt="Guided by Voice's You're Not and Airplane chords" src="https://user-images.githubusercontent.com/1228352/171166993-42e591df-f8c2-4b97-8316-19167dc22f5f.png">

### Adding chord diagrams
Chord diagrams are drawings that usually appear before the lyrics and show chord fingerings for a specific instrument.

Chord libraries for each instrument are located in `src/chords/chords-instrument-name.tex`. See [guitarchordschemes’ documentation](http://mirrors.ctan.org/macros/latex/contrib/guitarchordschemes/guitarchordschemes_en.pdf) for the complete syntax.

After defining the chord names, simply add them at the beggining of the song:
```
\gchord
\cchord
\cbbasschord
```

<img width="130" alt="Chord diagrams for G C and C/B" src="https://user-images.githubusercontent.com/1228352/171168367-41b7313e-af6b-4c6a-b453-2e83394fcd6f.png">

---
The project name is a reference to [The Great American Songbook](https://en.wikipedia.org/wiki/Great_American_Songbook)
