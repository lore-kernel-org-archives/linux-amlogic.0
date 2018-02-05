From: robh@kernel.org (Rob Herring)
Date: Mon, 5 Feb 2018 00:07:23 -0600
Subject: [PATCH 1/3] dt-bindings: usb: add support for dwc3 controller on
 Amlogic Meson GX
In-Reply-To: <20180128200333.20093-2-martin.blumenstingl@googlemail.com>
References: <20180128200333.20093-1-martin.blumenstingl@googlemail.com>
 <20180128200333.20093-2-martin.blumenstingl@googlemail.com>
Message-ID: <20180205060723.e6vyot775k66hhjh@rob-hp-laptop>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, Jan 28, 2018 at 09:03:31PM +0100, Martin Blumenstingl wrote:
> Amlogic Meson GX SoCs (GXL and AXG) come with a (host-only) dwc3 USB
> controller. This requires a clock to be enabled and a reset line to be
> pulsed to get the hardware into a known state.
> Add the documentation for this IP block, similar to "qcom,dwc3.txt".
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../devicetree/bindings/usb/amlogic,dwc3.txt       | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/amlogic,dwc3.txt

Reviewed-by: Rob Herring <robh@kernel.org>
