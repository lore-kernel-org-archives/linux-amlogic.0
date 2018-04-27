From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 27 Apr 2018 12:08:10 -0700
Subject: [PATCH 0/2] add the ARM PMU on Meson8 and Meson8b
In-Reply-To: <20180422104502.2942-1-martin.blumenstingl@googlemail.com>
 (Martin Blumenstingl's message of "Sun, 22 Apr 2018 12:45:00 +0200")
References: <20180422104502.2942-1-martin.blumenstingl@googlemail.com>
Message-ID: <7hd0yk1n8l.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Meson8 uses Cortex-A9 cores and Meson8b uses Cortex-A5 cores. As most
> Cortex-A5/A9 implementation these Amlogic SoCs also come with a
> built-in PMU for counting cpu and cache events like cache misses and
> hits.

Applied to v4.18/dt,

Thanks,

Kevin
