Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB17C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:00:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A95D2070D
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:00:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nfMj/4ZP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="uqGZrz2R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A95D2070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4NeeQLYSt+n94GjHQoFm4+c/xcq4N4ia3e+8zNAcWzc=; b=nfMj/4ZPsta0gN
	RhPG3zsw9apukLbH1WHErBq9LcsfSAm2idZ5keEBM6GYUfFyX0VHv1qbpgM48Ilr8pT8BZVYiVRt1
	RhzC8zHhrtL1xhw/gqeTA8ELb4XfRbkSYCIFoEfMyBJ7q6nqF7c+g523vK8Obkl5sHPy2wUnEHFnD
	UvP19bC1LI0CbTMkMSbarENJuktfQQKpUe8B6ev1Crzxy5XWDAV2zZoC0qIjJr/h9X8HnbbDyc45V
	bBTzAuH6E6kEQ8BMhzJBE7N3shARJIWU0xyBQk1ywbrUAKZ8hUAmw1gUygrlausRoCCBYex/vLt5C
	oegXR7Hgeu1TloSPCbiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5p4J-0006Tx-9M; Mon, 18 Mar 2019 10:00:31 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5p2r-0003ak-Oi
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 09:59:16 +0000
Received: by mail-wr1-x444.google.com with SMTP id w1so10323427wrp.2
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 02:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9EioP8T7LI4Uy8dBmKG3aC7DgMQWG+51HGznOMhw3V4=;
 b=uqGZrz2R/fewUc9eUMs4QTydVILxyq5+7yIo5wzVdwaLCPO0kCCcqSBFWQX52mYb9I
 EUc5YykPPxSQUc5nvP7JPsBhJ3VkJYWZ3XMv7a6WhoTUiiLZaeYcCrv/QK8CgQ6XD4oH
 YSEK7tFBw4d7HZMMVmvve1HwaPlaHYK1qR+fLqIEtgiHLqNBgPTaqlEDBHx1R9XCKGgX
 fBlOnrJ0wHPGfzFVnQe7qDWnI52R1tBlZL8gqhkzV2ImNBK/e1pTXvEmnbmydoo6UJj2
 lkQ7zBwWdKvH9Awm9XAE0CgILaE8nhjzgUpiM6hKNAeSpylM/kzcnAhp+uBre+tbNijo
 /t/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9EioP8T7LI4Uy8dBmKG3aC7DgMQWG+51HGznOMhw3V4=;
 b=IZUVVEFuXSEtCqClJls33Ztf4qS1agxu9P7Mskq4wRA3Fjws/YQe7bvFHMnIxiDd4A
 D62at7CaT1ksIUHjG71ELQtAvvN/8fiR8mk4nKlfvfUM821T+FDJHgFhOEhkEeFrVc1A
 QtP4r020tAAJ1/EZ7uvPNAlHSKhKJ3Oc7Air2NjYZqkWMUq/YeovAXx+tbS4Jb6W/pM7
 oSvRtF00YkrFnT9mCxH216NcUbHQUmkNn4z507ej//dffIiCKJ9JDv20AX28A/Leto4k
 l/AgLBfpp9W0uFg5ZdNvtmT35yuohlQyBr/KUr7j4AwHioN1KAuHrV7XFycHoxcaspSr
 FOGA==
X-Gm-Message-State: APjAAAVxVheU336OcSmXUChlY06FbV4OyHbu2mUeKMbMBNQ/UmBpUfCi
 SGgqogw1ZUogHyKXRMiNp08oJQ==
X-Google-Smtp-Source: APXvYqw2j8aVz8JHkcIL7kul6LNskzjeo7tEIM8Qx9ypPmyjqNydMuFGNQcfAkqQs9VeB4K9VUvk2A==
X-Received: by 2002:adf:d4c6:: with SMTP id w6mr11236056wrk.65.1552903139357; 
 Mon, 18 Mar 2019 02:58:59 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g8sm5459034wro.77.2019.03.18.02.58.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 02:58:58 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 5/8] arm64: dts: meson: g12a: Add UART A,
 B & C nodes and pins
Date: Mon, 18 Mar 2019 10:58:48 +0100
Message-Id: <20190318095851.4062-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318095851.4062-1-narmstrong@baylibre.com>
References: <20190318095851.4062-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_025902_123436_AECA22E7 
X-CRM114-Status: GOOD (  10.12  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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

This patch adds the 3 UART nodes in the EE power domain with the corresponding
pinctrl nodes.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 72 +++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index cefd6e27c7a7..992751024366 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -114,6 +114,51 @@
 						#gpio-cells = <2>;
 						gpio-ranges = <&periphs_pinctrl 0 0 86>;
 					};
+
+					uart_a_pins: uart-a {
+						mux {
+							groups = "uart_a_tx",
+								 "uart_a_rx";
+							function = "uart_a";
+							bias-disable;
+						};
+					};
+
+					uart_a_cts_rts_pins: uart-a-cts-rts {
+						mux {
+							groups = "uart_a_cts",
+								 "uart_a_rts";
+							function = "uart_a";
+							bias-disable;
+						};
+					};
+
+					uart_b_pins: uart-b {
+						mux {
+							groups = "uart_b_tx",
+								 "uart_b_rx";
+							function = "uart_b";
+							bias-disable;
+						};
+					};
+
+					uart_c_pins: uart-c {
+						mux {
+							groups = "uart_c_tx",
+								 "uart_c_rx";
+							function = "uart_c";
+							bias-disable;
+						};
+					};
+
+					uart_c_cts_rts_pins: uart-c-cts-rts {
+						mux {
+							groups = "uart_c_cts",
+								 "uart_c_rts";
+							function = "uart_c";
+							bias-disable;
+						};
+					};
 				};
 			};
 
@@ -258,6 +303,33 @@
 				compatible = "amlogic,meson-g12a-clk-measure";
 				reg = <0x0 0x18000 0x0 0x10>;
 			};
+
+			uart_C: serial@22000 {
+				compatible = "amlogic,meson-gx-uart";
+				reg = <0x0 0x22000 0x0 0x18>;
+				interrupts = <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>, <&clkc CLKID_UART2>, <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
+				status = "disabled";
+			};
+
+			uart_B: serial@23000 {
+				compatible = "amlogic,meson-gx-uart";
+				reg = <0x0 0x23000 0x0 0x18>;
+				interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>, <&clkc CLKID_UART1>, <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
+				status = "disabled";
+			};
+
+			uart_A: serial@24000 {
+				compatible = "amlogic,meson-gx-uart";
+				reg = <0x0 0x24000 0x0 0x18>;
+				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>, <&clkc CLKID_UART0>, <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
+				status = "disabled";
+			};
 		};
 	};
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
