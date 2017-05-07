From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 7 May 2017 20:59:46 +0200
Subject: Testing.
In-Reply-To: <e7eb7d12-8fa8-5507-5d7b-53ef9ce3e300@yandex.ru>
References: <ae3d52d1-1eab-61e3-5943-21761d28d214@yandex.ru>
 <CAFBinCBHWSt36ApkFPYKyF=oOBebWwkK8D3Pa27Ab-KsM+B0_Q@mail.gmail.com>
 <aed4bf63-cba2-cc63-d834-d0acf3da35d3@yandex.ru>
 <CAFBinCDC9XwDa1NNiKQKp49GJ-WazS_iZFKkV4TAYo9ZnhPBcg@mail.gmail.com>
 <e7eb7d12-8fa8-5507-5d7b-53ef9ce3e300@yandex.ru>
Message-ID: <CAFBinCDk+fFhTd=wx2k7mzr4Xh8NPQ15TTh+edbSdgtfLRwOEw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Oleg,

On Sun, May 7, 2017 at 8:36 PM, Oleg <balbes-150@yandex.ru> wrote:
>
> Hi Oleg,
>
> On Sun, May 7, 2017 at 7:36 PM, Oleg <balbes-150@yandex.ru> wrote:
>
> On Tue, May 2, 2017 at 8:37 AM, Oleg <balbes-150@yandex.ru> wrote:
>
> Hi
> I want to help the platform support Amlogic (S8xx\S9xxx) on the new
> kernel.
> I have a few different model boards with the Amlogic S8xx\S9xxx with a
> connected console UART \ SSH.
> I can help with testing variants of the kernel on these boards.
> In what form can I help the project ?
>
> I am currently trying to improve support for the older (32-bit) Meson
> SoCs.
> Unfortunately I only have a device with S812 (Meson8m2) - do you have
> any boards with Meson8 (S802) or Meson8b (S805) SoC? we could team up
> and add mainline support for your boards
>
> current status on my Meson8m2 device is:
> - USB works (I only tested host mode)
> - SD card can be read and written
> - ethernet (my device has 10/100Mbit/s only) works
>
>
> Regards,
> Martin
>
> Hi Martin.
>
> I have a TV box S812 MXIII_Plus (2\16 eMMC), and the 2 model S805 (1\8
> NAND). I know there are several users with different models s802 s805 s812
> who are willing to participate in testing. Today I tried to use Your kernel
> (branch meson-mx integration-4.12-20170506-5) to build a test image Armbian
> (Ubuntu server). The kernel runs, but the system fully not starts, stops
> without error message. I think this is due to the fact that I use dtb data
> that is not priznachena for my model s812.
>
> is the .dtb (or .dts) of your device available in your github repo [0]?
> also please note that you need to change the bootargs in u-boot before
> you can boot a mainline kernel (see also [1]): setenv bootargs
> "console=ttyAML0,115200" (without this your serial console won't work)
>
>
> Regards,
> Martin
>
> [0] https://github.com/150balbes/Amlogic_s905
> [1] http://linux-meson.com/doku.php?id=start#bit_socs_meson8b_s805_or_older
>
>
> I use the kernel 3.14.29 these dts .
> For my model s812
>
> meson8m2_n200_2G_1000.dts
>
> https://github.com/150balbes/Amlogic_s8xx-kernel/tree/S812/arch/arm/boot/dts
>
>
> and s805   2 models.
>
> meson8b_i5.dts
> meson8b_hd180.dts
>
> https://github.com/150balbes/Amlogic_s8xx-kernel/tree/S805/arch/arm/boot/dts
>
> This is the source test file, which is obtained when compiling the
> executable script s805_autoscript (used in multi-boot mode), which sets the
> required variables and performs the automatic startup of the system from
> removable media when testing. Internal firmware remains unchanged, this
> allows any non-trained user with no risk to test any system.
>
> boot-vegas812_AM.cmd
>
> https://github.com/150balbes/lib/tree/master/config/bootscripts
OK, I see - thanks for the details!

>
> Perhaps You will be more clear what is happening on the logs from the
> console UART while trying to start at s812 and s805.
OK, there are two different "problems", see below

> https://yadi.sk/i/rhJQe_qi3HpNQr
I forgot a patch which enables CONFIG_MMC_MESON_MX_SDIO on the
multi_v7_defconfig. I just pushed an update: [0] (but you can simply
enable that symbol in your .config - just make sure you set it to =y).
same with the USB2 PHY driver (CONFIG_PHY_MESON8B_USB2)

> https://yadi.sk/i/czHlGCyt3HpNQD
I only enabled SD/USB/etc. for the M8S board, so additional patches
are needed for other boards.

PS: I've just seen that you sent some mails as HTML-mails.
the mailing list rejects these - please always send plain-text mails!


Regards,
Martin


[0] https://github.com/xdarklight/linux/tree/meson-mx-integration-4.12-20170507
