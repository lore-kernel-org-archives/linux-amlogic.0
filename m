Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBA4C77B60
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Apr 2023 07:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ODw+j5Qm04Bo36j03ok1Kw86lBPtgw2iG9buV+ECGEA=; b=LuyF82n600mhHm
	TsWMbnuk5nuiWNw0o2nbj8NrurSFic0dPkFKMM9uKwwpsL12yB6PEAVs9ZM//NCIpwhLOBpYNgXeL
	7kEQmkvf4SNLX29rPdoaJEnB3u8++V3/sUOyNVSSLGhzD9Kq/hx6IdKz69p9BObaa/Avc0oOiFdqk
	yEUeZd+6vOD3EPmPR54AgcxfvfiRzyf+EsU6LN119Uc7KXnh10ruPaqOnNNng9mcHGmt3Pmn0T3TT
	2cF5TjrDQHfsqydUwMYqa9EyMKoguwU9fBSmuIK501/6S4aD73144W0r0dxM9F+oMysTInKCdezw2
	pxwIiOjwW0+oEH2VzgMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjEY4-00ENMZ-2T;
	Mon, 03 Apr 2023 07:24:16 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjEY0-00ENJq-2Z
	for linux-amlogic@lists.infradead.org;
	Mon, 03 Apr 2023 07:24:14 +0000
Received: by mail-wm1-x329.google.com with SMTP id u11-20020a05600c19cb00b003edcc414997so17449987wmq.3
        for <linux-amlogic@lists.infradead.org>; Mon, 03 Apr 2023 00:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680506650;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cqv8fHO79cYN9L6AkrGBwrIzzL+Ob2lOIioUI32ePkI=;
        b=IZ3RH95ho42hwFdt/izaXV19i2aULaPQwEDLl1+Rm8ZVGD16j8HdsjRmrK0Tg1gQSj
         IBtp2SrVfsqhiD9KL5aEHt2+2pubAGTxE+pawHNCrzjhjKqnCb3J27OIjOvmYonld8pP
         uFxgTE1di/ozV0NTpvxum4pKUo5HwB78+reltWOdzA8GhCaC1efEIK5mRHTVTRW/ihB7
         U1j6hrG4rgC7LG7naTWIEb/B2Jtl1kvWNtYZAC7SBPyzNPWQpJa+XP9fwyOoISvCTmYv
         eXhJW2jGcg4QElG8a39uismiF+WbQh4MvN8rrjNArjmE2366B1FV9MUF8flWmT/wXLKJ
         KqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680506650;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cqv8fHO79cYN9L6AkrGBwrIzzL+Ob2lOIioUI32ePkI=;
        b=TjTkc27saT4+JizcJLmLzV145G1BYqkReYKwSQ1tknGkYIy7JRGVJ+zl8PQ4gSS5T+
         XLmvVyYgQY2uk+Okm+7xQiOgbPu8tbNxYM+FbtFc0RT0cp4hAC6MLNSLX8ProVrDpvGX
         wBauArU1542VmmlwfJ8JjoEkNloTkrkYxrJMZ1+D8NB1l0IbqEzZ4yKRvUJVemGMg/l9
         W8Rf+GXvO6zPioYsVVsN5ajb3TZybWmbP9QWtZmnb5ABUoJbkg386943N5vF26sLH4Wf
         JP/TSWsbmg/zJvjj5WBTOBPth1UXlLWLuWY0I/HYfNKgr7OBCtf84t9SNcqdDnS5R4qx
         3KiA==
X-Gm-Message-State: AO0yUKX+HkTWw+SRwHtUtjSeiknaidZx4dFkSXzdXa/93pXhsJYRk8PI
	YS8O1VkELKagAF+XfY8eeoVfww==
X-Google-Smtp-Source: AK7set/eGkelnnC04eonkO/10whS6reZjPlKLJ01b1s8HH53ykIQ9QOYwf3f6lUGFM+CPoOIEoiU0g==
X-Received: by 2002:a7b:cb86:0:b0:3dc:433a:e952 with SMTP id m6-20020a7bcb86000000b003dc433ae952mr24300740wmi.33.1680506650279;
        Mon, 03 Apr 2023 00:24:10 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id g20-20020a05600c4ed400b003ee8a1bc220sm18844372wmq.1.2023.04.03.00.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 00:24:09 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 03 Apr 2023 09:24:06 +0200
Subject: [PATCH v5] dt-bindings: timer: convert
 timer/amlogic,meson6-timer.txt to dt-schema
MIME-Version: 1.0
Message-Id: <20221117-b4-amlogic-bindings-convert-v5-1-63781bed4452@linaro.org>
X-B4-Tracking: v=1; b=H4sIABV/KmQC/5XOPWrEMBAF4KssqqMgjX5sb5V7hBSSZ2wPOBJIG
 0FYfPdo04Vt4mp4r/je3EWlwlTF9XIXhRpXzqkH93IR8xbSSpKxZwEKQGs9yGhl+NzzyrOMnJD
 TWuWcU6NykyMtGgeHFjyKLsRQScYS0rx1I33tey83rrdcvn8Xm+7n/X9401JJsyhwbpri5Me3n
 VMo+TWXVXx0uMEJDB6YD6icitGDe8LMCcx0jGBENJpMJHzC7AnMPj6z5MFgXIZx+oMdx/EDLmL
 nDLMBAAA=
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_002412_835284_A385302D 
X-CRM114-Status: GOOD (  16.50  )
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

