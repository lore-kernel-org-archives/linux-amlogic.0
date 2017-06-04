From: crow@linux.org.ba (crow)
Date: Sun, 4 Jun 2017 18:07:49 +0200
Subject: call trace on Khadas VIM Pro with AP6255 WiFi
Message-ID: <CAG_g8w5jOx7y12WBy2Yx6eesEa=8ktpPDOAOSZAHwdud+cetkg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,
Posting to list as requested. I get call trace when using WiFi on
Khadas VIM Pro, which comes with an AP6255. Firstly i wrote about this
directly to Martin Blumenstingl, and he pointed me to post here.
This looks like a bug in the meson-gx-mmc.c (SD/SDIO/eMMC) driver [1].
Martin last successful test was with kernel 2.11.

How to reproduce this:
mainline kernel 4.12.0-rc3 (using ArchLinuxARM arm8v generic rootfs)
Khadas VIM Pro nvram file [2]
Enable WiFI (connected to 5GHZ AP)
just do an SSH to Khadas VIM Pro device and you will get these call
trace [3] , eventually you get login prompt but it is very slow login.

[1] https://github.com/torvalds/linux/commits/master/drivers/mmc/host/meson-gx-mmc.c
[2] https://github.com/khadas/android_hardware_amlogic_wifi/tree/Vim/bcm_ampak/config/6255
[3] https://defuse.ca/b/7htlAdOO
