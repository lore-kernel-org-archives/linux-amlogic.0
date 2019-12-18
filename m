Return-Path: <SRS0=A4ao=2I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD4FEC2D0D2
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 20:05:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 815B7227BF
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 20:05:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bC80dv7n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 815B7227BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=1SnwQ+AaN2D1KkLnhMdh2tsG7i1rKWY6CA3LbXo5ZdY=; b=bC8
	0dv7nfqyFJWbcGRnaoQRi5p9JCNXdgN4np5XN1/MTyKAkud5ppsjt8jOFE3f9R5PjA8uSGOX3hIQN
	mpv2FEAlJ9U9KD5mWIVgcCGuQ2eAxjJo/MXIaBk3DXkQps8AY/DEfq6tm3re8Cg0CmUh3HVWoqC5Y
	bYbbDcZau1+v3JmJe+kPT4skCb3Bx0FGWhfinhjmekvK0NZa7yHpIKMBlzshN8b0UVZ+ewjt5bili
	YZxXlezowc6YXwTn7N//DIFiTgU0NOLp7GOln+lXYbJ2Zb4IHrXQo5zIC2jqWu4VfUL/CKMtw8YJQ
	uu0hyfLcaFahRRvy7mt6Ll3HMNL6xvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihfZo-0006Sn-6X; Wed, 18 Dec 2019 20:05:44 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihfZk-0006Qt-W2
 for linux-amlogic@lists.infradead.org; Wed, 18 Dec 2019 20:05:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8369611FB;
 Wed, 18 Dec 2019 12:05:40 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3F263F67D;
 Wed, 18 Dec 2019 12:05:39 -0800 (PST)
Date: Wed, 18 Dec 2019 20:05:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Applied "ASoC: meson: axg-fifo: improve depth handling" to the asoc
 tree
In-Reply-To: <20191218172420.1199117-4-jbrunet@baylibre.com>
Message-Id: <applied-20191218172420.1199117-4-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_120541_118393_3D4951A4 
X-CRM114-Status: GOOD (  21.08  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The patch

   ASoC: meson: axg-fifo: improve depth handling

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 23b89e1d62c75f2c1985449e968886e8a97860c0 Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 18 Dec 2019 18:24:19 +0100
Subject: [PATCH] ASoC: meson: axg-fifo: improve depth handling

Let the fifo driver parse the fifo depth from DT. Eventually all DT should
have this property. Until it is actually the case, default to 256 bytes if
the property is missing. 256 bytes is the size of the smallest fifo on the
supported SoCs.

On the supported SoC, fifo A is usually bigger than the other ones.  With
depth known, we can improve the usage of the fifo and adapt the setup of
request threshold.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20191218172420.1199117-4-jbrunet@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/axg-fifo.c  | 19 +++++++++++++++++--
 sound/soc/meson/axg-fifo.h  |  1 +
 sound/soc/meson/axg-frddr.c | 13 ++++---------
 3 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 4365086c9a31..c2742a02d866 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -132,8 +132,7 @@ int axg_fifo_pcm_hw_params(struct snd_soc_component *component,
 	 * - Half the fifo size
 	 * - Half the period size
 	 */
-	threshold = min(period / 2,
-			(unsigned int)AXG_FIFO_MIN_DEPTH / 2);
+	threshold = min(period / 2, fifo->depth / 2);
 
 	/*
 	 * With the threshold in bytes, register value is:
@@ -320,6 +319,7 @@ int axg_fifo_probe(struct platform_device *pdev)
 	const struct axg_fifo_match_data *data;
 	struct axg_fifo *fifo;
 	void __iomem *regs;
+	int ret;
 
 	data = of_device_get_match_data(dev);
 	if (!data) {
@@ -370,6 +370,21 @@ int axg_fifo_probe(struct platform_device *pdev)
 	if (IS_ERR(fifo->field_threshold))
 		return PTR_ERR(fifo->field_threshold);
 
+	ret = of_property_read_u32(dev->of_node, "amlogic,fifo-depth",
+				   &fifo->depth);
+	if (ret) {
+		/* Error out for anything but a missing property */
+		if (ret != -EINVAL)
+			return ret;
+		/*
+		 * If the property is missing, it might be because of an old
+		 * DT. In such case, assume the smallest known fifo depth
+		 */
+		fifo->depth = 256;
+		dev_warn(dev, "fifo depth not found, assume %u bytes\n",
+			 fifo->depth);
+	}
+
 	return devm_snd_soc_register_component(dev, data->component_drv,
 					       data->dai_drv, 1);
 }
diff --git a/sound/soc/meson/axg-fifo.h b/sound/soc/meson/axg-fifo.h
index c442195ba191..521b54e98fd3 100644
--- a/sound/soc/meson/axg-fifo.h
+++ b/sound/soc/meson/axg-fifo.h
@@ -68,6 +68,7 @@ struct axg_fifo {
 	struct clk *pclk;
 	struct reset_control *arb;
 	struct regmap_field *field_threshold;
+	unsigned int depth;
 	int irq;
 };
 
diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
index df104303351f..c3ae8ac30745 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -50,7 +50,7 @@ static int axg_frddr_dai_startup(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
 	struct axg_fifo *fifo = snd_soc_dai_get_drvdata(dai);
-	unsigned int fifo_depth;
+	unsigned int val;
 	int ret;
 
 	/* Enable pclk to access registers and clock the fifo ip */
@@ -61,15 +61,10 @@ static int axg_frddr_dai_startup(struct snd_pcm_substream *substream,
 	/* Apply single buffer mode to the interface */
 	regmap_update_bits(fifo->map, FIFO_CTRL0, CTRL0_FRDDR_PP_MODE, 0);
 
-	/*
-	 * TODO: We could adapt the fifo depth and the fifo threshold
-	 * depending on the expected memory throughput and lantencies
-	 * For now, we'll just use the same values as the vendor kernel
-	 * Depth and threshold are zero based.
-	 */
-	fifo_depth = AXG_FIFO_MIN_CNT - 1;
+	/* Use all fifo depth */
+	val = (fifo->depth / AXG_FIFO_BURST) - 1;
 	regmap_update_bits(fifo->map, FIFO_CTRL1, CTRL1_FRDDR_DEPTH_MASK,
-			   CTRL1_FRDDR_DEPTH(fifo_depth));
+			   CTRL1_FRDDR_DEPTH(val));
 
 	return 0;
 }
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
