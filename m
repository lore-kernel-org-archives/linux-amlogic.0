Return-Path: <SRS0=nSpp=E5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FD0C56202
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2020 14:52:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14A302075A
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2020 14:52:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hmj6EBoq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bFSnRKfL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14A302075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=92wWe7/XCNIba3aC6kkhHiRtRzUAX6rd6/G8oKkw3hs=; b=hmj6EBoqdwneaDawLURMaGr4V
	1E4P8z/RjXVgJZSYY0nrjUaTZXrHLddOeDNgGqSZIb5u393BR6qMUqGpJamQjvmwXR4gFaunMbLBW
	cdYrtplieIlGtQTiinj7YA4W8QbR+mfem+nLX+GBUOtU7fUnxbL5ErZO8rFMcxK6CKWLh7dWOP/sj
	ClljEE5ACHwd31AwzXQbKRStVrwlmWpGojquLbUyHVHGWo70C/KkS6ja47h5koRgpHM2/WYjjS5oS
	haSeWd/wKawsHQtgM6rw/C/1+krbQm4/uQ+VFgTQCPM6Gim/I4K66AiJlwzeFl5NtGxBxqkB9dbp9
	o3Mic+Aew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khDCU-0002Kb-QY; Mon, 23 Nov 2020 14:52:18 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khDCG-0002G7-9r
 for linux-amlogic@lists.infradead.org; Mon, 23 Nov 2020 14:52:06 +0000
Received: by mail-wr1-x432.google.com with SMTP id r3so563169wrt.2
 for <linux-amlogic@lists.infradead.org>; Mon, 23 Nov 2020 06:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vEZ1OITwjc7OKfdtDJWO+IuuMpz7cR7Bh/LeoiGOQ8k=;
 b=bFSnRKfLlSTZsjpOyZlRdLr+9GsxVTIDaXh+Ozrr/6iIla6U4mb9wzUtVuMVNV2p/p
 FS/gLQbhUfAm1NBEaGqd+9GayjqPA48f+inUJO4yY7oEzG1KKuuXkHB8d7lZUywQI/h5
 zLhaoc8l/XeIK4P4AGPc52EZLRVkvGvtaUSal/pwA1bMubyw+vko7WdhmyEtAsHTxMRi
 xNW/Rc8Dn4WOhKTaqMe5E+kxw1gEKVA58UEi600DsdzbS8CedNBTkb4QrYklxQlFNEzb
 GCo5qWfXS4RNsXKmA6Q4Jbu0va5RZuDhLnwpYYDbi+djTz/oc1A1rtud4SHN46v54kSp
 bvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vEZ1OITwjc7OKfdtDJWO+IuuMpz7cR7Bh/LeoiGOQ8k=;
 b=AWAeabmXmfAk8Uy8LbAj5P3ywyE7x2ek+w/eLsP4EszEHaT3jPVtr3wevB4H25vN2r
 B6u8FWkWhHKCXjKHsG+OlyAwTiYtGedmUrXqc5r9ZOyQBM0MJSzOoc6tnDW3DUUlWV+3
 5Uy7t6F1Jl74DCM6usys/u7TE9Jdnc2KC/ONZ+UTPPwr6Lnvx3p+w49tq/tFEcJLwRul
 rGlwmIx68BuZlaOLQSOFZaHzXbmiDd2HonrYl7/BBBppjaef/lazo4qkflpmCaNBoV4o
 UL3t5vBfS6XNO+1LmlJZn1koWxpcFPWbzqLw3r4sxLt4e1esfAPdRnMUH9y+zUITd4Aq
 kNIg==
X-Gm-Message-State: AOAM532le93H/XjlMW3hFejNEC/u8XW0Zy5k0PGq8xJ/M6ccfVZ6946Q
 k8OqI6VZMd7WtXSkBFbP8rtSnsKe5uSUl6Wx
X-Google-Smtp-Source: ABdhPJyCKHzsFFIcaH2EeQrhpd3TFYZexAVFJ1Jhy5BUT/T1CRHH+5hqfiSTieF5VcrojJRsELxkPA==
X-Received: by 2002:adf:916e:: with SMTP id j101mr25757231wrj.55.1606143122651; 
 Mon, 23 Nov 2020 06:52:02 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:9541:d2fd:3a68:67ae])
 by smtp.gmail.com with ESMTPSA id 9sm14225175wmo.34.2020.11.23.06.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 06:52:01 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: vkoul@kernel.org,
	kishon@ti.com
Subject: [PATCH 1/2] dt-bindings: phy: add Amlogic G12A Analog MIPI D-PHY
 bindings
Date: Mon, 23 Nov 2020 15:51:56 +0100
Message-Id: <20201123145157.300456-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123145157.300456-1-narmstrong@baylibre.com>
References: <20201123145157.300456-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_095204_403892_CB53152F 
X-CRM114-Status: GOOD (  14.26  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic G12A SoCs embeds an Analog MIPI D-PHY to communicate with DSI
panels, this adds the bindings.

This Analog D-PHY works with a separate Digital MIPI D-PHY.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../phy/amlogic,g12a-mipi-dphy-analog.yaml    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml

diff --git a/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml b/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
new file mode 100644
index 000000000000..28663552f05b
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/amlogic,g12a-mipi-dphy-analog.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic G12A MIPI analog PHY
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+description: |+
+  The Everything-Else Power Domains node should be the child of a syscon
+  node with the required property:
+
+  - compatible: Should be the following:
+                "amlogic,meson-gx-hhi-sysctrl", "simple-mfd", "syscon"
+
+  Refer to the the bindings described in
+  Documentation/devicetree/bindings/mfd/syscon.yaml
+
+properties:
+  compatible:
+    const: amlogic,g12a-mipi-dphy-analog
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    mpphy: phy {
+          compatible = "amlogic,g12a-mipi-dphy-analog";
+          #phy-cells = <0>;
+    };
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
