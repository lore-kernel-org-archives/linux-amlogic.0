Return-Path: <SRS0=EYbA=WB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 763A6C0650F
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 12:04:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 479B4206A2
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 12:04:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ch8uzp/8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VMaSAqIP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 479B4206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4SRL7DpJ6BOOWxoOIkoZfPPLU8Um00CTeqDMwVVbo0=; b=ch8uzp/8ZGdBhD
	kT5wLkc8tAnIRMMTsHdFwSqyx2UCWVn3XNvarrTq4DIGwtJcyxrkH39xION3t9IyTarr0sdblliiT
	DumOPetFSQity0CQs70bBGSxvUPJx/AiYWpElklAq5BtZZsy2B2Ur9poV69X1nD6BHuSq69bwS3Kg
	kHEUxJBx33tU57tAxNVnIoj7S5UzgbRKKzzwghaVek5pz40soSRJEtzrpoU9lqXOsF/tjwxQ1cvmk
	XrZwYzXgHB+WITAH7itwCxePSJpmni7YPxZOIgTNvvHxSc5lwgkphQr77QyHv19MorOiLzVdqGLTO
	5pscmzguKBknadqsDBjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hubiv-00040P-AV; Mon, 05 Aug 2019 12:04:21 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hubi6-0003Cj-NX
 for linux-amlogic@lists.infradead.org; Mon, 05 Aug 2019 12:03:32 +0000
Received: by mail-wr1-x441.google.com with SMTP id p13so9584035wru.10
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Aug 2019 05:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AN145UNIjgCQrhhYJVSogcaNNij6aeHMgkbf7MOZjVg=;
 b=VMaSAqIPmDBgeaoKtkuPvpLTMYFnMDM3uFkTOsPWLoZNdksJfThr6EuxlFAHLShjgX
 9mixnqvdwkbrMhC1FWlZZMRYGNtrRDaZ+I2HWY+xvzUp5YHhFFCPADzt6Fq6XWc9Dn4V
 pWiIACOE0Wot/n4qKQE09kuvTPgThLqBidInZOsodf1gKQJtTJXy0BcBC822VsOcwaL0
 EB1d9okkhRFFT+EJD8E0JTouLYipTkv92RqtFruZeCMm6tXoIc9Olu7bmo27Z6M6gP8C
 Ee6P4b99K9DWV78tIrZ7Glfl7Bs45eEc8HuPmNiY/ncbvS3byxhGJCS+eW84mkUzS6xE
 0CMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AN145UNIjgCQrhhYJVSogcaNNij6aeHMgkbf7MOZjVg=;
 b=svbdQpNqMmxD63Q3f2vmp+WYs+pX9VPLauT1OqL4OXXQK0Kd3oQoiSFkGaN5tpW9YP
 BCLK3Z8xuuaMzgZeHEK+5ovDM4Qjyf0A7Tvu0CIUY5OwFpoboh46xkFacM5hluEPJlfx
 V1bcp4PuBpJ64v46DBBEBGaLEdQ05Qc9npWoi7S/uByka1FXVZmO75pFAdIJRwki5dT/
 fn7fhtBOi7BABMkxDb5fq2beOtFlOJGxOU4BdSomReAhC/QN28BAfWqthL6IjzNsWOYZ
 OR2B+6x8y0JSBrGdL4TBZPtfBd8LSLSzT93uVg5YruaYUUspMiGyhU6/YYNUC7ZU4IAM
 F74g==
X-Gm-Message-State: APjAAAWRKJMSM6pEq3bEulFHKFLIb+6LR8l9NV+mHf+POtfeFd6fiX31
 Rd8oAPoHcP2MM54Qg6TFX7Dbpw==
X-Google-Smtp-Source: APXvYqzrAaqkDmpLPzkmJN8EFk6aA2w8b/wYYUsDcEBAy5YdGDdrITKGJVxwr155Rd6AEbyQ5sl1nA==
X-Received: by 2002:adf:f812:: with SMTP id s18mr26777558wrp.32.1565006609294; 
 Mon, 05 Aug 2019 05:03:29 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x6sm88683668wrt.63.2019.08.05.05.03.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 05:03:28 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [RFCv2 5/9] dt-bindings: arm: amlogic: amlogic,
 meson-gx-ao-secure: convert to yaml
Date: Mon,  5 Aug 2019 14:03:16 +0200
Message-Id: <20190805120320.32282-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805120320.32282-1-narmstrong@baylibre.com>
References: <20190805120320.32282-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_050330_815064_8AAB3798 
X-CRM114-Status: GOOD (  11.29  )
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
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Now that we have the DT validation in place, let's convert the device tree
bindings for the Amlogic Always-On Secure Registers over to a YAML schemas.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../amlogic/amlogic,meson-gx-ao-secure.txt    | 28 ----------
 .../amlogic/amlogic,meson-gx-ao-secure.yaml   | 52 +++++++++++++++++++
 2 files changed, 52 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt
 create mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml

diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt
deleted file mode 100644
index c67d9f48fb91..000000000000
--- a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-Amlogic Meson Firmware registers Interface
-------------------------------------------
-
-The Meson SoCs have a register bank with status and data shared with the
-secure firmware.
-
-Required properties:
- - compatible: For Meson GX SoCs, must be "amlogic,meson-gx-ao-secure", "syscon"
-
-Properties should indentify components of this register interface :
-
-Meson GX SoC Information
-------------------------
-A firmware register encodes the SoC type, package and revision information on
-the Meson GX SoCs.
-If present, the following property should be added :
-
-Optional properties:
-  - amlogic,has-chip-id: If present, the interface gives the current SoC version.
-
-Example
--------
-
-ao-secure@140 {
-	compatible = "amlogic,meson-gx-ao-secure", "syscon";
-	reg = <0x0 0x140 0x0 0x140>;
-	amlogic,has-chip-id;
-};
diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
new file mode 100644
index 000000000000..853d7d2b56f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/amlogic/amlogic,meson-gx-ao-secure.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson Firmware registers Interface
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+description: |
+  The Meson SoCs have a register bank with status and data shared with the
+  secure firmware.
+
+# We need a select here so we don't match all nodes with 'syscon'
+select:
+  properties:
+    compatible:
+      contains:
+        const: amlogic,meson-gx-ao-secure
+  required:
+    - compatible
+
+properties:
+  compatible:
+   items:
+      - const: amlogic,meson-gx-ao-secure
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  amlogic,has-chip-id:
+    description: |
+      A firmware register encodes the SoC type, package and revision
+      information on the Meson GX SoCs. If present, the interface gives
+      the current SoC version.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    ao-secure@140 {
+          compatible = "amlogic,meson-gx-ao-secure", "syscon";
+          reg = <0x140 0x140>;
+          amlogic,has-chip-id;
+    };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
