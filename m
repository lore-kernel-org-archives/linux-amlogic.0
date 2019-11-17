Return-Path: <SRS0=wynk=ZJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B348C432C0
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Nov 2019 14:27:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DB042075C
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Nov 2019 14:27:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sTzmvMKn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="sgCJr1rc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DB042075C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vT+ABvHkwxNSmnJA94Nr+A/N8/ompyFFRS4lmA5e3p8=; b=sTzmvMKnnf2uRl
	SMbEpvFLqgdQtArbyjhLQMFRQxXAb7TAl8SWFDFT0bB4OHvbadjVaAPVkefV45u+UPqbW/PEaajPX
	QGWXTHBfqw6/w2YYLZ18OlIecpNiSHboYWObccs6p4tYeohlef/xDIXgZF5bj4xjKYkpf3m9QCt6K
	n2VGu+xTiQnyVGQETF1mla6n/Smyn2gMjR1lsUkO/H7mrMEmQO6PBbHleS9pmAsHQqtHxfaKrkCWJ
	tERLhYf6wCf7JpfYC4bFKdS1WQgjoaJT5jMz/Pz4vHbGYfO+1n86RnAlcaawUmtFJCMK6jz/YdJZS
	re7bQ/tEWYn3o1vIXOcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWLWk-0004EP-07; Sun, 17 Nov 2019 14:27:46 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWLWV-00040a-G5; Sun, 17 Nov 2019 14:27:33 +0000
Received: by mail-wr1-x442.google.com with SMTP id z10so16383155wrs.12;
 Sun, 17 Nov 2019 06:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vHGYzBidRsQQsL3jCB4yF0aDNoupkTyw//nzq4YR9EQ=;
 b=sgCJr1rcICGBo7VwcWQVMH3ZCmoLywXz34QtHHcaYNgbyPluxyDvivoxcI+xtRvFG1
 tk9HTwb8NRNlN4c6Oxl5Nw79vmPJj43MlQtXQwomespiRZk4pwoGCOyqNhb9oCQmOYEZ
 IBksKpVJaIAdcEgGQHCxMF1IDv+kxqMC1dOeKVTJrmyfP+hvRReITPdfjqcMnNBIWzVC
 pcv44mpsuW7NB3o4KhdVmXW6ZdfeIcEmztEHmdh4Ps2C58Y8mcB2Xv6Rm0/iRIadyZgU
 HRmHrLlQW1yhUcxZGd95eCBA/hISbP4ZxWoZS5K3Zn0UII5kiRsN6OrwILac57tD6TFn
 VvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vHGYzBidRsQQsL3jCB4yF0aDNoupkTyw//nzq4YR9EQ=;
 b=cIo12pbHEDmcTq5FYYHNMnX/GqOAVm+Kioc5rLNXuyM27Su4SRjhAQs6BwqnO5pCqw
 2IuaVYkVDmSs3bo8wl648j3lvW2TtQBDDcg0BxVTjcu+rtEIe6vUCfButlHR8lBKuXAR
 opUk/Dwj8cvJaWR8FoYZsm1JMRfpjm+hemcNYBNueF0JNFDGaMAZ/mMn6KFfJEFSwLue
 XqDdtD1mRNdOMMbsTS8SzwIsiwYYwSy4+lIYNUrIhsO1SSTDB3PzBqLraxqiNAqi1k1p
 0G2+ku1a0FqSNKF3qo7at/7WxvfZ7UcsMwOycbvIUjcMukmN7H4tp+5eGg3Lb7Xgh8sf
 OIWg==
X-Gm-Message-State: APjAAAUKCf/5gK+CW4jC9+3Bq46OLMw34FPUJYWiumg6Gr0YfYsqSrj7
 V40m822dOb/4Mdzo7MaBRu8kam6b
X-Google-Smtp-Source: APXvYqwT18GZmJpvpNeh2iFJtU1+2xOuk86H/DHrSS1Qn4jh1cZ92rwqjud9yjUSqJNcKjkY/fhSSQ==
X-Received: by 2002:adf:ef42:: with SMTP id c2mr7133152wrp.89.1574000849794;
 Sun, 17 Nov 2019 06:27:29 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1371CB100428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:371c:b100:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id y6sm19298404wrw.6.2019.11.17.06.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2019 06:27:29 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mmc@vger.kernel.org, robh+dt@kernel.org, ulf.hansson@linaro.org
Subject: [PATCH v2 1/2] dt-bindings: mmc: Document the Amlogic Meson SDHC MMC
 host controller
Date: Sun, 17 Nov 2019 15:27:15 +0100
Message-Id: <20191117142716.154764-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117142716.154764-1-martin.blumenstingl@googlemail.com>
References: <20191117142716.154764-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191117_062731_532988_84186ACF 
X-CRM114-Status: GOOD (  11.28  )
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
HS200 mode (up to 100MHz clock).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../bindings/mmc/amlogic,meson-mx-sdhc.yaml   | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml

diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml
new file mode 100644
index 000000000000..862aedba680f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml
@@ -0,0 +1,64 @@
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
+  clocks:
+    minItems: 5
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: clkin0
+      - const: clkin1
+      - const: clkin2
+      - const: clkin3
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mmc@8e00 {
+      compatible = "amlogic,meson8-sdhc", "amlogic,meson-mx-sdhc";
+      reg = <0x8e00 0x42>;
+      interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>;
+      clocks = <&sdhc_pclk>, <&xtal>, <&fclk_div4>, <&fclk_div3>, <&fclk_div5>;
+      clock-names = "pclk", "clkin0", "clkin1", "clkin2", "clkin3";
+    };
-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
