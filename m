Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4942BC4706C
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Dec 2023 11:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4athU3OeR7Ub2uwJWNMgOfs5MsQum6INBRqjboMiBzg=; b=eEajNTHfyNmHOH
	6gGGtRWj8C/AdDVBPWZ447ij5maDPMkF6W6lDE0Cxkh5aYLx5yYZLNav2a7KymOdP/HauiVtqfb6W
	T/nTE0/wzhRIvQv3mzimfmcFb50vpxrMSVzii6KyffwlTd3jTCF/3PKkowJkj1ZcdUsEva33nREOU
	f6LuyZroQwbwQtdxmkelCcHAUlXyg8WkzLj/uV/XepJQWP4lslbuNUewALDm9+1yM2uGmEtYKDnWt
	C7S5yI3xyPBDCpBovcvRKtTKEWK6Wb0K8MFHaq8flOUtJ6t4FwY/Evn/FYIJWKkDbkedCz2ss6zQZ
	DM+sk//gOFkMVLmrnZhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdX3-005eIz-1N;
	Fri, 22 Dec 2023 11:17:33 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdWx-005eFA-0b
	for linux-amlogic@lists.infradead.org;
	Fri, 22 Dec 2023 11:17:29 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-336897b6bd6so1444179f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 22 Dec 2023 03:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1703243843; x=1703848643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UA472qIZSqNES0rFti6bcuMYBLF91YXl05BR5PTQI+4=;
        b=bvhGf3P9XtJuekdMPglgswQkRHCdaTKgzf093XjW2M1nwQXVPmL+3qzbkJ1/AFp8QY
         W7OzLYNjEIexcrnTAIwC+ci6VloMUVnnXUYFN0HKeu8UyKs08UmeVADocTzThkMuu6n7
         4CXeWxa/5h0P7dC1xE+ma6m8Vir9h3Qu22Ya5D9nI43dMjoulhVLT549y0/xALikaU7U
         cOyBzCgr66jzUXUwhTMgHgKnPmbjacVD0YWRxTcOtLGJrHJEHGgdHdKDI40zuLFMBsMK
         cNYmrcom8tpYSnLdWFverH193+AkZ6F+I2GB0WCUQqOPZ0HvINix4IekBPz/uK9N+rt6
         zwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703243843; x=1703848643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UA472qIZSqNES0rFti6bcuMYBLF91YXl05BR5PTQI+4=;
        b=slLNNgjWnO3BEMoYj80XJ8Xg6R+2SNBEqD0Dqp2qXBu01k+SmWUVyiMIt5xExK5Btf
         aJKsyYxTDjVNbZ7DTqIueIRxR/EJewMBQsKz3qMWfIjjyqY9bjPXHz5G+Ukc0nVJXxvR
         quD5kJaEF4rFQRfNWyT6ZZzyQWk3M07EjdFwTgGtlWb+sIGY+aJrJz4t66IZeEyJElda
         AjgLvAgovx/uCFw+kfcIncaQzwRlEAUxtpFFeWmLnsNnVYdfLzzR+2Rp24zUu3ia1m39
         kslCB/ZAqH0iPgZcSt2uNBPJ3Zu5Zz252KFwLG75NSSfXu0lyPQQwvMvoiRi/kisX9KV
         XYKg==
X-Gm-Message-State: AOJu0YzJAmP2dWBG3ZQF1pUJsbqW/My1v2YWEGvra/pljRnecCubnN+R
	PIE28gjFZfAb23u0BJUitbgDbQH8hmehBA==
X-Google-Smtp-Source: AGHT+IFUXx19gskZNe9Cq9ac+YP1EY1D+E8vci2xTMzrpmh05yyMydc9GsyL60EgpOEkotuo+oR11A==
X-Received: by 2002:a05:6000:1f16:b0:336:9952:f25a with SMTP id bv22-20020a0560001f1600b003369952f25amr184175wrb.52.1703243843434;
        Fri, 22 Dec 2023 03:17:23 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:c099:e596:3179:b0fa])
        by smtp.googlemail.com with ESMTPSA id f8-20020adffcc8000000b003366b500047sm4054069wrs.50.2023.12.22.03.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 03:17:23 -0800 (PST)
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
	JunYi Zhao <junyi.zhao@amlogic.com>
Subject: [PATCH v4 2/6] dt-bindings: pwm: amlogic: add new compatible for meson8 pwm type
Date: Fri, 22 Dec 2023 12:16:50 +0100
Message-ID: <20231222111658.832167-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231222111658.832167-1-jbrunet@baylibre.com>
References: <20231222111658.832167-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_031727_223221_3971A780 
X-CRM114-Status: GOOD (  15.80  )
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
 .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 50 +++++++++++++++++--
 1 file changed, 46 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
index a1d382aacb82..eece390114a3 100644
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
@@ -68,11 +79,14 @@ allOf:
               - amlogic,meson-g12a-ao-pwm-ab
               - amlogic,meson-g12a-ao-pwm-cd
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
@@ -81,6 +95,27 @@ allOf:
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
@@ -110,6 +145,13 @@ examples:
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
