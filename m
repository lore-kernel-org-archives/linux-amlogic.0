From: ben.dooks@codethink.co.uk (Ben Dooks)
Date: Tue, 23 Aug 2016 14:30:21 +0100
Subject: USB PHY documentation
In-Reply-To: <CAFBinCASOLYOfsRC7+kVA8eZ+o1OsyqKEUDOUgfRBKuhsYnuYA@mail.gmail.com>
References: <CAFBinCASOLYOfsRC7+kVA8eZ+o1OsyqKEUDOUgfRBKuhsYnuYA@mail.gmail.com>
Message-ID: <4cc6ec9ce62649c283fb633b26d5cffe@codethink.co.uk>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 22/08/2016 22:39, Martin Blumenstingl wrote:
> Hello,
>
> last weekend I tried getting the USB PHY working on my GXBB device.
> The simple part: resetting the USB part and enabling the clocks.
> The tricky part: configuring the USB PHY registers
>
> Unfortunately the public datasheet does not contain any information
> about the USB PHY.
> The reference driver does not contain many comments, the struct
> members are using abbreviated names and it seems that a part of what
> should be done by the PHY driver is part of the dwc driver
> (usb_peri_reg changes were patched into it).
> I am now wondering if someone can share some details from the 
> datasheet.
>
> I took my register #defines from the reference driver (and tried to
> make them human readable): [0]
> There are some USB_PHY_CLK_SEL_* definitions at the bottom which seem
> interesting (at least for configuring REG_CONFIG_CLK_SEL, but
> unfortunately I don't know if these are valid (for either meson8b or
> gxbb)..
>
> Symptoms are: dwc2's USB initialization is successful, but when I 
> plug
> in a device it's not being detected.
> I *think* that my problem is that REG_ADP_BC_DRV_VBUS is a readonly
> bit - it's set when I use the original firmware of my device, but I
> cannot set it in my PHY driver.
>
> In case anyone is interested how my changes look exactly, you can 
> find
> the code here: [1]
>
> I also dumped the USB PHY registers from the original Android 
> firmware
> of my device in case anyone is interested:
> phy0:
> [0xc0000000] = 0x8000
> [0xc0000004] = 0x1690500
> [0xc0000008] = 0x0
> [0xc000000c] = 0x8E18
> [0xc0000010] = 0x0
> [0xc0000014] = 0x80000
> [0xc0000018] = 0x246613D
> [0xc000001c] = 0x0
>
> phy1:
> [0xc0000020] = 0x8000
> [0xc0000024] = 0x1690500
> [0xc0000028] = 0x0
> [0xc000002c] = 0x2010118
> [0xc0000030] = 0x0
> [0xc0000034] = 0x80000
> [0xc0000038] = 0xE46613D
> [0xc000003c] = 0x0
>
> @Ben: did you get anywhere with your experiments on Meson8b (S805)?

I did a PHY driver and some updates to the dwc2 driver, but could
not get a reliable USB session going. I'll post my PHY driver later
as it's still in bits and needs to be made into a semi-coherent patch
set.


-- 
Ben Dooks, Senior Engineer
http://www.codethink.co.uk/
