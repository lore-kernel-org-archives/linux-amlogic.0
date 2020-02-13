Return-Path: <SRS0=deyy=4B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC8BC3B18B
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Feb 2020 15:52:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFACB24670
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Feb 2020 15:52:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sGiriyiD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="uzfpKBfe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFACB24670
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/eZCvCnqZRgTOt9k+CGB62oyfK/4dqm/7e3rUOkzw5A=; b=sGiriyiDrM4i24
	QD9pcHbxEugd2jDtesIXThYXMWBr1g8VHD7DE7rsF/UYU6hcXE8WU3WANw9X0inwEpmiMMSg6bSBR
	HsSGp8mNvl6sKJ8llLiICoCsC8jMcZ6aAAbseW1ntAuGBywVHUEJW8vJix9xr6V0Eno5oqA6BKxQu
	JRd+zS1IpKw6UqrgsqBVUdtRVk0OvaVG5oJgN/pszSEM+ZeesK1RpZr4G38UWOSPQA3Ykk/JK3Vbd
	3X//uUJ8wTdUlnZ/rwyribZSJBI21N6yhJdcapXPN2iQ66rU24zp0UwkEomrAxdZe1wkYchCqxUhs
	9OQ1MbTfHa7W0YONKbzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2Gmp-0000lO-Nm; Thu, 13 Feb 2020 15:52:19 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2Gmj-0000dq-Jb
 for linux-amlogic@lists.infradead.org; Thu, 13 Feb 2020 15:52:15 +0000
Received: by mail-wm1-x343.google.com with SMTP id s10so6811016wmh.3
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Feb 2020 07:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6YhrzCi95LftKcnPaWRcj71zpUelsdIguZJo9dP4H/c=;
 b=uzfpKBfeVATiA0cT3Ut5HPxkUFwA0xjWgzJwbGxwYRDN9d0N+xqCxAxu89JjjH5DBT
 IKu0xoyRGJukUN42Hs9dlZnVBIZaYGAlpOmZ9zd5Px6GgaO91upfgt4Uy7G6twTjhI24
 juXlEwBd7EMPCxQLo5Lf8Pv5bd7M9movwRvKvjk83is1zuQRk6fw3AwAPYd2m31HJfKu
 MMGlqEDW7YKKtr5jscWL4RtriaiX2qd/RcuanWacmFYHme66JcSRplBuirOOA0vdPJBL
 ke416sMATXnSlbfMpffFfAesdFmLcEkw6BWOivyeEgxef7eZ4FVvePUnYOtqAHrxNTNa
 dJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6YhrzCi95LftKcnPaWRcj71zpUelsdIguZJo9dP4H/c=;
 b=kvJWGZZ3x0o4bjYGQyUO1BZOp91QsLUSbKfxo7BzxYgcFX+1Dd5weN6r0ZSNCQ/3XC
 u+jmzPkgTzuHNHr41Dvh6qChqq3FWW2jwy/TZAmOlz6dcvS9tYPLMipEgbiIDtwL60OY
 WvdqCqSvkwRZUzgKSIQ9TVbkBsZVJTbhm35Vv0F3NhOQJ3NAVTm1dd3j66UXz87NMFQq
 M30Ea+94pJq58eNCEouurJYGUIUtDpI7PyCW2jwu9iYfF6nVbjOxKhV9+a0i9xJLUhiI
 KGnAL0PLf4Rla6MEqqNCH/shh1ph1eINYFtjy6Adi2egFzJkFP6sLgj/CUlnydPp/EUX
 fvBQ==
X-Gm-Message-State: APjAAAUDrTVIEewIZ/9BkaDzzKx9osqAzHmC9QDEY0G3z1eCgbfqQthV
 uBEHeyeuXJfdEAAS0vNFPxfkbw==
X-Google-Smtp-Source: APXvYqz/3hR6MBoFcwP1f0vbSeUJb+sFQI9maPj9mek2Phcd0eRR4aVLSkGyFWfQ2VyWqCd0zHCu5Q==
X-Received: by 2002:a1c:ac46:: with SMTP id v67mr6274807wme.153.1581609130878; 
 Thu, 13 Feb 2020 07:52:10 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id e1sm3319814wrt.84.2020.02.13.07.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 07:52:10 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 3/9] ASoC: meson: aiu: add audio output dt-bindings
Date: Thu, 13 Feb 2020 16:51:53 +0100
Message-Id: <20200213155159.3235792-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213155159.3235792-1-jbrunet@baylibre.com>
References: <20200213155159.3235792-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200213_075213_660484_5978ED75 
X-CRM114-Status: GOOD (  10.87  )
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

Add the dt-bindings and documentation of the AIU audio controller.
This component provides most of the audio outputs found on the Amlogic
Gx SoC family.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
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
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
