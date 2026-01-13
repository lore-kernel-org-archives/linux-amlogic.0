Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AD2D0C849
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jan 2026 10:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ryqBNE9uEzWbtjHOshPha50yM48PMYdrYxmKH5gS3t4=; b=LwSErWAusr1fMj
	8Zt1drVKtiJXQIIk202g/7aiZSUwuhDLrwXJKNCqlY6p8le7PaPCQcf1CwaLYYRDHHuQ6gbxWSrbb
	ky7F1q8FgSFmKcAKhiUF0D8IZr47L/eAZYzviXd5iJPU7KdlzYr++XlaXoaELWJeFX9N4Pebnqv7j
	jqNUJrTVXz4NC/FveWdVq6fPPuk0IiT/JSbho5/8GmzuYhF8TqRwHCXxicZAm0uo823xzDkMIbTWK
	eYhCz4lxaQuysVYsslzGogztlJChrW+O1ChVverQQAfq8JzF3zbMc9TEIhK38F23dXxiPqfFTkLsl
	6Gw0E9Tkpcd5dgZ9yL9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbp7-00000006vF9-3H6d;
	Tue, 13 Jan 2026 10:40:29 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfboy-00000006v9j-0XfX
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Jan 2026 10:40:23 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso33875665e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Jan 2026 02:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768300818; x=1768905618; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZvYOPiTVFZ9FWIQ2SvlyO9MXmJgyIQ0Uo/FX54HgBVQ=;
        b=LsH1umw86fDJXt5tn0TcK/zz32xjcoTJkuBHrCAmwPWGbj8qWiUG8stBX7VJSC98U4
         7KJqO4V8XvkRQhmMD+xg/q+AdGBVB4v8F+nm8miOnWkJxqWJ8Yyy249jVv3YpLWXr4Mg
         phuXrMlAA9hqOpo6smp8MFsLMtcOH64WxAJ2JDdBWLq5tTzIhleGKTsuQWPO6ESy4rmh
         YjZrmGWC7Kj4ihj/KgaCHIUdVQasawrqAfX4vkrCTB/YB5rcsLCFsfpbvYxqeM8unMMS
         S07SySBxWOMpD/0bAztX0vKnaLjPML09U73Lnj1uYUXqebJqY7geQDizC9nXpnOjDmjZ
         YQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300818; x=1768905618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZvYOPiTVFZ9FWIQ2SvlyO9MXmJgyIQ0Uo/FX54HgBVQ=;
        b=Iy5VpUN4R0A082r5TQm7ItajLUmQalG9JcEgPFDjXAoQEDhmQmUdLJF48v4nN35PI7
         PHDP1nZsQiTVZeN9tEvj9CyDHSLIts/aEkfMgK03CCPgoe18MzCV0xd8nxclFSC3CBjm
         WZeOWMDAGaJ+szBGMWSj+Sc2dS/+nr/DKBwxbu/7kQYrmBPWVti9Virf/CDa3Spnk+5j
         bt3mNoPfExFTleJIm2+3A5Q0P7io0dj2Q0Vm68RWMjcSpgtledE/z/bOlfoKF9ytdf8X
         p9fREl6+lk/KH/5kBKYGGqavgMV0e5dkkbELObyrrxj0jPylRZVxbTyqdHym6HRZqe8i
         s/1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDeXxai9NVPi65ctC9JTq1ObkL0AHOq3izEX5SY6NSDk/Kol84iLATnfLp6moapNyYna8IMNcFfSSfUX2K@lists.infradead.org
X-Gm-Message-State: AOJu0YxweA2mMdUZxGTlsP8BfAPtfg5bixCFuUJ7mAm1FZJSSyKHKGQS
	/MItNLS8unTRMQ0UxzgBlFd8Aq5r6xvPT1HukZmR81Iv6+wCJC9K56pNK3bLMb8vf9pIk9tdRuk
	6Nhei5GM=
X-Gm-Gg: AY/fxX5s9t9qTiwWhW9TnbK80VLh7eSvsUwOEjGI+/pPh+NjBPrLajTTOw9GsoQXXAH
	+dUjFIC2bcWOdcxKeLlNMGb80ViqQM6rhI4r7+uRxeGFzPr2aI0CoTFoIbizDMK2eT2sWcnFDYC
	UbMfNrDXYkJmL1i7L98MJFIx8X7meX0GGG1/yY+yt3sorfR5WpnmGPke7lzYdCttKSAw19T9Hzy
	ZOWSnFtoWBA9LjSaM+Umx7P9+sR8cX8sbsYvmCMeznhmhWyunO08O1j8sJn4V9+ZBrCogoUWdTY
	ESmR872vyMmxWf9w18xCwDtjydSWo16jJBmsvUwSTjvFuPiGjvtzJ0EgzUILd6Rg1O/SFCoNStk
	V53CavDbsRyzSW1y920DlsMX6KhAto97AHaBdtqxRGDm57BaAeoCPPFj4QPPWR4KQKVTtUzx3se
	keN1gdyPLl
