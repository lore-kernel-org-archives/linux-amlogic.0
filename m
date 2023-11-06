Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70AFC4167B
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Nov 2023 10:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kyNOzF15wrHDfbamWFJWLLrra1bHEtMfJaWCdwLNq7Q=; b=i72IwRmxHkAA89
	kUhX8+G7+wDByZECPmjLVXcgp/YI4VE0dpOw7GLm8d+gZw61vnmSLKwAjLwoan+W6N6bdSR1MJuEU
	3BxN9cT+Hu/doqTD6c9hvJkpUWPSKc376V8ikI10cLmOo6osN0S+sZM2wkAb5NeLznsRpq8kqZ1ct
	APpVQkTn92kW31kPMJHNxy0TEHaQQ6kasHjpa20sYI721bcPRCnUMlv6LSi1/0iDDDWNsWlpXMjHa
	yTL/aJgISnYAbrpdPDculBIoZcIGiVPRWzchBLyUDwXfrbFpmDdo3v6t97d8affUu5pFtUn8oGUeI
	OD6jxQjWwcD04Iha5VKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzwv9-00GFMQ-1G;
	Mon, 06 Nov 2023 10:33:27 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzwv4-00GFKf-39
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Nov 2023 10:33:25 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-32fdc5be26dso33095f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Nov 2023 02:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699266800; x=1699871600; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNIPKS5bjo7Dr0T0Rtv+hJZqj7mUU2yEUzYTVTWO2dY=;
        b=S+OqbpllDhKuzjl78GLOd9ZkkwofeAnec4wvZbTO7VGIgifmHoJJF5A6zLJbJ70xFA
         5Mxqnfc596CRGPtmwEwzCVvXPsT5A49jaMrdIy1Lp3K7YV7IL//AVBzilZ5dRLBVUMkC
         tgvh9I0DB2+MlIOdzxh+4VyRGPvO1MeyiUpuMdJ7whRWfxdR+6F+bBfdW3Dvaew8BcKn
         wSRluJbQbpF57X36lrECzCuc1AZhOexJeNqqSvgK/oKBj4taBZQLNrg3JDsk8pT2Psql
         EShinqOCSit1vb6YPFSfdHspqTh3aC6n4hKuxa4U2sdZqPGqqgL9Jh85qMv/yIrQV8o7
         UIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699266800; x=1699871600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNIPKS5bjo7Dr0T0Rtv+hJZqj7mUU2yEUzYTVTWO2dY=;
        b=P377vs+rTcH3IZxD5rK9Zs6d69iUh7x5Kjkcdi5VLv7mjhjRPioS+QVLFGRzNuIbmm
         W+6JwItGmVvFYUoVCFoU+Z7U8sZcg5+PMAJu1e3QNYcSANK828ovhnAnBrJ+f6XQf159
         u9S4BOhRoLUtefAmW/YEJQl46nY5uN0ziQR3HFao5LpWS0Cdd3qzVq9Z7IUIFSfR+Nh+
         dnQNs2yYf7YV8x60//yw7BwOQTEKgx1ki7RIRWLdQngzhBfSkZYrltIVg6Ioa8FRJ8oe
         zHZ1SwIrRb0cr8RjBgBdhms3SB9EVg0ARzzzUWoCcHRWvoVt8IHvZ56AKj4yeGVMg4yf
         oXaQ==
X-Gm-Message-State: AOJu0YxXJkzVrCiOXG8eNhArcDdvKVUAvEr1yjiEzuZIjX9GSGtCfn29
	P42VnO5T1ea0aIraSbXY5f1Isw==
X-Google-Smtp-Source: AGHT+IFZcXHpJEgaNO2TxS6ZjAx7zwqUsBZowvheo5z7hKAXHcnZJDMKQ6s3lTl4gf5lUUnQ+pX+BA==
X-Received: by 2002:a05:6000:1884:b0:32f:b407:5b77 with SMTP id a4-20020a056000188400b0032fb4075b77mr9038937wri.64.1699266800451;
        Mon, 06 Nov 2023 02:33:20 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fabf:ec8c:b644:5d3])
        by smtp.googlemail.com with ESMTPSA id d1-20020a056000114100b0032415213a6fsm9033602wrx.87.2023.11.06.02.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 02:33:20 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	JunYi Zhao <junyi.zhao@amlogic.com>
