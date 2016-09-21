From: axel.lin@ingics.com (Axel Lin)
Date: Wed, 21 Sep 2016 12:13:16 +0800
Subject: [PATCH] phy: meson-usb2: Fix build dependency
In-Reply-To: <57E20743.3030408@ti.com>
References: <1473991635-27973-1-git-send-email-axel.lin@ingics.com>
 <CAFBinCBJPHMkYneKKU+KYVve3u3Svvcbu0Ux-L8VC21DvxWZng@mail.gmail.com>
 <m2r38fhmav.fsf@baylibre.com> <57E20743.3030408@ti.com>
Message-ID: <CAFRkauC6ZawmyUyCw7Z3WMMDzk3=6DFGu5KBG4KnpCDZqp500g@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

2016-09-21 12:06 GMT+08:00 Kishon Vijay Abraham I <kishon@ti.com>:
>
>
> On Monday 19 September 2016 10:14 PM, Kevin Hilman wrote:
>> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>>
>>> Hi Axel,
>>>
>>> On Fri, Sep 16, 2016 at 4:07 AM, Axel Lin <axel.lin@ingics.com> wrote:
>>>> of_usb_get_dr_mode_by_phy will not be compiled if !USB_COMMON, fix below
>>>> build error:
>>>>
>>>> drivers/built-in.o: In function `phy_meson_usb2_probe':
>>>> debugfs.c:(.text+0x76b4): undefined reference to `of_usb_get_dr_mode_by_phy'
>>>> Makefile:961: recipe for target 'vmlinux' failed
>>>> make: *** [vmlinux] Error 1
>>>>
>>>> Signed-off-by: Axel Lin <axel.lin@ingics.com>
>>>> ---
>>>>  drivers/phy/Kconfig | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
>>>> index 6ad87ec..cc27c12 100644
>>>> --- a/drivers/phy/Kconfig
>>>> +++ b/drivers/phy/Kconfig
>>>> @@ -458,6 +458,8 @@ config PHY_MESON_USB2
>>>>         tristate "Meson USB2 PHY driver"
>>>>         default ARCH_MESON
>>>>         depends on OF && (ARCH_MESON || COMPILE_TEST)
>>>> +       depends on USB_SUPPORT
>>>> +       select USB_COMMON
>>>>         select GENERIC_PHY
>>>>         help
>>>>           Enable this to support the Meson USB2 PHYs found in Meson8b
>>>> --
>>>> 2.7.4
>>>>
>>> thanks for this patch!
>>>
>>> How do we handle patches for drivers which will (unfortunately) not
>>> land in the linux 4.8 - should I integrate that into v3 of the patch
>>> (which I'll have to send anyways) or do we keep them separate?
>>> Maybe Kishon and/or Kevin can share their opinion on this.
>
> Since you are anyways planning to send v3, merge this patch too.

I got confused why this driver appears in linux-next but it's not from phy
tree? I thought it's because other dependency so it needs to go via other tree,
but looks like not the case. And the driver does not get Kishon's Ack?

BTW, Kishon, do you consider to add phy tree to linux-next?

Axel
