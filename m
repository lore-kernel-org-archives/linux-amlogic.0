Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF5DC3064D
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jun 2024 11:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8PZ+H/zZuut3ZvjtzBlHXozJIizIbNsgSN+P00i+mvU=; b=UgtRDVNZXxE2Ul
	kuUbdTr7BdQm3kCT+Orm8NbOLjUwsh/rSBf3T9EOHVefVs6pd0aq7SuX5DdEpLxpLxHlvrTsuMxb8
	vxSfXY5BbsGAtsRZ0RUJmmxffSRiMvcAJCI8f9yvrPtyDQM8q1FdX1kp9DBgcmhveNEl3HUSuG4ax
	wlp7lgXmrL5BaAh9gJtq/SmWgRJ8uifFAcHNYgqDnJ/M9pVXerxFpABe7VRV7FmZO7itsjndeWRnJ
	HS327UhIPDrBJFnS6mrJMxxT1dqWBUj8k/s0qdz5Iq7BA57KusXtZMFqHEmOqDeKKWa+NuqT8tWQ1
	+q2LS6aEk7BHquYBCEYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMncS-0000000ADLi-1scU;
	Thu, 27 Jun 2024 11:48:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnba-0000000AD1z-1QV8;
	Thu, 27 Jun 2024 11:48:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D1474CE2E4A;
	Thu, 27 Jun 2024 11:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20334C32789;
	Thu, 27 Jun 2024 11:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719488875;
	bh=Ai1qsjDV8TVB8n60kMviqZ3G0IrZICdk1tqlzmLNIcQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uEhmHgv6/P24cuQWYsbs/RGcxh0yhvXBD9/OJakAugtujrmn5yVC8h6IbNM+XlJOt
	 95dZyKutL+TlhivysdyXBA7nSGCczddyb3coq3QJ0Z2aE5H+TJvbqIWl7D0xx4kbBl
	 M+TGt4Xb6MfsKbdnRhjN8nwnbjJzZJdSE050fOKVSb8MTz8nhIHPr3ZeMYVlJLCxkl
	 Bw4up29DhZDCB5rZE2A1LzUFA/pprm38Vkpg/sSFOLKM5+3PjjZzKP3qSLYoPGW/IO
	 uK58xuQXiCL7m5YioUxQD87R8jAJLlbhLk8Eki8dOWS1jxq7mrSBNHDKJOEvcyHFb/
	 noKFv63HFk5pw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02CB1C30653;
	Thu, 27 Jun 2024 11:47:55 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 27 Jun 2024 19:47:51 +0800
Subject: [PATCH 1/3] dt-bindings: power: add Amlogic A5 power domains
MIME-Version: 1.0
Message-Id: <20240627-a5_secpower-v1-1-1f47dde1270c@amlogic.com>
References: <20240627-a5_secpower-v1-0-1f47dde1270c@amlogic.com>
In-Reply-To: <20240627-a5_secpower-v1-0-1f47dde1270c@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Hongyu Chen <hongyu.chen1@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719488872; l=1760;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=Txc3iSqLPbJi5Rszcezcb/g0/wY8paHucg8OqrKhoA4=;
 b=zuduol9Qa4JxnPSke443YVNvHYmL2hfXZ5bF3i+i0yMOzt3NZdwSLoIOjJhdk35/+t7kbV7xr
 uOlQNcygpQUCvxGKP754w1v61IbP0+gK0mzC4SGWbFobhHoVATK5R76
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_044758_842509_DF24D93A 
X-CRM114-Status: GOOD (  10.41  )
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add devicetree binding document and related header file for
Amlogic A5 secure power domains.

Signed-off-by: Hongyu Chen <hongyu.chen1@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../bindings/power/amlogic,meson-sec-pwrc.yaml      |  1 +
 include/dt-bindings/power/amlogic,a5-pwrc.h         | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
index 59915f9d4860..15d74138baa3 100644
--- a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
+++ b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
@@ -21,6 +21,7 @@ properties:
       - amlogic,meson-a1-pwrc
       - amlogic,meson-s4-pwrc
       - amlogic,a4-pwrc
+      - amlogic,a5-pwrc
       - amlogic,c3-pwrc
       - amlogic,t7-pwrc
 
diff --git a/include/dt-bindings/power/amlogic,a5-pwrc.h b/include/dt-bindings/power/amlogic,a5-pwrc.h
new file mode 100644
index 000000000000..3a6f53eb959f
--- /dev/null
+++ b/include/dt-bindings/power/amlogic,a5-pwrc.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (C) 2024 Amlogic, Inc. All rights reserved
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_A5_POWER_H
+#define _DT_BINDINGS_AMLOGIC_A5_POWER_H
+
+#define PWRC_A5_NNA_ID			0
+#define PWRC_A5_AUDIO_ID		1
+#define PWRC_A5_SDIOA_ID		2
+#define PWRC_A5_EMMC_ID			3
+#define PWRC_A5_USB_COMB_ID		4
+#define PWRC_A5_ETH_ID			5
+#define PWRC_A5_RSA_ID			6
+#define PWRC_A5_AUDIO_PDM_ID		7
+#define PWRC_A5_DMC_ID			8
+#define PWRC_A5_SYS_WRAP_ID		9
+#define PWRC_A5_DSPA_ID			10
+
+#endif

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
