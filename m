Return-Path: <SRS0=czMH=V4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F05C433FF
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 12:44:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26D38208E3
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 12:44:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kq3zUQ+P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ckHocCML"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26D38208E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KGPnCiIH8YIfPX9LqdRoTbmSpblOCGOrPF06HpsjQFI=; b=Kq3zUQ+PlcgwTl
	1swTBPtsEy6HKoC8IS7bdmiEbhs3VXC+HJHtiV0/+YfLoykXlInNgsZNUnErD4pZpgTCCtdgJSpTD
	h4eOMLbSamTJbpBW+YHa0SccPZaVMCXqh0Yoru7RJS/xR6Hg+0yVhVoBggtDzk5rr8otPJ6ox32Dw
	3z3xJDyPJpeJ4l99rGMNVD8SuyMbuTku6UNvw3E0NlUvbZ0mSnIZrLyZCYLIwkShzHqYr5FF98E5s
	gva5O4fgDpKh+e/qlvk65FzY7okLOZy8p31yALa74qaKsbiRS9NQngwRNaOU8M8bVo1Q596z0DFCK
	VPKcPqctTXHIHOutZq5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsnyB-0006jd-Gk; Wed, 31 Jul 2019 12:44:39 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsntr-0000OY-FO
 for linux-amlogic@lists.infradead.org; Wed, 31 Jul 2019 12:40:20 +0000
Received: by mail-wm1-x343.google.com with SMTP id v19so59707699wmj.5
 for <linux-amlogic@lists.infradead.org>; Wed, 31 Jul 2019 05:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WizoPIpJaKEOM8keVQY+4BOKIt1ZSfvce2lQKnegAL4=;
 b=ckHocCMLDHqzBF6s9DOcxp+6e/eLz9YRUmG9keahMxrmfPKFZUV/54T/2IjBgXhhe0
 YffPVI0DLYjh2Bwamhr2sdgPK2TeDL31oVVgfEsEx3NYWpMCAQDgl9yCkSSdC57R2Vi/
 2IBm0Utoyeb2vMeF21sPvlom7FAQMWAoL2SDGG3jmrf+qQp4cffFACh11pM47cAPI8Ez
 apIzhenEoWSRlCdTv+7KnkobDyJhqM9BQX6qASZUpQsxugBjfkyYJWiPcK8hWBYr149b
 sTbWuoB7rWeybmX1uPGoIjMnDAVJbA3Z/fNTuuRVb7ZTTcbFU17pTI9FwXaKgdT2VUo+
 NzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WizoPIpJaKEOM8keVQY+4BOKIt1ZSfvce2lQKnegAL4=;
 b=TuFjMWHYaw68DXFgbYe1swi9CrORLOsJBupM4y4RXFhxjVM9qGOXNYPp4xnXx8mi9t
 /pSdP+beM5gI3/782Etf3wFzbVpGya2tSJCY1+Q5QTBspq6ACTdBL/9uyPESyYgrSGYf
 77VaTTkCs97vuR9QQSrU/zVPuEJDQoWvf/NRowS1qXcnhCVXD6po8wzLRzeHVAFofo1q
 OdL5u7wkuagqCOM9Kx9SuEvKrvHZstdcy6svMyyzTxfcxT6Im/GI1bMh8ppDsYJH22rx
 pTgcFytFTxqPyE6ir90vxgR8jzkYEwU0MnQtLH1eDQGii+Hwuth0x3m9kHDLZA2PiToh
 PwVA==
X-Gm-Message-State: APjAAAULsUQZ54HYA6mgsgwrz3kYfl7wMkxGKCMMc0LuqdrFBa8B8sIl
 8k6OcUKKVN/W5waG8DrW818pag==
X-Google-Smtp-Source: APXvYqwDPOxco6g/MHBgaf8q6x2onNr51cb1t1+BxEgPGrv/rv4Hu0+/MZkWCY9T61/xK0sYnPpWFA==
X-Received: by 2002:a1c:ddc1:: with SMTP id
 u184mr108079706wmg.158.1564576808108; 
 Wed, 31 Jul 2019 05:40:08 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x185sm62504271wmg.46.2019.07.31.05.40.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 05:40:07 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 5/6] arm64: dts: meson-g12b: support a311d and s922x cpu
 operating points
