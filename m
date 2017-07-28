From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 28 Jul 2017 10:16:43 -0700
Subject: [PATCH] ARM64: dts: meson-gx: consistently use the GIC_SPI and
 IRQ type macros
In-Reply-To: <20170716141145.30295-1-martin.blumenstingl@googlemail.com>
 (Martin Blumenstingl's message of "Sun, 16 Jul 2017 16:11:45 +0200")
References: <20170716141145.30295-1-martin.blumenstingl@googlemail.com>
Message-ID: <7hmv7oqy6c.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> the mailbox and ethmac nodes used the magic number "0" instead of the
> GIC_SPI preprocessor macro. Additionally the ethmac used the magic
> number "1" instead of IRQ_TYPE_EDGE_RISING.
> Fix this to make the .dtsi easier to read.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied to v4.14/dt64,

Kevin
