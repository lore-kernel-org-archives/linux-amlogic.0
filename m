Return-Path: <SRS0=v4K1=EY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06ECAC5519F
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Nov 2020 19:09:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2DFF221EB
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Nov 2020 19:09:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tS3FMKXj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lM+Fn1he"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2DFF221EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zDe1hf0c1USFxVSYpj20M1758+fFjgm8BkEQTeAr6yE=; b=tS3FMKXjOZbwngOpozj4oJ/xs8
	1A4jnUcWpO0I8nfgz7H/6St1QUQJE59Jc3ex2Fu5mY5YnO4/VqWwoT6JsZ94PZlMvrd+FtOKHfAcW
	xQohwhUPT9XaYXo7xqKcKhOYkcyIgNbz3HfFe33sGTeD18qt7gbH5c0PxVBIzkGPPiSFqkBCPY7JY
	eA39EEGhaHQndg9l3nOCjtzA0okF3/Z04k8+VRyJiW/c+ItOvG5Wk0IHOKugByDCWvKGiF/sWyh0e
	6eDQiGfbfadzKQpqP3cHNhOOFFKhJWvmGNX3V9wn3NBKo29F44iC7nJ7qz8dpa2xovhS6alOCI4PF
	DPc5kzew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfSpm-0004jz-Co; Wed, 18 Nov 2020 19:09:38 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfSpk-0004jI-1o
 for linux-amlogic@lists.infradead.org; Wed, 18 Nov 2020 19:09:37 +0000
Received: by mail-pg1-x544.google.com with SMTP id 62so1825376pgg.12
 for <linux-amlogic@lists.infradead.org>; Wed, 18 Nov 2020 11:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yT0JMSmjJM6U+7Voml4XWy09ugN1e8X3pPDba2CCdew=;
 b=lM+Fn1heA0cHwA3lCopbawYfhE4BSJ+FOOfbghj7Oopy/7+J2tOdqU5GoWNFR8CQfI
 6NeRq6MDoHVpA70uf4gHwsyKAoAKRntrmkYKe/zISSmdLzrfa89vfoY9TBGtrc3bPRuu
 rBA8yKcaeu712x0Ko7n7FKvruPpbtCUKrlNhOMBh8lz6AnRDqa2oWTL8eLgXQuicvJzX
 aO2py0eglkfFdBEiKTxMa5ObV8OrNEAJzDXZth4DopzL2zL+GJJTcMb+MHe6ZTvPN4Gc
 QtpdQbZnRRdKQm+LrMeFQIYxcwg52XYfw//emNd4WD+j/HHJkqAjnz6KEP19JvPSeBAF
 o3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yT0JMSmjJM6U+7Voml4XWy09ugN1e8X3pPDba2CCdew=;
 b=NKDAG299EtuUvlx0hu69S3K9frpBip/SQ39cRGVzpzKfaBRbrngWwsq696XDTWfX2U
 GV3vxbR0VuxKocjG7gA/x8efaMc5IhrbsUkDqIr+Vt1atTW2RxYLHRJuPDGO2flikDeh
 SzI6FmvP+AHzyYg35/eBO1NVyo4vGSp6XbzH2gAtmoPJAEEG6WmGOweBhWg9XTmbJUzL
 n579CuOXuvAXrfZWIOTanawJ03r06sizZbX256DOSWLclCyK4sEt7QBaFx06FVoqzzvu
 NhHLJV2xDBHGiwqmnJu/CyklRw99OOj4RXuKVG37RpXAn8wyx0W+dQy3XkRA7te8c0Eb
 K2Ww==
X-Gm-Message-State: AOAM5323unjtqGPKKEkKH2l2s0ndUsY1PEMiBJxOudfmrm/Fwf0f4S2l
 am0uW3F+5DCbC/6+n4skU5sbLg==
X-Google-Smtp-Source: ABdhPJxEo1Z+jodqK4KA4P3NmUTQuVHgeaweqOSsEp7aVfQzsmMcyGbRKn75qeIXTySiJ0uF24ilcA==
X-Received: by 2002:a63:fd0b:: with SMTP id d11mr9271002pgh.50.1605726572110; 
 Wed, 18 Nov 2020 11:09:32 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id z9sm3243505pji.48.2020.11.18.11.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 11:09:31 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Brunet?= <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] clk: meson: Kconfig: fix dependency for G12A
Date: Wed, 18 Nov 2020 11:09:30 -0800
Message-Id: <20201118190930.34352-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_140936_225480_482BA4D1 
X-CRM114-Status: GOOD (  10.95  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When building only G12A, ensure that VID_PLL_DIV clock driver is
selected, otherwise results in this build error:

ERROR: modpost: "meson_vid_pll_div_ro_ops" [drivers/clk/meson/g12a.ko] undefined!

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/clk/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 034da203e8e0..9a8a548d839d 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -110,6 +110,7 @@ config COMMON_CLK_G12A
 	select COMMON_CLK_MESON_AO_CLKC
 	select COMMON_CLK_MESON_EE_CLKC
 	select COMMON_CLK_MESON_CPU_DYNDIV
+	select COMMON_CLK_MESON_VID_PLL_DIV
 	select MFD_SYSCON
 	help
 	  Support for the clock controller on Amlogic S905D2, S905X2 and S905Y2
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
