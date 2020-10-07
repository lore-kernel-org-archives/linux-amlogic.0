Return-Path: <SRS0=JUPl=DO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC33EC41604
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2020 10:06:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E2182076C
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2020 10:06:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ArPjc2Sb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gfvZky3W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E2182076C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hhGXwZU4sD67OccMgYC2xY+RYEHTqmN9JZ+Ab50AOMg=; b=ArPjc2Sb49SrC0y8/7xUXmt6Y
	d2vupMo4Yoe16BAhgE90XaVrzuKC8Ng0nBO2O9lrSMhbaX1jtf952dFUxkJQuuo8vdRLgXowBqeEo
	ZapsgoFusG0Nc1UIiCmz0axsN5BDXN1YAtxdEurnWfTMAfjEVrgDxPEeWvShTvfnfFCbTBOP+dyf9
	E3QS0UjFx9CZveljlQjQr+tALvZuk7LW6BbYjjcqcPT+vqBlv1ZCNd1g/lDAqjU/sdcp1oCsrB9bB
	6cKk0BhobbQdrppSPXrmM66fiWJkYJ8/RpKCTLb7ily20TTHavJd+5ygUyQJHKO6C4W1WVEIc1ADt
	4AogSfnoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ6LS-0008Jv-EO; Wed, 07 Oct 2020 10:06:50 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ6LF-0008Dl-Fk
 for linux-amlogic@lists.infradead.org; Wed, 07 Oct 2020 10:06:40 +0000
Received: by mail-wr1-x441.google.com with SMTP id k10so1456902wru.6
 for <linux-amlogic@lists.infradead.org>; Wed, 07 Oct 2020 03:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VpuXi1o+IHuZiacFej/j/1OCqU16SYrffISjS5U/rbM=;
 b=gfvZky3W42Kxh+9HkUaAtrNXp4gob+EqYqitVUDZcaqMRVKBGmau+dQ3d38uHLZ4A5
 6bS5ZdmRZY0lWU7NAqW/3gz2U9RKMbAOHvG6g4liOEYqxPKdD5qOl5A+Ghb1dXmB3WeS
 co24EDXZNUHuuGZssBYhbUMAyWub1m85HS5OD6mO6+bDeQ3Vp+EeT83VF/rStr10ZYUS
 Lfem46h9rDsTcbj8+ypF8PXuQKNI2Z9iH47Kjs/VLi2Y/tpPURKqN5UcidX9s5AWXkhM
 DHVSgBzQAiAqp3P84VxJiJhlSv07UmdWMCCgXr3licGpFc74ME9M8iHltrGFdKiWBKG1
 B2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VpuXi1o+IHuZiacFej/j/1OCqU16SYrffISjS5U/rbM=;
 b=f/4j4dKS9M8jhllH8c1vxQbpnlEMhPqCfcyp4u36SoFKeInpt+DuJlczWAJkNYwgwh
 WB18PVfNlG7WU0DKVld6iTXCe3WBM6pzV2AFdbJ93YgvhhSvF/FrVSJ8PMDa+NdelVzN
 LOYyl9DBqbFK3XfT02zoaxXh56BVsecPFxIkYhlopEUC+Ut0ldfoUEqK26HQZwueHcwN
 0AcDXTFe/WVV8w4MyCMs0ZWGrwnNUnmqgTK6G8HHaadAKU1ebvX8QwSnV23MrzPtyGnR
 kStI05kRJ/X+/Q71YWYvBhhopL60jjTEFNcrrFrKMox/OCdb2Xz05CYWC3TyL8ebiNX/
 Bakg==
X-Gm-Message-State: AOAM533x5YiZwDJnM9Hw+2jaX9rt9nFDayMdQ3g2MKwl3LTmy4K7X/L2
 pVFLzv8+8mZ8DWxQIyrXAmJkAw==
X-Google-Smtp-Source: ABdhPJwIULodMMl6cf11jyGyL9uHswHbpjpN9u0OXnZQDjaSkIf0Rlw+vRZlGgaIjMdczsaxMKPTNQ==
X-Received: by 2002:adf:80e4:: with SMTP id 91mr2618351wrl.223.1602065195284; 
 Wed, 07 Oct 2020 03:06:35 -0700 (PDT)
