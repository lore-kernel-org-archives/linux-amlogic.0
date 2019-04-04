Return-Path: <SRS0=arCo=SG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52526C4360F
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 13:12:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 205992075E
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 13:12:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sKi11ex7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WrHX2k1M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 205992075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6y4wvUqG5crl3J1G6jgXFKjgBaytK8jX27P0+N1mZsc=; b=sKi11ex7AbNOaw
	LoRbuzLzPSLBW4UlkHkoHutPI1uJYYT6YlCAztHAeR0eK0+567ZxwOvMZIF3E9XhUf+3NqR44JKTS
	lK1iD3ZGX46kUl+0bhGtUU1bBzh4A6FvUfNg8UNeJ0+2BIU1SxDq5luvj5bUBuNQKUZTbYW90jLqz
	IkFNP/8nnx9KKHpPdnbEL7M0+KKvcqtLXdEVRTdBswM8Ki5Qo5OqqHyDrex6oJuHsuzgXwUOtOBhA
	gdNepc072ljb/B+W8GCBxfOw4uGOzUKeE16E3FwVQqyiTaJdropSk3hpZ+KRC1mur47uwRwtT2+AT
	fQbVbCjEoFgFwf4vxK9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hC2A3-0001Vr-Hk; Thu, 04 Apr 2019 13:12:07 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC29y-0001Q5-PD
 for linux-amlogic@lists.infradead.org; Thu, 04 Apr 2019 13:12:05 +0000
Received: by mail-wm1-x344.google.com with SMTP id z11so3039984wmi.0
 for <linux-amlogic@lists.infradead.org>; Thu, 04 Apr 2019 06:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R4J+VyhzRh+NhhZy6AkI12ey+VNbuJcXhpbxSA+8ah8=;
 b=WrHX2k1M7DQscuoYArwoPfw+g2BKLwNmNNsfOw7tTQ/IHltBnwKB7AnfSQKn+p75CK
 1a/Wl7b/9V3FXXaIOlVJpexBmCFky93l+yxpXvyZJj+iGmLzEk4vuBe/lCdbt3SzdgPI
 i9+syrihCo6BISLUaj1lsBg1Yw8OYXewl+BYz2t9p7eToeZHrRq6NNdoq3MfGDn1mGoj
 SUKi2QoAnQLIntRdoST/PvqK3baxQScpmd9bfOFMYT0s16TZtPjAs3eMI8ZmITa461fH
 H2gJNZGj9N4uLNaQl9fWPRTbA6Cv7KMhw2ypGsNhtfDXJZs9uoI7AmD8V1UaVPnSQ0vP
 Fr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R4J+VyhzRh+NhhZy6AkI12ey+VNbuJcXhpbxSA+8ah8=;
 b=OG+QF0dOlzS5F6+gocXo32eZQR4C3Dcx9FDxjlAEuRpWCMoE+QAf1aZJT7byJdI+/a
 JzYxS3JuO0a8EgwD9xsCGTDTfW9u6sI6d9qwI7TKPgdASXjIQ5xbUSPLwB7fauZfSTvS
 h1F3tK0VLoPngQbdgdlzCpvopth08ApKIklsc7Q2MLUJJS/mg8qv0qJH7qJOypFayFsX
 oPh3HJNATNQU0MhzfLGv9pyYU00P7LC8Nml0eRgRfV3X/7kWWAR/NMLN5OyrkG5Llhvw
 kzV8SoupuV+M7+j5/nSlU2RSlqdGC9Usjm/b2CuyoCUYyb4TcRsbr8/GfLBP6RSa3D/F
 iR8A==
X-Gm-Message-State: APjAAAXMzWg37X3YrEPT/XKT2HEHvCQ1KrKRC1suHGZ/NCwrar4sTDWE
 qFxAF//PrbeFIXHm5cs/za0zbg==
X-Google-Smtp-Source: APXvYqxJbUwIuqiE9VkQ/1q6njOBAOxXMB2N5lfwzN62xGUO0RL8WEY9RvyLZkyED/B1YLNbzxAMRQ==
X-Received: by 2002:a05:600c:211a:: with SMTP id
 u26mr4302195wml.74.1554383521016; 
 Thu, 04 Apr 2019 06:12:01 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id y133sm21984923wmd.2.2019.04.04.06.11.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 04 Apr 2019 06:12:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH net-next v3 3/4] net: phy: meson-gxl: add g12a support
Date: Thu,  4 Apr 2019 15:11:46 +0200
Message-Id: <20190404131147.31156-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190404131147.31156-1-jbrunet@baylibre.com>
References: <20190404131147.31156-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_061203_047236_4CA4F3F1 
X-CRM114-Status: GOOD (  10.03  )
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
Cc: netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The g12a SoC family uses the type of internal PHY that was used on the
gxl family. The quirks of gxl family, like the LPA register corruption,
appear to have been resolved on this new SoC generation.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/net/phy/meson-gxl.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
index 0eec2913c289..2033c93a46ca 100644
--- a/drivers/net/phy/meson-gxl.c
+++ b/drivers/net/phy/meson-gxl.c
@@ -237,11 +237,22 @@ static struct phy_driver meson_gxl_phy[] = {
 		.config_intr	= meson_gxl_config_intr,
 		.suspend        = genphy_suspend,
 		.resume         = genphy_resume,
+	}, {
+		PHY_ID_MATCH_EXACT(0x01803301),
+		.name		= "Meson G12A Internal PHY",
+		.features	= PHY_BASIC_FEATURES,
+		.flags		= PHY_IS_INTERNAL,
+		.soft_reset     = genphy_soft_reset,
+		.ack_interrupt	= meson_gxl_ack_interrupt,
+		.config_intr	= meson_gxl_config_intr,
+		.suspend        = genphy_suspend,
+		.resume         = genphy_resume,
 	},
 };
 
 static struct mdio_device_id __maybe_unused meson_gxl_tbl[] = {
 	{ 0x01814400, 0xfffffff0 },
+	{ PHY_ID_MATCH_VENDOR(0x01803301) },
 	{ }
 };
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
