Return-Path: <SRS0=deyy=4B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB4A3C3B189
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Feb 2020 20:58:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FF692467D
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Feb 2020 20:58:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qTpllsRU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FF692467D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=CDrAJjDxaaDgP5Zk6kiZHFzN9IdTqICEcq9a8RieHrM=; b=qTp
	llsRUKHUW3Qkk1X3EDiVU/vdwU80ycPnRZ2lUkuJze37PxpKXjAfK7IzfDbDEeLG1IA9h9n4k+yF9
	0vhOn+KcWk+BfDra/LoFSjWkrvjpeTmZ7uqb+2QSMoukrdCU5+sPZEg12DLNTtCdE9SDeVEDXOaBY
	ivw147ZUkGQL1RFZMSzE4yxsVL1wEqGc8JOPfXCLME9UFcpio8BWdmoqyTtCQQeyzOQ5N5E9C+Ym3
	/qVadiEQcfZ0FdA8zvuh+U7c4o6GlH60oJn2hQTvza38Ku6Mmt4W5XDBgYvmoirYzSgQvtUvGnphU
	p9psb0FbIZvu3fTZUuEIy+0u6q+utfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2LYk-0003Z2-EU; Thu, 13 Feb 2020 20:58:06 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2LYh-0003Wu-5I
 for linux-amlogic@lists.infradead.org; Thu, 13 Feb 2020 20:58:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 734591FB;
 Thu, 13 Feb 2020 12:58:02 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB18D3F6CF;
 Thu, 13 Feb 2020 12:58:01 -0800 (PST)
Date: Thu, 13 Feb 2020 20:58:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Applied "ASoC: meson: gx: add sound card dt-binding documentation" to
 the asoc tree
In-Reply-To: <20200213155159.3235792-9-jbrunet@baylibre.com>
Message-Id: <applied-20200213155159.3235792-9-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200213_125803_294376_DEB25DF0 
X-CRM114-Status: GOOD (  14.31  )
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

   ASoC: meson: gx: add sound card dt-binding documentation

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

From fd00366b8e4125d29e32d49053a702ddf77430f6 Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 13 Feb 2020 16:51:58 +0100
Subject: [PATCH] ASoC: meson: gx: add sound card dt-binding documentation

Add the dt-binding documentation of sound card supporting the amlogic
GX SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20200213155159.3235792-9-jbrunet@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/sound/amlogic,gx-sound-card.yaml | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
new file mode 100644
index 000000000000..fb374c659be1
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic GX sound card
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+properties:
+  compatible:
+    items:
+      - const: amlogic,gx-sound-card
+
+  audio-aux-devs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: list of auxiliary devices
+
+  audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    minItems: 2
+    description: |-
+      A list of the connections between audio components. Each entry is a
+      pair of strings, the first being the connection's sink, the second
+      being the connection's source.
+
+  audio-widgets:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    minItems: 2
+    description: |-
+      A list off component DAPM widget. Each entry is a pair of strings,
+      the first being the widget type, the second being the widget name
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: User specified audio sound card name
+
+patternProperties:
+  "^dai-link-[0-9]+$":
+    type: object
+    description: |-
+      dai-link child nodes:
+        Container for dai-link level properties and the CODEC sub-nodes.
+        There should be at least one (and probably more) subnode of this type
+
+    properties:
+      dai-format:
+        $ref: /schemas/types.yaml#/definitions/string
+        enum: [ i2s, left-j, dsp_a ]
+
+      mclk-fs:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |-
+          Multiplication factor between the frame rate and master clock
+          rate
+
+      sound-dai:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description: phandle of the CPU DAI
+
+    patternProperties:
+      "^codec-[0-9]+$":
+        type: object
+        description: |-
+          Codecs:
+          dai-link representing backend links should have at least one subnode.
+          One subnode for each codec of the dai-link. dai-link representing
+          frontend links have no codec, therefore have no subnodes
+
+        properties:
+          sound-dai:
+            $ref: /schemas/types.yaml#/definitions/phandle
+            description: phandle of the codec DAI
+
+        required:
+          - sound-dai
+
+    required:
+      - sound-dai
+
+required:
+  - model
+  - dai-link-0
+
+examples:
+  - |
+    sound {
+        compatible = "amlogic,gx-sound-card";
+        model = "GXL-ACME-S905X-FOO";
+        audio-aux-devs = <&amp>;
+        audio-routing = "I2S ENCODER I2S IN", "I2S FIFO Playback";
+
+        dai-link-0 {
+               sound-dai = <&i2s_fifo>;
+        };
+
+        dai-link-1 {
+                sound-dai = <&i2s_encoder>;
+                dai-format = "i2s";
+                mclk-fs = <256>;
+
+                codec-0 {
+                        sound-dai = <&codec0>;
+                };
+
+                codec-1 {
+                        sound-dai = <&codec1>;
+                };
+        };
+    };
+
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