Received: from bojack.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h16sm2214981wre.87.2020.10.07.03.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 03:06:34 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 1/2] arm64: dts: meson-axg: add PCIe nodes
Date: Wed,  7 Oct 2020 12:06:30 +0200
Message-Id: <20201007100631.192348-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201007100631.192348-1-narmstrong@baylibre.com>
References: <20201007100631.192348-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_060637_549392_2EC9CA29 
X-CRM114-Status: GOOD (  11.61  )
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

This adds the nodes for the :
- AXG PCIe PHY, using the shared analog PCIe/MIPI DSI PHY
- 2x AXG PCIe controllers

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index b27f6f4696da..44393d9c3981 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -172,6 +172,58 @@
 		#size-cells = <2>;
 		ranges;
 
+		pcieA: pcie@f9800000 {
+			compatible = "amlogic,axg-pcie", "snps,dw-pcie";
+			reg = <0x0 0xf9800000 0x0 0x400000>,
+			      <0x0 0xff646000 0x0 0x2000>,
+			      <0x0 0xf9f00000 0x0 0x100000>;
+			reg-names = "elbi", "cfg", "config";
+			interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0 0 0 0 &gic GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
+			bus-range = <0x0 0xff>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges = <0x82000000 0 0xf9c00000 0x0 0xf9c00000 0 0x00300000>;
+
+			clocks = <&clkc CLKID_USB>, <&clkc CLKID_PCIE_A>, <&clkc CLKID_PCIE_CML_EN0>;
+			clock-names = "general", "pclk", "port";
+			resets = <&reset RESET_PCIE_A>, <&reset RESET_PCIE_APB>;
+			reset-names = "port", "apb";
+			num-lanes = <1>;
+			phys = <&pcie_phy>;
+			phy-names = "pcie";
+			status = "disabled";
+		};
+
+		pcieB: pcie@fa000000 {
+			compatible = "amlogic,axg-pcie", "snps,dw-pcie";
+			reg = <0x0 0xfa000000 0x0 0x400000>,
+			      <0x0 0xff648000 0x0 0x2000>,
+			      <0x0 0xfa400000 0x0 0x100000>;
+			reg-names = "elbi", "cfg", "config";
+			interrupts = <GIC_SPI 167 IRQ_TYPE_EDGE_RISING>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0 0 0 0 &gic GIC_SPI 169 IRQ_TYPE_EDGE_RISING>;
+			bus-range = <0x0 0xff>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges = <0x82000000 0 0xfa500000 0x0 0xfa500000 0 0x00300000>;
+
+			clocks = <&clkc CLKID_USB>, <&clkc CLKID_PCIE_B>, <&clkc CLKID_PCIE_CML_EN1>;
+			clock-names = "general", "pclk", "port";
+			resets = <&reset RESET_PCIE_B>, <&reset RESET_PCIE_APB>;
+			reset-names = "port", "apb";
+			num-lanes = <1>;
+			phys = <&pcie_phy>;
+			phy-names = "pcie";
+			status = "disabled";
+		};
+
 		usb: usb@ffe09080 {
 			compatible = "amlogic,meson-axg-usb-ctrl";
 			reg = <0x0 0xffe09080 0x0 0x20>;
@@ -230,6 +282,15 @@
 			status = "disabled";
 		};
 
+		pcie_phy: phy@ff644000 {
+			compatible = "amlogic,axg-pcie-phy";
+			reg = <0x0 0xff644000 0x0 0x1c>;
+			resets = <&reset RESET_PCIE_PHY>;
+			phys = <&mipi_pcie_analog_dphy>;
+			phy-names = "analog";
+			#phy-cells = <0>;
+		};
+
 		pdm: audio-controller@ff632000 {
 			compatible = "amlogic,axg-pdm";
 			reg = <0x0 0xff632000 0x0 0x34>;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
