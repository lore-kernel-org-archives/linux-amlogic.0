Return-Path: <SRS0=mlCU=YO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EFF8CA9EAF
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 14:30:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D09122084C
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 14:30:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iHm7xU3t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="b8B6lOgo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D09122084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZkehY+AfUQJtdN5WZCJD4j9vVgDNE7r64Qp2dqXAjng=; b=iHm7xU3te4ONZs
	chQs/zEZYiGwPs8UNDidl8T84WGCgEQy5ImXYc9P5Xho34iERZkng7mJgrN7AGYgHr31dsPTTcm8c
	+wCmQcCEV3jTlBlmTUcpYxFFvwm3OJfu1UotdXsvBz4JYRE6l1X1ALV61IFTyIrn/NJkaRt5NWj3A
	HqZz5cGC7RdUeQ4aSuzifMSQrcWKL5Bd7qm8BXzYPFZpY5yQhvnAyle94RUKkR30PThnrG7TvDRr/
	IxJqu0cBwXot0RbMRBNbvUU79/e+ltBCdk2K3UK2BPkwpocQ1Ua1HKl2ZIcpOYyjC/fnJH0vrtDNo
	b/qbfCuzZ+3IZlHW7K3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMYh5-0007oU-UR; Mon, 21 Oct 2019 14:29:59 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMYgH-000716-HV
 for linux-amlogic@lists.infradead.org; Mon, 21 Oct 2019 14:29:10 +0000
Received: by mail-wm1-x343.google.com with SMTP id q70so6405839wme.1
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Oct 2019 07:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n78tQVq9/plAz92sXVKu4tP9hWbwiMaXkerT080cL4k=;
 b=b8B6lOgoNis+uT9WeTDkEpstRZbzzFC6/3vDzjhz8m6KZvaEfukyLK9WO20A3gPeCQ
 uEERmRuWMkFNgbW7Z+mm/FJ9nyVvTyK/c6W6mlkQuSsnThCrP3SjSc03asVXKTcVaUxQ
 +mH7CcOORHKRGfA0a7C4jpT+QjKyjAQG3j8urpXqjuhC2YR0Ue5XtQ0xPjU7DMuoKyp3
 njRq3CdMflWesO4t4S/qVGEADwZSZys5FeBvuZ+SFEefXTGsrewBJkkI/74nVpDIk/6o
 0zjL+48M/Ev6Lm2vryoDh980gA7pKR43CxEnThIQWBI6isvkhgWBzFK/MFewl/+dSINv
 WUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n78tQVq9/plAz92sXVKu4tP9hWbwiMaXkerT080cL4k=;
 b=qWGYj0ZLCo7BykvCYov3qyInFEHn7vnCZBqQvdnM9+PpcYce7GffTfDOTkbwnvwxZn
 RTWCwrb8vZnks1kdOseMM9lyA+CfoGVCevIKVY6+qI5mo8/lFCvg4wA3v5GO1KrLg2I+
 yejDdSADau3UPjMfCMrR6Ix+m7zzK9Cg3+CyURBOhuXNyb7ocISggNlEee4ha3+wl7Rx
 SVSFfE+f/JHsH379Ybdu4Kx7AYgRQNluI8rwEkhfpmbh6h5gzjfvC3nlBtgArEOoDFbV
 Vgar9BKxxZUflyBxXgTCB/+zKvHm1MsvKWub2QDS4ClmJcAH21jjGWi7hUoyEqRRotUh
 fmSQ==
X-Gm-Message-State: APjAAAXsP3DA5BKFJ1qWcLoMzj2/Z3wz7Rr6MldBQj448f3IrJYyOv/c
 MvVQMiLcpEmi+pcTH9RSmEJ/0zr+BworHQ==
X-Google-Smtp-Source: APXvYqzuXnjhOxsZOJwteaURpR4IgYMNdjlr4hFzHFqPCiVyPffxvVGUoarHOGtpPpHrKSrn2edPfQ==
X-Received: by 2002:a05:600c:34b:: with SMTP id
 u11mr19655952wmd.176.1571668148143; 
 Mon, 21 Oct 2019 07:29:08 -0700 (PDT)
Received: from localhost.localdomain
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d11sm17304463wrf.80.2019.10.21.07.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 07:29:07 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 2/5] arm64: dts: meson-gxm: fix gpu irq order
Date: Mon, 21 Oct 2019 16:29:01 +0200
Message-Id: <20191021142904.12401-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191021142904.12401-1-narmstrong@baylibre.com>
References: <20191021142904.12401-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_072909_575063_D2346E5A 
X-CRM114-Status: GOOD (  10.17  )
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
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This fixes the following DT schemas check errors:
meson-gxm-khadas-vim2.dt.yaml: gpu@c0000: interrupt-names:0: 'job' was expected
meson-gxm-khadas-vim2.dt.yaml: gpu@c0000: interrupt-names:2: 'gpu' was expected

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
index a0e677d5a8f7..5ff64a0d2dcf 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
@@ -96,10 +96,10 @@
 		compatible = "amlogic,meson-gxm-mali", "arm,mali-t820";
 		reg = <0x0 0xc0000 0x0 0x40000>;
 		interrupt-parent = <&gic>;
-		interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+		interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "gpu", "mmu", "job";
+			     <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "job", "mmu", "gpu";
 		clocks = <&clkc CLKID_MALI>;
 		resets = <&reset RESET_MALI_CAPB3>, <&reset RESET_MALI>;
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
