Return-Path: <SRS0=s8Yl=5N=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC806C2D0EE
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Mar 2020 00:33:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EF7B2076B
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Mar 2020 00:33:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KDdmi0hr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="I3aO5wPJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EF7B2076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EUmQVRFbUQy6euxEVTPgSRuYTwxBUExDzSv60NJc/EA=; b=KDdmi0hrqQgo05
	adfvumBznADKnZ2EGfQCNpddJa/1q/KskRB7brEuVciD0ULJiwmfMs12foG/ZQf2I3G26UgmvxWqg
	rJ2ivn6PXua2WigO3EnhS5i8zih/CNjfl6uyzyO83+qb6PhrurSHyDlcDuovnmdzVG91SycGVsWw3
	zoOro0X0nMTDNPxUWw2s0AdTwYBRjPy4ly3gl93Zf7URh4icAHoEtbyf/99diKRlvndI4f019VzcZ
	vDIGf5cXWZZsIyxKvTWGLquCPKaPKalYiQZ2XZ33EJGvSQdKzMw0FKB8nr597qPzkdkjWodw4kJaK
	0Fk//VBWyyBV+9xcZHGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHzPn-0005aO-SA; Sat, 28 Mar 2020 00:33:31 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHzPa-0005NX-6q; Sat, 28 Mar 2020 00:33:19 +0000
Received: by mail-wm1-x342.google.com with SMTP id a81so14690826wmf.5;
 Fri, 27 Mar 2020 17:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=665fZkiQeQxQz0e6yTC3YNhkYs0sFtr287HV50LsYZA=;
 b=I3aO5wPJy2zoEsoipA7CXpUpUlMIDwnkQXDCJyxOls6zsQe2X8tSNwEnMa4RCFoolh
 ctnAqA9d2fr8Zsrr5tkN0tmRB529sy0KU7zqQLzTmKDY2pruW5JI3nVtCHiCekgPckDN
 +13PmIo07UVlDtwr4Kd8vd4edKIJpoeYZW2OERLitVxcUvJ5XVOD+hdO8gwhf+2avQhT
 d8l0rAPtz1+Q51g/et8K12OMKytuXstIFxMEMoJlICjelrlhUSi1JFIeTejvxNlMGU8S
 lb6vzxAZxw8uAAINOGsMGnvMrNqpvWXgTHlv3iB4bajJPlqscxLIjzAigYiACObIrETb
 2wyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=665fZkiQeQxQz0e6yTC3YNhkYs0sFtr287HV50LsYZA=;
 b=XEnFuZ22DtgnpEpSE1D19VOufVoJI7Lc0xa2cMjypPLinSnMd/uCPSaWvRyLKFQiOo
 sg4yK/pxonR29touiDGQKKNgQtLDtdhenhhlD+pf4lwX6Hz54kUrRJNgQKzO2TKGjtp2
 DaEHkCNcyfg/43J5rUT+YwsFX3PR+ydoFXQ0nvZxupG0SRPy3MWS1D2HTycrRyAwpsaL
 PJCdBJnrdlvofgujNXaxnkMwdDlPTx2w5pLy8K0xygjsVNoayHZptTWcs6+kPbwLb9VA
 AxoXa/AKQ4il8fgZHfaTD4TKB6KkGFg+vzll1I+Ua4WR/NwXwl0cLHF09ZnQz4ythSW0
 FSkw==
X-Gm-Message-State: ANhLgQ17HuSkM9I5ahgBfsuGMW13B5TEO8GsQSHM/0CrGxSeu5//BIKL
 HHhcWTCZ5RGfVA3wpNcBtuMo4peA
X-Google-Smtp-Source: ADFU+vs6pei8+YtfMKOYbZ8goQWS4GvVXwvzmF1A32j7V+nrAIhek6nMb1+trxkKv6LVMaYK09PA7w==
X-Received: by 2002:a7b:c388:: with SMTP id s8mr1357582wmj.168.1585355595562; 
 Fri, 27 Mar 2020 17:33:15 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F13710ED00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3710:ed00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id f1sm10346246wrv.37.2020.03.27.17.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2020 17:33:15 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mmc@vger.kernel.org, ulf.hansson@linaro.org, robh+dt@kernel.org
Subject: [PATCH v5 1/3] dt-bindings: mmc: Document the Amlogic Meson SDHC MMC
 host controller
Date: Sat, 28 Mar 2020 01:32:47 +0100
Message-Id: <20200328003249.1248978-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200328003249.1248978-1-martin.blumenstingl@googlemail.com>
References: <20200328003249.1248978-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_173318_247600_CFC37254 
X-CRM114-Status: GOOD (  11.43  )
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
Cc: mark.rutland@arm.com, jianxin.pan@amlogic.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, yinxin_1989@aliyun.com,
 linux-arm-kernel@lists.infradead.org, lnykww@gmail.com
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
2.26.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
