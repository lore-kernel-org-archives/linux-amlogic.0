From: linus.walleij@linaro.org (Linus Walleij)
Date: Fri, 2 Mar 2018 10:49:22 +0100
Subject: [PATCH v2 2/2] ARM: dts: meson8b: the CBUS GPIO controller only
 has 83 GPIOs
In-Reply-To: <20180225113854.20731-4-martin.blumenstingl@googlemail.com>
References: <20180225113854.20731-1-martin.blumenstingl@googlemail.com>
 <20180225113854.20731-4-martin.blumenstingl@googlemail.com>
Message-ID: <CACRpkdZ0J8w2ReFwYbivKWEj7pFTfksj_cBFz2fZCbDLhJ+ojw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, Feb 25, 2018 at 12:38 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> Update the "gpio-ranges" property of the CBUS GPIO controller on Meson8b
> because it only provides 83 GPIOs.
> The GPIO definitions in include/dt-bindings/gpio/meson8b-gpio.h
> inherited all GPIOs from Meson8 until recently. However, Meson8b does
> not support all GPIOs which are supported by Meson8 (Meson8b doesn't
> have a GPIOZ bank, most of the pins from the GPIODV bank are missing on
> Meson8b - just to name a few differences).
>
> The actual number of GPIOs is only 83, instead of 120 from Meson8 plus
> the 10 GPIOs from the DIF bank on Meson8b.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Please funnel this through the ARM SoC tree. If it is closesly
associated with patch 1/2 and need to go in together with it,
I can merge it if some ARM SoC maintainer can provide an
ACK.

Yours,
Linus Walleij
