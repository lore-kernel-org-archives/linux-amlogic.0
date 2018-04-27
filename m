From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 27 Apr 2018 12:11:32 -0700
Subject: [PATCH 0/3] pinctrl: meson: add support for the Meson8m2 SoC
In-Reply-To: <20180422105330.4712-1-martin.blumenstingl@googlemail.com>
 (Martin Blumenstingl's message of "Sun, 22 Apr 2018 12:53:27 +0200")
References: <20180422105330.4712-1-martin.blumenstingl@googlemail.com>
Message-ID: <7h36zg1n2z.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> The Meson8m2 SoC is a variant of Meson8 with some updates from Meson8b
> (such as the Gigabit capable DesignWare MAC).
> It is mostly pin compatible with Meson8, only 10 (existing) CBUS pins
> get an additional function. Four of these are Ethernet RXD2, RXD3, TXD2
> and TXD3 (GPIOZ_0..GPIOZ_3) which are required when the board uses an
> RGMII PHY. GPIODV_24 and GPIODV_25 provide "VGA" support on Meson8,
> which doesn't seem to be supported on Meson8m2 anymore.
> The other 4 are GPIOH_9 (reg 3 bit 19), CARD_4 (reg 8 bit 8),
> CARD_5 (reg 8 bit 7) and GPIOY_3 (reg 3 bit 11). Their function is
> currently unknown.
>
> The AOBUS pins seem to be identical on Meson8 and Meson8m2. However,
> since there's no official documentation I decided to add a new compatible
> string.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
