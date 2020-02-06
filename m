Return-Path: <SRS0=So4j=32=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14947C35247
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Feb 2020 19:18:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DADE7217F4
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Feb 2020 19:18:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qz376AfW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rci9PqEx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DADE7217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BRpvblRnTo+woEioPwM66a/xuIKhPh/m0QuufjTldYw=; b=Qz376AfWyQ7Tuh
	HwzoRbFvM+s5419PDhJy4IxLv9a75kkS/qgWwJ2noVE1aGRNVVbzJ+QhNZLJmcQazMHymprGBXwQz
	cTVrmMwGPSd1uEDlP8cRVeAnY+aKRoO/0ZEGgNS4gI7pyPScV26umyYVWBD5ZMhMzz6MTDesyRCyH
	3qlo0b+pMOl5G20TE7axbsgVnn4yryNOjcJMMNhxYqWYzfgdCVelp8ijE8oryMxZYoT4ndYIjPxj0
	ME/1tubiMTBueO1tOWYd/UR7qi02mBh9q9S0uGdDWwM8ZVcwDUPP7clqxMANA0XG32LB+7sbVUI85
	cEhOEzxUFLwDq7SEUIuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izmfj-0008FJ-DC; Thu, 06 Feb 2020 19:18:43 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izmfg-0008De-CL
 for linux-amlogic@lists.infradead.org; Thu, 06 Feb 2020 19:18:41 +0000
Received: by mail-wr1-x443.google.com with SMTP id a6so8534235wrx.12
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Feb 2020 11:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6mFlT0Omv41nAtEpTgYWO4Xf2iU3uM7fX834ml+D12E=;
 b=rci9PqEx4hby5MvW1khg7iEKwuy1bfbD4iaH4uETQBur1Za15XCzVjeFY1VfdBhtw4
 Sgm+lIqBzDWUcXws81WyInQc4DgofK0ajNixco/KiwkevvAVCOdtY5ZeQ6xfN/Ef6rVb
 GayBIdYOso2YrWls5jJXiF/U+8TKQSpE/sJZNy5HxzOqmim+LVfpuTuYr/kwh/7kYfdW
 Y3awX+mVUGcHmrjyQdCGHxtp6dtxRCX/efFt9Twi9ODg1shreYkTyHnQOaQ/ER9EN8Ut
 ptxJLeh9r0Gvc7WMEkLdB6fdxT1wUa0xnxOwgm+0Q4KtNxTa3y6OHyult0N4gOrTG7WX
 OpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6mFlT0Omv41nAtEpTgYWO4Xf2iU3uM7fX834ml+D12E=;
 b=L3gZX2rh/sdXljZUbpeiWSkpZ+f/yIb7X9wEouIcRoDSaMjMkxBVN/2IDFOmIaHnen
 cMVNY0Wjpeavvbn2cuQbHckbPw6ZzrqmLZ+8s/meJxTS7BMY7S1LOfHmjQ67zHSsgzIP
 sqynShKuiVCeuSiPjf98TvKuhT2l+mFh/1OWTc0F7qGvL3gI2NkxNzacwVVHREt8MOI7
 DOZiDUm+NuhJdDydbw2zcO9hlyc8UK/prD1OP104hVy24aENWv44aLK1FpqaaUttddzY
 grpqcY3+Dx2ifM54GP4xMFjUSn5a9xcG93Qm/RV31YGFdebLp/F2/u1RnkepxzjwF1iU
 ASrQ==
X-Gm-Message-State: APjAAAUwjH5PRBuA2PtHSfnT1xt3ArzBL4ItMUYRLS4r+M77suB5txrM
 tO/az/k18TY0sZtni67GptwiDw==
X-Google-Smtp-Source: APXvYqyowlhqCLlPiC8LwlQGO8ZeahyUMuyPS6kHuCVL6/61Z4rWlDzBpMhGfN5LPnPhHBF2WM35Pw==
X-Received: by 2002:adf:bc87:: with SMTP id g7mr5375779wrh.121.1581016718863; 
 Thu, 06 Feb 2020 11:18:38 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:7d33:17f7:8097:ecc7])
 by smtp.gmail.com with ESMTPSA id m3sm272662wrs.53.2020.02.06.11.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 11:18:38 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v4 01/11] drm/bridge: dw-hdmi: set mtmdsclock for deep color
Date: Thu,  6 Feb 2020 20:18:24 +0100
Message-Id: <20200206191834.6125-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200206191834.6125-1-narmstrong@baylibre.com>
References: <20200206191834.6125-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_111840_416928_4F4687BC 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jonas Karlman <jonas@kwiboo.se>

Configure the correct mtmdsclock for deep colors to prepare support
for 10, 12 & 16bit output.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 67fca439bbfb..9e0927d22db6 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1818,9 +1818,26 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 
 	dev_dbg(hdmi->dev, "final pixclk = %d\n", vmode->mpixelclock);
 
+	if (!hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format)) {
+		switch (hdmi_bus_fmt_color_depth(
+				hdmi->hdmi_data.enc_out_bus_format)) {
+		case 16:
+			vmode->mtmdsclock = (u64)vmode->mpixelclock * 2;
+			break;
+		case 12:
+			vmode->mtmdsclock = (u64)vmode->mpixelclock * 3 / 2;
+			break;
+		case 10:
+			vmode->mtmdsclock = (u64)vmode->mpixelclock * 5 / 4;
+			break;
+		}
+	}
+
 	if (hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format))
 		vmode->mtmdsclock /= 2;
 
+	dev_dbg(hdmi->dev, "final tmdsclk = %d\n", vmode->mtmdsclock);
+
 	/* Set up HDMI_FC_INVIDCONF */
 	inv_val = (hdmi->hdmi_data.hdcp_enable ||
 		   (dw_hdmi_support_scdc(hdmi) &&
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
