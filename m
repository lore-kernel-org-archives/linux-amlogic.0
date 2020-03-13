Return-Path: <SRS0=FIcl=46=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C88C10DCE
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Mar 2020 09:14:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79D79206FA
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Mar 2020 09:14:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CZ0pXPt5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Uq9EQWvX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79D79206FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jTthgtA+TZQUMuPQM/050wc0vIiNQajWLt9nIRF8Ikg=; b=CZ0pXPt5itzDRe
	gUADpWzy9r6v8CvYzmH6djxcbU9wLl1BKmOXlNRcE7K/N3FhtT9NN4t6xhn6WSghbONRh1E/0bTes
	IGIVeTflXyuOcvYxVUWipoWa4wU3LLa6YX/PayXuJZhdTMJnL6VS66EfgIaC7JVvGA9gwnk6NVurZ
	aeLSjEz+HjYphFpcunX/YDA3K01W2cw71IHTvagRqIuM4k+fjjMESBl5SaVkzk05R5IiAMwd2dD1v
	gLneI1LT3DHsNbxOifvdOm9VydIUET+wxJ9X//fKe+R52CgUWHyeIKkvx1/U0uXg1TiD35sqdVnWr
	mZkF7TWzB6ShWUA8k2Mg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCgOv-00042N-Ob; Fri, 13 Mar 2020 09:14:41 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCgOL-0003QB-8M
 for linux-amlogic@lists.infradead.org; Fri, 13 Mar 2020 09:14:07 +0000
Received: by mail-wm1-x343.google.com with SMTP id a132so9056704wme.1
 for <linux-amlogic@lists.infradead.org>; Fri, 13 Mar 2020 02:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E70oj/WzyijwJdfPjeZpJL/TnPPgDCbN1C/+b4ziaYU=;
 b=Uq9EQWvXN+7M20yu7voSmq83vDSTrffh8f2SJRZ7xOSQzmTw7UFNqSV/zMaj+qbldO
 I09tl+0BRTTnwz1QXcfg3E03NXqP9VcLsjoU0JUvX1ptuE+9omUWdEIqRJHMxfTV9myy
 /3bHwaSVGeLmU5gDataY+uOXd/s0LBEC5zsAvQWZcLMxJafqF83MtFd2fo3Uv3hi7zSy
 p6IBhGz4/KI6RWPHZM1bSsbKzlUlHoixfGutpTZ390FGXwUXGh+dgs1LIZjVv7GfbKi0
 y4zfPsh9adv2p5F8TEUBDf7Y7AnErfF99RmIyLbzXlThlj1suyS4n3u+EeL1tVP1tAeT
 NBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E70oj/WzyijwJdfPjeZpJL/TnPPgDCbN1C/+b4ziaYU=;
 b=kLYbNUVTZsr0bZsw7eZVAbIHzMaQHnnBD0GB68RDAtqGkKAsM/O3XNbfqskvD0e+ye
 EaKL0FW7IWw2zArxvXvWAo1qTZDXq+L0LsUzPNdVViqowH/AchRVYEUbMkke3DDOG4eR
 k2Mi6zDAgsYU3qJAUwHGWtctbuZVLvbbrQ6x6UKfItyY9BkOhsFFURJ7XK1a0vd0vUi2
 0qdhaXRQSLfRCUjG8GLBnSqhuOTC9xpv1Y2Zr36tOzYdZqquvjDSfzudNJhMKNDBjgxs
 K/iNItHXrRD7GxV3hHOmBI8myICNaITroMS2hrz8KqGl81K1XjMRB00z1PalD93FwVNl
 t/bA==
X-Gm-Message-State: ANhLgQ2wYiNAImtLQPxYyuO7VG/1mdDLad4fRy+81ms2Pb8xJn/WxDeI
 L78IV3IeYLD1wl9mTLbwUTcepA==
X-Google-Smtp-Source: ADFU+vsUGjCjoPvn78i2h2y/UPx6n/9ZiqzP07HFNclTzgvoivDZdY21eVjZkNHVfoQc6hEKkjcNwg==
X-Received: by 2002:a1c:e913:: with SMTP id q19mr10226228wmc.31.1584090843727; 
 Fri, 13 Mar 2020 02:14:03 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id s1sm7952666wrp.41.2020.03.13.02.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 02:14:03 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH] arm64: dts: meson-g12-common: add spicc controller nodes
Date: Fri, 13 Mar 2020 10:14:01 +0100
Message-Id: <20200313091401.15888-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200313_021405_401344_1A70AFAB 
X-CRM114-Status: UNSURE (   8.42  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the controller and pinctrl nodes for the Amlogic G12A SPICC
controllers.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
Kevin,

This depends on the CLKID_SPICC0_SCLK and CLKID_SPICC1_SCLK introduced
in https://lore.kernel.org/linux-arm-kernel/20200219084928.28707-2-narmstrong@baylibre.com/

Neil

 .../boot/dts/amlogic/meson-g12-common.dtsi    | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index abe04f4ad7d8..3e1dfa80651d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -957,6 +957,57 @@
 						};
 					};
 
+					spicc0_x_pins: spicc0-x {
+						mux {
+							groups = "spi0_mosi_x",
+							       "spi0_miso_x",
+							       "spi0_clk_x";
+							function = "spi0";
+							drive-strength-microamp = <4000>;
+							bias-disable;
+						};
+					};
+
+					spicc0_ss0_x_pins: spicc0-ss0-x {
+						mux {
+							groups = "spi0_ss0_x";
+							function = "spi0";
+							drive-strength-microamp = <4000>;
+							bias-disable;
+						};
+					};
+
+					spicc0_c_pins: spicc0-c {
+						mux {
+							groups = "spi0_mosi_c",
+							       "spi0_miso_c",
+							       "spi0_ss0_c",
+							       "spi0_clk_c";
+							function = "spi0";
+							drive-strength-microamp = <4000>;
+							bias-disable;
+						};
+					};
+
+					spicc1_pins: spicc1 {
+						mux {
+							groups = "spi1_mosi",
+							       "spi1_miso",
+							       "spi1_clk";
+							function = "spi1";
+							drive-strength-microamp = <4000>;
+						};
+					};
+
+					spicc1_ss0_pins: spicc1-ss0 {
+						mux {
+							groups = "spi1_ss0";
+							function = "spi1";
+							drive-strength-microamp = <4000>;
+							bias-disable;
+						};
+					};
+
 					tdm_a_din0_pins: tdm-a-din0 {
 						mux {
 							groups = "tdm_a_din0";
@@ -2051,6 +2102,30 @@
 				amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
 			};
 
+			spicc0: spi@13000 {
+				compatible = "amlogic,meson-g12a-spicc";
+				reg = <0x0 0x13000 0x0 0x44>;
+				interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc CLKID_SPICC0>,
+					 <&clkc CLKID_SPICC0_SCLK>;
+				clock-names = "core", "pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spicc1: spi@15000 {
+				compatible = "amlogic,meson-g12a-spicc";
+				reg = <0x0 0x15000 0x0 0x44>;
+				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc CLKID_SPICC1>,
+					 <&clkc CLKID_SPICC1_SCLK>;
+				clock-names = "core", "pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			pwm_ef: pwm@19000 {
 				compatible = "amlogic,meson-g12a-ee-pwm";
 				reg = <0x0 0x19000 0x0 0x20>;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
