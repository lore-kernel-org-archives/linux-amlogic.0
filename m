Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60598C27C4F
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Jun 2024 15:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jeph7jkaQ8pFyU9jcoT4/KDrDP85EiA3cmcPmAhFIeM=; b=ieq5ig2JRh3Zb1
	RUXs4wzFKh2VarucPYak5hbiaMMkU3qiLhble318XM3J/CevNmbLjIdCLe3FUFEX1v0v1+KyxHKN1
	kCqJjJOmOsODlYE3DcRuuQusLaBsA1nbBxOZSh2GN/mjeru1ALiTNoZJCTxHVrOGRA3VoQ+SwEbjN
	8rA0SdfyAlRtTYZ2A0R/l3C5NOwthvOktSHtjxMhuDUcFpCVw1227c/OVLBjZJvEpExXtoMmU29Yv
	dHOuHLWPZ4TQhcimnQtORzmu+dovLKaMrzTSb2L0iNXKO0Kfl5OafaVNGOy3AzFgeBt8pq/Olovji
	GrQjPoQUlJtap33gQzGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKgBa-00000009kR2-0JU0;
	Fri, 21 Jun 2024 15:28:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKgBY-00000009kQS-1ohH
	for linux-amlogic@bombadil.infradead.org;
	Fri, 21 Jun 2024 15:28:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=zuRlc7IEeKBSuNeuh4vULjLGZ2xrirIJS5lO/xFvBe0=; b=IXp8lh8TjcbAgbHTRINrW8Idwc
	VeGZ9klwYaQUJZKX0M21sfT2CuWcLDaEc7GNKl8QV65mIGplKzvjdkkPZH425i7Rs18RHVCm/Yi5J
	GPf4SN7rECn/n1kwAJ6Znv0asHexumtD7iSr2/U+41Em0UYuSjDwVOuYDAlxOd61F//b4L5BLwE0C
	N9x8phRas6VTm5vPYmEaEQ+3jjIt7ttw3zz/wk4cLyeSRPU3KVZ2OSlk0yy6Khe2OQ0VKIA7ty/jb
	9Ek/Zk29v63o+YmwtSKmG/uowEoj0GgrCR/q9z9ObP5yhhJSvHt/ABzY/jT2unr+2RO8JcI8WUg+G
	8tqjm4Vw==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKgBV-00000007jAm-1xAl
	for linux-amlogic@lists.infradead.org;
	Fri, 21 Jun 2024 15:28:19 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sKgBR-0000A9-Ek; Fri, 21 Jun 2024 17:28:13 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Fri, 21 Jun 2024 17:28:12 +0200
Subject: [PATCH] reset: meson-audio-arb: Use devm_clk_get_enabled()
MIME-Version: 1.0
Message-Id: <20240621-reset-devm-clk-get-enabled-v1-1-8408c7962b6c@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAAucdWYC/x3MQQqDMBAF0KvIrDtgpuKiV5EuNPOjgzaWpARBv
 HuDy7d5J2UkQ6ZXc1JCsWx7rHCPhvwyxhlsWk3SStf24jgh48eK8mG/rTxXII7TBmXV8Jx6FyB
 eqAbfhGDHnQ/v6/oD0qZ/zWwAAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.14-dev
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_162817_669049_C235D9DB 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

Use devm_clk_get_enabled() to reduce a bit of boilerplate and to
disable the clock in case devm_reset_controller_register() fails.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/reset-meson-audio-arb.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/reset/reset-meson-audio-arb.c b/drivers/reset/reset-meson-audio-arb.c
index 7891d52fa899..894ad9d37a66 100644
--- a/drivers/reset/reset-meson-audio-arb.c
+++ b/drivers/reset/reset-meson-audio-arb.c
@@ -129,8 +129,6 @@ static int meson_audio_arb_remove(struct platform_device *pdev)
 	writel(0, arb->regs);
 	spin_unlock(&arb->lock);
 
-	clk_disable_unprepare(arb->clk);
-
 	return 0;
 }
 
@@ -150,7 +148,7 @@ static int meson_audio_arb_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, arb);
 
-	arb->clk = devm_clk_get(dev, NULL);
+	arb->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(arb->clk))
 		return dev_err_probe(dev, PTR_ERR(arb->clk), "failed to get clock\n");
 
@@ -170,11 +168,6 @@ static int meson_audio_arb_probe(struct platform_device *pdev)
 	 * In the initial state, all memory interfaces are disabled
 	 * and the general bit is on
 	 */
-	ret = clk_prepare_enable(arb->clk);
-	if (ret) {
-		dev_err(dev, "failed to enable arb clock\n");
-		return ret;
-	}
 	writel(BIT(ARB_GENERAL_BIT), arb->regs);
 
 	/* Register reset controller */

---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240621-reset-devm-clk-get-enabled-ddf3b61fe2c2

Best regards,
-- 
Philipp Zabel <p.zabel@pengutronix.de>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
