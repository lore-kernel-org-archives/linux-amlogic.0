Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5146C3DA59
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Jul 2024 09:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mHNFOA2Llo8KSQGGPV8CHhYyAsReRF4weGW2XVDb0UQ=; b=vsIWvYaClItnwY
	KX9nDhPhiPD/bKfSjE2l+ZC1ajmctyKWQAHaMHln6o+B96ln5QnSLQqiNzHUMMboTNj720qpHoBwG
	5K3clJbZx6SPmrQXDLK3xZUQ6YwPohiUYvXCn194qnynuTUO5jSvHtHXzW/d6CdZ8WajaMC2ry050
	mUPpBRHOCdJ6PxpWg2zObfd5Y9g5pcvPP2b54eGwVP1tPU+w/N3Bhbmd3Np0V1uRtyuQ12WC1Onw7
	WL/KDWQ74zhPtw/pDca0mPGiGaT9+xxobu+FRBedWbVFYP9Tm4n/qXBsSQQbP4QbetVW4uAColg+4
	DYRmxmeqmacjoc5ja1JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTHZo-00000006Ry1-1j5w;
	Mon, 15 Jul 2024 09:00:56 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTHYK-00000006RHg-36EO;
	Mon, 15 Jul 2024 08:59:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E3FB1CE0E5F;
	Mon, 15 Jul 2024 08:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E31AC4AF51;
	Mon, 15 Jul 2024 08:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721033961;
	bh=rzLwwkC/oer4IKZiroanbDLw+etqrVLhhYZwC5by1VY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=b6WLiiwik8eHWyaWElku+XLxk+xaeU7QkDynvMF+MImfQJc9qJUNfTLWcGxSwVl2e
	 CmBdAAjE/8MmJUZLMSna3G5pkMAZbsePoDiG82Au7Ey6CF382KF6dZI25M/fAF9sw9
	 T8zGoVXZIAi/kmGmezFoTfp0QHPJ6b1HDpIWK6qsRbBa2/Baj6Szxz4MQvTQz808yP
	 +0HyL+psJNkw6KkedywDTOS49w8HDb+CKHUZUMwygyT5cgXuUjhdBDfpGkMUhr9lgY
	 7sB1Mc02eDb1fiPvOFeeMCqj0y2xn/pTrbrW/wTkdu2PtI5oRdqMF9UqVYWp6L6BwV
	 IVtIaTEE2YmaA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96304C3DA60;
	Mon, 15 Jul 2024 08:59:21 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 15 Jul 2024 16:59:24 +0800
Subject: [PATCH v2 6/6] arm64: dts: amlogic: a4: add ao secure node
MIME-Version: 1.0
Message-Id: <20240715-soc_info-v2-6-3836c8cc27a5@amlogic.com>
References: <20240715-soc_info-v2-0-3836c8cc27a5@amlogic.com>
In-Reply-To: <20240715-soc_info-v2-0-3836c8cc27a5@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721033959; l=1080;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=Zl2TiQJDwOdSpUPv3WU4sx37kiV4xoQ/BADR59alPhc=;
 b=Cm3hWH8krZDqMFl1wW+XfR7T/Tx/H31QC2TCprxjiutEEEBomQGa8QwM5fRhNlWkmcBJNkeUs
 9F6aPdGGrvXC9asuqf6QQHqKJFfPtbxWYknlxwop5DIEhD/c+64nnW2
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_015925_218842_890AFB08 
X-CRM114-Status: UNSURE (   7.71  )
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

Add node for board info registers, which allows getting SoC family and
board revision.

For example, with MESON_GX_SOCINFO config enabled we can get the
following information for board with Amlogic A4 SoC:
soc soc0: Amlogic A4 (A113L2) Revision 40:b (1:1) Detected.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi
index 496c3a2bcf25..54d7a2d56ef6 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi
@@ -67,6 +67,14 @@ uart_b: serial@7a000 {
 				clock-names = "xtal", "pclk", "baud";
 				status = "disabled";
 			};
+
+			sec_ao: ao-secure@10220 {
+				compatible = "amlogic,a4-ao-secure",
+					     "amlogic,meson-gx-ao-secure",
+					     "syscon";
+				reg = <0x0 0x10220 0x0 0x140>;
+				amlogic,has-chip-id;
+			};
 		};
 	};
 };

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
