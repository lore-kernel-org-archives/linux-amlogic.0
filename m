Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0FCC41513
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 May 2024 08:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BQ76n229yuPs/dtHqY//hefxwc60gIpvn8KUokDj2xY=; b=m9x6XYy+565a7R
	MTuM+G6DnjgASwxG5SeM+qhM+lFGPvWaHII5o8lG/J5D5ZhWo/m99jwmj3cNZAmBYmSwc4oh2abEz
	ALTswtQu7oSksUKO+T8dQcKawYXXKcCfznbyajeY5cAALNY7t4uvtPYsXhV2qD0iJ2sbSUW134E59
	8ks0uNz0AJhsfRDEtaKea/u8HIP7a88OvTm4nnu0RrhBBl4qKFokBiS6x0gVgzZbCipM45b22DcnK
	f7yJvTzofgiHODHyoKEC2EIJp+HTPIcP8v0o1BCXJ5h2eyXY83RKr6N5syLT390J3S1+M6Xd8WQWS
	V2Z5kPUEGKE3fHEk7PRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBsMv-0000000HVO4-0FLX;
	Tue, 28 May 2024 08:39:41 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBsMp-0000000HVLO-1CPW;
	Tue, 28 May 2024 08:39:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0F6BACE1174;
	Tue, 28 May 2024 08:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46AABC4AF08;
	Tue, 28 May 2024 08:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716885572;
	bh=Dy2THCFbsLq2DkMOQsSH+bQnrboFNI6ntqt8fIhFvT8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RLfKoV4GF0NBgr9yn86EPh0qrdIf3uigBN4yLQyaPJkcEAOOHErkGPwSvSR9l7ktK
	 +z5OzEgQRD9RTYU61E3sdOJV/NtR2vxrEdsLZr47cbXihV08QBJesDJnq04Pbv8qen
	 0/P5P8N9yi790n2f80JzEC+zVeUj5S325pFPf5rcg/iTxEDarbAgKrvBKxlRc5uNpt
	 kH4yAeEYVtykuccoe8jq1pE7zhRW5gxBkpLIBmGrJoNilCZ3QzJYht9zExK0ZDgMnW
	 aDONbJ9Absj6kYUUEzyesn/hOT8f3WBaNaK+Xs3loY9yswVTwQyrq7Hk7LU2AGEkWM
	 f3Zi7Cl9ptjSg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A07C27C44;
	Tue, 28 May 2024 08:39:32 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 28 May 2024 16:39:28 +0800
Subject: [PATCH 1/3] dt-bindings: power: add Amlogic A4 power domains
MIME-Version: 1.0
Message-Id: <20240528-a4_secpowerdomain-v1-1-2a9d7df9b128@amlogic.com>
References: <20240528-a4_secpowerdomain-v1-0-2a9d7df9b128@amlogic.com>
In-Reply-To: <20240528-a4_secpowerdomain-v1-0-2a9d7df9b128@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716885570; l=1750;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=RgSjH36Qe2U+EgCLbgQ34YnSw/n5HAn5hYl8u+yR7yg=;
 b=0fO2oQhlkgQwkWydhbu+RcPN78HB4L/zQ19HTV6D8l8yETaxV2MPvQUb4RleDjl3sHKwKXzqX
 1WjcP+vIKYRAeHouzTEy4/UeFCiddZ5A1ZlqqpHBnr731DojYlwNg2W
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_013935_742783_68C4F4E2 
X-CRM114-Status: GOOD (  10.26  )
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
Amlogic A4 secure power domains.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../bindings/power/amlogic,meson-sec-pwrc.yaml      |  1 +
 include/dt-bindings/power/amlogic,a4-pwrc.h         | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
index dab3d92bc273..59915f9d4860 100644
--- a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
+++ b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
@@ -20,6 +20,7 @@ properties:
     enum:
       - amlogic,meson-a1-pwrc
       - amlogic,meson-s4-pwrc
+      - amlogic,a4-pwrc
       - amlogic,c3-pwrc
       - amlogic,t7-pwrc
 
diff --git a/include/dt-bindings/power/amlogic,a4-pwrc.h b/include/dt-bindings/power/amlogic,a4-pwrc.h
new file mode 100644
index 000000000000..bd2f9c558d22
--- /dev/null
+++ b/include/dt-bindings/power/amlogic,a4-pwrc.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (C) 2024 Amlogic, Inc. All rights reserved
+ */
+#ifndef _DT_BINDINGS_AMLOGIC_A4_POWER_H
+#define _DT_BINDINGS_AMLOGIC_A4_POWER_H
+
+#define PWRC_A4_AUDIO_ID				0
+#define PWRC_A4_SDIOA_ID				1
+#define PWRC_A4_EMMC_ID					2
+#define PWRC_A4_USB_COMB_ID				3
+#define PWRC_A4_ETH_ID					4
+#define PWRC_A4_VOUT_ID					5
+#define PWRC_A4_AUDIO_PDM_ID				6
+#define PWRC_A4_DMC_ID					7
+#define PWRC_A4_SYS_WRAP_ID				8
+#define PWRC_A4_AO_I2C_S_ID				9
+#define PWRC_A4_AO_UART_ID				10
+#define PWRC_A4_AO_IR_ID				11
+
+#endif

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
