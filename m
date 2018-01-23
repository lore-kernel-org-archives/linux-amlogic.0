From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Tue, 23 Jan 2018 17:12:43 +0100
Subject: eMMC errors on Khadas VIM2
Message-ID: <CAFBinCCfHZy+VpdAduBOtwPhM3==Vvmn_wDruHfk5G4aMxAu1Q@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hello,

I've been observing the following error on my Khadas VIM2 (with 16GiB eMMC):
[    4.829411] mmc1: mmc_select_hs400 failed, error -84
[    4.829444] mmc1: error -84 whilst initialising MMC card

removing the "mmc-hs400-1_8v" property from the sd_emmc_c node results in:
[    4.710491] mmc1: new HS200 MMC card at address 0001
[    4.710844] mmcblk1: mmc1:0001 AJNB4R 14.6 GiB
[    4.714424] mmcblk1boot0: mmc1:0001 AJNB4R partition 1 4.00 MiB
[    4.720272] mmcblk1boot1: mmc1:0001 AJNB4R partition 2 4.00 MiB
[    4.726176] mmcblk1rpmb: mmc1:0001 AJNB4R partition 3 4.00 MiB,
chardev (240:0)
...
# dd if=/dev/mmcblk1 | sha1sum
30535680+0 records in
30535680+0 records out
912b9d765a0ffee2711f65f2bbbdc2bc7544e52c  -
15634268160 bytes (16 GB, 15 GiB) copied, 205.13 s, 76.2 MB/s
(no CRC errors are shown in the kernel log)

since I was curious I added the "mmc-hs400-1_8v" property back and
added "mmc-hs400-enhanced-strobe" to the sd_emmc_c node, which results
in:
[    4.227948] mmc1: new HS400 Enhanced strobe MMC card at address 0001
[    4.230284] mmcblk1: mmc1:0001 AJNB4R 14.6 GiB
[    4.254733] mmcblk1boot0: mmc1:0001 AJNB4R partition 1 4.00 MiB
[    4.260559] mmcblk1boot1: mmc1:0001 AJNB4R partition 2 4.00 MiB
[    4.407234] mmcblk1rpmb: mmc1:0001 AJNB4R partition 3 4.00 MiB,
chardev (240:0)
...
# cat /sys/kernel/debug/mmc1/ios
clock:          200000000 Hz
actual clock:   166666667 Hz
vdd:            21 (3.3 ~ 3.4 V)
bus mode:       2 (push-pull)
chip select:    0 (don't care)
power mode:     2 (on)
bus width:      3 (8 bits)
timing spec:    10 (mmc HS400 enhanced strobe)
signal voltage: 1 (1.80 V)
driver type:    0 (driver type B)
# dd if=/dev/mmcblk1 | sha1sum
30535680+0 records in
30535680+0 records out
912b9d765a0ffee2711f65f2bbbdc2bc7544e52c  -
15634268160 bytes (16 GB, 15 GiB) copied, 203.118 s, 77.0 MB/s
(no CRC errors are shown in the kernel log)

@Jerome: is this something you have seen before?


Regards
Martin
