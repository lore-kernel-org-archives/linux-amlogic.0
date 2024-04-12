Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44149C4345F
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2024 08:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yJ/EXKThpHthysh6Elk37ioYmA7M0HD5/Ls/yXxWIVk=; b=cupcOP42k4D4cV
	BBpxOH3NHz5nERSaSgSWRYOb9bQoxwWPihHLfSrxlWrAxcp4vdGHVG035khdfIPAA4g393hE2YTis
	m3ml90PbOVZP9K3dJ3kXzcbFpM82UecgQc3E3MmdJlmdoP3FCcC+RfRAje02nWVFrN+qNnXsCtnBs
	8jxQ9l08DVOX031ilyt+dzN7GicH5IsJmepPAK3PL2Rph6juhVPRxxjYrgmSkEzyBE8fNDmWQYRGL
	dBF8LB7WJ+M36UJU/261+KyO43UTXCdsOqaBJbvL7FrFoQkECg7jC3JzfO+lyM+iRszk4i/Ryy/lC
	IB1PuimNe+gn+nSG5LOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCUm-0000000G7SW-3fOg;
	Fri, 12 Apr 2024 08:42:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCUY-0000000G7Ei-0njo;
	Fri, 12 Apr 2024 08:42:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C22DFCE37ED;
	Fri, 12 Apr 2024 08:42:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0D75C32786;
	Fri, 12 Apr 2024 08:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712911354;
	bh=A+G6ElGrbdxKFc19F1WFdjKXJ4NPRwN4ZSGf2BITplc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=eWl/lkBW00ATexLk5CJ4hGJJhnDZK12QlOi9JNpuuLncH0QM6T/lRbazUc4x5HGjZ
	 MDNqkrXt3e43Yz5moOpe3hzw8Nm253TQpJa2GuU5PPw89QQqLBJmBViaYg5O/KRQBe
	 5n+LVd540vk7a5zljRj0nPK3TYLDniAUUrLgPtFt/c+tC50UbJ4RMjDskneVv0d39W
	 EVnUmzlLNVds26f6d6bKnxFQlpvXm8eB5LUW5DV683PxUv/FpC4Wk8xuTjl2X4oI+5
	 4VylVWq401sPKwAbdFhEkGmrIslN8oMANk1e2Fc239pIdftOKodGlAeikWgi380Lgw
	 FE5D3N9dSTYvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47EFC4345F;
	Fri, 12 Apr 2024 08:42:33 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 12 Apr 2024 16:42:30 +0800
Subject: [PATCH v2] arm64: dts: meson: fix S4 power-controller node
MIME-Version: 1.0
Message-Id: <20240412-fix-secpwr-s4-v2-1-3802fd936d77@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAPXzGGYC/3WMQQ6CMBBFr0Jm7Zi2qSKuvIdh0ZQpTCKUdEzVk
 N7dyt7l+/nvbSCUmASuzQaJMgvHpYI5NOAnt4yEPFQGo4xVVl0w8BuF/PpKKBZd14XQndWgHEF
 11kT1sPfufeWJ5RnTZ89n/Vv/lbJGjUo71xK1xp/Mzc2POLI/+jhDX0r5AkNlCI+sAAAA
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712911352; l=1368;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=oKEf8J5zEQ5VRP4drtkFgH9o2pd0Lw+wi/tMBGddobo=;
 b=g58n8V9t/QOY/0zH12yHIGuXoV1zedqzQpBb4TpKujUbaYz9w6Iv3V+0IJTaDWu4CybnE7KPy
 U0mZWlwsjwxBksQosAldqYNI8h4o8x1+ufJ+NDJhg+Mhz7pmacs70Z5
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_014238_814506_AF50EBAB 
X-CRM114-Status: GOOD (  10.43  )
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

The power-controller module works well by adding its parent
node secure-monitor.

Fixes: 085f7a298a14 ("arm64: dts: add support for S4 power domain controller")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v2:
- Add fixes tags in commit message.
- Add firmware node to adapt documentation.
- Link to v1: https://lore.kernel.org/r/20240408-fix-secpwr-s4-v1-1-01aa7ee72c52@amlogic.com
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index ce90b35686a2..10896f9df682 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -65,10 +65,15 @@ xtal: xtal-clk {
 		#clock-cells = <0>;
 	};
 
-	pwrc: power-controller {
-		compatible = "amlogic,meson-s4-pwrc";
-		#power-domain-cells = <1>;
-		status = "okay";
+	firmware {
+		sm: secure-monitor {
+			compatible = "amlogic,meson-gxbb-sm";
+
+			pwrc: power-controller {
+				compatible = "amlogic,meson-s4-pwrc";
+				#power-domain-cells = <1>;
+			};
+		};
 	};
 
 	soc {

---
base-commit: 4cece764965020c22cff7665b18a012006359095
change-id: 20240408-fix-secpwr-s4-a99ff960d0ae

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
