Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F30FC43461
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 08:33:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E444C208C7
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 08:33:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DL6FEA89";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JxENpTaS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E444C208C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qDMKa2TvfT/WV3BLLKUcCCovM81xsyMq5hTpnt6vklI=; b=DL6FEA89nbiMsQ0WEij4ksMIg
	epnruqgv6NYuHECowdjA5cl59VbGvxJvQc9gxzPfpVSzf2orSbYN4BvD5I/wNRcr1hxmDRNAoz159
	IzGevPkMt/U4pMe0FPTTMWWKoUR3KZ1i14C4uTPAhlNyWWz4S8nUKGQMXkdfXD/WNeEhJweCo4u1j
	EefCadXIgXehbr175+n/peT81HBYmZMdznK+keyWzwhqrHE5Dn6eSdEhYZIzIYYOsnav21gz0MeH7
	mIclVoCvR0oCajjN1YDgJcWsH5y5xFcccmGaxYlWrjST2Mw/L+Z1k+NpHgpV3UriKpj03qPQuZh6W
	Bpqk9EWZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFCaZ-0003ea-41; Mon, 07 Sep 2020 08:33:23 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFCaL-0003YT-1I
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 08:33:11 +0000
Received: by mail-wr1-x444.google.com with SMTP id z4so14855750wrr.4
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2020 01:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O6qLbu0TtBTfYgth1hWlAemiGy5RB2khWzOLpHhAyBI=;
 b=JxENpTaSzdENzNRSzGCLWUGLeF/XmOTECCoSk1vC7uO9L8B2ykKPDu6K64peit6pOx
 0NZvd7zEhkh1fXOsvxqTJKFnXnbgSD7qe6VT0SFEn531G+cEYazGPu5V4ViroD7XgF3p
 zU7y4SaS8J8ulJhY+h1hnwANDAcAxWHmR0lFgh83Crj3bdd/xNPFtG7aujyKaERRvuSp
 D0PrVnkrL/4KB9Luno+bGiWUcjTE6jSYNFx34Pz5B0MgMfCeR5nSSTL65snHqc+qTtk6
 mP/QJMlkNIIZ1by97c1xVA68Be+jZk11dvGB/Vvmv7xKg74HgrSY0+Ux5uZHcJbTrXym
 THFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O6qLbu0TtBTfYgth1hWlAemiGy5RB2khWzOLpHhAyBI=;
 b=OnM42A+HevGDG2ZJhKXipsr+8MuldKwvU4RumLQJd0Xe5RZXP3kB8PSSW5AHE8jXu3
 NndqerxFWu16BJj4qMFQrOaLL+9BplceR3Qddq8p0vcAVKysYytDAsLUUsKKQPLXh0Pc
 5F2uPMZnD0mHj93IhABblL553dcC6ZEQ8wX/PTPZxigbrcWJQGrcjueoPgcotxhFwuDe
 cTYjWYu/e3ShNxNb+jZyxvRiZv48j79C+aLHBzDSrdJZYPmYAoKeDl80jZkbMZQJWlr5
 Y/Yf8qIagQkQ8D1tWw0hYJV4f82SzMrmKrfCaJgp+WlFgLeSplOVGTuRFzYXN5tkkti3
 uS2w==
X-Gm-Message-State: AOAM531oG1WiDC511qvx56VkcfmXZOKGuJKLxnCf4KBhjmhJOX2t8Zy3
 48/wlywPel/aAzqOOUKNlg+kcK2hpXnRuN1K
X-Google-Smtp-Source: ABdhPJyLgypVdwA1Lo6t3FhgX081NBLm9msKduMOXHwEixOYFiNCnVa+gMazKFjvp9LbLHgOFoeoWQ==
X-Received: by 2002:adf:f3c4:: with SMTP id g4mr20609544wrp.168.1599467587962; 
 Mon, 07 Sep 2020 01:33:07 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id o5sm25205111wmc.33.2020.09.07.01.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 01:33:07 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 2/3] arm64: dts: meson-axg: add MIPI DSI Nodes
Date: Mon,  7 Sep 2020 10:32:59 +0200
Message-Id: <20200907083300.14412-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200907083300.14412-1-narmstrong@baylibre.com>
References: <20200907083300.14412-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_043309_160852_AFA99046 
X-CRM114-Status: GOOD (  13.28  )
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
- MIPI DSI+PCIe analog phy
- MIPI D-PHY
- Synopsys MIPI-DSI Transceiver

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 4a93e3fecd90..f1501b19f617 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
 #include <dt-bindings/reset/amlogic,meson-axg-reset.h>
 #include <dt-bindings/power/meson-axg-power.h>
+#include <dt-bindings/phy/phy.h>
 
 / {
 	compatible = "amlogic,meson-axg";
@@ -1111,6 +1112,8 @@
 			sysctrl: system-controller@0 {
 				compatible = "amlogic,meson-axg-hhi-sysctrl",
 					     "simple-mfd", "syscon";
+				#address-cells = <2>;
+				#size-cells = <2>;
 				reg = <0 0 0 0x400>;
 
 				clkc: clock-controller {
@@ -1159,6 +1162,12 @@
 							       <250000000>,
 							       <0>; /* Do Nothing */
 				};
+
+				mipi_pcie_analog_dphy: phy {
+					compatible = "amlogic,axg-mipi-pcie-analog-phy";
+					#phy-cells = <0>;
+					status = "disabled";
+				};
 			};
 		};
 
@@ -1171,6 +1180,19 @@
 			#mbox-cells = <1>;
 		};
 
+		mipi_dphy: phy@ff640000 {
+			compatible = "amlogic,axg-mipi-dphy";
+			reg = <0x0 0xff640000 0x0 0x100>;
+			clocks = <&clkc CLKID_MIPI_DSI_PHY>;
+			clock-names = "pclk";
+			resets = <&reset RESET_MIPI_PHY>;
+			reset-names = "phy";
+			phys = <&mipi_pcie_analog_dphy>;
+			phy-names = "analog";
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		audio: bus@ff642000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xff642000 0x0 0x2000>;
@@ -1618,6 +1640,10 @@
 			/* DPI output port */
 			dpi_port: port@2 {
 				reg = <2>;
+
+				dpi_out: endpoint {
+					remote-endpoint = <&mipi_dsi_in>;
+				};
 			};
 		};
 
@@ -1647,6 +1673,40 @@
 				#reset-cells = <1>;
 			};
 
+			mipi_dsi: dsi@7000 {
+				compatible = "amlogic,meson-axg-dw-mipi-dsi";
+				reg = <0x0 0x6000 0x0 0x400>;
+				resets = <&reset RESET_MIPI_HOST>;
+				reset-names = "top";
+				clocks = <&clkc CLKID_MIPI_DSI_HOST>,
+					 <&clkc CLKID_GP0_PLL>;
+				clock-names = "pclk", "px_clk";
+				phys = <&mipi_dphy>;
+				phy-names = "dphy";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					/* VPU VENC Input */
+					mipi_dsi_venc_port: port@0 {
+						reg = <0>;
+
+						mipi_dsi_in: endpoint {
+							remote-endpoint = <&dpi_out>;
+						};
+					};
+
+					/* DSI Output */
+					mipi_dsi_panel_port: port@1 {
+						reg = <1>;
+					};
+				};
+			};
+
 			gpio_intc: interrupt-controller@f080 {
 				compatible = "amlogic,meson-axg-gpio-intc",
 					     "amlogic,meson-gpio-intc";
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
