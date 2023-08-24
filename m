Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5493EC71153
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Aug 2023 16:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y7stZuvlsGa++BeQ4iiNmGvv5yZfhlg9cBP3aGWrBHg=; b=fJc44LfKuFzhCt
	npez0Jc8d1SenFpAV+AjEt0xmcvVFUY5LRCYFqR0rUUG7WIW6nMCQwMAbgmaug6K8dWAMOAA5AoVp
	cMogtUc670sbwp/D0KspC7x9hcLVhSENMW/5yty90a+QovllT8sZKUgIwBOjMgWuAdXl/bB/zwJo0
	RNeh58dy+83+uBxz8BgPhIu+NKQ7qaQGHaE8nEn2iPM8zFT0Fvnv9Urb/+Jmwdr62s48+xY+fO3Vc
	xyUJo3PRNpzjzkfMPGjtEmv8CMRMXy8UALUaaLyvi3xAThIKl3q0pQsH+myVSo79Olk5Ju8QWwG1T
	Hj/f0ELCCUHX/a6DhTxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZDUO-003UD4-1t;
	Thu, 24 Aug 2023 16:47:20 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZDUJ-003UB6-2i
	for linux-amlogic@lists.infradead.org;
	Thu, 24 Aug 2023 16:47:19 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-401b3ea0656so347105e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 24 Aug 2023 09:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692895633; x=1693500433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2EvVczCSuUG1dXsNAF6+71rd6RXjkN2oapDkjlIssOs=;
        b=RyXAG50F6hn+1yLt8VNrrY+dgwQQX9yTg5FXP8LuLL3NdZJUUT9ogqDIIz+Jqty6KV
         scjK8thkm3bf+KrWEnz2Ts5KmY8sUIeo5zvkjyvmnA/0LB+ERqIk410cDbFok8J8Ca1d
         p7Kybb2TTfUcZvzzzlUhuyslqmDQrR0Cq7/Af3g1g9aH5/qjCLY4Cf6/HuzFh2lLBJkr
         89mpB/FTvn9//umfd+FdV/Ub5F6Ok75Etr5ZsytGVqdpkvNtHBTFBKa86ddhh4hZSp9X
         OKYbkUFkhxJnZzuxl0IabStV8vePLrncLDikazN/dxmI1peDicmDB2cArhKdwjkD58P1
         XIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692895633; x=1693500433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2EvVczCSuUG1dXsNAF6+71rd6RXjkN2oapDkjlIssOs=;
        b=C+VYZkp81ses/5vplbJXlzjBQjyXsVNyf2oEEVGKNNXGyweZX6TvVIfXtDgUOsmZFz
         mMjRGFo4ZduJ4uMEXGY9RNBFIXeslfDfZUlaSOlzWXsPioi2zGPfA1KElKPreVWTUwGn
         gWiCkisR5llUthJiL4Gg9DT5pMQCjFALRYjvjznjXNjQF1YVBMLTYvXn9HEBFZ7QBe3H
         G0RlefvgUOhyY13/avorIdUUrjBD6UcQSDI8YI25XYN/Wm6JN21gsnAqQrcq+ZWNBGl6
         /5/3zjujuq+QvxxZ+gqTm0PTxuVLUfF4KuOFpGnXIslwCypSEFKTLHpSJS19j4K2bjN/
         PYiw==
X-Gm-Message-State: AOJu0YzEUkIHg3baG0ODfy5rof2BPOiYsHtPp6174vcDTMCpHT21GN8k
	itY5s1wvYYlg3WswPuC82M1bKQ==
X-Google-Smtp-Source: AGHT+IExRJs/qGH+i/kd6Ktcz1lqMKQ7lAX5u5Fyz8UxNkGrr12wTZVMNRXW+bPgiwCIxopKVSshPA==
X-Received: by 2002:a7b:cb41:0:b0:3fe:1b4e:c484 with SMTP id v1-20020a7bcb41000000b003fe1b4ec484mr12566755wmj.5.1692895632749;
        Thu, 24 Aug 2023 09:47:12 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:d046:70c0:38b7:4ca3])
        by smtp.googlemail.com with ESMTPSA id n17-20020a1c7211000000b003feef5b0baesm3111967wmc.26.2023.08.24.09.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 09:47:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@mailbox.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2] dt-bindings: clock: meson: Convert axg-audio-clkc to YAML format
