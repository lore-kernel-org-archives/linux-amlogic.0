From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri,  9 Nov 2018 15:20:58 +0100
Subject: [PATCH u-boot 0/2] net: designware: add meson meson compatibles
Message-ID: <1541773260-16197-1-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add the compatible strings in the Synopsys DWMAC driver for :
- The Amlogic GXBB (and other GX) SoC
- The Amlogic AXG (and other GX) SoC

Neil Armstrong (2):
  net: designware: add meson meson gxbb comptatible
  net: designware: add meson meson axg compatible

 drivers/net/designware.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.7.4
