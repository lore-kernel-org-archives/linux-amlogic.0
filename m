Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF45FC636D6
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Feb 2023 13:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8rAtiKEzJV0ZK2x4LCeOhqEc0//KBiqspovEbryLoiU=; b=4QSKVLn+9Jef5H
	WRc35h3A+F9Gip8ja2vKOgauka55IOBJHXWN5rDmPn2G6xCgnb+AAkTm+PzhGnfKOV7IAxob4awqa
	7skgxlUhtZmnqs+yKQWI9ZiKaPPscbNUIgenQ8CkA4v+d0tduwcewyXLJW0JqSrDAoYq8YbqNHLu3
	CU1+ys1Wtwe7grqZpw0zMTim9YsnSuGc3Ufuf3QJNcqgCS6bd6Ux1uX5gO2DDMvnrT+ESSAfn/+4r
	OG5I+ZtO9V81i3zv3lCuYQetu1pCilIXY6iJyO+8w2CLvjLOljCBSsbqBthCd4bBds30BH7AbDJzX
	15ZJiwBAmCNDwZ6KysIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ7Ea-001o22-UB; Thu, 09 Feb 2023 13:45:08 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ7BI-001mL2-NS
	for linux-amlogic@lists.infradead.org; Thu, 09 Feb 2023 13:41:48 +0000
Received: by mail-wm1-x332.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so3899652wma.1
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Feb 2023 05:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjLQ6k0eKtXjQgrCbXriLkzXKMYzM/hKWrkASWGobfc=;
        b=mLWrjSKmdpGUaYDAQZICxLSAs7ZKrnHVZVKfVMia/8ggNhMzJKm1PbELGzCVEp4P6P
         GV5X7yqJYTmZKPs7A1B73sYqHrQtxASN0f4t9HJnf8snZPE52n4bn4AdbaerH68pSmrH
         4430KlCz4zA/sGWku5Dvsq3e5Yq/b/Wkxe419l/FC6AcWdy1HJ31dCU00yftQLoto8qZ
         9729k5Draj6qbMyc+XufEqxgtLatzbXK/Mf2+ggx9OisMzo/xoLmVsxGqSnaoogqIrLl
         pnAGufiAbevEvkTHgCXWgr+pPAjdrO98VbecW+t0wA8kj3rzheusqdkdRI6tkMWHD/zm
         ABXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DjLQ6k0eKtXjQgrCbXriLkzXKMYzM/hKWrkASWGobfc=;
        b=g0gF2QffX7rCCIybMPV9GRNpJMg8Mm1oso0wjCgnuz/LiQtCWd8wTz1pbKKU4VY2IH
         NlQDX120wzKmUZvtpZVh9AJOfZTRNIjnjGo94MSPZxPlWFF1woIhVSJs8vp7BqV0fHuz
         yqZuoO2JX85JKcROlflsZcV/5/peO6OM33RQduoOGe6EqzbH5HpAkN2AXaYGZuOXBuki
         ahZzAPGFMlOLcc+uEHczv3ledufNSpsbA66Imoet69nE8gw1Wjpz8cFAOe3A6B9RPj9I
         ZhopmXBvwrkuDhUFZny+4xCrhVj2Dykz5vL676nu0+OmApewKrIDt3moYDby/2kO/VF7
         AicA==
X-Gm-Message-State: AO0yUKW2mLtjnO6nnQSrVck2kaQNIlLXkniGLYlOsA6HfGo+MVuraaIF
	W7d0Atk6oXlfd0oV252XNhnTgvL9dVOuwtg0H9Y=
X-Google-Smtp-Source: AK7set9vgmNMX33CebLjgnK/NCuxhWo3nDtnIa0yVi6jVPXlG+ofn9yTRMMHHwUsy0duwDeSmANpIQ==
X-Received: by 2002:a05:600c:511e:b0:3df:9858:c038 with SMTP id o30-20020a05600c511e00b003df9858c038mr6116913wms.13.1675950102431;
        Thu, 09 Feb 2023 05:41:42 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id k12-20020a7bc40c000000b003dfe549da4fsm4946991wmi.18.2023.02.09.05.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 05:41:42 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Feb 2023 14:41:39 +0100
Subject: [PATCH 3/6] dt-bindings: soc: amlogic: document System Control
 registers
MIME-Version: 1.0
Message-Id: <20230209-b4-amlogic-bindings-convert-take2-v1-3-c4fe9049def9@linaro.org>
References: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
In-Reply-To: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
To: Alessandro Zummo <a.zummo@towertech.it>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_054144_865868_1B3A00E7 
X-CRM114-Status: GOOD (  11.67  )
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

Document the System Control registers regions found on all Amlogic
SoC families and it's clock, power, pinctrl and phy subnodes.

The regions has various independent registers tied to other
hardware devices, thus the syscon compatible.

Clock controllers and Pinctrl devices are not yet documented, the
definition of those will be updated in a second time.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
new file mode 100644
index 000000000000..672eabd90c09
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson System Control registers
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - amlogic,meson-gx-hhi-sysctrl
+          - amlogic,meson-gx-ao-sysctrl
+          - amlogic,meson-axg-hhi-sysctrl
+          - amlogic,meson-axg-ao-sysctrl
+      - const: simple-mfd
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clock-controller:
+    type: object
+
+  power-controller:
+    $ref: /schemas/power/amlogic,meson-ee-pwrc.yaml
+
+  pinctrl:
+    type: object
+
+  phy:
+    type: object
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-gx-hhi-sysctrl
+            - amlogic,meson-axg-hhi-sysctrl
+    then:
+      required:
+        - power-controller
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-gx-ao-sysctrl
+            - amlogic,meson-axg-ao-sysctrl
+    then:
+      required:
+        - pinctrl
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-axg-hhi-sysctrl
+    then:
+      properties:
+        phy:
+          oneOf:
+            - $ref: /schemas/phy/amlogic,g12a-mipi-dphy-analog.yaml
+            - $ref: /schemas/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
+
+required:
+  - compatible
+  - reg
+  - clock-controller
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sysctrl: system-controller@0 {
+        compatible = "amlogic,meson-gx-hhi-sysctrl", "simple-mfd", "syscon";
+        reg = <0 0x400>;
+
+        clock-controller { };
+
+        power-controller {
+            compatible = "amlogic,meson-gxbb-pwrc";
+            #power-domain-cells = <1>;
+            amlogic,ao-sysctrl = <&sysctrl_AO>;
+
+            resets = <&reset_viu>,
+                     <&reset_venc>,
+                     <&reset_vcbus>,
+                     <&reset_bt656>,
+                     <&reset_dvin>,
+                     <&reset_rdma>,
+                     <&reset_venci>,
+                     <&reset_vencp>,
+                     <&reset_vdac>,
+                     <&reset_vdi6>,
+                     <&reset_vencl>,
+                     <&reset_vid_lock>;
+            reset-names = "viu", "venc", "vcbus", "bt656", "dvin",
+                          "rdma", "venci", "vencp", "vdac", "vdi6",
+                          "vencl", "vid_lock";
+            clocks = <&clk_vpu>, <&clk_vapb>;
+            clock-names = "vpu", "vapb";
+        };
+    };

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
