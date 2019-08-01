Return-Path: <SRS0=NajJ=V5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E76C19759
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Aug 2019 13:58:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CB7B20838
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Aug 2019 13:58:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YiEYhhl2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="liznztNk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CB7B20838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QVWSOFW3fl5FQHqAojO+sDanM9uDI5xytOUZOZtdjHQ=; b=YiEYhhl22ZJFr7
	eoivAejmMM2qwU0q5ee+/9eiuOkxmBymEjTb+FGs+VLncpFk10dVFjY05joR5aE7L8EozE7JpDcrH
	VPyaV2XrC/lTovm9t7aand9+IxiUqaEqXRMol7+uNQFEAXn9EDT6YMjbWQJCFVCCpRaJsEsfCWEuo
	Nw1qCOOPPQxidEi8VOsTIlK4UxeGlyC3b+aTVI8zxRrqMf2L2uRYX8ZKYeeLverQj6y6jy2XMS0FE
	vpvilmGP0pAbPRmrfB3um5P9wYPhui7amxKNdcsinOgUcGiKtEh9e3knupLiwC/TQChglskXaPHUe
	GQNEoubAxcPv8kZruEcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htBb3-0002hl-RB; Thu, 01 Aug 2019 13:58:21 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htBZc-00011N-UV
 for linux-amlogic@lists.infradead.org; Thu, 01 Aug 2019 13:56:59 +0000
Received: by mail-wm1-x329.google.com with SMTP id v15so64777482wml.0
 for <linux-amlogic@lists.infradead.org>; Thu, 01 Aug 2019 06:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=811mn6h7BNpLFUFRrmR/tEgz9ZLFJSvBZeY34iDH0W4=;
 b=liznztNkf+HaxNv4vDJ5h6mGA3fjnV9yCpU/CovEfrMymt6M89vJGWMoWD6C0sGApz
 912jSQwrhWdZbBR0RY+BCaxE3pNPTH16FR7k9Wk5LeZFpFzdsq6JRup+E68hSoM1eeJ9
 9oErfWpptm9nX4hdnJfzy9jVTU1ntuxSNDdwNHwk1V4M9jBFowyH9RIWDYFjvZXuFI0F
 zwDgK8Li7HQOzhwVnX/6OERcWGIUga8+KczKm1DzwdYYhijv25afQYvy/Jh92o2d9Le1
 vFlyK1/+J2QrNVWsP4Fwo/MnMqjBgBYxyRi93IOxIH7tVPTrwfBAkuwleMD0yLkLdGZb
 VJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=811mn6h7BNpLFUFRrmR/tEgz9ZLFJSvBZeY34iDH0W4=;
 b=p3rWPImDVapBn2Z55eHyXw5/KSJSIRhkr1o4mljmSKbrH+FzOdTNCJU2aLXlQipKsf
 8CjHXvN5jEuzDcfE7NPedrcFrluALmqCRaY+0wWJ0EO8a3cBjCPtZ0sNvfkB2ehpuBXd
 CYUChH3Wt0e05GHI4HmBNNXMevv0T1aHUDWEEnBAG2zTit1OuU7aYNVSfDqdl5Wv1hiY
 lm0frekV95tgJneOxONw/YugYP93YEQh1aZ8smoPZmr5TLjD0iNA8YiYmkh8KBmHpYG9
 Szb3xmPe1WMx+UkrnpbwuFuG9HSeC18v8oRSIIxnuJQlmYQo6Vi3+mzH2RsJFlaTOGs/
 m3Zw==
X-Gm-Message-State: APjAAAUkio7CE0++Pcd1SmlvNSdv4hz08p0h17e35ic15cYTfdio9NyI
 H30rRuM/dlEZy2Yo540b66FgqA==
X-Google-Smtp-Source: APXvYqyfvyFU9SSffsyaUbEsXJgcEKqe2ZJr3jB7G+EChkf++HWqfgukB7b/r9YHXfnQrS5QixFc/A==
X-Received: by 2002:a1c:7310:: with SMTP id
 d16mr113441831wmb.107.1564667811496; 
 Thu, 01 Aug 2019 06:56:51 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id u6sm69659952wml.9.2019.08.01.06.56.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 06:56:51 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [RFC 5/9] dt-bindings: arm: amlogic: amlogic,
 meson-gx-ao-secure: convert to yaml
Date: Thu,  1 Aug 2019 15:56:40 +0200
Message-Id: <20190801135644.12843-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190801135644.12843-1-narmstrong@baylibre.com>
References: <20190801135644.12843-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_065652_982063_EDF349A6 
X-CRM114-Status: GOOD (  10.80  )
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

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../amlogic/amlogic,meson-gx-ao-secure.txt    | 28 -------------
 .../amlogic/amlogic,meson-gx-ao-secure.yaml   | 42 +++++++++++++++++++
 2 files changed, 42 insertions(+), 28 deletions(-)
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
index 000000000000..cf79287498f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
@@ -0,0 +1,42 @@
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
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-gx-ao-secure
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
