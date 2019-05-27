Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3232C04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 12:44:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7816A20815
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 12:44:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q6VdPSPu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="cYhyX4RG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7816A20815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BIHWHMnCtWWmLVvsilW2kLgyvYJcWo9AM0I59l4S520=; b=Q6VdPSPu5fWKr1
	xa4pom4/cZpBQZTyJwAYMRhzde3CP+iIo0iYPzDMbFQ3uyqL7XajQZkWC/i2xMPqWo8enwa4uXziD
	2yZh3hiGOT7eXJaYc7poR9lej9HmxhHZvvoLZ85hxtt9Rzg5YPdYTQc3yKggVIwe+GVK7gnxzDXZv
	qX3zeoHRLRlSsCSqWXRdjrr0iNsi5trO2EX+cYYub6+VyzuFQOQLYcwccczS57VZ+4QsLUv2fuD7z
	Ze86ccE1DxjMKiPm1uyC/L5FWVl+3rIT7HizYBabl84JNT8xIM6C4BwV3m61H0tN8tVGWElGuu8Gt
	Zi6g33mN/i2PrE7IVgTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVEz4-0001x5-FR; Mon, 27 May 2019 12:44:10 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVEyB-0000sO-0y
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 12:43:19 +0000
Received: by mail-wr1-x441.google.com with SMTP id c2so1602262wrm.8
 for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2019 05:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GkQUEAAflpHSvleM8C2ksBIOQ078CZvnw80T6no6FBM=;
 b=cYhyX4RGU9ybatqZrlhu3awpU2uOva/ELw1S70I45twlrgLduhdjSDILCuC1PttuTt
 2nJtnJ9EI1+Gte7SaOiKxGN6NlhBzVGUL/5GqcRDlaxjzVt1dbTrMC4fozegF+qfUKor
 +q0HRs8ETsnOjl7w716PMmPAjFsl/TiWsfwRaZiNDXc6w0i+Czz02dK5G84tDs+GVikX
 jODGgnVwh2bNYkz7WTgyPYzc+Zr7ismMmQAxkXvj+QGfdB6q9znUmShuol85jBjPktLe
 gDlNW94XN1zObeIe3AbZ8iqc/xCSY2QCXpFaa2hZGh+54GiHebZMHEanOIok7LxAmBZF
 S9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GkQUEAAflpHSvleM8C2ksBIOQ078CZvnw80T6no6FBM=;
 b=jwiJq99CDbpmj64j2vlxmpP7KNS3kfCh6bmaJ3jkZ41brLlRdhR0vTZpKDFPAij0tO
 5HqrEdJEEsptpfL4rkTlJQ9dVXM74ygpI3G31fP9iEu2ebmKQE49DaQQg8uFJ8hH/B65
 52SkpsF+qnYkacpLFoP1XaqvOxd5tTzDICUy+oj4E3aljUiEB1JdGbHHJ4XFfUa8HkXK
 za+hS5y30dlElcfw3REP7m8g7uqVw0fZjCHIUMIfD3kWHw3w7hsgGsiPhMK3Jy6P9dd3
 OT5OlQpUWnvtJ0B5RdErFg3fIxOBbis0U9c3/HRHfk4pSuddu34o6ujQNLu3/7tOPYV4
 MS/Q==
X-Gm-Message-State: APjAAAWg2Re3bTitJbSaULJgxx20J2sIrsKFvZopumKKLEgd0xWwkl9i
 3GoKcOHhpxAloWwmdjFxlaot3w==
X-Google-Smtp-Source: APXvYqwAZ8oF5h4lEBmdEoFJmg6fDQVHoyhJjYPqNt6yYmssL7+UTOhCpj7xzXiyMOi5Jk9dkPKd0A==
X-Received: by 2002:adf:8385:: with SMTP id 5mr658932wre.194.1558960993541;
 Mon, 27 May 2019 05:43:13 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c14sm11494930wrt.45.2019.05.27.05.43.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 May 2019 05:43:12 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: ulf.hansson@linaro.org,
	khilman@baylibre.com
Subject: [PATCH v2 3/3] arm64: dts: meson: g12a: add SDIO controller
Date: Mon, 27 May 2019 14:43:07 +0200
Message-Id: <20190527124307.32075-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527124307.32075-1-narmstrong@baylibre.com>
References: <20190527124307.32075-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_054315_080060_D4DE10F6 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

The Amlogic G12A SDIO Controller has a bug preventing direct DDR access,
add the port A (SDIO) pinctrl and controller nodes and mark this specific
controller with the amlogic,dram-access-quirk property.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 37 +++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 9f72396ba710..d1a3da9d0b2e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -202,6 +202,30 @@
 						};
 					};
 
+					sdio_pins: sdio {
+						mux {
+							groups = "sdio_d0",
+								 "sdio_d1",
+								 "sdio_d2",
+								 "sdio_d3",
+								 "sdio_cmd",
+								 "sdio_clk";
+							function = "sdio";
+							bias-disable;
+							drive-strength-microamp = <4000>;
+						};
+					};
+
+					sdio_clk_gate_pins: sdio_clk_gate {
+						mux {
+							groups = "GPIOX_4";
+							function = "gpio_periphs";
+							bias-pull-down;
+							drive-strength-microamp = <4000>;
+						};
+					};
+
+
 					uart_a_pins: uart-a {
 						mux {
 							groups = "uart_a_tx",
@@ -566,6 +590,19 @@
 			};
 		};
 
+		sd_emmc_a: sd@ffe03000 {
+			compatible = "amlogic,meson-axg-mmc";
+			reg = <0x0 0xffe03000 0x0 0x800>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
+			status = "disabled";
+			clocks = <&clkc CLKID_SD_EMMC_A>,
+				 <&clkc CLKID_SD_EMMC_A_CLK0>,
+				 <&clkc CLKID_FCLK_DIV2>;
+			clock-names = "core", "clkin0", "clkin1";
+			resets = <&reset RESET_SD_EMMC_A>;
+			amlogic,dram-access-quirk;
+		};
+
 		usb: usb@ffe09000 {
 			status = "disabled";
 			compatible = "amlogic,meson-g12a-usb-ctrl";
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
