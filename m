Return-Path: <SRS0=6jDt=EX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC3E6C63777
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2020 08:44:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A7DD24655
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2020 08:44:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gUSs8JG4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="m+XnfnUx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A7DD24655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PDz5j0PqdMIf61gSJjGwV6MRg2FCT6DHKzbdMJeWUn4=; b=gUSs8JG4tUfwPsZhJNE+XGSCV
	5xY390M763ZlEpke7FnXQCFl+JvyrsRVJIo5rJ6wRJbQMaGnqpj5OgRSUlDEAZ7yKqnwYO5mxc3ke
	UceJK6/R6uRlFQNpI/fKAVjCBzBTku53+1TX0egGg09Gm2XCtubejLUk5ZMUdbutKyfPMWWX1dpWX
	1onBgKCjaauels24a9hyJAnx83WLrDoRuSyXhlUh49XshoLJkuf3XrGOIzlPKKa5yYw80ZgidDx4E
	Oz/yrOM+6yGMWOTTTxJTmsVhfyGuFmEZvRh7aqOPnr8NX3m5QgbpMfPx8AHMqRmObhO8T6s7JqyRF
	FUAtVLB3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kewbe-00029W-Lu; Tue, 17 Nov 2020 08:44:54 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kewbX-00026K-R0
 for linux-amlogic@lists.infradead.org; Tue, 17 Nov 2020 08:44:49 +0000
Received: by mail-wr1-x436.google.com with SMTP id l1so22286460wrb.9
 for <linux-amlogic@lists.infradead.org>; Tue, 17 Nov 2020 00:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LzZh3XDG0mukcB0i6UGoQqeuQTlDt+ZadapYwoHki6w=;
 b=m+XnfnUxTmcaf8SSzOQRSvg7cCdIGDLHhLFs1Z6EP9RGyPpK08t/tiOnxGxosSp2Uo
 9mgsojGSJ1UIRxYbsH3RWFflLarSd4RdCKczElvNWjNKVJnYhm4d4VgNJKjS4dDwOCYl
 2qixSc+qC7ldjQu/Aau5yoVE2txgXGJDA4CKfiazd1GQ8MaRYBu0JPU/cyJiLWRHMy53
 oig8SRkyYZ7lFjJyT0wVpuz/vheQ6sEiZeh3XjbECVxNvAXpqNFRL3EtSItyNUxu10Ee
 8Y7eDzaLqh7zQoKkXNXeO5Nx9Yiadny6igIKg3ZuOloWMn7h7BEahvNNsfbArmDVUHzO
 Q+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LzZh3XDG0mukcB0i6UGoQqeuQTlDt+ZadapYwoHki6w=;
 b=IY5G6TWqAaLuWV4odVYxudr91xRui/qiTwU8vy8A7dNajRyQfiKy3P67ChInPZDF5I
 P56jhyw+fqR7RjiRviwyP2xqi1y6jDgvsKbBvaQTMJpBviyTET49SokMT+DEz5C0ngEM
 TMdSMomzhd0Gg0LKjUgg5TrBmhl7c4tnAqwyNyiZKrMt5qBkQeu+6bY2z3Rlubd9k+yC
 uYokzt5LSfG3aAD8p97WijUE2PrgiROgZMCC1c8DD7LDa+3kR4aOcsOZNpSXAG8HBF0l
 pU1oaV/NBlpNzeCL9rM1aL30La03VZedUsNuaUlVxh37LX5FiolMXzdqElssBm36a6VH
 EyiA==
X-Gm-Message-State: AOAM530rwqK8Yxiu8qnWKGthWNaekrRD8pbwFvgwEqb5h4fk3vkA9wyx
 gbcnC4pcbeMmYUSCNUqBs08qsA==
X-Google-Smtp-Source: ABdhPJz7Xwfri6Tcac3P5f5Sv4NXug1hdJ29ICgaVg7kkW6e9qOiofXFXarPzRH2khs9xkf2V3O+ZA==
X-Received: by 2002:a5d:530c:: with SMTP id e12mr23510134wrv.355.1605602686559; 
 Tue, 17 Nov 2020 00:44:46 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:1561:9f4b:5829:8e26])
 by smtp.gmail.com with ESMTPSA id s4sm25631423wro.10.2020.11.17.00.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 00:44:45 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil@xs4all.nl,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: media: Add bindings for the Amlogic GE2D
 Accelerator Unit
Date: Tue, 17 Nov 2020 09:44:37 +0100
Message-Id: <20201117084440.578540-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201117084440.578540-1-narmstrong@baylibre.com>
References: <20201117084440.578540-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_034447_964673_925673ED 
X-CRM114-Status: GOOD (  14.33  )
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
Cc: Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The GE2D is a 2D accelerator with various features like configurable blitter
with alpha blending, frame rotation, scaling, format conversion and colorspace
conversion.

This adds the bindings for the GE2D version found in the AXG SoCs Family.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
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
