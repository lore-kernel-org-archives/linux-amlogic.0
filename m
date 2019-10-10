Return-Path: <SRS0=8dHl=YD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36EF3C10F14
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Oct 2019 09:27:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0149E2064A
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Oct 2019 09:27:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ND2dISXp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HRdZC/s9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0149E2064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mwuIIyvchZmrCA3ORUD852kDnDori4RZCi/XOFLo0FE=; b=ND2dISXpLrOuZd
	5PL1sRmR8LTomDgj7yO0r6Jb/p7UDL+gc8dF9RVP4cPpFa8F2pSQqbTFLbX/tJgdcmMbDUqNSw3a2
	5nsgW/IzY+mwQn2yWp8JNuVsewvK40pV4bWA/iEFty6uj2ROHH18in3264Kg6CecpcCo8pj9s/cPx
	2hasG9mA4EMXgwSBbEgHFtMjhA5ps2FrJykD/NFhW3w3+2jwTnvrV9m/kktGlXy3JCDI07ezkRcU4
	GtnIwmJqaQMmEkdoopdP4bNpkChi9NQE5TeWhRkd7G6eD0xSvqEYhxlgLmMzHrMtSRWZ8QS5UsTrD
	DJpDDKMjmt55Bc57jhOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iIUip-0007P5-Qv; Thu, 10 Oct 2019 09:26:59 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iIUhT-0005zt-7K
 for linux-amlogic@lists.infradead.org; Thu, 10 Oct 2019 09:25:39 +0000
Received: by mail-wm1-x342.google.com with SMTP id 7so6129831wme.1
 for <linux-amlogic@lists.infradead.org>; Thu, 10 Oct 2019 02:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f3ctIUvz8ki//w5Qhjxnv27+ll8g0IP9/N04IDuTOJg=;
 b=HRdZC/s9ma3pxudoYLPvW0srlLgWrP2X+EsMV9H/qDvISXSM2jtJofXSsaHooSMI5A
 BfJHSMAWgBzVicA25C+sSGTb37kLqxiO2lYczi0iecPFplu6o/F8LOLKosRKSEBPiJbL
 HgcIO0pa8Vli/y+bAkSF6+y1tnvoBpUqbX/2jrMkHp1uhbHCnAAEtLF25aTEAjVDm9PT
 gIuR8ENwEXeOT8nLOX7VVyyidjQAZYAWK9akKfhyUGb6+garI4gesqRwdKGxD4FgmL/c
 xfqEtTfPZQ5Um018FjnoDnGkUjUinBe5RH1FoFB7a08vZPOKBe1nrxN7h5RS2+u9QWQ2
 hrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f3ctIUvz8ki//w5Qhjxnv27+ll8g0IP9/N04IDuTOJg=;
 b=M6YtAAdCGAU1qjJv2cqEII21e7Som/VdDDfbj87S4nCEiKs/Ojkqnb/RRcAyGKIdUS
 YBsqCH5w8HHutP0U9NONXo1Li2nISjhrlbi+qxLJoVh3HVK5QqXAXCa5AbMhnJhXmmHg
 01ogqlwl7IVr8LyTHqxzVexG8V77dtet0LhzJSReCmNFe1fA8bHNSWwYv1XdY1yb/IiN
 TGJstS/CKiowjkHk80dnNHGU6SIeZCWKTx1I+yFiBm7y0Xxq/jPQYAk7p3p1q+V+dIsU
 5L8dM34+dgoDjQrgdeaV7VELUJiVkACD87GNiBiU0friQuCvKtiFNvHuexyNKf0Rs1QA
 +NKA==
X-Gm-Message-State: APjAAAUAhcYAzMGAXwJcU+6N0yTcvVr5UGsceDhTWsYSjdtW7xhdefXW
 +8cPpT5cuhVNZm/vN2OgaPi8lw==
X-Google-Smtp-Source: APXvYqzCX+uR6yyZpq/jmdYp7epbZRPT1skB478yR2lPA9B3rxQLF815d5TEzrTMYDsCwtjdf0jD4Q==
X-Received: by 2002:a7b:c7d4:: with SMTP id z20mr6595993wmk.135.1570699533878; 
 Thu, 10 Oct 2019 02:25:33 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s10sm8373770wmf.48.2019.10.10.02.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 02:25:33 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/7] drm/meson: hold 32 lines after vsync to give time for
 AFBC start
Date: Thu, 10 Oct 2019 11:25:25 +0200
Message-Id: <20191010092526.10419-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191010092526.10419-1-narmstrong@baylibre.com>
References: <20191010092526.10419-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191010_022535_264572_9CC49A5A 
X-CRM114-Status: GOOD (  10.27  )
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
index cdd4962484db..be535e23fc99 100644
--- a/drivers/gpu/drm/meson/meson_viu.c
+++ b/drivers/gpu/drm/meson/meson_viu.c
@@ -414,7 +414,7 @@ void meson_viu_init(struct meson_drm *priv)
 
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
