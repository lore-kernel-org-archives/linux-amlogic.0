Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C26C197A0
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Nov 2023 13:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3zOAmLBTxI7GWcdnmCZ8b3rIC/dHURE89EYOrWuCz7M=; b=xfk1QArLrwV7fa
	7QYmK9QQLtVTW0KiFEIJdWnR6pk7ou+2UfasbSvkQOdo/r2CAvOvbIXLYTJlFRejUfvA5i5+3Fxfr
	BYEQy5vYLek/+pKddZCxeFwzeYVHTVMy4mtZQq74vgf+kHhUy02n9nBlTzxdFWxX5C+8ur7EoUVBh
	jyUF3hO8uWuqgad1u3wfbNMYKBCsWJj21w2i27znrnGnlvnaW0VvvCrqifcb/l0l01lflVt82yje4
	b5K90FR3jNSxmm4HTUUnyDg+DmhaF2xjXVmkYRXOTpa/PkxRKh7TYSKh4zE7RS9m3NY5nMTjrjsVj
	ECTpQMUpritPFM+x4lRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3yRf-006aqA-0d;
	Fri, 17 Nov 2023 12:59:39 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3yRb-006anv-1v
	for linux-amlogic@lists.infradead.org;
	Fri, 17 Nov 2023 12:59:38 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40906fc54fdso16666785e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 17 Nov 2023 04:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700225973; x=1700830773; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehKsq2eqEr9TyGMWxrUge7Kmly0yBlqo6X+P3u0B3wQ=;
        b=21qQsT9XmkjgN1UtppZvJGASq6gLuUapDdRrH1sT4NXXSKhn0YhTCpf84P5vcW2Ts1
         dbIa9PCXgPecX7gkfcks4UIvQjCx0bjf+A+clE0RhcZ7SLgQDLRsgggga3Qw1NwnJB9E
         Q129uwzgwrKzIIlJJDfrBeESqW0wals5RfklFIHluwb9EbyS797TlT0r70TXFeaJVg5I
         /acK3eEqn/Su2uBx5M6FyKQcskGXUj1Rh1cem64cbBZfrgxZZ2q0O0wPt989pK1B3IZq
         CoHoShi+yGsBC0wulfDzANkLok3n3h7vZSmPWzWVEIgBaW2tpwjd0QsMr0mRLFnPHpEl
         ilCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700225973; x=1700830773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehKsq2eqEr9TyGMWxrUge7Kmly0yBlqo6X+P3u0B3wQ=;
        b=cvMHWZNtGcdknxoCCW9BcljTpEf2YJsbT5gUgTSYze+08G/aswjHS7f4AkRlLmYcGR
         DKdwRm+eErSxPaJCuJEO/UMvBTPGDN5y6c1tV6DqxckmsfGp5yGrOPSw7RGXW+mcZl72
         FGhmejS35OlvE4s6ivC/3YGoisGNLbP3CGWwbg8YXyrRmBfTyAwnrPYJdKvoqadblyyA
         KftSIzpHAAJF9yT7YmTevrfFw2ZImwfPL1xq1cndi5PRXlU1vyHpXeJw4JiVzD6m7DZS
         1lx7knbqX5mxWogsTj4yGbkgLj6Irw8gY1kJdE1FnH9KcFsNcH3MGC+i18AAh0tnadkU
         glFA==
X-Gm-Message-State: AOJu0YxPUomFhVHDqovVUlqgXc2GXABJzr48iIdG3GIFXF/l73nAb4yr
	J+e6zi558yb8vyDyEcaoZ8t4OQ==
X-Google-Smtp-Source: AGHT+IFC0iXQHpwA92gius4GH87N+HDv/7i2pDfsJ6iqZJFZArhvP8c/3r0xnTjBxdG9b/nbBNWc2Q==
X-Received: by 2002:a05:600c:3548:b0:401:daf2:2737 with SMTP id i8-20020a05600c354800b00401daf22737mr14787836wmq.30.1700225972765;
        Fri, 17 Nov 2023 04:59:32 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:8196:e423:38cb:9a09])
        by smtp.googlemail.com with ESMTPSA id k21-20020a05600c1c9500b0040a487758dcsm2671343wms.6.2023.11.17.04.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 04:59:32 -0800 (PST)
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
Subject: [PATCH v2 1/6] dt-bindings: pwm: amlogic: fix s4 bindings
Date: Fri, 17 Nov 2023 13:59:11 +0100
Message-ID: <20231117125919.1696980-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231117125919.1696980-1-jbrunet@baylibre.com>
References: <20231117125919.1696980-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_045935_633086_70D46701 
X-CRM114-Status: GOOD (  18.40  )
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
the previous SoCs.

On the previous SoCs the clock bindings used to describe which input the
PWM channel multiplexer should pick among its possible parents.

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
 .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 69 ++++++++++++++++---
 1 file changed, 60 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
index 527864a4d855..387976ed36d5 100644
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
@@ -57,6 +50,57 @@ required:
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
+        clock-names: false
+      required:
+        - clocks
+
 additionalProperties: false
 
 examples:
@@ -68,3 +112,10 @@ examples:
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
