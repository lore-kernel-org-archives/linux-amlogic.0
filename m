Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732F2C07CB1
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Nov 2023 13:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xH7/29Dsv/I6m1K8DLRYLWVQkYDNXu50GH8GAym0bFw=; b=iNOWqPkQp4+/L0
	h1MdqSj9CVJvM5LDmrndgDK0D4gdWBnrEuR1eDhF4rsXHqGFzeIQNtKI7cGCG9J7FGNsENg0uTiMc
	axbnbMQYbBPr9cGZubKEv0Akqi/kJG60WD0N87jy0WzdleCOrtzJp+dXALzS6OkwqT6NLp/XKTjU7
	4ccpy1EY8PC8SNSx53z0bGNFdJascEUfM0MMJwoUuM8VYty7/ic4XClfheIfiYh6cmawMEgVyFPQ7
	gi96ilKSWBdVHmdbhq0H1dHfb2MVrU/NkZ9uDzMO/WQsYSRr4g4r+ORQJGpxgL/QVlIP1cXSDFcFU
	WTg2GbsgwlPmg+TmBdGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Knv-008Ubn-2C;
	Wed, 29 Nov 2023 13:40:39 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Knr-008UaM-01
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Nov 2023 13:40:38 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c9b88cf626so18745461fa.3
        for <linux-amlogic@lists.infradead.org>; Wed, 29 Nov 2023 05:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701265232; x=1701870032; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQRwxx9GEOBkFVTtu0HXXPOcGrMBOKITGaWl4mMUCHI=;
        b=1EH8jjDiH9c/G3vCbQuMtqR5+IDacSsx92kIvJOAaovytQESFd7xpQybikwzF2Cr/j
         LBjUWgtcG78np9td8zIwqfXrh+t2p0K0kRFzyr0XacAboVjJ0BKracqnwYo4Xhhuio0T
         Ve8RRGLiexz3m5kADz3qYEpYZiJiQV5Zv3GPzkVE04xR4UC4AXBHUQBqa6i/wEAQPmAW
         rkGOHqTJONXufpO9NT38vSHKbBtkkDc9ChaagJK3g2lyelAYHKvHPd0198arfQaA3Op/
         gmcXfX9Jck1i1sl5UL7SK/4BXBjpkHcS3cep+n6NwDPa0J2vptYA74iR3+W3vV4PPGfa
         dPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701265232; x=1701870032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQRwxx9GEOBkFVTtu0HXXPOcGrMBOKITGaWl4mMUCHI=;
        b=dlJtKlW3VmH5ibIw76AApHPbK6pBeoJ+ACHFj2jYczoclOoXMLrwRyNZxUiavsT42/
         r/aZKGhOwdnvh8ypLGXy/tpLlmvRGxt3ISDCnPOAoVKGLfAq7hVoSE1blViFABo91ICO
         X4ptcujFLdVOd/xA+Knctc0xFTZTVcPrBEdBk1GzWwbjiHQOfu9Hxtxut2wW9nolJzzF
         L7KI0i6xOCGqka+y10qQ42yiJVZ75t4csvP5mr0v3erVyJP+Bb22eeQmqSyz8E4MDVI0
         d+7yALTEHPfgUIM2DjLutTjZEfmBIAndyRQ9aUG5YvEFODUaugvRcyizuV69+hS1RQiG
         CrRw==
X-Gm-Message-State: AOJu0YxENTVISGV6ZmRbC3ZfxajjMEDhO9TAxwUqOaTHUjxp2kAy6Lfx
	5MDEOWQCS835EQ2zePCXLYchAg==
X-Google-Smtp-Source: AGHT+IE6EXkIS1MLDJ9G7G35/UHE0u8PoIQgoq4VqHWzasYKaYE0gqoMNy6M4o6VE2MrG4pH/0KbYg==
X-Received: by 2002:a2e:9646:0:b0:2c9:ba44:fd9d with SMTP id z6-20020a2e9646000000b002c9ba44fd9dmr2347821ljh.38.1701265232031;
        Wed, 29 Nov 2023 05:40:32 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:6101:5529:fe2d:d7eb])
        by smtp.googlemail.com with ESMTPSA id w17-20020a05600c475100b004080f0376a0sm2285860wmo.42.2023.11.29.05.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 05:40:31 -0800 (PST)
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
	JunYi Zhao <junyi.zhao@amlogic.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH v3 2/4] dt-bindings: pwm: amlogic: add new compatible for meson8 pwm type
