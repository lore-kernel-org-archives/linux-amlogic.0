From: robh@kernel.org (Rob Herring)
Date: Wed, 1 Nov 2017 16:29:30 -0500
Subject: [PATCH 1/3] irqchip/meson-gpio: add support for Meson8 SoCs
In-Reply-To: <20171029230523.7355-2-martin.blumenstingl@googlemail.com>
References: <20171029230523.7355-1-martin.blumenstingl@googlemail.com>
 <20171029230523.7355-2-martin.blumenstingl@googlemail.com>
Message-ID: <20171101212930.7i5w7quwejzcvlaf@rob-hp-laptop>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, Oct 30, 2017 at 12:05:21AM +0100, Martin Blumenstingl wrote:
> Meson8 uses the same GPIO interrupt controller IP block as the other
> Meson SoCs. A total of 134 pins can be spied on, which is the sum of:
> - 22 pins on bank GPIOX
> - 17 pins on bank GPIOY
> - 30 pins on bank GPIODV
> - 10 pins on bank GPIOH
> - 15 pins on bank GPIOZ
> - 7 pins on bank CARD
> - 19 pins on bank BOOT
> - 14 pins in the AO domain
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../bindings/interrupt-controller/amlogic,meson-gpio-intc.txt        | 1 +
>  drivers/irqchip/irq-meson-gpio.c                                     | 5 +++++
>  2 files changed, 6 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
