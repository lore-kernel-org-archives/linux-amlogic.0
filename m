Return-Path: <SRS0=K5c1=PX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2307FC43612
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 12:33:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E44D520657
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 12:33:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g2292TzX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QYthVx2L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E44D520657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=npMmDTQmdzentBNWrH8WHnSku5nNk3Oc3/YefbvF+Rs=; b=g2292TzXQBBWYV
	1apkkfjAyLwD4QgIn3b4SnDQiLpwQF8cdE5HJpgK6PN60m3O8t+Ofl9/d5yeU/Jjz4Fa2PbHp3ntO
	PIYmeELMbCRRwE1o0690PoGiE+qY+duUBMES2+6j/E1taqWBVvfCQzrFf/PF05qyyrEso80I31YHf
	pnZnkjJXsUIXDQ519sR2j+NBJ+Erk3EeNiPOfUuzzDex/V7ok8VoYduDeunh5Xzwv+m2zKiKqXzX/
	VS441qpFupKURStm53IdOHzkgwxodSbkF8/kkvoDf/1iKx9V3xTDbZnQTmh5wGkANDNGwmxkGzCfD
	lx4ZhFPjdC6u8xS2Ls4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjNuO-0006nQ-MX; Tue, 15 Jan 2019 12:33:32 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjNuH-0006fD-7i
 for linux-amlogic@lists.infradead.org; Tue, 15 Jan 2019 12:33:27 +0000
Received: by mail-wr1-x442.google.com with SMTP id c14so2811473wrr.0
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Jan 2019 04:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1W+lbP0SbjGIMhxY+ggbwt4nGlITxeB1OhuVLZxhZ14=;
 b=QYthVx2LP2RKJHMt/0LEdagK5t8SoOriABnSaL84/UTRxp/dVjCaKaKYXxzB6V59ma
 No514ZSY/Eg3bga3v/ueyNefKKPoRkV/RdAW2sMXaAobJohGoc9VixMAVYFsm5Qwbiku
 aUsoMa1lpxuyNqhSI3ktUBR0m/m+3kDQCEDr0l4GpNpLs+QltrU6mzVDhuiX/ZtbZ7eG
 1/LBbR0SStGa24hEbaIhv7+6yI5jKkpZGNT0UNk0caYxGzcHKpMvvF9uEtdQROapV98g
 ZowsON7IPVduodv+7vyFaY2d4Eji7yNfEytfaKrrrXlP7HCmNoUsyxCxcpmBai2c+zYT
 Q/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1W+lbP0SbjGIMhxY+ggbwt4nGlITxeB1OhuVLZxhZ14=;
 b=f05CorKNjjMISndwie00fRSIIqevXfwOp8Dz26K6WiH3f4hJlpBelpTc3PZeSVH7n1
 wGxenFATqbtJkAdPaPmOc4obJmpf6Xfjpbun2C9Js6P0FWmv1KNPX516jz10eY7KDEgE
 15x+70nTZdpxEr/juPZlziVE66Ra8ATvvNi2WSNnGK2wxCHYtBrcBi42sbQ8x8QbOza0
 9IuG95R4Tsi549eUYwO92cqMia7dEV5KztxeTTz7u/Ul2RTv74IkNb+oQi6mR5zcW78c
 6jL8Wm5KeXuX+IYCmFa0/RSmM52Ih0SrjXKJnEYOM1rrfefktQldl/wWh3L00FQbZpze
 dSjg==
X-Gm-Message-State: AJcUuke192M36iXPkCUnAd2ZdkMfqsVPiSVlZUF4o3Nq9Ki1JskzD3ES
 A7gy+l15ZEsC1yD60Rtl4+gepg==
X-Google-Smtp-Source: ALg8bN7OsDHasv+8VVuqmmtrBH0Aa8tMLeqgL9ao4RCNk9LnYdYKvcDKknGt7btAKWwQqs+bLcTLbQ==
X-Received: by 2002:a5d:5409:: with SMTP id g9mr3058434wrv.88.1547555603725;
 Tue, 15 Jan 2019 04:33:23 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x15sm75658842wrs.27.2019.01.15.04.33.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 15 Jan 2019 04:33:22 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com,
	Laurent.pinchart@ideasonboard.com
Subject: [PATCH 3/8] drm/meson: add support for HDMI2.0 2160p modes
Date: Tue, 15 Jan 2019 13:33:10 +0100
Message-Id: <20190115123315.11069-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190115123315.11069-1-narmstrong@baylibre.com>
References: <20190115123315.11069-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_043325_290933_27D59478 
X-CRM114-Status: GOOD (  10.47  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Now we support the TMDS Clock > 3.4GHz and support the SCDC Control
operation in the DW-HDMI Controller, we can enable support for the
HDMI2.0 3840x2160@60/50 RGB444 display modes.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/meson/meson_venc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index 0ba04f6813e6..66d73a932d19 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -848,6 +848,8 @@ struct meson_hdmi_venc_vic_mode {
 	{ 93, &meson_hdmi_encp_mode_2160p24 },
 	{ 94, &meson_hdmi_encp_mode_2160p25 },
 	{ 95, &meson_hdmi_encp_mode_2160p30 },
+	{ 96, &meson_hdmi_encp_mode_2160p25 },
+	{ 97, &meson_hdmi_encp_mode_2160p30 },
 	{ 0, NULL}, /* sentinel */
 };
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
