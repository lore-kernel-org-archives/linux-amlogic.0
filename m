Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7917EC021A1
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Feb 2025 15:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MtT4K32ROx4ygkre3GR37wrVEaZHeT7vZUJfrO1z8eQ=; b=1rgJxWhwacTMsh
	cni659P4RVZG9hSkEJuxiMpSCO2IiCnuo9TvxerEIOmFzkrAXQJEOyp387Q3mGndjfbPHmcvHdIgY
	HQ9zKcokAuG73N3/zFqZKHRdaecjFT8FgP3rfEZztYlxefBkyecRcyJ+q5kvw6SpENWz/j5F0IiK6
	1n1c6ydyj2SIFAOOWSSJA+wetyPr1M8+SpaAhBJ+emn11HxQd7QONBTvxJPJ8S590xnq4VUt6C7jp
	1Cn9xcM6VYzZBOvCIUPOtLvn4zfEyC6sxhFNrCWuS26cTNu6Fifh8pn/5tfvrt8En9KxE7/2bYcW+
	EH7HU0mO7IM++rxvVGbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thVJ8-00000000EGA-1pPy;
	Mon, 10 Feb 2025 15:02:46 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thVI2-00000000Dus-42eq
	for linux-amlogic@lists.infradead.org;
	Mon, 10 Feb 2025 15:01:41 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5de594e2555so4427314a12.2
        for <linux-amlogic@lists.infradead.org>; Mon, 10 Feb 2025 07:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739199697; x=1739804497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BadoGFdbWi+RxOS2TPc6oRzGweQOUnlp92mI5rcILo8=;
        b=NEfW1GjD+7oH9jvq9Y0gA9j3huX+ItZSVLmPzWTrOtoMZpvX2cXTgbiPQNRAeh2l+I
         z8Gpq6tzXG6xi5RVhrCUfJU+qFOXaG1sz8AYZYXGvarJjLc8gYFBusrMMnJUQYi+0kge
         mqo+Xd2FFZN4FPyPrciZv24qqVkEiUXRlJj7OJaGHeuvSnuf0caBfgoK/gG3ygfqUr5w
         /BFXyxLacp7AIetLUWrdIG4yFyDteGuABCIQwLUGR1HaEUpBDJo3vPUIzy9yhC5lNDhq
         0Ndgp9SnbCvdlYjMHfDaQ1cOTowH7lXXKgZ8K7oj/V2gLp1OH8kxcVVkeU7XaEJpDSAF
         acbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739199697; x=1739804497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BadoGFdbWi+RxOS2TPc6oRzGweQOUnlp92mI5rcILo8=;
        b=jpI2Ft1o30HTM3N8Mx1VrVNTeaJmEfMdthQiMpL6RBc3gsxdcGUTlA75ajGRZBQIj5
         dVotJlJ23FpS5/Hr0WudL9311lQz2HFDqJ1W/rVNyEhzK5z5qUEK7o2bpy7LLRVPo+tF
         OVwDDWbiGC04NAWdNxHumUgbXDpzFVz2NdVSdKbaX+cfrNk/1LFLT55+hzJNk+A2JaaJ
         EpqTnEvN8sIrimzQT5r3kUaEnBbPx3UpXJpFstEkKCNOvkY2skXg3IhSc1BAxBBE+OTU
         5VLF9hdQJLk1bg9rKfI28uqDho9eJwGtUFQ36hmCxLuwzmJdhiT70lV2OtkeklYaDrBv
         kYSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIJhXU96PDLVlOIfxkaCYxFY2Ci2A8P6CJPRdoiwfwb2UooiBu2BrACVdQoPirylpkZ9zR59CcNUGDuPS7@lists.infradead.org
X-Gm-Message-State: AOJu0YxgS2eMHNP1/tj6GKTW+MvU/DfN5/ec4nb3+P7GEXy+1ohlOPJ3
	ilf4hFIM4YnLXA11y44Eu/BtffPIKvkqFvSyCCNsbrVVyirv4cQH/7quBB/pcHI=
X-Gm-Gg: ASbGnctZWLq6dL2ptNXolATJGWarxZAStq+DlrvKgJ98bRYEjcf5pBRJYmpjdUr+4/A
	VsTMHQ8nRmVD3RCKoIcgbXDiNHh6LJBu38PDz/59GOZ7DYh4qAGJM3tu7xwYz/8uFC/fD1tgxBX
	uttC+ZruxMsNnoVv030N2PgTWft/8wor/j0Qq6ZCJpND9n+bw8V/PYKdBuN81jX8uzxtQLOdwl/
	+pcOEAqryVaD0o+PaU0cwMHtTQDcsIJyCQzsrfuOAGUm7XvSlw+5q12JSmByk23E5YG5VlrlMBo
	KfZeQ/ZH3aaCDyp2A+9mpWScX3Hj
X-Google-Smtp-Source: AGHT+IGpVqycyZR2YnxbLB+0FPSVnyS2AxVJJQJRRoHf/8da6EsHjXh4Mti5AGi9XDwh+En5MO0W0w==
X-Received: by 2002:a17:907:960f:b0:ab6:dbe0:d658 with SMTP id a640c23a62f3a-ab789b20e6amr1580540166b.31.1739199696978;
        Mon, 10 Feb 2025 07:01:36 -0800 (PST)
