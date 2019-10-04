Return-Path: <SRS0=++Ji=X5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED85C47404
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Oct 2019 09:02:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EF09206C0
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Oct 2019 09:02:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LJ9Q+sJ4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="viPQ8tCI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EF09206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QIt3svhAbm17S583ZLqtvcTisAQQ97s84K0Hhg0PcTw=; b=LJ9Q+sJ4HCqQBJPx3+XPPSpP+E
	GskmJ3Q3wY6m1B0Kx7HGKLeXl146DO+C40UFPwmlz0+ZcYYevySF/kJfUEWFGOVqLF/kmV3oTlN5t
	6jf5FwxkwJdjQlr6pHb7o0Xvlwbbg5BS97Ymgaqo6C8GdXGR6I02NwiQkArZJqHc/r0VbDbA3WVQO
	sJ8BrNDwJhZ2eNW8y08zvb+iP8OjLyAorMv4J0lPGk4mR5QSLQAHe8AVguGSaoxMs5MONsA4DP/z4
	XWFeSCwahdCorn5QP/PLPwNhlDEEkCpCW1+kSmthWhzJDS2kZynY4+Iown3wTQikUSXzNSZ+WTU3W
	kLMqi8xg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGJTg-0001ds-R2; Fri, 04 Oct 2019 09:02:20 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGJSj-0000gS-P4
 for linux-amlogic@lists.infradead.org; Fri, 04 Oct 2019 09:01:24 +0000
Received: by mail-wm1-x343.google.com with SMTP id i16so4951090wmd.3
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Oct 2019 02:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=U5+Cq6R9X8Ufmg5BHS6gLuKOFiO9TF8ekxmK0Vlflyo=;
 b=viPQ8tCIuO7ifXLvNehlr170Hq0zRhmeOFrDlSW18zUQ5/HH6olShlD6ANOlc4C/vY
 kU+qPChmbAcsbdcDid5YvQRbwpIQ/F253wo7GyfaTLtU2O99Y9XaN7359UKyFVHpU32q
 nKPuj81jP6TMBVySWqi34lgjfNKZaXCClyjw8xigwf3lDiSV4Fe4ww1QKXrR7eAqokMC
 BbwHnam7DBMqgwrDBBafgCPmGvY88qoJb4FsRw2N42Q5hEdkw9L0C95aV6jS6Q1D7Vq/
 1Iwh6bXTp2lhXvBFETZztO/oRRWDsvDXevuT+lZLzsZgA5PfkvfkHly2/hI34UG1NePl
 HScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=U5+Cq6R9X8Ufmg5BHS6gLuKOFiO9TF8ekxmK0Vlflyo=;
 b=CjlD/2EER1bi+pDW0MhjVjhtBxMN+DD9LsPt+JJ45dpPhK2BCC2fxS98wqbBxooerU
 Wk2mNvyrhmVXo/H0cCr8sHt5VHmIV9JbbbV8A2ANCGfG9mG13+v9D8SZ0hPz0B3Jt5VE
 XKaYHHyI9pxTZjZhPkta8/YKbBrwIALfkySrTTEOoqERmdlnHNTRE0th51kScklQviiI
 xJgtbjxcNN/tvmOhMbKpjWHqD2pO9jtjXcPFNA/GetZJbFNSyTvYKjYk6kf6gdzhV0vI
 AiSzqrsFXeBD9GYc1W5m3FfeAm5vRHhf1sx6A0hdiDT2pSKbYnT8+Y7zq8Scg0xLH3OE
 is2Q==
X-Gm-Message-State: APjAAAUvjehZYwLeAUP22dwcEgU6nyGZiee7UWuxqw1v6jIVKivjC3PE
 IGRq8SHltih1qPUg+vTVcJ1q/Q==
X-Google-Smtp-Source: APXvYqx9RmbwsTK8Iq4RgR8Gbz/TiRWN/uUkE7o5hGA2Hoy7bdPG4yIVs2IxmPHUV9GF3MTE7XKdGw==
X-Received: by 2002:a1c:ed02:: with SMTP id l2mr9784178wmh.155.1570179680626; 
 Fri, 04 Oct 2019 02:01:20 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v8sm7765170wra.79.2019.10.04.02.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2019 02:01:19 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: amit.kucheria@linaro.org, rui.zhang@intel.com, edubezval@gmail.com,
 daniel.lezcano@linaro.org
Subject: [PATCH v7 3/7] arm64: dts: amlogic: g12: add temperature sensor
Date: Fri,  4 Oct 2019 11:01:10 +0200
Message-Id: <20191004090114.30694-4-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191004090114.30694-1-glaroque@baylibre.com>
References: <20191004090114.30694-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_020121_841925_B561511E 
X-CRM114-Status: UNSURE (   7.55  )
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

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>
Tested-by: Christian Hewitt <christianshewitt@gmail.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12-common.dtsi    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 38d70ce1cfc7..0660d9ef6a86 100644
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
