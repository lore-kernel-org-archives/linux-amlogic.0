Return-Path: <SRS0=MCOz=W4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F556C3A5A4
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Sep 2019 10:46:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F358021897
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Sep 2019 10:46:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oqYfv9eH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F358021897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=triplefau.lt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JmycvSfjvJIjvLz9Bzvci2uTSWPwWhQtOW3f9r8vYNs=; b=oqYfv9eHRJakFa
	kIUhPlSVpHgkB4hN/NyYgVNntfUFgRBQHDS724JoprHbMInltrBjI3pwV+gJjSXxo2HuzHt0xbeku
	+UUr5K0Qe1pN+ipgPn84Jj5yDshYMPMbjMJKBBS/g0NZsR3F7QrztIUYzLp8w+Ke1nQm1ln8Oh7LK
	hT6WQzZia11BIAUstGCDOqSDUbqQ7gXAadjwZOyPJJzr33hX+b9Bd4VFsFr3qO0tv9r8L7o+vhX/p
	/aMtaHL9UaUbsfZ7ELrvSr01tTMWFdn4V6XEd2QU9iPXlD7U45kwbcs9jYKLN117/Jl9rBkZyN2dC
	mtZilARPt+uazDu5ekMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4NN4-0004j5-PN; Sun, 01 Sep 2019 10:46:10 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4NN1-0004gg-Uo; Sun, 01 Sep 2019 10:46:09 +0000
X-Originating-IP: 88.190.179.123
Received: from localhost (unknown [88.190.179.123])
 (Authenticated sender: repk@triplefau.lt)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id EFF7460004;
 Sun,  1 Sep 2019 10:45:47 +0000 (UTC)
From: Remi Pommarel <repk@triplefau.lt>
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] iio: adc: meson_saradc: Fix memory allocation order
Date: Sun,  1 Sep 2019 12:54:10 +0200
Message-Id: <20190901105410.23567-1-repk@triplefau.lt>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190901_034608_191981_C65D6946 
X-CRM114-Status: GOOD (  10.18  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Elie Roudninski <xademax@gmail.com>, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Remi Pommarel <repk@triplefau.lt>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

meson_saradc's irq handler uses priv->regmap so make sure that it is
allocated before the irq get enabled.

This also fixes crash when CONFIG_DEBUG_SHIRQ is enabled, as device
managed resources are freed in the inverted order they had been
allocated, priv->regmap was freed before the spurious fake irq that
CONFIG_DEBUG_SHIRQ adds called the handler.

Reported-by: Elie Roudninski <xademax@gmail.com>
Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 drivers/iio/adc/meson_saradc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 7b28d045d271..7b27306330a3 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -1219,6 +1219,11 @@ static int meson_sar_adc_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	priv->regmap = devm_regmap_init_mmio(&pdev->dev, base,
+					     priv->param->regmap_config);
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
+
 	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
 	if (!irq)
 		return -EINVAL;
@@ -1228,11 +1233,6 @@ static int meson_sar_adc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	priv->regmap = devm_regmap_init_mmio(&pdev->dev, base,
-					     priv->param->regmap_config);
-	if (IS_ERR(priv->regmap))
-		return PTR_ERR(priv->regmap);
-
 	priv->clkin = devm_clk_get(&pdev->dev, "clkin");
 	if (IS_ERR(priv->clkin)) {
 		dev_err(&pdev->dev, "failed to get clkin\n");
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
