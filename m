Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADCFC4167D
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Nov 2022 11:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zoPpCDZH0yG4IY25k1NzVDAzqQJhd4WrTerhZmJ5Ys8=; b=ap68tvUKOGHkpD
	BL/JPGouW0xtJKJFT/qzuSa522YtXkX5Q2cwd60PfLIW9Zy1c/mhYylm2rnbxO1X5tCd/kT2y2YoC
	aCq0iIsN1wBWGqumhq3E4iPp9YszCTuVKr0dVhiKvyFJSFX3A7hiNTBvVEZJISabfdaoNdxsx3q4o
	aW9iS9Kyp1wdjxdCFtU38L8e4XbDb9ym57yHunCNtHASzquCAOgYDnqJhcOT5LdzYVTEm7o9CbV4P
	I7uMPofPaJk9KbXMDsuTZQ8gJSvdzI06EZ/gQ5PBmNxyTFZOZgh7Gn/Fo0cqtEifpVmD1cauK8g4q
	MEBGx90ic5QpTUVyF8Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozcA9-001EPh-Q3; Mon, 28 Nov 2022 11:19:01 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozc9F-001DtI-II; Mon, 28 Nov 2022 11:18:06 +0000
Received: by mail-wr1-x42b.google.com with SMTP id z4so16259644wrr.3;
        Mon, 28 Nov 2022 03:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZ/yfW2uv4L2OBEMjogEawvHGxQ+pctbkljRiIAmmkE=;
        b=hGj6yWExeA6aOxOP28/1HTpYw/34JrQ7Esvqizyi96Ucx4ABRX8kMiUxEHL9qfsiE0
         PqAAPfTyE97mJzH7BnkNxb3dOEga0uSP6vmgicBtIKcXdG99+CaH6p+PH9l+ZDP1e+WW
         bvWsY2p6m6fkKh3/oi+1jwK7HQfx8vQmNaC6gKZjnzqvXx+H47P+7SPY3H4dzQ+Hp74W
         Maf4pZjT7qBSotYev3Ay7J2G570YJp1d3WrXwJaswh4oY7DqJTL4fmuUpeP8Bub2rO05
         5wZiV+82TgrY+Hlq8t5ZQkzqjc34D8BEbJspYKcRy3D3zE9ySXLJoPo7D3c2r6K+cdZp
         qoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MZ/yfW2uv4L2OBEMjogEawvHGxQ+pctbkljRiIAmmkE=;
        b=b/qhTos5UYYse8hJYrn5DwdGgU2BxTHhuokwBHGlhCW0S/roorD8d3/eylgrvxqwZi
         e8p3+1tIeSqXgP6wCjv6k4t7edhiSyDteHOcZ0e4LJQns0jdkmoI0cs0Nxu2uzpZUiXu
         tE0GwydxHt1xbG5MpFHyvntLPmUeaHBlajJAD5R2qoeJt4871hdDmbhDA56CBadEh1f/
         3t51w+DrctfDxCri7eWmWHIL9re554pjWWXYNpEbU2cVyeP0nNIzpk/Ssg+L+xclsIiS
         Ftc0WSCf8zP2NWHGxMLkFDqbMgOMEyVQGDFLioRBHXoNvB0WbBy5KLg7TDwiDUghuuAI
         OvGw==
X-Gm-Message-State: ANoB5pmEIB6i6ZdWaSR/PQjr8oOoBOv6dh1KzXTSJ9ya3GqUmrCzw48h
	7mWlJveq6rx3l2hQEkSG5Uw=
X-Google-Smtp-Source: AA0mqf6SjstKcXwXEz6uOwVDgqeAXY8Z2rREjLqZqBUwe7/hkRY+JXxFuZitbclFTEy6qjt90aucIA==
X-Received: by 2002:adf:a1c8:0:b0:236:72f1:f124 with SMTP id v8-20020adfa1c8000000b0023672f1f124mr30428869wrv.161.1669634283786;
        Mon, 28 Nov 2022 03:18:03 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
        by smtp.gmail.com with ESMTPSA id g3-20020adffc83000000b0024207ed4ce0sm7711817wrr.58.2022.11.28.03.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 03:18:03 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Cc: italonicola@collabora.com,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 4/5] arm64: dts: Add DT node for the VIPNano-QI on the A311D
Date: Mon, 28 Nov 2022 12:17:37 +0100
Message-Id: <20221128111740.39003-5-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128111740.39003-1-tomeu.vizoso@collabora.com>
References: <20221128111740.39003-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_031805_628099_81EE1B7F 
X-CRM114-Status: GOOD (  10.16  )
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

This "NPU" is very similar to the Vivante GPUs and Etnaviv works well
with it with just a few small changes.

v2: Add reference to RESET_NNA (Neil)

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi     | 11 +++++++++++
 .../boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 45947c1031c4..aaa629816e41 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/reset/amlogic,meson-g12a-reset.h>
 #include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/power/meson-g12a-power.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -2484,4 +2485,14 @@ xtal: xtal-clk {
 		#clock-cells = <0>;
 	};
 
+	npu: npu@ff100000 {
+		compatible = "vivante,gc";
+		reg = <0x0 0xff100000 0x0 0x20000>;
+		interrupts = <0 147 4>;
+		clocks = <&clkc CLKID_NNA_CORE_CLK>,
+			<&clkc CLKID_NNA_AXI_CLK>;
+		clock-names = "core", "bus";
+		resets = <&reset RESET_NNA>;
+		power-domains = <&pwrc PWRC_G12A_NNA_ID>;
+	};
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
index 124a80901084..73f3d87dcefd 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
@@ -15,6 +15,10 @@ / {
 	compatible = "khadas,vim3", "amlogic,a311d", "amlogic,g12b";
 };
 
+&npu {
+	status = "okay";
+};
+
 /*
  * The VIM3 on-board  MCU can mux the PCIe/USB3.0 shared differential
  * lines using a FUSB340TMX USB 3.1 SuperSpeed Data Switch between
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
