Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A585C7EE23
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 May 2023 08:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kZFxvhW3MsSMz+W4OybDYQFroo1k5Qa5p/Lj7MMIhh0=; b=Sk074f8x1HM1p3
	LezLqb8pMpohxmu7UJHEv6ECnt8cGOiClqEXseobgu9VpZqcU4KhCLfoESL8YMbRAN/3hsUmzE9Hg
	2l81kU1YQz9zfkEGbkGC8OCoVk46rYi9NJlcp6tukPNdlygGpXtC4peCRexv/5Ous8zHUYWGdAK1N
	pSY7huJRGXba9pG8SBx/JyYCOeQyGaCb1uayaddVLJ8dQQE7hRFBOnEY3jcOTTOh+fEoQt9VHqXCk
	PdQRkFTcCtdSzMQ9omSon8MI+ypjpoBop2ddHp8z9LnbntdoRvsAfkO+hygSt3THY0Tl0TZkl7C8Y
	SwvEaolmvAV1+nHf3oNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uty-00CyoQ-1i;
	Tue, 30 May 2023 08:40:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uts-00CykB-0s
	for linux-amlogic@bombadil.infradead.org;
	Tue, 30 May 2023 08:40:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ILwpKSS26s6qYwQiA3AWhdCLAbEChopbtACgZFh2DVA=; b=bejhIB0aIbnNq1GxAn7SLGZyAR
	FVssSX/P8CMCMpG4RlDSaCqTNsk083P9VlUaKU8iWuMeseDiOuu2zAkWyHG0Y9QswPW6LdRNPIRgt
	3ZAok8zQniLvCH2FPp693r+cBhzTe3QN1ePxp2RETjLLVnmWV9z7BN02eANaPpBxAqkDkamSmKTYB
	Zmek+J/XVspYy66DcOqMG6vKquzg5CjKH1B1ODMVxexpVGm6a4+uuzo5446h3aLVT3/c49v0fmlIY
	e3kusLvjA7GbXxeq9Nhw8aH5vDJB5iQ5pyMiRzu3F0IGq/IhyEJ0OE7ofu4vBURBbkhZf3UWiXWJB
	FTxavGbg==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tvz-00Dbrx-1n
	for linux-amlogic@lists.infradead.org;
	Tue, 30 May 2023 07:38:37 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3090d3e9c92so3969514f8f.2
        for <linux-amlogic@lists.infradead.org>; Tue, 30 May 2023 00:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685432300; x=1688024300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILwpKSS26s6qYwQiA3AWhdCLAbEChopbtACgZFh2DVA=;
        b=FPO26JeUMctWCe0KGGcKVKj+KIao1BZ/67tYsHHpowHi9fv+F4pUBWamQGILHF+nd7
         m1YxLwzfR1E/efXHlnMvBhisfEgTjiAblOiWVgVDedzrL2ryifpZxZw8+qplOUocrJMJ
         aypdeUkUgEhBFe6SJ8ctGnt1l7cu1L7WlHX2QqvVq7+72CrLtFJ+0B/sHwJiwJTC3fbr
         sja6/t2+UHk+Jc/wLgezVoYGAhvpAflqCnXyWI09LjsZ+mhmI51maWlAetEtzJxJpRwH
         7boHftn7ty0ZHShlsw/51eKbEVHh2rbpc/WGz126huaAOQyTX3lui+U/c9xcSkbvKtwX
         NWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685432300; x=1688024300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILwpKSS26s6qYwQiA3AWhdCLAbEChopbtACgZFh2DVA=;
        b=Bd8KzOO5PfnGjh1DwhgR0qFbyKk5gbe3lYG2PLiCwk+MgRgkIEwRQ3S+nmiurK8TNd
         ZroMhmUfoqEJsW5+8y1fQ6mwkux1+3uzurhvAqREHMYgv/F4pKtFx/Jn6U0Q8b6n1Cqd
         LiEwY/nxVGGyULqRlehjwxO6okXGJWrQs6lRe4GqxrbOLCAoQaDnAjkwfl7k71N9OMGl
         zXcoKmpBHuvlot797SR8o7IJM9kNvcuItfRAMK4W7f220Jm6PSM3kGm7wd20YIN6ddA3
         4u73LC8uaM1qSpjl0cHFH8gbWXub88pmM1pCodYfosplXKRToX4cP+2IBCIy/AWy8u30
         YcjQ==
X-Gm-Message-State: AC+VfDylHKO3wXzIKWVNTtyZoZ4bUq7eltL8djEBF1SDq4689ngnCS8p
	vAGwmGmRHq3R74dt/nDc9knzYQ==
