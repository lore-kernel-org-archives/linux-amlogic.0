From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 30 Oct 2017 00:05:20 +0100
Subject: [PATCH 0/3] Meson8 GPIO interrupt support
Message-ID: <20171029230523.7355-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This is a simple follow-up of two series from Jerome:
- "irqchip: meson: add support for the gpio interrupt controller"
- "ARM: meson: enable gpio interrupt controller"

This fills in the missing bits to have GPIO interrupt support on Meson8,
which includes:
- a new binding in the driver with the correct IRQ number
- enabling the GPIO interrupt controller in meson8.dts
- enabling the GPIO interrupt controller via Kconfig for MACH_MESON8


Martin Blumenstingl (3):
  irqchip/meson-gpio: add support for Meson8 SoCs
  ARM: dts: meson8: enable the GPIO interrupt controller
  ARM: meson: enable MESON_IRQ_GPIO also for MACH_MESON8

 .../bindings/interrupt-controller/amlogic,meson-gpio-intc.txt        | 1 +
 arch/arm/boot/dts/meson8.dtsi                                        | 5 +++++
 arch/arm/mach-meson/Kconfig                                          | 1 +
 drivers/irqchip/irq-meson-gpio.c                                     | 5 +++++
 4 files changed, 12 insertions(+)

-- 
2.14.3
