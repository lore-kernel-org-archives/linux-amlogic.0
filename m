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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFFB5C49ED7
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Sep 2019 15:13:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85B2321835
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Sep 2019 15:13:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NLQ9fxrA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="OVKi08S5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85B2321835
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q4vehPw22t1CAA2yfVjJz2jwHypeYMbfMyEH7BeWgFg=; b=NLQ9fxrAwVRBKM
	HLguEbXLBhNW8jFzmz7baFr/OjubZ1X3dfhQU9/AboOowjTg6F1sz9peQEUphfYnRPPR8HcwwzGOr
	fl4I0BKIgXto7yanQpaIScorvw57gKXkhUbibWRr3CnBEly7LGDRKeQKJ7kOD5XVXIr7yPVBzY4nP
	AOZtonmqutxxvt17hRcs6ru2OQGsHckmIBL1DN9lRiEW7E6kJ2o7rEXVO31ShxJEF77HiIE6+dsKO
	o9sP1ODZ3tmie5uCoT1LeLiNusTgEb7QFRSmNb6KU/os2GPJULuBipk2GVbrbQDi90TM21UyDhAHI
	2CTdWzD+3NVeydtyNBiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBh4L-0007Os-KU; Sat, 21 Sep 2019 15:13:05 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBh42-00077G-Le; Sat, 21 Sep 2019 15:12:47 +0000
Received: by mail-wr1-x444.google.com with SMTP id n14so9582956wrw.9;
 Sat, 21 Sep 2019 08:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WfQ1e9LFDFE1Z5maZrDyEq/WutECQBCS0m0ceOAIqa0=;
 b=OVKi08S50hGEiRw9dBzGluGTGgtg+pKlp3xygMsU4spmhQ51+dAU5e6bPO31NbjcRR
 q0OHBrM3S3waNNWWw51OjK4uchrcrc/TFylItNLLqgi75Q2j3h1n/b9QPljojXbD1kFP
 NevFD8TLX1GtPO4cyMTxRaMDfy6etU+ilLKB75FaAUt2Pvbf3IS5Bdzhjx2BfgpEjLh8
 CeF5cq5Jf6S2DvnGXC8y7wlDNsHaWtg8KZpJubtEYTSE5VvPEh8fDbR+zaInW3CuqHfY
 Upb+8JbbcoYmzMttXpMdnx3SU2WOmZ3YFxH9/HGGMzlC2MdmHep1XsWA7hrJI9S4SH21
 inHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WfQ1e9LFDFE1Z5maZrDyEq/WutECQBCS0m0ceOAIqa0=;
 b=EUmPK6EtoM2obZRQn+3IvJn657jMJ8d+VmrVpYea3zA1VGSVLUvyDg97bXbNyg2uww
 7RV9auMubWiLSn1y8uobs0g3sLj+zUdwOdyfJfUkYkZqe8pau98KKkppoWCSdr0KdhYb
 VhN5JcQNSdcHm1cuLb8ZZ36XN8bhFuXYTyTo8YPUjIaDxPveAgteeIwFX4F3c8nvRXt1
 qI3fDuOjPLv/+cQEnkPBJcYhHIkgVbkBDD7k+kQXs/1IQsQy7iy+lF4hNbDAUcowIS4/
 N7JKnCNPrDa4ipOGqqwm3F4aaF0vcS0eqN1dvHq2SK71+djA05+hNLj+LInT2rArwOrj
 iOXw==
X-Gm-Message-State: APjAAAWRKA93klcWVKXfdrw017DdY9Ttr0N8AS82gI14zjGABtP1o/k/
 chOBPflaZkQsNjYwuclmJKc=
X-Google-Smtp-Source: APXvYqz97gwP1YJzwvQCqfcq+Gp85bKA2r8M6d+E7PYadTAilKiby2e0S8TKyZPdPmgnhDeAvWVe6A==
X-Received: by 2002:a5d:40d2:: with SMTP id b18mr15977793wrq.4.1569078765019; 
 Sat, 21 Sep 2019 08:12:45 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133CE0B0028BAA8C744A6F562.dip0.t-ipconnect.de.
 [2003:f1:33ce:b00:28ba:a8c7:44a6:f562])
 by smtp.googlemail.com with ESMTPSA id
 y186sm10712491wmb.41.2019.09.21.08.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2019 08:12:44 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com, robh+dt@kernel.org,
 mark.rutland@arm.com, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com
Subject: [PATCH 1/5] dt-bindings: clock: meson8b: add the clock inputs
Date: Sat, 21 Sep 2019 17:12:19 +0200
Message-Id: <20190921151223.768842-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190921151223.768842-1-martin.blumenstingl@googlemail.com>
References: <20190921151223.768842-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190921_081246_706202_575A6BD1 
X-CRM114-Status: GOOD (  11.25  )
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

The clock controller on Meson8/Meson8b/Meson8m2 has three (known)
inputs:
- "xtal": the main 24MHz crystal
- "ddr_pll": some of the audio clocks use the output of the DDR PLL as
  input
- "clk_32k": an optional clock signal which can be connected to GPIOAO_6
  (which then has to be switched to the CLK_32K_IN function)

Add the inputs to the documentation so we can wire up these inputs in a
follow-up patch.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../devicetree/bindings/clock/amlogic,meson8b-clkc.txt       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
index 4d94091c1d2d..cc51e4746b3b 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
@@ -11,6 +11,11 @@ Required Properties:
 	- "amlogic,meson8m2-clkc" for Meson8m2 (S812) SoCs
 - #clock-cells: should be 1.
 - #reset-cells: should be 1.
+- clocks: list of clock phandles, one for each entry in clock-names
+- clock-names: should contain the following:
+  * "xtal": the 24MHz system oscillator
+  * "ddr_pll": the DDR PLL clock
+  * "clk_32k": (if present) the 32kHz clock signal from GPIOAO_6 (CLK_32K_IN)
 
 Parent node should have the following properties :
 - compatible: "amlogic,meson-hhi-sysctrl", "simple-mfd", "syscon"
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
