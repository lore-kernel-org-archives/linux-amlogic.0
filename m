Return-Path: <SRS0=NajJ=V5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B73BC19759
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Aug 2019 13:58:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47213214DA
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Aug 2019 13:58:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FRI6fGrh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="K1oSscOA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47213214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1NVxKnfGt3cwFjqYNfUBGAduGPjrQloIWrJUsqLdv4E=; b=FRI6fGrh5k5NTY
	GmnjAIVYMDfBggzAFN3Uq3ouA71Tsa3eiLyZ8uwgOJo2yP4U3sdsYYW7HS0AeVjxmMcwhQh6mPzrO
	DP2Pz3K3pe1CpmabBvqJV0dV6ihi+V619Eqf8+NJ+Ce+HFhh1fJUuhE8FksktshlGLUSnsO6U8wMD
	yI74C3y8N00i+QeaQpkul74egNwOgO146SMuCErtnpGN7IURq+JZg0SbztiSzlLnFVNzAp8dQe4Oq
	mx1RqWi624PImwOe8tJWije20yLZaBHb6dOhrffJ781F6TIW3mBS8iQX99BShcWm17FKDPe5xLkLu
	FLjNGtritwmnLUog7YlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htBbW-0003Lt-PP; Thu, 01 Aug 2019 13:58:50 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htBZd-000124-Vg
 for linux-amlogic@lists.infradead.org; Thu, 01 Aug 2019 13:56:59 +0000
Received: by mail-wm1-x330.google.com with SMTP id l2so63261841wmg.0
 for <linux-amlogic@lists.infradead.org>; Thu, 01 Aug 2019 06:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KNQ5CzwHqtz8MxgZ4m80rpvWQ1Kz5Bh7KhQot/XK4oE=;
 b=K1oSscOAfn+eRgfQAEHDAeL/T+m+jbZlSnlTicTve9JHVOxG5UUAkmhLJg0kFwnEaB
 VJgZxFvEZjB6dCh5Y4+/hNIUKbm4i86TaxQwy04CYAfqWDJamfkNlzKSpkqN1LZVnYCC
 xRw6W/sftfI+yR+CC8i9pPnEMMsj6qmiHoiPrvv38AZac6cvUypzasREe1M4JpunjQqn
 UvD4BeoQKlk6jo3uybh7TzeqR5Yh4RfMnQZsvc9odKdiA65LeAn0Gm4qMGy+jgAol7wj
 OuGySje8D72fw9kL5xLck3wYhIxQTQR0f3Z37KzOFE3cuM6k01AflIZKC30QhfLg7V4D
 l+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KNQ5CzwHqtz8MxgZ4m80rpvWQ1Kz5Bh7KhQot/XK4oE=;
 b=jSpA6XuTFC8BwNnjGdPxdCW6IM3g/iwoURxzBz1s8PWu6B2D7RzEyqjc9x4NDe3cqT
 pq34FvNGuYmjOLZcSFuitcN3VjrFr+9ZLsNlsr7G/bXivGC0yAC1ibHDmn4H6oMiMkup
 h5Xx0HSRaj/WZrLk+LtbjWWBf44LshLSagS4XMCHBqTmZ8Za5Mvx4h1YLlWThDWLkThH
 ePM09IIUs2nBdx77PXZvz1097B52HP0NH4bD982C6nSFZ87Rq99iAhu8KVreTNJCa1bk
 92JhTvvjKDxpz/OQtJSGZwLVQJnbtBR6AISQZQooJI+Vr1xe6OM4SMn0o7B1xYyEixeV
 3lkQ==
X-Gm-Message-State: APjAAAXAj8L2ogrPRu3PBJldyYFuHFFGIIO725DZJitbf18tRe7tgcU2
 RoplMdcqbZLpjv5ZLKFrpPfczA==
X-Google-Smtp-Source: APXvYqyMiZTJ+Lf2RI7o4c0VYPdQYQnTN9th9RI/J64TenyGDwAZlYOPKzsG2fwe5oL9NNiKYJzYXQ==
X-Received: by 2002:a1c:7606:: with SMTP id r6mr1961223wmc.118.1564667812185; 
 Thu, 01 Aug 2019 06:56:52 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id u6sm69659952wml.9.2019.08.01.06.56.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 06:56:51 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [RFC 6/9] dt-bindings: phy: meson-g12a-usb2-phy: convert to yaml
Date: Thu,  1 Aug 2019 15:56:41 +0200
Message-Id: <20190801135644.12843-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190801135644.12843-1-narmstrong@baylibre.com>
References: <20190801135644.12843-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_065654_024718_2F966FF5 
X-CRM114-Status: GOOD (  12.33  )
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

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/phy/meson-g12a-usb2-phy.txt      | 22 ------
 .../bindings/phy/meson-g12a-usb2-phy.yaml     | 67 +++++++++++++++++++
 2 files changed, 67 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt b/Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt
deleted file mode 100644
index a6ebc3dea159..000000000000
--- a/Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-* Amlogic G12A USB2 PHY binding
-
-Required properties:
-- compatible:	Should be "amlogic,meson-g12a-usb2-phy"
-- reg:		The base address and length of the registers
-- #phys-cells:	must be 0 (see phy-bindings.txt in this directory)
-- clocks:	a phandle to the clock of this PHY
-- clock-names:	must be "xtal"
-- resets:	a phandle to the reset line of this PHY
-- reset-names:	must be "phy"
-- phy-supply:	see phy-bindings.txt in this directory
-
-Example:
-	usb2_phy0: phy@36000 {
-		compatible = "amlogic,g12a-usb2-phy";
-		reg = <0x0 0x36000 0x0 0x2000>;
-		clocks = <&xtal>;
-		clock-names = "xtal";
-		resets = <&reset RESET_USB_PHY21>;
-		reset-names = "phy";
-		#phy-cells = <0>;
-	};
diff --git a/Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.yaml
new file mode 100644
index 000000000000..4cd5ba97d469
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/meson-g12a-usb2-phy.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic G12A USB2 PHY
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-g12a-usb2-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      A phandle to the clock of this PHY
+
+  clock-names:
+    items:
+      - const: xtal
+
+  resets:
+    maxItems: 1
+    description:
+      A phandle to the reset line of this PHY
+
+  reset-names:
+    items:
+      - const: phy
+
+  "#phy-cells":
+    const: 0
+
+  phy-supply:
+     maxItems: 1
+     description:
+       Phandle to a regulator that provides power to the PHY. This
+       regulator will be managed during the PHY power on/off sequence.
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
+    phy@36000 {
+          compatible = "amlogic,meson-g12a-usb2-phy";
+          reg = <0x36000 0x2000>;
+          clocks = <&xtal>;
+          clock-names = "xtal";
+          resets = <&phy_reset>;
+          reset-names = "phy";
+          #phy-cells = <0>;
+    };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
