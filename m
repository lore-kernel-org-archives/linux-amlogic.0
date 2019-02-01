Return-Path: <SRS0=EwLr=QI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A97C282D8
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Feb 2019 13:00:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88DD0218AC
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Feb 2019 13:00:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LdBaXKFN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="EvH0kx6N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88DD0218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bkKOwTfot8+8Byk4wJqWxD5zvXY+JiboQAhRkqnPkGE=; b=LdBaXKFNMkihS8
	oHmh+gtOFBPmtjDfOcFisOEh7uawVdZwCLCKXgt8LrnqwYv31dfUQXUowPcRU3Mo7DQXOwpuxTHuK
	HM2aBLebJEzPApctcIeBgM0uLl8GGNaWQWzEtrUHBPWpbMcZtbHn4+ZPageqBPKjSYwg35/+WXWbE
	0wwQbQzyI68VjnwPf/ANkOtIDiwMz95atilUY8vgYJHMpV0u4mfBChvXE4EyIG9L8uk5J+mNiATTR
	z/X2fViOcZ+qfQIv/Bor2kcddXqRC9UCEshQjX71w//huSZgKa486Dm2w7tp0yAisX1kdp9NYTocc
	ZhKDvdBT9DxI6PfUxCjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpYQG-0006X8-RO; Fri, 01 Feb 2019 12:59:56 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpYPE-0005Or-Qq
 for linux-amlogic@lists.infradead.org; Fri, 01 Feb 2019 12:58:56 +0000
Received: by mail-wm1-x343.google.com with SMTP id f188so6089270wmf.5
 for <linux-amlogic@lists.infradead.org>; Fri, 01 Feb 2019 04:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jxiL0ybfHeOFIjwNJisaDSjhHM5fwBbvxrHh17glkpo=;
 b=EvH0kx6NzUysm5g/OyjTfpqeD0GnPwARjW6io+ERpbh2QyFfQmh7Cn3kV2aBhDE9nS
 PKOWv/E60KLEhInMo63S9dDv3hSxSIhPK9KIolcvNUpf65A0ECZ92ytm2L9+6+oiD03x
 /lpXe2uzD3PpkHlKOEUfb9JOpfo3QtZmxU1MVh5ay4iI+L7UbCsHxPcj7ODh4Vg0nkHa
 vJHe69/kyk684oKZcZ5hYp5RDBdV49NJsAoyt2HixQ4AyfcfhcV3klOj1qx/iw/Js9rP
 Pvv5KJiX+aRSydqhOEpvpfC7w2WTjEMRbdgQj4xeXjGBthIKVXI0h8vGlCp/fc9QXre5
 R0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jxiL0ybfHeOFIjwNJisaDSjhHM5fwBbvxrHh17glkpo=;
 b=Tszmb1+7fi4YPGk0fLxDZFcmbylHfDVGuF0sKDXATWmWRcXorY8gCwVVWoji9fc0zp
 5wHC+K+a6Vp6J6SJhn92SXNLGla+cZgPsdwjBo0MjloHInag5Y6Mtv2VCzyXqMSmz6pU
 ynW4C9F0d5Wkt3IwnoGF1Ec/TsJUJaaj3kgSPXpFeB+QWOJy41bGfvBX/UXRODyUgV/P
 Qa5P70JNhhS/6HTiIGfED+CyLHtRIPNC/aTJXRCTiRoAvvujIzDp4sgN8BhAjjIPG5pU
 8x8x7rLoYN1vMO1s8R+et0S8pdktbpeVmGlUNEoC9g0lFjc4ArodutfWjDfvHVTgsn5k
 I3tg==
X-Gm-Message-State: AHQUAuZsA+ivULnT+kxz+/JMrMuLL2bM405rBytCR8692AfNehRyk4ps
 lvCnQxtwFiMDfIH/dFbpDYBaiYpzoCE=
X-Google-Smtp-Source: AHgI3Iaqd7wlIJoDhSsf/qPPHdLn8s4GYcdwmD2BRthRXsDRPsH/3S1SbyGD6WMUTGopt49vdm/xSA==
X-Received: by 2002:a1c:400b:: with SMTP id n11mr2439120wma.85.1549025931524; 
 Fri, 01 Feb 2019 04:58:51 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id w16sm8709750wrp.1.2019.02.01.04.58.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 Feb 2019 04:58:50 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 3/4] clk: meson: axg-audio does not require syscon
Date: Fri,  1 Feb 2019 13:58:40 +0100
Message-Id: <20190201125841.26785-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190201125841.26785-1-jbrunet@baylibre.com>
References: <20190201125841.26785-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_045853_212782_9B4A1D9E 
X-CRM114-Status: GOOD (  11.32  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The axg audio clock controller uses regmap mmio, not syscon.

Fixes: 1cd50181750f ("clk: meson: axg: add the audio clock controller driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index efaa70f682b4..2479dab09d70 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -50,7 +50,7 @@ config COMMON_CLK_AXG_AUDIO
 	tristate "Meson AXG Audio Clock Controller Driver"
 	depends on COMMON_CLK_AXG
 	select COMMON_CLK_AMLOGIC_AUDIO
-	select MFD_SYSCON
+	select REGMAP_MMIO
 	help
 	  Support for the audio clock controller on AmLogic A113D devices,
 	  aka axg, Say Y if you want audio subsystem to work.
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
