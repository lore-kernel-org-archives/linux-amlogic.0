From: jbrunet@baylibre.com (Jerome Brunet)
Date: Thu, 26 Jul 2018 14:45:42 +0200
Subject: [PATCH 1/3] ASoC: meson: use IRQ_RETVAL in the fifo irq handler
In-Reply-To: <20180726124544.14740-1-jbrunet@baylibre.com>
References: <20180726124544.14740-1-jbrunet@baylibre.com>
Message-ID: <20180726124544.14740-2-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Use IRQ_RETVAL instead of the open coded ternary operation.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-fifo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index db367d85290f..30262550e37b 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -174,7 +174,7 @@ static irqreturn_t axg_fifo_pcm_irq_block(int irq, void *dev_id)
 	/* Ack irqs */
 	axg_fifo_ack_irq(fifo, status);
 
-	return !status ? IRQ_NONE : IRQ_HANDLED;
+	return IRQ_RETVAL(status);
 }
 
 static int axg_fifo_pcm_open(struct snd_pcm_substream *ss)
-- 
2.17.1
