From: khilman@baylibre.com (Kevin Hilman)
Date: Wed, 07 Mar 2018 17:14:21 -0800
Subject: [PATCH] ARM: dts: meson8b: add the I2C clocks
In-Reply-To: <20180217160650.9959-1-martin.blumenstingl@googlemail.com>
 (Martin Blumenstingl's message of "Sat, 17 Feb 2018 17:06:50 +0100")
References: <20180217160650.9959-1-martin.blumenstingl@googlemail.com>
Message-ID: <7h8tb3gyhe.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Add the I2C clocks so the I2C busses can be used. The clock input is not
> device specific (the AO I2C bus uses clk81 as input, while the two I2C
> busses in CBUS have a separate "CLKID_I2C" gate, provided by the clock
> controller.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied to v4.17/dt,

Thanks,

Kevin
