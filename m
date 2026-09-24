Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1480C9830E
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Sep 2026 15:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zo2z6UZrmcvV0KYCelYdBQuzdq4V4G4swOzB6Z9M70Q=; b=CrSfFC+DiFxyjy
	UDO9+e3Uspez2JqKwgxH5mOuA1xl8u443SUbmhjnklFF+4EBxF493mv2q25/33SdxMxj7Yt2mvNnI
	ro9bhsJCMDR6qfPWyns+zuOffddYgtGSIClTHrLSIWRad/tllpAimpU8EKXzs6nRKqZRsPac+ZIf3
	romDrtAvITc7phL8BrbeL2QM+TMs2uBNsSYnzSEquLDEDcoTOkfkRRKfMlm2So5vL+HJkefbD2s3k
	OfK+6SujNiGzLDf7aCkQr/sonJxcY9dIwumMKmDVP+nF9kS3EWSP19Vv/73t++EjTFA3PEDlZAf79
	r4+nuoKmLFaYivRQd1NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lAI-0000000BM3S-3io2;
	Thu, 24 Sep 2026 15:15:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lAH-0000000BM25-2imf;
	Thu, 24 Sep 2026 15:15:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EFB9844504;
	Thu, 24 Sep 2026 15:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D11F9C2BCFD;
	Thu, 24 Sep 2026 15:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790262912;
	bh=mys8d0QyT1jeqfYTCqWxqyuhDyI86uP8AaBBHLjc8CU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GLcv5zNEzPO2gi90jXUd2VHnrxBDTuvDNerSCbLCXaezFQ/uj+q9oTmyqN/nI2MRz
	 ZbY1RA3914RyPqpTUI1Zx6/ux5U9M4aorEA0fanq/CRpPqCPK4x8RWqGL6kFGDFDdr
	 4kVaCeOXl0WEp5iMG4UrZiqsoRY053tUJlKrm7fgoUGj9oi5Wvk0X/nWgpXvXLLWTA
	 dRnb4A2aULq2wM7whNtepfsEEig/KNemcYc6ew+9eZk9slXEJLsHnK7Nx3tFjyIhA9
	 k1yVZ+im+niSwZQ47ab9O2RxzmUkXPzUrt1JcGhq4MCN5cJjEQQSaaD0xaKPnb0LTf
	 J++hWGiqJ1SRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4633C9830E;
	Thu, 24 Sep 2026 15:15:12 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Thu, 24 Sep 2026 17:14:30 +0200
Subject: [PATCH 3/3] arm64: dts: amlogic: t7: Add core clock to PWM
 controller nodes
MIME-Version: 1.0
Message-Id: <20260924-add-t7-sys-pwm-clk-v1-3-05b91e87f0a9@aliel.fr>
References: <20260924-add-t7-sys-pwm-clk-v1-0-05b91e87f0a9@aliel.fr>
In-Reply-To: <20260924-add-t7-sys-pwm-clk-v1-0-05b91e87f0a9@aliel.fr>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3527;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=iQJmhI6/rtcZ/olaoAWuBun4MGQh6or5yJDIWByo+Dg=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9ZWu5oJNSeOKn6LOfv3f4uUkMLnoCN/9Zo0pVNPv1+zn
 f9D2p3qjlIWBjEuBlkxRZb+uZYn3l0+eubrHvUUmDmsTCBDGLg4BWAilm8ZGe54Bpl9538c7vxM
 yuCD7IKqg5e8nXc8f83a9pMx4NZk5nSG/6Ws5c/5AxtVKi2NmyU3bpO3qSv8Meva6umsy6rWWTV
 v4AQA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
Reply-To: linux-kernel-dev@aliel.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Describe the system clock of each PWM controller (CLKID_SYS_PWM_*) as a
third clock, and add the clock-names property expected by the updated
binding: "clk_a", "clk_b" and "core".

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 8f3f1c0579a0f..83c597d418875 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -692,7 +692,9 @@ pwm_ao_ef: pwm@30000 {
 				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
 				reg = <0x0 0x30000 0x0 0x24>;
 				clocks = <&clkc_periphs CLKID_PWM_AO_E>,
-					 <&clkc_periphs CLKID_PWM_AO_F>;
+					 <&clkc_periphs CLKID_PWM_AO_F>,
+					 <&clkc_periphs CLKID_SYS_PWM_AO_EF>;
+				clock-names = "clk_a", "clk_b", "core";
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
@@ -701,7 +703,9 @@ pwm_ao_gh: pwm@32000 {
 				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
 				reg = <0x0 0x32000 0x0 0x24>;
 				clocks = <&clkc_periphs CLKID_PWM_AO_G>,
-					 <&clkc_periphs CLKID_PWM_AO_H>;
+					 <&clkc_periphs CLKID_PWM_AO_H>,
+					 <&clkc_periphs CLKID_SYS_PWM_AO_GH>;
+				clock-names = "clk_a", "clk_b", "core";
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
@@ -715,7 +719,9 @@ pwm_ab: pwm@58000 {
 				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
 				reg = <0x0 0x58000 0x0 0x24>;
 				clocks = <&clkc_periphs CLKID_PWM_A>,
-					 <&clkc_periphs CLKID_PWM_B>;
+					 <&clkc_periphs CLKID_PWM_B>,
+					 <&clkc_periphs CLKID_SYS_PWM_AB>;
+				clock-names = "clk_a", "clk_b", "core";
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
@@ -724,7 +730,9 @@ pwm_cd: pwm@5a000 {
 				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
 				reg = <0x0 0x5a000 0x0 0x24>;
 				clocks = <&clkc_periphs CLKID_PWM_C>,
-					 <&clkc_periphs CLKID_PWM_D>;
+					 <&clkc_periphs CLKID_PWM_D>,
+					 <&clkc_periphs CLKID_SYS_PWM_CD>;
+				clock-names = "clk_a", "clk_b", "core";
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
@@ -733,7 +741,9 @@ pwm_ef: pwm@5c000 {
 				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
 				reg = <0x0 0x5c000 0x0 0x24>;
 				clocks = <&clkc_periphs CLKID_PWM_E>,
-					 <&clkc_periphs CLKID_PWM_F>;
+					 <&clkc_periphs CLKID_PWM_F>,
+					 <&clkc_periphs CLKID_SYS_PWM_EF>;
+				clock-names = "clk_a", "clk_b", "core";
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
@@ -742,7 +752,9 @@ pwm_ao_ab: pwm@5e000 {
 				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
 				reg = <0x0 0x5e000 0x0 0x24>;
 				clocks = <&clkc_periphs CLKID_PWM_AO_A>,
-					 <&clkc_periphs CLKID_PWM_AO_B>;
+					 <&clkc_periphs CLKID_PWM_AO_B>,
+					 <&clkc_periphs CLKID_SYS_PWM_AO_AB>;
+				clock-names = "clk_a", "clk_b", "core";
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
@@ -751,7 +763,9 @@ pwm_ao_cd: pwm@60000 {
 				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
 				reg = <0x0 0x60000 0x0 0x24>;
 				clocks = <&clkc_periphs CLKID_PWM_AO_C>,
-					 <&clkc_periphs CLKID_PWM_AO_D>;
+					 <&clkc_periphs CLKID_PWM_AO_D>,
+					 <&clkc_periphs CLKID_SYS_PWM_AO_CD>;
+				clock-names = "clk_a", "clk_b", "core";
 				#pwm-cells = <3>;
 				status = "disabled";
 			};

-- 
2.49.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
