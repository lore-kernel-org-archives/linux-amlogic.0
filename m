Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D913EC48BF6
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Feb 2024 15:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+RDdV0zivT5u0KflKYxVF3ROz1QRupoUOPXWHOGQ8Qo=; b=3uEbDk+cbBNyHW
	RyFRMtnxkqKOP051m/nXfir69pElsm4puS0Oh2ktLxm0dx5lP9cNBdBIiigZFkL4cQeRIg9otUO9F
	4De4cL5oAHAZ5ooIL3/4p941YBxhcDrvKfjzQjYWq43csZPUvIQPi+oa0EACR47nwlnCAAWkUJm5c
	yPQGOXqbx/WwjHuGsr+0Fyfug2NqF1INBz/COSiD6iawts7Jn2AnQXO+P1X2+6n1UMXD0vtrx4RlF
	0L0hdL/1dFlgUrk6exeL9Fj10rn4PqnwoUmTPuW8wrIZwErvT66miq52MckBw7yh7lYHKzIoxp4sC
	JvybDh0ovR2NjdJe44Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcoGb-00000001QRO-493F;
	Wed, 21 Feb 2024 15:12:13 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcoGY-00000001QPG-0pBX
	for linux-amlogic@lists.infradead.org;
	Wed, 21 Feb 2024 15:12:11 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-33d509c5706so2108462f8f.2
        for <linux-amlogic@lists.infradead.org>; Wed, 21 Feb 2024 07:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708528328; x=1709133128; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eeb8+16ljSlEDFuGSbXwGh3NoqLN08Y0bLt4DyDQDqU=;
        b=LtTTB8H85cpryUMK3Uo0yZK/XD+FuuKxPm+Zwh2fShaemoXm/ZI6Uh0e5xlpwUtVHk
         XXMKD48nu9/l8gf9li0RMxA+Ud9+mbkUToSKibfeZrdJ92mJmYyTwN8f+ptyU506VsaU
         aAGEfThVnw98c+2P1bqS+XUF4Cw3xMLB01My41cxoaXXNwkmpsAI5t4swY2ZTuKN2Q91
         f1bwdLKzGy78DP3cgDE0jOMPHswIQoXNbZ27OaOBQ/AZwMbLxpmtLIzF3rNIYoTG7TJJ
         KsR7NDjP9ebFdC+Ncj+TpMo3WWUyCqtXEyeVjwNKB+/43Ulmbioy5CWoYZ/z5iPuxzHe
         p+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708528328; x=1709133128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eeb8+16ljSlEDFuGSbXwGh3NoqLN08Y0bLt4DyDQDqU=;
        b=Vu+oBraGe//cK8jW5KQzLFJRntoq5Mf1oW5esAapnkfmoLQtsi1Ws9snRdwCEd/0IS
         NyYwTucR2FirpR6KWuLaoOYTf+oo0IWlwVNNTJExmjdElU9vDTjOIVj/38Pjzmd+Tuwl
         q+3py2MnxJsjkZFfhdzFnY3/bQ2KyRMZyNWiZ+8s/VTOePy1kgZC59uAy2/eaMbYMgqn
         pWFJXyOw5w9YG2rkBVlTWE7dTMW2uaa4tG5y7rxiIy5yVOyrAccvJ+O5FtOF3rksa75e
         9vX8d4qHNfMZVG8IlcIVh6KWhUE3tZ6HM62D39ZCMyWpGNPeseADDl8pNcl3Tq7MTy8H
         q8/w==
X-Forwarded-Encrypted: i=1; AJvYcCWXF5fVQVwntYc9Ip3VDvP53hWtKfkLDNAUH92uk8gmhsQDWGkYaFM5VPTpqRjCa/oIsxMYmeBEoV4aV3qa4vxgKJxMyfVOy1cbpBn5nmaxp4s=
X-Gm-Message-State: AOJu0YyC6xQ1pq6ssq40vUMOWjg80bs0nnO/EC+hOYhVLAlLuaE0L0Yf
	Zv3tNbF1C62ToOyfHgb7igiUkqPJpr+GdSrLJrxHXQBxELyaukpVXowIMRk7N9c=
X-Google-Smtp-Source: AGHT+IGm2sH+dRd6PnvO83tJQa9VL0HTxHwYnaY9gzdZI6rvajQdxVWVttPfM8ui1jJcxYYhGdzRnQ==
X-Received: by 2002:adf:ffc5:0:b0:33d:3f21:c38b with SMTP id x5-20020adfffc5000000b0033d3f21c38bmr6021597wrs.25.1708528328489;
        Wed, 21 Feb 2024 07:12:08 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1b1a:d907:d735:9f9e])
        by smtp.googlemail.com with ESMTPSA id bg22-20020a05600c3c9600b0040fc56712e8sm18725342wmb.17.2024.02.21.07.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 07:12:08 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
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
	JunYi Zhao <junyi.zhao@amlogic.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v5 1/5] dt-bindings: pwm: amlogic: fix s4 bindings
Date: Wed, 21 Feb 2024 16:11:47 +0100
Message-ID: <20240221151154.26452-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240221151154.26452-1-jbrunet@baylibre.com>
References: <20240221151154.26452-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_071210_259366_114CC85B 
X-CRM114-Status: GOOD (  18.39  )
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

Also the s4 cannot work if the clocks are not provided, so the property is
no longer optional.

Finally, for once it makes sense to see the input as being numbered
somehow. No need to bother with clock-names on the s4 type of PWM.

Fixes: 43a1c4ff3977 ("dt-bindings: pwm: Convert Amlogic Meson PWM binding")
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 67 ++++++++++++++++---
 1 file changed, 58 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
index 527864a4d855..a1d382aacb82 100644
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
@@ -57,6 +50,55 @@ required:
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
@@ -68,3 +110,10 @@ examples:
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
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