Date: Wed, 29 Nov 2023 14:39:58 +0100
Message-ID: <20231129134004.3642121-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231129134004.3642121-1-jbrunet@baylibre.com>
References: <20231129134004.3642121-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_054035_263996_09192E9D 
X-CRM114-Status: GOOD (  16.73  )
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

Add a new compatible for the pwm found in the meson8 to sm1 Amlogic SoCs,
dealing with clocks differently. This does not enable new HW. It is meant
to fix a bad DT ABI for the currently supported HW.

The original clock bindings describe which input the PWM channel
multiplexer should pick among its possible parents, which are
hard-coded in the driver. As such, it is a setting tied to the driver
implementation and does not describe the HW.

The new bindings introduce here describe the clocks input of the PWM block
as they exist.

The old compatible is deprecated but kept to maintain ABI compatibility.

The SoC specific compatibles introduced match the SoC families supported
by the original bindings.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 52 ++++++++++++++++---
 1 file changed, 46 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
index 387976ed36d5..eece390114a3 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
@@ -21,23 +21,35 @@ properties:
           - amlogic,meson-g12a-ee-pwm
           - amlogic,meson-g12a-ao-pwm-ab
           - amlogic,meson-g12a-ao-pwm-cd
-          - amlogic,meson-s4-pwm
+        deprecated: true
       - items:
           - const: amlogic,meson-gx-pwm
           - const: amlogic,meson-gxbb-pwm
+        deprecated: true
       - items:
           - const: amlogic,meson-gx-ao-pwm
           - const: amlogic,meson-gxbb-ao-pwm
+        deprecated: true
       - items:
           - const: amlogic,meson8-pwm
           - const: amlogic,meson8b-pwm
+        deprecated: true
+      - const: amlogic,meson8-pwm-v2
+      - items:
+          - enum:
+              - amlogic,meson8b-pwm-v2
+              - amlogic,meson-gxbb-pwm-v2
+              - amlogic,meson-axg-pwm-v2
+              - amlogic,meson-g12-pwm-v2
+          - const: amlogic,meson8-pwm-v2
+      - const: amlogic,meson-s4-pwm
 
   reg:
     maxItems: 1
 
   clocks:
     minItems: 1
-    maxItems: 2
+    maxItems: 4
 
   clock-names:
     minItems: 1
@@ -58,7 +70,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - amlogic,meson8-pwm
               - amlogic,meson8b-pwm
               - amlogic,meson-gxbb-pwm
               - amlogic,meson-gxbb-ao-pwm
@@ -67,14 +78,15 @@ allOf:
               - amlogic,meson-g12a-ee-pwm
               - amlogic,meson-g12a-ao-pwm-ab
               - amlogic,meson-g12a-ao-pwm-cd
-              - amlogic,meson-gx-pwm
-              - amlogic,meson-gx-ao-pwm
     then:
-      # Historic bindings tied to the driver implementation
+      # Obsolete historic bindings tied to the driver implementation
       # The clocks provided here are meant to be matched with the input
       # known (hard-coded) in the driver and used to select pwm clock
       # source. Currently, the linux driver ignores this.
+      # This is kept to maintain ABI backward compatibility.
       properties:
+        clocks:
+          maxItems: 2
         clock-names:
           oneOf:
             - items:
@@ -83,6 +95,27 @@ allOf:
                 - const: clkin0
                 - const: clkin1
 
+  # Newer binding where clock describe the actual clock inputs of the pwm
+  # block. These are necessary but some inputs may be grounded.
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,meson8-pwm-v2
+    then:
+      properties:
+        clocks:
+          minItems: 1
+          items:
+            - description: input clock 0 of the pwm block
+            - description: input clock 1 of the pwm block
+            - description: input clock 2 of the pwm block
+            - description: input clock 3 of the pwm block
+        clock-names: false
+      required:
+        - clocks
+
   # Newer IP block take a single input per channel, instead of 4 inputs
   # for both channels
   - if:
@@ -112,6 +145,13 @@ examples:
       clock-names = "clkin0", "clkin1";
       #pwm-cells = <3>;
     };
+  - |
+    pwm@2000 {
+      compatible = "amlogic,meson8-pwm-v2";
+      reg = <0x1000 0x10>;
+      clocks = <&xtal>, <0>, <&fdiv4>, <&fdiv5>;
+      #pwm-cells = <3>;
+    };
   - |
     pwm@1000 {
       compatible = "amlogic,meson-s4-pwm";
-- 
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
