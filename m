Return-Path: <SRS0=TU6n=4M=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49CD2C11D35
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Feb 2020 14:58:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 150622072D
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Feb 2020 14:58:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rU0WRHDp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BxwsppZ2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 150622072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BNX48vx+ztgVsVbB14VOzQwX5G7dpIoJ3v/U8yjaED4=; b=rU0WRHDpTSTVmF
	R3ongs38MxCDuTkZ+c7IkChDcXfaRDOvso33oWbpxc00ApHvqT1/z3X+8sXBvd8Z0gcZjkPFbyYZO
	Ho+u/OVksf5U527PvHfv/8g9lNFJHKvQWs7iPUEqi56e2gWehvFQwfz3hNyMZxyP80bcBEw8T0wcO
	Jv/LR+xBrfaYS5K3Lf9qE8PaLpspCKFAITqDmHk13DiCqWO4oH8wKxiaPpNAAjELI8WsNjkgfnJ4s
	Z1tQwt97sv5jIgXIb2vU6Fn5hR6nfTLG15a82YNhBubR4UqTaD0YSfIy9l7Ixp1tSK7wEk/A2eX5O
	kQ2HOVCBTh1eYzLEIAyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6FC2-0004Bd-BY; Mon, 24 Feb 2020 14:58:46 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6FBq-0003x2-Dd
 for linux-amlogic@lists.infradead.org; Mon, 24 Feb 2020 14:58:36 +0000
Received: by mail-wr1-x444.google.com with SMTP id e8so10742797wrm.5
 for <linux-amlogic@lists.infradead.org>; Mon, 24 Feb 2020 06:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+m5Zk6ATehdxswy6Hjbn0kVD8RHIMq9I1KqtdFphR4Y=;
 b=BxwsppZ2TqEjT+8Z3y25ke1pudvOilFOi8pPUubmpCnhiDngRYPXdE94G7U9Ava7zQ
 RomwNhFUanS4atJGqdbEqofH6EZH/03ujPLOashF22t7WT2B1Fhp7Z9KFA+8uPmxzRMt
 0h2oPjI7KDMWdHsVDhW1N6Eu9/UVeLCDLPonER6wXezzegFK9KFX61o0pT2TOElUJex3
 gQv8ec3/kuemWFl7o+5ymRoCd6NmXdQ66o7/uaxH+5SIUtHSfr05mntPv7wZsULLI7Ij
 bWBoqaYzCjFr3npplC/8TRkuHWl35sd6nxfFn9P3WZ9X8q8LCuQOiF8stMRuF4ocpmby
 fbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+m5Zk6ATehdxswy6Hjbn0kVD8RHIMq9I1KqtdFphR4Y=;
 b=Aw7AevcZUCAzIbtxijWpYwFQrWpU1CufDKHPE+NF8bbuJSnncKlZRFRa8SudZCkcY7
 OXaqJ+uDbZAQCagxLEV4a/Kb9Xkczrf0OS2+ylzlknDMui9KJrQNTHbsRNLmcbmHnDvM
 Di8wp2BUmWrf+U82K7QLcA1F6JdAPF0Cqx5QTwHZZRehHVXImY0miwkJ4/54xYWEXDRk
 xn9q1ANxEni52p3GaY4InrSMe6Vl0bLv9tW2MlLkf6B4HRKV+mXsMF7cAI0AytlQaS0y
 4q2JWg3XF2Fz7R/f8N+Rb1x4u9YrX7ezXcjj7fECMvpKrHDCxGyAZ2iNC1y6io571PTR
 aTIQ==
X-Gm-Message-State: APjAAAUR0EBlmGiDCbtFlT1plCPL5ZbTlRf44rmPuxVSX3wGPJMVU1cd
 ypNT5jivqK10PrAvpScAxHFYnQ==
X-Google-Smtp-Source: APXvYqwKJQRnmPqcIIix9h+Okty9D6LqCQRrxgqAPcpQ8cagQSHDEFG5tHJ6MlgBAUv48MiCgtTlPw==
X-Received: by 2002:a5d:6411:: with SMTP id z17mr70933271wru.57.1582556312782; 
 Mon, 24 Feb 2020 06:58:32 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j12sm8035127wrt.35.2020.02.24.06.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 06:58:32 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 7/9] ASoC: meson: convert axg spdif output to schema
Date: Mon, 24 Feb 2020 15:58:19 +0100
Message-Id: <20200224145821.262873-8-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200224145821.262873-1-jbrunet@baylibre.com>
References: <20200224145821.262873-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_065834_471662_66D0DC6F 
X-CRM114-Status: GOOD (  10.97  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Convert the DT binding documentation for the Amlogic axg spdif output to
schema.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,axg-spdifout.txt   | 25 ------
 .../bindings/sound/amlogic,axg-spdifout.yaml  | 77 +++++++++++++++++++
 2 files changed, 77 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.yaml

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
deleted file mode 100644
index 28381dd1f633..000000000000
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-* Amlogic Audio SPDIF Output
-
-Required properties:
-- compatible: 'amlogic,axg-spdifout' or
-	      'amlogic,g12a-spdifout' or
-	      'amlogic,sm1-spdifout'
-- clocks: list of clock phandle, one for each entry clock-names.
-- clock-names: should contain the following:
-  * "pclk" : peripheral clock.
-  * "mclk" : master clock
-- #sound-dai-cells: must be 0.
-
-Optional property:
-- resets: phandle to the dedicated reset line of the spdif output.
-
-Example on the A113 SoC:
-
-spdifout: audio-controller@480 {
-	compatible = "amlogic,axg-spdifout";
-	reg = <0x0 0x480 0x0 0x50>;
-	#sound-dai-cells = <0>;
-	clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
-		 <&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
-	clock-names = "pclk", "mclk";
-};
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.yaml
new file mode 100644
index 000000000000..9ac52916f88b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,axg-spdifout.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Audio AXG SPDIF Output
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+properties:
+  $nodename:
+    pattern: "^audio-controller@.*"
+
+  "#sound-dai-cells":
+    const: 0
+
+  compatible:
+    oneOf:
+      - items:
+        - const:
+            amlogic,axg-spdifout
+      - items:
+        - enum:
+          - amlogic,g12a-spdifout
+          - amlogic,sm1-spdifout
+        - const:
+            amlogic,axg-spdifout
+
+  clocks:
+    items:
+      - description: Peripheral clock
+      - description: SPDIF output master clock
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: mclk
+
+  reg:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: dedicated device reset line
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - amlogic,g12a-spdifout
+          - amlogic,sm1-spdifout
+then:
+  required:
+    - resets
+
+examples:
+  - |
+    #include <dt-bindings/clock/axg-audio-clkc.h>
+
+    spdifout: audio-controller@480 {
+    	compatible = "amlogic,axg-spdifout";
+        reg = <0x0 0x480 0x0 0x50>;
+        #sound-dai-cells = <0>;
+        clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
+                 <&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
+        clock-names = "pclk", "mclk";
+    };
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
