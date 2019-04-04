Return-Path: <SRS0=arCo=SG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 762B9C10F13
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 11:17:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 460FD20855
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 11:17:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="STV9xLVv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="E5iEIKYS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 460FD20855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9188oR0yCgxiaxDnAB8Oyp9AGjRhbRUt+UmIn3gr9I=; b=STV9xLVvrDDBvo
	RITL5ctD4IItSiVtlYx3SqPVQilbmEM216apdIeDA+9wVsaL2UjdHk4zhufiK3/yHneMO9VC3lc0Y
	TM+6Ehq2mcMa2a1wOZC1IZxs6FL3l7qkFptttcLKXSbOoOyIfW0mYTNugfYDLpLUpJwPNNl1SjXfM
	kfx8pgBbrT/e6DoyOzAtL1s1IuUagbJEwCFD6IzAX/TDDpAFbsTegmO9+TkRJoRKfBe1XOeyU+0bQ
	8SVnjH2I3wZc7QU4dh5HsmkN8KcOakXS+FpuqBs+rkvsOTWH6unk53T2lvjClZq2T6w1yA/Po7tvl
	P5lXL0lFkEKnrg3N6cCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hC0NV-00046Z-I2; Thu, 04 Apr 2019 11:17:53 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC0NR-00041x-Fb
 for linux-amlogic@lists.infradead.org; Thu, 04 Apr 2019 11:17:50 +0000
Received: by mail-wr1-x442.google.com with SMTP id j9so3266604wrn.6
 for <linux-amlogic@lists.infradead.org>; Thu, 04 Apr 2019 04:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+G25AdD9UpKYT+FRpEdmoxxTPv+X6Dc3Bb+5yQ5rUQI=;
 b=E5iEIKYSXouaY/d+tsB/s0MRtE3XExjw7NpnCw76gtdhv1qmhIx+POHVv7gQ4/CO9K
 zkteUnOKOplbTxRFZr/Pr43f+83IiBuNFxTA5KNQs0IzfH67OZo3X2QWadDDXqpHUmGo
 9jieA7004kk3qvwU++oh4lH5pfpCwHFDRCV3k6K5Krl0SPNSCaNHrbopj31kGmRNsdD9
 iONculrcr5Uxhyo4vzvSnBHMFdj19/Dm/+0xWqyegC4+CQfeu9UBlu9xT2N9cv0/ynG0
 YQj8iBCDcpiYCqLkRzZ+V0SrSOlpna2m34xMf+tCo6krou8+rlljMzb1OoQnU4UBLKTc
 Go7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+G25AdD9UpKYT+FRpEdmoxxTPv+X6Dc3Bb+5yQ5rUQI=;
 b=iL/b1kKh/Gg9ekXpm7jN7D0w9drqA8dQZpk/quVGTHwWONQCzMQAyx2h5wUyX3GaPN
 Rmuc+38PwkmatWHt0GCPQ4cGh3Fw38wFoxUnt51hIXVMNvro5XcauuzB0erOCqy1ISX+
 BIa1EfHg9EoBuWOwdoRZbPGzkKDfBNpigZc77R/gKodbM1pSLLNxX85PZHSn41RqD3Yl
 wfpNbukde+EMOyeD+R4awCklvGNcpE/s6sIXUKyLIDIS0usmd4V6Hm3j9I1LiiWoN3p6
 5C7iqZuJPogsgIqelv2SesD4Mf3mkBYUguqa0EvFHWhT5wf380p3jB1gM0P+z1v/vBiR
 zypA==
X-Gm-Message-State: APjAAAUn7fKZgqJ93jecXbtzwHWMOeWAOjsYhaIB4mX0cECWfZzjsYx/
 UMLO4ltKgjj1g2OsBQWAvVDadQ==
X-Google-Smtp-Source: APXvYqwfqrMj9GRNNQ3QPnSD7zxnhyRZVlxbavi8YCKbEoOv6wJhmYFDfpL59xwEpJUadRzcm3Q6/g==
X-Received: by 2002:a5d:63c5:: with SMTP id c5mr3875543wrw.82.1554376667826;
 Thu, 04 Apr 2019 04:17:47 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id z23sm9024771wma.0.2019.04.04.04.17.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 04 Apr 2019 04:17:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 2/6] ASoC: meson: axg-fifo: add g12a support
