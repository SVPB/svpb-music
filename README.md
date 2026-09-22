# SVPB Music

This project contains all the ABC source files for the band
sheet music. The Makefile will make the music binder and
individual tune and set PDF files. When adding a tune, make
sure to update the Makefile so it is included in the build.

# Current Build Chain


## Setting Up A New Year

1. create the new branch and push it to Github
2. log in to the build service by sending a DM to its Slack bot; the bot will reply with a login link.
3. Go to the "Binders" tab and select "Describe a binder"
4. Assemble the tunes into the list you want to see.
5. Click the "Generate YAML" button.
6. Select the generated YAML and copy it. Paste that into a file named `binders.yaml` in the root of the new branch.
7. Push the updated `binders.yaml` to GitHub.

# Process and Tools

Each year's tunes are stored in a corresponding branch: 2019 tunes are in the 2019 branch, 2020 tunes are in the 2020
branch, etc. When we start making decisions about the next year's tunes, we create a new branch for the next year from
the current year.

We save our tunes as ABC files. For details on ABC, refer to the [ABC standard](http://abcnotation.com/wiki/abc:standard:v2.2). Most graphical music programs understand ABC and can import it (e.g. [CelticPipes](https://www.celticpipes.net/), [MuseScore](https://musescore.org/en), &c) but since it is a text format and not binary, it compresses well and is much friendlier for revision control systems than their native binary formats. Also, since ABC is a text format, you don't need a particular application which may not be available on your platform - just edit the text.

## Applications

 * If you're on a macOS device, [ScoreEdit](https://www.coprosperitysphere.com/apps/ScoreEdit/) can edit ABC files and display a preview of how they will be rendered. It uses the same parsing and rendering engines as the build service.