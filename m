Return-Path: <SRS0=/MY2=SU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE00C282E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 12:27:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D50EE2083D
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 12:27:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oGZIhtjI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="h0cyWpdf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D50EE2083D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=04EmdGHRBFE7K4BIiD+pyYqmCKOSUp8TZd6j3sh7etw=; b=oGZIhtjIwys8BY
	34mxg0HoUrmDn/oEnQ9+tDYI5RpItjp1tzxYbi8qeDSQmbqEzcySKerbm+a6N2i2yOzePJasHEs/Z
	bWlBZ5+cSmxmYXglYyen0Q2Z6wFI4FIKH5DbbGxIXJt0Jxz3KoFGrD+MxHtK7HNWVNi80zeidEv5F
	WqdYMZotycMApDi7wO/ZFNrukS6E2WHOKV9mrNF6Hxi/byp03kb1qs8Kpr2/WPgZTngK3A6ZrKB9q
	oqk9pVy9TwK1UL6A7N1ayyO5h15XNJapmcFJE4p2LOO/qrtrtdELhwyziNRcBDMy52s4MV2nifDBp
	XdfgDABT6XgwYVliTh1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH68i-0000fX-UD; Thu, 18 Apr 2019 12:27:40 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH68W-0000PG-7U
 for linux-amlogic@lists.infradead.org; Thu, 18 Apr 2019 12:27:30 +0000
Received: by mail-wm1-x342.google.com with SMTP id y197so2709415wmd.0
 for <linux-amlogic@lists.infradead.org>; Thu, 18 Apr 2019 05:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yaNaoCP8pznZw7TWRPuJzQR6dBbJDMZ7bf+8pYaycCk=;
 b=h0cyWpdfjXxV8o+0QGI1FlzKHsaxQknwUXk/WWbneAyFQps4Pba5SIW3NSGPWWsnFL
 43t62Hrj7vX2kkjEvMPdQzQzVuK8vaXFquY10j9xlxnSvwUFe5GcjSIgNQIaN8V2H3Or
 PBUBDrFB4LhLjJFzpimxMICN05ySGkVd8on/MU9DF2dgvCmGaRS+gBn/iU2E1li/g9pU
 q517mhg0TJ4KNmzZBiOtK7hnomX4EqtkPN14ddYyShTOdtzpocBQkcZDfRoavw3WaSQk
 AQJ8rdHfZAV9GXpqkdxvceT1obOmnnSJujhYpPDYKb/3QxY8SF6Vb+PhYu86FrCTqnrO
 asCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yaNaoCP8pznZw7TWRPuJzQR6dBbJDMZ7bf+8pYaycCk=;
 b=ps8/d7A/CJPuv+wqCTGTSsaDrbNd2lXQrpgjqL9HuHsdaiB4IGycil3AFIxCRkJY23
 Jp2y8WCI1cH+t3w9wJaPcRhKGlifZJwFeOx3tJv+38mew7lza2OhlGnR7DAXqAqfqHGK
 sZZGZAhE0ay1Xa4/ikFmPnSQNpniARC/BQZ8xhKI5kG973Lt5ZJhP+7Jl+85+VeVriaB
 X6gjXlqWRgj71uI2GlMHjKZyRGF9aKyWjue6YfTPqu02n1Ka5Py9PVSzlOlmaHZXm6eO
 wFfjnkjg58VdYCdagFurl4MCsyi6wfXLLDLWN+ASFibmxssrU9UwHGzh0Hh0wjsSIZZa
 mzAw==
X-Gm-Message-State: APjAAAVoqbwOuutk0Mo4xm+3k+i2dtxIPjnkOUE/jVbUHIb0qTpmeswa
 ffbUuwkF0c6OnSfk1Agn4hVpgQ==
X-Google-Smtp-Source: APXvYqzXo52LNbrT7WhG1D3rHAqhwljMhATMhsgkdlDTHXLjnfTqq8nO4kPHYeDdHP5ItwfliWQUvQ==
X-Received: by 2002:a1c:7e0e:: with SMTP id z14mr2817731wmc.95.1555590446600; 
 Thu, 18 Apr 2019 05:27:26 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z14sm1510110wro.81.2019.04.18.05.27.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 18 Apr 2019 05:27:25 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/6] arm64: dts: meson: libretech-cc: switch eMMC to 1.8v
Date: Thu, 18 Apr 2019 14:27:10 +0200
Message-Id: <20190418122714.30805-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190418122714.30805-1-jbrunet@baylibre.com>
References: <20190418122714.30805-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_052728_490337_EC3F349D 
X-CRM114-Status: GOOD (  10.80  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

While some 3.3v eMMC 4.0 are available from libretech, Only the 1.8v 5.0
modules are recommended and supported for the aml-s905x-cc.

the 1.8v is provided by LDOs on the eMMC card, from vcc 3.3v

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
index d4d5e3e5439d..b0f22cdb586c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
@@ -115,11 +115,13 @@
 		regulator-max-microvolt = <1800000>;
 	};
 
+	/* This is provided by LDOs on the eMMC daugther card */
 	vddio_boot: regulator-vddio_boot {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_BOOT";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3>;
 	};
 };
 
@@ -253,8 +255,9 @@
 
 	bus-width = <8>;
 	cap-mmc-highspeed;
-	mmc-ddr-3_3v;
-	max-frequency = <50000000>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	max-frequency = <200000000>;
 	disable-wp;
 
 	mmc-pwrseq = <&emmc_pwrseq>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
