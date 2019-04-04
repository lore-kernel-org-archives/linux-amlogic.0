Return-Path: <SRS0=arCo=SG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB57C4360F
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 13:12:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D76C2075E
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 13:12:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fFZbSiZb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NQgQuCht"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D76C2075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QKvu8eopNbVSNc3XE8rz0cljutlMKu+MgE+mnq23CBc=; b=fFZbSiZbAYSY4M
	0aUndVXrziP/cqli83ta6L/O6x//xWq0aPjWenruYGfMgnv5GH3BwR6FfVjzN1bwruNc09wgJ5KJZ
	/2g8Wjq2feOJ49vCfYfHBSdJpFB0vzXKgyQnAZ5XndRDyaNtzU3MnD6h2k55HmfLMw3fyV/dq0tH6
	ap9PCrkZ0GGOJHymckxANevxo09CbAky3y12Gusl9G7dvDOVIWu7Xo4uFP336xNJjqwWe/rxZR5Wq
	miPoVa8ZZstiJgNvC9In79ZFGwD9ZdGhikO14RRap1cQRvWn7TgiulUAUpP8IyMc7yzYjNrdwJexL
	AuYf9Lmev9HPUBULhbEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hC2A5-0001Y4-9E; Thu, 04 Apr 2019 13:12:09 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC2A0-0001R0-4G
 for linux-amlogic@lists.infradead.org; Thu, 04 Apr 2019 13:12:07 +0000
Received: by mail-wr1-x442.google.com with SMTP id g3so3717665wrx.9
 for <linux-amlogic@lists.infradead.org>; Thu, 04 Apr 2019 06:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C2Np36jjJb1WgC3/59cWHoAfdL0+gseCwYoNIkBU+7U=;
 b=NQgQuChtIdoSiqdDUI/JiMdfrin2nesP+nHhGvk7kbC8hVW7tOFo7cOHjEqyYBu10j
 Va0SyZVG9PAwkJCupFCpS2uqNbIkfkCl7XnE9VF8jiwnwH4Q+iAyanKMbDjKLy76Czgm
 tpOvsR49SukQ45ZGP9bqs9qCzynO2LUR3o23VOoX37jFlnHDTh6bxn8cbAK2ufyvKKFx
 x75UloYi0jXPXonR6xZjZHhyRCLisJGzReG2UqZMayZeqEITcr0Zy72yuTu0DYqCHPAT
 +gu1fDKbnRPy3GUV1Z1Lb1UI2vk8Eqmrlesu0vA2Q4Mx8KFsuN68o9WkmO0LPbwPyyeN
 7e2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C2Np36jjJb1WgC3/59cWHoAfdL0+gseCwYoNIkBU+7U=;
 b=uGfFPCzxpW3qR3yFH3OC3iCrEB/oyevQvRG/voYcyjGZKNhrSwN3Q9ztcOwhABnFhw
 JIqcCpYtJYf3yyiLeBREdTUzwEMoVG7xE4CRwB0uOmAPBZ130s4qd8GquFDpy/NtScv1
 Eqfw5oTFW1gQi0dRrevXpUab39/qEauPYsjhK1si2qyP57ReRMtpu0GKZaQa0MAJ2Top
 wrVpsunb4r+DTcLUU5Dpi6SNk2q5HtprsKfgUal7wE4lLdwZFK9ENknX++IXBacvQsO3
 MxVqJSyEwJwdATtXe21g+g0v0k+1cn6kkmJSSLuX6TNn0lW9wpc6eEDMhQMAGKyfsL6x
 2u1w==
X-Gm-Message-State: APjAAAVO6sxP6KjrF5eCsKujGqsU57x7Ub0q4esJm9ovMsuCAoUPc26e
 jEzIMrBhsEnu94M4B1xs1B8kWQ==
X-Google-Smtp-Source: APXvYqxQl1GGh5tExSlAH4AvtpSgyqpazagc72wWxAq/TU+yuZKlzg1TvaIJXTelAyeL+Hgp7MV4Ew==
X-Received: by 2002:a5d:6181:: with SMTP id j1mr4239923wru.11.1554383522488;
 Thu, 04 Apr 2019 06:12:02 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id y133sm21984923wmd.2.2019.04.04.06.12.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 04 Apr 2019 06:12:01 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH net-next v3 4/4] net: phy: meson-gxl: clean-up gxl variant
 driver
Date: Thu,  4 Apr 2019 15:11:47 +0200
Message-Id: <20190404131147.31156-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190404131147.31156-1-jbrunet@baylibre.com>
References: <20190404131147.31156-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_061204_474249_B8C40D06 
X-CRM114-Status: GOOD (  12.21  )
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

The purpose of this change is to align the gxl and g12a driver
declaration.

Like on the g12a variant, remove genphy_aneg_done() from the driver
declaration as the net phy framework will default to it anyway.

Also, the gxl phy id should be an exact match as well, so let's change
this and use the macro provided.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/net/phy/meson-gxl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
index 2033c93a46ca..6d4a8c508ec0 100644
--- a/drivers/net/phy/meson-gxl.c
+++ b/drivers/net/phy/meson-gxl.c
@@ -224,14 +224,12 @@ static int meson_gxl_config_intr(struct phy_device *phydev)
 
 static struct phy_driver meson_gxl_phy[] = {
 	{
-		.phy_id		= 0x01814400,
-		.phy_id_mask	= 0xfffffff0,
+		PHY_ID_MATCH_EXACT(0x01814400),
 		.name		= "Meson GXL Internal PHY",
 		.features	= PHY_BASIC_FEATURES,
 		.flags		= PHY_IS_INTERNAL,
 		.soft_reset     = genphy_soft_reset,
 		.config_init	= meson_gxl_config_init,
-		.aneg_done      = genphy_aneg_done,
 		.read_status	= meson_gxl_read_status,
 		.ack_interrupt	= meson_gxl_ack_interrupt,
 		.config_intr	= meson_gxl_config_intr,
@@ -251,7 +249,7 @@ static struct phy_driver meson_gxl_phy[] = {
 };
 
 static struct mdio_device_id __maybe_unused meson_gxl_tbl[] = {
-	{ 0x01814400, 0xfffffff0 },
+	{ PHY_ID_MATCH_VENDOR(0x01814400) },
 	{ PHY_ID_MATCH_VENDOR(0x01803301) },
 	{ }
 };
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
