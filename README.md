# lgogdownloader

Dockerfile for **[lgogdownloader](https://github.com/Sude-/lgogdownloader)** with **Unraid**.

Download in **Unraid** via **Apps** (**Community Applications**).

1. Search for: `lgogdownloader`.
2. Click on the `DockerHub` button right next to the search field.
3. Click on the `Install` button on the `lgogdownloader` app from `addy90`.
4. Create a share `GOG` in **Unraid**.
5. Set the paths and following options: \
   `cache` set to `/mnt/user/appdata/lgogdownloader/cache/` \
   `config` set to `/mnt/user/appdata/lgogdownloader/config/` \
   `downloads` set to `/mnt/user/GOG/` (which is the share created in step 4)
6. Set `Extra Parameters` to: `-it`.
7. Set `Console shell command` to `Bash`.

After starting the Docker container, you can access it via SSH shell `docker attach lgogdownloader` from a terminal,
or via `Console` button in the Unraid Web-UI.

#### On first start:

1. Login to GOG via: \
   `lgogdownloader --login`
2. **Very Important**:\
   Set download folder with this command: \
   `lgogdownloader --directory=/home/user/downloads --save-config`
3. Now you can set more options, for example, see the following command: \
   `lgogdownloader --language=de,en --platform=w+l --save-serials --info-threads 10 --threads 4 --save-config`

See `lgogdownloader --help` or `man lgogdownloader` for more information.

#### From now on:

1. You can download your catalogue via: \
   `lgogdownloader --download`
2. You can list old obsolete files via: \
   `lgogdownloader --check-orphans`
3. You can remove old obsolete files via: \
   `lgogdownloader --check-orphans --delete-orphans`

#### Tips and tricks with a catalogue cache:

1. You can create/update a cache that is valid for a certain time (by default 48 hours) via: \
   `lgogdownloader --update-cache` \
   and you can use it while it is valid by adding `--use-cache` to other commands.\
   The cache makes repeated calls to listing the catalogue much faster.
2. For example, you can download your catalogue after having created/updated the cache via: \
   `lgogdownloader --use-cache --download`
3. You can check for orphaned files via: \
   `lgogdownloader --use-cache --check-orphans`
4. And you can delete orphaned files via: \
   `lgogdownloader --use-cache --check-orphans --delete-orphans`
