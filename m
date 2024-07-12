Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6101FC3DA45
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Jul 2024 06:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o1D8aVRhNxdrxsIgeiIiY5yEf2Fhnma2aIx6moS74iU=; b=IlPm61sVZREcrh
	RCoBB1ObVRJcrHIRZnaFIGwPh+AJ7mz8Z+fg6kzuIVy3CCmv8G/zSoahyPa6D+YLPD6bKiezqB2Vc
	Dmprb2xI2MRuSsN1KQ6Kz/wtfedon8odqZHk4cYgbKKRurbrXAU6fafQSoueXoGP+D4tIFFWzhuZL
	TIwmmfPjzIyEX2uvK0w7vx30dt4o9xzXhB5ra97Cbo5eeNEgLsstSBOAR8f5zczaDFJATESkzYZto
	ohSj9rSylW3w5zxV14PhNEcq3ISMfU1Wn046a7fWmSnbHN2MQf4RWDbV0xpa9XSrzvhGQGbM38jOZ
	ZyTH2Ff3dDvJOWyE/xuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSABo-0000000GgX5-2ppT;
	Fri, 12 Jul 2024 06:55:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSABA-0000000GgE5-1MaO;
	Fri, 12 Jul 2024 06:54:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4243F61E51;
	Fri, 12 Jul 2024 06:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37B2FC4AF0B;
	Fri, 12 Jul 2024 06:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720767290;
	bh=AU9KTXadbxI8oIBrYquNcFFE218xKds4EJiKkSzo9PE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=d6sRShauuPv/QMI0alTwT7hy2a2fUGv5+9Qa7jbvCjMe1BO5Yxyey6XiaIxUEcE3k
	 VDAp9AR8L8ntFg1ceGUZjR+szaBnkraoEFNht1mgm47J9SixnA1Vf9LjsFbszIp/0z
	 608aa+bJM3DicBahLXQ/pDtPwNZEj+t0vwnKwZ4BpXQ9//LJcR6U9tSy8NQfIEE2ih
	 /KBvpXaJBze3oVfjNYT45M/1EOylA2SrEgTsu/GNavrQpKwG4v6uI2fRDcxOzM5mek
	 B/yCvyrH58/mXFQFfGjhirJYZAtVaUMB+FLFT/fOlDOE/NgHtrwqy8GtR3GpJJaoOQ
	 BMQSE5h6BlMOA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2225BC3DA52;
	Fri, 12 Jul 2024 06:54:50 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 12 Jul 2024 14:54:48 +0800
Subject: [PATCH 3/5] arm64: dts: amlogic: c3: add ao secure node
MIME-Version: 1.0
Message-Id: <20240712-soc_info-v1-3-05ba95929d5a@amlogic.com>
References: <20240712-soc_info-v1-0-05ba95929d5a@amlogic.com>
In-Reply-To: <20240712-soc_info-v1-0-05ba95929d5a@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720767288; l=967;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=Vo92QkR7KttBJIDyNMyI82sWcd31gahBSNFC4bI9l+Q=;
 b=65es6tnxvyljk4Wr5boKxighjBwUeJysMTyc7FjzOhbQ0iyt56Mynu3k2WDIhJul2JJWVjDDf
 mWLWufJGuw4BR9YMOafe5KQesRryXb+FbSh/OgoxIug5MN1Msq//SE+
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_235452_469376_E947796B 
X-CRM114-Status: UNSURE (   7.70  )
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
following information for board with Amlogic C3 SoC:
soc soc0: Amlogic C3 (C308L) Revision 3d:a (1:1) Detected

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
index f8fb060c49ae..d6a94c828fd8 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
@@ -129,6 +129,11 @@ uart_b: serial@7a000 {
 				clock-names = "xtal", "pclk", "baud";
 			};
 
+			sec_ao: ao-secure@10220 {
+				compatible = "amlogic,meson-gx-ao-secure", "syscon";
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
