Return-Path: <SRS0=VwQT=O5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDB7C43444
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Dec 2018 16:11:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CF76206C0
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Dec 2018 16:11:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O0ZwlWcT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZiU44Uih"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CF76206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KXCWQ0zXIrQRNI0mRDTK3pzuQMA5KhE6J1G+BJwBfXI=; b=O0ZwlWcT2vMfpT
	I7aJpcxo4QAy3QL76k7vEV3PNCb5aYqivph2u0EZsikRLeE56HyziOUA1xvV7qXsSW1aCfEDEnnjd
	9yQeAK7ZoAou02hZynoKdb+rIcLf8qq8/GxOapwm8tb5+g1EOof5GK8zPiDGNuI7XRKNTfe94rSvP
	Aeu6WUAt4w48NCm1PKQtV/u4SGjXljiBgUwI3vp6vkSg5L44MtXzgz8BQ9HBsfp73eYq2BILfGG1L
	AskaJRkUVsMIW2X+FIhZMIu0LMVMfVwM/JibkrFKsODg/vnudE6FCODOK4CtIUFTNB8etSE6m2DgH
	5gJc+qgwJRMfZXFKqDyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ga0ue-00078K-1r; Thu, 20 Dec 2018 16:11:04 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ga0uY-00071j-23
 for linux-amlogic@lists.infradead.org; Thu, 20 Dec 2018 16:10:59 +0000
Received: by mail-wr1-x441.google.com with SMTP id x10so2323870wrs.8
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Dec 2018 08:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QjVe3lROVBqlIiyvJQbtG1oGTNmeE8FN/piqLb6ma88=;
 b=ZiU44UihTjPFm4vBM9gq5QoK/bNtmqe1eH9RBf387klB2o9PYnyszhzjHo8Lf349nQ
 Gg+/u7ZitKXafBcIIdQs/nwhHzKfltHjZv334tV+IP1WW9nkiUSyZN99ElSBbQCuamLC
 yel3TDv/i7gIcYOji6B/WmUv/0lMc9gWSpV8fsLP0eGIPzC8D69akg+Q6qlrNR8uZUmE
 Af754XMmAZGx39PHnuHMMRICbz5JqZm0lqHJKzzkQL6uFX35yX2Yc0fAP8Uv3yo1MRdg
 7pfY/JLaA4/AJ8ZbP2Rn36chBwDl/QZBCAmhvbcVgtcqd+EioXQueQlUOAHYSkOwIAHy
 jLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QjVe3lROVBqlIiyvJQbtG1oGTNmeE8FN/piqLb6ma88=;
 b=JMrXdBfmr/kSrfDdtnEMyDzHtZiQJXsRxg8jncihuLxdcTOQ6tWCiBXOU0Tso6WtIm
 7Du+SDU7ZLAYSyt5qfqxBtS6CCDKezaK+1fGdb6JjpDi+ZQ+xkNUi2D0eKKCjP8ZfAHu
 i0WqBqArbRaHarAHpxuju41TQ7hHVcFDOaQmpLaFy9AzLx9wHktrJIy0ngF9xXA2vIfQ
 7O3w+miGpEg9QeL6MR9cIBKnWzMFu0+uT9zZosVEMa6qG4yMXEB8NJEoECSVlpSBtM6Q
 srHaYEvv1MKLShZb/ID7x+KsQmAYAh8ERu30NLzI1MLtozzClmhDoXDtygdPnFIcyVIb
 ecjQ==
X-Gm-Message-State: AA+aEWa/Z99axq0Xf/T2V+h0VdiyLRb/mUdGCJMJQ+SKcOYN92UN3eoP
 DzKEYLfwURYETjO7qyjxj+7TWA==
X-Google-Smtp-Source: AFSGD/XOn0vYX+lsI+bMf558aC+MgeaR8reEXGv8Kwdl4L8ZzmaZXj1VEHKcNoRF+PBY5mt+cgbkGQ==
X-Received: by 2002:adf:d0c9:: with SMTP id z9mr22378940wrh.317.1545322246254; 
 Thu, 20 Dec 2018 08:10:46 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id x10sm10941186wrn.29.2018.12.20.08.10.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 20 Dec 2018 08:10:45 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>
Subject: [PATCH 2/2] arm64: dts: meson: libretech-cc: switch eMMC to 1.8v
Date: Thu, 20 Dec 2018 17:10:37 +0100
Message-Id: <20181220161037.23756-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181220161037.23756-1-jbrunet@baylibre.com>
References: <20181220161037.23756-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181220_081058_095288_45C34F1B 
X-CRM114-Status: GOOD (  11.08  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

While some 3.3v eMMC 4.0 are available from libretech, the default
option for the aml-s905x-cc seems to 1.8v 5.0 modules.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts    | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
index daad007fac1f..d0d202cf7161 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
@@ -118,8 +118,8 @@
 	vddio_boot: regulator-vddio_boot {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_BOOT";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
 	};
 };
 
@@ -254,8 +254,9 @@
 
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
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
