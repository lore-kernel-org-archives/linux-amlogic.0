Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA77C05027
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Feb 2023 16:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ohLLmNUoys8W3DTAcbT7lwIGB4zqF6xCRLSxnzSgLgQ=; b=Dseu6YYZUdtloG
	iHzZp2BO1z/4ZzouXN5XHwwGUfLcKQ1N5WttJFCMVSDTKuXZPovp3T/dcH4I2UuUHdogZsEwmtOER
	xJeoLlm4o7xR5EyqssxvYdjLnUV7iQXbbOhDSKJoWhECp8ECEVOmbSIrNaF88OkWZBickQ18p/cxr
	lDiyzec9qq1sRqrvHmk61U79BMX43j7kgNBku+lKIRV6j12937Vrn1xCSemrUHP84YnTYEnUTfFG+
	EgYoWx9IA7xs2Q02B9i8IC6j/KLl/nGAOd5w5IRguWMiZw9YohgFlC5ehhIF4nM+dl4GuOVPJ1hnn
	hRz6TRd1GYlNPJm9EyWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRFZM-00Bu2h-NK; Sun, 12 Feb 2023 16:51:17 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRFZC-00Btzn-R8; Sun, 12 Feb 2023 16:51:08 +0000
Received: by mail-ej1-x62d.google.com with SMTP id ml19so26766915ejb.0;
        Sun, 12 Feb 2023 08:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGNTzKThLFC+ICzqVFt9Ik75F3U4hNDrBu6zDf2ISVg=;
        b=drLnqeLTpoSXKGe3WC6T0PCKD64Mlcf32TEyMOROS9x3KmCDynx32ACRFeWSwWPNqe
         /AksMPeyU1M2y/iZ9BC6yJy+vFG9T+iCyzr6CXfZBhlpTZaDaw6XYpHZiUXCfapWjOQ8
         dB9quCF598ekszB3j5N80rcqnBePcxLQEBR00EpXv3c8jWblX42qDzS4u+l50Ru4p3GH
         ZwvrTuZAII0nLq1wyd5W77SfZr/yvjocAJOnyOP9tK/a/sjbVSDmjP8JJmqoQ3aAPjpN
         q3Lyp+7QX4fCtLUEdNZCCeKgw1qgoY+gZDe8oGhsbSDkiI8+zReGw5nG15gTCtojNjdS
         Ulmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LGNTzKThLFC+ICzqVFt9Ik75F3U4hNDrBu6zDf2ISVg=;
        b=PtKZ4thPcuSKr9mijLQ1ClpJQEKra61dGbcTGBTLuP1rXQkDlh9Nuwx86R7v8rGQ5b
         tjDTCjrkxBrZzLoALEvtXGqo6IKBBmfNv3Cav+vA4ii/cRo6tLslg+FAo6XSM+n8Al2M
         qmzmEk0TNXnwmCf5aNhqbJ9HpdUMajI+8R740IVJEJOQEZnoJhtSDRNYeBHVzXI8fnwu
         c+/PKFnva5CcEEGSeQldH18wwk3RtGIhKlfqdLQv8v/tip/U5D1CoXCrC4yWxvwnFPKN
         lg1qLKWmKCKwrB1ahEarn/YtyRuDPYzy8dR7tQ/L2TQNGmQuMb60oWtKtSBTfsDaUL8R
         HGRg==
X-Gm-Message-State: AO0yUKUZ7lj5kcz+fzqMfo2bYsPVe2P+WqkSjWodsdyjQxpmQYqOryob
	Vm5X5Jro7SLh5ZtSwcAy5z4=
X-Google-Smtp-Source: AK7set8rJ7aNoHxwHiQIZDi/NL64TSR8L4pfjrQAbsLtdkCgLc8kkYkwMg+orpzAWrEb0tAnMrj1mQ==
X-Received: by 2002:a17:906:d92:b0:88a:a09d:e673 with SMTP id m18-20020a1709060d9200b0088aa09de673mr20328585eji.31.1676220664607;
        Sun, 12 Feb 2023 08:51:04 -0800 (PST)
Received: from ?IPV6:2a01:c23:bdd2:4300:1932:303f:b63a:5a0e? (dynamic-2a01-0c23-bdd2-4300-1932-303f-b63a-5a0e.c23.pool.telefonica.de. [2a01:c23:bdd2:4300:1932:303f:b63a:5a0e])
        by smtp.googlemail.com with ESMTPSA id k20-20020a1709061c1400b00871390a3b74sm5588297ejg.177.2023.02.12.08.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Feb 2023 08:51:03 -0800 (PST)
Message-ID: <a91e3a8e-7ef1-70bb-f6be-01a9a90c0e05@gmail.com>
Date: Sun, 12 Feb 2023 17:51:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] dt-bindings: media: meson-ir: Convert Amlogic Meson IR
 controller binding
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_085106_908150_10B7F5FD 
X-CRM114-Status: GOOD (  13.43  )
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

Convert Amlogic Meson IR controller binding to yaml.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 .../devicetree/bindings/media/meson-ir.txt    | 20 ---------
 .../devicetree/bindings/media/meson-ir.yaml   | 45 +++++++++++++++++++
 2 files changed, 45 insertions(+), 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/meson-ir.txt
 create mode 100644 Documentation/devicetree/bindings/media/meson-ir.yaml

diff --git a/Documentation/devicetree/bindings/media/meson-ir.txt b/Documentation/devicetree/bindings/media/meson-ir.txt
deleted file mode 100644
index efd9d29a8..000000000
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
diff --git a/Documentation/devicetree/bindings/media/meson-ir.yaml b/Documentation/devicetree/bindings/media/meson-ir.yaml
new file mode 100644
index 000000000..8d3c7acfa
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/meson-ir.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/meson-ir.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson IR remote control receiver
+
+maintainers:
+  - Heiner Kallweit <hkallweit1@gmail.com>
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
+    ir-receiver@c8100480 {
+      compatible= "amlogic,meson6-ir";
+      reg = <0xc8100480 0x20>;
+      interrupts = <0 15 1>;
+    };
-- 
2.39.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
