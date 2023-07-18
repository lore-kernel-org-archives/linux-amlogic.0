Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD31EB64DA
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jul 2023 06:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79l2LvQPIWqVcyouQT7vL9rFNWvKIuUfi9mG/b2GQRE=; b=e6cbwCvCAVKVvd
	F5RdrD3zzPm9Q32IgRhTvtPPzc7adBUIg9QKd+MWx3UyT4soP64nj/GHpCAxiecGVVhih276dI1/p
	r/VnFoVu0gdt7w7SkYkLptcrw2ZpIACv4+ZfhWFAO/BODlWxU0ugQd5KrlxiiB9j3QoFY15yAsYe3
	jbJplpKkDgjjDGjrKlFw9Qah38XXsGtUGOA+6N4kgVDVV8Pp+y4JEZh7qDYR5Yp0BvvyN6p+3EXQj
	98CifwKoSOHMeQTdFcn4lnRSEMlTTQKAt8MzoEnAb62Uy8Miqb+jCMP/hkpHMPnzCtsvmLm7SN7bx
	j+62xu7AzO8uCSRNr8aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0zA-005uIx-0O;
	Wed, 19 Jul 2023 06:48:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0z9-005uI7-0X;
	Wed, 19 Jul 2023 06:48:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=E1xZ296Wy7H8JW2J8FU421BIANt06n2hT3RObO3I15g=; b=MgWuAtu9Mz5ZhoDFTBYNmy8l05
	khbbXECll5bAXsEL21EjUgi9O2QLCIav6OZdndDQ8g7jrMTZUN5a4UAY1eSrWJjqx1LJLwaykwvlE
	wxKTpF/DOFGmvoPvJPciP4FZvg/dx4e6MRPVMuSwEtM7KvafxIDMNT/tcgThVkjG54gE2GQ+ekca8
	5IfrWitZzv0vD0yei7zeMXKIeTmvYnCFYNee5+n4fSMqacCDxTf6B9NHLcbGuZX+yDXuYBJli5mPi
	kGPPJbP1QaJWIVinpbqOQMb9f6twbUZjWGhzqyxMuWm9OnbwBXQbtUVgb9v09dFfxek8cizA/twXJ
	R5/fw/OA==;
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLjwB-00BWIw-1w;
	Tue, 18 Jul 2023 12:36:21 +0000
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Tue, 18 Jul 2023
 20:35:46 +0800
From: zelong dong <zelong.dong@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, Rob Herring
	<robh+dt@kernel.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>
CC: <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, <devicetree@vger.kernel.org>,
	<kelvin.zhang@amlogic.com>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH v2 3/3] arm64: dts: meson: add reset controller for Meson-C3 SoC
Date: Tue, 18 Jul 2023 20:35:50 +0800
Message-ID: <20230718123550.13712-4-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230718123550.13712-1-zelong.dong@amlogic.com>
References: <20230718123550.13712-1-zelong.dong@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.11.69]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_133619_968502_2BB66C7E 
X-CRM114-Status: UNSURE (   8.06  )
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

From: Zelong Dong <zelong.dong@amlogic.com>

Add the reset controller device of Meson-C3 SoC family

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
index 60ad4f3eef9d..ef81dd8338e0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/reset/amlogic,meson-c3-reset.h>
 
 / {
 	cpus {
@@ -72,6 +73,12 @@ apb4: bus@fe000000 {
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
 
+			reset: reset-controller@2000 {
+				compatible = "amlogic,meson-c3-reset";
+				reg = <0x0 0x2000 0x0 0x98>;
+				#reset-cells = <1>;
+			};
+
 			uart_b: serial@7a000 {
 				compatible = "amlogic,meson-s4-uart",
 					   "amlogic,meson-ao-uart";
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