X-Google-Smtp-Source: AGHT+IGZ924VMg8uzSKwtfC9eu/S1JNn2hTcKF+qOW7nyEJ8PQuEIhaeFmemRi1BpJtXoN76awRbSA==
X-Received: by 2002:a05:600c:5391:b0:47b:deb9:163d with SMTP id 5b1f17b1804b1-47ed7c074e7mr29680885e9.7.1768300818103;
        Tue, 13 Jan 2026 02:40:18 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:982f:38af:1a7a:b10])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47ed9fe8fe0sm12812505e9.3.2026.01.13.02.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:40:17 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 13 Jan 2026 11:39:53 +0100
Subject: [PATCH 2/2] arm64: dts: amlogic: s4: fix mmc clock assignment
MIME-Version: 1.0
Message-Id: <20260113-amlogic-s4-mmc-fixup-v1-2-1ab1fca0fb2f@baylibre.com>
References: <20260113-amlogic-s4-mmc-fixup-v1-0-1ab1fca0fb2f@baylibre.com>
In-Reply-To: <20260113-amlogic-s4-mmc-fixup-v1-0-1ab1fca0fb2f@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2008; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=/WSQhdX7Z6q4cMkuvRYEqv/WFADsj/ztmZbunsns8fk=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZiEKF5+fmSyP5MAGqjOLa+6cYIni9bUXe58wV
 cAYYHOQXIOJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWYhCgAKCRDm/A8cN/La
 heI0D/9eEGRdXTHSdbcXVpKpHEFvYAzB8irOfQktIa6G7YFerAvLYaC6/VWwcFMRKUbh7QkofYg
 Vk559egLAaqUMZM7nbfrFHtiTRSxT0Yl3xpdU8u1zrELJ4OoKqfoKdKK7IK+iwCwZERrs+9W0fR
 eCZx8ot70COsfJpQHjG1y+OuTYB7gDhHhecT9knFW1cLBrllCpKA3iznCtoMGRbBvtWgGbPT8pQ
 rMVq71l8ehX/GgMQpmh3vnCn2I7S5GtU3dXYVXQTi4mliNDteJF2fmg7ZAB56MJNv+zx2+kY1ZQ
 rg7M8Z1j3oyV4avAPcA2I3zNIvRIM0ZrO0olh8w9IZ5ygifsDuMgaMRVjopQsvAN4h7C2r8P0JR
 36BjZw+H9hVW1Ms8LQv0WKVqzYSKyado2tDeYS3892CbtOGTQPEh+NXHmO/tR9hn77vNYyjZwBE
 BtZkqAV1zW8t9QyopKpvcFr1bQsiPIi6p+1wVEdI9HUKjO8F/TSNlbH3BykdARqcBous8tNCScy
 uUQvH9EjtO5GggN9IscxJpayHXfxW7dN/Tpg3TK3aKxcq9/6ObGz4b5Ug2jm1IKKb3IVA5QetV1
 jiXu/8ONjnTjhSs1LlNzZVSd7jkt7MUyfFJLEzhnwKTbNyuknKDXzOO5UpeUJNNMbPclC3ewyw6
 H/nuOgchU+xM7Yg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_024022_452606_82FA73B2 
X-CRM114-Status: GOOD (  10.14  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

MMC A and C are mis-represented as having their "clkin0" input connected to
xtal while it is actually connected to the MMC clock, mostly in an attempt
to provide 24MHz to the device on this input.

Fix this and assign the clock to 24MHz to actually provide the required
rate.

Fixes: 3ab9d54b5d84 ("arm64: dts: amlogic: enable some device nodes for S4")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 62538fd9db6b1ffb33a88e12628aadefbaa453ec..6324d1eb5994009df5b09923cce373a87229f4b8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -819,13 +819,17 @@ sdio: mmc@fe088000 {
 			reg = <0x0 0xfe088000 0x0 0x800>;
 			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clkc_periphs CLKID_SDEMMC_A>,
-				 <&xtal>,
+				 <&clkc_periphs CLKID_SD_EMMC_A>,
 				 <&clkc_pll CLKID_FCLK_DIV2>;
 			clock-names = "core", "clkin0", "clkin1";
 			resets = <&reset RESET_SD_EMMC_A>;
 			cap-sdio-irq;
 			keep-power-in-suspend;
 			status = "disabled";
+
+			assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_A>;
+			assigned-clock-parents = <0>;
+			assigned-clock-rates = <24000000>;
 		};
 
 		sd: mmc@fe08a000 {
@@ -849,13 +853,17 @@ emmc: mmc@fe08c000 {
 			reg = <0x0 0xfe08c000 0x0 0x800>;
 			interrupts = <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&clkc_periphs CLKID_NAND>,
-				 <&xtal>,
+				 <&clkc_periphs CLKID_SD_EMMC_C>,
 				 <&clkc_pll CLKID_FCLK_DIV2>;
 			clock-names = "core", "clkin0", "clkin1";
 			resets = <&reset RESET_NAND_EMMC>;
 			no-sdio;
 			no-sd;
 			status = "disabled";
+
+			assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C>;
+			assigned-clock-parents = <0>;
+			assigned-clock-rates = <24000000>;
 		};
 	};
 };

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
