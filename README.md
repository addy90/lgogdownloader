# lgogdownloader
Dockerfile for **lgogdownloader** with **Unraid**.

Download in **Unraid** via **Apps** (**Community Applications**). Click on the link "Click Here To Get More Results From DockerHub" on the right side after searching for finding this app.

Set the paths and following options: \
`cache` set to `/mnt/user/appdata/lgogdownloader/cache/` \
`config` set to `/mnt/user/appdata/lgogdownloader/config/` \
`downloads` set to `/mnt/user/GOG/` (create share in advance)\
Set `Extra Parameters` to: `-it` and `Console shell command` to `Bash`. 

Log into docker container via SSH shell `docker attach lgogdownloader` on Unraid \
or via Web-Terminal from Unraid Web-UI.
#### On first start:

Login to GOG via: \
`lgogdownloader --login`

**Important**: Set download folder with this command: \
`lgogdownloader --directory=/home/user/downloads --save-config`

You can set more options, for example see the following command: \
`lgogdownloader --language=de,en --platform=all --save-serials --threads 10 --info-threads 10 --save-config`

See `lgogdownloader --help` for more information on this.

Now you can download your catalogue via `lgogdownloader --download` 

*Tip*: Delete unnecessary old files via `lgogdownloader --check-orphans | xargs -i rm "{}"`. 
