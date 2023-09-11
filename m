Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACBAEE49A4
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 02:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vxFJ2skceD60ADL9Zu3ypJuUJTbB1Pbr2xZMfd8gI1E=; b=sSGdMF1SPuCp9Y
	dTwL0Ym6d9GQDfd6RJ034wYmV1lM4DAruAp7Knrf9L0ozu3jYAbnLJ4wbUSgXxKtXN+qM744KBWTY
	Io6XWbuqxejqwntfQ8LPFXdYvpY4wCCGgiwfx5r+my4dvM2ZLOLNPgqiGZMbBIZtRodnkruaGrpjL
	8otMhMFdQ69FAFquMp4otzMzPm7tMxQDh64iXi5dZsF7T5Qpf/BngB+dSA1kOiYljBar44ssPqiiT
	BHENrYR2PttMjo3WqVE4m0xIYfWfSHeMP8AQzuALVkcSvLAeRdLYFpt++5j2y9aH5LSJyzcoc8CxQ
	aZG0fpFctEyNQUif5f6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfX3p-00H87U-0U;
	Mon, 11 Sep 2023 02:54:01 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfX3j-00H84l-1y;
	Mon, 11 Sep 2023 02:53:56 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Mon, 11 Sep 2023
 10:53:52 +0800
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-pm@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Neil Armstrong" <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>, xianwei.zhao
	<xianwei.zhao@amlogic.com>, Lucas Tanure <tanure@linux.com>
Subject: [PATCH V3 RESEND 6/6] arm64: dts: amlogic: t7: add power domain controller node
Date: Mon, 11 Sep 2023 10:52:23 +0800
Message-ID: <20230911025223.3433776-7-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230911025223.3433776-1-xianwei.zhao@amlogic.com>
References: <20230911025223.3433776-1-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_195355_650222_7C90A8EA 
X-CRM114-Status: UNSURE (   7.63  )
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

From: "xianwei.zhao" <xianwei.zhao@amlogic.com>

Add power domain controller node for Amlogic T7 SoC

Signed-off-by: xianwei.zhao <xianwei.zhao@amlogic.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Lucas Tanure <tanure@linux.com>
---
V2 -> V3: modify subject.
V1 -> V2: None
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 1423d4a79156..23cdad1b425b 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/amlogic,t7-pwrc.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -118,6 +119,11 @@ psci {
 
 	sm: secure-monitor {
 		compatible = "amlogic,meson-gxbb-sm";
+
+		pwrc: power-controller {
+			compatible = "amlogic,t7-pwrc";
+			#power-domain-cells = <1>;
+		};
 	};
 
 	soc {
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
