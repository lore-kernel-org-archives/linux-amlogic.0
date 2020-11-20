Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65259C64E75
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 15:33:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0D1322D0A
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 15:33:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GHfsiktp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HXBYOzbh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0D1322D0A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cS/KFpfhkgCV+dlo0Vn2+bCSF1C/kE2PvkZ02tq/m2U=; b=GHfsiktp0wYcAydGQSQWdLP16
	t1+6a3wwHpmh/2XX8yMcsQ5z7q89k3XFATVdh+aROj5c4ov5BL8K4J+1w0dNhyszuCJatTuNcKT1h
	VIG5qhQXqlO4ALreP7fjiqypevjnjQ4IQy9klLSZltC1dDxTgtlKSVWTDM3yqbXDeNiHQ+N6jjsh+
	HAX6UxlWWfPnjBSWwVkscf8ukx5/iKeLPp4Fg3ugcFd3Oj66Ptn3SC7en/GxRmZX0/ehF634avVkH
	7glR40YkphbV8DLxwJm/s6R82N5uksqrhnsxqCI+rnTzu80AJJelzOkgst6LkY4qxmmzogvJhuGUV
	w0mlZZodA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg8PU-0007tA-So; Fri, 20 Nov 2020 15:33:16 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg8Ot-0007gA-Vy
 for linux-amlogic@lists.infradead.org; Fri, 20 Nov 2020 15:32:45 +0000
Received: by mail-wr1-x444.google.com with SMTP id o15so10450321wru.6
 for <linux-amlogic@lists.infradead.org>; Fri, 20 Nov 2020 07:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sy+npf4qPF0hQlWQGZkG29ESoHVhDUO9bSuS4H9zF4M=;
 b=HXBYOzbhhXmSyjWEDFN61kOL4DFh60eZtEvpShrq/4pUHXnoVh0sBP7EM2X4RVtdvc
 aMNY7gKfuBz84ig/MTRHz1D7IWrH3f8aUqMS1DQIdODMpztoaNSA/KUvqJu91SX7KZmK
 VgHmgzGCb0o4TZzhbHeQxPd76RWm+4L26FlJQqZ25E54//EpDOYshiVpI57VU8Lr46zy
 sWoRpqThp8YrbCAvl8RUI2TPf+dvC8irVUtdG3w4Bx9RgeTtxdMZxNfHYU0s+o2lb8eG
 6sJbCWTyIKDaAhW5rUzxJ2/f3dB7MOw0VjMETcE1QOXhSEUhgcM6Tesm+Lrrmk/uPnY/
 2ayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sy+npf4qPF0hQlWQGZkG29ESoHVhDUO9bSuS4H9zF4M=;
 b=EeknIupqnQSw5NJxBImCEHzr1+0qoPwYyOLMgPC6lAFApb4d6a2OdMaJM6qrpgdehK
 w/33mHoH74qCDWBw4yIeG3QtRnfsNdeZUF+9C7wXeJZwLoZS44xqx1X3kqXDGRiPpYLE
 H+39NGSg6Xx3fmjgKG3P4+pmCtrZsc3BebrOjBO/Jvarl3bx9PJgQHG1dht2pep4p9RY
 4f0jbKD3nZRwutyPA4/yeDdQ7y3+vXymS4SNfEiE+mGTCLPdUbtEBmemBkNiuJwrvq7f
 skp7uaWJuwEFIzm4dNo7CQZIHioMeeGpu23SIaybrvMVzJ1QAyzYUqJhjC/WAwSEoh2y
 lmoA==
X-Gm-Message-State: AOAM531FubqFySI9Ir5VTATVaCR8EkZQV0pV9xE3mQnACyGCZiD7ZB5N
 0Ul2S5lemHwRtVHBMm0/EWBviA==
X-Google-Smtp-Source: ABdhPJyz6mra4I7tNvn0ImxS7+5dhfVI4AZGFHDt2MjVCkmcYSSSvvgsYSbh60Ckrcus6kS0DPgiAg==
X-Received: by 2002:a5d:6452:: with SMTP id d18mr16575614wrw.200.1605886358656; 
 Fri, 20 Nov 2020 07:32:38 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:419f:dca4:d17a:66a7])
 by smtp.gmail.com with ESMTPSA id i16sm5398180wru.92.2020.11.20.07.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 07:32:37 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 3/4] arm64: dts: meson-axg: add PCIe nodes
Date: Fri, 20 Nov 2020 16:32:28 +0100
Message-Id: <20201120153229.3920123-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120153229.3920123-1-narmstrong@baylibre.com>
References: <20201120153229.3920123-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_103240_203566_BAA6D9C1 
X-CRM114-Status: GOOD (  12.42  )
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
index 0c4f0cf076ab..b5a06210c49a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -172,6 +172,58 @@ soc {
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
@@ -232,6 +284,15 @@ ethmac: ethernet@ff3f0000 {
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
