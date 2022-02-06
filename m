Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6691C433F5
	for <linux-amlogic@archiver.kernel.org>; Sun,  6 Feb 2022 14:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XuPy1LQ8Cyzdy8O1V9LxKCQLHTbOvLTVeC8oEpay9Ds=; b=vAGHgzfVCqby3g
	NfGP3cdNmxmmcqOwJIweZdca3EAA7BLrxrZcJTnBlhPX5eCfvJbCxLKj45t+hlNLDnIcPGGaKxakd
	BG0jPh0Qg9w5/6lOqP1wgQayKiCzkaGdxvhRcq6UFComz9D82wWMU6IGjqI5v4cgEZ/6Ana3d19zQ
	XqErazrU0iGh/rPORJdJIqvMNXxJFzv9FiTFRrPmRnU/bUEKTXBTclJxU5ZVxTFIGtsHjjk8t4dkO
	y6eMv88KZDZsTo30G2xGME+4CoiJrn/XxNIsSwytoSh40VBmUyVyG/i4tGKevOoErF1tJAF7fsknq
	gZkpIfiKspLrqjCJY0xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGimG-008Kvw-VC; Sun, 06 Feb 2022 14:44:32 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGim5-008Kth-7e; Sun, 06 Feb 2022 14:44:22 +0000
Received: by mail-wr1-x42d.google.com with SMTP id v19so5601209wrv.6;
 Sun, 06 Feb 2022 06:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ER5tL9joKsP7B1sna5VGna8el05JPGgUeONDDnd65Ng=;
 b=Fg0yongwHkZ2lTRaO5rc6YlMEYfx40PVo032/ibh9mVuAYXys8uRb7ZmwqMjEGZnPD
 rCmwg9ejd3Oiwjzh7EYJ2tZpBViVTgVEbKg32Bbj5U0qAvXIYRqhp1Y9iLAegMMEVyKv
 +ortYmh8HPqjj9kXWYqEO1QDqoGxIzNfDoTe4oJy8H4uN0GWOMiTPP8H5Nk3heUBA+Sr
 /hm0SxDL8QA3fLWPIYrLMdRUGPrLBb/r20i+EUGlhWnCxqbfCTpRPiHsdZ9ncF0/1ULG
 egs1Y54tO9Wv08OOdt/Gic9EwGSnX7clVMSNpFLAyxJtnYUecJiJmghsTWxwZwv5s1uR
 qobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ER5tL9joKsP7B1sna5VGna8el05JPGgUeONDDnd65Ng=;
 b=3Nz82wt9jj3QlCDrUcUn3rlaGB1oB3d0SHcQWtybeP3h6L5x2SPbPIEsWDg7adswXY
 r3IjfDLJq3DC1XBV96NnDt/5mNheZerJXwgVaOaHHw0rkIhmKbeg1DbndLmiy+udKg1S
 Em/pHExcTUbLv4aaf9BKIFI4d9liEBt2W+c1K2AERUaOfK+dPhinHtOMSeykcAFdZJvW
 hSk4Fj9wpHmFOVB79jI/EHUDCVHc0b1gRe8ZIUTmrAMZsO+3uqcKYyvciiJUnBBuKWFL
 s6/jFxxJMcuTIY6C5H5jXKJW+wiUPp01Tq9kJrisy5oSfzxyZ7MpxFj3XiePE7V9a+w2
 Dohg==
X-Gm-Message-State: AOAM530U8t6vgtTRD6u4ntzIO8QlDtZsEN0vmIH958MmnLwcTb85zSjm
 FH0s1+qDeS8PgkXfQdKc7KE=
X-Google-Smtp-Source: ABdhPJyuqIsJhNOGpgrbrRrFg3RW0vhg0iwASL1X8Z5ta+K627QiZHRLs03dlq3CsFLY3JUy6lbNkA==
X-Received: by 2002:adf:e350:: with SMTP id n16mr6270014wrj.180.1644158659608; 
 Sun, 06 Feb 2022 06:44:19 -0800 (PST)
Received: from localhost.localdomain
 (cpc92882-cmbg20-2-0-cust452.5-4.cable.virginm.net. [86.31.103.197])
 by smtp.gmail.com with ESMTPSA id j2sm6888517wms.2.2022.02.06.06.44.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Feb 2022 06:44:19 -0800 (PST)
From: Benjamin Mordaunt <crawford.benjamin15@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Benjamin Mordaunt <crawford.benjamin15@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] add pmu to amlogic meson sm1
Date: Sun,  6 Feb 2022 14:43:43 +0000
Message-Id: <20220206144343.2194-1-crawford.benjamin15@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220205234554.4403-1-crawford.benjamin15@gmail.com>
References: <20220205234554.4403-1-crawford.benjamin15@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220206_064421_304105_265AB59F 
X-CRM114-Status: GOOD (  10.58  )
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

---
The dts for meson sm1 appears to omit the SoC's PMU,
which is essential for accessing perf events regarding
e.g. cache on e.g. the Odroid C4 platform. Add it.

 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index 3d8b1f4f2..4147eecd2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -6,6 +6,8 @@
 
 #include "meson-g12-common.dtsi"
 #include <dt-bindings/clock/axg-audio-clkc.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/meson-sm1-power.h>
 #include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
 #include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
@@ -90,7 +92,16 @@ l2: l2-cache0 {
 			compatible = "cache";
 		};
 	};
-
+	
+	arm-pmu {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	};
+	
 	cpu_opp_table: opp-table {
 		compatible = "operating-points-v2";
 		opp-shared;
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
