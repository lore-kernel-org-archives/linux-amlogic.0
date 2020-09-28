Return-Path: <SRS0=0gED=DF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4852EC2D0A8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 16:14:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E87A520809
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 16:14:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q/fTPt6I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FNsS1JaC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E87A520809
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SdqtXgHh/TNIpFuGMM22kjMHg9VndKSkdYF4aeWuS0E=; b=q/fTPt6IYxxin6bin3c0aSKwL
	6I0N74snXaBRJ6CuLMpKdvg46CgvOXi8X+Z4yqculyML8MHl3PIAD8noyQZVc6WhUYM2kmzmqzZUu
	MXx+duE1+9M+2RQlayliieO1yI3ysSzSAbu16ZxHy4vrmS4kaGoVrqI1YbklBNY5hjAS+EJFTvrdX
	5l7iCQTvSouO5Dg2ZQBax8odzRwX06LCEgL/FbDcyzSHnN4+L6aGwnaZ1TqWt3tSRhwkRryFbM5ib
	R73lAATva7n4k+qUJ+7jhDxHq8ZiaJ1WT2MP/iCLPw9y0KaOBzOwkS3nI+dVXeMSp4zL0dkN7A1mN
	GQRdmwURg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMvnN-0004ZG-Ut; Mon, 28 Sep 2020 16:14:34 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMvn8-0004Th-Gn
 for linux-amlogic@lists.infradead.org; Mon, 28 Sep 2020 16:14:19 +0000
Received: by mail-wm1-x331.google.com with SMTP id v12so1745086wmh.3
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Sep 2020 09:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vbHHP40xkg2uYk/UH9HSDIAS1kguxIesOVY207PSNWM=;
 b=FNsS1JaCt6m6mE/WfI8++x/y/+lxIpJoJGF+TsZB7s2VnQlOiprldL24g4EEBMhIdy
 pnZySMRZ91Rnxw8DhYbli2oDrlt/yfizs5leKTyZTtrLVjQVEsA4YoxPrtH8LtCPWE6F
 WtC37v5DzATeRgAGn9bfM8Iuw6HOBVgpTlswzf5QNYoDruGAsPupPfRvUDGCsL+YeAVT
 E9U25/3fjIddYm3az2X4p7/xeazYapF4KNfMDiGpQbUnZdYDnXNL60W83gjKuUWkq8JN
 hMpJLyNXdvsc9VRFFQehVCnOiw95MvMihshOxAi8s1ueIg6qZ6m5Aagp6fPid5/kCdF2
 g83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vbHHP40xkg2uYk/UH9HSDIAS1kguxIesOVY207PSNWM=;
 b=leliYNELGJ3yP3+884X/wzNnSDonicBeMyC6gDfx1quR9QJDJGv2isZPrYw13zBAqX
 zOKlzkajM5GmsS3ipGrdJB+pkYOEbVk2gv2QexLVp1mfpIpduuvz5wPpyFTbxm4lK0PQ
 Pq1ap3DcSDU90jU/S4XJX+f2ThfaGxVKYL8e51+oka0k089gf+M/NGk9UwT3lklWMIPZ
 ZMAZnzALRDyS14s4mpB5PmJ2dcpDsnkhkaJlwp8VyfzKM5XT6nQia5UR+/qc8urkNllR
 Ckk/5fya7EiJ6exS9NaHlcOvyhWppAhLT3S2aADVKT9LBelS/5mc4zyEIc7mmK0kBCus
 zdMg==
X-Gm-Message-State: AOAM532XRaye9fdbNVmFkhbG08XbpaFti9hVEhLRwPyFVOie/gxLjOpi
 7+CSFMmamGFFtGFGnaobyWeyRQ==
X-Google-Smtp-Source: ABdhPJz2Xorp3vXaFUhQ6uWGhTbeVdxJs51CEXnFKiSt47Nj3cKxXsEMNjeoSd7oepsFB9yy40noNg==
X-Received: by 2002:a7b:c848:: with SMTP id c8mr2254953wml.184.1601309657138; 
 Mon, 28 Sep 2020 09:14:17 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:19c2:a71d:5af8:dbf6])
 by smtp.gmail.com with ESMTPSA id n4sm2004867wrp.61.2020.09.28.09.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 09:14:16 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil-cisco@xs4all.nl,
	devicetree@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: media: Add bindings for the Amlogic GE2D
 Accelerator Unit
Date: Mon, 28 Sep 2020 18:14:08 +0200
Message-Id: <20200928161411.323581-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200928161411.323581-1-narmstrong@baylibre.com>
References: <20200928161411.323581-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_121418_599966_898ED864 
X-CRM114-Status: GOOD (  14.43  )
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
Cc: linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The GE2D is a 2D accelerator with various features like configurable blitter
with alpha blending, frame rotation, scaling, format conversion and colorspace
conversion.

This adds the bindings for the GE2D version found in the AXG SoCs Family.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/media/amlogic,axg-ge2d.yaml      | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml

diff --git a/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml b/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
new file mode 100644
index 000000000000..bee93bd84771
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2020 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/amlogic,axg-ge2d.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic GE2D Acceleration Unit
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,axg-ge2d
+
+  interrupts:
+    minItems: 1
+
+  reg:
+    minItems: 1
+
+  resets:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    ge2d: ge2d@ff940000 {
+          compatible = "amlogic,axg-ge2d";
+          reg = <0xff940000 0x10000>;
+          interrupts = <150>;
+          clocks = <&clk_ge2d>;
+          resets = <&reset_ge2d>;
+    };
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
