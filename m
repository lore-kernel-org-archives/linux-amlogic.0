From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 29 Jun 2018 14:37:48 -0700
Subject: [PATCH 1/1] ARM64: dts: meson: enable the saradc node in
 meson-gx-p23x-q20x.dtsi
In-Reply-To: <20180623145959.445-2-martin.blumenstingl@googlemail.com> (Martin
 Blumenstingl's message of "Sat, 23 Jun 2018 16:59:59 +0200")
References: <20180623145959.445-1-martin.blumenstingl@googlemail.com>
 <20180623145959.445-2-martin.blumenstingl@googlemail.com>
Message-ID: <7h7emhe0k3.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> meson-gxl-s905d-p230.dts and meson-gxm-q200.dts enable the saradc node
> (and configure it's vref-supply "VDDIO_AO18") in their corresponding
> .dts file.
> Move both (the saradc node as well as the VDDIO_AO18 regulator) to
> remove some duplicate code.
>
> As a positive side-effect this enables the saradc also for the P231 (GXL
> S905D) and Q201 (GXM S912) development boards which are similar to the
> P230/Q200 boards (P231 and Q201 use the internal 100Mbit/s PHY, while
> P230 and Q200 have an external RGMII PHY).
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied to v4.19/dt64,

Kevin