X-Google-Smtp-Source: ACHHUZ7oADz4DYgBBnbiJph7j9eViF2f4A9LlBRMt5hlgYXGjtHYYwBmrS6WhVWBm9Uj/beTsRQRHA==
X-Received: by 2002:a05:6000:1003:b0:2fb:1d3a:93ff with SMTP id a3-20020a056000100300b002fb1d3a93ffmr736528wrx.61.1685432300469;
        Tue, 30 May 2023 00:38:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m4-20020a5d4a04000000b003079c402762sm2312013wrq.19.2023.05.30.00.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 00:38:20 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 30 May 2023 09:38:07 +0200
Subject: [PATCH v5 06/17] dt-bindings: display: add Amlogic MIPI DSI Host
 Controller bindings
MIME-Version: 1.0
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-6-56eb7a4d5b8e@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: "Lukas F. Hartmann" <lukas@mntre.com>, 
 Nicolas Belin <nbelin@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3536;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=DcR1nE4ZMJpkpX2oEe3RQlDvB5okZPNaS9Js/yOJnic=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkdaffq+G+cxVoOQbtSrl/SEHGE6MG1300kjLhFz94
 et6gskiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZHWn3wAKCRB33NvayMhJ0d9GEA
 CkuB537HbJHqDkt4SUmKi6+cTkKmuRCZVQl4HXF66H6GNlELIUpDxzLFYKRZ57RzQ7eisjoen0kd67
 oIKnVvJZRpmJHPRlvzo+Zq8POWmuEjskvDVNwF5LOcYu1O2U6EN6Dk/VhSKJMPkRmy5m8z4H0REPdb
 6BSj6AgKzG0CQIiGnQs2NcSY0lUwbfMntYbpe3CKDvmMVPjY2CTI+4Vydg9lo+/x0AFH22pP1s5fTp
 6yq4XEPsF6l7Zy1ooGJt0LGuvPA1WN+dNBmzXYixyNI1ykkQQ2nxmtyngiHRUdauQe/KSN7FRJ6mWR
 aO7CLt6djQM0Fy5eOwefV9ES0Fl5W6xv/htXVF7UCTqxs5Yl6n2abXMeA2bEAleR2016wMgbKEpdK0
 8GrtW4fL2lrXZR6dPvTtaYsLRIhwwLccVan5v64qXCiQdeq2WhQRhiyrhwAY832KRIF/NkJooskNfy
 IVAF+/HV3P7TrFFHCo2FzIilgfPfEfQNhL7wBeoZMH8MYV5JGi/xRVBUMs+C8rfYPAuWXUlz4U7n3B
 5mK9qt2JiOR31nFMGW65MlRQDyZm4F9Cu346AzoDHWQ2mndld0G6q4NmfoU0nva/+8P1sasel2Eu3M
 PpDTuHBNwKCwTgqyQ1s3vC6hBIM20FKFUAIubZt5cde3q0ZVgNRAZvXUkyTw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_083829_274504_C36B33BB 
X-CRM114-Status: GOOD (  12.93  )
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

The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI
transceiver (ver 1.21a) with a custom glue managing the IP resets,
clock and data inputs similar to the DW-HDMI Glue on the same
Amlogic SoC families.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../display/amlogic,meson-g12a-dw-mipi-dsi.yaml    | 118 +++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-g12a-dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-g12a-dw-mipi-dsi.yaml
new file mode 100644
index 000000000000..a3428f012005
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-g12a-dw-mipi-dsi.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2020 BayLibre, SAS
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/amlogic,meson-g12a-dw-mipi-dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic specific extensions to the Synopsys Designware MIPI DSI Host Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description: |
+  The Amlogic Meson Synopsys Designware Integration is composed of
+  - A Synopsys DesignWare MIPI DSI Host Controller IP
+  - A TOP control block controlling the Clocks & Resets of the IP
+
+allOf:
+  - $ref: dsi-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-g12a-dw-mipi-dsi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 3
+    maxItems: 4
+
+  clock-names:
+    minItems: 3
+    items:
+      - const: pclk
+      - const: bit
+      - const: px
+      - const: meas
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: top
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    items:
+      - const: dphy
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input node to receive pixel data.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DSI output node to panel.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - phys
+  - phy-names
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    dsi@6000 {
+          compatible = "amlogic,meson-g12a-dw-mipi-dsi";
+          reg = <0x6000 0x400>;
+          resets = <&reset_top>;
+          reset-names = "top";
+          clocks = <&clk_pclk>, <&bit_clk>, <&clk_px>;
+          clock-names = "pclk", "bit", "px";
+          phys = <&mipi_dphy>;
+          phy-names = "dphy";
+
+          ports {
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              /* VPU VENC Input */
+              mipi_dsi_venc_port: port@0 {
+                  reg = <0>;
+
+                  mipi_dsi_in: endpoint {
+                       remote-endpoint = <&dpi_out>;
+                  };
+              };
+
+              /* DSI Output */
+              mipi_dsi_panel_port: port@1 {
+                  reg = <1>;
+
+                  mipi_out_panel: endpoint {
+                      remote-endpoint = <&mipi_in_panel>;
+                  };
+              };
+          };
+    };

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
