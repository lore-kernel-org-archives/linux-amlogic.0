From: robh@kernel.org (Rob Herring)
Date: Thu, 26 Oct 2017 22:29:57 -0500
Subject: [PATCH v7 usb-next 4/4] dt-bindings: usb: xhci: include the
 roothub and a device in the example
In-Reply-To: <20171023215718.3446-5-martin.blumenstingl@googlemail.com>
References: <20171023215718.3446-1-martin.blumenstingl@googlemail.com>
 <20171023215718.3446-5-martin.blumenstingl@googlemail.com>
Message-ID: <20171027032957.m55ntlce646hpd5a@rob-hp-laptop>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, Oct 23, 2017 at 11:57:18PM +0200, Martin Blumenstingl wrote:
> This extends the existing example from the USB xHCI binding
> documentation so it includes the roothub and an actual device.
> The goal of this is to show that the roothub is specified alongside the
> actual devices on the USB bus (which is important because a device on
> the USB bus - for example a hub - might need it's own phys / phy-names
> properties. modelling the roothub as separate device and not nesting the
> other devices on the bus below the roothub allows us to keep the
> properties, for example the PHYs, separated).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> index 5b49ba9f2f9a..20e5ce2b016a 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> @@ -42,4 +42,27 @@ Example:
>  		compatible = "generic-xhci";
>  		reg = <0xf0931000 0x8c8>;
>  		interrupts = <0x0 0x4e 0x0>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* see usb-roothub.txt */
> +		roothub at 0 {
> +			compatible = "usb1d6b,3", "usb1d6b,2";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0>;
> +
> +			port at 1 {
> +				reg = <1>;
> +				phys = <&usb2_phy1>, <&usb3_phy1>;
> +				phy-names = "usb2-phy", "usb3-phy";
> +			};
> +		};
> +
> +		/* see usb-device.txt */
> +		hub: genesys at 1 {

What do the 0 and 1 addresses correspond to?

> +			compatible = "usb5e3,608";
> +			reg = <1>;
> +		};
>  	};
> -- 
> 2.14.2
> 