Convert the Amlogic Meson6 SoCs Timer Controller bindings to dt-schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Batch conversion of the following bindings:
- amlogic-efuse.txt
- amlogic-meson-mx-efuse.txt
- meson-wdt.txt
- meson-ir.txt
- rtc-meson.txt
- amlogic,meson6-timer.txt
- amlogic,meson-pcie.txt

Martin Blumenstingl was also added as bindings maintainer for Meson6/8/8b
related bindings.

Remaining conversions:
- meson,pinctrl.txt
- pwm-meson.txt
- amlogic,meson-gpio-intc.txt
- amlogic,meson-mx-sdio.txt
- rtc-meson-vrtc.txt
- amlogic,axg-sound-card.txt
- amlogic,axg-fifo.txt
- amlogic,axg-pdm.txt
- amlogic,axg-spdifout.txt
- amlogic,axg-tdm-formatters.txt
- amlogic,axg-spdifin.txt
- amlogic,axg-tdm-iface.txt
- amlogic,g12a-tohdmitx.txt
- amlogic,axg-audio-clkc.txt
- amlogic,gxbb-clkc.txt
- amlogic,gxbb-aoclkc.txt
- amlogic,meson8b-clkc.txt
---
Changes in v5:
- Removed applied patches
- Link to v4: https://lore.kernel.org/r/20221117-b4-amlogic-bindings-convert-v4-0-34e623dbf789@linaro.org

Changes in v4:
- Rebased on v6.3-rc1
- Added Reviewed-by
- Removed applied patch
- Link to v3: https://lore.kernel.org/r/20221117-b4-amlogic-bindings-convert-v3-0-e28dd31e3bed@linaro.org

Changes in v3:
- Dropped applied patches
- Added acked/reviewed-by tags
- patch 3: removed invalid secure-monitor property
- patch 4: added a note on the commit message about the meson8 compatible
- patch 9: fixed mmc compatible bindings
- patch 1-: unified PCIe instead on PCIE + PCIe
- Link to v2: https://lore.kernel.org/r/20221117-b4-amlogic-bindings-convert-v2-0-36ad050bb625@linaro.org

Changes in v2:
- rebased on v6.2-rc1
- patch 1: fixed power-controller, added const: amlogic,meson-gx-sm
- patch 2: added const: amlogic,meson-gx-efuse, fixed secure-monitor type
- patch 3: updated example subnodes to match reality
- patch 4: added reviewed-by, added interrupts, added const: amlogic,meson8m2-wdt
- patch 5: added reviewed-by, added const: amlogic,meson-gx-ir
- patch 6: dropped applied
- patch 7: dropped patch, replaced with deprecated in the title of the TXt bindings
- patch 8: fixed title, added reviewed-by, added interrupt description
- patch 9: fixed example indent, added reviewed-by
- patch 10: fixed const: amlogic,meson-gx-mmc case, fixed indentation
- patch 11: added reviewed-by, fixed title, fixed bindings after rebase, added clocks/clock-names as required
- patch 12: added reviewed-by
- Link to v1: https://lore.kernel.org/r/20221117-b4-amlogic-bindings-convert-v1-0-3f025599b968@linaro.org
---
 .../bindings/timer/amlogic,meson6-timer.txt        | 22 ---------
 .../bindings/timer/amlogic,meson6-timer.yaml       | 54 ++++++++++++++++++++++
 2 files changed, 54 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.txt b/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.txt
deleted file mode 100644
index a9da22bda912..000000000000
--- a/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Amlogic Meson6 SoCs Timer Controller
-
-Required properties:
-
-- compatible : should be "amlogic,meson6-timer"
-- reg : Specifies base physical address and size of the registers.
-- interrupts : The four interrupts, one for each timer event
-- clocks : phandles to the pclk (system clock) and XTAL clocks
-- clock-names : must contain "pclk" and "xtal"
-
-Example:
-
-timer@c1109940 {
-	compatible = "amlogic,meson6-timer";
-	reg = <0xc1109940 0x14>;
-	interrupts = <GIC_SPI 10 IRQ_TYPE_EDGE_RISING>,
-		     <GIC_SPI 11 IRQ_TYPE_EDGE_RISING>,
-		     <GIC_SPI 6 IRQ_TYPE_EDGE_RISING>,
-		     <GIC_SPI 29 IRQ_TYPE_EDGE_RISING>;
-	clocks = <&xtal>, <&clk81>;
-	clock-names = "xtal", "pclk";
-};
diff --git a/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.yaml b/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.yaml
new file mode 100644
index 000000000000..8381a5404ef7
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/amlogic,meson6-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson6 SoCs Timer Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+
+properties:
+  compatible:
+    const: amlogic,meson6-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 4
+    description: per-timer event interrupts
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: xtal
+      - const: pclk
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    timer@c1109940 {
+        compatible = "amlogic,meson6-timer";
+        reg = <0xc1109940 0x14>;
+        interrupts = <GIC_SPI 10 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 11 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 6 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 29 IRQ_TYPE_EDGE_RISING>;
+        clocks = <&xtal>, <&clk81>;
+        clock-names = "xtal", "pclk";
+    };

---
base-commit: 4b0f4525dc4fe8af17b3daefe585f0c2eb0fe0a5
change-id: 20221117-b4-amlogic-bindings-convert-8ef1d75d426d

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
