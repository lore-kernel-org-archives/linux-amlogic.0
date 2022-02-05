Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F235AC433EF
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Feb 2022 23:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U7DQJeEiPPJ8jZJo9K/EodL4KUg/STUUwL3raJJ+iLk=; b=ae+WjIqWBtxMhW
	vf1RoYB1LC/J67X3OJEVubxnWpMFCCkN0jttcJlD6yQ/DHVKyisZgH6P2cIcqZsiVlp5Je+wF7tnB
	L/z2t5IL2R2ud0v4+7kdKP99AeHcdknNrbUA52WvVB/ZhDN+2E+Q2oz5ThBVlMH1mWugdzLSN99u0
	y2TTmRSbpxestcKowcuYsANVJBIMvHPC+BiIkaxOHrxhf0EtGSCdSyfXyvOZ+0kMr9fC5MTRoPwoN
	mr+XQOHNTjuvQT3B8m5b6iJR8PUSb1XKMfxAtgTPHdn4ptJN2tOObT+vcL/GVoQpkscOlw/Po+DJJ
	EpQw1jMjNLWWrkEfIfAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGUl6-007gBr-Ap; Sat, 05 Feb 2022 23:46:24 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGUku-007g9t-PT; Sat, 05 Feb 2022 23:46:14 +0000
Received: by mail-wr1-x429.google.com with SMTP id w11so18163509wra.4;
 Sat, 05 Feb 2022 15:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=67amdkFUWuBIO08FKhiKfYXgae2z4MWbXEmfuMC+Qms=;
 b=hKd4wQxWYrhyf+D1JwRfBmwl31Li6YTh8CeanNmEuYWH1jA5xkX1btXPhrnlZ+TNF3
 jncAg39V9i9/r0zLLyAzyVCUTWNAAnLLUwMIWCrmUcoE7a+lk19X7KaxQONts2+XS7Q4
 1BItkXSo/QmXqPmr1m0r8+/UnIObs2fTrXD9tmbK6qFzRPU5tMNh44A/bpsFwbiIoawi
 SnAyAbmARi3VFG9wxCFtbkxmKszVdcK9xD4Ka1XI+cn/tU5BM7eC25m1PPTWhS0W0BGs
 QauHvlK7GWcHemrbdZssXSRvCllMvcufR3X/gLlKR+29do9N7CSOlISIPCC7bg3Dkr0o
 +stQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=67amdkFUWuBIO08FKhiKfYXgae2z4MWbXEmfuMC+Qms=;
 b=qP74pWamfrlj+Ehyy06RYwrRNH8lX/Fu+GEOyPK1KmzkShszRmGEXtqvpPkrDmAjJj
 Q3J5BxaUsL0k07vwgMd6Cqh+RMSjSxfnxZUT2kV0q8ICIvy1t7JEJtYF0FOgIdb4Qvbx
 A40llxDxJfJYDxTnrZLyTadC4nh2q6gai78aZqJGTNwVmCQO09RLi+5MHGR9Gp19VZoe
 an1qexw9KchLNqgDv5GEgrwdgsTRQpkBUVa9h6Zv76+oOJAyGklCgJxIAbUDzI8xEqAG
 BK5EurYwn6VJds14tZE5NyoSFeYzebwstM0JEW3yWVMCQqah4Q4iATb8DHkxNAA3ioSF
 wOBA==
X-Gm-Message-State: AOAM533FTkD1yk0b70/J9TD+NO/EkMn2KeFl3KkGA781sMB/UWlTAdQq
 h9QCENw3gAFzx5Pc91R7wLo=
X-Google-Smtp-Source: ABdhPJzy8C11TxTT6dFAauGMg+9yI6/z23grQTnVgtPIhn4CY4AWhnII3nZsbSeEJBS2VbCqfqRx+g==
X-Received: by 2002:a05:6000:178b:: with SMTP id
 e11mr4513123wrg.634.1644104770317; 
 Sat, 05 Feb 2022 15:46:10 -0800 (PST)
Received: from localhost.localdomain
 (cpc92882-cmbg20-2-0-cust452.5-4.cable.virginm.net. [86.31.103.197])
 by smtp.gmail.com with ESMTPSA id t14sm13644588wmq.43.2022.02.05.15.46.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 05 Feb 2022 15:46:10 -0800 (PST)
From: Benjamin Mordaunt <crawford.benjamin15@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Benjamin Mordaunt <crawford.benjamin15@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] add pmu to amlogic meson sm1
Date: Sat,  5 Feb 2022 23:45:54 +0000
Message-Id: <20220205234554.4403-1-crawford.benjamin15@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220205_154612_861266_44E5D163 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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