Date: Wed, 31 Jul 2019 14:39:59 +0200
Message-Id: <20190731124000.22072-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731124000.22072-1-narmstrong@baylibre.com>
References: <20190731124000.22072-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_054012_029016_C67F6282 
X-CRM114-Status: GOOD (  11.53  )
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
Cc: linux-amlogic@lists.infradead.org,
 Christian Hewitt <christianshewitt@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Christian Hewitt <christianshewitt@gmail.com>

Meson g12b ships with a low-speed (S922X) and high-speed (A311D) variant
so remove cpu_opp_table nodes in meson-g12b.dtsi and create two new dtsi
that can be included in device-specific dts files. Opp points were taken
from the vendor BSP kernel.

Also make meson-g12b-odroid-n2.dts include the new meson-g12b-s922x.dtsi.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12b-a311d.dtsi    | 149 ++++++++++++++++++
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts |   2 +-
 .../boot/dts/amlogic/meson-g12b-s922x.dtsi    | 124 +++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi   | 115 --------------
 4 files changed, 274 insertions(+), 116 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
new file mode 100644
index 000000000000..d61f43052a34
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include "meson-g12b.dtsi"
+
+/ {
+	cpu_opp_table_0: opp-table-0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-250000000 {
+			opp-hz = /bits/ 64 <250000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-667000000 {
+			opp-hz = /bits/ 64 <667000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <761000>;
+		};
+
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <781000>;
+		};
+
+		opp-1398000000 {
+			opp-hz = /bits/ 64 <1398000000>;
+			opp-microvolt = <811000>;
+		};
+
+		opp-1512000000 {
+			opp-hz = /bits/ 64 <1512000000>;
+			opp-microvolt = <861000>;
+		};
+
+		opp-1608000000 {
+			opp-hz = /bits/ 64 <1608000000>;
+			opp-microvolt = <901000>;
+		};
+
+		opp-1704000000 {
+			opp-hz = /bits/ 64 <1704000000>;
+			opp-microvolt = <951000>;
+		};
+
+		opp-1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <1001000>;
+		};
+	};
+
+	cpub_opp_table_1: opp-table-1 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-250000000 {
+			opp-hz = /bits/ 64 <250000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-667000000 {
+			opp-hz = /bits/ 64 <667000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <751000>;
+		};
+
+		opp-1398000000 {
+			opp-hz = /bits/ 64 <1398000000>;
+			opp-microvolt = <771000>;
+		};
+
+		opp-1512000000 {
+			opp-hz = /bits/ 64 <1512000000>;
+			opp-microvolt = <771000>;
+		};
+
+		opp-1608000000 {
+			opp-hz = /bits/ 64 <1608000000>;
+			opp-microvolt = <781000>;
+		};
+
+		opp-1704000000 {
+			opp-hz = /bits/ 64 <1704000000>;
+			opp-microvolt = <791000>;
+		};
+
+		opp-1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <831000>;
+		};
+
+                opp-1908000000 {
+                        opp-hz = /bits/ 64 <1908000000>;
+                        opp-microvolt = <861000>;
+                };
+
+                opp-2016000000 {
+                        opp-hz = /bits/ 64 <2016000000>;
+                        opp-microvolt = <911000>;
+                };
+
+                opp-2108000000 {
+                        opp-hz = /bits/ 64 <2108000000>;
+                        opp-microvolt = <951000>;
+                };
+
+                opp-2208000000 {
+                        opp-hz = /bits/ 64 <2208000000>;
+                        opp-microvolt = <1011000>;
+                };
+	};
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 777bfb938854..6cfc2c69bb4f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -6,7 +6,7 @@
 
 /dts-v1/;
 
-#include "meson-g12b.dtsi"
+#include "meson-g12b-s922x.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/meson-g12a-gpio.h>
 #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
