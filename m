Return-Path: <SRS0=nwdc=C2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30368C43461
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 07:00:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B705021973
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 07:00:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NFVtMBFm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="v5O1H2h6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B705021973
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZbevKdqhZ4bGixK1YcQMsYu+ff/I9Z6r7kdAtLWvUgg=; b=NFVtMBFmKEnx4Ve6mRfKoDiiC
	Yikean4EzxJBWoZLqYfPlYcwmpL98wfq7Kk9LRcWzxUxRCCMkhl+Nyp6dbmdcT8xzM+DSdPAE7n53
	rLmT15mKBAte7BOi4B8WZ6pLOBzv+I9B3DMpcZUCq0VzZyxbHmi+1mBEb3pRIvD6UnRc/VNGoM+je
	Pa2g7TT7M7xBR4awPNF3jTfy/9qpYe8R5QS0ObvEZxwdrD9y48SjNJ/8WKmAMXcxX54PJ6qlpGKnU
	bTf86ZcyQ+YoWrh/3wnr7TYDj9w3KVWorsnYFpm44xPDdQThF0YU4v2Y5+PY5QfCy6HeF2E4BKIM7
	akuJ966bg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIntu-0000Oh-2z; Thu, 17 Sep 2020 07:00:14 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kInth-0000IA-06
 for linux-amlogic@lists.infradead.org; Thu, 17 Sep 2020 07:00:03 +0000
Received: by mail-wr1-x444.google.com with SMTP id k15so774146wrn.10
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Sep 2020 00:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oigsqv0xbxJDh4+eGFiginHqxJGGsS0Gt9+VPZlYuXQ=;
 b=v5O1H2h6BVXGNsYCO40bSXSDq67Ti1aqleKcmx7yLpmjrNUwAbQuoh6o8SY7NiN6Ft
 OTMp+x4/0+h9qtLiuvKerU6ydbeqLUn/q3JooBmjEDxIEHcpxK6Aet6cn+uRwln7C3j0
 bCXqKgHuHIclcZrWk9oT8sn7MA7VxhHNOx7qUvz5WLxySxpVeUsKLBaKAu1FLEoqAj2N
 ZaSlaSbfSrxGQ0dYtT+FPhRtJjbZKVdWQZUC/72l7sdEYyhtngTNzjj/cqY1jzubnC18
 Wjex2HPwO377L8EMzV3EF3c682H7VQeqlxWtDICzkqMbV/ZGqk5STrvVBkxsqoSdgrKh
 6QfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oigsqv0xbxJDh4+eGFiginHqxJGGsS0Gt9+VPZlYuXQ=;
 b=bkxSt2jhykgBqCsTL3FX+qN3T/Vp7MgAEL6YhTKxa7OOtOoiZTE5K2kuQknaZkfqJm
 i0ghCp9R9FAW9+s08oiXh05+DlUoScdGu7kSM5grP6+Im9UyWcwFX2X+02ZtpT+DQPmk
 8pQ9IEIjOefASiJFqDCDVWaHVNaGW7O71IFLTcAvfCPlNExDkb8WfLZfVGPOd6M0J36c
 NiVGmRtKS8ZWGoKWxxSGxj6wwcTQLTity4pp/FVtz6ogVAarW/3mWHsLJc+QdSkvMHPU
 OgDN76us5T8kWiMFYHxGwWTCUdHKhK8OaFfCpWD2b6QF7ZUlIdEzs1VybbZZ5dOZx/JX
 HzJA==
X-Gm-Message-State: AOAM533dcTVK9HLJmyLvUhP8Gz9uoYkmj4CHYTA/PsngDtNlEASWoVux
 NvddAVsZXVa4djUx33cOwMWavA==
X-Google-Smtp-Source: ABdhPJwdpYaxpEzla+mW1BFwvftTJkMtrrj8tK9SVmXuIkteWyr7bm3xB0VQlP2vXnpLyQHxtJaVGA==
X-Received: by 2002:adf:efc9:: with SMTP id i9mr31792797wrp.187.1600325999780; 
 Wed, 16 Sep 2020 23:59:59 -0700 (PDT)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z14sm35709055wrh.14.2020.09.16.23.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 23:59:58 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	kishon@ti.com,
	martin.blumenstingl@googlemail.com
Subject: [PATCH v2 1/5] phy: amlogic: phy-meson-gxl-usb2: keep ID pull-up even
 in Host mode
Date: Thu, 17 Sep 2020 08:59:45 +0200
Message-Id: <20200917065949.3476-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200917065949.3476-1-narmstrong@baylibre.com>
References: <20200917065949.3476-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_030001_082058_7CB9FFB5 
X-CRM114-Status: GOOD (  12.38  )
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
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
