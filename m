Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79927C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 13:28:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 290FE20850
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 13:28:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d0TOpRbC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jIrXrSzR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 290FE20850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yK0AgU4aWGgT0dTX8KCk7iZpslcP90hrFsAin/VyOR8=; b=d0TOpRbCyww1wi
	MidVjSlBpRL9TODSeXynqwMjoN9BgFrwXhCnH3ogGXD60uApPNTF9OAf1slUCY7o419YFsQsX+Z36
	+Wy+ieCj8ifqpkemSnE+vhDdW386dj8fi74BjTbNFCrWRr9nc4ti/8537sa7dvruN9g3VoaRHy82t
	k/dzcHsB/nd4T5wkFR4FHHQljHbcnalUJ8ZCsScjuDa7zcyol1xi1qADb3CSMrjD608JKPUdL14qe
	DiC+JzVnnN+8K2z7NCGuIkSOCjeiY0zNLY32HPff8Itq5G41fTcuyWxwRX20JSGqImoME0TnQ/0Eb
	ryBtd8Ymk0/P18ZBtGVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5sJD-0005jx-Q1; Mon, 18 Mar 2019 13:28:07 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5sIC-0004Pb-2F
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 13:27:11 +0000
Received: by mail-wm1-x342.google.com with SMTP id v14so4272730wmf.2
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 06:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fUvfuvKdMzBgRt0tGHLl1dfJOwtoisFeSR4beOE+s3s=;
 b=jIrXrSzRfeFT3L5SqZU8VhMdQfnOMqArVN3RUgDdTXzDTm6/nTSU3YkSzNKAK9AsGE
 BCLm2p2J6rwKXosIReB02gTyvVzLr1HKi0TMSyhImLxhbJBaBmP74mqtwzIabI9b+GF3
 2NHTQPZfGvADAQk8cb4R4S5BK3Vj/OhymYjKGYguPkcUyZk9LrdEG61VR2MIz6q0dihq
 vMIHKCDEn5wycwAiO7a9FnsK0XkydguP0KcxuZA47q+2rDMmVEqgOWUA2u+SuI2jtIHx
 77pLxX9asFYrkz1LkV+wQoMGOpnJgGkR4PcfUAq3qFxVpcpp72J5Fu3UPGX5ZRg038XK
 8mxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fUvfuvKdMzBgRt0tGHLl1dfJOwtoisFeSR4beOE+s3s=;
 b=Ml9so7vHP7OpG3+lyQ4XkQa+rCYAYdkKvIcySRtTxfItm9rfivzghTZKNTQ4YnKtI1
 MakxUKGjzi5Xi8Z+zpYG4+GP/QF4hR7wI13o2EvP2tyicY8veRAW2S2lbrDc2CWRry9Z
 bfCVrMX5vVpT9AlK+JV/8o7MBDJoULZG2ManXHBSug/Y7ojPBasII63fMmQbyfIxX3kn
 bGEF+P757rzZTUrL3GNTUgqyXnaN+kKkPOvWpNxVsqe5xJnzBiYnqh9SMjWVa2kFwj8H
 oqN+Dc4+lTQiQLv+iAamygkXFbjURIYHiavG7l2QSgMoREPSRxE202Kw9ZMR25Huh7uP
 DXNQ==
X-Gm-Message-State: APjAAAUbmxjJ9xXA2qYHVFLzStaYkJxMIlFZ5SHrHAVfmKyveoIoZY0V
 qFd6TqzrUiDOlNGWMCnM/LFRihYAYjrzwg==
X-Google-Smtp-Source: APXvYqxdOds81FxQhEjLmNahUvw0D3mjo6gM3zPsg94GVgShFZpFbwtu0SgpQz4+/WcduNdgNB5okw==
X-Received: by 2002:a1c:f50d:: with SMTP id t13mr11232296wmh.81.1552915622556; 
 Mon, 18 Mar 2019 06:27:02 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j128sm10421601wmb.43.2019.03.18.06.27.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 06:27:01 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org,
 kishon@ti.com, devicetree@vger.kernel.org
Subject: [PATCH v4 4/8] dt-bindings: usb: dwc3: Add Amlogic G12A DWC3 Glue
 Bindings
Date: Mon, 18 Mar 2019 14:26:51 +0100
Message-Id: <20190318132655.30040-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318132655.30040-1-narmstrong@baylibre.com>
References: <20190318132655.30040-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_062704_401065_E58E6861 
X-CRM114-Status: GOOD (  12.38  )
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
Cc: Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Adds the bindings for the Amlogic G12A USB Glue HW.

