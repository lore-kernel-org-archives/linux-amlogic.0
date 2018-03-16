From: jbrunet@baylibre.com (Jerome Brunet)
Date: Fri, 16 Mar 2018 16:01:11 +0100
Subject: [PATCH 0/2] nvmem: meson-efuse: add write support
Message-ID: <20180316150113.9779-1-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This changeset adds write support to meson efuse driver.
The first patch just changes the way the nvmem data are allocated w/o
any functional changes. The second patches actually adds write support.

The memory being an OTP, it is safer if it remains read-only by default,
which is why I also submitted this DT patch [0].

If a user knows what he is doing, it should be easy to remove the
read-only property from the board DT. This can be done in u-boot, before
starting linux:

 > fdt rm /efuse read-only

Tested on the gxl libretech-cc

[0]: https://lkml.kernel.org/r/20180316145021.8517-1-jbrunet at baylibre.com

Jerome Brunet (2):
  nvmem: meson-efuse: remove econfig global
  nvmem: meson-efuse: add write support

 drivers/nvmem/meson-efuse.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

-- 
2.14.3