Received: from localhost.localdomain ([151.41.218.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bec717f7sm250400466b.81.2025.02.10.07.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:01:36 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
To: jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-amlogic@lists.infradead.org,
	linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH RFC 2/6] ASoC: meson: audin: add audio input dt-bindings
Date: Mon, 10 Feb 2025 16:01:25 +0100
Message-Id: <20250210150129.40248-3-vsetti@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210150129.40248-1-vsetti@baylibre.com>
References: <20250210150129.40248-1-vsetti@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_070139_015624_63DFDB81 
X-CRM114-Status: GOOD (  13.09  )
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

Add the dt-bindings and documentation of the AUDIN audio controller.
This component provides most audio input found on the Amlogic GXBB SoC
family.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 .../bindings/sound/amlogic,audin.yaml         | 104 ++++++++++++++++++
 include/dt-bindings/sound/meson-audin.h       |  10 ++
 2 files changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,audin.yaml
 create mode 100644 include/dt-bindings/sound/meson-audin.h

diff --git a/Documentation/devicetree/bindings/sound/amlogic,audin.yaml b/Documentation/devicetree/bindings/sound/amlogic,audin.yaml
new file mode 100644
index 000000000000..7fb231a8d5a7
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,audin.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,audin.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic AUDIN audio output controller
+
+maintainers:
+	- Valerio Setti <vsetti@baylibre.com>
+
+allOf:
+	- $ref: dai-common.yaml#
+
+properties:
+	$nodename:
+		pattern: "^audio-input-controller@.*"
+
+	"#sound-dai-cells":
+		const: 1
+
+	compatible:
+		items:
+			- enum:
+					- amlogic,audin-gxbb
+			- const: amlogic,audin
+
+	clocks:
+		items:
+      - description: AIU peripheral clock
+      - description: I2S peripheral clock
+      - description: I2S output clock
+      - description: I2S master clock
+      - description: I2S mixer clock
+			- description: AUDIN peripheral clock
+			- description: I2S bit clock gate
+			- description: I2S bit clock basic divider
+			- description: I2S bit clock more divider
+			- description: I2S L/R clock divider
+
+	clock-names:
+		items:
+			- const: pclk
+			- const: i2s_pclk
+			- const: i2s_aoclk
+			- const: i2s_mclk
+			- const: i2s_mixer
+			- const: i2s_input_clk
+			- const: i2s_aoclk_div_gate
+			- const: i2s_aoclk_basic_div
+			- const: i2s_aoclk_more_div
+			- const: i2s_lrclk_div
+
+	reg:
+		maxItems: 1
+
+	resets:
+		maxItems: 1
+
+	sound-name-prefix: true
+
+required:
+	- "#sound-dai-cells"
+	- compatible
+	- clocks
+	- clock-names
+	- reg
+	- resets
+
+additionalProperties: false
+
+examples:
+	- |
+		#include <dt-bindings/clock/gxbb-clkc.h>
+		#include <dt-bindings/sound/meson-gxbb.h>
+		#include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
+
+		audin: audio-input-controller@a000 {
+			compatible = "amlogic,audin-gxbb", "amlogic,audin";
+			#sound-dai-cells = <1>;
+			sound-name-prefix = "AUDIN";
+			reg = <0x0 0xa000 0x0 0x308>;
+			clocks = <&clkc CLKID_AIU_GLUE>,
+							 <&clkc CLKID_I2S_OUT>,
+							 <&clkc CLKID_AOCLK_GATE>,
+							 <&clkc CLKID_CTS_AMCLK>,
+							 <&clkc CLKID_MIXER_IFACE>,
+							 <&clkc CLKID_I2S_SPDIF>,
+							 <&aiu AIU_AOCLK_DIV_GATE>,
+							 <&aiu AIU_AOCLK_BASIC_DIV>,
+							 <&aiu AIU_AOCLK_MORE_DIV>,
+							 <&aiu AIU_LRCLK_DIV>;
+			clock-names = "pclk",
+										"i2s_pclk",
+										"i2s_aoclk",
+										"i2s_mclk",
+										"i2s_mixer",
+										"i2s_input_clk",
+										"i2s_aoclk_div_gate",
+										"i2s_aoclk_basic_div",
+										"i2s_aoclk_more_div",
+										"i2s_lrclk_div";
+			resets = <&reset RESET_AIU>;
+		};
diff --git a/include/dt-bindings/sound/meson-audin.h b/include/dt-bindings/sound/meson-audin.h
new file mode 100644
index 000000000000..30c2fe218ab4
--- /dev/null
+++ b/include/dt-bindings/sound/meson-audin.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __DT_MESON_AUDIN_H
+#define __DT_MESON_AUDIN_H
+
+#define CPU_AUDIN_TODDR_0	0
+#define CPU_AUDIN_TODDR_1	1
+#define CPU_AUDIN_TODDR_2	2
+#define CPU_I2S_DECODER		3
+
+#endif /* __DT_MESON_AUDIN_H */
-- 
2.39.5


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
