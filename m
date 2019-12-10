Return-Path: <SRS0=AlqK=2A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51822C43603
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 20:01:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2436B2077B
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 20:01:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qlloptPK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="PcDOdUTM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2436B2077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VYgBizcY5ZUTjC0WLi2l4Q02VU+mWomjcjHn3IcA/rA=; b=qlloptPKtpgdpU
	yKyufWqhhKxWt/IbmSg/FnOWwknhh4WQA5Ey5rxqimjbWEG0kpFoJ3fXqzC9Kh7hn6ylM136/rEZY
	45NHnEbuAUQnfuUIARk9T3DjbSK8NkdBFcqyL6tcPz5V0IeTlcR8Ic81ITicSwAZgsQpM2zXYZLqw
	qFXhtrWXWqHH4u4Ufghz6jPn9jmvWalXERMDDpH9bdFPs/23m08Tzfw5Gce2QPiGN1QNGlp67L20Y
	1qyp844qot/AOWJKJVcAsw/UyyBngb5mHFVaEsiZePsRrdZvtnZOWKJMQQw3CSz6ixPBIbWAxTZGE
	J9OKXMBuFafCiXeH4jFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ielhC-00041e-4o; Tue, 10 Dec 2019 20:01:22 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ielgR-0003RM-0n; Tue, 10 Dec 2019 20:00:53 +0000
Received: by mail-wm1-x344.google.com with SMTP id d73so1335344wmd.1;
 Tue, 10 Dec 2019 12:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+tCXSRcOGp8AB2agMQyFNpx6A5VvIGH5Te8hf64YcWw=;
 b=PcDOdUTMeTW9ZZMJ7mDGB217v44GZWE94XzfRXSgj82kQD4ttkGWJ3WiY0/FnItCQX
 04BAre3cfoGvEIFSfolLLH22vaX4z0t//H7P+QZXopaMY79J9SkUnTP+iT5tMdQO5vs5
 oZS5mYDsL/6+4VhGFEleiew50AuJGi8pJHeMravjd2P8Ck+n/P7GyvOEstUMaMMGLN9q
 Br6Z98gUcts9ysgG+t6lV9hSnkCMY9KI11hlDFdmvAIyuonFdk0RyE6bRy/KIxWgSdxQ
 eLsNh8sDH2+BERz5j/23/mxBRz8mC2zqlD5Zvz2sen8OaB7jWNX8FrnZwCvrMwu8IvWs
 z1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+tCXSRcOGp8AB2agMQyFNpx6A5VvIGH5Te8hf64YcWw=;
 b=tlYnjFTmHcpj61KpjCRWbOFLFq13GhaErM9qB6JtOlj0cR+Jgb76WKRmI9JZrMHJpN
 PqUmAFxGArTzz5ykHz73PWRJhT/M27bTomVVSaCzNq2LJIzVXQtiiwHZ79+UQhBTDKk7
 G5MiTPMqtJ9rr+In1+HHyEqjJLSD/Uxmc5cLUUrCK41he6EyE/pl2lG51FA2/VLj7851
 b8VmQ9CEIap4Zxr2vHsXgbGC4JXXSdsM3H3C17Ro6+hF61kSnDidmCsNKAIYsYKUBvdA
 cO5iyDq/Uu5NBOd/cZ7jx+etfbmkHQSVuHJXeyh3nskFDvSc26Q7pseZS2FqrpoPPMg5
 1nrw==
X-Gm-Message-State: APjAAAXMKVLGW9R+wLcqD4pmDykII5hV0FOxecfLgqN71nAHSFVmlzyG
 V4fX093YdNsafAYLZHFfjOEbFRzZ
X-Google-Smtp-Source: APXvYqzrsvco5XJD7/5sA83REuKxpORSzOHblfQuIBFlT49tQcREjH5VmRYckMc89eWDPNGust+UUw==
X-Received: by 2002:a7b:cf01:: with SMTP id l1mr6861581wmg.86.1576008032761;
 Tue, 10 Dec 2019 12:00:32 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1371AD700428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:371a:d700:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id t81sm4428610wmg.6.2019.12.10.12.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 12:00:32 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mmc@vger.kernel.org, ulf.hansson@linaro.org
Subject: [PATCH v3 1/2] dt-bindings: mmc: Document the Amlogic Meson SDHC MMC
 host controller
Date: Tue, 10 Dec 2019 21:00:21 +0100
Message-Id: <20191210200022.29696-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210200022.29696-1-martin.blumenstingl@googlemail.com>
References: <20191210200022.29696-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_120035_187228_6D89451E 
X-CRM114-Status: GOOD (  11.01  )
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
Cc: mark.rutland@arm.com, Rob Herring <robh@kernel.org>,
 jianxin.pan@amlogic.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, yinxin_1989@aliyun.com, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, lnykww@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This documents the devicetree bindings for the SDHC MMC host controller
found in Meson6, Meson8, Meson8b and Meson8m2 SoCs. It can use a
bus-width of 1/4/8-bit and it supports eMMC spec 4.4x/4.5x including
HS200 mode (up to 100MHz clock).

Reviewed-by: Rob Herring <robh@kernel.org>
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
