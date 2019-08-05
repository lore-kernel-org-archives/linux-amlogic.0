Return-Path: <SRS0=EYbA=WB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F068C433FF
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 12:06:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72E74206A2
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 12:06:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O5iRi9pW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mpIcqGRs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72E74206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hFS+PcqKFH+98GVLfF6hVwG/gMa19tg0SOG8JsroEbo=; b=O5iRi9pWnqofjB
	9EJ0izu6yQWKpUiXOoSF8jgGIfVtQpQ/2OwQglmCe/9PdJ0YBfqEMjN2Q8JjDupQpPdB5lMwyTKMX
	eLpZWWXYPhuPBF626w9rr0fdYcLSVEuq515zsLD5bIiZzKqq55G2hAKI/AHGxQHRa010+o/ouoZ2j
	1o+v2NXTgcPu3V2kwXP/jJsXqI7mkvj9QqJdbLaCsbwYTVm903M3tRl25zuRoDf8y6GwugKbEIJuJ
	f5pV4VCJbgHin9hveyByEhWHEsSF24lHdbZAA01VDSknSiLqzSR3OztiGuJ9Aqn4PFFr5JYTZar3C
	IZgMGYFNVKP6iIcBIprw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hubkw-0007V5-0M; Mon, 05 Aug 2019 12:06:26 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hubiA-0003C2-JN
 for linux-amlogic@lists.infradead.org; Mon, 05 Aug 2019 12:03:39 +0000
Received: by mail-wm1-x32c.google.com with SMTP id s3so74450797wms.2
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Aug 2019 05:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A42sRNi391H9AC1f83ejYhNdzXImnvegGbOQ/91nUeI=;
 b=mpIcqGRs5tZYknqyOlue0Bj2+ZR9iOg2KTU1GjoH0xi3Z3S+x1sTLlgiJsTpAggRT4
 ypXXrT49yL8jiHXhl+pBCjnp3FYV01DqVc42+HXQXsgRr6+M3NvN3LyQwjBIGFcPgvlM
 R2bLAEdG1FV2+QHZEicKSO7hIRNfLLOUPyRv2a9Jux4Sm0x5ZT2XWzVhnV/O+iag0bSj
 0N50dLguDLPYqDuZ2pc5MWz8mCBFKWS+3XjhS2g+/vtNZxkKuesHAygtDjjGySylnIpF
 2lEgs9J+IeneYxDmYDaSlQOVhmtUhb76FO7j5RE5mxfbBOoUGrXDfyKpO+eBCEULPhF+
 bDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A42sRNi391H9AC1f83ejYhNdzXImnvegGbOQ/91nUeI=;
 b=ULGdMQY9QewTb1Qfe0/exaJ6rzlDKHxje+Sx5kJNxASXI5PgSpTI4c/tN33PUU9lUB
 d+d3kBMwIatF/oH/xIgCXWLcdbw5AmogZMo5miCkWNh81Hn2mRKGJSqB2ASCUqRZIKBu
 tm9m+fW0/GWq0cgNs519Jgp/ZCN6I32/7+QSfs27pnhiNIOhoX/Y9crfu4agS4jkdq4t
 q+105CgWenjJad6knQDmJdmJhKhcriNLsTZyqw0emqkfO6RC5c4i9/a8kl7kcyQR5lRg
 t3S2A1OoCa+zoRHn55LS8luBD6mz9/1ElNdcxw4jia2hSk5Zw7CJMHRhG68pySW6tbVc
 EchA==
X-Gm-Message-State: APjAAAXeVZ9LriciZkyjmBwGp/GpON3UzxxyGzgSiOuvRHtERiYcaYhg
 BLZVjMc4CZ2hM9z7hdjupu1xqg==
X-Google-Smtp-Source: APXvYqzoJSImM+t1LHzEk/lKLUTioVhfT+lrbsg8bRZq+zfHLXMahpKcCUtsWVLWtfLTYh9nT5bGdA==
X-Received: by 2002:a1c:44d7:: with SMTP id
 r206mr19120210wma.164.1565006608513; 
 Mon, 05 Aug 2019 05:03:28 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x6sm88683668wrt.63.2019.08.05.05.03.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 05:03:28 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [RFCv2 4/9] dt-bindings: reset: amlogic,meson-reset: convert to yaml
Date: Mon,  5 Aug 2019 14:03:15 +0200
Message-Id: <20190805120320.32282-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805120320.32282-1-narmstrong@baylibre.com>
References: <20190805120320.32282-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_050334_917144_33A954AE 
X-CRM114-Status: GOOD (  10.96  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Now that we have the DT validation in place, let's convert the device tree
bindings for the Amlogic Reset controller over to a YAML schemas.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/reset/amlogic,meson-reset.txt    | 19 ----------
 .../bindings/reset/amlogic,meson-reset.yaml   | 37 +++++++++++++++++++
 2 files changed, 37 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/reset/amlogic,meson-reset.txt
 create mode 100644 Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.txt b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.txt
deleted file mode 100644
index 28ef6c295c76..000000000000
--- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-Amlogic Meson SoC Reset Controller
-=======================================
-
-Please also refer to reset.txt in this directory for common reset
-controller binding usage.
-
-Required properties:
-- compatible: Should be "amlogic,meson8b-reset", "amlogic,meson-gxbb-reset" or
-	"amlogic,meson-axg-reset".
-- reg: should contain the register address base
-- #reset-cells: 1, see below
-
-example:
-
-reset: reset-controller {
-	compatible = "amlogic,meson-gxbb-reset";
-	reg = <0x0 0x04404 0x0 0x20>;
-	#reset-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
new file mode 100644
index 000000000000..00917d868d58
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/reset/amlogic,meson-reset.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson SoC Reset Controller
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
+      - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
+      - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
+
+  reg:
+    maxItems: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#reset-cells"
+
+examples:
+  - |
+    reset-controller@c884404 {
+          compatible = "amlogic,meson-gxbb-reset";
+          reg = <0xc884404 0x20>;
+          #reset-cells = <1>;
+    };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
