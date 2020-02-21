Return-Path: <SRS0=5fWL=4J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50785C35655
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Feb 2020 12:23:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 205DF24656
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Feb 2020 12:23:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AhzHu3mE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PLua7VeZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 205DF24656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PwsIQwYHPg4eHmDDUXxAodvLBan0ZwDFTiDjqUfQkyM=; b=AhzHu3mEPxdGor
	em3y8wK31I6CtIAGCpnIpr70XRkwaHrTL12xwIVldQKMSzgO0KUs12zqt8xQLRS2njsABgy+ltI2S
	RqjfjPL0oaY4aDQTNhwmVi5zw8VzyziyRWYbR8LLukrbgaEwg6/N53nrnV0gvBE+pfwr54XrpgS/Z
	7tIGwnUxwfohLOyjEJuv0zhA+Q/Kf7Ink6tfcE7Y5Ja4EYosIUJ9wL18H/wt5H0XC+wfksHaMpUrj
	fN8aRrOIGPOItpyMktyYT2ztpoMHajz57Esbkovh8zTXlX/fRaPkLXVpzh+QY/QkvlqJbo0m/ipx+
	GQUGex5zHqM9fs9McgpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j57KY-0008QD-FI; Fri, 21 Feb 2020 12:22:54 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j57KV-0008OE-6w
 for linux-amlogic@lists.infradead.org; Fri, 21 Feb 2020 12:22:52 +0000
Received: by mail-wm1-x343.google.com with SMTP id a9so1587681wmj.3
 for <linux-amlogic@lists.infradead.org>; Fri, 21 Feb 2020 04:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tqEQ5jIvmw/mgMvZjaDSuL/3Rd6IGcOEgjWBEmD6jMI=;
 b=PLua7VeZzwIcVj+hwSLftKcsvF1Az9k4Ybcwyye6rFiPkd7V2kwZ2LlM9IKZQhsrcY
 lwYXqpdC5p36lJSnLd6SOnMvqf2G5mVtvcoRvCNxZ6FOwnffUb6GWd1lt1SpU4RiAKVB
 Zeui1EzKUaGoGIfjXdrE/vrBlk23BcChYfCaNoRsZAMzi8UxMw6nxXXL3yiiJXLHE10b
 cIC7lVXkXe1coFDD0SnJ7ALecL3azNVCfR6MFh4z0KUvzxmO3FNG3hS8GEvfieUfL3jw
 Sbw7H6LCzKahIZC0x4flfGCGOjrmxVITR9PGduGTCm/Odfp0jo8Yi23/dVkt7rF3oEpP
 yjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tqEQ5jIvmw/mgMvZjaDSuL/3Rd6IGcOEgjWBEmD6jMI=;
 b=LstjND0A6LdQewhRK9XU/wHqgE+1V2cZ1CkY7k8cTZTZoFlOZ4u4XUmnuyFKzennsb
 BlONyNVprw1M5J7jOSBhMZV3CwpV5EapEiItFrspuk2QkURUzpy4ZbCamseSLw/+0PgL
 rv6EVqGuiJyHnVaY1ZUheGYMpfW2+RTipoI+TJIPCJVAafST4oY16hbO/zjogx3rNLbJ
 m98CGjxa1B7JS2+O0mYV6DiX7EHd/TqRL+vENvwi4/flYAhJmy4vnRoN3OWrW/MgfjPv
 na6gsNzDf0N6JDZsLd8uq7GceQx8b5/96Ela4Kj0BKhaPKKhyDk6rvbHp4JxSV2Gn390
 bnSw==
X-Gm-Message-State: APjAAAVOKfsymzx9ET3I1O5CNKsPgOi4BkfzRIN3k0cUlMhTQ97An4AY
 vFI09n5lGvh25Xui8fOtBlqang==
X-Google-Smtp-Source: APXvYqzOPdCf7kHIVEmbaZYquZ7dKDOguVj3XvMjZhAdZ4A1XLpWmDHIv64vXwu7v/J8V8d8c4HS7Q==
X-Received: by 2002:a1c:f008:: with SMTP id a8mr3477355wmb.81.1582287769710;
 Fri, 21 Feb 2020 04:22:49 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id p26sm3454653wmc.24.2020.02.21.04.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 04:22:49 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 1/3] ASoC: meson: g12a: add toacodec dt-binding documentation
Date: Fri, 21 Feb 2020 13:22:40 +0100
Message-Id: <20200221122242.1500093-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221122242.1500093-1-jbrunet@baylibre.com>
References: <20200221122242.1500093-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200221_042251_248140_B0B326C6 
X-CRM114-Status: UNSURE (   9.36  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the DT bindings and documentation of the internal audio DAC glue found
on Amlogic g12a and sm1 SoC families

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,g12a-toacodec.yaml | 51 +++++++++++++++++++
 .../dt-bindings/sound/meson-g12a-toacodec.h   | 10 ++++
 2 files changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
 create mode 100644 include/dt-bindings/sound/meson-g12a-toacodec.h

diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
new file mode 100644
index 000000000000..f778d3371fde
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,g12a-toacodec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic G12a Internal DAC Control Glue
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+properties:
+  $nodename:
+    pattern: "^audio-controller@.*"
+
+  "#sound-dai-cells":
+    const: 1
+
+  compatible:
+    oneOf:
+      - items:
+        - const:
+            amlogic,g12a-toacodec
+      - items:
+        - enum:
+          - amlogic,sm1-toacodec
+        - const:
+            amlogic,g12a-toacodec
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - reg
+  - resets
+
+examples:
+  - |
+    #include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
+
+    toacodec: audio-controller@740 {
+        compatible = "amlogic,g12a-toacodec";
+        reg = <0x0 0x740 0x0 0x4>;
+        #sound-dai-cells = <1>;
+        resets = <&clkc_audio AUD_RESET_TOACODEC>;
+    };
diff --git a/include/dt-bindings/sound/meson-g12a-toacodec.h b/include/dt-bindings/sound/meson-g12a-toacodec.h
new file mode 100644
index 000000000000..69d7a75592a2
--- /dev/null
+++ b/include/dt-bindings/sound/meson-g12a-toacodec.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __DT_MESON_G12A_TOACODEC_H
+#define __DT_MESON_G12A_TOACODEC_H
+
+#define TOACODEC_IN_A	0
+#define TOACODEC_IN_B	1
+#define TOACODEC_IN_C	2
+#define TOACODEC_OUT	3
+
+#endif /* __DT_MESON_G12A_TOACODEC_H */
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
