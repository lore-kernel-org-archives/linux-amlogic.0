Return-Path: <SRS0=UIdE=WR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08147C3A59E
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 22:25:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D11012339F
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 22:25:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C6XDDF/r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="RmAQt0yr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D11012339F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yNumatmwBFfNXVtXoyFQ9XbL3XSAk/K6eikgO0J8WTM=; b=C6XDDF/rYmzsN4tWlHp4awdYu8
	M5wSlm3e+TkWmcn+NDZYmdQcO0H/ougV3F8r8MLCBerEZFY9+YJV0+ksvnO+DA1SSJi6Cp+IelqXO
	xSr0vU2J893GMLvZj1tD0FCQj0ScfEOU6ygvKgyAJ5AgZ0kNZz98yilZGCDtkcRBwcPhfwV3VFsiW
	AelycxkI+rUY8WOtjrMq2BplEm3mbpGepqeiWM2KaAPmMNF5YoAYxXAkbRSW6eZ7PBNiYjuNP0n8P
	AzrzmJhLyaQNP27g3VJWXoMdFlk5fkAFXJh9NJ9grGPKKr4N2W4ACDRbUD6l7R4K193W7rmDXGJgx
	pFVxCeog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0Z2k-0004SL-Fg; Wed, 21 Aug 2019 22:25:26 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0Z1o-0002An-PH
 for linux-amlogic@lists.infradead.org; Wed, 21 Aug 2019 22:24:33 +0000
Received: by mail-wm1-x341.google.com with SMTP id g67so3710026wme.1
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Aug 2019 15:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VNEVJNmyyHrsV6A+ZpoAhZq6Wlxyq2Rn2IfeLizyW5M=;
 b=RmAQt0yrk4yeu8kHxu/ofDAzx+2cZEAdXYgfQpVRpzX8n+bKfVdHMRgTXXwQI5Vsp+
 z7/jDTXj1cY7aS1BFV3pDZPhCEB6zBkXuYpZXMq0P3/+WyAI6ypnOPtrOXb+1CvyLAz3
 6dyE7riK+GIKQijiJ3Rz+VM1K+xOhtwHY/xDnrMckeDGRbBLfWKZB2vR4ezsaxmNgKfo
 zM6I2ZzMRxgRGDbRcsquifk7qo/iHXbusGPEj2IcD0H8/+Hno7lVvO6koZCH/cE/bVj0
 BND/kPghyoQwXYDSp9XXs3BcfVeXnMUZb3hY2HW9SyC7tLmsItkw6pOLSLACjpOqq5mA
 qbvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VNEVJNmyyHrsV6A+ZpoAhZq6Wlxyq2Rn2IfeLizyW5M=;
 b=SOxUy38IlGmgA4bdsPqVMCCutr6myDCSOWZ3OKLUCliaAozMlD9r2NbFlO5cLvGEe1
 aqaZoohB5qrOQ8rw0kJnetfBclbHTdv8cLL9egNg+rpe3YgAzmcZa+eiPOIsCzZ9eB/A
 4RUDRse33tyu3gbqDCA/s+/w6Ai3WS17l0nnvFGAC+NwCwcl+ow8SRJDM8wWV7JdDfwo
 0H1+lWbcohqbADV1ED/y5eNUmdZPI/C0GO21j5knojJuR7BgDVN7xIm0Weju7lP0KpDq
 bJIkVLTrJmvAlmgltMM8sTmbpgA4a/crJE99CHvDfi9lC7jLybrINcjfohYuVuV65nnr
 io0w==
X-Gm-Message-State: APjAAAWmJJcPkf1OhJDAI5gkVAZRzkp7qAaQzSzPwi64bsKJ8F81ASeX
 RiOKMIPKrDkDvGBij9tVf/0/ig==
X-Google-Smtp-Source: APXvYqzutcbJ1b6zo56rETKZr1zpTfUALmnpdpQJw6EUBhIgUTQ10movHoix6xnpijh+pYUNRfaXDw==
X-Received: by 2002:a1c:c747:: with SMTP id x68mr2507957wmf.14.1566426267351; 
 Wed, 21 Aug 2019 15:24:27 -0700 (PDT)
Received: from localhost.localdomain ([2a01:cb1d:6e7:d500:82a9:347a:43f3:d2ca])
 by smtp.gmail.com with ESMTPSA id f197sm3548549wme.22.2019.08.21.15.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:26 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: rui.zhang@intel.com,
	edubezval@gmail.com,
	daniel.lezcano@linaro.org
Subject: [PATCH v4 3/6] arm64: dts: amlogic: g12: add temperature sensor
Date: Thu, 22 Aug 2019 00:24:18 +0200
Message-Id: <20190821222421.30242-4-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821222421.30242-1-glaroque@baylibre.com>
References: <20190821222421.30242-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_152428_816712_D670116B 
X-CRM114-Status: UNSURE (   7.51  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add cpu and ddr temperature sensors for G12 Socs

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../boot/dts/amlogic/meson-g12-common.dtsi    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 06e186ca41e3..ce13c7c2e454 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1353,6 +1353,26 @@
 				};
 			};
 
+			cpu_temp: temperature-sensor@34800 {
+				compatible = "amlogic,g12a-cpu-thermal",
+					     "amlogic,g12a-thermal";
+				reg = <0x0 0x34800 0x0 0x50>;
+				interrupts = <GIC_SPI 35 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc CLKID_TS>;
+				#thermal-sensor-cells = <0>;
+				amlogic,ao-secure = <&sec_AO>;
+			};
+
+			ddr_temp: temperature-sensor@34c00 {
+				compatible = "amlogic,g12a-ddr-thermal",
+					     "amlogic,g12a-thermal";
+				reg = <0x0 0x34c00 0x0 0x50>;
+				interrupts = <GIC_SPI 36 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc CLKID_TS>;
+				#thermal-sensor-cells = <0>;
+				amlogic,ao-secure = <&sec_AO>;
+			};
+
 			usb2_phy0: phy@36000 {
 				compatible = "amlogic,g12a-usb2-phy";
 				reg = <0x0 0x36000 0x0 0x2000>;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
