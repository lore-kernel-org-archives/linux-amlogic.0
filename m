From: robh@kernel.org (Rob Herring)
Date: Tue, 30 Jan 2018 11:12:49 -0600
Subject: [RFC usb-next v8 1/3] dt-bindings: usb: add the documentation
 for USB HCDs
In-Reply-To: <20180125000053.9387-2-martin.blumenstingl@googlemail.com>
References: <20180125000053.9387-1-martin.blumenstingl@googlemail.com>
 <20180125000053.9387-2-martin.blumenstingl@googlemail.com>
Message-ID: <20180130171249.d2svzedtnxc4pxyp@rob-hp-laptop>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, Jan 25, 2018 at 01:00:51AM +0100, Martin Blumenstingl wrote:
> A USB HCD may have several PHYs which need to be configured before the
> the HCD starts working.
> This adds the documentation for such a USB HCD as well as a reference to
> the new "usb-hcd.txt" from all bindings that implement a USB HCD which
> support one USB PHY per port.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt | 5 ++++-
>  Documentation/devicetree/bindings/usb/mediatek,mtu3.txt     | 5 ++++-
>  Documentation/devicetree/bindings/usb/usb-ehci.txt          | 6 ++++--
>  Documentation/devicetree/bindings/usb/usb-hcd.txt           | 9 +++++++++
>  Documentation/devicetree/bindings/usb/usb-ohci.txt          | 6 ++++--
>  Documentation/devicetree/bindings/usb/usb-uhci.txt          | 3 +++
>  Documentation/devicetree/bindings/usb/usb-xhci.txt          | 5 +++++
>  7 files changed, 33 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/usb-hcd.txt

Reviewed-by: Rob Herring <robh@kernel.org>
