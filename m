Return-Path: <SRS0=mJnT=6M=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F19C83000
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Apr 2020 21:03:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F374206F0
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Apr 2020 21:03:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jVz3i2cn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="HU3s4HDE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F374206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ikcuuhmGzBmbq8ZozuHpCWA/Bi4l+iDkhLonGmNNE08=; b=jVz3i2cn4B53gZ
	6eMkM5BvuG38WVRtQPZjCaRr6s0rfcOE0ofLtZhEh6HdU3c+NilY+BGdVLmQ/EzPqRMBvQozhWD0L
	8hcsBsY3dX91LkL+oG8jXjfN6IZHhyArBtd6uyUOq/2tIVOGvkXhg4JDuJe/Ra2OKLkxdAXdqqoS+
	s5pvJfMKQLd3tXFFrNLJLpNOeYoA0zpjBgqkN8WRqcml0q9RoHYyVHIpggjEaM6ssmlgsAuaJOg7s
	cn6TYouAEIBW0y/r6oZespEZH9rsk3Kptmq9Gi+W3UYHUizEno9G2k7BuzYj4dSQuWxRrXhXLChv/
	vjS/Ji2xJ5zUXhYCRQxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTXNd-0006LR-0V; Tue, 28 Apr 2020 21:03:01 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTXNN-00067O-3K; Tue, 28 Apr 2020 21:02:46 +0000
Received: by mail-wr1-x442.google.com with SMTP id d17so26363368wrg.11;
 Tue, 28 Apr 2020 14:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eWCTEhvwNRaNadOXmecV0z32iIc2uE0AhWz2k37iTCw=;
 b=HU3s4HDERN8COZGxh0orthI/O45TIxFKJuushU2seXrnpAEquoc3nbgfyXTUJqzj9k
 pWwIHJRdvf+7MMaNKbXjUGwJktm/ZNmBhJGIURXrip0LQRzZSFyCXyNvgQ7ZXjd1QmP1
 uHbj+SO69myxFboNXV4sp05wy+K7U1UurOo5Y5kAUiIRcZBx714eWic2l1YD8n672rdH
 g/F01jHZhGdwWzK622G5Q70hcTHIWuh5NVqkjugxhV5GziaWtHOuYjhbapN5KABqJ3IC
 vTZfOWoajKPDWHBncj5EYFykYEpgfpHFquYckjfh5f0MQpaLMvh0xS/MJdOja7VtncDR
 k1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eWCTEhvwNRaNadOXmecV0z32iIc2uE0AhWz2k37iTCw=;
 b=tSbcPoxg9ONSX34b1IwjTNiE7qAyQasreq77c0qM+aZbRljwSr+y/pkfwy0cvehkEX
 5dY2VpviWAKUG8nJozK9w1j2Qoyfh91de5dlKuMuMXN8y2VfmLwDc/PFoeJ/IMtHaOOb
 a+AZoQQpnh1cJubIe5f4K0ghYhviuRhrmb5vwp3S+A8lAWS9WzLI+VTM4/EYAP7cOj3F
 bt/fp0A1Hp3qVlKnQqUMxhVT9ZcxfRHxwwB+8uP60kZIPQou0VCQTAibfo36ba8/h7Bv
 xQK6VaL0kzRIKqgXljNBk+0DP+wOvk6i0EtGADRIA9/x3dM0XIMYveYGUkqjFXTMoBeW
 vLJA==
X-Gm-Message-State: AGi0PubQKCLnXj4cdsWHWIfDZ0+3GvRfkK+nrmesoCC0alKGZjXJT0c4
 r5i7OiRTCloT4s+CjIUq04ZZ8e/WuN581g==
X-Google-Smtp-Source: APiQypLK5mVgspHODgpms7tHVmrk9rRXZgJplGen8SCZv1xfJziKnPAg1m+4drZuLFAUuML0sAcakw==
X-Received: by 2002:a5d:4dcd:: with SMTP id f13mr34348682wru.417.1588107762824; 
 Tue, 28 Apr 2020 14:02:42 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id x18sm4709243wmi.29.2020.04.28.14.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 14:02:42 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
 ulf.hansson@linaro.org
