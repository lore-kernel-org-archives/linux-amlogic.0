From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 6 Sep 2017 09:29:51 +0200
Subject: USB on Amlogic P231 using Linux 4.13
In-Reply-To: <CA+xv_Tpuf4ZceQwn7w1mNqWy68GdMW4fpBz3itXsS+=gYTOJHQ@mail.gmail.com>
References: <CA+xv_Tpuf4ZceQwn7w1mNqWy68GdMW4fpBz3itXsS+=gYTOJHQ@mail.gmail.com>
Message-ID: <19fcd1fd-2088-3963-7be2-ce27f9a0f65a@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Alex,

(I add the mailing list on CC since it can be interesting to have a clarification of the USB for GXL/GXM)

The S905X/S905D/S912 shares (99%) the same USB architecture.

These SoCs have :
 - a Synopsys DWC3 in *Host-Only* and *USB2* only
 - a Synopsys DWC2 in *Device-Only*

There is 3 (4 on GXM) Internal USB2 PHYs connected to a Root Hub, connected to the DWC3 Controller.
The first PHY can be switched to device mode and muxed to the DWC2 Controller via another unknown "USB3" phy, this OTG support part is not documented and complex to understand and implement.

For the USB Host to work, *all* PHYs must be enabled and configured, otherwise nothing happens.

This is why Martin Blumenstingl posted an "initialize (multiple) PHYs in xhci-plat" serie to allow multiple PHYs behind a XHCI controller (DWC3 embeds a XHCI interface) to be configured in the same time, because historically SoCs
only had a single PHY and on Intel platforms the multiple PHYs were initialized by the firmware.

This is why the GXL/GXM PHY driver has been upstreamed, but nothing has been added to the DTS until Martin's patch has been merged.

If you want to test the USB functionality, you can try my stable integration tree at : https://github.com/superna9999/linux/tree/linux-4.13-le-amlogic-gx
It contains the USB patchs + dts patch with other Merged and WiP functionalities.

Neil

On 09/06/2017 02:49 AM, Alexander Kaplan wrote:
> Hi Andreas, Hi Neil,
> 
> my name is Alex and  I just tried out the new Linux 4.13 on a Amlogic S905D p231 board. I am particularly interested in the USB support. As a test I plugged in a standard USB key drive which is recognized by the AML openlinux buildroot (kernel 3.14). However, using Linux 4.13 the USB drive is not recognized.
> 
> I compared meson-gxl-s905d-p231.dts to the meson-gxbb-odroidc2.dts and added nodes for usb to meson-gxl-s905d-p231.dts and meson-gxl.dtsi (attached dts.patch). After applying these changes I get some error messages about dwc2 in the kernel log (see p231_dmesg_4.13.txt) and the USB drive is still not recognized. I guess I'm missing something here - any hints are very welcome.
> 
> On http://linux-meson.com, the USB support on the S905D is still listed as "partial", so I'm not sure - should USB drives work in Linux 4.13 on the p231 board?
> 
> Thank you
> Alex
> 
