From: jbrunet@baylibre.com (Jerome Brunet)
Date: Wed, 29 Aug 2018 17:00:48 +0200
Subject: [PATCH 1/4] ASoC: dmic: add Kconfig prompt for the generic dmic codec.
In-Reply-To: <20180829150051.18190-1-jbrunet@baylibre.com>
References: <20180829150051.18190-1-jbrunet@baylibre.com>
Message-ID: <20180829150051.18190-2-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add Kconfig prompt for the generic digital mic to make it configurable
through menuconfig

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/Kconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index adaf26e1989c..9989d35e0fc6 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -578,7 +578,11 @@ config SND_SOC_DA9055
 	tristate
 
 config SND_SOC_DMIC
-	tristate
+	tristate "Generic Digital Microphone CODEC"
+	depends on GPIOLIB
+	help
+	  Enable support for the Generic Digital Microphone CODEC.
+	  Select this if your sound card has DMICs.
 
 config SND_SOC_HDMI_CODEC
 	tristate
-- 
2.17.1
