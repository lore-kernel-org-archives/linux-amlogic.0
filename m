Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946CBC6FD20
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Mar 2023 13:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5tIxO+0i6kNnbvPydaZgmu9as+EzWpKJYNawixaJkvA=; b=uAZ2WDWlSNlTC0
	cs4EdNI1AHCRZOih1aBxFTo3lbG8ySm+edD82RfP/LkdkJz/aVfim05U9Z6bsCfsGhFBni5hg/4gw
	MKubV/lg8PfnMxCCrTlIpDkjGTzqMPgH2lgSegcKO7t7ryP+TtkAEXFUooHBn5hEmiUKX8Q4tiCyv
	PV0wa63WZTPa2TEs3SHvzonJlYJwAet2I1nkLZiousRs2cb+SA0AbhG6zqQwbCZa4DYGUZVxfm42W
	rg3iqVz3EyepVUFN/le8uUZpC3lAwzQZx9ZrXcqWlb0qaXsHPRM7LkHpjrPXQc3Xr+iT5kECUj0fk
	sGr+3UHCIB2dw0EqMNLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZu71-005GPS-6U; Wed, 08 Mar 2023 13:45:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZu6u-005GME-8w
	for linux-amlogic@bombadil.infradead.org; Wed, 08 Mar 2023 13:45:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GGsfIAFzoH7ggFb2voxRa7ZKIwz9PZMg5nKhBB1/kDo=; b=ht8BqQu7uMxwMCdUOuGJ00FlN1
	kVkepRq2tc+j//xD/HtXoxBZ7wD5U0LSfak+nCUmkckKVgrlzlfBEehuvzjtrDRPuTHW0PwQ1ux87
	uQkvPKAZbhnF87mWCK18h4qY2nK+/b1g5isAnklsc4h/O8A+wK4lX0aOPLz2GbnjAWLMJbYoRUHdr
	EJkDnQQ1Br19w8jtcqiajQB/O60nAUTbYWOJz6cVHejQdSoyWassq14h0ZT8J+0VVGEQ2ovFB30vJ
	y4wf6Q6jFSjowpJgC9u7al33pAmVvkRzzopb4EWnl8H7OpAfqZBiJvijkWcYRgkGWyg1u3iqKxQs6
	RSMEfS8g==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pZtpX-00HOKj-2j
	for linux-amlogic@lists.infradead.org;
	Wed, 08 Mar 2023 13:27:48 +0000
Received: by mail-wm1-x335.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so1277742wmb.5
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Mar 2023 05:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678282057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGsfIAFzoH7ggFb2voxRa7ZKIwz9PZMg5nKhBB1/kDo=;
        b=RGSXu0Au/OStV2NM/0YvoZTI7AGTJM3zMg3PryrOMmpyGC4h500kgahiSAnsyy/aSE
         n45yXvt6Y6ijCpO2ir3tg29zUiwxa5LL9B9nfFuhPKuO8pYtI8b1o1XHs2/RcJSQvOzQ
         tP2qsl+Wee/jJ4xRPvlheF0T4TCOc9Q/0XJFV26tZ7ioieWqBpDLxTujUBFxi+R1IVnW
         S77IMMxWE4vQOnaNJ4KD/hpHVapMURtJQgggAtFI5tvjhojdsvgtYa1Dmor8E5mKJDCm
         WsDEWHF3V/l9R8ReTe+7RusxhEoLXDuJXL/p0j9thw3t8J8PG6C+usKUaBheCKo5G5cj
         u6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678282057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGsfIAFzoH7ggFb2voxRa7ZKIwz9PZMg5nKhBB1/kDo=;
        b=6zB2h8EjePYS4tjTgFuKn0FG+lPAqNsiah/uIiGJtGmOxdgS2AEw3MLtEscelYaxsC
         ey9+isb8AP1qzeRyo80UoTyosU6ndrt5DYu7ZKd+UCwaMmLJOgiaIV2/M/r7Gl9uKBXx
         KKW+lNKXgkpSofzl9GF3PLxSHYbggCgiJhEkrBnYuSd6684c10F99iJ4KVpi/d+JhMAl
         kl12B1Q0/8fLonv5BYuwn9mVHwo7EhHL61ASUAlA4cUSX7oUaoPh5F1B0VvWGsXhmVuV
         7lA6FACcWHaXGCl/03PXM/+FyPgb3ZJ8vgNQlJgDL6bqyc36isaAX10UeCEdTOJz9cRB
         VW8w==
