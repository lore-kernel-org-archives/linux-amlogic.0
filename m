Return-Path: <SRS0=deyy=4B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8CEC3B18C
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Feb 2020 20:58:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3C2320848
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Feb 2020 20:58:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g37d1WoX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3C2320848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=6ynxN+o1PPzip9xSMZ3UEAjVq50OdOnA5kHmyLc9Pgk=; b=g37
	d1WoX7B/b1ypS9HFNU9bMJ5V28maAXFRGerrmSVnSRkD3KRu8iGQj/40NSeXG2Omxcq0UTxzXpRDr
	ZfMRkArH2eIVmh9GPbCSfN2gBefluvO/r4C9uWa0kvIjPDbJS9hLIHUVICWy5N9nVQLQs+sTknQlK
	Tzm3gssgElpM/Mvz4BGI7y9snSecsL99t6QK33SdCh43dGSjIEp2h08eE1DWGvy1+6tOW0sJhi+gq
	djkshXlOKjn/yddxUrzO5GtF8UWIN8yjGZExhOYPuchAbHBtWPncOY20l2xIzg5dkmeolzxIL5g1C
	3mX/dYrGX37HkDVOYKWArY3SzBYv79g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2LZ9-0003qa-KP; Thu, 13 Feb 2020 20:58:31 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2LZ5-0003nl-8z
 for linux-amlogic@lists.infradead.org; Thu, 13 Feb 2020 20:58:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5D701045;
 Thu, 13 Feb 2020 12:58:26 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2904B3F6CF;
 Thu, 13 Feb 2020 12:58:26 -0800 (PST)
Date: Thu, 13 Feb 2020 20:58:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Applied "ASoC: meson: aiu: add audio output dt-bindings" to the asoc
 tree
In-Reply-To: <20200213155159.3235792-4-jbrunet@baylibre.com>
Message-Id: <applied-20200213155159.3235792-4-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200213_125827_406257_299AEE95 
X-CRM114-Status: GOOD (  15.57  )
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
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The patch

   ASoC: meson: aiu: add audio output dt-bindings

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 06b72824386795bf6f0a6ac0f0cfef6b7f0165c1 Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 13 Feb 2020 16:51:53 +0100
Subject: [PATCH] ASoC: meson: aiu: add audio output dt-bindings

Add the dt-bindings and documentation of the AIU audio controller.
This component provides most of the audio outputs found on the Amlogic
Gx SoC family.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20200213155159.3235792-4-jbrunet@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/sound/amlogic,aiu.yaml           | 111 ++++++++++++++++++
 include/dt-bindings/sound/meson-aiu.h         |  18 +++
 2 files changed, 129 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,aiu.yaml
 create mode 100644 include/dt-bindings/sound/meson-aiu.h

diff --git a/Documentation/devicetree/bindings/sound/amlogic,aiu.yaml b/Documentation/devicetree/bindings/sound/amlogic,aiu.yaml
new file mode 100644
index 000000000000..3ef7632dcb59
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,aiu.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic AIU audio output controller
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+properties:
+  $nodename:
+    pattern: "^audio-controller@.*"
+
+  "#sound-dai-cells":
+    const: 2
+
+  compatible:
+    items:
+      - enum:
+        - amlogic,aiu-gxbb
+        - amlogic,aiu-gxl
+      - const:
+          amlogic,aiu
+
+  clocks:
+    items:
+      - description: AIU peripheral clock
+      - description: I2S peripheral clock
+      - description: I2S output clock
+      - description: I2S master clock
+      - description: I2S mixer clock
+      - description: SPDIF peripheral clock
+      - description: SPDIF output clock
+      - description: SPDIF master clock
+      - description: SPDIF master clock multiplexer
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: i2s_pclk
+      - const: i2s_aoclk
+      - const: i2s_mclk
+      - const: i2s_mixer
+      - const: spdif_pclk
+      - const: spdif_aoclk
+      - const: spdif_mclk
+      - const: spdif_mclk_sel
+
+  interrupts:
+    items:
+      - description: I2S interrupt line
+      - description: SPDIF interrupt line
+
+  interrupt-names:
+    items:
+      - const: i2s
+      - const: spdif
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - reg
+  - resets
+
+examples:
+  - |
+    #include <dt-bindings/clock/gxbb-clkc.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
+
+    aiu: audio-controller@5400 {
+        compatible = "amlogic,aiu-gxl", "amlogic,aiu";
+        #sound-dai-cells = <2>;
+        reg = <0x0 0x5400 0x0 0x2ac>;
+        interrupts = <GIC_SPI 48 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "i2s", "spdif";
+        clocks = <&clkc CLKID_AIU_GLUE>,
+                 <&clkc CLKID_I2S_OUT>,
+                 <&clkc CLKID_AOCLK_GATE>,
+                 <&clkc CLKID_CTS_AMCLK>,
+                 <&clkc CLKID_MIXER_IFACE>,
+                 <&clkc CLKID_IEC958>,
+                 <&clkc CLKID_IEC958_GATE>,
+                 <&clkc CLKID_CTS_MCLK_I958>,
+                 <&clkc CLKID_CTS_I958>;
+        clock-names = "pclk",
+                      "i2s_pclk",
+                      "i2s_aoclk",
+                      "i2s_mclk",
+                      "i2s_mixer",
+                      "spdif_pclk",
+                      "spdif_aoclk",
+                      "spdif_mclk",
+                      "spdif_mclk_sel";
+        resets = <&reset RESET_AIU>;
+    };
+
diff --git a/include/dt-bindings/sound/meson-aiu.h b/include/dt-bindings/sound/meson-aiu.h
new file mode 100644
index 000000000000..1051b8af298b
--- /dev/null
+++ b/include/dt-bindings/sound/meson-aiu.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __DT_MESON_AIU_H
+#define __DT_MESON_AIU_H
+
+#define AIU_CPU			0
+#define AIU_HDMI		1
+#define AIU_ACODEC		2
+
+#define CPU_I2S_FIFO		0
+#define CPU_SPDIF_FIFO		1
+#define CPU_I2S_ENCODER		2
+#define CPU_SPDIF_ENCODER	3
+
+#define CTRL_I2S		0
+#define CTRL_PCM		1
+#define CTRL_OUT		2
+
+#endif /* __DT_MESON_AIU_H */
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
