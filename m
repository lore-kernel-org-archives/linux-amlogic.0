From: khilman@baylibre.com (Kevin Hilman)
Date: Wed, 07 Sep 2016 13:06:27 -0700
Subject: [PATCH v2 0/3] eMMC,
 SD-card and ethernet support for Vega S95 boards
In-Reply-To: <20160904182903.1841-1-martin.blumenstingl@googlemail.com>
 (Martin Blumenstingl's message of "Sun, 4 Sep 2016 20:29:00 +0200")
References: <20160815133811.19646-1-martin.blumenstingl@googlemail.com>
 <20160904182903.1841-1-martin.blumenstingl@googlemail.com>
Message-ID: <7h37lbtqyk.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Marrtin,

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> This adds support for the internal eMMC, the SD-card slot and ethernet on
> all Tronsmart S95 Vega boards.
> There are some S95 Vega Meta clones out there where the bootloader does
> not configure the ethernet registers correctly, leading to non-working
> ethernet. This will be fixed in a separate series. Boards which are not
> suffering from broken bootloaders have fully working ethernet.
>
> Changes since v1:
> - rebased after latest updates which added the IR decoder to
>   meson-gxbb-vega-s95.dtsi
>
> Changes since the RFC:
> - added eMMC support
> - renamed fixed 3V3 regulator so it can be re-used for eMMC
>
>
> Martin Blumenstingl (3):
>   ARM64: dts: amlogic: SD card support for all Tronsmart Vega S95
>     devices
>   ARM64: dts: amlogic: eMMC support for all Tronsmart Vega S95 devices
>   ARM64: dts: amlogic: enable ethernet on all Tronsmart Vega S95 devices

I've applied the ethernet one, but I'm going to wait on the SD/eMMC
patches until the driver is finalized for the other one.

Thanks,

Kevin
