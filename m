From: khilman@baylibre.com (Kevin Hilman)
Date: Thu, 10 May 2018 17:33:43 -0700
Subject: [PATCH v2 0/4] Meson8m2 (32-bit ARM) SoC support
In-Reply-To: <20180509235037.5876-1-martin.blumenstingl@googlemail.com>
 (Martin Blumenstingl's message of "Thu, 10 May 2018 01:50:33 +0200")
References: <20180509235037.5876-1-martin.blumenstingl@googlemail.com>
Message-ID: <7h603v115k.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> This series adds support for the Meson8m2 SoC. This SoC is mostly
> compatible with Meson8 while using some peripherals from Meson8b. Patch
> #4 contains a list of (known) differences between the Meson8 and Meson8m2
> SoCs.
>
> The first supported board with Meson8m2 SoC is the "Tronsmart MXIII Plus"
> where Oleg contributed the initial .dts and heavily tested it (many
> thanks!). His testing also confirmed that the Meson8m2 SoC uses the same
> register layout for the Ethernet "glue registers (supported by the
> dwmac-meson8b driver) as Meson8b.
>
> changes since v1 at [0]:
> - do not create a new MACH_MESON8M2 Kconfig entry as suggested by Kevin
>   (MACH_MESON8 is re-used instead). This affects patch #1 (which was
>   patch #3 in v1) and patch #4 (which was patch #6 in v1)
> - dropped patches #1 and #2 from v1 because Kevin already applied these
>   ("dt-bindings: arm: amlogic: add support for the Meson8m2 SoC" and
>   "dt-bindings: arm: amlogic: add support for the Tronsmart MXIII Plus")

Applied to v4.18/dt.

One more request: Could you send one more patch (on top of my v4.18/dt)
that gets rid of the Kconfig for the 8B also?

Thanks,

Kevin
