From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 20 May 2017 18:59:22 +0200
Subject: S805/S812 Device Tree upstreaming (was: Testing.)
In-Reply-To: <9b803bac-4ce8-689c-44a8-40532e294dae@yandex.ru>
References: <CAFBinCA__tiW03VrMzbfAFUOkKY1VoZG=OK7BNfZyfm05HOLng@mail.gmail.com>
 <939ef72d-a4e5-7535-2252-d607158bd0fe@yandex.ru>
 <a9179db4-1db6-3c8d-de34-cee4454f07de@yandex.ru>
 <CAFBinCCAxjtreC0EtpWKxrx9=zqJmv6w4fEhg_aZZNT_G3qARg@mail.gmail.com>
 <9b803bac-4ce8-689c-44a8-40532e294dae@yandex.ru>
Message-ID: <CAFBinCDXx5j_W5WtLSd8q0RDp7TXezCdDNHtXp5mYNnY=jR5wA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Oleg,

On Tue, May 16, 2017 at 11:05 AM, Oleg <balbes-150@yandex.ru> wrote:
>
>> this looks pretty good - the SD card is found!
>>
>> have you tried enabling the brcmfmac driver (CONFIG_BRCMFMAC and
>> CONFIG_BRCMFMAC_SDIO) to see whether your wireless chip is detected as
>> well?
>> testing if wifi works would help me a lot, since my board comes with a
>> RTL8723BS wifi chip and I couldn't get it working on first try (but I
>> don't trust the driver there, while I know that the brcmfmac driver
>> works fine based on my experience with other boards)
>
> Hi Martin
>
> I added modules to the kernel. Put together a new way s812_wifi.txt.
> The result of loading the modules in the application.
> I guess I need to add settings in the DTB file ?
>
> https://mega.nz/#F!yw5kVCrR!zNvlE8f6bcpOR2XZbJdCog
thanks for that - along with your dmesg output from the vendor kernel
this gives us some more details

your dmesg indicates that SDIO port/slot 0 is used for the wifi chip,
see all these aml_sdio_print_err messages with "pdata->port=0"
it also confirms that GPIOAO_6 and GPIOX_11 are used to power on the
wifi chip and that GPIOX_10 is used as pin for the LPO (32.768 kHz)
clock

unfortunately the kernel log when booting my kernel does not show
anything about the wifi chip.
I would have either expected error messages from mmc0 or a short
message that the device was detected.
can you please show me the output of /sys/kernel/debug/mmc[0-2]/* with
my kernel and the original Android/LibreELEC kernel?

regarding your USB problem: unfortunately there doesn't seem to be
anything relevant in the Android/LibreELEC kernel logs.
can you please provide a patch with the .dts changes you made so I can
have a look at these (maybe there's a typo somewhere)?


Regards,
Martin
