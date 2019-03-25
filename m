Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC355C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 09:40:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AD3220863
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 09:40:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cM5nBQz6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="d2CwdO3t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AD3220863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S5cMfcc3VUwGJkNvw7be9xy6K0rjF2/uvH12UBGcuYQ=; b=cM5nBQz6y+66/N
	70Wt9HCM5f9bmX6T//MSsgwGCYynpijxIQVbLeQ4eAMa91R8u5Oh6dd0PLMrsO8/UfEOvxdnKZylb
	eCtkwM2QUUqxDAj3e8Vn5mLwR9YBYXyMWFGaCvIsh70WiMsMoalmAo+giBY1vFiXIfHIdaO9lwIn5
	6lbrwRf59FN3QTu57mdfxlcVK5nu2EbrHMCSl/mNFGsjELNhThwRMlQqU0IXCmTklKgOFnhf4ecKa
	fMtb3LfxzOyU8OqS0mexLYXXU6YKJ9d0Zc+VluuWBZ7LJ5Bo5UWmICTnZdR5zV3zmhbvvD4FfDL+a
	YqZZtYqptwlSfz3zh53w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8M62-00051k-3G; Mon, 25 Mar 2019 09:40:46 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8M5F-0002tr-1A
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 09:40:01 +0000
Received: by mail-wm1-x343.google.com with SMTP id f3so8124131wmj.4
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 02:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2eRvrsWl11jM2CeP6qjHv6pCX8ts9ZzW3hyQekHEmZg=;
 b=d2CwdO3tM/LQr6GKyJQunM5rBjESYHdh09+LqRukckK0f9eMI57N52qBKOTmJAZdfs
 jkeFU4leWlJW9mUoS/XmXYqVqNznTg5KepcwSgOeVrFY0V8rRfefEqHag40Oxobd55Ve
 klwOcLSe2G14dAkbxgKTDFvnx/Lj8GqwvXWJM67N20nLcAw8rsPKIY1sjfCJNFi7+NQS
 AjtwvgCflxHcAy/nLxJv9CpmrKxjX8UM3e5s9UYmMmoiaxrgAEGUrnt+p5eRV4uzjOS9
 vbHqkHiKTz+WZJM1JeDWMlqYcykwHv6p0YTGOSYL9yZvewEoBjOmg6Dn02oQnTVrTHOJ
 wpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2eRvrsWl11jM2CeP6qjHv6pCX8ts9ZzW3hyQekHEmZg=;
 b=nrsweW+Mmin0IpXpRUoa0f8TD5+3jhkzbW+nGnhvzRQuQXjNaV04bLRRAdU6gCVvZv
 qLzXSGvtGvTJBWYoMD66iubQXSzfgnMaMxdyexIkQ7LHYONdG9hekrrNgXJzVe5zs5Zj
 W39jqxWUbxaKekhOhYZ82Ld2G8gWSl7IsZ96vvJNM6JK7HNcQ+sN3gle8z5ADZLilDtQ
 3KEZ047MNHqapaDvGKQ/wGt4qcfliNDz5+8UN0F1IG/qxJChcT6pZq/eChOo/JOH0xu4
 ILFTw9gW74WdCvtYT0IPVJj1WsWk9RHgcVRJSKw8aI4XuEhGQvCZeNGCAQoAmABnVY95
 hJVg==
X-Gm-Message-State: APjAAAULD0+355a7BtBK0KT/wZGrNvAucjSTCtpTlaDlPyPrZmAh+r5M
 DVweSzBjmZWJbTAJnlm1nY1W8A==
X-Google-Smtp-Source: APXvYqwDc+Q4FfraBoAl6k1Z8U+g4nnGoQbkHFlBBm65tSag3R9wdTIZaLG5lHbn94OUl9n8dgOOTQ==
X-Received: by 2002:a1c:4e19:: with SMTP id g25mr11531507wmh.9.1553506795517; 
 Mon, 25 Mar 2019 02:39:55 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id k14sm13044652wmj.26.2019.03.25.02.39.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 02:39:50 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org,
 kishon@ti.com, devicetree@vger.kernel.org
Subject: [PATCH v5 4/8] dt-bindings: usb: dwc3: Add Amlogic G12A DWC3 Glue
 Bindings
Date: Mon, 25 Mar 2019 10:39:39 +0100
Message-Id: <20190325093943.29138-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325093943.29138-1-narmstrong@baylibre.com>
References: <20190325093943.29138-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_023957_214550_B19535CC 
X-CRM114-Status: GOOD (  12.76  )
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
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
