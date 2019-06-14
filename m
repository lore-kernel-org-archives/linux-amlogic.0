Return-Path: <SRS0=Cb+X=UN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E63C31E44
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jun 2019 08:59:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79D3020866
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jun 2019 08:59:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PWivuHSA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ygwDU90/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79D3020866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f9I14bSYNjUgvRSZnlQaLtk6dhaXHKjZB1CVEihgPt0=; b=PWivuHSAfp4ZFf
	TlzNXcAupX2Ncvv/EXxguBwSoNO1Hf0m7SOjK8Bpchjl4gMuS6JKctnKlD6fnFowqBMDXO9ElCPUe
	xoVmTsTorzSbtWejLz4WgK6KO064xdTUVWGc1gJO6omOD7NvwUFKrNlceQD6mlzsi9wzQxmfCGkv8
	meeY3uJv2p30drD7ihQpu6v/0vyXZ+mxYXv0WIYE1B1RvwRdNyhv6V+gb7KWPqtUv+MBYeYaEyPkj
	pcO0XDhqTkfG8LnvlhfQ2CK9w/S0P7DZPiknQvIcg6SuzeFPZ4ethfXm/ypH6u5Qw74QhWxPjptcm
	3BWDUecR/gE+KpLfm4Hw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbi2Z-0001YS-Ed; Fri, 14 Jun 2019 08:58:31 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbi2W-0001Xn-RH
 for linux-amlogic@lists.infradead.org; Fri, 14 Jun 2019 08:58:30 +0000
Received: by mail-wr1-x442.google.com with SMTP id p11so1649173wre.7
 for <linux-amlogic@lists.infradead.org>; Fri, 14 Jun 2019 01:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nQzfi5pCNjbWy0L+GM97E8S0hKWGfnv4Ct4OLdEoTWQ=;
 b=ygwDU90/bi1g10z7gM0VCKByS/vE0RY0Mqms4KLT+5oQ8yni0T9alBS4/LbqjjUU8O
 CMduCLq82OBf0/FCW23pRrjy6MPK3NlzWhoH2X2Kx0CLV8aegxIuYVPevaekx8eHrss1
 2SsMq88cy1p8HtUW4cQ2/e6dTbgSu/GBTp5TI5V2dUrTXe+7OJOUBrkdFyYnltCRimqR
 grgDVsfyIznazMBGeb/RtN+LCMdoksG65JataHHx8nXm9CigDVyvIA5ne0TRENQz3BVl
 fgX4hegRPe7emSbCUv+wQJZP8+VsTYA+Eaf1zHePeoAuTmsOtbHKRWfi2ktbxcpBxAcs
 9chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nQzfi5pCNjbWy0L+GM97E8S0hKWGfnv4Ct4OLdEoTWQ=;
 b=cJAxwKICEXdWUnm2w9p2GLzzzPjb19xHH7Oq10jmdYKrPedy+2wtd2k+wRDe2Wnzlu
 GuhJPlieurCgc9K/dlnuUu06wny3FphLFLTiAQlj2bot+GceZTPxO5F+75i+Xes694P+
 zRSPHQBsM8PONKjpXCfZMR8It6SJ+LUWPd8IJ/nr9RrYyxWoZoQCdRSL8bsplNdIuHb6
 sWubqvlIccSiNLtAnuv0xY+6ub3bZyVyamUCXZofNI+0TSze9RQ/99+EfLpXnv2nVewF
 5E+7YmAJSyVwj3qgXOE7liAJ0gVU3ZqCERlxmsJFKK3QeU1XVag+wyTAOMOJhweHqVbk
 NDbQ==
X-Gm-Message-State: APjAAAXxaKlJbQOD3hOU+iF7n1ZAe4FoqBToBS5WQExMzFM4CSoDkrdw
 CARy4xHk2lFtAVyss4QEdYtwvg==
X-Google-Smtp-Source: APXvYqw485uYVt+kqDbpQ0wxUDiPbGSM8KdkwxJABu2kHY2ceJEAOlsM1vw93IQ0cwpPB9fhmy66qw==
X-Received: by 2002:adf:a749:: with SMTP id e9mr64394856wrd.64.1560502706508; 
 Fri, 14 Jun 2019 01:58:26 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c2sm2178672wrf.75.2019.06.14.01.58.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 14 Jun 2019 01:58:25 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: balbi@kernel.org
Subject: [PATCH v2] usb: dwc3: meson-g12a: Add support for IRQ based OTG
 switching
Date: Fri, 14 Jun 2019 10:58:24 +0200
Message-Id: <20190614085824.23307-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190614_015828_933342_AE7D4FA0 
X-CRM114-Status: GOOD (  12.54  )
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
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add support for the OTG ID change interrupt to switch between Host
and Device mode.

Tested on the Hardkernel Odroid-N2 board.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 36 +++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 2aec31a2eacb..bca7e92a10e9 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -11,9 +11,7 @@
  * - Control registers for each USB2 Ports
  * - Control registers for the USB PHY layer
  * - SuperSpeed PHY can be enabled only if port is used
- *
- * TOFIX:
- * - Add dynamic OTG switching with ID change interrupt
+ * - Dynamic OTG switching with ID change interrupt
  */
 
 #include <linux/module.h>
@@ -348,6 +346,22 @@ static enum usb_role dwc3_meson_g12a_role_get(struct device *dev)
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
@@ -374,7 +388,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 	void __iomem *base;
 	struct resource *res;
 	enum phy_mode otg_id;
-	int ret, i;
+	int ret, i, irq;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -436,6 +450,19 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
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
@@ -460,7 +487,6 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 
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
