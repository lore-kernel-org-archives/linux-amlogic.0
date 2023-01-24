Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671D7C25B4E
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 14:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=olYv6M6bLrtRZLVcn2GKLXtCfS1iI2DjJuXTcMC6RGY=; b=xlWB9qlCCf6RE7
	A1pnESVZ5qJj/zkFI7n32sS+BxIn/GXZtCzuE1cq7Zf+XOjPH6ukefyH7/69xLj6Gx7cJabSU+VJC
	qZdfbFHPxdNXob6oBdb2PGgmFHoQ8r7of4yTDpF9FNAZYiZwP4KWUXJ5IRE2NqEwn80wTTRtZg2nM
	HE1m/OTx6eSB3egZu3d/Z6OK7MdWewNN7NMHl37WGBOjwKFUK0oSaD2BWYkaZRaiYnvOsMlrnVNWp
	khw8jZLkipalSBOah+1NPcWoy9D0oaiteC/SLB28/O6gdJ+iRyjdEJhgmNrAkUDrKGW9KvTJWYsQL
	0FMfyui3UjGmYGqh0fUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKKUa-004ND2-P5; Tue, 24 Jan 2023 14:41:44 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKKUP-004N2N-6L; Tue, 24 Jan 2023 14:41:34 +0000
Received: by mail-pl1-x636.google.com with SMTP id k18so14917470pll.5;
        Tue, 24 Jan 2023 06:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uUEIUXRT9q9lHy3kc8AWUGd4aWNpn7Eo0QlIhJUhEE=;
        b=eUDnRJKusBCr1/mZou2IOZLhTguJg9PBV2wJzZZ/65lXYaydQgWbUAwWqHsnFakdh7
         kWvChIRgFlfQvHqGwIRoJ+IWFWgEew9QS2GQT45FuCTJOdIionl9NpG72Uu7H3QoYwg8
         WKKrVoqdJ5BhEapA6b9rMmyr4bk3SLlmKe/85JMQPpdAooXdYxTF1HYt9NJ8Rft756jY
         8yPYwSghWYrnRCcC4CgL0Ua+JuBP40SYQOXwJyTlCOYZXIYmdseXUpHRXJnfjz2SM37T
         A8fhI0yvFo6m16H3Emsbu2jmDWMmFY4/EVEVslTgiVv3l951RxB6LGsYHMwfOAtT8t5F
         /hhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9uUEIUXRT9q9lHy3kc8AWUGd4aWNpn7Eo0QlIhJUhEE=;
        b=KrtMtfKfETpqVKKIxbqpkINngYaotik8xz4UVAdeZ2ntwDXj4PISZVJibSxul08wzm
         I5J2K0Cr/An/R2ZnAexXjygBeWgm5i/Q0pQnRasLWadHtsuvWH2bOnAUhxtdY7q0ai2/
         F4Xj7R1gSiFjF/knRbJyZC0bJ8wmRt4zSat/lFMbLANfveEayFpvkJezxp0TmsyOdKAp
         d0DyyGSzBmjMSW5oXEJ10WoTmcFG8o6YwEYsCZdksnLUHil1RgP8MZwXcTTrb1iYeZqb
         i0qf2vjl5DB7QmANMud8T8Z+YuMupMxD0YJNWemuLhs9oyLDaYHaa3dW51U67VLFTLLi
         9TPA==
X-Gm-Message-State: AFqh2kq5cXl/uoHa+LyJD4UkvrGI8cMIMu240hMm0jJ+sEAAbxWzQP6J
	+bEaxNwCjLmEBBDs9oULFiI=
X-Google-Smtp-Source: AMrXdXsy5ggk7FkRTG8ILVNAvvy48mrrw3kSNsv5pemuHuWH0o/Jx9IxCKcHpKCGZNKdpHyVoKXLOA==
X-Received: by 2002:a05:6a20:6f61:b0:b5:a231:107f with SMTP id gu33-20020a056a206f6100b000b5a231107fmr26168256pzb.12.1674571287455;
        Tue, 24 Jan 2023 06:41:27 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id b21-20020a170902d31500b0019602dd914csm1747865plc.180.2023.01.24.06.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 06:41:27 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH linux-next v4 3/4] arm64: dts: meson: move usb-hub node under dwc3 node on Odroid C4
Date: Tue, 24 Jan 2023 14:40:52 +0000
Message-Id: <20230124144054.13556-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230124144054.13556-1-linux.amoon@gmail.com>
References: <20230124144054.13556-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_064133_281888_1C37C526 
X-CRM114-Status: GOOD (  14.09  )
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

Move the usb-hub node under dwc3 node and drop superfluous
dr_mode as it is the default in meson-g12-common.dtsi.

Fixes: 71593b2020b3 ("arm64: dts: amlogic: Used onboard usb hub reset on odroid c4")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 .../boot/dts/amlogic/meson-sm1-odroid-c4.dts  | 41 +++++++++----------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
index d04768a66bfe..a988015dd2d5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
@@ -26,30 +26,29 @@ led-blue {
 	sound {
 		model = "ODROID-C4";
 	};
+};
 
+&dwc3 {
 	/* USB hub supports both USB 2.0 and USB 3.0 root hub */
-	usb-hub {
-		dr_mode = "host";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		/* 2.0 hub on port 1 */
-		hub_2_0: hub@1 {
-			compatible = "usb2109,2817";
-			reg = <1>;
-			peer-hub = <&hub_3_0>;
-			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
-			vdd-supply = <&vcc_5v>;
-		};
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* 2.0 hub on port 1 */
+	hub_2_0: hub@1 {
+		compatible = "usb2109,2817";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&vcc_5v>;
+	};
 
-		/* 3.1 hub on port 4 */
-		hub_3_0: hub@2 {
-			compatible = "usb2109,817";
-			reg = <2>;
-			peer-hub = <&hub_2_0>;
-			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
-			vdd-supply = <&vcc_5v>;
-		};
+	/* 3.1 hub on port 4 */
+	hub_3_0: hub@2 {
+		compatible = "usb2109,817";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&vcc_5v>;
 	};
 };
 
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
