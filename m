Return-Path: <SRS0=EyLh=XQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 858D9C4360D
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Sep 2019 15:21:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 572AC20717
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Sep 2019 15:21:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dsatdmaa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="jbSHNaXE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 572AC20717
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UPgxWC5k3RIM8BXlhwVOoBgTNFdpUjUM5FyT7420OD0=; b=dsatdmaaMAzezB
	A1eOJgTLjZfGjIJ6G8dcXcINlLGSY1VSv0DLGRxjC52ybXYzNCtvovwkiHOwURHMsU+wrd5mNul6G
	+V597uI+Faoyh6Jn3wqGJ9rQC00hKIcz0vvkbK5enEu2HCH9DgII+bifEWPVTPId1gGHhE11X+mCP
	49Z2FCILqCMWNflM3R1qWVsl3dlrV3dZIoH4xK3SLTb9zfPJpVQrXBHAwDODUJDDOTOk5ofJGAtQZ
	i143gZn5bgK3BTqMvVpsB+s0Lq3pPmQzP8ocJPDVo/iz+oKpBHLpkvAaLnIFNbGaMUWVSGsDuEybN
	Soh6vcB7kF8P8u/Pvq0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBhC1-00053N-2w; Sat, 21 Sep 2019 15:21:01 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBhA0-00028x-6W; Sat, 21 Sep 2019 15:18:57 +0000
Received: by mail-wm1-x343.google.com with SMTP id i16so5390386wmd.3;
 Sat, 21 Sep 2019 08:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ryY1C6V/Fnndw45BEkZbgWqU1CO6K4z5Y17d3HMNBz4=;
 b=jbSHNaXEeYn6hTwnob4r0cFK1tawMR7cK74NLvuSDg9K1Q+i9UN9MDMzyPNum1rg3u
 3+Zlha3bTktCHxytNPYwWn53kVqaCHTgDo1L0cjl3wRSBAjIgHQkbY/BPedgCdfd+m9m
 JA6TQEeNuoNw7bN0LVMoBnGgKOo5DmAPmrUPyP62jHCdLV+yumcWomD7WbfFLICNTIMl
 wOB/n0k8in4sKU/Ftefui+uGHNdWEvAMHFdPXAUmYacmj0L6jE0PslD3GpFqk++rcNG6
 8ykti5lqNIIgp4jx0YLk0usYFU/nzwdGlTbqK72AnwmeBGV/FbdcGgiN58hjVeP3yfjM
 XSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ryY1C6V/Fnndw45BEkZbgWqU1CO6K4z5Y17d3HMNBz4=;
 b=WeV0wzWlmV2BFryMx+NeAnaicgXagkWvGZRr0qICkHPZ3exoV+itlno+hSv9tBv3Ck
 N98FXBvA9K52hUGs+R+t/DnSzAp3lb7bAnJliQO3++pMWfu3po9Tah960xElKJzfHoFf
 JtnbXG31tu4V+0OuLUmd9dQ47N8f05sdg2A/iM0x3QtL9g80ZquQYOrBoTbfi2o46wv0
 qqMs+YO762+LgvfrMcS95Nzq0PuWHg50iTILUEK2TgWgS0T6Wq8ub5g6p+5i9qT7odOU
 Sl5Hmqe62c1neRwRfo2eR20h3r30ua8wZUNLblN0vKutTYcYbZkaI7Im0dYhgqrK0EED
 4ANg==
X-Gm-Message-State: APjAAAX59/MgA6w9J1Iyw6mmnWgMKTsfEw6J+UgkErHYAsqR2JuwJEes
 mzYROX+m63tOCXio0cetm+w=
X-Google-Smtp-Source: APXvYqzBWlO/a1o7buEzHL4fJp72XmAnFcohUCZlv806SiF/cVfQ3RUOZrNiEOVvXdyUtLEN+b6d2A==
X-Received: by 2002:a05:600c:217:: with SMTP id
 23mr7868145wmi.76.1569079134900; 
 Sat, 21 Sep 2019 08:18:54 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133CE0B0028BAA8C744A6F562.dip0.t-ipconnect.de.
 [2003:f1:33ce:b00:28ba:a8c7:44a6:f562])
 by smtp.googlemail.com with ESMTPSA id c6sm6003120wrb.60.2019.09.21.08.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2019 08:18:54 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com, robh+dt@kernel.org,
 mark.rutland@arm.com, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com
Subject: [PATCH 6/6] ARM: dts: meson8b: add the DDR clock controller
Date: Sat, 21 Sep 2019 17:18:35 +0200
Message-Id: <20190921151835.770263-7-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190921151835.770263-1-martin.blumenstingl@googlemail.com>
References: <20190921151835.770263-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190921_081856_317762_AE96A5F3 
X-CRM114-Status: GOOD (  11.09  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the DDR clock controller and pass it's DDR_CLKID_DDR_PLL to the main
(HHI) clock controller as "ddr_clk". The "ddr_clk" is used as one of the
inputs for the audio clock muxes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 1934666ff60f..8ac8bdfaf58f 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -4,6 +4,7 @@
  * Author: Carlo Caione <carlo@endlessm.com>
  */
 
+#include <dt-bindings/clock/meson8-ddr-clkc.h>
 #include <dt-bindings/clock/meson8b-clkc.h>
 #include <dt-bindings/gpio/meson8b-gpio.h>
 #include <dt-bindings/reset/amlogic,meson8b-reset.h>
@@ -172,6 +173,14 @@
 		#size-cells = <1>;
 		ranges = <0x0 0xc8000000 0x8000>;
 
+		ddr_clkc: clock-controller@400 {
+			compatible = "amlogic,meson8b-ddr-clkc";
+			reg = <0x400 0x20>;
+			clocks = <&xtal>;
+			clock-names = "xtal";
+			#clock-cells = <1>;
+		};
+
 		dmcbus: bus@6000 {
 			compatible = "simple-bus";
 			reg = <0x6000 0x400>;
@@ -434,8 +443,8 @@
 &hhi {
 	clkc: clock-controller {
 		compatible = "amlogic,meson8-clkc";
-		clocks = <&xtal>;
-		clock-names = "xtal";
+		clocks = <&xtal>, <&ddr_clkc DDR_CLKID_DDR_PLL>;
+		clock-names = "xtal", "ddr_pll";
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 	};
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
