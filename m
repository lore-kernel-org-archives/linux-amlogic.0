From: robh@kernel.org (Rob Herring)
Date: Thu, 17 Aug 2017 10:13:45 -0500
Subject: [RFCv3 usb-next 1/3] dt-bindings: usb: add the documentation for
 USB root-hub
In-Reply-To: <20170814224542.18257-2-martin.blumenstingl@googlemail.com>
References: <20170814224542.18257-1-martin.blumenstingl@googlemail.com>
 <20170814224542.18257-2-martin.blumenstingl@googlemail.com>
Message-ID: <20170817151345.xx34eatfckrkppk7@rob-hp-laptop>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Aug 15, 2017 at 12:45:40AM +0200, Martin Blumenstingl wrote:
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
