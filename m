Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD268C43334
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jun 2022 13:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q4MwqM3ctZ2UHmDYI6fZ+C1J4e1KSKUTk4dWhbT5B7c=; b=FsicUtB6a8E+uJ
	OfDSqeA5hL308Fkej48TFXQfZWiY/hiTULgRbidsXk42WjgkzpxmKZ6BIjP55UaUa/gOPsBjg9h2p
	9osU6nsuBcH+1ss5Kuv/y3ckiqV1SuB4SryQq+1r3fT4RAgNKVZ+kNWnGF2E6a3Sa9d7tp9czLU6n
	iW/j04pg99m3OlB/BJtGU2u8BXhIRf6XqMieIgL1vkRgtxPiJeOXwCAdfiatf64ZT1OBv7IxFLeFt
	+UwV2/SJxkbbtqcmyvFjgHMG6LnyJqlODAAtrSrMhj4QOKw8zy9Ns/XDjZEyHjlhqrL5sQJujxGL6
	izhB41hd8MWSvScg6WqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1phv-002UkD-3J; Thu, 16 Jun 2022 13:38:47 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1phX-002UbM-Si
	for linux-amlogic@lists.infradead.org; Thu, 16 Jun 2022 13:38:26 +0000
Received: by mail-wm1-x32c.google.com with SMTP id i17-20020a7bc951000000b0039c4760ec3fso3473580wml.0
        for <linux-amlogic@lists.infradead.org>; Thu, 16 Jun 2022 06:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PxD5eSuoVNmuy9uK+8ImVic/9oJqQQRTmLdQoVDSq7Y=;
        b=KUiIidYubKIQhmnPtrgcqWcZFytwUm9hJxPJTs/iRO0+H51/6/n1Xd/98LXtsAUToW
         DSycfm5OK+VF5Aw54NXyUhKkia6/lS63d8eVYhUiqo8opHX3+jl7rAM/1NYDeJA2Apb6
         vP3T6unqET61xpxyXVK6Wn11V9+x+kRab3KMpVF4PSz5cANkm5TBzLGt9QHcyTU9PZkH
         HIS0CBP/4eOD5uv6gBTn6kDHVMXBFeCsgVaIxAtndx9CBM2vjwI7L3rt59SRZXILAKlW
         54oA0+OZ6itH/HyVQ2d3DxcXnIrj0VxfSPMfLnN822oL790a8DpzHIOB0TJhHspehk5D
         4B1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PxD5eSuoVNmuy9uK+8ImVic/9oJqQQRTmLdQoVDSq7Y=;
        b=nQBzwSTN2o4yCQkOrl3PaEPyaiar5TwScc45L4YtPgRGRSfuPp4tqEhX3Te57iLSv7
         Pn8plWLJvTtRyJjxKHbVvcE/ZP9VG3roITaHk34QR5szJF2afx9axBvY+9uauD5urNa4
         93BIjoG9Ly2UlD6D7fSUvbU2g0MQ5mpW3sir/0CYdVyb+rzuu6C+QY3A1tRcbjRz0Xog
         gLR2jgyEeBUgAYtCB/GE/3yGp+PVMvKPGqmgTFLIH1Z0/iHIBM/OfSZ5dMdSrthisDaQ
         zoEDkxt5dNL3g1h+JZRPNZ/cvNtZLajEji8fNJCVVcKNOxtdfr2TxUqDT+4j1qjZqW7Z
         aUgA==
X-Gm-Message-State: AJIora+79ZTexY45SKafve+pjqchr0QTcjrty/JqCm1pEqdsfX8cG//w
	WG+WPRHvd30o1Qyupew+64CtKg==
X-Google-Smtp-Source: AGRyM1tWwdUCxZ5lku8fS/JAqMfPYZ1pVuLz3qlRsQKA25sJXVvPekovAHC6E/LUsIRHdr7iSUur7w==
X-Received: by 2002:a7b:c1d1:0:b0:39c:605c:1530 with SMTP id a17-20020a7bc1d1000000b0039c605c1530mr5150562wmj.80.1655386699992;
        Thu, 16 Jun 2022 06:38:19 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:34f:da80:9c48:d9f8:5c33:3dd5])
        by smtp.gmail.com with ESMTPSA id v12-20020a5d678c000000b0020c5253d90asm1935423wru.86.2022.06.16.06.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 06:38:19 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com,
	vkoul@kernel.org,
	devicetree@vger.kernel.org
Cc: linux-phy@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v4 1/2] dt-bindings: phy: add Amlogic G12A Analog MIPI D-PHY bindings
Date: Thu, 16 Jun 2022 15:38:10 +0200
Message-Id: <20220616133811.1674777-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220616133811.1674777-1-narmstrong@baylibre.com>
References: <20220616133811.1674777-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_063823_954750_85479714 
X-CRM114-Status: GOOD (  11.61  )
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

The Amlogic G12A SoCs embeds an Analog MIPI D-PHY to communicate with DSI
panels, this adds the bindings.

This Analog D-PHY works with a separate Digital MIPI D-PHY.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../phy/amlogic,g12a-mipi-dphy-analog.yaml    | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml

diff --git a/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml b/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
new file mode 100644
index 000000000000..7aa0c05d6ce4
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/amlogic,g12a-mipi-dphy-analog.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic G12A MIPI analog PHY
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+properties:
+  compatible:
+    const: amlogic,g12a-mipi-dphy-analog
+
+  "#phy-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@0 {
+          compatible = "amlogic,g12a-mipi-dphy-analog";
+          reg = <0x0 0xc>;
+          #phy-cells = <0>;
+    };
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
