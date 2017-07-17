From: robh@kernel.org (Rob Herring)
Date: Mon, 17 Jul 2017 12:58:02 -0500
Subject: [RFCv2 usb-next 3/3] usb: host: xhci: plat: integrate the
 platform-roothub
In-Reply-To: <20170713105939.31566-4-martin.blumenstingl@googlemail.com>
References: <20170713105939.31566-1-martin.blumenstingl@googlemail.com>
 <20170713105939.31566-4-martin.blumenstingl@googlemail.com>
Message-ID: <20170717175802.7khb2uxtg3gs7ndd@rob-hp-laptop>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, Jul 13, 2017 at 12:59:39PM +0200, Martin Blumenstingl wrote:
> This enables the platform-roothub for the xhci-plat driver. This allows
> specifying a PHY for each port via devicetree. All PHYs will then be
> enabled/disabled by the platform-roothub driver.
> 
> One example where this is required is the Amlogic GXL and GXM SoCs:
> They are using a dwc3 USB controller with up to three ports enabled on
> the internal roothub. Using only the top-level "phy" properties does not
> work here since one can only specify one "usb2-phy" and one "usb3-phy",
> while actually at least two "usb2-phy" have to be specified.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.txt |  7 ++++++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/usb/host/Kconfig                           |  1 +
>  drivers/usb/host/xhci-plat.c                       | 27 +++++++++++++++++++++-
>  drivers/usb/host/xhci.h                            |  2 ++
>  4 files changed, 36 insertions(+), 1 deletion(-)
