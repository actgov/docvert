#!/usr/bin/env bash
/usr/bin/soffice --headless --norestore --nologo --norestore --nofirststartwizard --accept="socket,port=2002;urp;" &
cd docvert
sudo python ./docvert-web.py --host 0.0.0.0 -p 80

