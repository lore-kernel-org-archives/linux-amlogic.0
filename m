Return-Path: <SRS0=N67E=WS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85651C3A5A3
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Aug 2019 14:26:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C808233FC
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Aug 2019 14:26:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kAuEOT+a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Mbo1AIuv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C808233FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yIu60utRmifz2/MU7Gy31YcGsCRTEkO4k0ZrCducbIM=; b=kAuEOT+anBK/6p
	J9xbki+7+y8j45iyqq9yzgj9EkqeY33f8Za6ynlOf8Z8IzXkMiQteY7HYggp8HFOnGF/HlewRHS2C
	FMcZ0+IRQWOnljvjBNnoPfX0xT9NiOuf+gqtjrZ9Evu6CVIzN4AZrcnu0L6/rnin8DSSk6j7GWt1M
	kur3W/2GXvKKN+ZQS83EnnmfTfBJgbF8UgLsaL+VAvj4VqXhtQ3bCgQKkIkv160F+HcpWMcabTSwH
	ii9Gc4iShCSQaLsBGCC0JR6FtKZ1B3lV9R/UgceV7V/mJNnKW5vHbKG3DMsbU9P1ZZhKPqDEnIJQA
	7R73WxHCG5ImEz48E/wA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0o2h-0003eM-KP; Thu, 22 Aug 2019 14:26:23 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0o1R-0001is-Uw
 for linux-amlogic@lists.infradead.org; Thu, 22 Aug 2019 14:25:11 +0000
Received: by mail-wr1-x444.google.com with SMTP id b16so5612869wrq.9
 for <linux-amlogic@lists.infradead.org>; Thu, 22 Aug 2019 07:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KG2NcaIwbNAD280NQ64Qs5ode6pikwpdVx2HlcQqOdg=;
 b=Mbo1AIuvdMXerHdaswfzRwqBNLg0dn4ksMsbHBX6Gzz7CO7Ed8uL+57KRDLMsubeLI
 i9fwlUGa8+0jRP1vOy249LbGNk6rCoLl/5SsfipVbB/xjyDOYdJJNYFajO4lqCfdpUUa
 NoZd+QfZk+EgydZA+CESI2LeUcOwP/RnN6ck8dKPbdQW5zfLgajcRvdq6vyVCh5uMI/7
 WGhpSR0IStar+a3Sq2R6J4jcSvZSVx/eb5bYo3QM44Pw30SvS51m+9eaMlT2W0/cxmOS
 nmdqOZq+uKhu/pSdFXAyCX40rJv4yyIbON40DFdjY1381M1P25kT9V/MA/gK94kpSsBr
 brYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KG2NcaIwbNAD280NQ64Qs5ode6pikwpdVx2HlcQqOdg=;
 b=cYEJPlLfVEmZtZAVc4M0T3ADQ8UZm4SMGjKE00z0XCT3Q++zd9ORRflSosBNlr090i
 OLYodnnq42SPGSMZEgwcsiCzMlRSCZLPKTwJC4n8Q6Q4cpSUuAzvbMIRhg8kMTGMjwI1
 KNce2u8Q+4j2+qOHKZLyHQXJ0Ar0j3TC27B0+lDkSRoTphFThoU0bJfBLNvtm/XFFbav
 SM8f8CHj5YSZ9mC0yzCJ+Iigpl42Iukw/xjdRG7uH1+jW++5mWPt6UwqOnG/WOiiUPCu
 YT50+9WtaufZVgh9hV2Yza3oG7euqRyWff3f9jrUL6HRQc8qNGB/XoHqhFMKS+RdE1nq
 MpLw==
X-Gm-Message-State: APjAAAUFWvpoGp2ZA1Qr1A7xFSohFfkRNGbyHgb7YIQMpEnxF9YEYKgN
 pcqY53OJiRr1t2PJ5fLOtLJ3Uw==
X-Google-Smtp-Source: APXvYqx3Mh2RGDC4m6KW3PjxbIkLg6LPgBiTgdSz+Ekeh7xQUa6XovZaLMvsi4r6rmOAQz3j+lYyoQ==
X-Received: by 2002:adf:e708:: with SMTP id c8mr48174622wrm.25.1566483904374; 
 Thu, 22 Aug 2019 07:25:04 -0700 (PDT)
Received: from bender.baylibre.local (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id d17sm25806547wrm.52.2019.08.22.07.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 07:25:03 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	jbrunet@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH 5/6] clk: meson: g12a: expose SM1 CPU 1, 2 & 3 clocks
Date: Thu, 22 Aug 2019 16:24:54 +0200
Message-Id: <20190822142455.12506-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190822142455.12506-1-narmstrong@baylibre.com>
References: <20190822142455.12506-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190822_072506_181140_9ABC3587 
X-CRM114-Status: UNSURE (   8.09  )
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
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Expose the newly added CPU1, CPU2 and CPU3 clocks bindings for the Amlogic
SM1 SoC.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a.h              | 3 ---
 include/dt-bindings/clock/g12a-clkc.h | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
index 4682a4442ae9..9c1dc6ade3d6 100644
--- a/drivers/clk/meson/g12a.h
+++ b/drivers/clk/meson/g12a.h
@@ -257,9 +257,6 @@
 #define CLKID_DSU_CLK_DYN			250
 #define CLKID_DSU_CLK_FINAL			251
 #define CLKID_DSU_CLK				252
-#define CLKID_CPU1_CLK				253
-#define CLKID_CPU2_CLK				254
-#define CLKID_CPU3_CLK				255
 
 #define NR_CLKS					256
 
diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 8ccc29ac7a72..3cfefaf43315 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -138,5 +138,8 @@
 #define CLKID_VDEC_HEVCF			210
 #define CLKID_TS				212
 #define CLKID_CPUB_CLK				224
+#define CLKID_CPU1_CLK				253
+#define CLKID_CPU2_CLK				254
+#define CLKID_CPU3_CLK				255
 
 #endif /* __G12A_CLKC_H */
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