new file mode 100644
index 000000000000..046cc332d07f
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include "meson-g12b.dtsi"
+
+/ {
+	cpu_opp_table_0: opp-table-0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-250000000 {
+			opp-hz = /bits/ 64 <250000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-667000000 {
+			opp-hz = /bits/ 64 <667000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-1398000000 {
+			opp-hz = /bits/ 64 <1398000000>;
+			opp-microvolt = <761000>;
+		};
+
+		opp-1512000000 {
+			opp-hz = /bits/ 64 <1512000000>;
+			opp-microvolt = <791000>;
+		};
+
+		opp-1608000000 {
+			opp-hz = /bits/ 64 <1608000000>;
+			opp-microvolt = <831000>;
+		};
+
+		opp-1704000000 {
+			opp-hz = /bits/ 64 <1704000000>;
+			opp-microvolt = <861000>;
+		};
+
+		opp-1896000000 {
+			opp-hz = /bits/ 64 <1896000000>;
+			opp-microvolt = <981000>;
+		};
+	};
+
+	cpub_opp_table_1: opp-table-1 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			opp-microvolt = <751000>;
+		};
+
+		opp-250000000 {
+			opp-hz = /bits/ 64 <250000000>;
+			opp-microvolt = <751000>;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <751000>;
+		};
+
+		opp-667000000 {
+			opp-hz = /bits/ 64 <667000000>;
+			opp-microvolt = <751000>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <771000>;
+		};
+
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <771000>;
+		};
+
+		opp-1398000000 {
+			opp-hz = /bits/ 64 <1398000000>;
+			opp-microvolt = <791000>;
+		};
+
+		opp-1512000000 {
+			opp-hz = /bits/ 64 <1512000000>;
+			opp-microvolt = <821000>;
+		};
+
+		opp-1608000000 {
+			opp-hz = /bits/ 64 <1608000000>;
+			opp-microvolt = <861000>;
+		};
+
+		opp-1704000000 {
+			opp-hz = /bits/ 64 <1704000000>;
+			opp-microvolt = <891000>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
index 98ae8a7c8b41..d5edbc1a1991 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
@@ -95,121 +95,6 @@
 			compatible = "cache";
 		};
 	};
-
-	cpu_opp_table_0: opp-table-0 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-100000000 {
-			opp-hz = /bits/ 64 <100000000>;
-			opp-microvolt = <731000>;
-		};
-
-		opp-250000000 {
-			opp-hz = /bits/ 64 <250000000>;
-			opp-microvolt = <731000>;
-		};
-
-		opp-500000000 {
-			opp-hz = /bits/ 64 <500000000>;
-			opp-microvolt = <731000>;
-		};
-
-		opp-666666666 {
-			opp-hz = /bits/ 64 <666666666>;
-			opp-microvolt = <731000>;
-		};
-
-		opp-1000000000 {
-			opp-hz = /bits/ 64 <1000000000>;
-			opp-microvolt = <731000>;
-		};
-
-		opp-1200000000 {
-			opp-hz = /bits/ 64 <1200000000>;
-			opp-microvolt = <731000>;
-		};
-
-		opp-1398000000 {
-			opp-hz = /bits/ 64 <1398000000>;
-			opp-microvolt = <761000>;
-		};
-
-		opp-1512000000 {
-			opp-hz = /bits/ 64 <1512000000>;
-			opp-microvolt = <791000>;
-		};
-
-		opp-1608000000 {
-			opp-hz = /bits/ 64 <1608000000>;
-			opp-microvolt = <831000>;
-		};
-
-		opp-1704000000 {
-			opp-hz = /bits/ 64 <1704000000>;
-			opp-microvolt = <861000>;
-		};
-
-		opp-1896000000 {
-			opp-hz = /bits/ 64 <1896000000>;
-			opp-microvolt = <981000>;
-		};
-	};
-
-	cpub_opp_table_1: opp-table-1 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-100000000 {
-			opp-hz = /bits/ 64 <100000000>;
-			opp-microvolt = <751000>;
-		};
-
-		opp-250000000 {
-			opp-hz = /bits/ 64 <250000000>;
-			opp-microvolt = <751000>;
-		};
-
-		opp-500000000 {
-			opp-hz = /bits/ 64 <500000000>;
-			opp-microvolt = <751000>;
-		};
-
-		opp-666666666 {
-			opp-hz = /bits/ 64 <666666666>;
-			opp-microvolt = <751000>;
-		};
-
-		opp-1000000000 {
-			opp-hz = /bits/ 64 <1000000000>;
-			opp-microvolt = <751000>;
-		};
-
-		opp-1200000000 {
-			opp-hz = /bits/ 64 <1200000000>;
-			opp-microvolt = <771000>;
-		};
-
-		opp-1398000000 {
-			opp-hz = /bits/ 64 <1398000000>;
-			opp-microvolt = <791000>;
-		};
-
-		opp-1512000000 {
-			opp-hz = /bits/ 64 <1512000000>;
-			opp-microvolt = <821000>;
-		};
-
-		opp-1608000000 {
-			opp-hz = /bits/ 64 <1608000000>;
-			opp-microvolt = <861000>;
-		};
-
-		opp-1704000000 {
-			opp-hz = /bits/ 64 <1704000000>;
-			opp-microvolt = <891000>;
-		};
-	};
 };
 
 &clkc {
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
