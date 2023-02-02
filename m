Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50907C05027
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Feb 2023 18:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eAkcH2fmOr1KOXvYcqecdB0Jk1JmJjWDAjidAmANRbo=; b=D4s2KRMOT10LW1
	96QLpWgaQJFrl5U8ji1K4olWvwQY4z/0CoBZvWy1f0+1WsZFXTzXRAEOTd0rxt3JjCsiLG/U1e+yf
	kyaqIDxIBTiGtrQtaM6k2ZyL5AqSrXuwWXRW3ndkpSOaVAX4laYCMmgJOhtBVBJmTBPx7zQJutZvW
	sWyMINrpdIUTNsf9Ht0oz6u1tJspPmpTB+1J3oUHsacAlL0LSV4ac3xBwd1+6HPean7/y63SZQEpV
	yUlEdxrqllEoheHAnA7fHYCtL0HYxSLjjH8mRepkHPqdwudhUluOjvWdR3b+SvNjWM/M/oZsftH//
	yAgiXHNAsRLhP1B1YJAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNeSn-00Gy3W-HH; Thu, 02 Feb 2023 18:37:37 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNeSl-00Gy1G-1S
	for linux-amlogic@lists.infradead.org; Thu, 02 Feb 2023 18:37:36 +0000
Received: by mail-wr1-x42e.google.com with SMTP id bk16so2535399wrb.11
        for <linux-amlogic@lists.infradead.org>; Thu, 02 Feb 2023 10:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZDf/HLHsmXllvXlzMaBba2wF4a3xInBovmR2gll1NE=;
        b=xaYuudaLyB+uAk3PVQ8DP1LP3TKOxSqkpwctcjT4Z0iVbrSjlIK7ROCuOD4TzGetXo
         tgqj0nGRsRQJe072REFgPgVjHQ61dQkyQ5aEa/e1iHKNSevRrsRIF1xECSFXNThvxi8q
         PwFwhy/U4yfMzR+lsF4xgGiPi+SKpVMSj4sxR3WM/+My7FdcSoHpJmJ23HL4wFjcipNM
         JTB+yER/k59c2hjSoR533p4BYEdcUx7B5RLfR0YaDmPSpm/sp83jQTcs18KIfbZhK2du
         ELJ9eRv3HiVXVpuad6m6/Z/hcVB7PWmib8ZJlJvx+Py4/mEjinnOAWxXh9fSxRK0LwYM
         NhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZDf/HLHsmXllvXlzMaBba2wF4a3xInBovmR2gll1NE=;
        b=hqhWDoIW81NBlwQG7xYr0fp4WlnDXx6/E83nnmjZzqah8ZYAdxJ3aDEKhnohdKZY3N
         iO37A+ojYVkWdzW7X0IXdCFY/vtO3J9BEJCRBvfNfqCSokjtr0UzHJYSgcZe4rz73+Mi
         y1PNcS48a5eR9qdfRtbPhzX78JoOXgJgyGaEUv0fspV5cT9FkJHXOa/6kXZHroFg9oue
         YQrNmH0ZCBf6FX+uOjaf1X8mJ5KUgojoVZkgn/MWiJlkSZi9TOgfl4hhIUeOvLRtQFto
         yHiE8XCWxNq7uRzd41fL9u0lwfsy8+7HjO9I7zLjHYgQY6/GA1XWOSkgUz7v74xnZacc
         499w==
X-Gm-Message-State: AO0yUKX/2DgrlIRp22MIA2uz178jZQcL2RTnO9jN27FFBm4+VSdwquXg
	TE+gIsPGoHyNiApQ00UwPke2/wKI/m1/mFGE
X-Google-Smtp-Source: AK7set87mrYHNE/0/I372ct8ZaVBEWpNKw4XOYrrrvcmO7iVSYhOhxapZ0+s93W5U33cXIJHeAn8Sg==
X-Received: by 2002:a5d:6da3:0:b0:2bf:ae11:c40c with SMTP id u3-20020a5d6da3000000b002bfae11c40cmr7784287wrs.32.1675363054576;
        Thu, 02 Feb 2023 10:37:34 -0800 (PST)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id p12-20020a5d48cc000000b00241fab5a296sm164664wrs.40.2023.02.02.10.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 10:37:34 -0800 (PST)
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
Subject: [PATCH 3/9] ASoC: dt-bindings: meson: convert axg tdm interface to schema
Date: Thu,  2 Feb 2023 19:36:47 +0100
Message-Id: <20230202183653.486216-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230202183653.486216-1-jbrunet@baylibre.com>
References: <20230202183653.486216-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_103735_099602_593A6F59 
X-CRM114-Status: GOOD (  14.95  )
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

Convert the DT binding documentation for the Amlogic tdm interface to
schema.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,axg-tdm-iface.txt  | 22 -------
 .../bindings/sound/amlogic,axg-tdm-iface.yaml | 59 +++++++++++++++++++
 2 files changed, 59 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
deleted file mode 100644
index cabfb26a5f22..000000000000
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-* Amlogic Audio TDM Interfaces
-
-Required properties:
-- compatible: 'amlogic,axg-tdm-iface'
-- clocks: list of clock phandle, one for each entry clock-names.
-- clock-names: should contain the following:
-  * "sclk" : bit clock.
-  * "lrclk": sample clock
-  * "mclk" : master clock
-	     -> optional if the interface is in clock slave mode.
-- #sound-dai-cells: must be 0.
-
-Example of TDM_A on the A113 SoC:
-
-tdmif_a: audio-controller@0 {
-	compatible = "amlogic,axg-tdm-iface";
-	#sound-dai-cells = <0>;
-	clocks = <&clkc_audio AUD_CLKID_MST_A_MCLK>,
-		 <&clkc_audio AUD_CLKID_MST_A_SCLK>,
-		 <&clkc_audio AUD_CLKID_MST_A_LRCLK>;
-	clock-names = "mclk", "sclk", "lrclk";
-};
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
new file mode 100644
index 000000000000..362414fc9a9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Audio TDM Interfaces
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  $nodename:
+    pattern: "^audio-controller-.*"
+
+  compatible:
+    items:
+      - const: 'amlogic,axg-tdm-iface'
+
+  "#sound-dai-cells":
+    const: 0
+
+  clocks:
+    minItems: 2
+    items:
+      - description: Bit clock
+      - description: Sample clock
+      - description: Master clock #optional
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: sclk
+      - const: lrclk
+      - const: mclk
+
+required:
+  - compatible
+  - "#sound-dai-cells"
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/axg-audio-clkc.h>
+
+    tdmif_a: audio-controller-0 {
+        compatible = "amlogic,axg-tdm-iface";
+        #sound-dai-cells = <0>;
+        clocks = <&clkc_audio AUD_CLKID_MST_A_SCLK>,
+                 <&clkc_audio AUD_CLKID_MST_A_LRCLK>,
+                 <&clkc_audio AUD_CLKID_MST_A_MCLK>;
+        clock-names = "sclk", "lrclk", "mclk";
+    };
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
