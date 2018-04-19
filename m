From: khilman@baylibre.com (Kevin Hilman)
Date: Thu, 19 Apr 2018 10:42:40 -0700
Subject: [PATCH 0/2] nvmem: meson-efuse: add write support
In-Reply-To: <20180316150113.9779-1-jbrunet@baylibre.com> (Jerome Brunet's
 message of "Fri, 16 Mar 2018 16:01:11 +0100")
References: <20180316150113.9779-1-jbrunet@baylibre.com>
Message-ID: <7hwox33xf3.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> This changeset adds write support to meson efuse driver.
> The first patch just changes the way the nvmem data are allocated w/o
> any functional changes. The second patches actually adds write support.
>
> The memory being an OTP, it is safer if it remains read-only by default,
> which is why I also submitted this DT patch [0].
>
> If a user knows what he is doing, it should be easy to remove the
> read-only property from the board DT. This can be done in u-boot, before
> starting linux:
>
>  > fdt rm /efuse read-only
>
> Tested on the gxl libretech-cc

For the series,

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
