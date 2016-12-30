# Files
`omxplayerRemote.py` allows for remote control of omxplayer via a webpage/ajax, and then the video is overlaid on the webpage.

# How to use `omxplayerRemote.py`

```
curl -XPOST http://127.0.0.1:8080/ -d '{
  "url":"http://cdn.media.ccc.de/congress/2016/h264-hd/33c3-8151-eng-deu-fra-Dissecting_modern_3G_4G_cellular_modems_hd.mp4",
  "size":"10,10,1910,1070"
}'
```
