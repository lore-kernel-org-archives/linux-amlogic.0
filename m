Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FEE8C43461
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 08:33:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A68E208C7
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 08:33:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U8Xa8oro";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JPOB01GQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A68E208C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LJYDZGuPS2HjQJ76mYXhawzmQD8uUgkX2cwKYzE9lCc=; b=U8Xa8oroxJ9fkI15iCSKFvC3O
	MQ1y4+56KyRAzpEwVkk01OlSflUU4I46x0XVtciyLcu3f6a9lNvHP8qZiYspQfESDczTJPCSD5hGd
	av6w0wHgCdJLraDgsKjfo6sqXzT08/ha9xxwedjlsQBJaBTuPIvkRHdyL/pbIrLmAWj3rz2lTF1xf
	OQETEtz5s5gK9u8V/FpQz+OkvNcf82o15Mvkga29UCZC9ce2ymFpzpNupjHJEurMv17HOeUYGOJK+
	x48Hbf4LXtP7JhFJl0Bvup+yYHuUrfLEGnhKb4ee8RhMlXXkrRIhMKOI+M8gDIvk7rb+3LOz2Uz9+
	pQTqYo/nw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFCad-0003gz-J8; Mon, 07 Sep 2020 08:33:27 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFCaM-0003ZS-GZ
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 08:33:12 +0000
Received: by mail-wm1-x344.google.com with SMTP id b79so13318390wmb.4
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2020 01:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tf/pPuP/quD6UX7EbsHW6QHRSABL9O5KfoCfXcuWE28=;
 b=JPOB01GQC1EyMKgIY9XWJHIybEP5Kk0Mpazg12h1ld+lYOavG/ORNCQ5E+DVx8sZkV
 yeSp/Iza0lKp0ly4OCn1zK5IbdKv75HP7DeNlJCa8yDUt4Ylwgl+7ekFHntm05cdt2iB
 NUorJTBx29g9kSLL3BY6M3iRw9AjeoA0xpaTMVG64YqKLc9yT7srFA0fjlBgvqa0KeMa
 9+14TezNRNDJoZ8/56DGplnxQ0InDL3adAX/vCps1gwkD21czgLgyRev9+CqMQl2KkV1
 jC2pwhNvoQ4zAVN2g2rOZxx2xbdAKiwK62uIzX34TvxfaJl/VCk2q7BeXg69nOaATQU+
 x4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tf/pPuP/quD6UX7EbsHW6QHRSABL9O5KfoCfXcuWE28=;
 b=tvaX6P0YQJ3fAG0iTMDTOdE/QW1DcnjxxNJBbNhv4Rct/gzKS6E88bQo3StkCU40Jh
 AqpXOFt53lM1yJcZKNAHG1GPQOLhv3noid13mQKQeo/mLM926LP44AwRE6e/t/TOcgic
 222u5WASGtyWBBESvW3ib3cj6QzrFyMlz9nfwRYfWqhKHn03muc5jgxeoUUOdCs2qw0k
 3zYM3d/B11+QAZBpLXnlN4g8yQknk5CCjzcK+wUVLRAyJmQbHgWhfTv3Cz4NymtJWCem
 4DM2HYlyI5V2C2KQPnk2OA2epzBaj1MNdGViINctnzfrkAPQr0K4OtBsOal+FoOThmGF
 f8Kw==
X-Gm-Message-State: AOAM533i/yoBRQjdD3CSVuUDlKvHwEhHipBlOZ2XbC7VK33gVcUqcarz
 VnKBLLRjZdn7zQdyGzhaMmdOnw==
X-Google-Smtp-Source: ABdhPJzlXWWJxUL+NR0WVb8iGxSGFRhnUwwKhX4IAQt9btsq140rrTUEi09a9mEZEaHQVqchSMIfZQ==
X-Received: by 2002:a1c:62d4:: with SMTP id
 w203mr18358593wmb.146.1599467589332; 
 Mon, 07 Sep 2020 01:33:09 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id o5sm25205111wmc.33.2020.09.07.01.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 01:33:08 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 3/3] arm64: dts: meson-axg-s400: add MIPI DSI panel nodes
Date: Mon,  7 Sep 2020 10:33:00 +0200
Message-Id: <20200907083300.14412-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200907083300.14412-1-narmstrong@baylibre.com>
References: <20200907083300.14412-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_043310_676503_AF870369 
X-CRM114-Status: GOOD (  13.02  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the nodes for :
- Backlight of the tl070wsh30 panel
- MIPI-DSI attributes
- TDO TL070WSH30 TFT-LCD panel

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../arm64/boot/dts/amlogic/meson-axg-s400.dts | 49 ++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index cb1360ae1211..abfad67ca06b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -7,6 +7,7 @@
 
 #include "meson-axg.dtsi"
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/pwm/pwm.h>
 
 / {
 	compatible = "amlogic,s400", "amlogic,a113d", "amlogic,meson-axg";
@@ -116,6 +117,16 @@
 		reg = <0x0 0x0 0x0 0x40000000>;
 	};
 
+	panel_backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm_ab 1 78125 PWM_POLARITY_INVERTED>;
+		enable-gpios = <&gpio GPIOZ_5 GPIO_ACTIVE_HIGH>;
+		power-supply = <&vcc_5v>;
+		brightness-levels = <0 255>;
+		num-interpolated-steps = <255>;
+		default-brightness-level = <250>;
+	};
+
 	main_12v: regulator-main_12v {
 		compatible = "regulator-fixed";
 		regulator-name = "12V";
@@ -434,6 +445,42 @@
 	};
 };
 
+
+&mipi_dsi {
+	status = "okay";
+
+	assigned-clocks = <&clkc CLKID_GP0_PLL>;
+	assigned-clock-rates = <283500000>;
+
+	panel@0 {
+		compatible = "tdo,tl070wsh30";
+		reset-gpios = <&gpio GPIOZ_6 GPIO_ACTIVE_LOW>;
+		power-supply = <&vcc_3v3>;
+		backlight = <&panel_backlight>;
+		reg = <0>;
+
+		port {
+			mipi_in_panel: endpoint {
+				remote-endpoint = <&mipi_out_panel>;
+			};
+		};
+	};
+};
+
+&mipi_pcie_analog_dphy {
+	status = "okay";
+};
+
+&mipi_dphy {
+	status = "okay";
+};
+
+&mipi_dsi_panel_port {
+	mipi_out_panel: endpoint {
+		remote-endpoint = <&mipi_in_panel>;
+	};
+};
+
 &pdm {
 	pinctrl-0 = <&pdm_dclk_a14_pins>, <&pdm_din0_pins>,
 		    <&pdm_din1_pins>, <&pdm_din2_pins>, <&pdm_din3_pins>;
@@ -443,7 +490,7 @@
 
 &pwm_ab {
 	status = "okay";
-	pinctrl-0 = <&pwm_a_x20_pins>;
+	pinctrl-0 = <&pwm_a_x20_pins>, <&pwm_b_z_pins>;
 	pinctrl-names = "default";
 };
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
