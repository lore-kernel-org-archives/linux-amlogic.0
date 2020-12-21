Return-Path: <SRS0=3nIP=FZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A83BDC433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Dec 2020 18:13:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A15B22D08
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Dec 2020 18:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A15B22D08
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wjBFoNx2Cox/jNY+3BoztZi8Ubd+thtJWgld618Nln8=; b=VLsInyGMvkaGIZscTWx5m0CL/
	zyI7bmG8yLvM1K2uQgLirulTS+FDV2OHtuvWKxtFp9XR2sMftvPWW9hIDiYDvRJEURG2XkBM/fyWj
	mFyH7Rl8wcJpjdXrrU4NOOSRYehDyHYPlTmaYxOyNrCdR4iaM+ADVU4t0d2WXAaN4uE6n9gfwgKjc
	mxrkx3XQHBLlVtIGuVD5JXBYjxcy94uUAg7Uk+MbnxJvl7qJLOAkR/PlWQUJvr19kkc64mMCinuhk
	5Bz9CAwtu8SzC+JGBf71elAmRqVK1PFdVJCV4uxNeYGKyVdfQNTXMuXGDqo464jT0Tx5dSozq8Skv
	PoBQ6adKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krPgm-0001tZ-D4; Mon, 21 Dec 2020 18:13:44 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krPgj-0001rf-Cx; Mon, 21 Dec 2020 18:13:42 +0000
Received: by mail-wm1-x32b.google.com with SMTP id k10so10726847wmi.3;
 Mon, 21 Dec 2020 10:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8CNSVuVCy6pDq2pHryyGIphjcVCtjSNpbEXQSGcq8K8=;
 b=ro6PZ8miBiXxczKWKMmWYIo1Te0lOA0LqkzB2dAYSaCiQeyoPlCU8opDLWmnVdr7ZO
 lVXbJx7ca9QgLyYzr7D6Pb+8xuzdYMtjMtSSRUtpBfyw1TngSeUOCwLvcsgNNcDFVeCm
 nUpWIuCT0Yf/jhvEF8nIU1U9FQZprnhw+iqfxSDop3ibXGNUQzXhMNLQXSSAWqxF+7OF
 nNxe2knkUAJSqFpt4zXk2r6ddQwTBXnrH0LV+G4HwLLMF4poun6d3j32vbjFqrh/vXmR
 aoqr6MvUOA8Ndbgk7uB4UDsICxSQyVQdMSJDgPq4HyUHIiIw4e0Bj7NencTpgPjUQlg8
 YrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8CNSVuVCy6pDq2pHryyGIphjcVCtjSNpbEXQSGcq8K8=;
 b=j6bRqY/8HbSdVevZC83A5Quyeg1ag61T389gytOSAq84VfZDoVwA7+ZjvRixIKkpdO
 cscaXXomK9f9bBp58+lZ6Tj1mR0tMS9nSt6nP63xl7x9/VDeaM3nzqqv1rxj1O1N39Kp
 gGNsykboFc7Xjd+t1RTWw5ZDlBcRqJydzg/YokbyyuAFHnu5dDOSlKlj72i3BB3QANoS
 RhBZ1+zDNRDSjcQ81sA1NJ4obrV6FdsjCc97eTdybzhBdKRsiWGXM3kKwG1IZyUBwXLn
 Zs0qwrpAiH8UNUSbv13em621gNawDDFFKdenQte2nd0mLiJKr1ytOvCr6LTNv31PgnSY
 ZKwg==
X-Gm-Message-State: AOAM53385Ka1q/xyV8ZsU0eN7bHRH41s+kD6CuFmw1qwcCbkKQXCxc7T
 rpCxUg/i9GEAeSX4WQbyUmBUI6JhMuQ=
X-Google-Smtp-Source: ABdhPJyi00a0kPHjXm/9YZxrLDUId8sVOiXhBlq9M5WMxU2WTU0Z+Zr5rkidENtHt8xrOrirc2HfzA==
X-Received: by 2002:a7b:c40b:: with SMTP id k11mr18174342wmi.36.1608574419608; 
 Mon, 21 Dec 2020 10:13:39 -0800 (PST)
Received: from localhost.localdomain
 (p200300f137019000428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3701:9000:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id m11sm23434936wmi.16.2020.12.21.10.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 10:13:39 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 2/5] ARM: dts: meson: add the ADC thermal sensor to meson.dtsi
Date: Mon, 21 Dec 2020 19:13:03 +0100
Message-Id: <20201221181306.904272-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221181306.904272-1-martin.blumenstingl@googlemail.com>
References: <20201221181306.904272-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_131341_451837_AB11481F 
X-CRM114-Status: GOOD (  12.56  )
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
 narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The SoC temperature can be retrieved from ADC channel 8 on all 32-bit
SoCs (Meson6, Meson8, Meson8b and Meson8m2). Add a "generic-adc-thermal"
instance to meson.dtsi so the thermal sensor is available for all SoCs.
If the temperature sensor calibration data is missing for a board then
the "generic-adc-thermal" will not probe and not register a thermal
sensor.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index 5f074f7aa1a2..e0ca5f08d07d 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -298,6 +298,13 @@ efuse: nvmem@0 {
 		};
 	};
 
+	thermal_sensor: thermal-sensor {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+		io-channels = <&saradc 8>;
+		io-channel-names = "sensor-channel";
+	};
+
 	xtal: xtal-clk {
 		compatible = "fixed-clock";
 		clock-frequency = <24000000>;
-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
