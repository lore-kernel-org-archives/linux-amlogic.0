Return-Path: <SRS0=mlCU=YO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E3ACA9EB5
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 09:18:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9194020659
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 09:18:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gRVWj0ua";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zLJ1sNW9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9194020659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rHxUEW6RNcXdWxNLx33tZvYreybfbOvvKCQXIGBdiv0=; b=gRVWj0ua/KURF8
	/Wvt2oNqn9iRpDvmUA2PG2+ue/2I5R9sTGvQP6fAkZEWBnuKkUGoR+uPJegAjmsKMBvfvTEWkwluz
	kVFx6Xlw1Q1uEwjIha6pK2YJCWCzpUNJLgF1UVadyGUQmMu7pTkvE6Hw2Yo/HNvF9GlaYOreTnqT3
	E++h3TVQWpBJt0JwwZwgHxEuFTPL5aWtLfxKcg9Hp3ZsLDFRZIdhz2U0xAAD1DSqI3+78FY5/6BMR
	1/IKP/bZNMX9fomNLRIJjtRwprbW9oYOBqGcSjFUnsUtoPsdshfDxoYcnJPdP4EXOpum1Vw1J4V+B
	P/Co1aS85WNy1XrqvQug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMTpv-00057V-RA; Mon, 21 Oct 2019 09:18:47 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMTmZ-0002jw-My
 for linux-amlogic@lists.infradead.org; Mon, 21 Oct 2019 09:15:25 +0000
Received: by mail-wm1-x341.google.com with SMTP id 14so5291917wmu.0
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Oct 2019 02:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9GArC94tXtiJFh0r8bnfgE0ceBz2txRHJ4czY6jCpvc=;
 b=zLJ1sNW98uTrAiqwDlRmxdBuL/WNQhLcBQSh4C09UdFrgGjdahB/yXyD+SM4jTA8fl
 ty11JCqJSL4udvI3sCbpzuDfEUeofEQcAHcxtRSIN16R6dovtB6g2zna1NuDklI9YziX
 xL7mcG4SgF9yS4Z6nw1psLfv65hAC8wjtTdKnwPNnCGR9aLr9Vt4puigr2co/HzFNqe5
 8jcysH7m2FHMbk39IplnJYO3oREab9XI1IbB1j36fcoVIbIr6EyvKwz9TGrcLESPxe/4
 58g2HIrRMfCZQgIv1zBr9t9t2qWAS+v59aH2ns3x+q6YaDhf2XdX3RyGo9Y/LCIdm5Js
 djZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9GArC94tXtiJFh0r8bnfgE0ceBz2txRHJ4czY6jCpvc=;
 b=Rs3oc59b6QafGSeRIPbe7UcCXomHQ1M1KO4IXVr26JR/hpuQ2qk6WOR6XZf1ysLmx/
 ivTGJ8JyIKvVs7UZKl3w3tjVpqTeogANaeKBY6BkY6LOWcj9ExDLNobcYvI5Y0XvQ7Yv
 HT7Gc6oKzDDcDxU2/ZwSN5bCEYPSnqNoiloiEmVi7in894KcXe0cnuBv0ukMvGdEhqe8
 eZuAyVP3RIBIIOR4sEJ1GNRAa+VbejhwweAG9z2qhFVy2nSXqrexgIDDInc4KjCvTrDT
 qJofMFRGDjoRUJbWbT4GHAJvZQTPHS7leIEuBSDCg2ViN5hmPG0yrRZjv8T9hlxXGtkw
 1ohw==
X-Gm-Message-State: APjAAAW0pr5mUd9OiWqM2/pzJyWYHI/IxmXwiGLTql8XRKACHdj+YOl5
 GYa2Xzy9+k0GGv6WuLmpytemwQ==
X-Google-Smtp-Source: APXvYqzgonlD2CSV/QcUQqpRcy/V2+0lBkWclazaN9UZd0clclGNPGQqRgOwaLJwLVwhPi1zpxybyg==
X-Received: by 2002:a1c:38c3:: with SMTP id f186mr2658112wma.58.1571649318118; 
 Mon, 21 Oct 2019 02:15:18 -0700 (PDT)
Received: from localhost.localdomain
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t13sm20281595wra.70.2019.10.21.02.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 02:15:17 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 8/9] drm/meson: hold 32 lines after vsync to give time for
 AFBC start
Date: Mon, 21 Oct 2019 11:15:08 +0200
Message-Id: <20191021091509.3864-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191021091509.3864-1-narmstrong@baylibre.com>
References: <20191021091509.3864-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_021519_882373_A7E11CE8 
X-CRM114-Status: GOOD (  10.93  )
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
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 ayan.halder@arm.com, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When using an AFBC encoded frame, the AFBC Decoder must be resetted,
configured and enabled at each vsync IRQ.

To leave time for that, use the maximum lines hold time to give time
for AFBC setup and avoid visual glitches.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_viu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_viu.c b/drivers/gpu/drm/meson/meson_viu.c
index fc246248226b..304f8ff1339c 100644
--- a/drivers/gpu/drm/meson/meson_viu.c
+++ b/drivers/gpu/drm/meson/meson_viu.c
@@ -438,7 +438,7 @@ void meson_viu_init(struct meson_drm *priv)
 
 	/* Initialize OSD1 fifo control register */
 	reg = VIU_OSD_DDR_PRIORITY_URGENT |
-		VIU_OSD_HOLD_FIFO_LINES(4) |
+		VIU_OSD_HOLD_FIFO_LINES(31) |
 		VIU_OSD_FIFO_DEPTH_VAL(32) | /* fifo_depth_val: 32*8=256 */
 		VIU_OSD_WORDS_PER_BURST(4) | /* 4 words in 1 burst */
 		VIU_OSD_FIFO_LIMITS(2);      /* fifo_lim: 2*16=32 */
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