Date: Thu,  4 Apr 2019 13:17:29 +0200
Message-Id: <20190404111733.28705-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190404111733.28705-1-jbrunet@baylibre.com>
References: <20190404111733.28705-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_041749_542411_FCA108B2 
X-CRM114-Status: GOOD (  14.04  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Maxime Jourdan <mjourdan@baylibre.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The g12a fifos gained the ability to set the initial address of the
pointer within the buffer, instead of defaulting to the buffer start
address.

It is not very useful to us (yet) but we need to put a copy the buffer
start address in the related register for the fifo to work properly on the
g12a SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-fifo.c | 34 +++++++++++++++++++++++++++++++---
 sound/soc/meson/axg-fifo.h |  2 ++
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 75e5e480fda2..01c1c7db2510 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -19,7 +19,7 @@
  * This file implements the platform operations common to the playback and
  * capture frontend DAI. The logic behind this two types of fifo is very
  * similar but some difference exist.
- * These differences the respective DAI drivers
+ * These differences are handled in the respective DAI drivers
  */
 
 static struct snd_pcm_hardware axg_fifo_hw = {
@@ -133,6 +133,23 @@ static int axg_fifo_pcm_hw_params(struct snd_pcm_substream *ss,
 	return 0;
 }
 
+static int g12a_fifo_pcm_hw_params(struct snd_pcm_substream *ss,
+				   struct snd_pcm_hw_params *params)
+{
+	struct axg_fifo *fifo = axg_fifo_data(ss);
+	struct snd_pcm_runtime *runtime = ss->runtime;
+	int ret;
+
+	ret = axg_fifo_pcm_hw_params(ss, params);
+	if (ret)
+		return ret;
+
+	/* Set the initial memory address of the DMA */
+	regmap_write(fifo->map, FIFO_INIT_ADDR, runtime->dma_addr);
+
+	return 0;
+}
+
 static int axg_fifo_pcm_hw_free(struct snd_pcm_substream *ss)
 {
 	struct axg_fifo *fifo = axg_fifo_data(ss);
@@ -262,6 +279,17 @@ const struct snd_pcm_ops axg_fifo_pcm_ops = {
 };
 EXPORT_SYMBOL_GPL(axg_fifo_pcm_ops);
 
+const struct snd_pcm_ops g12a_fifo_pcm_ops = {
+	.open =		axg_fifo_pcm_open,
+	.close =        axg_fifo_pcm_close,
+	.ioctl =	snd_pcm_lib_ioctl,
+	.hw_params =	g12a_fifo_pcm_hw_params,
+	.hw_free =      axg_fifo_pcm_hw_free,
+	.pointer =	axg_fifo_pcm_pointer,
+	.trigger =	axg_fifo_pcm_trigger,
+};
+EXPORT_SYMBOL_GPL(g12a_fifo_pcm_ops);
+
 int axg_fifo_pcm_new(struct snd_soc_pcm_runtime *rtd, unsigned int type)
 {
 	struct snd_card *card = rtd->card->snd_card;
@@ -278,7 +306,7 @@ static const struct regmap_config axg_fifo_regmap_cfg = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
-	.max_register	= FIFO_STATUS2,
+	.max_register	= FIFO_INIT_ADDR,
 };
 
 int axg_fifo_probe(struct platform_device *pdev)
@@ -339,6 +367,6 @@ int axg_fifo_probe(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(axg_fifo_probe);
 
-MODULE_DESCRIPTION("Amlogic AXG fifo driver");
+MODULE_DESCRIPTION("Amlogic AXG/G12A fifo driver");
 MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/meson/axg-fifo.h b/sound/soc/meson/axg-fifo.h
index d9f516cfbeda..5caf81241dfe 100644
--- a/sound/soc/meson/axg-fifo.h
+++ b/sound/soc/meson/axg-fifo.h
@@ -60,6 +60,7 @@ struct snd_soc_pcm_runtime;
 #define FIFO_STATUS1			0x14
 #define  STATUS1_INT_STS(x)		((x) << 0)
 #define FIFO_STATUS2			0x18
+#define FIFO_INIT_ADDR			0x24
 
 struct axg_fifo {
 	struct regmap *map;
@@ -74,6 +75,7 @@ struct axg_fifo_match_data {
 };
 
 extern const struct snd_pcm_ops axg_fifo_pcm_ops;
+extern const struct snd_pcm_ops g12a_fifo_pcm_ops;
 
 int axg_fifo_pcm_new(struct snd_soc_pcm_runtime *rtd, unsigned int type);
 int axg_fifo_probe(struct platform_device *pdev);
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
