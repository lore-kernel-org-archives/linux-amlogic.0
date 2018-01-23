From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Wed, 24 Jan 2018 00:35:47 +0100
Subject: eMMC errors on Khadas VIM2
In-Reply-To: <1516731908.7870.85.camel@baylibre.com>
References: <CAFBinCCfHZy+VpdAduBOtwPhM3==Vvmn_wDruHfk5G4aMxAu1Q@mail.gmail.com>
 <1516731908.7870.85.camel@baylibre.com>
Message-ID: <CAFBinCALC=OqtihBXeqS194JH6xLbrn=WrURHMj2J1a-Mdaozw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Jerome,

On Tue, Jan 23, 2018 at 7:25 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> On Tue, 2018-01-23 at 17:12 +0100, Martin Blumenstingl wrote:
>> Hello,
>>
>> I've been observing the following error on my Khadas VIM2 (with 16GiB eMMC):
>> [    4.829411] mmc1: mmc_select_hs400 failed, error -84
>> [    4.829444] mmc1: error -84 whilst initialising MMC card
>
> I remember testing this quickly on the vim2 I have, but that was before we added
> tx phase tunning.
>
> I had a quick try and kvim2 indeed miserably fail on kevin's integ branch
>
> I reverted 0a44697627d1, and it seems to be back to normal
>
> I never really liked this tweak and amlogic mentioned to us that we should
> probably not tune this and keep the default value ...
do you have any other board which has an HS400 eMMC?

>>
>> removing the "mmc-hs400-1_8v" property from the sd_emmc_c node results in:
>> [    4.710491] mmc1: new HS200 MMC card at address 0001
>> [    4.710844] mmcblk1: mmc1:0001 AJNB4R 14.6 GiB
>> [    4.714424] mmcblk1boot0: mmc1:0001 AJNB4R partition 1 4.00 MiB
>> [    4.720272] mmcblk1boot1: mmc1:0001 AJNB4R partition 2 4.00 MiB
>> [    4.726176] mmcblk1rpmb: mmc1:0001 AJNB4R partition 3 4.00 MiB,
>> chardev (240:0)
>
> The input frequency of the controller is lower in hs200 (200Mhz vs 333Mhz)
ah, I see - thanks for the explanation!

>> ...
>> # dd if=/dev/mmcblk1 | sha1sum
>> 30535680+0 records in
>> 30535680+0 records out
>> 912b9d765a0ffee2711f65f2bbbdc2bc7544e52c  -
>> 15634268160 bytes (16 GB, 15 GiB) copied, 205.13 s, 76.2 MB/s
>> (no CRC errors are shown in the kernel log)
>>
>> since I was curious I added the "mmc-hs400-1_8v" property back and
>> added "mmc-hs400-enhanced-strobe" to the sd_emmc_c node, which results
>> in:
>> [    4.227948] mmc1: new HS400 Enhanced strobe MMC card at address 0001
>> [    4.230284] mmcblk1: mmc1:0001 AJNB4R 14.6 GiB
>> [    4.254733] mmcblk1boot0: mmc1:0001 AJNB4R partition 1 4.00 MiB
>> [    4.260559] mmcblk1boot1: mmc1:0001 AJNB4R partition 2 4.00 MiB
>> [    4.407234] mmcblk1rpmb: mmc1:0001 AJNB4R partition 3 4.00 MiB,
>> chardev (240:0)
>
> Weird ! If I understand the code correctly, adding this caps should only trigger
> the related "enhance-strobe" callback ... but meson-gx-mmc does not implement it
> , so this should have no effect
indeed, I just checked the code and it *should* not have any effect
have you tested this on your VIM2 - I did multiple reboots (and
hardware resets) with that flag and it seems to "fix" it for me (I'd
like to rule out that this is a fluke though!)


Regards
Martin
