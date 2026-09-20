Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D266C982ED
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Sep 2026 10:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Z4Z+uujeCDSYqkzpgO6clZW0oiGRPRLjm8Rs25PGtg=; b=YbtabO99vuOzUt
	5wOM7C3fGqZzzWaQaI0iuUcdwazqDTzw7Xu5ExDdrYsIqj5FvNWQzbY5tphVK1pETO5BXxz9t3wbW
	mBFHiEwuPRaYiEpAJj5QQmo6ee8//xXbkGEyQ06CN8jjDJ/HImWaimoUoKf9kUl418MVrvuiUo0w5
	K2F362IxjqkBHbvNzT6wO7mr0FfP6cO+ql2O9A0nsD3kCbOscPE9/PHtCQwf0Ipv4zoRJDlU25b5o
	CF01LEQtiAZRspi5exZjphss08GMqD/sJubBjEv6T+MxvL4+/j0ncwHHtLxguoPuC9V3BCfaPC2ZB
	5vOvvtV9dHtmOeJRmdWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8EjN-0000000HFRF-3GaH;
	Sun, 20 Sep 2026 10:25:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8EjM-0000000HFPE-1ADD;
	Sun, 20 Sep 2026 10:25:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A70CF447DB;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 878F4C2BCB3;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789899907;
	bh=ASdPmlELWfdb/Y/YJ4rVHsEqniNVnoU71S6yuvMaeDA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RYwHfMwSAF5nDdiV+YTSP4L3xFRFa/7RQhOPKZuGeuoaq2Ci5WmX/7tPx3ZU9Kp/T
	 ITFPoB65zRVfge6y4vdwmDMV9HTnYTA0+3VAg/dQAaq3RkL0RIwgg5wdPO3iDtqlil
	 bsCz3EmzkmwecM9NGRd44zNBAx/gc35ILFFqbDoW3itOH+TT/oKwO5qRWrwtMoh8Yr
	 JMekqBK7qWgsLYPJKW8Q/BPU/r7ChimVFBuiIinTIatHuk3uFeOWzLbfQ6cx6b6arj
	 2lrEIFu/oFdwMOmnhGVkpCLFlrznDxmvfnM01CT20Yx16U9fm2YWOi8vyp4IkYeK04
	 ojq1Awj0voCfQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76229C982EA;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Sun, 20 Sep 2026 18:25:11 +0800
Subject: [PATCH v2 09/12] arm64: dts: amlogic: s7: Add clk-measure
 controller node
MIME-Version: 1.0
Message-Id: <20260920-more-socs-to-support-clk_measure-v2-9-224382a429e8@amlogic.com>
References: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
In-Reply-To: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789899904; l=725;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=g+jOIpaICoW8GinTHQ5X1UmJpEi/mHf2rXG4N1xQzYo=;
 b=WNuNl46dvYNUPSbmkvaNeDmv+5aas7rex8F4AsX7uFDvgprNI/t8BbpGAVRl/Xt8eYGago6Kq
 I5wgHOkMvPkBI/Vm3syFBtkEKBjLRf/YRkf74RaGD+OPTVT5at+ST6m
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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
Reply-To: chuan.liu@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Add the clk-measure controller node for S7 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index a3faf4d188e1..64440df4f542 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -239,6 +239,11 @@ ao-secure@10220 {
 				reg = <0x0 0x10220 0x0 0x140>;
 				amlogic,has-chip-id;
 			};
+
+			clk_msr: clock-measure@48000 {
+				compatible = "amlogic,s7-clk-measure";
+				reg = <0x0 0x48000 0x0 0x1c>;
+			};
 		};
 	};
 };

-- 
2.42.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
