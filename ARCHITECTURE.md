# SVPB Music Tools Process

## Tune Source

Tunes are written using ABC notation and committed to this GitHub repository.

## Update Notification

Checkins to GitHub trigger a webhook. This request is sent to a server at musictools.siliconvalleypipeband.org. This also triggers a message to the band's Slack service.

## Webhook Processing

The commit webhook triggers a message that gets read by a Perl CGI script. The script writes a trigger file to the filesystem on the server, with the commit details.

## Trigger Checking

The music tools server runs a job every five minutes to check for the existence of a trigger file. The script that runs will, if it finds a trigger file without a lock file:

  1. create a corresponding lock file
  2. pull the changes from GitHub into a local directory
  3. invoke `make` to, in turn
    1. invoke `abcm2ps` to convert the ABC tunes to PostScript
    2. invoke `ps2pdf` to convert the PostScript to PDF
    3. invoke a Perl script to generate PDF section headers
    4. invoke GhostScript to join the different PDF files into a single file
    5. invoke `rsync` to copy the generated PDF files to the band's Box folder
    6. send a message to the band Slack announcing the availability of updated music
  4. delete the trigger file and the lock file

## Periodic Heartbeat

The token used to perform the `rsync` copy to Box will expire if it is not used regularly. The token used to send messages to Slack will expire if it is not used regularly. During long stretches of the year, there are no changes to the music, so when this happens, it can be confusing and it takes a little while for a person to get to a point where they can log in to the build server and manually refresh everything. To avoid this confusion, there are periodic jobs that run once a week to refresh both of these tokens.
