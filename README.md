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
* **Multiple instruments**: compile multiple songbooks, one for each instrument. Define which parts of the song will show up for every instrument (_e.g._ lyrics and chords) and which parts will show up for individual instruments (_e.g._ a solo).
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
---
The project name is a reference to [The Great American Songbook](https://en.wikipedia.org/wiki/Great_American_Songbook)