X-Gm-Message-State: AO0yUKUNxsH8YvwtEFnROtlixtKOheF9Wmtcm5t7TDVXZRKhW5YGVeQO
	h6+PMh22546FOQgRtyN30F2e7Q==
X-Google-Smtp-Source: AK7set9AkaO3fICbB6hanCc+LoI++IJ871oRs/LA4EM9OgroiYmgyzeKlirQrH98pqeOuWJEFGALFg==
X-Received: by 2002:a05:600c:4590:b0:3e2:2467:d3f5 with SMTP id r16-20020a05600c459000b003e22467d3f5mr15464209wmo.25.1678282057149;
        Wed, 08 Mar 2023 05:27:37 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600c46ce00b003daffc2ecdesm20631491wmo.13.2023.03.08.05.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 05:27:36 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 08 Mar 2023 14:27:31 +0100
Subject: [PATCH v4 3/5] dt-bindings: media: convert meson-ir.txt to
 dt-schema
MIME-Version: 1.0
Message-Id: <20221117-b4-amlogic-bindings-convert-v4-3-34e623dbf789@linaro.org>
References: <20221117-b4-amlogic-bindings-convert-v4-0-34e623dbf789@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v4-0-34e623dbf789@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_132744_150190_3B269DBB 
X-CRM114-Status: GOOD (  13.69  )
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

Convert the Amlogic Meson IR remote control receiver bindings to
dt-schema.

Take in account the used variant with amlogic,meson-gx-ir.

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/media/amlogic,meson6-ir.yaml          | 47 ++++++++++++++++++++++
 .../devicetree/bindings/media/meson-ir.txt         | 20 ---------
 2 files changed, 47 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
new file mode 100644
index 000000000000..3f9fa92703bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/amlogic,meson6-ir.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson IR remote control receiver
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+allOf:
+  - $ref: rc.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - amlogic,meson6-ir
+          - amlogic,meson8b-ir
+          - amlogic,meson-gxbb-ir
+      - items:
+          - const: amlogic,meson-gx-ir
+          - const: amlogic,meson-gxbb-ir
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    ir-receiver@c8100480 {
+        compatible = "amlogic,meson6-ir";
+        reg = <0xc8100480 0x20>;
+        interrupts = <GIC_SPI 15 IRQ_TYPE_EDGE_RISING>;
+    };
diff --git a/Documentation/devicetree/bindings/media/meson-ir.txt b/Documentation/devicetree/bindings/media/meson-ir.txt
deleted file mode 100644
index efd9d29a8f10..000000000000
--- a/Documentation/devicetree/bindings/media/meson-ir.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-* Amlogic Meson IR remote control receiver
-
-Required properties:
- - compatible	: depending on the platform this should be one of:
-		  - "amlogic,meson6-ir"
-		  - "amlogic,meson8b-ir"
-		  - "amlogic,meson-gxbb-ir"
- - reg		: physical base address and length of the device registers
- - interrupts	: a single specifier for the interrupt from the device
-
-Optional properties:
- - linux,rc-map-name:	see rc.txt file in the same directory.
-
-Example:
-
-	ir-receiver@c8100480 {
-		compatible= "amlogic,meson6-ir";
-		reg = <0xc8100480 0x20>;
-		interrupts = <0 15 1>;
-	};

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
