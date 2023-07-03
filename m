Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CF4EB64DD
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jul 2023 09:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3zhL0QSs0kEo//uYOTD/Vq1d3ral75358oRIa92g0tI=; b=tm99b5XPRpz1Kh
	D46Wd6YUCyjRUaJSMuk1mDWhJrcOStpeN106p2OmV1LGmpwIGaI6J3VeqtyOK7MTp118q6xIvmAoD
	TnmBJVWAro3QOpTJU6wtoJFc2SvKcDRjdghOdyUxDggUlF/o6pb9K7/PKiXv4LoyLuUaB6q4m3hGO
	Qd7GEBZWNSfnVgnYuwrZIoEaWiEWoSRB5KrmI6zSbi87NDri+ZNNtdRiEEuN0t2cE7lTzrKnM5AJa
	CNCKqAD2+lzNKVxmZE5PIfbMZ7vIMR+oMshWM7nmAe1HRQIRefCvDrBNwbJW67OR2MAZRndX9FrFI
	GFMB2pDBljvTg50myiew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGFuf-009wUT-35;
	Mon, 03 Jul 2023 09:32:05 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGFuc-009wSH-2v;
	Mon, 03 Jul 2023 09:32:04 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Mon, 3 Jul 2023
 17:32:00 +0800
From: =Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Neil Armstrong" <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: [PATCH 1/3] dt-bindings: power: add Amlogic C3 power domains
Date: Mon, 3 Jul 2023 17:31:40 +0800
Message-ID: <20230703093142.2028500-2-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230703093142.2028500-1-xianwei.zhao@amlogic.com>
References: <20230703093142.2028500-1-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_023202_945002_68A6852E 
X-CRM114-Status: GOOD (  10.98  )
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

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add devicetree binding document and related header file for Amlogic C3 secure power domains.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../power/amlogic,meson-sec-pwrc.yaml         |  3 ++-
 include/dt-bindings/power/amlogic-c3-power.h  | 26 +++++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/power/amlogic-c3-power.h

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
diff --git a/include/dt-bindings/power/amlogic-c3-power.h b/include/dt-bindings/power/amlogic-c3-power.h
new file mode 100644
index 000000000000..3403e7c0b49d
--- /dev/null
+++ b/include/dt-bindings/power/amlogic-c3-power.h
@@ -0,0 +1,26 @@
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
+

base-commit: 057889cb4244096ea5abcbe76ffd4d311c3078fe
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
