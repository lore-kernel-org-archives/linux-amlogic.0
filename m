Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AAFC25B78
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 May 2024 03:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IWVyKCLAgJtL0gSFq8EAGlxNcj0O0thIorWVqcWxq0U=; b=Vgjpe/Tz2VBZpz
	C2ewp/+7ANLZcgCCmB7VGKRTcn9z0mZmAdQ2fYT0eFbxDgFQY/Hv4K4yCZB/5AS0vnJRyplgdVGz3
	l87Cwnj/Nydi+fHkezs5SLVej0AtgHTsKFoKMOc+XkX8aoGIIsIb+PyIXJ/h/p7FjYPRRF3cDlqO+
	AYCXv/5cvCFUHpjCoLWVZpv/0DarxMJ9Qs3Cu0r+U6tcEquLRj0B3So5CrrrFqX+wEt/+/19WnDte
	gTZbgRhRaKqIv58L6Cizgp7A+wWcUZwJWDdd/gwBycGZ6cihM62MFdE1PnkczQA+YkGkCuKPlri8L
	UmJdxO7OMT61RykaR8TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC9i6-00000002fAA-1WFT;
	Wed, 29 May 2024 03:10:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC9i4-00000002f9j-1b0B;
	Wed, 29 May 2024 03:10:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3C1DD62349;
	Wed, 29 May 2024 03:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9FB51C4AF0A;
	Wed, 29 May 2024 03:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716952236;
	bh=SCO+SFRXiKHD6gPKSKfr2t0rbWu65yFZpXELTeORBfQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=c791E4mSbk/7QrN1IGOK2J6AHbaKGmGfJdV/kBtBUqrVFeEsC/zW4uqvBw828CrMx
	 GsZRG6eFho56ISgMOCTe97uivzEle6dfboIs8t4qgnukbseUUzmZDFQjFsNx4vHzRb
	 GmKpJLMaJAb0hURj6JbI3xGIPyaWv/1IRJSL5aQWilAZGA31ivQDvMQG1x0Db4JnJu
	 FbBiT5xhIKUTG7S/PtbQXYKA/WnioEWgdiXSdQmc81fK4iwKtqWILFII058Q0TpJ5v
	 hHVR/ekj47Hp3BQloU7XRjm7rKhuBfvcDVXs4H2zT6u3zIPG0hTzEZ2nEaQ52YX9pB
	 r36Pn5DAoyz5g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F6BC25B7C;
	Wed, 29 May 2024 03:10:36 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 29 May 2024 11:10:35 +0800
Subject: [PATCH v2 3/3] arm64: dts: amlogic: a4: add power domain
 controller node
MIME-Version: 1.0
Message-Id: <20240529-a4_secpowerdomain-v2-3-47502fc0eaf3@amlogic.com>
References: <20240529-a4_secpowerdomain-v2-0-47502fc0eaf3@amlogic.com>
In-Reply-To: <20240529-a4_secpowerdomain-v2-0-47502fc0eaf3@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716952234; l=894;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=AmiofDYC3IFCMwy7sO4GQjRfJjCUwOi49fG3NzsnzK4=;
 b=3Bx9xAD4eRBo4zTKnXndZ9mni8Z2V6Ohu2ryGjhp0WUKOdgr0sd2zyuR2P5JOPQ3cObwW2hyM
 smZ8i+VozEdBdtMFmxSbzNCtICyEjW/tjoIEH2qW5BiqBW6Y2XLZCeg
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_201040_504374_1FE2106B 
X-CRM114-Status: UNSURE (   9.48  )
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

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add power domain controller node for Amlogic A4 SoC

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index 73ca1d7eed81..de10e7aebf21 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include "amlogic-a4-common.dtsi"
+#include <dt-bindings/power/amlogic,a4-pwrc.h>
 / {
 	cpus {
 		#address-cells = <2>;
@@ -37,4 +38,13 @@ cpu3: cpu@3 {
 			enable-method = "psci";
 		};
 	};
+
+	sm: secure-monitor {
+		compatible = "amlogic,meson-gxbb-sm";
+
+		pwrc: power-controller {
+			compatible = "amlogic,a4-pwrc";
+			#power-domain-cells = <1>;
+		};
+	};
 };

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
