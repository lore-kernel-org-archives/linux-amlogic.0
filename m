Return-Path: <SRS0=t7Bi=WE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324CAC433FF
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 08:54:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02CE22173E
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 08:54:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J2U5qLoQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OhK5h7Ef"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02CE22173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4myGi9GslqcXidVTe8YtrX0VhiLwQkp4s/I/SsNcuhE=; b=J2U5qLoQGXGqQ2
	KvkrN9M+vvX3p5Z28VXwJ5fyXEVdq06ulZQz5Zi+rmIF/taI2Od4CwdNVvTmZzFB0bGmG3Z73pK54
	FyDU1WjXZGTg0Zszg69JpMx+d1Vsvm1VfkBEUUVRereRBskjBSAXiNS9iwNbsoVkV2uw4wwna443Z
	7lFlM3imvkOEmIVVFCUS9MNLZFMxej4gHXG8PiMUOVXt13HhuqVCx/iIIfgUOYh4vYQN0fLyAtmGh
	639vdpoKH8adFi4U9YvfR23n37A/Yvxq3rW4Co88KwkDjmeU62LcQuI302BtvsqIZL2WzdCR77vZg
	CUzvGa8mpY6SJ9UaTCbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hveBT-0002bO-2T; Thu, 08 Aug 2019 08:54:07 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hve9E-0000ct-S1
 for linux-amlogic@lists.infradead.org; Thu, 08 Aug 2019 08:51:56 +0000
Received: by mail-wm1-x341.google.com with SMTP id v19so1567323wmj.5
 for <linux-amlogic@lists.infradead.org>; Thu, 08 Aug 2019 01:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BSF3XLc6m+fNNwkeu0fawdiQxaFIsSlOJPuDJiDiOV8=;
 b=OhK5h7EfN87X0w/7WpQDtuKn9+DQY7zxbDBj1yn1xdvmtUwp+4fC7x93Rkl9Adzl2+
 e56a1A5RVsnoimQ5nKOh47sRMnZ5ja7JvCMuoi7OwEUkwylSpzEGjBo7+qvC7GnKC5yv
 7IoPLQM53IOcX+XixB3qUbdyB3he6v4eI6pDJpX0+JtUwk8MfGL0sIjldgoWKY0cNogf
 4RxyQCNm9OMzNC0HHyRvaYvaL06wEn86RqzGXgpKqAXKq1LQNnLoMfgeWRch+aYY+Ib+
 LHNYGAUZ9J70wmuGNT7cxXZn3kzJyGiPsODT6q7en290+MqlWSY3f5aCnZKBYg/bEuLQ
 uyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BSF3XLc6m+fNNwkeu0fawdiQxaFIsSlOJPuDJiDiOV8=;
 b=eTYfl2g3OCTCtXu9DqQfTBXb0OZYS/5F9DO22ezALMDuzEZJBQ3Ze08HNeztA/2wm+
 FvvjTWx2ZfKznpGBzplBX3Ol24AXdPZaPo0gwmrx3NWIkbYt1zno+1Uim47doObQJCOm
 CHq0epQpLBrbVw8BFYDH1J0hrpLeJelIi0pcBeP3maUcHKEZFiJVLPPb9QVu77VplebV
 6jF3EJPDVhxQqFjaDRBtecdb19ZD6Lo9Qq5VSSmJdGXkELNDU9V4wWtvzixvyAzv+XLg
 0BfCwWub8ZtJg1yGudxjNvDeaaVcEkhpzw1GecMP5rCqHamDt4bsqfFoNJ+E3E/sIakU
 uF3Q==
X-Gm-Message-State: APjAAAUsubCcnp8gA0Bn7++ZEtS/3DWpvuZ0egDJ66FTDFoipY4ICWsM
 S/TuIIwD2Gz8WWatdIF3sty2lA==
X-Google-Smtp-Source: APXvYqzZWcSTwCu8fiydxs/0CWiO8jfh1vTqLS1cwh7CWWpxjqTaMfQnU3P963/3PU//Y5/bhlWNDQ==
X-Received: by 2002:a1c:cb01:: with SMTP id b1mr3093834wmg.69.1565254307408;
 Thu, 08 Aug 2019 01:51:47 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i66sm3360031wmi.11.2019.08.08.01.51.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 01:51:46 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [PATCH 7/9] dt-bindings: phy: meson-g12a-usb3-pcie-phy: convert to
 yaml
Date: Thu,  8 Aug 2019 10:51:37 +0200
Message-Id: <20190808085139.21438-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190808085139.21438-1-narmstrong@baylibre.com>
References: <20190808085139.21438-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190808_015148_921809_B40FF2FB 
X-CRM114-Status: GOOD (  13.04  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, kishon@ti.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Now that we have the DT validation in place, let's convert the device tree
bindings for the Amlogic G12A USB3 + PCIE Combo PHY over to a YAML schemas.

While the original phy bindings specifies phy-supply as required,
the examples and implementations makes it optional, thus phy-supply
is not present in the properties and required lists.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../phy/amlogic,meson-g12a-usb3-pcie-phy.yaml | 57 +++++++++++++++++++
 .../bindings/phy/meson-g12a-usb3-pcie-phy.txt | 22 -------
 2 files changed, 57 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb3-pcie-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb3-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb3-pcie-phy.yaml
new file mode 100644
index 000000000000..346f9c35427c
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb3-pcie-phy.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/amlogic,meson-g12a-usb3-pcie-phy.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic G12A USB3 + PCIE Combo PHY
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-g12a-usb3-pcie-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: ref_clk
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: phy
+
+  "#phy-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - "#phy-cells"
+
+examples:
+  - |
+    phy@46000 {
+          compatible = "amlogic,meson-g12a-usb3-pcie-phy";
+          reg = <0x46000 0x2000>;
+          clocks = <&ref_clk>;
+          clock-names = "ref_clk";
+          resets = <&phy_reset>;
+          reset-names = "phy";
+          #phy-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt b/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
deleted file mode 100644
index 7cfc17e2df31..000000000000
--- a/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-* Amlogic G12A USB3 + PCIE Combo PHY binding
-
-Required properties:
-- compatible:	Should be "amlogic,meson-g12a-usb3-pcie-phy"
-- #phys-cells:	must be 1. The cell number is used to select the phy mode
-  as defined in <dt-bindings/phy/phy.h> between PHY_TYPE_USB3 and PHY_TYPE_PCIE
-- reg:		The base address and length of the registers
-- clocks:	a phandle to the 100MHz reference clock of this PHY
-- clock-names:	must be "ref_clk"
-- resets:	phandle to the reset lines for the PHY control
-- reset-names:	must be "phy"
-
-Example:
-	usb3_pcie_phy: phy@46000 {
-		compatible = "amlogic,g12a-usb3-pcie-phy";
-		reg = <0x0 0x46000 0x0 0x2000>;
-		clocks = <&clkc CLKID_PCIE_PLL>;
-		clock-names = "ref_clk";
-		resets = <&reset RESET_PCIE_PHY>;
-		reset-names = "phy";
-		#phy-cells = <1>;
-	};
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
