Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03FA4C433DF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 14:19:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD6ED207FC
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 14:19:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K8gpXxSk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="albycSFN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD6ED207FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FdTn5MLlgXvZxf7p6g85JcbbKoSWfA+7iO/dDMrMm2g=; b=K8gpXxSk3jbHPevU1+umVITK5U
	/N61qqlQf3don15BQ9crupZuIKopTrbJjYqQjryOG7ji88tQ7Ws7WzGzhQnUDzgkU4WTW++r9mFp0
	xHgcGWZgCERYJgXZODjbdy6v+S3d4VXS8W2RSPqqveKmrmvY2TXv2gZDv+5+5eyc9GVc9PEXdTBzE
	EpRzDz038O0TYdCAOpwL2txTr9utOfVgdazUS1/cypr4MbzlGlRoESAB+gcAvwNpbe4cf4U2IbdL6
	nB/X5omMMC+LPXWLoODLpoYyBPTd5S2IkIO0lH9FzsfOMmPSJ4Q9n8DIOw+FezHrZ0jNK4FNaBLYr
	aKIRbx/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2bIr-0000Xt-9F; Mon, 03 Aug 2020 14:19:01 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2bIp-0000XT-CW
 for linux-amlogic@lists.infradead.org; Mon, 03 Aug 2020 14:19:00 +0000
Received: by mail-wm1-x344.google.com with SMTP id 3so15608988wmi.1
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Aug 2020 07:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y/qA8gSb5L1aedrAB+cnwrMt5FiS/mFTvYHuJN7H++M=;
 b=albycSFNZC8kfgH16k++F8/X0yCQh2L6nvlv0z/riHZdTBBLoXZIgUNGEJQJQXAWvP
 tpnajBTPb2Hx4MZG3B3ErbNiHPfmd8VavN/W+lWdxErdIktJY8VNRRsCcl1xDan0/98r
 lBLcz6Pr6HXl6waYqdbPaDrg+d64cAULpiD6puY9fAzRH1NgTNfQx/0fCYDGp/ncaEVe
 vTl+aMq27RjcFqaC7O0WV9P2RiNQp+RQFbK+y9VDuiBRY+h+NpniwBnXMZYrdAq+6mEs
 hDSXC1AvyoajqVcJDGSBjXwxJxLJ5F5zyyydA8w4XPdouOKsowFQMhW6SYqEqIJMfr0N
 4MIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y/qA8gSb5L1aedrAB+cnwrMt5FiS/mFTvYHuJN7H++M=;
 b=q8YEwMPM1oOWO3QVX1dRoMbM8ablNEIz8rgRzzstOtrcKLcrL8/Vy4LLEuS6WY8nej
 3DUnjXiPTnu8vzflI9vsMYInDqd3tAwgfJleYt0zsZHEkML3om+zaYH3+uaqidi2phgh
 8JFOlnJaYKq9/gE0SH/5HjMGjpoFU0UMzWm9S2prtjOp0NmCYa/MRMpk1DC0e8z4T813
 AY+n1naEYrdcyXkMDUc/Ws9BZWx8lsM93SXB/f+y4P2X77VzTMCJHfoSsd3BBDhex3iS
 WTG0Q/pqclrjT6bj3aV9PmZ+hX2Te0IyjYfHEUMBG4OZju8VAIwP8hwocCJh2OJp/FoK
 XbiQ==
X-Gm-Message-State: AOAM532XTkfNUtEKekr2Dkj4RZiBPJfVm2Lb2GLdqGpPilw/ZMV/eFuZ
 T+8Q8Ha7OzHeaNVODzYG3+VXUA==
X-Google-Smtp-Source: ABdhPJzbV6bSqxztQ0RcDqfomj9eHW6XIBQxGt/q6sEjUvi4WKNFFkRXdU/aVORDBtacwX1oL8hqYQ==
X-Received: by 2002:a1c:e382:: with SMTP id a124mr235177wmh.11.1596464338292; 
 Mon, 03 Aug 2020 07:18:58 -0700 (PDT)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id
 t202sm24870600wmt.20.2020.08.03.07.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 07:18:57 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] arm64: dts: meson: vim3: correct led polarity
Date: Mon,  3 Aug 2020 16:18:50 +0200
Message-Id: <20200803141850.172704-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_101859_545001_A5FB4728 
X-CRM114-Status: GOOD (  11.67  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The LEDs on the vim3 are active when the gpio is high, not low.

Fixes: c6d29c66e582 ("arm64: dts: meson-g12b-khadas-vim3: add initial device-tree")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 4510a63b0006..9e2995dc144b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -70,13 +70,13 @@ leds {
 
 		led-white {
 			label = "vim3:white:sys";
-			gpios = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_LOW>;
+			gpios = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
 		};
 
 		led-red {
 			label = "vim3:red";
-			gpios = <&gpio_expander 5 GPIO_ACTIVE_LOW>;
+			gpios = <&gpio_expander 5 GPIO_ACTIVE_HIGH>;
 		};
 	};
 
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
