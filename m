Return-Path: <SRS0=EYbA=WB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF800C0650F
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 12:06:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A28EA206A2
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 12:06:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l9qd5dGD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lMM15MLz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A28EA206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LxDM8MuuGN8/Oadwy+nMWPjHwySIwPJXy20rVmoz3Gk=; b=l9qd5dGDAP0fFn
	cz4XNIFXStCh7G/Mriih1dCpX9wC7fRUd6gB1raTUHNE4amNsMKiJcRq82wNwqsjLEbj1xalKC0AW
	/Xi5Q2sSskS4yzxgTmeSk/VWt6ug6WAhMngA1abTqueYX0NT+7SQgxDgzxpRggdw6RF14HCRYGH2a
	b4pn67+Gmm/wzYLCQNVIH6mWUAQzzprwYrzzA9uO2ohAfeDMj6fVVw5ZqRTNHsHe/4OviHX8l9wPk
	1ExEa3sWUSNwVrUp+Ggswkm3pV/pGDMKWt014r637c1sC+A2lBRzkiOTT3kCWJ+8OCYhEk/KSesYl
	vM6UIqKXkmQMNCshTRrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hubky-0007Y0-Ma; Mon, 05 Aug 2019 12:06:28 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hubiC-0003EN-0d
 for linux-amlogic@lists.infradead.org; Mon, 05 Aug 2019 12:03:39 +0000
Received: by mail-wr1-x42e.google.com with SMTP id p17so84137362wrf.11
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Aug 2019 05:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b1XGdy2nJKzucwuRIzJ0TOC6ZhQODYjSeQdAwBFlneI=;
 b=lMM15MLzt6Hai8wnmTDzO/Cfv5iPTpuo1yNv7j7DLI+TssldZYUeRmJezSQ+6uT8Wf
 VplNweHvsify8msqINJ+Fk9sA1Y2mWp/lMmskb1wwhVWXsAA2RBACeC0R3XMPA4kClew
 C1KHlPK9YQ5K23SK5jCja0MhP2vbXlUaZVZotGnO95wuLZPM62pCuwjOyRPI44FnhQIj
 3AZtcO6cp2YlYulIWZ4VoLMCzzfki2JER2DA9h1RRBW4Z6VlSCxogQgKRPktzATt3opK
 Zf4fhOKJGGS85xXEIPE1z2xGWMEcSWdaMw9vHwGFaYEQ5t/sq1wTdI0isAPFyXRgl7pq
 bDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b1XGdy2nJKzucwuRIzJ0TOC6ZhQODYjSeQdAwBFlneI=;
 b=SvSqsfEt73tclbTaKJuJUT0gHDzY4GRc/u4uuPbBuVyn7/nBP6KbMEtA7Lh6s0/2x+
 Hy6aC9kx7F+YV+OYX7AejUgrAGuh+C21psV03NnXvRXFDty1x5NQ37AWmfAL/Ku4yVma
 P3t4KFkJzIbRix05YI8qBZ9kinZx/x7Loe8tNlrjjTf2g/HZzgloDIkopUSlRj56jKkp
 gKqfJs9JsASbGcGI+bszUAB8T3lLEFceuHNIjFZReHZ074GhWAIQH07XIgfuqCPHM6tf
 xtgXxsISBTIMLmKlv4xW9rtpUM5WRLCOkb2g1yz6GlznpeiJKB5iKHuJPU2rH1eJiMnx
 o9WA==
X-Gm-Message-State: APjAAAWOGjFMJoVn6MC70DvYlkx8wuqmoFABca1l80Q6YCxnieqCXTxm
 AVgpXszY8e8HSJgbGrCcr6BwYA==
X-Google-Smtp-Source: APXvYqz55EPEsBCPC/Ok0ShHcjO9diNKpV56u+ZyINITUx4vht63l1eGjPviZ0nVTTmm06A8XwUr7Q==
X-Received: by 2002:adf:f3c1:: with SMTP id g1mr25866889wrp.203.1565006610658; 
 Mon, 05 Aug 2019 05:03:30 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x6sm88683668wrt.63.2019.08.05.05.03.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 05:03:30 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [RFCv2 7/9] dt-bindings: phy: meson-g12a-usb3-pcie-phy: convert to
 yaml
Date: Mon,  5 Aug 2019 14:03:18 +0200
Message-Id: <20190805120320.32282-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805120320.32282-1-narmstrong@baylibre.com>
References: <20190805120320.32282-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_050336_074565_97267E44 
X-CRM114-Status: GOOD (  12.90  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 kishon@ti.com, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Now that we have the DT validation in place, let's convert the device tree
bindings for the Amlogic G12A USB3 + PCIE Combo PHY over to a YAML schemas.

While the original phy bindings specifies phy-supply as required,
the examples and implementations makes it optional, thus phy-supply
is not present in the properties and required lists.

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
