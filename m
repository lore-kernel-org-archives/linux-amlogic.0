From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 28 Jul 2017 09:48:47 -0700
Subject: [PATCH] ARM: dts: meson: add a node which describes the SRAM
In-Reply-To: <20170711222655.15859-1-martin.blumenstingl@googlemail.com>
 (Martin Blumenstingl's message of "Wed, 12 Jul 2017 00:26:55 +0200")
References: <20170711222655.15859-1-martin.blumenstingl@googlemail.com>
Message-ID: <7hr2x0qzgw.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> All 32bit Meson SoCs contain 128KiB SRAM. This SRAM is used when
> suspending the device (the the ARM Power Firmware on
> Meson8/Meson8b/Meson8m2 saves the DDR settings there) and to boot the
> secondary CPU cores.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied to v4.14/dt,

Thanks,

Kevin
