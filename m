From: jbrunet@baylibre.com (Jerome Brunet)
Date: Wed, 29 Aug 2018 17:00:49 +0200
Subject: [PATCH 2/4] ASoC: dmic: add DT module alias
In-Reply-To: <20180829150051.18190-1-jbrunet@baylibre.com>
References: <20180829150051.18190-1-jbrunet@baylibre.com>
Message-ID: <20180829150051.18190-3-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Before this patch the only alias provided by the dmic module is:
alias:          platform:dmic-codec

Device instantiated from DT will not probe automatically with this

After this patch, here is the new alias list:
alias:          platform:dmic-codec
alias:          of:N*T*Cdmic-codecC*
alias:          of:N*T*Cdmic-codec

Now the dmic codec probes automatically when instantiated from DT.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/dmic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/dmic.c b/sound/soc/codecs/dmic.c
index 8c4926df9286..71322e0410ee 100644
--- a/sound/soc/codecs/dmic.c
+++ b/sound/soc/codecs/dmic.c
@@ -148,6 +148,7 @@ static const struct of_device_id dmic_dev_match[] = {
 	{.compatible = "dmic-codec"},
 	{}
 };
+MODULE_DEVICE_TABLE(of, dmic_dev_match);
 
 static struct platform_driver dmic_driver = {
 	.driver = {
-- 
2.17.1
