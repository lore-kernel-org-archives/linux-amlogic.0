Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7489C05027
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Feb 2023 20:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XLBUCRD7YSc0iifjoKBWykRceAXhGKSvoci4sqzjVXM=; b=Qzn4n3jbFO7N2e
	Uqxwp08kEIIzJpuQA9vdiulX3iJVvHLuB0iu2wC0BcuNF2378xax/dbAQav77POzZGkRXOk3azjpb
	J5YJ6vzwoRz9HDuuyBjDxwV/UMzcTsj6dALmXb462BMi57igawDp1HOM8eitrODl94YaLOpwUgOcc
	9WzQ5Zaeh5P1l8Fstox5w5IBm3GOlIQBL1w6H6VSr+T1Q5pUHth+G6MKlVR5dqQNaRuvk6gxP25dN
	B4pNdBw4Dq7HZ7T2gxJEUQItIlKoxJw268YEUnh59Op/rxPlfHHJPRNG+FdRxVJesd/VpWFwizE/6
	Pgl2bEYnmkoRgGAms0xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNJJR-00DT5G-PF; Wed, 01 Feb 2023 20:02:33 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNJJA-00DSvp-1G; Wed, 01 Feb 2023 20:02:19 +0000
Received: by mail-ed1-x52d.google.com with SMTP id f7so11658491edw.5;
        Wed, 01 Feb 2023 12:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GjWgvQwvZyIsMDgCbiBje/5KENMDXEezSPyh+umiPdU=;
        b=GdhO4DdpoLpR0ZKP3Xw/WTvp+aHvsGxS/NmFUeHukhP2Fp1RWkq5bi1B7squTskbP4
         /hfZgnpCOIkGQk0vYT4Eo3Lb89tP2apjreJ4zjuMPFhOUaI6MaO0oN5MHaBzOPtKhbwX
         JvSgvb8JXAZ6/qNknuiPCiBSixfaOBf6o5t7gQYm6L8dOIi4F3NodmxauNckZM20INO6
         enc8ZsZ7qVfZ+EKuYfD2EN/DP7ap44fI1oA12c5xU+zAxqmfVLiAaV2p/GoRq20BYzAi
         AXlGI1GeftUACT4IRRQQz5COWDrtS2H1PYze4lQgXFYkZgPkqWpll4JZrrSyKN7LFGuj
         auvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GjWgvQwvZyIsMDgCbiBje/5KENMDXEezSPyh+umiPdU=;
        b=5/15FgYSC2sRZNNDRKDQ1Fa4cFprnJjBY6NSq7hdxo6kSE34XeTt0D0pURwYtB2s/s
         AsJDeEhG4QeieShtWHLyj1hPQYxzDH2qlEwSl/F8Y+H+5NovwTN8mjxmDTzqfLBMQ1P0
         NOmm2u21i2V8kZeTxXyTs6MPm8XG0EJ6YJ0DbwTSfDpQA1bvmM59JQjgpqaUzGHRr45R
         MWwrVkNbFXFF8Gl1wLS90ahGvv3qIJYrGRAbyTNebxy1NnyAF6foxz2vYbqh6ExEORj2
         VkRVxKTBTPi0qJLWEpaDBwBDbt2V2x6ksnzSn75CgyTxe+VFVF5lrXLQimkfj60f6cmn
         VhwA==
X-Gm-Message-State: AO0yUKWrW3sVat3OYkLcV3MW27Qm9anTs2hV/hXKUYJIh7fJmcJIjBEO
	00AEN/B4jzraNwvDO9QE4Zk=
X-Google-Smtp-Source: AK7set9KWjKT6/RHInEXGxZqqoVIS6d7vQeC3zQ7pPQeXiXdw8jqSi7/LCKDS6ITaDZNLHvURIkJYA==
X-Received: by 2002:aa7:d0c6:0:b0:49b:4711:f4b4 with SMTP id u6-20020aa7d0c6000000b0049b4711f4b4mr3791920edo.0.1675281733150;
        Wed, 01 Feb 2023 12:02:13 -0800 (PST)
Received: from ?IPV6:2a01:c23:b912:d400:3963:7bc4:12b:ddb3? (dynamic-2a01-0c23-b912-d400-3963-7bc4-012b-ddb3.c23.pool.telefonica.de. [2a01:c23:b912:d400:3963:7bc4:12b:ddb3])
        by smtp.googlemail.com with ESMTPSA id lc7-20020a170906f90700b00887a23bab85sm5797602ejb.220.2023.02.01.12.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 12:02:12 -0800 (PST)
Message-ID: <5b83767e-c53d-316f-df10-45a39dbd9c88@gmail.com>
Date: Wed, 1 Feb 2023 21:00:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: [PATCH 3/4] dt-bindings: pwm: Convert Amlogic Meson PWM binding
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-pwm@vger.kernel.org
References: <8df4ceec-663c-dc68-d775-5caeb02c0cca@gmail.com>
In-Reply-To: <8df4ceec-663c-dc68-d775-5caeb02c0cca@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_120216_119690_04249B90 
X-CRM114-Status: GOOD (  13.34  )
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

Reviewed-by: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
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
