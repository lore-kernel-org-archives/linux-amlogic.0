Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FABEEB64DD
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Aug 2023 07:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vVJnaPFPrPj3d3u+F7RH0RVhch/g2N9d3j4SG/iN4cE=; b=sxBQw+FhALGWC2
	5bxDqxAcdIwK4vRKYT759EYOu06f4dzXUEur1jwtRD06p9z+C2ok0xZJ9j+J7ghHTRZsNJDMY5rAG
	1dlYGUDwVvPFsUvJStqOsZZWOWT7NSFh+Rv/q3cUYK8jPMnVSmR3x3gPW+J5HXxfIQA9qsSmo29+y
	q8RJfp3hlNynKNpzxCrL+YsMMX6sI5AiO7YJ19YDhW7KorDEXvhlDU7sMjz8H8ZrGTxy6ocKSwVhx
	5MrwHylxB5HkcqsqaWTbHAXdxlQ5NffyLFJx0KFAMffDMWS94MOq+bUN2zXKgKI+gTcKy15mXjOui
	DXyghHt7VuRgcSNtJ5aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWXC9-005hRd-1y;
	Thu, 17 Aug 2023 07:13:25 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWXC1-005hO3-3B;
	Thu, 17 Aug 2023 07:13:19 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 17 Aug 2023
 15:13:15 +0800
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Neil Armstrong" <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, xianwei.zhao <xianwei.zhao@amlogic.com>
Subject: [PATCH 6/6] arm64: dts: add support for T7 power domain controller
Date: Thu, 17 Aug 2023 15:11:48 +0800
Message-ID: <20230817071148.510575-7-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230817071148.510575-1-xianwei.zhao@amlogic.com>
References: <20230817071148.510575-1-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_001318_020680_EF1EC654 
X-CRM114-Status: UNSURE (   7.57  )
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

Enable power domain controller for Amlogic T7 SoC

Signed-off-by: xianwei.zhao <xianwei.zhao@amlogic.com>
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
