Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB64EC4332F
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Nov 2023 10:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KdO7NwswtBYsp22dNGpIETQQfhiYIy7KTb+sXCnfdw8=; b=oKkD2fjYZQNLjJ
	+Knu1xRItrElPBScA+Eud4q0dVZrhoJ6UMCy77nQzXqXufoyHzIHPxlNb6BTm6njRTg8SHauG3Onm
	yAukE50LBKovQbkEI7rDjbwDxi+Lt4A8g11Ut7uzgIARQei0dnUn5NgE+qheNqFS4wiHzUaLq3BNf
	Wj/hHCaXH9SOLsBg1nXiM+4uLU4EvC22JVzu4lo4qaHbDSLYmH3o/ntheT+7hxtjf+Q6x1rg0VV5L
	Z2OGYU+pX9p0uBOAm1GYUHIF1E7oi7N3Gy/cjR5VDZnjFHjS8JAKxRkEL4v3AObRTPkk2gFqfY1Yq
	BpLWzS7xP1Os5LBCsP2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzwvA-00GFNR-2d;
	Mon, 06 Nov 2023 10:33:28 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzwv7-00GFKi-02
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Nov 2023 10:33:27 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4083740f92dso31813485e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Nov 2023 02:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699266801; x=1699871601; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBQ+A9rHpTWs3KpXp33WW8nDFpcoA+H+EybbPKfpqLY=;
        b=C1Omx2P2xP4HCUvLtSDWodi4MiLCQd77X6mGkKYI7aECy5sI8lAcWouLx5TPwxxy/i
         YnOLlabw88HSlnND0LvGQCrL9XrAbvcCvP1QrEfI94TzI7ZUco2tMKHPRLyIYubJqe6E
         ZIhGVIC1yVQz/DgkvjQmyJUJ4q6ZnfLJQCtixo14fAlkWOTFQsrF6lmEhjRqjvVN2YoF
         NxYBxRL2IQiYzVnAPVczojhsup1Lica49IEl40HvwMA3RxWnjaoI8hTuc6psSu3RPpGw
         YNAFk0WAl1eX/vGTLm+255Hm+XcSFLMW94Hk2ZB+TrdSYjgX4pYArHQzGQbGDifQ9VFw
         VLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699266801; x=1699871601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CBQ+A9rHpTWs3KpXp33WW8nDFpcoA+H+EybbPKfpqLY=;
        b=sHtS9YHX8hAeyLoyU2uImk4IhodD7biZ3PzSS/9Xy/ugQngsD7ZvbXxlyWI7QeB7x4
         vMg2/P+K+IpYgwXhzsSGR+zQYxD9HAnplEouCPS2Er9IuWgQEY3tD39W32c1bERIs2n4
         7x2rjfYbi2m1/ud1uRQ2jPKjQInvnK3nCTm4czOwPn9OqBdh1ugbbcKGYk3Pl7XNm9jf
         Jbf8U04w/EnTH+xSM7RJNtAw896vu5m4p5ILutTLsxOL2SjevG8LFvgdX3j4dkWw6YSW
         DAZAjeq82B2qmggfD+3Yh2QQqrKnBE2BbWeqtulq/j3GDkZKXdnrnTwoq3z5vXD1LaSZ
         WtzA==
X-Gm-Message-State: AOJu0Yw1v4FJxP2t1RbcWdTEXrjsF/mYKM7GPJ9b4vMfgjwUT495Tis+
	18t5ZhdD9mnBTMwwRsYc4s4ZyA==
X-Google-Smtp-Source: AGHT+IHcMPiY4o25MgzGfKk9Wcu81DblqKFjLfX/laBmvungFxUJ0K81n8g5LnJVDzF1XKHmm4zZPA==
X-Received: by 2002:adf:ecd0:0:b0:32d:a717:717a with SMTP id s16-20020adfecd0000000b0032da717717amr18098713wro.40.1699266801294;
        Mon, 06 Nov 2023 02:33:21 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fabf:ec8c:b644:5d3])
        by smtp.googlemail.com with ESMTPSA id d1-20020a056000114100b0032415213a6fsm9033602wrx.87.2023.11.06.02.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 02:33:21 -0800 (PST)
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
Subject: [PATCH 2/6] dt-bindings: pwm: amlogic: add new compatible for meson8 pwm type
Date: Mon,  6 Nov 2023 11:32:49 +0100
Message-ID: <20231106103259.703417-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231106103259.703417-1-jbrunet@baylibre.com>
References: <20231106103259.703417-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_023325_070124_9FE4916B 
X-CRM114-Status: GOOD (  17.28  )
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

Add a new compatible for the pwm found in the meson8 to sm1 Amlogic SoCs.

The previous clock bindings for these SoCs described the driver and not the
HW itself. The clock provided was used to set the parent of the input clock
mux among the possible parents hard-coded in the driver.

The new bindings allows to describe the actual clock inputs of the PWM in
DT, like most bindings do, instead of relying of hard-coded data.

The new bindings make the old one deprecated.

There is enough experience on this HW to know that the PWM is exactly the
same all the supported SoCs. There is no need for a per-SoC compatible.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 35 +++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
index 754b70fc2db0..3aa522c4cae4 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
@@ -22,6 +22,7 @@ properties:
           - amlogic,meson-g12a-ao-pwm-ab
           - amlogic,meson-g12a-ao-pwm-cd
           - amlogic,meson-s4-pwm
+          - amlogic,meson8-pwm-v2
       - items:
           - const: amlogic,meson-gx-pwm
           - const: amlogic,meson-gxbb-pwm
@@ -37,7 +38,7 @@ properties:
 
   clocks:
     minItems: 1
-    maxItems: 2
+    maxItems: 4
 
   clock-names:
     minItems: 1
@@ -70,11 +71,14 @@ allOf:
               - amlogic,meson-gx-pwm
               - amlogic,meson-gx-ao-pwm
     then:
-      # Historic bindings tied to the driver implementation
+      # Obsolete historic bindings tied to the driver implementation
       # The clocks provided here are meant to be matched with the input
       # known (hard-coded) in the driver and used to select pwm clock
       # source. Currently, the linux driver ignores this.
+      deprecated: true
       properties:
+        clocks:
+          maxItems: 2
         clock-names:
           oneOf:
             - items:
@@ -83,6 +87,26 @@ allOf:
                 - const: clkin0
                 - const: clkin1
 
+  # Newer binding where clock describe the actual clock inputs of the pwm
+  # block. These are necessary but some inputs may be grounded.
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,meson8b-pwm-v2
+    then:
+      properties:
+        clocks:
+          minItems: 1
+          items:
+            - description: input clock 0 of the pwm block
+            - description: input clock 1 of the pwm block
+            - description: input clock 2 of the pwm block
+            - description: input clock 3 of the pwm block
+      required:
+        - clocks
+
   # Newer IP block take a single input per channel, instead of 4 inputs
   # for both channels
   - if:
@@ -111,6 +135,13 @@ examples:
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