Subject: [PATCH 1/6] dt-bindings: pwm: amlogic: fix s4 bindings
Date: Mon,  6 Nov 2023 11:32:48 +0100
Message-ID: <20231106103259.703417-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231106103259.703417-1-jbrunet@baylibre.com>
References: <20231106103259.703417-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_023323_338098_EAED0BD5 
X-CRM114-Status: GOOD (  18.57  )
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

s4 has been added to the compatible list while converting the Amlogic PWM
binding documentation from txt to yaml.

However, on the s4, the clock bindings have different meaning compared to
previous SoCs.

On previous SoCs the clock bindings used to describe which input the PWM
channel multiplexer should pick among its possible parents.

This is very much tied to the driver implementation, instead of describing
the HW for what it is. When support for the Amlogic PWM was first added,
how to deal with clocks through DT was not as clear as it nowadays.
The Linux driver now ignores this DT setting, but still relies on the
hard-coded list of clock sources.

On the s4, the input multiplexer is gone. The clock bindings actually
describe the clock as it exists, not a setting. The property has a
different meaning, even if it is still 2 clocks and it would pass the check
when support is actually added.

Also the s4 cannot work if the clocks are not provided, so the property no
longer optional.

Finally, for once it makes sense to see the input as being numbered
somehow. No need to bother with clock-names on the s4 type of PWM.

Fixes: 43a1c4ff3977 ("dt-bindings: pwm: Convert Amlogic Meson PWM binding")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 68 ++++++++++++++++---
 1 file changed, 59 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
index 527864a4d855..754b70fc2db0 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
@@ -9,9 +9,6 @@ title: Amlogic PWM
 maintainers:
   - Heiner Kallweit <hkallweit1@gmail.com>
 
-allOf:
-  - $ref: pwm.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -43,12 +40,8 @@ properties:
     maxItems: 2
 
   clock-names:
-    oneOf:
-      - items:
-          - enum: [clkin0, clkin1]
-      - items:
-          - const: clkin0
-          - const: clkin1
+    minItems: 1
+    maxItems: 2
 
   "#pwm-cells":
     const: 3
@@ -57,6 +50,56 @@ required:
   - compatible
   - reg
 
+allOf:
+  - $ref: pwm.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,meson8-pwm
+              - amlogic,meson8b-pwm
+              - amlogic,meson-gxbb-pwm
+              - amlogic,meson-gxbb-ao-pwm
+              - amlogic,meson-axg-ee-pwm
+              - amlogic,meson-axg-ao-pwm
+              - amlogic,meson-g12a-ee-pwm
+              - amlogic,meson-g12a-ao-pwm-ab
+              - amlogic,meson-g12a-ao-pwm-cd
+              - amlogic,meson-gx-pwm
+              - amlogic,meson-gx-ao-pwm
+    then:
+      # Historic bindings tied to the driver implementation
+      # The clocks provided here are meant to be matched with the input
+      # known (hard-coded) in the driver and used to select pwm clock
+      # source. Currently, the linux driver ignores this.
+      properties:
+        clock-names:
+          oneOf:
+            - items:
+                - enum: [clkin0, clkin1]
+            - items:
+                - const: clkin0
+                - const: clkin1
+
+  # Newer IP block take a single input per channel, instead of 4 inputs
+  # for both channels
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,meson-s4-pwm
+    then:
+      properties:
+        clocks:
+          items:
+            - description: input clock of PWM channel A
+            - description: input clock of PWM channel B
+      required:
+        - clocks
+
 additionalProperties: false
 
 examples:
@@ -68,3 +111,10 @@ examples:
       clock-names = "clkin0", "clkin1";
       #pwm-cells = <3>;
     };
+  - |
+    pwm@1000 {
+      compatible = "amlogic,meson-s4-pwm";
+      reg = <0x1000 0x10>;
+      clocks = <&pwm_src_a>, <&pwm_src_b>;
+      #pwm-cells = <3>;
+    };
-- 
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
