Return-Path: <SRS0=5QiQ=UK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 368D0C43218
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2019 13:59:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B65C206BB
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2019 13:59:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EmOSsoY1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="EzeY2hPj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B65C206BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5zBnN1M03i9nRZVhdf3ebLeHbazdgHfb6HFg+dLI5MQ=; b=EmOSsoY1aDSwJA
	E3MM+qJ3N/RS81NW9+xNtDk44+pRA2xh8a6W8bFgVQmj6DeN9c1d8XXcZWRJQJYL7bwXlsKFzf22o
	ilyNRf2+vl6dPjLoQmFTBFXqOGo32vuvkou5oUSCHIfPyZAQQs9i/Kkt67XVoO1J3D+kOf6/cWQs+
	j68l59yHul2qmYoXrt5ndsiCN1uXardb9/l3I9ekbYoZw+OFFnIigYfW3BLS8raDlDY7jr/JGnZvb
	+h4DzDy1x4EqmRfBj/4JtdrhGNBAOJU3m6/51CGpzvPT8A+Xd3ygMJGxCGXmvswfxUdLauGdXhDHc
	Do3Wa9S2EM2FyoE1hBog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hahIW-0005Hs-LT; Tue, 11 Jun 2019 13:58:48 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hahIT-0005H1-Jg
 for linux-amlogic@lists.infradead.org; Tue, 11 Jun 2019 13:58:47 +0000
Received: by mail-wm1-x341.google.com with SMTP id u8so3069877wmm.1
 for <linux-amlogic@lists.infradead.org>; Tue, 11 Jun 2019 06:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vKGIIEZ1EWhF8d9VHamuiFuthqcJ8PCoZC+PlSBmz6w=;
 b=EzeY2hPjuYcKKephwbA2K1k8wINtGW9iU2baby+Xliqe1XCNSRPc1BDCV0c7P2Cfyq
 fiswGap6+7EHJyYD4nFTEmjDAndmmuLpxkj0z6N8Si5dC3jZyenH1cLi8DdmoDNfj4ba
 ARQ8YUjx20+dGQtgThBUX9sUMXH4R3nlFlzRiYIEV3Zey05eBOYBfJFFwmCPkmO9Gn1a
 uOoUwOPFvWqAhOOAmKWhhM2wZ98IENtfIHlORA/cK+Qf8dR8LC/pGpZmW1ELLdhHk+Pq
 ydAqAkXyQU1W/SahLXNTTwrpSDtKRdWPjj0lKnHPvnDVgef+NAYipXlO8rplYVr932Yj
 fiwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vKGIIEZ1EWhF8d9VHamuiFuthqcJ8PCoZC+PlSBmz6w=;
 b=LiYOO23X0PakFshL18aaTHLHF10M5OqkTR7p4J6ia74Go51bhf2hQhdriGrbbPrF15
 W7D0jlmlMZDu4/Ew3Z0ppSIZ910CzS1oZLci8T5egUD8pqLEhFhkl9Y2480UMktTNuok
 i6cbevzHK0hMcnCGPJLO/RwfYQF4QMROgoSvJLYmIy29NALlZ+OKZs/xZXugZNT38D5p
 pPRBm7rfkLuNw+4H3fiEZllqobQM5Qxu+9lFpj6++fjr0ndlJ/mOyHSaL261X+t3jxYi
 LVeMZ1HPwfHlqIGV0z3FC2mnBccJkWse+k3T8UOqw6y0F/3REG4eqL62Qlke8m0JUnSH
 YuGw==
X-Gm-Message-State: APjAAAW03yxc/44S3QGG/6lHkseGAqsUxm3MIL/6YnSenbf9notXhhxV
 GopfgqDW2gUttBwM+x3xhy8Xxw==
X-Google-Smtp-Source: APXvYqzt0u8aL8eNXkVgF2OmeqrddaS2cdZwbIEkydNhWGlivtGsTJEGph122kdnU4rK2V5IkAeWDw==
X-Received: by 2002:a05:600c:389:: with SMTP id
 w9mr17129874wmd.139.1560261523914; 
 Tue, 11 Jun 2019 06:58:43 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c16sm12317446wrr.53.2019.06.11.06.58.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 11 Jun 2019 06:58:43 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: balbi@kernel.org
Subject: [PATCH] usb: dwc3: meson-g12a: Add support for IRQ based OTG switching
Date: Tue, 11 Jun 2019 15:58:42 +0200
Message-Id: <20190611135842.8396-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_065845_678288_2E629B39 
X-CRM114-Status: GOOD (  12.30  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add support for the OTG ID change interrupt to switch between Host
and Device mode.

Tested on the Hardkernel Odroid-N2 board.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 32 ++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 2aec31a2eacb..e5c5ad0d529e 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -348,6 +348,22 @@ static enum usb_role dwc3_meson_g12a_role_get(struct device *dev)
 		USB_ROLE_HOST : USB_ROLE_DEVICE;
 }
 
+static irqreturn_t dwc3_meson_g12a_irq_thread(int irq, void *data)
+{
+	struct dwc3_meson_g12a *priv = data;
+	enum phy_mode otg_id;
+
+	otg_id = dwc3_meson_g12a_get_id(priv);
+	if (otg_id != priv->otg_phy_mode) {
+		if (dwc3_meson_g12a_otg_mode_set(priv, otg_id))
+			dev_warn(priv->dev, "Failed to switch OTG mode\n");
+	}
+
+	regmap_update_bits(priv->regmap, USB_R5, USB_R5_ID_DIG_IRQ, 0);
+
+	return IRQ_HANDLED;
+}
+
 static struct device *dwc3_meson_g12_find_child(struct device *dev,
 						const char *compatible)
 {
@@ -374,7 +390,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 	void __iomem *base;
 	struct resource *res;
 	enum phy_mode otg_id;
-	int ret, i;
+	int ret, i, irq;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -436,6 +452,19 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 	/* Get dr_mode */
 	priv->otg_mode = usb_get_dr_mode(dev);
 
+	if (priv->otg_mode == USB_DR_MODE_OTG) {
+		/* Ack irq before registering */
+		regmap_update_bits(priv->regmap, USB_R5,
+				   USB_R5_ID_DIG_IRQ, 0);
+
+		irq = platform_get_irq(pdev, 0);
+		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
+						dwc3_meson_g12a_irq_thread,
+						IRQF_ONESHOT, pdev->name, priv);
+		if (ret)
+			return ret;
+	}
+
 	dwc3_meson_g12a_usb_init(priv);
 
 	/* Init PHYs */
@@ -460,7 +489,6 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 
 	/* Setup OTG mode corresponding to the ID pin */
 	if (priv->otg_mode == USB_DR_MODE_OTG) {
-		/* TOFIX Handle ID mode toggling via IRQ */
 		otg_id = dwc3_meson_g12a_get_id(priv);
 		if (otg_id != priv->otg_phy_mode) {
 			if (dwc3_meson_g12a_otg_mode_set(priv, otg_id))
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
