Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FDFC6FA99
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 15:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9AcSDIVl+LE2a3hWe9kvXpGynu8PWJTwOrBdQOZA0+I=; b=UUqYnr0pw8Glqe
	/By61t7ZsYoXawAk3Q/zTgYg5nbGMGYTMD3zY6W7YE6Kl1q6Tf70x4DyNdUwy24ThKeJurOYmutZ3
	AlGxGEyrg8aN4ap0TtUAqAE043qqTyWwNB6BF2+M+HNDyU50r9aKPOt9lsox9B9LhFev+IIHNvOAE
	7tzPhB6AsGLwxod2bt2Tz8y9J4Mbrwa4WmOkAvYY14Kfp8LjeXLh0uksfDmzXWzCKFZsfh1Nk7rAl
	Enoz4uW08qnEuJ9LxHGiL3S6wOUW3PWYzEd90z2vgpVvgdkNlbNVFEhfx8P5IzwpdN3FGktPqYTfk
	UGG3hJ80SWI5nZa4ddQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZCXV-00DY5Z-LL; Mon, 06 Mar 2023 15:14:13 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZCXR-00DY4X-U8
	for linux-amlogic@lists.infradead.org; Mon, 06 Mar 2023 15:14:12 +0000
Received: by mail-wm1-x330.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so8435948wms.2
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Mar 2023 07:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678115645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vDsVKUJtlRFJ3s7/7Fhta8tnir6GRw1n4iIHe/gNKzU=;
        b=g6TpI3EaF6Mnq6dVosVQi2ooR09TYPHSfAA7xspAY+SO2DiCQRQnuvLzjy4X7arWDm
         ssgDWuQLSngJE6j6CHHvB4Qd+XyXRHBNQbpBSpfnooqBOavpGqw6z13dtSW9W/CLeFSS
         GcPJprT3JEAq4cjsAwxQoV5mlhRe8+jcjRfT9NMlzoaI++FBM2Q97u5pp3F4gmB32/AS
         HovaV+YmPPOaRho60WlIirttF4g+HX6a0NMiTgsGfifQ15X/wQ4lPLiIzFcHqaJs0AyM
         cFT8bvXy30vvqJ8ueVP2Fnm1FtlkJv1CqlwHuv67cYzF+53Agrs47sXr3Dpum/GlRLZ6
         tiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678115645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDsVKUJtlRFJ3s7/7Fhta8tnir6GRw1n4iIHe/gNKzU=;
        b=leUcahoHbfyY4MfrlQMe5X+tPJSI0C/PtJGn1XG2FixiDhidmzeRCXndTbDb5pN0ct
         jhoFj+itdGu5Boj+psDmw26M3KEjWMEzhtajpnBSRUP0GGVSe58O2fTnZeL3ViKzga0D
         Bd90KI0Hy8Xxmahb8gaxCfJITMv2xoHEUeIFSY47+ooFmiC0s76f2JOknb+/YORE5WWO
         /Mm7EQh5SYr6VSLqWzWErs5uuyc8dlO19A3EimEV5byfUP3952L0vGrt0UrDHo9NqzSe
         mL82MQVsyXMXxbWbaakdKeIRH5zFpIxS8NgyUsVIk8KeZJTxSXBgXafHV+p8/68tMAx4
         YK2g==
X-Gm-Message-State: AO0yUKW0p4NXwVyThmuOjh+mkEAXuRv9OZAXZjCPIGTh9EQbQMQh+A1d
	YRQy0JeS6zoyAMOAV+52mZF7cQ==
X-Google-Smtp-Source: AK7set/P4TgN3KWNiQpuKTiNllOykldbwBd5AH2H1IH7KoOoCIMCopw9mjcunu/lB7pwcErFNQdh/A==
X-Received: by 2002:a05:600c:a47:b0:3eb:2b88:9adc with SMTP id c7-20020a05600c0a4700b003eb2b889adcmr8826948wmq.25.1678115645173;
        Mon, 06 Mar 2023 07:14:05 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id o2-20020a05600c510200b003e208cec49bsm23156746wms.3.2023.03.06.07.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 07:14:04 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: amlogic: gxl: use gxl mdio multiplexer
Date: Mon,  6 Mar 2023 16:13:54 +0100
Message-Id: <20230306151354.132973-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_071409_994017_147A73A5 
X-CRM114-Status: UNSURE (   9.87  )
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

So the far, GXL SoCs were using the generic mmio register based mdio
multiplexer. This properly sets one of the glue register but the SoC
actually has 3 of those registers.

One of them sets the ID under which the internal phy will advertise
itself. If nothing sets this register before linux boots (like u-boot), the
internal phy path is broken.

To address this problem, a dedicated MDIO mux driver has been
introduced. Switch to this new driver.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 25 +++++++++++-----------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 6f3c2bc36919..17bcfa4702e1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -773,16 +773,23 @@ mux {
 		};
 	};
 
-	eth-phy-mux@55c {
-		compatible = "mdio-mux-mmioreg", "mdio-mux";
+	eth_phy_mux: mdio@558 {
+		reg = <0x0 0x558 0x0 0xc>;
+		compatible = "amlogic,gxl-mdio-mux";
 		#address-cells = <1>;
 		#size-cells = <0>;
-		reg = <0x0 0x55c 0x0 0x4>;
-		mux-mask = <0xffffffff>;
+		clocks = <&clkc CLKID_FCLK_DIV4>;
+		clock-names = "ref";
 		mdio-parent-bus = <&mdio0>;
 
-		internal_mdio: mdio@e40908ff {
-			reg = <0xe40908ff>;
+		external_mdio: mdio@0 {
+			reg = <0x0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		internal_mdio: mdio@1 {
+			reg = <0x1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 
@@ -793,12 +800,6 @@ internal_phy: ethernet-phy@8 {
 				max-speed = <100>;
 			};
 		};
-
-		external_mdio: mdio@2009087f {
-			reg = <0x2009087f>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-		};
 	};
 };
 
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
