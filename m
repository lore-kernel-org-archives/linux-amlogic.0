Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A3EE77188
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jan 2025 05:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mnJ8l6WG+9HjEIs+ZLFY+v4KS0FVz9R3lo66f56Mbn4=; b=3VGSTmahFhfqB8
	giG5kH2Vc5myiUFP2ltX908VGmY2B01BKBuRwKAShVgtkgM0Yg2K6u1/eAzVnMg7Eb38klkXed9i4
	aNog8zBpf5K+FBiSiMBQCKSLHv+6DWuIdAV8Mx1Xzr0IMZJuDnEuOfVu0IgaNg/NqbC+OYMtFzaJc
	ev4PPYW90Wlh0SRe8mImf37sY2P88azWDYpplYRP/Md2kRs4p6p9fF2CTYq4QnVtm7xuAt+E+cxgp
	5Nf1OMdEks9w1SDQRHM/w7jkrOIVV9wTeh9r+fVZQ0RTzvvwl7msIQgVVI2gypQ4Ymc4o3TKNWz9i
	z3n//6qJC0vhEyZnmgZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTaR0-0000000C8Lf-2xK2;
	Fri, 03 Jan 2025 05:41:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTaMZ-0000000C7cx-0KXU;
	Fri, 03 Jan 2025 05:36:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8ADF55C60D7;
	Fri,  3 Jan 2025 05:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5AAAAC4CEDC;
	Fri,  3 Jan 2025 05:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735882605;
	bh=7OixjdD2m8/UmdxhBFIAm4/7uSUL3SJDwCAZXPIjzio=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Od2XzpAXFqWuV/kehyOmUZfSYWnsXxupUCiJwq3MGZ2lWuVmAkv3jmYbZzIN0VAKa
	 IqW51hodMKgg1+PgWt4ntGW62u2kv81aqzifXCGJ5vtMLYWRetllftDvwp6UT7TPB2
	 hdOqyNGfbNd3mIERfvyIzqeXQTuyLAirSIV9/mdU26+cbCHHnHsrIkycgls2/rdxD6
	 +pzAcwAF9FbihKsKu8VDUOS9VkcgEEvXvSWDmVlgcSdlydg4gZHE6ISXptSGWIEEst
	 tkFipUx9vTrSjO0/HMzgmFPzBuWf6OPZjrze43VtbWTYFOOCPgbXq40i7EuJhwiHyz
	 Z7txAhHyyAuaw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47557E7718F;
	Fri,  3 Jan 2025 05:36:45 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 03 Jan 2025 13:36:41 +0800
Subject: [PATCH v3 1/5] dt-bindings: clock: add Amlogic A5 SCMI clock
 controller support
MIME-Version: 1.0
Message-Id: <20250103-a5-clk-v3-1-a207ce83b9e9@amlogic.com>
References: <20250103-a5-clk-v3-0-a207ce83b9e9@amlogic.com>
In-Reply-To: <20250103-a5-clk-v3-0-a207ce83b9e9@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chuan Liu <chuan.liu@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735882602; l=1985;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=lkr1GZx7K1kssXy2RilRTA0K2DTWj4ijmI36kNCn2FY=;
 b=5EVyfzDCIeV7W3b4vkQAsWuEDvRVg4maJ/UDY/mOy5M0TNS5nL1sySOEVw6UyoE444SXmlvcg
 yEMz/huAslvAMHsuKkIKfYQPV7EL/tE8/1AdyTFvQaG4nNbjmtIS4gs
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_213647_227921_E3C2E365 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

From: Chuan Liu <chuan.liu@amlogic.com>

Add the SCMI clock controller dt-bindings for Amlogic A5 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 include/dt-bindings/clock/amlogic,a5-scmi-clkc.h | 44 ++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/include/dt-bindings/clock/amlogic,a5-scmi-clkc.h b/include/dt-bindings/clock/amlogic,a5-scmi-clkc.h
new file mode 100644
index 000000000000..1bf027d0110a
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,a5-scmi-clkc.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
+ * Author: Chuan Liu <chuan.liu@amlogic.com>
+ */
+
+#ifndef __AMLOGIC_A5_SCMI_CLKC_H
+#define __AMLOGIC_A5_SCMI_CLKC_H
+
+#define CLKID_OSC				0
+#define CLKID_SYS_CLK				1
+#define CLKID_AXI_CLK				2
+#define CLKID_CPU_CLK				3
+#define CLKID_DSU_CLK				4
+#define CLKID_GP1_PLL				5
+#define CLKID_FIXED_PLL_DCO			6
+#define CLKID_FIXED_PLL				7
+#define CLKID_ACLKM				8
+#define CLKID_SYS_PLL_DIV16			9
+#define CLKID_CPU_CLK_DIV16			10
+#define CLKID_FCLK_50M_PREDIV			11
+#define CLKID_FCLK_50M_DIV			12
+#define CLKID_FCLK_50M				13
+#define CLKID_FCLK_DIV2_DIV			14
+#define CLKID_FCLK_DIV2				15
+#define CLKID_FCLK_DIV2P5_DIV			16
+#define CLKID_FCLK_DIV2P5			17
+#define CLKID_FCLK_DIV3_DIV			18
+#define CLKID_FCLK_DIV3				19
+#define CLKID_FCLK_DIV4_DIV			20
+#define CLKID_FCLK_DIV4				21
+#define CLKID_FCLK_DIV5_DIV			22
+#define CLKID_FCLK_DIV5				23
+#define CLKID_FCLK_DIV7_DIV			24
+#define CLKID_FCLK_DIV7				25
+#define CLKID_SYS_MMC_PCLK			26
+#define CLKID_SYS_CPU_CTRL			27
+#define CLKID_SYS_IRQ_CTRL			28
+#define CLKID_SYS_GIC				29
+#define CLKID_SYS_BIG_NIC			30
+#define CLKID_AXI_SYS_NIC			31
+#define CLKID_AXI_CPU_DMC			32
+
+#endif /* __AMLOGIC_A5_SCMI_CLKC_H */

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