Date: Thu, 24 Aug 2023 18:46:49 +0200
Message-Id: <20230824164649.2914789-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_094716_111033_DFCE6662 
X-CRM114-Status: GOOD (  17.63  )
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

From: Alexander Stein <alexander.stein@mailbox.org>

Convert Amlogic AXG Audio Clock Controller binding to yaml.

Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/clock/amlogic,axg-audio-clkc.txt |  59 --
 .../clock/amlogic,axg-audio-clkc.yaml         | 917 ++++++++++++++++++
 2 files changed, 917 insertions(+), 59 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml

diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
deleted file mode 100644
index 3a8948c04bc9..000000000000
--- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
+++ /dev/null
@@ -1,59 +0,0 @@
-* Amlogic AXG Audio Clock Controllers
-
-The Amlogic AXG audio clock controller generates and supplies clock to the
-other elements of the audio subsystem, such as fifos, i2s, spdif and pdm
-devices.
-
-Required Properties:
-
-- compatible	: should be "amlogic,axg-audio-clkc" for the A113X and A113D,
-		  "amlogic,g12a-audio-clkc" for G12A,
-		  "amlogic,sm1-audio-clkc" for S905X3.
-- reg		: physical base address of the clock controller and length of
-		  memory mapped region.
-- clocks	: a list of phandle + clock-specifier pairs for the clocks listed
-		  in clock-names.
-- clock-names	: must contain the following:
-		  * "pclk" - Main peripheral bus clock
-		  may contain the following:
-		  * "mst_in[0-7]" - 8 input plls to generate clock signals
-		  * "slv_sclk[0-9]" - 10 slave bit clocks provided by external
-				      components.
-		  * "slv_lrclk[0-9]" - 10 slave sample clocks provided by external
-				       components.
-- resets	: phandle of the internal reset line
-- #clock-cells	: should be 1.
-- #reset-cells  : should be 1 on the g12a (and following) soc family
-
-Each clock is assigned an identifier and client nodes can use this identifier
-to specify the clock which they consume. All available clocks are defined as
-preprocessor macros in the dt-bindings/clock/axg-audio-clkc.h header and can be
-used in device tree sources.
-
-Example:
-
-clkc_audio: clock-controller@0 {
-	compatible = "amlogic,axg-audio-clkc";
-	reg = <0x0 0x0 0x0 0xb4>;
-	#clock-cells = <1>;
-
-	clocks = <&clkc CLKID_AUDIO>,
-		 <&clkc CLKID_MPLL0>,
-		 <&clkc CLKID_MPLL1>,
-		 <&clkc CLKID_MPLL2>,
-		 <&clkc CLKID_MPLL3>,
-		 <&clkc CLKID_HIFI_PLL>,
-		 <&clkc CLKID_FCLK_DIV3>,
-		 <&clkc CLKID_FCLK_DIV4>,
-		 <&clkc CLKID_GP0_PLL>;
-	clock-names = "pclk",
-		      "mst_in0",
-		      "mst_in1",
-		      "mst_in2",
-		      "mst_in3",
-		      "mst_in4",
-		      "mst_in5",
-		      "mst_in6",
-		      "mst_in7";
-	resets = <&reset RESET_AUDIO>;
-};
diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
new file mode 100644
index 000000000000..5ae2ff4efe11
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
@@ -0,0 +1,917 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic AXG Audio Clock Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+description:
+  The Amlogic AXG audio clock controller generates and supplies clock to the
+  other elements of the audio subsystem, such as fifos, i2s, spdif and pdm
+  devices.
+
+properties:
+  compatible:
+    enum:
+      - amlogic,axg-audio-clkc
+      - amlogic,g12a-audio-clkc
+      - amlogic,sm1-audio-clkc
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 29
+
+  # All clocks except pclk are optional inputs of the controller
+  # which may or may not be wired in depending on SoC variants, boards config, etc ...
+  # The order in which those clocks appear is unpredictable and does not matter.
+  # Lacking a better way to describe this, the optional clocks are repeated 28 times.
+  clock-names:
+    minItems: 1
+    items:
+      - const: pclk
+      - enum:
+          - mst_in0
+          - mst_in1
+          - mst_in2
+          - mst_in3
+          - mst_in4
+          - mst_in5
+          - mst_in6
+          - mst_in7
+          - slv_sclk0
+          - slv_sclk1
+          - slv_sclk2
+          - slv_sclk3
+          - slv_sclk4
+          - slv_sclk5
+          - slv_sclk6
+          - slv_sclk7
+          - slv_sclk8
+          - slv_sclk9
+          - slv_lrclk0
+          - slv_lrclk1
+          - slv_lrclk2
+          - slv_lrclk3
+          - slv_lrclk4
+          - slv_lrclk5
+          - slv_lrclk6
+          - slv_lrclk7
+          - slv_lrclk8
+          - slv_lrclk9
+      - enum:
+          - mst_in0
+          - mst_in1
+          - mst_in2
+          - mst_in3
+          - mst_in4
+          - mst_in5
+          - mst_in6
+          - mst_in7
+          - slv_sclk0
+          - slv_sclk1
+          - slv_sclk2
+          - slv_sclk3
+          - slv_sclk4
+          - slv_sclk5
+          - slv_sclk6
+          - slv_sclk7
+          - slv_sclk8
+          - slv_sclk9
+          - slv_lrclk0
+          - slv_lrclk1
+          - slv_lrclk2
+          - slv_lrclk3
+          - slv_lrclk4
+          - slv_lrclk5
+          - slv_lrclk6
+          - slv_lrclk7
+          - slv_lrclk8
+          - slv_lrclk9
+      - enum:
+          - mst_in0
+          - mst_in1
+          - mst_in2
+          - mst_in3
+          - mst_in4
+          - mst_in5
+          - mst_in6
+          - mst_in7
+          - slv_sclk0
+          - slv_sclk1
+          - slv_sclk2
+          - slv_sclk3
+          - slv_sclk4
+          - slv_sclk5
+          - slv_sclk6
+          - slv_sclk7
+          - slv_sclk8
+          - slv_sclk9
+          - slv_lrclk0
+          - slv_lrclk1
+          - slv_lrclk2
+          - slv_lrclk3
+          - slv_lrclk4
+          - slv_lrclk5
+          - slv_lrclk6
+          - slv_lrclk7
+          - slv_lrclk8
+          - slv_lrclk9
+      - enum:
+          - mst_in0
+          - mst_in1
+          - mst_in2
+          - mst_in3
+          - mst_in4
+          - mst_in5
+          - mst_in6
+          - mst_in7
+          - slv_sclk0
+          - slv_sclk1
+          - slv_sclk2
+          - slv_sclk3
+          - slv_sclk4
+          - slv_sclk5
+          - slv_sclk6
+          - slv_sclk7
+          - slv_sclk8
+          - slv_sclk9
+          - slv_lrclk0
+          - slv_lrclk1
+          - slv_lrclk2
+          - slv_lrclk3
+          - slv_lrclk4
+          - slv_lrclk5
+          - slv_lrclk6
+          - slv_lrclk7
+          - slv_lrclk8
+          - slv_lrclk9
+      - enum:
+          - mst_in0
+          - mst_in1
+          - mst_in2
+          - mst_in3
+          - mst_in4
+          - mst_in5
+          - mst_in6
+          - mst_in7
+          - slv_sclk0
+          - slv_sclk1
+          - slv_sclk2
+          - slv_sclk3
+          - slv_sclk4
+          - slv_sclk5
+          - slv_sclk6
+          - slv_sclk7
+          - slv_sclk8
+          - slv_sclk9
+          - slv_lrclk0
+          - slv_lrclk1
+          - slv_lrclk2
+          - slv_lrclk3
+          - slv_lrclk4
+          - slv_lrclk5
+          - slv_lrclk6
+          - slv_lrclk7
+          - slv_lrclk8
+          - slv_lrclk9
+      - enum:
+          - mst_in0
+          - mst_in1
+          - mst_in2
+          - mst_in3
+          - mst_in4
+          - mst_in5
+          - mst_in6
+          - mst_in7
+          - slv_sclk0
+          - slv_sclk1
+          - slv_sclk2
+          - slv_sclk3
+          - slv_sclk4
+          - slv_sclk5
+          - slv_sclk6
+          - slv_sclk7
+          - slv_sclk8
+          - slv_sclk9
+          - slv_lrclk0
+          - slv_lrclk1
+          - slv_lrclk2
+          - slv_lrclk3
+          - slv_lrclk4
+          - slv_lrclk5
+          - slv_lrclk6
+          - slv_lrclk7
+          - slv_lrclk8
+          - slv_lrclk9
+      - enum:
+          - mst_in0
+          - mst_in1
+          - mst_in2
+          - mst_in3
+          - mst_in4
+          - mst_in5
+          - mst_in6
+          - mst_in7
+          - slv_sclk0
+          - slv_sclk1
+          - slv_sclk2
+          - slv_sclk3
+          - slv_sclk4
+          - slv_sclk5
+          - slv_sclk6
+          - slv_sclk7
+          - slv_sclk8
+          - slv_sclk9
+          - slv_lrclk0
+          - slv_lrclk1
+          - slv_lrclk2
+          - slv_lrclk3
+          - slv_lrclk4
+          - slv_lrclk5
+          - slv_lrclk6
+          - slv_lrclk7
+          - slv_lrclk8
+          - slv_lrclk9
+      - enum:
+          - mst_in0
+          - mst_in1
+          - mst_in2
+          - mst_in3
+          - mst_in4
+          - mst_in5
+          - mst_in6
+          - mst_in7
+          - slv_sclk0
+          - slv_sclk1
+          - slv_sclk2
+          - slv_sclk3
+          - slv_sclk4
+          - slv_sclk5
+          - slv_sclk6
+          - slv_sclk7
+          - slv_sclk8
+          - slv_sclk9
+          - slv_lrclk0
+          - slv_lrclk1
+          - slv_lrclk2
+          - slv_lrclk3
+          - slv_lrclk4
+          - slv_lrclk5
+          - slv_lrclk6
+          - slv_lrclk7
+          - slv_lrclk8
+          - slv_lrclk9
+      - enum:
+          - mst_in0
+          - mst_in1
+          - mst_in2
+          - mst_in3
+          - mst_in4
+          - mst_in5
+          - mst_in6
+          - mst_in7
+          - slv_sclk0
+          - slv_sclk1
+          - slv_sclk2
+          - slv_sclk3
+          - slv_sclk4
+          - slv_sclk5
+          - slv_sclk6
+          - slv_sclk7
+          - slv_sclk8
+          - slv_sclk9
+          - slv_lrclk0
+          - slv_lrclk1
+          - slv_lrclk2
+          - slv_lrclk3
+          - slv_lrclk4
+          - slv_lrclk5
+          - slv_lrclk6
+          - slv_lrclk7
+          - slv_lrclk8
+          - slv_lrclk9
+      - enum:
+          - mst_in0
+          - mst_in1
+          - mst_in2
+          - mst_in3
+          - mst_in4
+          - mst_in5
+          - mst_in6
+          - mst_in7
+          - slv_sclk0
+          - slv_sclk1
+          - slv_sclk2
+          - slv_sclk3
+          - slv_sclk4
+          - slv_sclk5
+          - slv_sclk6
+          - slv_sclk7
+          - slv_sclk8
+          - slv_sclk9
+          - slv_lrclk0
+          - slv_lrclk1
+          - slv_lrclk2
+          - slv_lrclk3
+          - slv_lrclk4
+          - slv_lrclk5
+          - slv_lrclk6
+          - slv_lrclk7
+          - slv_lrclk8
+          - slv_lrclk9
+      - enum:
+          - mst_in0
+          - mst_in1
+          - mst_in2
+          - mst_in3
+          - mst_in4
+          - mst_in5
+          - mst_in6
+          - mst_in7
+          - slv_sclk0
+          - slv_sclk1
+          - slv_sclk2
+          - slv_sclk3
+          - slv_sclk4
+          - slv_sclk5
+          - slv_sclk6
+          - slv_sclk7
+          - slv_sclk8
+          - slv_sclk9
+          - slv_lrclk0
+          - slv_lrclk1
+          - slv_lrclk2
+          - slv_lrclk3
+          - slv_lrclk4
+          - slv_lrclk5
+          - slv_lrclk6
+          - slv_lrclk7
+          - slv_lrclk8
+          - slv_lrclk9
+      - enum:
+          - mst_in0
+          - mst_in1
+          - mst_in2
+          - mst_in3
+          - mst_in4
+          - mst_in5
+          - mst_in6
+          - mst_in7
+          - slv_sclk0
+          - slv_sclk1
+          - slv_sclk2
+          - slv_sclk3
+          - slv_sclk4
+          - slv_sclk5
+          - slv_sclk6
+          - slv_sclk7
+          - slv_sclk8
+          - slv_sclk9
+          - slv_lrclk0
+          - slv_lrclk1
+          - slv_lrclk2
+          - slv_lrclk3
+          - slv_lrclk4
+          - slv_lrclk5
+          - slv_lrclk6
+          - slv_lrclk7
+          - slv_lrclk8
+          - slv_lrclk9
+      - enum:
+          - mst_in0
+          - mst_in1
+          - mst_in2
+          - mst_in3
+          - mst_in4
+          - mst_in5
+          - mst_in6
+          - mst_in7
+          - slv_sclk0
+          - slv_sclk1
+          - slv_sclk2
+          - slv_sclk3
+          - slv_sclk4
+          - slv_sclk5
+          - slv_sclk6
+          - slv_sclk7
+          - slv_sclk8
+          - slv_sclk9
+          - slv_lrclk0
+          - slv_lrclk1
+          - slv_lrclk2
+          - slv_lrclk3
+          - slv_lrclk4
+          - slv_lrclk5
+          - slv_lrclk6
+          - slv_lrclk7
+          - slv_lrclk8
+          - slv_lrclk9
+      - enum:
+          - mst_in0
+          - mst_in1
+          - mst_in2
+          - mst_in3
+          - mst_in4
+          - mst_in5
+          - mst_in6
+          - mst_in7
+          - slv_sclk0
+          - slv_sclk1
+          - slv_sclk2
+          - slv_sclk3
+          - slv_sclk4
+          - slv_sclk5
+          - slv_sclk6
+          - slv_sclk7
+          - slv_sclk8
+          - slv_sclk9
+          - slv_lrclk0
+          - slv_lrclk1
+          - slv_lrclk2
+          - slv_lrclk3
+          - slv_lrclk4
+          - slv_lrclk5
+          - slv_lrclk6
+          - slv_lrclk7
+          - slv_lrclk8
+          - slv_lrclk9
+      - enum:
+          - mst_in0
+          - mst_in1
+          - mst_in2
+          - mst_in3
+          - mst_in4
+          - mst_in5
+          - mst_in6
+          - mst_in7
+          - slv_sclk0
+          - slv_sclk1
+          - slv_sclk2
+          - slv_sclk3
+          - slv_sclk4
+          - slv_sclk5
+          - slv_sclk6
+          - slv_sclk7
+          - slv_sclk8
+          - slv_sclk9
+          - slv_lrclk0
+          - slv_lrclk1
+          - slv_lrclk2
+          - slv_lrclk3
+          - slv_lrclk4
+          - slv_lrclk5
+          - slv_lrclk6
+          - slv_lrclk7
+          - slv_lrclk8
+          - slv_lrclk9
+      - enum:
+          - mst_in0
+          - mst_in1
+          - mst_in2
+          - mst_in3
+          - mst_in4
+          - mst_in5
+          - mst_in6
+          - mst_in7
+          - slv_sclk0
+          - slv_sclk1
+          - slv_sclk2
+          - slv_sclk3
+          - slv_sclk4
+          - slv_sclk5
+          - slv_sclk6
+          - slv_sclk7
+          - slv_sclk8
+          - slv_sclk9
+          - slv_lrclk0
+          - slv_lrclk1
+          - slv_lrclk2
+          - slv_lrclk3
+          - slv_lrclk4
+          - slv_lrclk5
+          - slv_lrclk6
+          - slv_lrclk7
+          - slv_lrclk8
+          - slv_lrclk9
+      - enum:
+          - mst_in0
+          - mst_in1
+          - mst_in2
+          - mst_in3
+          - mst_in4
+          - mst_in5
+          - mst_in6
+          - mst_in7
+          - slv_sclk0
+          - slv_sclk1
+          - slv_sclk2
+          - slv_sclk3
+          - slv_sclk4
+          - slv_sclk5
+          - slv_sclk6
+          - slv_sclk7
+          - slv_sclk8
+          - slv_sclk9
+          - slv_lrclk0
+          - slv_lrclk1
+          - slv_lrclk2
+          - slv_lrclk3
+          - slv_lrclk4
+          - slv_lrclk5
+          - slv_lrclk6
+          - slv_lrclk7
+          - slv_lrclk8
+          - slv_lrclk9
+      - enum:
+          - mst_in0
+          - mst_in1
+          - mst_in2
+          - mst_in3
+          - mst_in4
+          - mst_in5
+          - mst_in6
+          - mst_in7
+          - slv_sclk0
+          - slv_sclk1
+          - slv_sclk2
+          - slv_sclk3
+          - slv_sclk4
+          - slv_sclk5
+          - slv_sclk6
+          - slv_sclk7
+          - slv_sclk8
+          - slv_sclk9
+          - slv_lrclk0
+          - slv_lrclk1
+          - slv_lrclk2
+          - slv_lrclk3
+          - slv_lrclk4
+          - slv_lrclk5
+          - slv_lrclk6
+          - slv_lrclk7
+          - slv_lrclk8
+          - slv_lrclk9
+      - enum:
+          - mst_in0
+          - mst_in1
+          - mst_in2
+          - mst_in3
+          - mst_in4
+          - mst_in5
+          - mst_in6
+          - mst_in7
+          - slv_sclk0
+          - slv_sclk1
+          - slv_sclk2
+          - slv_sclk3
+          - slv_sclk4
+          - slv_sclk5
+          - slv_sclk6
+          - slv_sclk7
+          - slv_sclk8
+          - slv_sclk9
+          - slv_lrclk0
+          - slv_lrclk1
+          - slv_lrclk2
+          - slv_lrclk3
+          - slv_lrclk4
+          - slv_lrclk5
+          - slv_lrclk6
+          - slv_lrclk7
+          - slv_lrclk8
+          - slv_lrclk9
+      - enum:
+          - mst_in0
+          - mst_in1
+          - mst_in2
+          - mst_in3
+          - mst_in4
+          - mst_in5
+          - mst_in6
+          - mst_in7
+          - slv_sclk0
+          - slv_sclk1
+          - slv_sclk2
+          - slv_sclk3
+          - slv_sclk4
+          - slv_sclk5
+          - slv_sclk6
+          - slv_sclk7
+          - slv_sclk8
+          - slv_sclk9
+          - slv_lrclk0
+          - slv_lrclk1
+          - slv_lrclk2
+          - slv_lrclk3
+          - slv_lrclk4
+          - slv_lrclk5
+          - slv_lrclk6
+          - slv_lrclk7
+          - slv_lrclk8
+          - slv_lrclk9
+      - enum:
+          - mst_in0
+          - mst_in1
+          - mst_in2
+          - mst_in3
+          - mst_in4
+          - mst_in5
+          - mst_in6
+          - mst_in7
+          - slv_sclk0
+          - slv_sclk1
+          - slv_sclk2
+          - slv_sclk3
+          - slv_sclk4
+          - slv_sclk5
+          - slv_sclk6
+          - slv_sclk7
+          - slv_sclk8
+          - slv_sclk9
+          - slv_lrclk0
+          - slv_lrclk1
+          - slv_lrclk2
+          - slv_lrclk3
+          - slv_lrclk4
+          - slv_lrclk5
+          - slv_lrclk6
+          - slv_lrclk7
+          - slv_lrclk8
+          - slv_lrclk9
+      - enum:
+          - mst_in0
+          - mst_in1
+          - mst_in2
+          - mst_in3
+          - mst_in4
+          - mst_in5
+          - mst_in6
+          - mst_in7
+          - slv_sclk0
+          - slv_sclk1
+          - slv_sclk2
+          - slv_sclk3
+          - slv_sclk4
+          - slv_sclk5
+          - slv_sclk6
+          - slv_sclk7
+          - slv_sclk8
+          - slv_sclk9
+          - slv_lrclk0
+          - slv_lrclk1
+          - slv_lrclk2
+          - slv_lrclk3
+          - slv_lrclk4
+          - slv_lrclk5
+          - slv_lrclk6
+          - slv_lrclk7
+          - slv_lrclk8
+          - slv_lrclk9
+      - enum:
+          - mst_in0
+          - mst_in1
+          - mst_in2
+          - mst_in3
+          - mst_in4
+          - mst_in5
+          - mst_in6
+          - mst_in7
+          - slv_sclk0
+          - slv_sclk1
+          - slv_sclk2
+          - slv_sclk3
+          - slv_sclk4
+          - slv_sclk5
+          - slv_sclk6
+          - slv_sclk7
+          - slv_sclk8
+          - slv_sclk9
+          - slv_lrclk0
+          - slv_lrclk1
+          - slv_lrclk2
+          - slv_lrclk3
+          - slv_lrclk4
+          - slv_lrclk5
+          - slv_lrclk6
+          - slv_lrclk7
+          - slv_lrclk8
+          - slv_lrclk9
+      - enum:
+          - mst_in0
+          - mst_in1
+          - mst_in2
+          - mst_in3
+          - mst_in4
+          - mst_in5
+          - mst_in6
+          - mst_in7
+          - slv_sclk0
+          - slv_sclk1
+          - slv_sclk2
+          - slv_sclk3
+          - slv_sclk4
+          - slv_sclk5
+          - slv_sclk6
+          - slv_sclk7
+          - slv_sclk8
+          - slv_sclk9
+          - slv_lrclk0
+          - slv_lrclk1
+          - slv_lrclk2
+          - slv_lrclk3
+          - slv_lrclk4
+          - slv_lrclk5
+          - slv_lrclk6
+          - slv_lrclk7
+          - slv_lrclk8
+          - slv_lrclk9
+      - enum:
+          - mst_in0
+          - mst_in1
+          - mst_in2
+          - mst_in3
+          - mst_in4
+          - mst_in5
+          - mst_in6
+          - mst_in7
+          - slv_sclk0
+          - slv_sclk1
+          - slv_sclk2
+          - slv_sclk3
+          - slv_sclk4
+          - slv_sclk5
+          - slv_sclk6
+          - slv_sclk7
+          - slv_sclk8
+          - slv_sclk9
+          - slv_lrclk0
+          - slv_lrclk1
+          - slv_lrclk2
+          - slv_lrclk3
+          - slv_lrclk4
+          - slv_lrclk5
+          - slv_lrclk6
+          - slv_lrclk7
+          - slv_lrclk8
+          - slv_lrclk9
+      - enum:
+          - mst_in0
+          - mst_in1
+          - mst_in2
+          - mst_in3
+          - mst_in4
+          - mst_in5
+          - mst_in6
+          - mst_in7
+          - slv_sclk0
+          - slv_sclk1
+          - slv_sclk2
+          - slv_sclk3
+          - slv_sclk4
+          - slv_sclk5
+          - slv_sclk6
+          - slv_sclk7
+          - slv_sclk8
+          - slv_sclk9
+          - slv_lrclk0
+          - slv_lrclk1
+          - slv_lrclk2
+          - slv_lrclk3
+          - slv_lrclk4
+          - slv_lrclk5
+          - slv_lrclk6
+          - slv_lrclk7
+          - slv_lrclk8
+          - slv_lrclk9
+      - enum:
+          - mst_in0
+          - mst_in1
+          - mst_in2
+          - mst_in3
+          - mst_in4
+          - mst_in5
+          - mst_in6
+          - mst_in7
+          - slv_sclk0
+          - slv_sclk1
+          - slv_sclk2
+          - slv_sclk3
+          - slv_sclk4
+          - slv_sclk5
+          - slv_sclk6
+          - slv_sclk7
+          - slv_sclk8
+          - slv_sclk9
+          - slv_lrclk0
+          - slv_lrclk1
+          - slv_lrclk2
+          - slv_lrclk3
+          - slv_lrclk4
+          - slv_lrclk5
+          - slv_lrclk6
+          - slv_lrclk7
+          - slv_lrclk8
+          - slv_lrclk9
+      - enum:
+          - mst_in0
+          - mst_in1
+          - mst_in2
+          - mst_in3
+          - mst_in4
+          - mst_in5
+          - mst_in6
+          - mst_in7
+          - slv_sclk0
+          - slv_sclk1
+          - slv_sclk2
+          - slv_sclk3
+          - slv_sclk4
+          - slv_sclk5
+          - slv_sclk6
+          - slv_sclk7
+          - slv_sclk8
+          - slv_sclk9
+          - slv_lrclk0
+          - slv_lrclk1
+          - slv_lrclk2
+          - slv_lrclk3
+          - slv_lrclk4
+          - slv_lrclk5
+          - slv_lrclk6
+          - slv_lrclk7
+          - slv_lrclk8
+          - slv_lrclk9
+
+  resets:
+    description: internal reset line
+
+required:
+  - compatible
+  - '#clock-cells'
+  - reg
+  - clocks
+  - clock-names
+  - resets
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,g12a-audio-clkc
+              - amlogic,sm1-audio-clkc
+    then:
+      required:
+        - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/axg-clkc.h>
+    #include <dt-bindings/reset/amlogic,meson-axg-reset.h>
+    apb {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clkc_audio: clock-controller@0 {
+        compatible = "amlogic,axg-audio-clkc";
+        reg = <0x0 0x0 0x0 0xb4>;
+        #clock-cells = <1>;
+
+        clocks = <&clkc CLKID_AUDIO>,
+            <&clkc CLKID_MPLL0>,
+            <&clkc CLKID_MPLL1>,
+            <&clkc CLKID_MPLL2>,
+            <&clkc CLKID_HIFI_PLL>,
+            <&clkc CLKID_FCLK_DIV3>,
+            <&clkc CLKID_FCLK_DIV4>,
+            <&clkc CLKID_GP0_PLL>,
+            <&codec_frame_clk>;
+        clock-names = "pclk",
+            "mst_in0",
+            "mst_in1",
+            "mst_in2",
+            "mst_in4",
+            "mst_in5",
+            "mst_in6",
+            "mst_in7",
+            "slv_lrclk1";
+        resets = <&reset RESET_AUDIO>;
+      };
+    };
-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
