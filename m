Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88448C636D3
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Feb 2023 16:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VanumF453LSXON6WmAzjGMv/XMrzd18iovMZqNGp+IM=; b=nPiTMlFTpkKqrq
	mJge3C9NoZvhW8aPW+5To7uN0W6Pxtlg/+8N4R49haskQfRZHp4OzUhFhkmzJOH+4SP7MOtH6nJbV
	CkUmk/t6YpVC12c9K1m1+kNgxDLo5K/xCY3zPURwKw/8nILDgXW5Ce5fX84AT1/5VinMQ8NHLxkRU
	DvOM5zy4zf3eC2fRh6JYeLTSWWdu79YktPDMVsOR3yTIRKCxBR0r5CLb/bZPkPw2hvwoEJPzC/bhg
	HTHpM1Icabk1t49C/xpTRzyg/FDnzaCWF9kpsemf3W4B5Yuq2aOssFnw1wc3GgojVMEQTMZ25afNB
	jzuJuUa/eKZibEY27DcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP424-009CCB-Rc; Mon, 06 Feb 2023 16:07:52 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP3WI-008wZK-7Z
	for linux-amlogic@lists.infradead.org; Mon, 06 Feb 2023 15:35:05 +0000
Received: by mail-wr1-x42f.google.com with SMTP id j25so7227731wrc.4
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Feb 2023 07:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dE4PzawJ8Ivz1Xkrb1ainxw3MHkOCZBpNlDJteLfhvQ=;
        b=7+0Oo1DVaqD7naQ+tMMYeuBowi/hiXS2Pth67RgSbzizIqJCJUg91R28kFILkD38nm
         OW1Xpyp6KIBZhnCdiQok71iMY/Bn5tV3amkYRfb/6DeGwaBaCJJLlUJWhiUtmAaR/VQf
         +w7cNV6/oG8nPnlySxo+KIWUT9IfR/s5N7Xm4UpDemXPzr/+mAwXl99X2m0FimpJpTwL
         mEM1h4wzIEpayxRIUbK9mwOXPc5D9JOkHvfRjwaH6oaZCNjhpB0yoFqaETseakuwffoP
         cUEd+FaJVNgXGpLVPFXCOXuI8bxrcWl2sdURbnW9SxhM+FaKlM2h0nJ/KKfZrVFpN7L8
         bKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dE4PzawJ8Ivz1Xkrb1ainxw3MHkOCZBpNlDJteLfhvQ=;
        b=jSohdeS22mI5SNycFWewDlC7FjvTBxjTnClG2CEFZl2S78eEalGXi19OXXSUdZlEF3
         XjYKjhMs1tswkI3rc89gPCUd77e+CQ69mbPJy+qIXV9mT+JaGHnCnl2ZjsKKQYClUYPq
         mPcN1yc+17D7mBT1I2jwpdh4V0qL4B3h1KrrXx7SVkS2qpUaveCvZT2gdxrjPscQ5WvE
         vC0PePX1rAkP+CTPZgkOCX1iawDpXvnO7dEg8H8LexYOoCpRTIk0q4pB5bq1gL/GJRqw
         XFhezP2QKp9vfR7d1k8/+OSMmOzr90ILQPMENAofx2xkMnX+WgHWb5uHi9uwho74Bmh0
         uZqA==
X-Gm-Message-State: AO0yUKViyAagDN97YMWewXtFxvWch83M3FAhXvXONnW4kAqE7t1T76Te
	pThSMiwkJkoPs935nVDQmaVNwQ==
X-Google-Smtp-Source: AK7set+Cme49xULbeUvBE9RVSvhB4aDvKFF0sWuGFJ6rilNHj3MTFMavhArsApfIKncV0218UZWksA==
X-Received: by 2002:a5d:6d8b:0:b0:2bf:dcfb:b58a with SMTP id l11-20020a5d6d8b000000b002bfdcfbb58amr26988602wrs.68.1675697699115;
        Mon, 06 Feb 2023 07:34:59 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id e12-20020a5d500c000000b002c3ea9655easm2197317wrt.108.2023.02.06.07.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 07:34:58 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] ASoC: dt-bindings: meson: convert axg tdm formatters to schema
