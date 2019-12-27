Return-Path: <SRS0=RZf2=2R=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 203F1C2D0CE
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Dec 2019 06:38:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E218A206CB
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Dec 2019 06:38:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DbgA58S3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E218A206CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ScBRsWCDRVamclN1KRDhst9DcjiyB67XXhdwvKWTmE=; b=DbgA58S3yWT3Q/
	dYi1tkIGt75cQr0kLiFWRvaBMrvwyJ1HxteR4OEfziJa3GEaAXKRXWeGD76s5aVozyRUrG+z5tp3y
	vs3nMqPy+hxyYZXn6wKxQgNoJBlAD4IeoiXO0tyOYrwUX6/t5xNoMTjyEvPMmad/7U33FDva3KRx/
	pJrNZiIQQZHNjr0cMGPIpBXIrxhCjW3D1UP1Ra3foBTA/dBGcW36UGD2rGzCLesUXIpLH5kmqFRXk
	9qEqsDv7ACsCUjjaMsUUR2BHMygRyzrd/9nN0Q8Jaqvj1mdCS317IoW/OeIzOjwqxhgaucS0gWWnv
	sk9nMOj1eb6ND46PAIrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikjG5-0008QI-JO; Fri, 27 Dec 2019 06:38:01 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikjFA-0007c3-Iq; Fri, 27 Dec 2019 06:37:07 +0000
Received: from droid10.amlogic.com (10.18.11.213) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.1591.10; Fri, 27 Dec 2019
 14:37:17 +0800
From: Hanjie Lin <hanjie.lin@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v3 2/6] dt-bindings: usb: dwc3: Add the Amlogic A1 Family DWC3
 Glue Bindings
Date: Fri, 27 Dec 2019 14:36:42 +0800
Message-ID: <1577428606-69855-3-git-send-email-hanjie.lin@amlogic.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577428606-69855-1-git-send-email-hanjie.lin@amlogic.com>
References: <1577428606-69855-1-git-send-email-hanjie.lin@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.18.11.213]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191226_223704_654860_F4B8F1FB 
X-CRM114-Status: UNSURE (   7.51  )
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-usb@vger.kernel.org, Yue Wang <yue.wang@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liang Yang <liang.yang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>,
 Xingyu Chen <xingyu.chen@amlogic.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jian Hu <jian.hu@amlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic A1 SoC Family embeds 1 USB Controllers:
 - a DWC3 IP configured as Host for USB2 and USB3

A glue connects the controllers to the USB2 PHY of A1 SoC.

Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
Signed-off-by: Yue Wang <yue.wang@amlogic.com>
---
 .../bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml  | 57 +++++++++++++++++++---
 1 file changed, 51 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
index 4efb77b..6103cc2 100644
--- a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
+++ b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
@@ -9,6 +9,8 @@ title: Amlogic Meson G12A DWC3 USB SoC Controller Glue
 
 maintainers:
   - Neil Armstrong <narmstrong@baylibre.com>
+  - Hanjie Lin <hanjie.lin@amlogic.com>
+  - Yue Wang <yue.wang@amlogic.com>
 
 description: |
   The Amlogic G12A embeds a DWC3 USB IP Core configured for USB2 and USB3
@@ -22,10 +24,14 @@ description: |
   The DWC3 Glue controls the PHY routing and power, an interrupt line is
   connected to the Glue to serve as OTG ID change detection.
 
+  The Amlogic A1 embeds a DWC3 USB IP Core configured for USB2 in
+  host-only mode.
+
 properties:
   compatible:
     enum:
       - amlogic,meson-g12a-usb-ctrl
+      - amlogic,meson-a1-usb-ctrl
 
   ranges: true
 
@@ -37,6 +43,11 @@ properties:
 
   clocks:
     minItems: 1
+    maxItems: 4
+
+  clock-names:
+    minItems: 1
+    maxItems: 4
 
   resets:
     minItems: 1
@@ -47,17 +58,22 @@ properties:
   interrupts:
     maxItems: 1
 
+  phys:
+    minItems: 1
+    maxItems: 3
+
   phy-names:
     items:
       - const: usb2-phy0 # USB2 PHY0 if USBHOST_A port is used
       - const: usb2-phy1 # USB2 PHY1 if USBOTG_B port is used
       - const: usb3-phy0 # USB3 PHY if USB3_0 is used
 
-  phys:
-    minItems: 1
-    maxItems: 3
-
-  dr_mode: true
+  dr_mode:
+    description: usb mode for G12A
+    enum:
+      - host
+      - peripheral
+      - otg
 
   power-domains:
     maxItems: 1
@@ -80,9 +96,9 @@ required:
   - resets
   - reg
   - interrupts
-  - phy-names
   - phys
   - dr_mode
+  - phy-names
 
 examples:
   - |
@@ -124,4 +140,33 @@ examples:
               snps,quirk-frame-length-adjustment;
           };
     };
+  - |
+    a1_usb: usb@ffe09000 {
+          status = "okay";
+          compatible = "amlogic,meson-a1-usb-ctrl";
+          reg = <0 0xffe09000 0x0 0xa0>;
+          #address-cells = <1>;
+          #size-cells = <1>;
+          ranges;
 
+          clocks = <&clkc_periphs 36>,
+                   <&clkc_periphs 85>,
+                   <&clkc_periphs 2>,
+                   <&clkc_periphs 3>;
+          clock-names = "usb_ctrl", "usb_bus", "xtal_usb_phy",
+                        "xtal_usb_ctrl";
+
+          resets = <&reset 36>;
+
+          phys = <&usb2_phy1>;
+          phy-names = "usb2-phy1";
+
+          a1_dwc3: usb@ff400000 {
+                  compatible = "snps,dwc3";
+                  reg = <0xff400000 0x100000>;
+                  interrupts = <0 90 4>;
+                  dr_mode = "host";
+                  snps,dis_u2_susphy_quirk;
+                  snps,quirk-frame-length-adjustment = <0x20>;
+          };
+    };
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
