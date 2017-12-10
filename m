From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 10 Dec 2017 19:15:28 +0100
Subject: [PATCH 0/3] Meson8 GPIO interrupt support
In-Reply-To: <7h1sljmxp6.fsf@baylibre.com>
References: <20171029230523.7355-1-martin.blumenstingl@googlemail.com>
 <8637605bly.fsf@arm.com> <7h1sljmxp6.fsf@baylibre.com>
Message-ID: <CAFBinCDdJtE4g7iCgaw9KEYPhKWjt0YoDy2CfXcTKq+OTDPbLA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Kevin,

On Tue, Oct 31, 2017 at 11:13 AM, Kevin Hilman <khilman@baylibre.com> wrote:
> Marc Zyngier <marc.zyngier@arm.com> writes:
>
>> On Mon, Oct 30 2017 at 12:05:20 am GMT, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>>> This is a simple follow-up of two series from Jerome:
>>> - "irqchip: meson: add support for the gpio interrupt controller"
>>> - "ARM: meson: enable gpio interrupt controller"
>>>
>>> This fills in the missing bits to have GPIO interrupt support on Meson8,
>>> which includes:
>>> - a new binding in the driver with the correct IRQ number
>>> - enabling the GPIO interrupt controller in meson8.dts
>>> - enabling the GPIO interrupt controller via Kconfig for MACH_MESON8
>>>
>>>
>>> Martin Blumenstingl (3):
>>>   irqchip/meson-gpio: add support for Meson8 SoCs
>>>   ARM: dts: meson8: enable the GPIO interrupt controller
>>>   ARM: meson: enable MESON_IRQ_GPIO also for MACH_MESON8
>>>
>>>  .../bindings/interrupt-controller/amlogic,meson-gpio-intc.txt        | 1 +
>>>  arch/arm/boot/dts/meson8.dtsi                                        | 5 +++++
>>>  arch/arm/mach-meson/Kconfig                                          | 1 +
>>>  drivers/irqchip/irq-meson-gpio.c                                     | 5 +++++
>>>  4 files changed, 12 insertions(+)
>>
>> Kevin, Carlos: Are you OK with this one? It seems pretty minor, and I'm
>> happy to queue it if I get an Ack for it. If you'd rather get it through
>> via armsoc, let me know.
>
> Can you take the drivers/irqchip and bindings patch (PATCH 1/3) and I'll
> take the rest to avoid conflicts with a bunch of other moving parts we
> have in arch/arm.
PATCH 1/3 even made it into v4.15
can you please queue the remaining two patches for v4.16 - or do you
want me to re-send these?


thank you!
Martin
