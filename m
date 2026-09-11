Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE55C88E5C
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2026 08:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1wdDxekPp7lXpJvn+K/PSHcH2+96DGPNX93O+xkkEt0=; b=XtWEslutaIJCzI
	0dTIgG1uJOH+JnCGnY4Jeqvo9copAyBfP/50kuFbp5OURRuIZbNnL63Em61TJJdf444lGcYa7fbmU
	ENhFoUI0fyeuN0egC9EW4dNmy424hEDUz+8uTtkkWiuSZ9mXLh+2PgGJX1bV72JJXCDXW1LbX7jdD
	5whbhTg4T0mnFWaAxHrjkAoMhA/yy6qwtXA0UZsab+QxyNcIAYqUqQKzenWEvFsVQhE0zwmnTOvuT
	vTSkmmmBLXkqiNOVOF9kuQYiqvZ9bEbaUHH86VNfYSp3XlPTd/519CHwneAK+NA6mjPbaH3ZoR1oC
	6Ui6AIq7v5Vqqf1DHGlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wcy-0000000G7ky-0i6z;
	Fri, 11 Sep 2026 08:28:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wcv-0000000G7h9-2sfI;
	Fri, 11 Sep 2026 08:28:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6CB15447D0;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C059C4AF0F;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789115332;
	bh=AfQRWYlOA9oYn7pKhRYTtSAvICG/ajPN7ML72cUReh4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZxYRTzTb7qRXk2BM+h7pOcSQEXwwl6BA+sp1K/pwwpcqBRSdAO3Cox+SWIIchGy33
	 d5JXIQNxzNpBw3Kds/SoWwTvtFS66jHYqFj8GysRq1XXLBhRE0niAA5JSXoBGQmObv
	 WzBv3a5LRusFJwifLGY8yjUqeBHpcHVbkrrTaykGR9pdrXqU43BMoBXQQXcJ2tGpFe
	 ZcApo7s8j/xRgFUsS5n5MfvqPW//uZqY70C4WOmPKKd8cWK383FWLR3QqFTyjQZpEz
	 4j8fbv/+H6rgJNpjeB/q1Df2NUTazWfXjc9ksYWgmdnwuzAW0yHK18aK98fY+Sk2Ct
	 n9Xt7Jw2Vh+VQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE4DC88E4D;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 11 Sep 2026 16:28:36 +0800
Subject: [PATCH 09/10] arm64: dts: amlogic: s6: Add clk-measure controller
 node
MIME-Version: 1.0
Message-Id: <20260911-more-socs-to-support-clk_measure-v1-9-940e269aa52f@amlogic.com>
References: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
In-Reply-To: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789115329; l=725;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=9SDzhFYgFeR3zBxYK2Jcmr4Ssvx78QFB8BdBwjoaCo8=;
 b=+crIwXhW12Tmd+RRIn9A3IFp0PomUDH1P4dVF+bhnXDviUtnxRsDKqtAmOKAwQpMmw+DP0bkl
 A9rw6yglxz6C3Xh7H3NMFaAmgNspq8J/c0AeQYISK7Okkb40tC6IC/L
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

Add the clk-measure controller node for S6 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
index ab3acef2b147..b0a1a05297ce 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
@@ -217,6 +217,11 @@ ao-secure@10220 {
 				reg = <0x0 0x10220 0x0 0x140>;
 				amlogic,has-chip-id;
 			};
+
+			clk_msr: clock-measure@48000 {
+				compatible = "amlogic,s6-clk-measure";
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
