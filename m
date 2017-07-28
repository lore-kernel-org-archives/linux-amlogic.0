From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 28 Jul 2017 09:48:11 -0700
Subject: [PATCH] ARM: dts: meson8b: use the existing wdt node to override
 the compatible
In-Reply-To: <20170711222222.11023-1-martin.blumenstingl@googlemail.com>
 (Martin Blumenstingl's message of "Wed, 12 Jul 2017 00:22:22 +0200")
References: <20170711222222.11023-1-martin.blumenstingl@googlemail.com>
Message-ID: <7hvamcqzhw.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Meson8b has to define it's own compatible string for the watchdog. This
> patch removes the duplicate resource (register region and interrupt)
> definition from meson8b.dtsi and simply re-uses these values from
> meson.dtsi (as the register offset, size and interrupt are identical).
>
> This is purely cosmetic and does not change any functionality.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied to v4.14/dt,

Thanks,

Kevin
