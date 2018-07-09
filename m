From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 9 Jul 2018 20:14:18 +0200
Subject: [PATCH v2 1/2] ARM64: meson: Add 'usb2_phy0' in P212 DT file
In-Reply-To: <20180709153407.29138-2-ldevulder@suse.de>
References: <20180709153407.29138-1-ldevulder@suse.de>
 <20180709153407.29138-2-ldevulder@suse.de>
Message-ID: <f195db8b-555a-9b51-7dc6-14575f3b96df@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Loic,

On 09/07/2018 17:34, Loic Devulder wrote:
> Enable power supply for USB Amlogic Meson GXL P212 based boards.
> 
> Signed-off-by: Loic Devulder <ldevulder@suse.de>

We like to keep the u-boot and linux DTS synced, this changed was backported on Linux v4.17.5,
can you instead precise you backported the last fix from the 4.17 stable branch ?

Thanks,
Neil

> ---
>  arch/arm/dts/meson-gxl-s905x-p212.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/dts/meson-gxl-s905x-p212.dtsi b/arch/arm/dts/meson-gxl-s905x-p212.dtsi
> index 0cfd701809..4e61ec8f5b 100644
> --- a/arch/arm/dts/meson-gxl-s905x-p212.dtsi
> +++ b/arch/arm/dts/meson-gxl-s905x-p212.dtsi
> @@ -189,3 +189,11 @@
>  &usb0 {
>  	status = "okay";
>  };
> +
> +&usb2_phy0 {
> +        /*
> +         * even though the schematics don't show it:
> +         * HDMI_5V is also used as supply for the USB VBUS.
> +         */
> +        phy-supply = <&hdmi_5v>;
> +};
> 
