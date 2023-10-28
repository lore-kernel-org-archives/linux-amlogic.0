Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56560C27C48
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Oct 2023 07:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ivy0GX2E7IaKEeFZB9kRFrfK1yRw6apCwP795mzaNn4=; b=rUnLa2mRoi78pt
	MBc0Bkr6gsduq6D5feBTUDOSQrCd7nd5EgxuTu5s4y/SKayD6Czu/bttZHJKplLLGx7hT9PGi5dzf
	T7LiZV9OYfmHt7c79xofWPPeWhD0TGxc6ItaD43aOQtQZHCjzC3Sz5BNvABGJkyN1EK4QQ0pYRCR9
	/FdpbdR9zMOtPbJ6s0fyx4Rn+xzYh7INthVkUiRsMmIRHtpiz5zJkrstQK2MUWQPIEqYk40UUH5Xc
	Zdk2tIf8H0sOZF5lMMLCwz7I1/SW2MoqNLvgopB4VT968n1zkyhsw6n3T1fNVDljBfbAE74g1vG4H
	+WofGR3+UIBI0cH6SyMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwe9q-0009PI-13;
	Sat, 28 Oct 2023 07:54:58 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwe9m-0009Oc-1p;
	Sat, 28 Oct 2023 07:54:55 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-507973f3b65so4315241e87.3;
        Sat, 28 Oct 2023 00:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698479690; x=1699084490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HWNJsQxt66edieq3NUjONu874gZwqx0vvF3MCSn9U9E=;
        b=W/QYuYP0wirafBEH+nCzm7KnVESptyn4qE3NroPPP3pl5NRtQ05DU4GH0NYnnZYiyb
         QSI/r7Sq82DTPI9aiGNnv8amprzb/ysUI0ozoS8EYrKRbNKk2rZNxQn6jzmfYlUPlG9N
         UYaBkiukCR7MuS4egG08tLva7xWMKVQtkZe8lh2TOcgeybJSyasJ4HhMCEI4PvTofJbE
         MKgesQ6lKV7hg/c03CiqglobO28dFoEtS8d6g2ry5jBANU43/wyAelK02J67TjgMgpTg
         rnfQXIGeagMJB7KJlI58NCuqhYg0yzjMvYj5HeDy5/6THvPt7o80HM1qJw5SVFvwOfj5
         uOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698479690; x=1699084490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HWNJsQxt66edieq3NUjONu874gZwqx0vvF3MCSn9U9E=;
        b=YlIzbFe4GnFOYjcNXdonZVn/Iu/dp772ALYXN9Ba553zg8SJUQHT5Frjlta5iuMrSM
         P40BKGlZUDUoCLHvHH1yAXComs3La/5Ll4els/hcETlWqzFt/Hv4DFKPnuZTNcL1d+xf
         bIkZ1dXbyy0oduSdBYwpVL5WxB5glA+hKHwaQa1k7+CLI8cU7tFDojkz4nXVZL1SIBVR
         9+ulZDJSYw9xlpFq3nKZ4jL33QRpQra6vgvWJ+zBliRzMUa/Mk4WQsIciVcs9Z+NfFhD
         RkofUPLmBjJ89fWsLT82lew2Y0zNH4ai2mTnhpSTtpvsuBcnqATjulaszj8qNEFuNB20
         /yIQ==
X-Gm-Message-State: AOJu0YxbsYoUrrh7zBK9mnhOXQGApMJO/0WBIs7oSYHH5X3iK7Xtvs+3
	ZGYThDSAEFKFVn1KSOMVoqRQ6UMg6PccWg==
X-Google-Smtp-Source: AGHT+IELtqMRnbnklk2OPXep08KqdzueFWidMDXKJVoTtHqqgwhjS6C32Ie18V8tpr1Tuw8Y+M7g1g==
X-Received: by 2002:a19:8c19:0:b0:507:b9e9:3e8d with SMTP id o25-20020a198c19000000b00507b9e93e8dmr3529803lfd.28.1698479690039;
        Sat, 28 Oct 2023 00:54:50 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d4c4f000000b0032f7e832cabsm250845wrt.90.2023.10.28.00.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 00:54:49 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson: radxa-zero2: add pwm-fan support
Date: Sat, 28 Oct 2023 07:54:45 +0000
Message-Id: <20231028075445.3515664-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_005454_631391_9F968DFC 
X-CRM114-Status: UNSURE (   9.08  )
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
Cc: Yuntian Zhang <yt@radxa.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The A311D on Zero2 needs active cooling and the board includes a header to
connect a simple fan. Add pwm-fan support with basic thermal properties so
the fan runs when connected.

Suggested-by: Yuntian Zhang <yt@radxa.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../dts/amlogic/meson-g12b-radxa-zero2.dts    | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
index 890f5bfebb03..895b6ea67180 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
@@ -33,6 +33,15 @@ memory@0 {
 		reg = <0x0 0x0 0x0 0x80000000>;
 	};
 
+	fan0: pwm-fan {
+		compatible = "pwm-fan";
+		#cooling-cells = <2>;
+		cooling-min-state = <0>;
+		cooling-max-state = <4>;
+		cooling-levels = <0 64 128 192 255>;
+		pwms = <&pwm_AO_ab 0 40000 0>;
+	};
+
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
 		poll-interval = <100>;
@@ -286,6 +295,24 @@ &cpu103 {
 	clock-latency = <50000>;
 };
 
+&cpu_thermal {
+	cooling-maps {
+		map0 {
+			trip = <&cpu_passive>;
+			cooling-device = <&fan0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&ddr_thermal {
+	cooling-maps {
+		map0 {
+			trip = <&ddr_passive>;
+			cooling-device = <&fan0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
 &frddr_a {
 	status = "okay";
 };
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
