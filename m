Return-Path: <SRS0=AMJk=PI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03FF6C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Oct 2021 19:51:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAA71611C7
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Oct 2021 19:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BAA71611C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tozVrZxyBuygtlIZPD15UH/ZQAIUI8bowzHUkocMm4Y=; b=axg5fX5PS+Konz
	walFyf2RTJPUc2Wmq2P9SLswOMCCAOWDlOzZ3XvHYD8ZOOgTspeJjHXAQtvcyK8A6WpRLmgypIR8h
	hXMK7CuYXmcdK9ZjgM2cUTWyrSTB2vrYDMySqAWl7uiNprxcdrBkfF/Zb+QD3k9MWQp0zt5cqCt4L
	PEZF/egJT1YxzXcOJNPe6zdWMiqvcRoSca4d6BYcjVB/9sSGTDoBxM9T9RcwSYSGpHVaJmxeRSgOM
	LOEjmOKFDTVI/83tUFyvGpiyAdFJCGd3d7wcetLlg6R+Y7eefyrCRb7vW7cEGvz154N3c5kicM+b2
	iWV41aS/qmbLFT6fKAig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdHcl-005hZC-FL; Wed, 20 Oct 2021 19:51:43 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdHcY-005hVR-KB; Wed, 20 Oct 2021 19:51:32 +0000
Received: by mail-wr1-x42d.google.com with SMTP id i12so22554wrb.7;
 Wed, 20 Oct 2021 12:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rEPbVntSVNxrbhdJwi/7dPL1juvL8UMRg34+Vcw02A0=;
 b=D/944o960+AH1AnjpNsW45QQHAF9MVw6BSZrk4pfxU2gI9dBiY5WPhpDd6+ywu8KrU
 wnuGJ2D+ozGuRZhF3VDb0scNqPzShxH3/1O/5BVmMKqm6qv4nUWpjRaH6hV8HNEZ8dCE
 9w15KoJC3/s/LYdU/hAIWgcOHA3u51n1HWkY5iZjKspGIMPVEiwU9SIhfKAx+9R86O6x
 433Msh5C8uo8lUTItNR5Brif130MPX1rOpYAzGM7iGoOdt+cFVeo0/bA3PvjJE3Gq2Qb
 wGLpn9R1fj3462kGLRRjwZ+nsKI/c9o4d5JnWDaNhVWPZJtgqGwvWdAhMEizAPjMCMOE
 gqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rEPbVntSVNxrbhdJwi/7dPL1juvL8UMRg34+Vcw02A0=;
 b=vXP9yASpZ4QxfSL9u2VMtDoqY0mvngrUOol+SlngJSlPJHAKGdk1j3HdHtlMNLagvW
 mYUx6YVfhow4PL8t2LjKG8NRkF2PaFg2cNMUASDrqVVVz5Hmr8olqZyEBiKJtWqMMwJA
 EnCYqcyY97mtNg+Qx/1DbirOnm+3IZsvYH1O5Laoz3lPtnZa9FfXyZqya6QxkzdCrA18
 0lXV8VOk4gEBLQ64pMI0KwIMIfHHgSdLNtH1nTKDjrYcZN7jOc66zzuE9IisJUtMIm8G
 5FjD8s5ooN090OYOHWVy9pzeTyRuXb8uuT/t8haJD1KiwRAzJHzWKbhX1X/sJNtSwffd
 knXg==
X-Gm-Message-State: AOAM5327q9jR+uFOwzVwdw1cu8y7yLdoDsMxzcaZDvZw6AVOsSJooy/9
 6QwmGCsS6qzVM7R7qpOII8NqvOxZIHY=
X-Google-Smtp-Source: ABdhPJyrDaJa0UTdawpxf/nBYOHmNqDCNEkIFFaONFmF21uOpkE6Y/wVQ3QwqYaFe/BIxGKf1hNttw==
X-Received: by 2002:a5d:47c3:: with SMTP id o3mr1581002wrc.25.1634759488962;
 Wed, 20 Oct 2021 12:51:28 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-b9f5-df00-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:b9f5:df00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id f3sm2741310wml.11.2021.10.20.12.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 12:51:28 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org, vkoul@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 robh+dt@kernel.org, kishon@ti.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 1/2] dt-bindings: phy: Add the Amlogic Meson8 HDMI TX PHY
 bindings
Date: Wed, 20 Oct 2021 21:51:06 +0200
Message-Id: <20211020195107.1564533-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211020195107.1564533-1-martin.blumenstingl@googlemail.com>
References: <20211020195107.1564533-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_125130_685206_8C31CA61 
X-CRM114-Status: GOOD (  14.04  )
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

Amlogic Meson8, Meson8b and Meson8m2 all include an identical (or at
least very similar) HDMI TX PHY. The PHY registers are part of the HHI
register area.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../phy/amlogic,meson8-hdmi-tx-phy.yaml       | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson8-hdmi-tx-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson8-hdmi-tx-phy.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson8-hdmi-tx-phy.yaml
new file mode 100644
index 000000000000..1f085cdd1c85
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/amlogic,meson8-hdmi-tx-phy.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/amlogic,meson8-hdmi-tx-phy.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson8, Meson8b and Meson8m2 HDMI TX PHY
+
+maintainers:
+  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+
+description: |+
+  The HDMI TX PHY node should be the child of a syscon node with the
+  required property:
+
+  compatible = "amlogic,meson-hhi-sysctrl", "simple-mfd", "syscon"
+
+  Refer to the bindings described in
+  Documentation/devicetree/bindings/mfd/syscon.yaml
+
+properties:
+  $nodename:
+    pattern: "^hdmi-phy@[0-9a-f]+$"
+
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,meson8b-hdmi-tx-phy
+              - amlogic,meson8m2-hdmi-tx-phy
+          - const: amlogic,meson8-hdmi-tx-phy
+      - const: amlogic,meson8-hdmi-tx-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    description:
+      HDMI TMDS clock
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    hdmi-phy@3a0 {
+      compatible = "amlogic,meson8-hdmi-tx-phy";
+      reg = <0x3a0 0xc>;
+      clocks = <&tmds_clock>;
+      #phy-cells = <0>;
+    };
+  - |
+    hdmi-phy@3a0 {
+      compatible = "amlogic,meson8b-hdmi-tx-phy", "amlogic,meson8-hdmi-tx-phy";
+      reg = <0x3a0 0xc>;
+      clocks = <&tmds_clock>;
+      #phy-cells = <0>;
+    };
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
