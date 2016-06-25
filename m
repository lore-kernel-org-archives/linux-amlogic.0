From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 25 Jun 2016 18:50:10 +0200
Subject: [RFC] meson: add support for configuring the ethernet clocks
Message-ID: <20160625165013.15917-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This adds support for configuring the PRG_ETHERNET_ADDR registers on
Meson 8b (S805) and GXBB (S905) devices. The registers there are
completely different from those found in the earlier Meson 6b SoC
series, which is why a new driver was implemented.

This configuration is required when the bootloader does not configure
these registers based on the connected PHY. Symptoms are that the
DWMAC device is detected, but no packets are getting through, even
though everything else is configured correctly.
