Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C96C3DA5D
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Jul 2024 08:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GWMpgCG+4LCoAzg8sgMqV2OXKeZvhIVf9MKtO6tcxp0=; b=ciCta96rnoMBj3
	fLUfxIQm7Z7eE9LiuaotXu6HgPdEMegNjtvjpjvNhLwAcM+8PKRMmxfYfAFRDTSMMRmovZMi8z+TE
	pWynaGbeNkATc2dxJ5n17YYE4PJ8vGkMRE4RBlDHQcOctq3n91wUdP6tym9g5c9HDwwR3/Q+ukKXW
	UlOAcDyvu7jCZN+5ZYcL9Qnjls7/JLc8EJTXBNNx5Z7yWOSytyKqaQfpqGcLUKJminPOMWg+Y75vj
	vOtiupE4Gx1qM4AD/eoeB/eseXcoG5ipmvlVq5cEz+FDjqTpB7PQcZbxCPNFyEE+43RQe5IatAj38
	+SGEeN+decYmGKzHSgpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUif5-000000020DX-2r7Q;
	Fri, 19 Jul 2024 08:08:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUif0-0000000209U-0twK;
	Fri, 19 Jul 2024 08:08:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 28A1E61C4B;
	Fri, 19 Jul 2024 08:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E0A5C4AF0F;
	Fri, 19 Jul 2024 08:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721376492;
	bh=MFLhWRcBfYxauByXZrf0VrJqa/KVcPGuygAHknweNJ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pGW/HZEB6v+b1+/BoEpHoWOoPbOiaSAAMNDg13uF+D0tLJ/qwU4JNizpH/YcibP/Y
	 X08iEjjRxY3EZKReEOmHwPzXQkU56/XnYSRRR95TU6vy/3iO34JEaK+w5/SPvrAyX1
	 Jo44MdMt5dsjEbmuxHVCzAoS7sMSDZVhC4YC2GKcNWCNFOq5hQmO7417SH4IoqjB26
	 svYUs8nG8xuWfKq4m/SersAAO/KAP2wO69VDV1yRDdv7Regu2vDmKNbNHUtfJXEz5H
	 S7eEYGn89y0RmZ8yHgjPm4JCA5Hf+JIFZKPo5ZoYnDDuB1peOA/vPRr26Wbbxnm2Rq
	 mCYvxsrM5dKew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A008C3DA7F;
	Fri, 19 Jul 2024 08:08:12 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 19 Jul 2024 16:08:11 +0800
Subject: [PATCH v3 3/6] arm64: dts: amlogic: s4: add ao secure node
MIME-Version: 1.0
Message-Id: <20240719-soc_info-v3-3-020a3b687c0c@amlogic.com>
References: <20240719-soc_info-v3-0-020a3b687c0c@amlogic.com>
In-Reply-To: <20240719-soc_info-v3-0-020a3b687c0c@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721376490; l=1081;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=2wGt7OXk2HOANrWvEqv6pT1XbsycF6rOAmNwlp+ubQ8=;
 b=AZ/jc5KW8nrVKD8rlevj0lLWi6qLN62wIsNHLnBTTxvqIv6EKAmZs+Q3jxikXSpcHR6yPwnH/
 89Vj09Zk9FgCz6e/OI8/gSmKanHX9rto/LBt2EyGbMyE3kP0XSb3CzK
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_010814_370581_5DE22C1D 
X-CRM114-Status: UNSURE (   7.67  )
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
following information for board with Amlogic S4 SoC:
soc soc0: Amlogic S4 (S805X2) Revision 37:a (2:1) Detecte

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index c11c947fa18c..957577d986c0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -763,6 +763,14 @@ reset: reset-controller@2000 {
 				#reset-cells = <1>;
 			};
 
+			sec_ao: ao-secure@10220 {
+				compatible = "amlogic,s4-ao-secure",
+					     "amlogic,meson-gx-ao-secure",
+					     "syscon";
+				reg = <0x0 0x10220 0x0 0x140>;
+				amlogic,has-chip-id;
+			};
+
 			ir: ir@84040 {
 				compatible = "amlogic,meson-s4-ir";
 				reg = <0x0 0x84040 0x0 0x30>;

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
