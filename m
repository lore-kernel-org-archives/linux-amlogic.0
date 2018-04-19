From: jbrunet@baylibre.com (Jerome Brunet)
Date: Thu, 19 Apr 2018 16:13:26 +0200
Subject: [PATCH 0/2] nvmem: meson-efuse: add write support
In-Reply-To: <20180316150113.9779-1-jbrunet@baylibre.com>
References: <20180316150113.9779-1-jbrunet@baylibre.com>
Message-ID: <1524147206.2601.104.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Fri, 2018-03-16 at 16:01 +0100, Jerome Brunet wrote:
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

Hi Srinivas,

Is this patchset ok with you ? Do you want to me to change something ?

Regards
Jerome

> 
> [0]: https://lkml.kernel.org/r/20180316145021.8517-1-jbrunet at baylibre.com
> 
> Jerome Brunet (2):
>   nvmem: meson-efuse: remove econfig global
>   nvmem: meson-efuse: add write support
> 
>  drivers/nvmem/meson-efuse.c | 37 +++++++++++++++++++++++++++----------
>  1 file changed, 27 insertions(+), 10 deletions(-)
> 
