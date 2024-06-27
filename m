Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123A3C2BD09
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jun 2024 11:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=asm1O/iSO28uRhZQAptFi0fTr4xrWbiQBSsJWynhys4=; b=LVjFW577SSySeL
	raLmCc5r1CShpGUu7KnmbcJtY6ggSFEG7WrQKH5mbjYjX6VxkANJfDZ1dIWgW8lxKYqgJa9y3P8zH
	Tc7IH0Jv66ZJMX9kYCu0eWIFe3IEmPqDxZlTo5hSrg43zYhVJQKkmdQFel8uueY2fm6gyBDucxTa8
	j22qfKEATbmsRUTset9yQnu7NHbPHkZFR7AoQ69tyKdu/HsjebQye94qcU9+A2Y5YO3RuBAz+nPUK
	XSSUncFgpkVExAGRU0jyUDIaO5r87V9yD/6LPxUN7bbpWrtZ/MXBAA0vDdlucCeEhc0AIgM65opfl
	Ud67A+MyCcY0CTvW+ykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnbd-0000000AD3b-2xOX;
	Thu, 27 Jun 2024 11:48:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnba-0000000AD23-1PvW;
	Thu, 27 Jun 2024 11:48:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 32F7A61E52;
	Thu, 27 Jun 2024 11:47:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48081C4AF0E;
	Thu, 27 Jun 2024 11:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719488875;
	bh=eyjxy3sxdu3xoTQb6Z89zNdOHxg3M/MGMf8s4ii97+g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rDLFp2F3ezKHScCh4xiy2zMKT7119vaePYGsezyMJTEf0gHUygZ77vJiqtPOBOVr0
	 +6e99Xc+Cm8nxJigQbla1J6r4IUo8yG5/5jyz7ojRJAD4DVYLI4wWU/PF+Mn9sH5pX
	 zfbUl6T/ZF+AVgcgxm2b6iatsg762IjB2zz8c2zYuLcvMmDRyqV3xwupRmdTtVWuVE
	 rH6LGjzNV94nPaOwXo/uuE8g2GN2xZqrX0wHvY/dYmhxAoK4IDZDq7sgm6+UHwXRiR
	 NDohfTn4+TPoQtJKlfcpA2bVwqt9msQuoXUPOO8TnEiAdiG+wi06yZZvhPovL6pIs/
	 qq2MDj8Fiuiag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C098C2BD09;
	Thu, 27 Jun 2024 11:47:55 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 27 Jun 2024 19:47:53 +0800
Subject: [PATCH 3/3] arm64: dts: amlogic: a5: add power domain controller
 node
MIME-Version: 1.0
Message-Id: <20240627-a5_secpower-v1-3-1f47dde1270c@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719488872; l=952;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=a2Zu+uHx7AvPgs0U7XpBlBsH/P/9nCVcrhSWZWMj+mI=;
 b=QgBeyLD1Kac4MHjy5kyxtif4bCHe3DmeuihH4WAyneRpGvyo31dywxlvvHylqdPXeH7o/vv3N
 QBZtc7xUpsQAbNsGbVbH85wfd+4zPivbRtVm+3Ojs5fVy7LPkc+N2nM
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_044758_615388_46BBA7A9 
X-CRM114-Status: UNSURE (   8.86  )
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

Add power domain controller node for Amlogic A5 SoC.

Signed-off-by: Hongyu Chen <hongyu.chen1@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
index 43f68a7da2f7..17a6316de891 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include "amlogic-a4-common.dtsi"
+#include <dt-bindings/power/amlogic,a5-pwrc.h>
 / {
 	cpus {
 		#address-cells = <2>;
@@ -37,4 +38,13 @@ cpu3: cpu@300 {
 			enable-method = "psci";
 		};
 	};
+
+	sm: secure-monitor {
+		compatible = "amlogic,meson-gxbb-sm";
+
+		pwrc: power-controller {
+			compatible = "amlogic,a5-pwrc";
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
