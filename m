Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41705C072A2
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Nov 2023 13:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/z/g5PrxH5V0CcOXrBL2KcgyXgaMJ9WhqPCsSi0inqg=; b=q8g1A0FWX5r3IE
	YyEoBwDd3fVSP6O04Ke6yWesVXZLv2iYjKDlS6r2At1fBstiMgkHQhBj8Mc56o5OnZpvaB0ZKazqJ
	FqvDJWByo+CwMtQ4K6aZeylhjurdiHFogbBd0lwFMq+UZtRpB04juSDGQKLM7MmLI5NjXbcr9SGy5
	keOPp8OR17zE4sp6UbebzkUmfPN/4AqW48mlwr5iAV8TiSG1MVcfocV+N+3rEXqgbscaj6l5R7lOg
	TlB/VXz6fpKuJWrlGU16G07TpuNhUhbTjrMO7ItmW4eMGKY49lqgq5l4AO/X+UrwQDgI8a5Gbx7a7
	1Hlvk6wCaSRqkuA6bOcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3yRi-006asJ-21;
	Fri, 17 Nov 2023 12:59:42 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3yRc-006any-1b
	for linux-amlogic@lists.infradead.org;
	Fri, 17 Nov 2023 12:59:39 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40859c466efso15199015e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 17 Nov 2023 04:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700225973; x=1700830773; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpQ8hiJaDwq9w2ctJl9hSiwcGPI9BQbencVo58l6Ffo=;
        b=upqnKb1F1LUPRHzkz3nleo1DNAiEi+Ba2LPQWmxDW71W3oCh8kcclR+GE+nERhJ6dq
         FnCVzFX/WyjZmjO+PqUt/urYDqbH5sxS+FfgtX9qT92gL8PLaWLk1Ud06F2SORb/3fvL
         grzIBgsr0CkFQVkAZOhyvtP/lfRnbv4VQDZfQjguBtWsiisdXN5XYIAeLy8nWTzN5xnj
         8jOU/cvhm886nQJl8q+muAodpUxff85YQy1EKxPcsidLdzFW+xE8F0C6GgaDZHzGyZU8
         79h6BZdUHyYsetfLD78SufGaJDrcF+Ln0NZs0YmRpE/TGbro5/JX/fc6wy2340RwKNto
         C+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700225973; x=1700830773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EpQ8hiJaDwq9w2ctJl9hSiwcGPI9BQbencVo58l6Ffo=;
        b=TJYShyXClciDJa19zA4xjrAWz1cMi+kuv34o6arfJJ8rX8TYdspm4fAg3aL2/Jw0jL
         t+SHM7vOUx7RKx0dEN74yK3UNBWVRExeTVgUWM8OO3cDBtqL9/bqzfIfG7rXIuVucvwH
         csYb7C/sSYaXq4Utzzn2w7aHLFYqb+TYQeZETsXAOoqkVrrkLLmZ2UPPK6vcF+4FdQwl
         TyTUGPVGVgO0zrR1r4toGCK9BJTxx6QgYrGNbdcnDsp9N8vk6wxPmleUw24XrQAeVTwk
         KcPOHakq/qyYlDCcBQ7bzdY3Kg7cqeYfr8Bg3kanCLipNB9Fs7i/WAY7gYyyDv8261U3
         Uuig==
X-Gm-Message-State: AOJu0Yw79FNpzikJL9VY+6Hs+tuClqvKW9y02Ps0qun/s0UyB5g2yNxV
	lupclMejb8WW8g0sMVHOG3YRMw==
X-Google-Smtp-Source: AGHT+IE8NQpxkxGP+Ey2DyBhnqgtsrj1QQ626K6i6p8nLGIjozX1JAbKiKLiLg0yOX3km2RtZ5pLDA==
X-Received: by 2002:a05:600c:3591:b0:409:295:9c6e with SMTP id p17-20020a05600c359100b0040902959c6emr14085626wmq.30.1700225973659;
        Fri, 17 Nov 2023 04:59:33 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:8196:e423:38cb:9a09])
        by smtp.googlemail.com with ESMTPSA id k21-20020a05600c1c9500b0040a487758dcsm2671343wms.6.2023.11.17.04.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 04:59:33 -0800 (PST)
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
Subject: [PATCH v2 2/6] dt-bindings: pwm: amlogic: add new compatible for meson8 pwm type
Date: Fri, 17 Nov 2023 13:59:12 +0100
Message-ID: <20231117125919.1696980-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231117125919.1696980-1-jbrunet@baylibre.com>
References: <20231117125919.1696980-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_045936_538145_BF9451CA 
X-CRM114-Status: GOOD (  16.89  )
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
 .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 36 +++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
index 387976ed36d5..48b11b7d5df6 100644
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
@@ -83,6 +87,27 @@ allOf:
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
@@ -112,6 +137,13 @@ examples:
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
