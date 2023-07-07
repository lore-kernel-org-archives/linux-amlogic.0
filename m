Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A89AC0015E
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jul 2023 00:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+u30peAkXQFjdU0pKJOHnNlW2HOHJQw4aMZCM3sVYt8=; b=JhDfcuiusjCs3Q
	wcmfwdE/G/MevZwKq1mVYwvtNymuFYoqbRBKkmUtxLfQU5BY6NXbJE1y9qLzVxChxjkPOYtuHogyi
	WTYyz6Px9gdSTVcoTXE/hOMa6XNmvwITVd9ztF3GEL1Dcd6uZYXqvCIN5aXWBMAPTirOfH2njHANY
	KpBJJSaQQzRWqPK0NeGzJNFU1hhTre21S/S/Pe61vrE/7GTJkJNqZzj+sIQ4dDwN8hOjCr8otD4WD
	X/7qGC69F2U875qKGK0c2ozGiokWkHUd6zKgipZr2vtqQuozpxbARPRE/Yg+eNPWhK8mrn1hLL/Kg
	L1OAWLBut3vQiZSe3WVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHZTR-0034K9-38;
	Fri, 07 Jul 2023 00:37:26 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHZTN-0034GF-32;
	Fri, 07 Jul 2023 00:37:23 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Fri, 7 Jul 2023
 08:37:07 +0800
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Neil Armstrong" <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: [PATCH V2 2/4] dt-bindings: power: add Amlogic C3 power domains
Date: Fri, 7 Jul 2023 08:37:08 +0800
Message-ID: <20230707003710.2667989-3-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230707003710.2667989-1-xianwei.zhao@amlogic.com>
References: <20230707003710.2667989-1-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_173721_980505_0C10F24C 
X-CRM114-Status: GOOD (  10.90  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add devicetree binding document and related header file for Amlogic C3 secure power domains.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
V1 -> V2:  Mofiy filename  matching compatibles.
	   Delete unnecessary blank line.
---
 .../power/amlogic,meson-sec-pwrc.yaml         |  3 ++-
 include/dt-bindings/power/amlogic,c3-pwrc.h   | 25 +++++++++++++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/power/amlogic,c3-pwrc.h

diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
index eab21bb2050a..d80bbedfe3aa 100644
--- a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
+++ b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
@@ -12,7 +12,7 @@ maintainers:
   - Jianxin Pan <jianxin.pan@amlogic.com>
 
 description: |+
-  Secure Power Domains used in Meson A1/C1/S4 SoCs, and should be the child node
+  Secure Power Domains used in Meson A1/C1/S4 & C3 SoCs, and should be the child node
   of secure-monitor.
 
 properties:
@@ -20,6 +20,7 @@ properties:
     enum:
       - amlogic,meson-a1-pwrc
       - amlogic,meson-s4-pwrc
+      - amlogic,c3-pwrc
 
   "#power-domain-cells":
     const: 1
diff --git a/include/dt-bindings/power/amlogic,c3-pwrc.h b/include/dt-bindings/power/amlogic,c3-pwrc.h
new file mode 100644
index 000000000000..1d98a25b08a4
--- /dev/null
+++ b/include/dt-bindings/power/amlogic,c3-pwrc.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
+/*
+ * Copyright (c) 2023 Amlogic, Inc.
+ * Author: hongyu chen1 <hongyu.chen1@amlogic.com>
+ */
+#ifndef _DT_BINDINGS_AMLOGIC_C3_POWER_H
+#define _DT_BINDINGS_AMLOGIC_C3_POWER_H
+
+#define PWRC_C3_NNA_ID				0
+#define PWRC_C3_AUDIO_ID			1
+#define PWRC_C3_RESV_SEC_ID			2
+#define PWRC_C3_SDIOA_ID			3
+#define PWRC_C3_EMMC_ID				4
+#define PWRC_C3_USB_COMB_ID			5
+#define PWRC_C3_SDCARD_ID			6
+#define PWRC_C3_ETH_ID				7
+#define PWRC_C3_RESV0_ID			8
+#define PWRC_C3_GE2D_ID				9
+#define PWRC_C3_CVE_ID				10
+#define PWRC_C3_GDC_WRAP_ID			11
+#define PWRC_C3_ISP_TOP_ID			12
+#define PWRC_C3_MIPI_ISP_WRAP_ID		13
+#define PWRC_C3_VCODEC_ID			14
+
+#endif
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
