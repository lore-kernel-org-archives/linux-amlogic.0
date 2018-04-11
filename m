From: marex@denx.de (Marek Vasut)
Date: Wed, 11 Apr 2018 17:20:32 +0200
Subject: [PATCH v3 u-boot 0/3] Add USB Support for Amlogic Meson GXL SoCs
In-Reply-To: <1523459282-12235-1-git-send-email-narmstrong@baylibre.com>
References: <1523459282-12235-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <b83361a6-66ef-5d48-5bf6-7dabbc6a0352@denx.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 04/11/2018 05:07 PM, Neil Armstrong wrote:
> This patchset adds support for USB for the Amlogic Meson GXL SoCs following
> the work done for Linux by Martin Blumenstingl at [1] [2] [3].
> 
> The support consist of :
>  - A port of dwc3-of-simple from Linux to U-boot
>  - A change to support more than 2 PHYs in the DWC3 DM driver
>  - An USB2 PHY Driver and an USB3 PHY Driver
> 
> The DWC3 Controller has up to 4 PHYs connected :
>  - 2 USB2 PHYs and an USB3 PHY for GXL SoCs
>  - 3 USB2 PHYs and an USB3 PHY for the GXM SoC Variant
> This is enabled by the "usb: host: dwc3: Add support for multiple PHYs" patch.
> This patch is based on the "xhci-dwc3: Couple of fixes for USB3 support"
> serie from Vignesh R, on the u-boot-usb tree.
> 
> The DWC3 Controller glue is generic enough to use the dwc3-of-simple from Linux
> and can be easily ported to U-Boot as a Simple-Bus with Glue-Specific clocks
> and Reset lines setup.
> 
> This depends on the recently applied :
>  - clk: Add get/enable/disable/release for a bulk of clocks at [4]
>  - reset: Add get/assert/deassert/release for bulk of reset signals at [5]
> in order to manage the clocks and resets of the Glue in a clean fashion.
> 
> The USB PHY driver supports the standard generic PHY interface and supports
> the power-on/off calls and set the Host mode by default.
> They are based on the excellent work from Martin Blumenstingl merged in linux.
> 
> Changes since v2:
>  - Drop #if and use the empty stubs for clock & reset API
> 
> Changes since v1:
>  - switch to submitted clk/reset bulk API
>  - splitted dwc3 multiple phy init error between poweroff & exit
> 

Applied all, thanks.

-- 
Best regards,
Marek Vasut
