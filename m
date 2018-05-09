From: khilman@baylibre.com (Kevin Hilman)
Date: Wed, 09 May 2018 15:39:18 -0700
Subject: [PATCH 0/2] IR remote (input) support for Odroid-C1 and cleanups
In-Reply-To: <20180506205749.18719-1-martin.blumenstingl@googlemail.com>
 (Martin Blumenstingl's message of "Sun, 6 May 2018 22:57:47 +0200")
References: <20180506205749.18719-1-martin.blumenstingl@googlemail.com>
Message-ID: <7htvrgxxm1.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> While testing my Odroid-C1 I found that the IR remote receiver was still
> disabled. While enabling it I saw that the nodes in meson8b-odroidc1.dts
> were not sorted alphabetically.
>
> This small series:
> - first cleans up the sort order of the nodes in meson8b-odroidc1.dts

Nice, thanks!

> - then adds the configuration for GPIOAO_7 so it's routed to the SoCs
>   "IR receiver" and enables that in meson8b-odroidc1.dts

Applied both to v4.17/dt,

Thanks,

Kevin

>
> Martin Blumenstingl (2):
>   ARM: dts: meson8b: odroid-c1: sort nodes alphabetically
>   ARM: dts: meson8b: odroid-c1: enable the IR receiver
>
>  arch/arm/boot/dts/meson8b-odroidc1.dts | 68 ++++++++++++++------------
>  arch/arm/boot/dts/meson8b.dtsi         |  7 +++
>  2 files changed, 44 insertions(+), 31 deletions(-)
