Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C62C433E2
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 11:10:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8928E2168B
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 11:10:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SMz9V1Wu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="L5LV3Tmz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8928E2168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VvwgubgraFCYgcoO01HlkoNmTpVltlDYIjfq31wYVyg=; b=SMz9V1WuSKxCwhoHmUGDmaApg
	XXanFLhW28dhLdnGtXjzaVEhTsiKnvQ6XGRO5PuCD0+OcyPehr/MZEpiiBedoZD5Fi2NxBCA3I7NK
	r62Op3NJa8asiXc6ND+E+kBJ69sMjEglmNs78HvIxf6Qn8lp8DtCS/TH0Wy+6rKUhUsfx+f2ENjFc
	aH+kfI65cn1pOYXN8vcgj9JO/mbOu1kaa1c823YIInjirfyucVs29qMwlvbN+5otpRZ4W+UXzMkKH
	UySzS/yPTA3JiZqBMIOG73ImjKa8u4WTGeemvjBzRcKxeNV2acCcDdQOIdvSpUQEnBFUs/Hs1WcTy
	XGhOE5yeg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFF2i-0004Mv-Qy; Mon, 07 Sep 2020 11:10:36 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFF2g-0004Lt-T7
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 11:10:36 +0000
Received: by mail-wr1-x433.google.com with SMTP id k15so15336337wrn.10
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2020 04:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ksfc1mO30cLXViBtYtZb85XN30sTC3Vit9JBymnzNwE=;
 b=L5LV3TmznwxKFMrjSInEz1r5fPbaLK01lzlEqVLfKgITk1M38tBh9QdrNF27X1ewbv
 ZJ5CYAaFOyCM5/1/HyhDBqiQXHF6QC2ItV03Crj1+DuptshphgdT2guRFJ5ogbztJ21e
 nvAhIRwVurv8gJ8aFWF4v9KZRPjSTHWTaSScPxm4r0ze38QLlYUZnuMGJ8UKmW3v0B62
 IIkezs/Q4LnnltkCxjhi1sThjVoXoneJF6QmZN9uvifez/woOa1yqSPTzWhWG6TPWjJN
 MlYdOSX6EKBwHjnkcguFebmW+tXjWHhBQJGqJHVCl9JguyHb7a/U/jDftkyHo8J8a37u
 fV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ksfc1mO30cLXViBtYtZb85XN30sTC3Vit9JBymnzNwE=;
 b=VyyV/nnR9A4EAv5DuPlUIZOyos+fTczkyv94FkbWiPJb4dOH8cQRgVf3Q7TMWlg2bX
 cSBfJXv81iiQ/+jsKL87yytDowgVl+Ke9HYHlHgJSYlIwW4bBHGY79W1j6DMGoSJxgCe
 5eH+F64As8ckhAj5Dk3RFm0SyFA+7rhR7mjoiz3kyk73CJXC6E+bexW7zKmdC+5Ks4hB
 AGDQXNWNtFp0g1LX6zDVrWZSaUfCVHuMdMylgcQOk7wdZXoEVHJSgLqvSBXpYeFkzJBn
 xhBqRku9HhXgifqKGMd6w6eBAUogip0J63WLejwrZLkq1ZrazrEBYnsz4uOw+ji8dF5v
 5ejA==
X-Gm-Message-State: AOAM531E8bzfYunlvRrdQKtkqaZCo2Yk34hqA5Ao0WPmudVc3X7BCq30
 /hycviK0FOgi8AM6HUXXcjskRA==
X-Google-Smtp-Source: ABdhPJxEekX2hSCryqMffGe1N5PtVtj5Lqq1CMosFkbr9M9VKGuytxsv/T6GZvG6eFxNQ24VGYt2Lw==
X-Received: by 2002:adf:9ed4:: with SMTP id b20mr21235068wrf.206.1599477033135; 
 Mon, 07 Sep 2020 04:10:33 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id u13sm19922111wrm.77.2020.09.07.04.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 04:10:32 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com,
	sam@ravnborg.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: display: panel: add TDO tl070wsh30 DSI
 panel bindings
Date: Mon,  7 Sep 2020 13:10:26 +0200
Message-Id: <20200907111027.21933-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200907111027.21933-1-narmstrong@baylibre.com>
References: <20200907111027.21933-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_071034_973290_E1CA58D5 
X-CRM114-Status: GOOD (  13.33  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This add the bindings for the 1024*600 tl070wsh30 DSI panel.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../display/panel/tdo,tl070wsh30.yaml         | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/tdo,tl070wsh30.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/tdo,tl070wsh30.yaml b/Documentation/devicetree/bindings/display/panel/tdo,tl070wsh30.yaml
new file mode 100644
index 000000000000..20f4fdedfcb0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/tdo,tl070wsh30.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+# Copyright 2020 BayLibre, SAS
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/tdo,tl070wsh30.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TDO TL070WSH30 DSI panel
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+
+  compatible:
+    enum:
+      - tdo,tl070wsh30
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  backlight: true
+  reset-gpios: true
+  port: true
+  power-supply: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+  - reset-gpios
+  - port
+  - reg
+
+examples:
+  - |
+    dsi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      panel@0 {
+        compatible = "tdo,tl070wsh30";
+        reg = <0>;
+        power-supply = <&vcc_lcd_reg>;
+        backlight = <&panel_backlight>;
+        reset-gpios = <&gpio_reset>;
+
+        port {
+          panel: endpoint {
+            remote-endpoint = <&mipi_dsi_out>;
+          };
+        };
+      };
+    };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
