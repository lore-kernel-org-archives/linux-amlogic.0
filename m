From: balbes-150@yandex.ru (Oleg)
Date: Sun, 14 May 2017 21:22:00 +0300
Subject: [ANN] meson-tools v0.1 released
In-Reply-To: <e407fbad-19b0-3691-2c76-e39abe0581f5@suse.de>
References: <e520f7e9-5d8a-3c50-5430-45a38f98ea5e@suse.de>
 <06c1fd56-9bfa-ea93-6c64-94a374567b93@yandex.ru>
 <e407fbad-19b0-3691-2c76-e39abe0581f5@suse.de>
Message-ID: <2a1f408e-9cb6-da5b-479b-0b0c9db03aeb@yandex.ru>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org


> Please see the README.md at the above link. :)
>
> amlbootsig has been tested with Odroid-C2 and by now NanoPi-K2, so it's
> not limited to the Odroid-C2. However it won't work with "all" devices,
> as my tool has less features (no encryption support) and may have bugs
> for lack of a public description of the format.
>
> As recently explained to someone with an S912 TV Box, feedback on
> whether it produces the expected results for other devices as well is
> appreciated. Some safety precautions were described in that mail:
>
> http://lists.infradead.org/pipermail/linux-amlogic/2017-May/003433.html
>
> Regards,
> Andreas
>
> P.S. If you have comments or questions, please keep me CC'ed so that I
> notice. Thanks.
>
You are interested in testing the possibility of launching S912 (s905x)
using independently collected (from source) variants of u-boot ?
I have a Tronsmart s912 with a connected UART.
I checked on it the start-up of harvested from sources u-boot.
After making not much changes to the source code of u-boot from Khadas 
VIM ,
the resulting file u-boot.bin.sd.bin normally runs from SD card
(and allows you to start the system from removable media).
Before a test I made a full backup of the eMMC
and additionally copied the first 4 MB of eMMC (which contains a regular 
u-boot).
You can write, what should I check ?
