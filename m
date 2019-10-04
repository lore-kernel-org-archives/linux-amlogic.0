Return-Path: <SRS0=++Ji=X5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81934C47404
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Oct 2019 09:01:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C06F206C0
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Oct 2019 09:01:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UaGUYhz/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="iqiZDv6x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C06F206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Gf4jwlrHhQBQSwyGMwh9Voe+VmBqS/St9bjC+gXw33c=; b=UaGUYhz/fBJCoyQqRNZ/PSehTC
	EBBc0z+wZl3ncvdGiU+cAwZ1TpMpMFWjNI6BdZ1CY72j1BE1QKJglWox61CsKVFFr35Qv9/xx9IEC
	AUyrVBWPohx/9mmj4Qoxrqgo2dcbavIkDU3txbO4s6izmgY32T8q7lyakB6lQ38c6zEDHzoM4qXbB
	cSmSc6bS9NIbc/+LWBcQGkbU/AL9Ks0OAzhJqDTPRkkz59jTx0aMm6SIvy5agBcMBvLoAj9VrPV4y
	x1gsOhVdYTCOuixkNuFuBcF25g7vX9Z7vibv6sQeayYZmI4ldIkiN2p4VROEOWOKII3yOn85oLCiw
	Ij3iSFAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGJSv-0000te-C6; Fri, 04 Oct 2019 09:01:33 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGJSg-0000f7-Ks
 for linux-amlogic@lists.infradead.org; Fri, 04 Oct 2019 09:01:20 +0000
Received: by mail-wm1-x342.google.com with SMTP id a6so4930886wma.5
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Oct 2019 02:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Qa7DsO3ACeYY6r1oXxNziZNrJiVR8gru+lXValqW5yo=;
 b=iqiZDv6x4j5j7J4/i345eIHtj37AQf+5xW7hlIXOH4S/3064hPddqNd3O0p0FSN39v
 E1IZ/wcxnjvKYl7egSdMnEFegm+tshD7vZf7BF5bG+9WJ8M/HsreAdGCcbwUo6mWQaWD
 j19+wOFVmiEs0E2TDwQ9QjTgiILjeJD4wm/eqRKj4FxR6i4Sd+Rwz+WT516McZn+5Aak
 NpobKJQQLQXgF2w8nPfrsCPUSsbWsAfPthBU4T9rPLART/mjxAeMQnvmaddg7dzzW8Yo
 KhYbY0cHJN/86MEVbIn6VBySuFt8UGK7uo2BYdfd4KFufko+dcMMmUrXCX52Eq+Z/u9U
 f3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Qa7DsO3ACeYY6r1oXxNziZNrJiVR8gru+lXValqW5yo=;
 b=Ocw9gmhC6Dvpd9k7pNyIdsTu1nOfFsWERQgSIvjy3LRSnb4hC/4eUTXgjPMfb6O5e/
 fyBlDAEBCSKTds8UbG5pm6/MFIrPBP3dyKFYjUbSAVnu/YOrJOMkRvg7l3QJQHqNbenh
 4pV4SXii/jQuvpe8Ihvqa0idObcmRFZHmQcK/kpjFDGDPEQMD4bYM+gWeCLAr0va7vG0
 hRjMNyCyYbwm3KQoIWMSOFn1e/8CRGW33/hBrncuTTDFTCDJ2qnER7xM6J4aKn17Fw0s
 FbFJzGhSRaHZ32B/CHUtJHo9Nct3bIN9y3dwuHsqdvnx7jz+VZQBUulZmbtydnFy8Djw
 n0yA==
X-Gm-Message-State: APjAAAVcHvcyKvXT3Lgbxdxek+fvDYyPxGIiWFksuYoLdhmEEdz4R5rE
 2rEuVeg/4dITO0Zi3ure91U/5Q==
X-Google-Smtp-Source: APXvYqz6Wrjp0Gh/DAqC/UBRAVNNd14/cnfE4WZ/qx3dCtQWucaJsnEwIFqwRzAEV2sRVie5vL2wCw==
X-Received: by 2002:a1c:a6ca:: with SMTP id p193mr9887223wme.103.1570179677139; 
 Fri, 04 Oct 2019 02:01:17 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v8sm7765170wra.79.2019.10.04.02.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2019 02:01:16 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: amit.kucheria@linaro.org, rui.zhang@intel.com, edubezval@gmail.com,
 daniel.lezcano@linaro.org
Subject: [PATCH v7 1/7] dt-bindings: thermal: Add DT bindings documentation
 for Amlogic Thermal
Date: Fri,  4 Oct 2019 11:01:08 +0200
Message-Id: <20191004090114.30694-2-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191004090114.30694-1-glaroque@baylibre.com>
References: <20191004090114.30694-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_020118_690376_F5A17DEA 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Adding the devicetree binding documentation for the Amlogic temperature
sensor found in the Amlogic Meson G12A and G12B SoCs.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>
Tested-by: Christian Hewitt <christianshewitt@gmail.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 .../bindings/thermal/amlogic,thermal.yaml     | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml

diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
new file mode 100644
index 000000000000..f761681e4c0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/amlogic,thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Thermal
+
+maintainers:
+  - Guillaume La Roque <glaroque@baylibre.com>
+
+description: Binding for Amlogic Thermal
+
+properties:
+  compatible:
+      items:
+        - enum:
+            - amlogic,g12a-cpu-thermal
+            - amlogic,g12a-ddr-thermal
+        - const: amlogic,g12a-thermal
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  amlogic,ao-secure:
+    description: phandle to the ao-secure syscon
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - amlogic,ao-secure
+
+examples:
+  - |
+        cpu_temp: temperature-sensor@ff634800 {
+                compatible = "amlogic,g12a-cpu-thermal",
+                             "amlogic,g12a-thermal";
+                reg = <0xff634800 0x50>;
+                interrupts = <0x0 0x24 0x0>;
+                clocks = <&clk 164>;
+                #thermal-sensor-cells = <0>;
+                amlogic,ao-secure = <&sec_AO>;
+        };
+...
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
