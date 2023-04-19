Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9584DC77B7A
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Apr 2023 07:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PkMZJAdd3Tqf0BnS71gdq5UGXwm77vTBz8vo0pp0bzo=; b=BYSTXfNlKaFkeH
	GF/AB69uzg3mIOHlBM6/a2fdZ41vcT6J9S57XQJaCNsPcHbQ4Po33E7ro7gVCHbsupiU8TaSTLM6G
	BGoXn0dUdIwEU7J1ftdLQ2yQlcpbzJSFuywHf0KULYQq9SS/IdVRylK5zLS6Br2wO4Uro9Xam9UC7
	i72LPNppX4xsTg3A+Ru5WPndhr/PfjWznCrYqOqYzm7TrnSb4TwAo+54Xs3iD7VmWiM2pO72AW0Qp
	24IlHvGo6is4NxjChnPwA9XaKWJBFhtuiV756NW+/stBOTKrzLPseZD0swFFxtlx55FN51h1nStdh
	x8ZrU6b/vtF2h1UW2ikA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp2P3-004RC6-2D;
	Wed, 19 Apr 2023 07:38:57 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp2Ov-004R7b-1C;
	Wed, 19 Apr 2023 07:38:50 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Wed, 19 Apr 2023
 15:39:58 +0800
From: =Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: [RFC PATCH 1/2] arm64: amlogic: add new ARCH_AMLIPC for IPC SoC
Date: Wed, 19 Apr 2023 15:38:33 +0800
Message-ID: <20230419073834.972273-2-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230419073834.972273-1-xianwei.zhao@amlogic.com>
References: <20230419073834.972273-1-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_003849_408881_05A828A2 
X-CRM114-Status: UNSURE (   8.79  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

The C series SoCs are designed for smart IP camera
applications, which does not belong to Meson series.
So, Add ARCH_AMLIPC for the new series.

There are now multiple amlogic SoC seies supported, so group them under
their own menu. we can easily add new platforms there in the future.
Introduce ARCH_AMLOGIC to cover all Amlogic SoC series.

No functional changes introduced.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/Kconfig.platforms | 12 ++++++++++++
 arch/arm64/configs/defconfig |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 89a0b13b058d..bfbc817eef8f 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -162,12 +162,24 @@ config ARCH_MEDIATEK
 	  This enables support for MediaTek MT27xx, MT65xx, MT76xx
 	  & MT81xx ARMv8 SoCs
 
+menuconfig ARCH_AMLOGIC
+	bool "NXP SoC support"
+
+if ARCH_AMLOGIC
+
 config ARCH_MESON
 	bool "Amlogic Platforms"
 	help
 	  This enables support for the arm64 based Amlogic SoCs
 	  such as the s905, S905X/D, S912, A113X/D or S905X/D2
 
+config ARCH_AMLIPC
+	bool "Amlogic IPC Platforms"
+	help
+	  This enables support for the arm64 based Amlogic IPC SoCs
+	  such as the C302X, C308L
+endif
+
 config ARCH_MVEBU
 	bool "Marvell EBU SoC Family"
 	select ARMADA_AP806_SYSCON
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7790ee42c68a..f231bd1723fd 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -46,7 +46,9 @@ CONFIG_ARCH_LG1K=y
 CONFIG_ARCH_HISI=y
 CONFIG_ARCH_KEEMBAY=y
 CONFIG_ARCH_MEDIATEK=y
+CONFIG_ARCH_AMLOGIC=y
 CONFIG_ARCH_MESON=y
+CONFIG_ARCH_AMLIPC=y
 CONFIG_ARCH_MVEBU=y
 CONFIG_ARCH_NXP=y
 CONFIG_ARCH_LAYERSCAPE=y
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
