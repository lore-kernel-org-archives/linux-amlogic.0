From: robh@kernel.org (Rob Herring)
Date: Fri, 12 May 2017 14:15:21 -0500
Subject: [PATCH] usb: dwc2: add support for the DWC2 controller on Meson8
 SoCs
In-Reply-To: <20170506173745.19593-1-martin.blumenstingl@googlemail.com>
References: <20170506173745.19593-1-martin.blumenstingl@googlemail.com>
Message-ID: <20170512191521.q5fodp2fs6r4fgvv@rob-hp-laptop>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sat, May 06, 2017 at 07:37:45PM +0200, Martin Blumenstingl wrote:
> USB support in the Meson8 SoCs is provided by a DWC2 controller which
> works with the same settings as Meson8b and GXBB. Using the generic
> "snps,dwc2" binding results in an endless stream of "Overcurrent change
> detected" messages.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.txt | 1 +
>  drivers/usb/dwc2/params.c                      | 2 ++
>  2 files changed, 3 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
