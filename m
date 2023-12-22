Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02885C4706E
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Dec 2023 11:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=noicOGqVTyV6aShtSKtVX5I4m3z2s3/ZZtusdEK797I=; b=HE6jljnDxmxGJG
	yKLuzy1CNOXLuJbgJRkVbSOVhA8PqBcgCTvn5A991dqLiVoQVTe2XycjKDqgjTCIIPgq2sooN/uW9
	cWgTDr2iLxrI9spmcaYlXbDqUqYjmjj0zv1WnuJ7UtHOwWURG8a3N1drFod8dliHoSD0eXlDitR2u
	FnPOWNqUfFlFFB57VDgESvsCNbi8VHyyCywWIz6pzEmj0vmBAaePHBl1rx+gowZhI3dTnJxEOEOCp
	9Nf9KAGy8Tuwp8jgSrYrnp5/+xJtuQNySpfrJX/DuOFqm6tfHYaZWX09Z1sN72I4n1PpeASbjrGJT
	Vyf41zLRPTfSWwU7H6vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdWz-005eGx-0P;
	Fri, 22 Dec 2023 11:17:29 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdWv-005eF9-2V
	for linux-amlogic@lists.infradead.org;
	Fri, 22 Dec 2023 11:17:28 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2cc61d4e5aeso21576971fa.0
        for <linux-amlogic@lists.infradead.org>; Fri, 22 Dec 2023 03:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1703243843; x=1703848643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hbdPMPGBWozpmFUaZkCdhiZ0Fh092WlwkYQcWOwj7p8=;
        b=kC082Ph2KOGAfsb6Q6p/8WY4pyGqd95qqAWfccazoB6fL8zopevex5Un76SwsCoove
         2llDd3olRnvxmO9jnhzJ9Z3Tv4vN9s6C7pneMTM6pc4mMxVnTFrmMm4bPCsd8KqhndW1
         hV47DwQFnr64Feaf0HEB1IBPjSnKjCf0qIQXDZqsO4XVnryFzDaBE+B/xLclZfg/InS+
         4G/Y/6A4cxBZFF7pPbqGpyPFpznLs+A8R2VAwkGlJEsQhS/4BxnA/abtDb4NuQClEb3p
         gI80xxPkjEL2rDM0XdcmXpdTz2A4UKjN3wezZFt79k6BHTJCEgwwnKtf2lXS4BfeJEgy
         TGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703243843; x=1703848643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hbdPMPGBWozpmFUaZkCdhiZ0Fh092WlwkYQcWOwj7p8=;
        b=MkfqDBDDYvRGJBA/d760Ve6aGLCGDJ9HXAmMRSpDybTopxE79pPXphockhJBWfiE16
         UYctCT0r2iKczobSid+YJmm+hlWu3kCBTZpwbz5VyS65VcSBRoILwt6Zve8RHQ3cTG3c
         U/MPcKQZEnLrJTBuMPR0oUCVc0TomkRZb1WnZeESJWSP+gbLcZXhaDxN0s76ZDjatXOv
         lrbE7yk+Z3A6o65Db4o4OJLRgzBDGtiQljWi2CSwhDBc60yHxGKu8o4en4oQ+VYOL/HK
         /AqqjZbsJAnUs2HLbR2iY+4ascdj5hIm/DOCWYgV1Xf/2z9GjxU0FKkRwBzeGzF1KFJJ
         ePgw==
X-Gm-Message-State: AOJu0Yzr+s+Rn0myYIDicbuBU2gHNpC0dZl1vmUIirlsNDVA3TKvFiEI
	ElpONZGj+bhbI5M341X08S9lDQNeeKJxWQ==
X-Google-Smtp-Source: AGHT+IG6sZFecjF7WGn330e6ppqprMS3s9YMycmVgYUQnSYXwjARQWVMsAFeawADk6MltkhEO3iEyg==
X-Received: by 2002:a2e:a499:0:b0:2cc:a253:e72e with SMTP id h25-20020a2ea499000000b002cca253e72emr518179lji.60.1703243842587;
        Fri, 22 Dec 2023 03:17:22 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:c099:e596:3179:b0fa])
        by smtp.googlemail.com with ESMTPSA id f8-20020adffcc8000000b003366b500047sm4054069wrs.50.2023.12.22.03.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 03:17:22 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
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
Subject: [PATCH v4 1/6] dt-bindings: pwm: amlogic: fix s4 bindings
Date: Fri, 22 Dec 2023 12:16:49 +0100
Message-ID: <20231222111658.832167-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231222111658.832167-1-jbrunet@baylibre.com>
References: <20231222111658.832167-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_031725_822228_78B2896B 
X-CRM114-Status: GOOD (  18.18  )
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
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
