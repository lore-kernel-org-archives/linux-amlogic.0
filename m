Return-Path: <SRS0=t7Bi=WE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6736C0650F
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 08:52:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86CBD2173E
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 08:52:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rvbFsY2F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="y4G4LoaS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86CBD2173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2rUwZHZcWDKB7/aghKrfMGhoo/9qkTQlTWFPXiqi+mw=; b=rvbFsY2FF/Wnbv
	Kws3tgm99pcmDikw3SttzHFJTMgmQw1WJGzyyQGTbwhbJKVNl79EtIRgkTetLBrwLMTKx/gmlwj1w
	A/RZUiSEea85oi1qKE3nkRvy+d4kSoHuh7w5nO/CW3Sp7Q2WCuqmV4ZbrMEmoenteMxqFhumKmROk
	zxmkWRBJPTjMIaVB8cv4r88wHpBta76QbXoAizD6Wa0PjySGMjdbxcFcIaSEmK8/H8qjhkOocsmfD
	1pfVJdXf9yJw1KNi9u1oR/Q5kfk0VXVTuznbbHWi2evP0KQynZY1Hjg5Rer0KTftgILZNrkb6gguv
	P05/xVWfr631Dl9rNtAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hve9l-00018P-RP; Thu, 08 Aug 2019 08:52:21 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hve9B-0000Zs-BU
 for linux-amlogic@lists.infradead.org; Thu, 08 Aug 2019 08:51:49 +0000
Received: by mail-wm1-x341.google.com with SMTP id v19so1567126wmj.5
 for <linux-amlogic@lists.infradead.org>; Thu, 08 Aug 2019 01:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aXu1nRy+aYfVaPMzwlTQ/4xQ6m4HH0lPk2OELcN4n/s=;
 b=y4G4LoaSpFBdBRVb/la1Vnwn6s+lQ50FXLlIU8QWaO4fMWqWShK50P4LvPLnCzgZGi
 wqp0YLJbzQEEb9IFfKWR/Cu5xI0XOZ7IXsuV/GDTqHAO6HPCzUms7+lNVceXPCIAEJXz
 60/tvmd+D5VkbnvUCwPv2YoY6Vfm7gCm+nMJMwTuU/De3bIlwk6pElZnKaUgsEZIo5iQ
 +tSNcETig87NGSOcW8y/lGblIU7Xs/vNlviwbm7of2JNzSAowmm4NPqgblRVbe7OfuKp
 mJkxH6BmgOS15rf8B4d7R4ClOGRkCwh1gAEBvvUvhOB/eVuftpiHAewC0h22b8RFIe2f
 3U5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aXu1nRy+aYfVaPMzwlTQ/4xQ6m4HH0lPk2OELcN4n/s=;
 b=fLTg35W72Dt9sdbc5HWy407jmB3gDnr3GRgaRDLHvttzdloAe3VHZ6/Luk3wMWJcz5
 QjEh5SWjA0jCsJ3Slrt9Z8nz3X6H3QzZzxKLa0C4Csc/nDTMNISEVm+QnJpDd7k2dl3O
 sshZXUTBbRxHjt3zDl3pHIJcKREGslJU3dXZJuibp2MW4dHDbB9boK51rzt0hNY6E2mO
 /NkMPL6eG/kkQNG9SbqjfHQpymOKYQkRq5bbSjFBZ8FqNFsM1sVuPNanvstDpIK8NmOS
 IQW+zHIHX1c6/Q/8eqZDFQybU8ZHEsa4E+OOrfc98M/bLh00Q1+eq+oN1bhgFUzlzQHG
 ispw==
X-Gm-Message-State: APjAAAUdQo7ttBHawQpd03DLHRuE0rMqVbBdjFR/LJAt9FnLyqUzqoMQ
 ioqkXB4kRzMfwbtVFtuMWaA7nQ==
X-Google-Smtp-Source: APXvYqxTq0DTZdne0Hpdf61fadd2IYVjlm+wBmSqmsptWpUhR0qaNtA+06vzVTvzrupVkiJRZJ6tQA==
X-Received: by 2002:a1c:f918:: with SMTP id x24mr2918700wmh.132.1565254303546; 
 Thu, 08 Aug 2019 01:51:43 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i66sm3360031wmi.11.2019.08.08.01.51.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 01:51:43 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [PATCH 2/9] dt-bindings: rng: amlogic,meson-rng: convert to yaml
Date: Thu,  8 Aug 2019 10:51:32 +0200
Message-Id: <20190808085139.21438-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190808085139.21438-1-narmstrong@baylibre.com>
References: <20190808085139.21438-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190808_015145_430292_7F5F109A 
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-crypto@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Now that we have the DT validation in place, let's convert the device tree
bindings for the Amlogic Random Number generator over to a YAML schemas.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/rng/amlogic,meson-rng.txt        | 21 -----------
 .../bindings/rng/amlogic,meson-rng.yaml       | 37 +++++++++++++++++++
 2 files changed, 37 insertions(+), 21 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rng/amlogic,meson-rng.txt
 create mode 100644 Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml

diff --git a/Documentation/devicetree/bindings/rng/amlogic,meson-rng.txt b/Documentation/devicetree/bindings/rng/amlogic,meson-rng.txt
deleted file mode 100644
index 4d403645ac9b..000000000000
--- a/Documentation/devicetree/bindings/rng/amlogic,meson-rng.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-Amlogic Meson Random number generator
-=====================================
-
-Required properties:
-
-- compatible : should be "amlogic,meson-rng"
-- reg : Specifies base physical address and size of the registers.
-
-Optional properties:
-
-- clocks : phandle to the following named clocks
-- clock-names: Name of core clock, must be "core"
-
-Example:
-
-rng {
-	compatible = "amlogic,meson-rng";
-	reg = <0x0 0xc8834000 0x0 0x4>;
-	clocks = <&clkc CLKID_RNG0>;
-	clock-names = "core";
-};
diff --git a/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml b/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml
new file mode 100644
index 000000000000..a9ff3cb35c5e
--- /dev/null
+++ b/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/rng/amlogic,meson-rng.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson Random number generator
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-rng
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: core
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    rng@c8834000 {
+          compatible = "amlogic,meson-rng";
+          reg = <0xc8834000 0x4>;
+    };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
