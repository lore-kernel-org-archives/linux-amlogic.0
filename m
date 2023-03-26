Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50B9C6FD1C
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Mar 2023 12:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vVrmubFDL9wbsN44Tmdh7n3i4OYENDhKWzteZjjPvrs=; b=xojzCmO7C4Dw7i
	TiA+4iLMvTHGD59YqBeMGsMY/9C9HgcEDnpEms9uMPOogW4kPPUJn51EDSje0vaYjCnZyGh/0UjLY
	8kMN7nXclvBQfxsebxQ+nkDvtjV0hJMrQPB6OsupTHtzh3U8UHtRv2XfqygDkTYzyQPEQE1GAIOze
	AtysmXCXyodilf+nuvZ5CDtb+LEjQaxt2kv68woUBjiAGEEdiKizQ0+PTBcPRF+Pj2A5x2vLekjUC
	TAKQFcPywgGbsy0sXfSh9PNEhI9/ZLwwuA5ppP2nZagQx618Grb1ImyqKhXmu7D5QXVSN8/2t+/jF
	5AVI/XB+g88xOxnkjJ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgPiv-008QLi-36;
	Sun, 26 Mar 2023 12:43:49 +0000
Received: from smtp-26.smtpout.orange.fr ([80.12.242.26] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgPir-008QKX-2t
	for linux-amlogic@lists.infradead.org;
	Sun, 26 Mar 2023 12:43:47 +0000
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id gPimpclLpV6zQgPimpzJp6; Sun, 26 Mar 2023 14:43:42 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 26 Mar 2023 14:43:42 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH] ASoC: meson: Use the devm_clk_get_optional() helper
Date: Sun, 26 Mar 2023 14:43:38 +0200
Message-Id: <8dab942d6ce47657a9c038295959be80bb2ee09e.1679834598.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_054346_071912_786DFEE8 
X-CRM114-Status: GOOD (  12.12  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Use devm_clk_get_optional() instead of hand writing it.
This saves some loC and improves the semantic.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/meson/axg-tdm-interface.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index 7624aafe9009..5e5e4c56d505 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -496,7 +496,7 @@ static int axg_tdm_iface_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct snd_soc_dai_driver *dai_drv;
 	struct axg_tdm_iface *iface;
-	int ret, i;
+	int i;
 
 	iface = devm_kzalloc(dev, sizeof(*iface), GFP_KERNEL);
 	if (!iface)
@@ -533,14 +533,9 @@ static int axg_tdm_iface_probe(struct platform_device *pdev)
 	 * At this point, ignore the error if mclk is missing. We'll
 	 * throw an error if the cpu dai is master and mclk is missing
 	 */
-	iface->mclk = devm_clk_get(dev, "mclk");
-	if (IS_ERR(iface->mclk)) {
-		ret = PTR_ERR(iface->mclk);
-		if (ret == -ENOENT)
-			iface->mclk = NULL;
-		else
-			return dev_err_probe(dev, ret, "failed to get mclk\n");
-	}
+	iface->mclk = devm_clk_get_optional(dev, "mclk");
+	if (IS_ERR(iface->mclk))
+		return dev_err_probe(dev, PTR_ERR(iface->mclk), "failed to get mclk\n");
 
 	return devm_snd_soc_register_component(dev,
 					&axg_tdm_iface_component_drv, dai_drv,
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
