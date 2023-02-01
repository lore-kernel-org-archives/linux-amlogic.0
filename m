Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0199C05027
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Feb 2023 17:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wPTpykxWO7A9GlIsyBguTq7mFCREJSaBoDttrHjDCps=; b=sbkcnYzPxr0/53
	sV+msmMuySUjntTSToHiiPFwUpsqxGKOzYeye3b/x3HHInf3MjtgZo9ZBfUQrzn6OdA8b1nMIx17R
	aVcs4dAvAZmUe7I6TXQIx6irbFBR0DZuVSb8PofsT1K6j1+w9NptqYW6rHtdM203GejkXl2tS/XqL
	IfVgwCH5v6YWa63NwIApOLOv/jXri8Bu1X5PXMNToaZN1PAHTmAVKB0k6l+Xmlg1ADVZgbP4s1Rt5
	gP3y3CzAzgDedlrAv5oYYRGy+2AG/q+xDqeSdZYuHL1ek2kxdeyNXkDTa2i8mTRhqyeImfrn3zZXh
	b6UxxmMw8hMMrq/xf7tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNHBA-00D3kQ-Gl; Wed, 01 Feb 2023 17:45:52 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNHB7-00D3jC-9g; Wed, 01 Feb 2023 17:45:51 +0000
Received: by mail-ej1-x633.google.com with SMTP id p26so42498812ejx.13;
        Wed, 01 Feb 2023 09:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pme95IJRkV5XLQXbsPO4wq0L5GK5jF10IaE5SUoe0QE=;
        b=Nsm/KgHKdb5jfv0AWCtWdIaqg1nLXN+X4ml6vEjJdW8zQ9rsLl1hBpTlnupHOK9WfV
         PvdJZ+0weAv6CE9ngqHpk9THMEyPt3ONsSQ/VRqmrGynZU7XobLdGo2ziBpeX6R25EDa
         r7bwOPzhIB4TCSw7Iccsl6vpcjfG9HSofd1viA5kk27Too5FvMckCJBiP9mz/nDwdZ/i
         35SCqEtHn4qLEhW6Rtv4ojfUDx3pd3yAYTYTAwDSWbo/3HxE3/KsTt2ig97mt5+hs1Sh
         nLlKXMKUXmTnLQCicXwszOqcHxa0tMAvRT2vhtocyJeVuPKrGXIWuy0vq3YOtUmcN+PW
         I5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pme95IJRkV5XLQXbsPO4wq0L5GK5jF10IaE5SUoe0QE=;
        b=wiimML3IyxsvhlgIvBqnxwDcZzfEPS7EbncdhHAq/hxFOYKqlaq78NakAX1EkUzmuv
         fR4y6ygTmkI4GrJg8mw4ALq5xUCjHE3Ajh634uTpQZ0GX/6tPGU24REpWIt6EiCOSCpU
         Bvd6VNEKw6RBH2PvfxlMkRsi7zH4G/nEwNLbumNsa3XdjkseTHQvaweCHnZWkh5mdR5L
         neibeelsrXubt+G+pmCkE4ZhI7GFw3dkQoA6qkJ08s8OM66BYn1nAmprCimBaj/9F2BD
         0TZiXUJ4n6PMD+l5hS1XTJQ4TUDZagey4b7LUcSZCG2cPp2T35TgABoKsdF6fGphVndy
         63vQ==
X-Gm-Message-State: AO0yUKVA+zxbQjEuaRNhGXElrlPRrdkO1VGO2QRIhXQTE6ZU7fS8sPFJ
	K0YWjoMcPdhLww9qDsjwhp4=
X-Google-Smtp-Source: AK7set+d1Dsd9a92qBdnIOyZP42sjjCfsTL9ooxVRr+fGgtswYmO5aRgQVz5RhV8RuEpkHPf7lwPgg==
X-Received: by 2002:a17:906:22c7:b0:877:ef84:c7de with SMTP id q7-20020a17090622c700b00877ef84c7demr2821233eja.61.1675273547111;
        Wed, 01 Feb 2023 09:45:47 -0800 (PST)
