Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B89EC54E94
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 22:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AfVGdL67vKr/+O0uphzJznqyvSm27D0dBag+UeKyo8c=; b=p3VaRYddQ7kz2h
	jMGEpx4fMNphnLEDtHhy7QbqzBtd8TE1uVlv8rDnn65y0foWm5u7qFEr0LXtY8bCIMsuGVX0PxzzY
	IsR8d9g2x2EDeQcoXXIYnITrxlm9s5ncWGMRMWcsSb8uYiY8tKgcZjYTd/aCn9YLVhvYAYZKQYxdB
	UDghU0Kj/L75CCDd+N0vXBbHkc9xmeJIH5LnbHXgwwODGlrbfnF8TWI5lYA8FmufAODJiLiBAF+kN
	CnQzCo8BygUUXosv8Gc17Pj9uUfHs4Huw0stMCFH9OyJzsso4E0oNyzrs58s2kMaw5RzXhMVTVr1V
	nMJs6iQM4DNtt8m0MEpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKoGT-0090qP-Sp; Wed, 25 Jan 2023 22:29:09 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKoGA-0090lE-7k; Wed, 25 Jan 2023 22:28:51 +0000
Received: by mail-ed1-x52c.google.com with SMTP id m12so286581edq.5;
        Wed, 25 Jan 2023 14:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h9d5CcIPIwAVuZTZA7qCdKWxys5gtGTLaZZHJl5UAVQ=;
        b=URSHRW2b0I/0QCF62mgR6tevAW3gjPGTB3qqF7779q/46dUO9pTVfqutc3DFRRXITP
         hb88OLD0M5DjibVZX2gRlkJZkOhQ7fyljLQXGH2mjeHbNyWGdEeUVtWsmSLMzcFED46H
         BF5Ba+Z3YYrjXhaU0CmSAnyMDTtKLpv47TU6Orrs8CR/Y80BAj8zAD2jxrB9dtYv4gQ7
         S2IYu2BYTMSqTGFzOnYnALtYGD43HJHhu8MLwRUWRpv5c+X0WvNCG2FhObTuuy7BduNK
         e1Fej1XcjWL6VLEThuFvTJE7MVl8IG8gicOS/drKyi5p8TNHdeH8DajvbJfCZTEZsCK1
         FeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h9d5CcIPIwAVuZTZA7qCdKWxys5gtGTLaZZHJl5UAVQ=;
        b=eIxa9jIY6zZHaSMj+GYzslOkXO8rG+gG8ENSwChZ9sEvd7vTS3fF9t/YYEJ+qVrRv/
         JWC0IUcE5dRpIm3uNvy2J3DirqYszuhoVw9nZHw0q7u3rGCR3l3mp7ppmAoGTK9R6sU+
         sYLrN42eHcX7/YyfVTER4wnaKVrsmu80TwNMBXNiXk+CkpzPaABUUHCUxUMsUWmA7m3H
         mHVpNh81XBubnB+KkK7gjolPrfviqlCcbosKUcwnQL2hFRKLMCUqyzVHN3VMom0YJC6g
         ber95QTl3pjIwLMcUEi8qJwx9xEx1PAA+h/WHC52hrO8Hi/ilckcjtbD90Mbp+2FoF3u
         1I8Q==
X-Gm-Message-State: AO0yUKU2u1HnJtXMJOBK8jIUrUPB9g9hbzoz9wr6IRQcxnvis1NhV8bM
	vQ903sQjtw2OCdVZMasBIes=
X-Google-Smtp-Source: AK7set9LLaD+M/2UIwGL68ILsokHpRI+wlZCL/233GwnOyAXCVldAoPaQqkYUSQGPixzU2TUGsmfog==
X-Received: by 2002:a50:9eef:0:b0:4a0:8fc4:6be8 with SMTP id a102-20020a509eef000000b004a08fc46be8mr6583792edf.26.1674685728057;
        Wed, 25 Jan 2023 14:28:48 -0800 (PST)
Received: from ?IPV6:2a01:c22:720f:5a00:b1aa:59d6:6587:3051? (dynamic-2a01-0c22-720f-5a00-b1aa-59d6-6587-3051.c22.pool.telefonica.de. [2a01:c22:720f:5a00:b1aa:59d6:6587:3051])
        by smtp.googlemail.com with ESMTPSA id s25-20020aa7cb19000000b0047e6fdbf81csm2891373edt.82.2023.01.25.14.28.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 14:28:47 -0800 (PST)
Message-ID: <d37fb6a3-f94e-224a-8829-80cf47412fce@gmail.com>
Date: Wed, 25 Jan 2023 23:28:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] dt-bindings: pwm: Convert Amlogic Meson PWM binding
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
Content-Language: en-US
In-Reply-To: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_142850_307142_0BC39ABA 
X-CRM114-Status: GOOD (  12.28  )
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
---
 .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 73 +++++++++++++++++++
 .../devicetree/bindings/pwm/pwm-meson.txt     | 29 --------
 2 files changed, 73 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
 delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-meson.txt

diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
new file mode 100644
index 000000000..871b24bc2
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
@@ -0,0 +1,73 @@
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
+    minItems: 1
+    maxItems: 2
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,meson8b-pwm
+              - amlogic,meson-gxbb-pwm
+              - amlogic,meson-gxbb-ao-pwm
+              - amlogic,meson-axg-ee-pwm
+              - amlogic,meson-axg-ao-pwm
+              - amlogic,meson-g12a-ee-pwm
+              - amlogic,meson-g12a-ao-pwm-ab
+              - amlogic,meson-g12a-ao-pwm-cd
+              - amlogic,meson-s4-pwm
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
