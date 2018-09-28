# lgogdownloader
Dockerfile for lgogdownloader with Unraid.

Put the `my-lgogdownloader.xml` template on Unraid into `/boot/config/plugins/dockerMan/templates-user/`.
Select the paths where to store cache and login information.

Log into docker container via SSH shell `docker attach lgogdownloader` on Unraid or via Web-Terminal.
Change into right permission context via `su user`.
Login to GOG via `lgogdownloader --login`

**Important**: Set download folder `lgogdownloader --directory=/home/user/downloads --save-config`

Now you can download your catalogue via `lgogdownloader --download`.
