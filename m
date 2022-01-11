Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D7DC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jan 2022 09:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UjpFQZajigqLGll/10A7ZjCoZ6IwBDrAdvPT6AEAzoo=; b=vMIhxzZDEDoCjl
	rI1tW4pZeCNZzJ24zWtQ1XE94us33NSgK/5LOoeklDEmDIpuVP6yK5hH4EZ+fvY26qMKbT63+viQa
	iB0GlWim8EkR3Lzwic46OrTXkxgM/c2CzZ3Xlcg70eTSK+yxGr48/0iSbNSqwVNGqi8Ot0Mqk0HFQ
	qvAQ6oUNmozt13U2j3Jc9rjjMX3SMW7hcuLs9ByQxcARstgQzfKlNroAuyXomsh5HbhUxXAv5/keJ
	PigGAgFk2/7DM9BoLLlAW/+AfiEdtQZ9um78dInaepTDJn8Ri7dhXNQEV72Op9kxaNvlHifAGgI3x
	paC4/8ELm8gjxLtxzaPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7DqO-00FfdH-0i; Tue, 11 Jan 2022 09:53:32 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7DqK-00FfZn-Nl
 for linux-amlogic@lists.infradead.org; Tue, 11 Jan 2022 09:53:30 +0000
Received: by mail-wr1-x436.google.com with SMTP id o3so31828376wrh.10
 for <linux-amlogic@lists.infradead.org>; Tue, 11 Jan 2022 01:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A+i9WMf7INTV7WCiMlaX+eZZQolId/EOXyuyr4T+wZU=;
 b=X/P92XWcAUFvR3YEqhxSTn9r+eVg0V0NdBO5apYmzV/a7t25cEbaojIT38kHdrpG5O
 ZvKQCC+gg0RrRpkxbOTwei1qDh3oDHZ9wh9CzqQBvngfvUKTmt+dNSVL1oHFZRhlgI1I
 T4nVsQ8iPQJSsW1UY4HR6I4e7wQIAGMRRJ9YT2c779CbPuwsz/hc+2vtnKTtbRCO5DQt
 2igqhJqekzn1rAwGdqWMW26X6EdJx2BGy9EkTbhax9IzB2MIa1ceUpkWRBBx3OzpZuU8
 bT05pVhBMmE7RqUK3B+VsexoV8eBa+ENdsknN555IDZY0qcseTdv+Ulx0AmEbkQqRAsv
 ClGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A+i9WMf7INTV7WCiMlaX+eZZQolId/EOXyuyr4T+wZU=;
 b=SSWF5Q1W9zuwomvqM0iZzdGpck/UeDcEPnip4L68GFSd3Caqhx+36rxzIDby+OU0rh
 vzAO8P6C+AtlUpN7ZV633IEyno0Myj+LwrOw7HfrBhmmOD+IRB3XFVzmNk8lyi1MQ1mN
 DbQutb/1wtsHihGtc6L05sABtWpjzFSe1Zfdh2swIKEIk8JIk7IuONWzCAQeI+MC8PT+
 tXT97EwPEPw7duJCIDYVpGbYFM1P3adGmndZx+ANIP3iXMtTVhPZRuU5k2Pf7wMrCBso
 Q9cMUV4coCYwk6vijWiphi7Q4k3vRsUrnT51zOsNeLcLiz5qkjyCUY00uACvhbtFMtzF
 SQDA==
X-Gm-Message-State: AOAM5316H5lZ6KLJWCbc/ZdQx5NX4n+wFd/j38BIcapP5gWpZFNCeO4d
 xaEahCO9bCPsWx+A9GtYXylNvw==
X-Google-Smtp-Source: ABdhPJwh7rSklXagPFgtG7DKSa9/4llHAcDXK4XwiB5AjfRTsyZsnMgjJY7WB4LdEMyqAuoUtnxN3Q==
X-Received: by 2002:adf:e3c9:: with SMTP id k9mr3064155wrm.193.1641894806884; 
 Tue, 11 Jan 2022 01:53:26 -0800 (PST)
Received: from localhost.localdomain (203.247.120.78.rev.sfr.net.
 [78.120.247.203])
 by smtp.googlemail.com with ESMTPSA id l18sm1248916wms.24.2022.01.11.01.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 01:53:26 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: kishon@ti.com
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>, p.zabel@pengutronix.de,
 balbi@kernel.org, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 khilman@baylibre.com, linux-phy@lists.infradead.org, vkoul@kernel.org,
 martin.blumenstingl@googlemail.com,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v6 2/3] phy: amlogic: meson8b-usb2: Use dev_err_probe()
Date: Tue, 11 Jan 2022 10:52:54 +0100
Message-Id: <20220111095255.176141-3-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111095255.176141-1-aouledameur@baylibre.com>
References: <20220111095255.176141-1-aouledameur@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_015328_831698_FD97AD5E 
X-CRM114-Status: GOOD (  11.60  )
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

Use the existing dev_err_probe() helper instead of open-coding the same
operation.

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/phy/amlogic/phy-meson8b-usb2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index cf10bed40528..77e7e9b1428c 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -265,8 +265,9 @@ static int phy_meson8b_usb2_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk_usb);
 
 	priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
-	if (PTR_ERR(priv->reset) == -EPROBE_DEFER)
-		return PTR_ERR(priv->reset);
+	if (IS_ERR(priv->reset))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->reset),
+				     "Failed to get the reset line");
 
 	priv->dr_mode = of_usb_get_dr_mode_by_phy(pdev->dev.of_node, -1);
 	if (priv->dr_mode == USB_DR_MODE_UNKNOWN) {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
