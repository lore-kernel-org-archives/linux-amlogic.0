Return-Path: <SRS0=GF6O=CS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22850C43461
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Sep 2020 16:04:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45C3920639
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Sep 2020 16:04:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gH8+W0A9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VwOSKziV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45C3920639
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RtQYWqWLrITRIW5KjEK5GRjTi8SWJ1KarKNXzsiZLZQ=; b=gH8+W0A9fjCAdbj3ZOYHMGmE2
	TQiN99ZFHxQPnoCALb0gONKWx2IGGToLmz875cbEjpe89eWi5czR0WUz+UF5hkRV05E08MwJlJpFC
	Tz0JXIzfGsIV61KoYhhaBufmAraDCC0yVZ1VxmDHSh4MLjO6urF9L70lOv9Ca3yDOCzUr2ocJu66d
	lyCzhGwji+wGzdiL18quF1X2bzE45z1Rnh5jgrIJF7RwnRf2EQbgHqOQUabA5WF0zIG1dUR+03/rD
	cebSotr030qomv9JJMC5DijahkeAjomoeNxFYqvm5dkI7MwfM14PMZgcIHXGd9xHmOvhmhDGKfbJI
	6dnESWCTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kG2a9-0001sv-MF; Wed, 09 Sep 2020 16:04:25 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG2a2-0001or-Jo
 for linux-amlogic@lists.infradead.org; Wed, 09 Sep 2020 16:04:19 +0000
Received: by mail-wm1-x341.google.com with SMTP id a65so2803385wme.5
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Sep 2020 09:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SiyqCx4YnZ+Or6eOmMKNfQ0j9dSdplwdoBw+wNl6q58=;
 b=VwOSKziV6KxZBIx/wGbNdqd2Y86noYBluv4unymCGwu3te8jbuKa3ccpWYMnch++2a
 7z+xHoRGaFu8JgUBYDtf8zxYfS3iUNGtflX4ZqSZ7xTJGZbR+E8PjtrDZvfN/JL060fc
 mNaVnsam1wEaLDJyP/xodQ6M17rSwtotUeNLEjVZ6FL7ww+0ZolDJ3MrafIRHvZqUTue
 fKMsHIzQdcuASojK+c/frFsDrH2uyxSoQZtb7hmfbw+gKH+uQBVx6UZAlZwGUJtEtIen
 x0Gm785684liWBPGC3wrTWHJJYu1HTuEdpWXl3w5Z43oHdPMvCDyPMYA5pjhmy56RQ//
 FKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SiyqCx4YnZ+Or6eOmMKNfQ0j9dSdplwdoBw+wNl6q58=;
 b=pbiKyAmOnezPgj+IRAGd3DajULWTJWMRktzCU/09OSioEnt8LzQDEQ/79WHTjrMRYF
 w2O/LENAvFxqbeepZrR1Es1OcbDUbpnJgicwBwraReYeZMdrPtRunyy2JNjScEl5LbSM
 Gi4A7MiE0LCpBXyj4bCqyu4WFpXaijDoTN45q3umtrCJ+Q+2vPMVwwiBxy6eKBKiFrMo
 F9PibegQx+qosrDNVTrw2tDQwfIr/xhLlteRfxFF+Rh/m9lAxk7Os//KwX9QNN9Gm0k/
 5egjlYu+s9G9SDZXmMjks8EESmUDOKH0THIwvcn99geWPJL5my+9IW9ocjPBcz2GZSHU
 h8LA==
X-Gm-Message-State: AOAM530GeZ8WUvR3RQgvCGWbFQ+UQu0PgM2gKwfbFEilG9vdVmmmvwQ2
 ZmR0thYA8SRIZZfcAQTe6EQkEA==
X-Google-Smtp-Source: ABdhPJxA0NvRTmioXzuZmiTka9YmzVYgx59EJqwb30lAKBiKzxc9Xiv5IR6ANym/gnZ6+pjLTpazaw==
X-Received: by 2002:a1c:7911:: with SMTP id l17mr4148448wme.179.1599667457194; 
 Wed, 09 Sep 2020 09:04:17 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id y6sm4850700wrn.41.2020.09.09.09.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 09:04:16 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	kishon@ti.com,
	martin.blumenstingl@googlemail.com
Subject: [PATCH 1/5] phy: amlogic: phy-meson-gxl-usb2: keep ID pull-up even in
 Host mode
Date: Wed,  9 Sep 2020 18:04:05 +0200
Message-Id: <20200909160409.8678-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200909160409.8678-1-narmstrong@baylibre.com>
References: <20200909160409.8678-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_120418_697726_D2F5B7EE 
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

In order to keep OTG ID detection even when in Host mode, the ID line of
the PHY (if the current phy is an OTG one) pull-up should be kept
enable in both modes.

This fixes OTG switch on GXL, GXM & AXG platforms, otherwise once switched
to Host, the ID detection doesn't work anymore to switch back to Device.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/phy/amlogic/phy-meson-gxl-usb2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb2.c b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
index 43ec9bf24abf..6e862ea60d8f 100644
--- a/drivers/phy/amlogic/phy-meson-gxl-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
@@ -158,7 +158,8 @@ static int phy_meson_gxl_usb2_set_mode(struct phy *phy,
 				   U2P_R0_DM_PULLDOWN);
 		regmap_update_bits(priv->regmap, U2P_R0, U2P_R0_DP_PULLDOWN,
 				   U2P_R0_DP_PULLDOWN);
-		regmap_update_bits(priv->regmap, U2P_R0, U2P_R0_ID_PULLUP, 0);
+		regmap_update_bits(priv->regmap, U2P_R0, U2P_R0_ID_PULLUP,
+				   U2P_R0_ID_PULLUP);
 		break;
 
 	case PHY_MODE_USB_DEVICE:
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
