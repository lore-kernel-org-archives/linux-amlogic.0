Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC40C5478A
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Feb 2024 15:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hEVG1U0z7poMf5zRgofrnkY+oL4lelIaLTCpnEx5Xgg=; b=U8MCia1iOvoDRN
	BXOmMl1lfh1lmxmkAYgJhRhullYb7ch1iboUkXj9Hhfll6XmUKzp9szp3QzzgvFR+hphO+zGtOpGM
	fo1pnuKR6Dam6pjAdpD6s6nZ89eRl3EM9sQ8+RW5vf1E+o28TSquR32sFftlxc8ettQHfxLfqiFRb
	I0jMTu/0noZBPYYqBSmcEcT3FSqxjJ01zZYCXvxMEa24SYR7j1NtYL3ygE265c5I+pepM0w1Mn2Y6
	4xE3mX3K9OPMYUZwZrNE31hJtyuJa80Lx+UkSfRfxJDCjs/2tBPu05MTaPYER/rkgdJFNcYh/IpEg
	ixzD38wa3dUGU3FtggdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcoGd-00000001QRi-3VOP;
	Wed, 21 Feb 2024 15:12:15 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcoGZ-00000001QPJ-0b0z
	for linux-amlogic@lists.infradead.org;
	Wed, 21 Feb 2024 15:12:13 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-41272d42207so9088805e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 21 Feb 2024 07:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708528329; x=1709133129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dIMaRI4UL/ljzaiGORJNkCrZ9+yfYsQHx0oEU8j6rs=;
        b=ZWkO6iGvd3rC+hSlfWat+h2AJWmDS6GIws2pIh1ESmlCnd1ZE7c20/ZPgCWJvymz02
         oFOiYDcC/fV2V269fH28NMUzdWzyuPX83hVXRLT5NC/KY/uYnCt8RFX6Wd8RkKZ5UL7r
         lmy3LVAvnSaAciaCT2A1EYx9QyCgtNg1hABA7fgwipya1FTGTXIVXOHyFaLfb8okp8dh
         03rEEoINLzCRtTxXUPg12KvTY4wt3y2TDBw/c2ipW5C5zkwborQ8X6Ne/iF/2OlPiUVm
         0mvtRhTJlwRAn6LMVyxSwn8Wg9Y+HjZM0mvhbZluRpvESzr3Q4fUr7zuY0fUW+4K9TiX
         G8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708528329; x=1709133129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2dIMaRI4UL/ljzaiGORJNkCrZ9+yfYsQHx0oEU8j6rs=;
        b=KtXS3nAe4P5rlnrXFEXQBrrzz0TEvyrrRVuIfdQTcjIXEi2Hl9KiEq465RPMBptit9
         i+bLljo5OboQhicjycwi9RlqBbrcHWOdr5ThP5ea0Fc7zyKflSJbVBYujcZ6FQRsw79d
         W9++CAi/PtweAbU9P0H9rdG0UidSVSi2A24ZdxwqR3wIiOZKfd+sLRWtKpohLGiyr9EI
         /x00/l3PnPlKWuky341tk04FUdri51NvyX6tS9p19vDte7Hdd7BX58bmyeAB/ulLWBTv
         /tfonG4PyKAN3RzhC6wo01aHfKucLW0cVKoALakNsCZdsGx7R4Tc9kEghYCp6B13RHWc
         opqg==
X-Forwarded-Encrypted: i=1; AJvYcCXfBGANHBJeWngtxam9cQUsfGv2Sa7OCcF7HcD/Nm483/DyQdWreS3DdUwF7sbFJaialDlehUMUcImpl6pguZ6JmxNl9H6BHJP4U0dulbjiyQs=
X-Gm-Message-State: AOJu0YxoXWotd40sZa/xMSnykIIKUwh+Li5nfBCSZ0x/t4bA+dXI8xY0
	MBOip8gLOqMyxVI5xROjBNwGw+i755IBCyjFc87zoIfayCB1L5Tos9i2QrT2FdY=
X-Google-Smtp-Source: AGHT+IGnB/yDjeQ1zYwsD0gS9+46rlsbMLhYcTvmjGYKfgU3FPt5e+DC9MUyGg4jOgcKx3D6U0nZZA==
X-Received: by 2002:a05:600c:3515:b0:412:17dd:a227 with SMTP id h21-20020a05600c351500b0041217dda227mr13716851wmq.15.1708528329414;
        Wed, 21 Feb 2024 07:12:09 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1b1a:d907:d735:9f9e])
        by smtp.googlemail.com with ESMTPSA id bg22-20020a05600c3c9600b0040fc56712e8sm18725342wmb.17.2024.02.21.07.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 07:12:09 -0800 (PST)
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
	JunYi Zhao <junyi.zhao@amlogic.com>
Subject: [PATCH v5 2/5] dt-bindings: pwm: amlogic: Add a new binding for meson8 pwm types
Date: Wed, 21 Feb 2024 16:11:48 +0100
Message-ID: <20240221151154.26452-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240221151154.26452-1-jbrunet@baylibre.com>
References: <20240221151154.26452-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_071211_207623_7E8B43A8 
X-CRM114-Status: GOOD (  15.36  )
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

The binding that is used up to now describe which input the PWM
channel multiplexer should pick among its possible parents,
which are hardcoded in the driver. This isn't a good binding in
the sense that it should describe hardware but not usage.

Add a new binding deprecating the old one that uses clocks in a
better way and how clocks are usually used today: The list of
clocks describe the inputs of the PWM block as they are realised
in hardware.

So deprecate the old bindings and introduce a compatible per SoC
family to replace these.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 50 +++++++++++++++++--
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
index a1d382aacb82..1d71d4f8f328 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
@@ -21,23 +21,36 @@ properties:
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
+      - enum:
+          - amlogic,meson8-pwm-v2
+          - amlogic,meson-s4-pwm
+      - items:
+          - enum:
+              - amlogic,meson8b-pwm-v2
+              - amlogic,meson-gxbb-pwm-v2
+              - amlogic,meson-axg-pwm-v2
+              - amlogic,meson-g12-pwm-v2
+          - const: amlogic,meson8-pwm-v2
 
   reg:
     maxItems: 1
 
   clocks:
     minItems: 1
-    maxItems: 2
+    maxItems: 4
 
   clock-names:
     minItems: 1
@@ -68,11 +81,14 @@ allOf:
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
@@ -81,6 +97,27 @@ allOf:
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
@@ -110,6 +147,13 @@ examples:
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
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