The Amlogic G12A SoC Family embeds 2 USB Controllers :
- a DWC3 IP configured as Host for USB2 and USB3
- a DWC2 IP configured as Peripheral USB2 Only

A glue connects these both controllers to 2 USB2 PHYs,
and optionnally to an USB3+PCIE Combo PHY shared with the PCIE controller.

The Glue configures the UTMI 8bit interfaces for the USB2 PHYs, including
routing of the OTG PHY between the DWC3 and DWC2 controllers, and
setups the on-chip OTG mode selection for this PHY.

The PHYs phandles are passed  to the Glue node since the Glue controls the
interface with the PHY, not the DWC3 controller.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/usb/amlogic,dwc3.txt  | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt b/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
index 9a8b631904fd..b9f04e617eb7 100644
--- a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
@@ -40,3 +40,91 @@ Example device nodes:
 				phy-names = "usb2-phy", "usb3-phy";
 			};
 		};
+
+Amlogic Meson G12A DWC3 USB SoC Controller Glue
+
+The Amlogic G12A embeds a DWC3 USB IP Core configured for USB2 and USB3
+in host-only mode, and a DWC2 IP Core configured for USB2 peripheral mode
+only.
+
+A glue connects the DWC3 core to USB2 PHYs and optionnaly to an USB3 PHY.
+
+One of the USB2 PHY can be re-routed in peripheral mode to a DWC2 USB IP.
+
+The DWC3 Glue controls the PHY routing and power, an interrupt line is
+connected to the Glue to serve as OTG ID change detection.
+
+Required properties:
+- compatible:	Should be "amlogic,meson-g12a-usb-ctrl"
+- clocks:	a handle for the "USB" clock
+- resets:	a handle for the shared "USB" reset line
+- reg:		The base address and length of the registers
+- interrupts:	the interrupt specifier for the OTG detection
+- phys: 	handle to used PHYs on the system
+	- a <0> phandle can be used if a PHY is not used
+- phy-names:	names of the used PHYs on the system :
+	- "usb2-phy0" for USB2 PHY0 if USBHOST_A port is used
+	- "usb2-phy1" for USB2 PHY1 if USBOTG_B port is used
+	- "usb3-phy0" for USB3 PHY if USB3_0 is used
+- dr_mode:	should be "host", "peripheral", or "otg" depending on
+	the usage and configuration of the OTG Capable port.
+	- "host" and "peripheral" means a fixed Host or Device only connection
+	- "otg" means the port can be used as both Host or Device and
+	  be switched automatically using the OTG ID pin.
+
+Optional properties:
+- vbus-supply:	should be a phandle to the regulator controlling the VBUS
+		power supply when used in OTG switchable mode
+
+Required child nodes:
+
+A child node must exist to represent the core DWC3 IP block. The name of
+the node is not important. The content of the node is defined in dwc3.txt.
+
+A child node must exist to represent the core DWC2 IP block. The name of
+the node is not important. The content of the node is defined in dwc2.txt.
+
+PHY documentation is provided in the following places:
+- Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt
+- Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
+
+Example device nodes:
+	usb: usb@ffe09000 {
+			compatible = "amlogic,meson-g12a-usb-ctrl";
+			reg = <0x0 0xffe09000 0x0 0xa0>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&clkc CLKID_USB>;
+			resets = <&reset RESET_USB>;
+
+			dr_mode = "otg";
+
+			phys = <&usb2_phy0>, <&usb2_phy1>,
+			       <&usb3_pcie_phy PHY_TYPE_USB3>;
+			phy-names = "usb2-phy0", "usb2-phy1", "usb3-phy0";
+
+			dwc2: usb@ff400000 {
+				compatible = "amlogic,meson-g12a-usb", "snps,dwc2";
+				reg = <0x0 0xff400000 0x0 0x40000>;
+				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc CLKID_USB1_DDR_BRIDGE>;
+				clock-names = "ddr";
+				phys = <&usb2_phy1>;
+				dr_mode = "peripheral";
+				g-rx-fifo-size = <192>;
+				g-np-tx-fifo-size = <128>;
+				g-tx-fifo-size = <128 128 16 16 16>;
+			};
+
+			dwc3: usb@ff500000 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0xff500000 0x0 0x100000>;
+				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+				dr_mode = "host";
+				snps,dis_u2_susphy_quirk;
+				snps,quirk-frame-length-adjustment;
+			};
+	};
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
