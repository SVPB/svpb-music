# SVPB Music Tools Process

## Tune Source

Tunes are written using ABC notation and committed to this GitHub repository.

## Update Notification

Checkins to GitHub trigger a webhook. This request is sent to a server at tng.siliconvalleypipeband.org.

## Webhook Processing

The server that receives the webhook is an instance of
the next generation music binder service [TNG](https://github.com/SVPB/svpb-tools). That server builds the binder(s) and uploads them to Box. At this point, the
service sends a message to Slack to notify the band that there's a newly built collection of sheet music.
