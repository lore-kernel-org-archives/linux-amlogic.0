From: robh@kernel.org (Rob Herring)
Date: Mon, 17 Jul 2017 12:56:35 -0500
Subject: [RFCv2 usb-next 1/3] dt-bindings: usb: add the documentation for
 USB root-hub
In-Reply-To: <20170713105939.31566-2-martin.blumenstingl@googlemail.com>
References: <20170713105939.31566-1-martin.blumenstingl@googlemail.com>
 <20170713105939.31566-2-martin.blumenstingl@googlemail.com>
Message-ID: <20170717175635.fn4pwxfu5rcd5byu@rob-hp-laptop>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, Jul 13, 2017 at 12:59:37PM +0200, Martin Blumenstingl wrote:
> A USB root-hub may have several PHYs which need to be configured before
> the root-hub starts working.
> This adds the documentation for such a USB root-hub.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../devicetree/bindings/usb/usb-roothub.txt        | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/usb-roothub.txt

Acked-by: Rob Herring <robh@kernel.org>
