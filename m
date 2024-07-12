Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A33C3DA45
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Jul 2024 06:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ki2qHtpV3fAdJdKbMWaFLSBAVpsQjKh7Q0Oz/o6DDt0=; b=FWyS4LB2SfegSJ
	qgniJ3ICmZzkjb45FXPkmxRUGzHWjf9MuW4pY1ekKcAzw4DVxkkUCD0sXev+gTAAJ7MDEl4xa4Hkt
	j6g7Cs5Ynlgk54cGTnelGzLAHUGOXhaLJ4DTgv6mUM/2g4f+znqTqaxnaimC7j+9qWsdVMyT3/3bP
	jb+EGoj+P/1cgved0/tvaDGNlPnIQlhzuCsnmA+OEhlytzlY7ooyah8yR7J6pcl7xi4ayZj7k0HMI
	4/pJHoHEAY+3DwydeWUWGFQmYskcosXUWp5+/vC/VDIRrAyk6nDs/PiG/VrV0QNiV53eCjbsXP9R6
	M7aHxHy6q8fBO1JxHMiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSABS-0000000GgMf-2jEf;
	Fri, 12 Jul 2024 06:55:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSAB9-0000000GgE4-3aj8;
	Fri, 12 Jul 2024 06:54:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5552761E55;
	Fri, 12 Jul 2024 06:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C1ADC4AF12;
	Fri, 12 Jul 2024 06:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720767290;
	bh=82EL7UtqOt5BKQ0zNdO4ISrbWoeY1ULwxbT03D2KIhk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Vl0R4Mg3xR9HjWnhvLfaD92s1A+SNx3+oD3se7cZaq5T3Jf2XlcupZ3hTWqQ8Ci+r
	 m9ri8Cdj7BYk/nFKDDmknu2ydzLHzaJstRdGyKFvsSh5O/1WqURKVCFslj9kAHfnht
	 Bw43HhKG5r18iUF7pnxRwY/FCcZjacMDvjQWj/VxrmG2Fl/YBQYAMQRnWjaa+IoF5C
	 OzdECa1iNzO4A2snSNSgy+pOT8FtvJBgkmE81NKD2hahy9DK3KL9+Q1amxMUSyEk1u
	 JAETcSDNsAbn5Ct4In1+2kcDVlO6pXQsIW2KNoYUcF6GDxs2qgmP5TDKOW+BNxW7YD
	 KlfmdnY5Tu4Rg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3193AC3DA50;
	Fri, 12 Jul 2024 06:54:50 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 12 Jul 2024 14:54:49 +0800
Subject: [PATCH 4/5] arm64: dts: amlogic: t7: add ao secure node
MIME-Version: 1.0
Message-Id: <20240712-soc_info-v1-4-05ba95929d5a@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720767288; l=1006;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=e/+Wxh8VonbmvPjjJfR5Wewh1r5F0lbqTjlqgINIHco=;
 b=pdL9RfF8KxiT6JauuAiMOmdhs9iPi/+40gnKTUC4s7MzZZ+gOaU5Zu8fe0uOm8DY67HC57GUY
 HOLFmGIKeNABnrJgZHUrRDih7K975N2SnrwGaDfn/SFsO/kmWCopkK5
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_235451_977058_CFAA527A 
X-CRM114-Status: UNSURE (   7.69  )
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
following information for board with Amlogic T7 SoC:
soc soc0: Amlogic T7 (A311D2) Revision 36:c (1:1) Detected.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index c23efc6c7ac0..777935821c3f 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -194,6 +194,12 @@ uart_a: serial@78000 {
 				interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
 			};
+
+			sec_ao: ao-secure@10220 {
+				compatible = "amlogic,meson-gx-ao-secure", "syscon";
+				reg = <0x0 0x10220 0x0 0x140>;
+				amlogic,has-chip-id;
+			};
 		};
 
 	};

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