Received: from ?IPV6:2a01:c23:b912:d400:3963:7bc4:12b:ddb3? (dynamic-2a01-0c23-b912-d400-3963-7bc4-012b-ddb3.c23.pool.telefonica.de. [2a01:c23:b912:d400:3963:7bc4:12b:ddb3])
        by smtp.googlemail.com with ESMTPSA id dy25-20020a05640231f900b0049e210884dasm10017113edb.15.2023.02.01.09.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 09:45:46 -0800 (PST)
Message-ID: <aaa73903-1837-d9c8-8c45-54b4473fd548@gmail.com>
Date: Wed, 1 Feb 2023 18:45:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: linux-pwm@vger.kernel.org,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v4] dt-bindings: pwm: Convert Amlogic Meson PWM binding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_094549_370221_B94361C4 
X-CRM114-Status: GOOD (  12.82  )
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

Convert Amlogic Meson PWM binding to yaml.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- fix clocks and clock-names
- consider that more than one compatible may be set
v3:
- remove minItem/maxItem properties for compatible
v4:
- remove not needed "items" before "enum"
---
 .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 70 +++++++++++++++++++
 .../devicetree/bindings/pwm/pwm-meson.txt     | 29 --------
 2 files changed, 70 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
 delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-meson.txt

diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
new file mode 100644
index 000000000..527864a4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/pwm-amlogic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic PWM
+
+maintainers:
+  - Heiner Kallweit <hkallweit1@gmail.com>
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - amlogic,meson8b-pwm
+          - amlogic,meson-gxbb-pwm
+          - amlogic,meson-gxbb-ao-pwm
+          - amlogic,meson-axg-ee-pwm
+          - amlogic,meson-axg-ao-pwm
+          - amlogic,meson-g12a-ee-pwm
+          - amlogic,meson-g12a-ao-pwm-ab
+          - amlogic,meson-g12a-ao-pwm-cd
+          - amlogic,meson-s4-pwm
+      - items:
+          - const: amlogic,meson-gx-pwm
+          - const: amlogic,meson-gxbb-pwm
+      - items:
+          - const: amlogic,meson-gx-ao-pwm
+          - const: amlogic,meson-gxbb-ao-pwm
+      - items:
+          - const: amlogic,meson8-pwm
+          - const: amlogic,meson8b-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    oneOf:
+      - items:
+          - enum: [clkin0, clkin1]
+      - items:
+          - const: clkin0
+          - const: clkin1
+
+  "#pwm-cells":
+    const: 3
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pwm@8550 {
+      compatible = "amlogic,meson-gxbb-pwm";
+      reg = <0x08550 0x10>;
+      clocks = <&xtal>, <&xtal>;
+      clock-names = "clkin0", "clkin1";
+      #pwm-cells = <3>;
+    };
diff --git a/Documentation/devicetree/bindings/pwm/pwm-meson.txt b/Documentation/devicetree/bindings/pwm/pwm-meson.txt
deleted file mode 100644
index bd02b0a14..000000000
--- a/Documentation/devicetree/bindings/pwm/pwm-meson.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-Amlogic Meson PWM Controller
-============================
-
-Required properties:
-- compatible: Shall contain "amlogic,meson8b-pwm"
-                         or "amlogic,meson-gxbb-pwm"
-                         or "amlogic,meson-gxbb-ao-pwm"
-                         or "amlogic,meson-axg-ee-pwm"
-                         or "amlogic,meson-axg-ao-pwm"
-                         or "amlogic,meson-g12a-ee-pwm"
-                         or "amlogic,meson-g12a-ao-pwm-ab"
-                         or "amlogic,meson-g12a-ao-pwm-cd"
-- #pwm-cells: Should be 3. See pwm.yaml in this directory for a description of
-  the cells format.
-
-Optional properties:
-- clocks: Could contain one or two parents clocks phandle for each of the two
-  PWM channels.
-- clock-names: Could contain at least the "clkin0" and/or "clkin1" names.
-
-Example:
-
-	pwm_ab: pwm@8550 {
-		compatible = "amlogic,meson-gxbb-pwm";
-		reg = <0x0 0x08550 0x0 0x10>;
-		#pwm-cells = <3>;
-		clocks = <&xtal>, <&xtal>;
-		clock-names = "clkin0", "clkin1";
-	}
-- 
2.39.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
