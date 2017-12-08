From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 08 Dec 2017 10:49:25 -0800
Subject: [PATCH] ARM64: dts: meson-gxm: fix q200 interrupt number
In-Reply-To: <20171204100504.7741-1-jbrunet@baylibre.com> (Jerome Brunet's
 message of "Mon, 4 Dec 2017 11:05:04 +0100")
References: <20171204100504.7741-1-jbrunet@baylibre.com>
Message-ID: <7hr2s5m4wa.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Correct the interrupt number assigned to the Realtek PHY in the q200
>
> Fixes: b94d22d94ad2 ("ARM64: dts: meson-gx: add external PHY interrupt on some platforms")
> Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>
>  This change depends on the related series from Martin [0]
>  Thanks for catching it Martin !

Applied to v4.16/dt64 on top of Martin's series.

> [0]: https://lkml.kernel.org/r/20171202214037.17017-1-martin.blumenstingl at googlemail.com

FYI: This results in: No such Message-ID known.

Kevin