Date: Mon,  6 Feb 2023 16:34:44 +0100
Message-Id: <20230206153449.596326-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230206153449.596326-1-jbrunet@baylibre.com>
References: <20230206153449.596326-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_073502_378241_1758BE0C 
X-CRM114-Status: GOOD (  15.41  )
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

Convert the DT binding documentation for the Amlogic tdm formatters to
schema.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../sound/amlogic,axg-tdm-formatters.txt      | 36 --------
 .../sound/amlogic,axg-tdm-formatters.yaml     | 88 +++++++++++++++++++
 2 files changed, 88 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
deleted file mode 100644
index 5996c0cd89c2..000000000000
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-* Amlogic Audio TDM formatters
-
-Required properties:
-- compatible: 'amlogic,axg-tdmin' or
-	      'amlogic,axg-tdmout' or
-	      'amlogic,g12a-tdmin' or
-	      'amlogic,g12a-tdmout' or
-	      'amlogic,sm1-tdmin' or
-	      'amlogic,sm1-tdmout
-- reg: physical base address of the controller and length of memory
-       mapped region.
-- clocks: list of clock phandle, one for each entry clock-names.
-- clock-names: should contain the following:
-  * "pclk"     : peripheral clock.
-  * "sclk"     : bit clock.
-  * "sclk_sel" : bit clock input multiplexer.
-  * "lrclk"    : sample clock
-  * "lrclk_sel": sample clock input multiplexer
-
-Optional property:
-- resets: phandle to the dedicated reset line of the tdm formatter.
-
-Example of TDMOUT_A on the S905X2 SoC:
-
-tdmout_a: audio-controller@500 {
-	compatible = "amlogic,axg-tdmout";
-	reg = <0x0 0x500 0x0 0x40>;
-	resets = <&clkc_audio AUD_RESET_TDMOUT_A>;
-	clocks = <&clkc_audio AUD_CLKID_TDMOUT_A>,
-		 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK>,
-		 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK_SEL>,
-		 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>,
-		 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>;
-	clock-names = "pclk", "sclk", "sclk_sel",
-		      "lrclk", "lrclk_sel";
-};
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
new file mode 100644
index 000000000000..719ca8fc98c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Audio AXG TDM formatters
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,g12a-tdmout
+      - amlogic,sm1-tdmout
+      - amlogic,axg-tdmout
+      - amlogic,g12a-tdmin
+      - amlogic,sm1-tdmin
+      - amlogic,axg-tdmin
+
+  clocks:
+    items:
+      - description: Peripheral clock
+      - description: Bit clock
+      - description: Bit clock input multiplexer
+      - description: Sample clock
+      - description: Sample clock input multiplexer
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: sclk
+      - const: sclk_sel
+      - const: lrclk
+      - const: lrclk_sel
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+allOf:
+  - $ref: component-common.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,g12a-tdmin
+              - amlogic,sm1-tdmin
+              - amlogic,g12a-tdmout
+              - amlogic,sm1-tdmout
+    then:
+      required:
+        - resets
+
+    else:
+      properties:
+        resets: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/axg-audio-clkc.h>
+    #include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
+
+    audio-controller@500 {
+        compatible = "amlogic,g12a-tdmout";
+        reg = <0x500 0x40>;
+        resets = <&clkc_audio AUD_RESET_TDMOUT_A>;
+        clocks = <&clkc_audio AUD_CLKID_TDMOUT_A>,
+                 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK>,
+                 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK_SEL>,
+                 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>,
+                 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>;
+        clock-names = "pclk", "sclk", "sclk_sel",
+                      "lrclk", "lrclk_sel";
+    };
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