Subject: [PATCH v6 1/2] dt-bindings: mmc: Document the Amlogic Meson SDHC MMC
 host controller
Date: Tue, 28 Apr 2020 23:02:28 +0200
Message-Id: <20200428210229.703309-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200428210229.703309-1-martin.blumenstingl@googlemail.com>
References: <20200428210229.703309-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_140245_139330_C4484BBC 
X-CRM114-Status: GOOD (  12.05  )
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
Cc: devicetree@vger.kernel.org, jianxin.pan@amlogic.com,
 Rob Herring <robh@kernel.org>, linux.amoon@gmail.com,
 linux-kernel@vger.kernel.org, yinxin_1989@aliyun.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, robh+dt@kernel.org,
 jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org, lnykww@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This documents the devicetree bindings for the SDHC MMC host controller
found in Meson6, Meson8, Meson8b and Meson8m2 SoCs. It can use a
bus-width of 1/4/8-bit and it supports eMMC spec 4.4x/4.5x including
HS200 mode (up to 100MHz clock). It embeds an internal clock controller
which outputs four clocks (mod_clk, sd_clk, tx_clk and rx_clk) and is
fed by four external input clocks (clkin[0-3]). "pclk" is the module
register clock, it has to be enabled to access the registers.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../bindings/mmc/amlogic,meson-mx-sdhc.yaml   | 83 +++++++++++++++++++
 .../dt-bindings/clock/meson-mx-sdhc-clkc.h    |  8 ++
 2 files changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml
 create mode 100644 include/dt-bindings/clock/meson-mx-sdhc-clkc.h

diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml
new file mode 100644
index 000000000000..1ca44529f622
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/amlogic,meson-mx-sdhc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson SDHC controller Device Tree Bindings
+
+allOf:
+  - $ref: "mmc-controller.yaml"
+
+maintainers:
+  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+
+description: |
+  The SDHC MMC host controller on Amlogic SoCs provides an eMMC and MMC
+  card interface with 1/4/8-bit bus width.
+  It supports eMMC spec 4.4x/4.5x including HS200 (up to 100MHz clock).
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - amlogic,meson8-sdhc
+        - amlogic,meson8b-sdhc
+        - amlogic,meson8m2-sdhc
+      - const: amlogic,meson-mx-sdhc
+
+  reg:
+    minItems: 1
+
+  interrupts:
+    minItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  clocks:
+    minItems: 9
+
+  clock-names:
+    items:
+      - const: clkin0
+      - const: clkin1
+      - const: clkin2
+      - const: clkin3
+      - const: pclk
+      - const: mod_clk
+      - const: sd_clk
+      - const: tx_clk
+      - const: rx_clk
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#clock-cells"
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/meson-mx-sdhc-clkc.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    sdhc: mmc@8e00 {
+      compatible = "amlogic,meson8-sdhc", "amlogic,meson-mx-sdhc";
+      reg = <0x8e00 0x42>;
+      interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>;
+      #clock-cells = <1>;
+      clocks = <&xtal>,
+               <&fclk_div4>,
+               <&fclk_div3>,
+               <&fclk_div5>,
+               <&sdhc_pclk>,
+               <&sdhc SDHC_CLKID_MOD_CLK>,
+               <&sdhc SDHC_CLKID_SD_CLK>,
+               <&sdhc SDHC_CLKID_TX_CLK>,
+               <&sdhc SDHC_CLKID_RX_CLK>;
+      clock-names = "clkin0", "clkin1", "clkin2", "clkin3", "pclk",
+                    "mod_clk", "sd_clk", "tx_clk", "rx_clk";
+    };
diff --git a/include/dt-bindings/clock/meson-mx-sdhc-clkc.h b/include/dt-bindings/clock/meson-mx-sdhc-clkc.h
new file mode 100644
index 000000000000..ad9f6e4dc426
--- /dev/null
+++ b/include/dt-bindings/clock/meson-mx-sdhc-clkc.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#define SDHC_CLKID_SRC_SEL	0
+#define SDHC_CLKID_DIV		1
+#define SDHC_CLKID_MOD_CLK	2
+#define SDHC_CLKID_SD_CLK	3
+#define SDHC_CLKID_TX_CLK	4
+#define SDHC_CLKID_RX_CLK	5
-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
