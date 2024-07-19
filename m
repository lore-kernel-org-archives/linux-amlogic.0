Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5EEC3DA59
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Jul 2024 08:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mHNFOA2Llo8KSQGGPV8CHhYyAsReRF4weGW2XVDb0UQ=; b=49ehquY+U0Zw8g
	D8uyFrlz/90j5sloXl4ZKFxOUe+0ruUfvWkaKvvMgmsv3YxNWdbFT/IYFSreGM6qykt6Cf4a1kHS2
	jI1/6DAsSaSiDmM+nJZrfS6vCetmYlpOMBEN3Brn+1H/AEt5dkVsSlxSdL6rgjH3kqcrSbPKRvMuH
	lT49Wh0Nd63A/wvXa26j0Xlh08tmpJooDE2uhhkv+ww2QSe8KItRVxWoDSRyyoY13YyQptQr0y406
	k19NxZQLIh/dDapTa7kfe4zW0+PZDG0SAtiRg96AZC7DmUjeRYlFmhpiEt3E8c45Ulm/mNWIxllic
	iu6W38oZ9u0ANXxRub6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUif3-000000020Cd-2P1m;
	Fri, 19 Jul 2024 08:08:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUif0-0000000209b-0tuR;
	Fri, 19 Jul 2024 08:08:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 931B661C55;
	Fri, 19 Jul 2024 08:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5DB45C4AF1A;
	Fri, 19 Jul 2024 08:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721376492;
	bh=rzLwwkC/oer4IKZiroanbDLw+etqrVLhhYZwC5by1VY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bK4c++rlrwKmhbDz1JVqLv44eQ+8wCkdo6aAiZslRXzkbkmdxXN+KGP8CheRAfnqI
	 tt3P4hJl6MAgNCa+nOudNB5wM/DpoPcSbxDGXP2PLwHlTLUI9X1fDRWUzDmJm5Vt0+
	 451oTGU3USBIk7fSjFbXxnpcQGRnrnXiMPw0nFtUDacs/6BRguAa+R2qnuqo8s9wVv
	 8HVraVrR7tUTfY0v9k0pfS1Vasa8LgXZdiGSA1Z0F/EaUEgLFPhkNgpbUHq4pzVH0R
	 NCl1V47G22MaSmx6Y01papYPzLC8gjCHBo8Izid5U4mfvfZgLlozZdkCUv0MNG5vkH
	 lxSL84s7g5pYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5193EC3DA70;
	Fri, 19 Jul 2024 08:08:12 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 19 Jul 2024 16:08:14 +0800
Subject: [PATCH v3 6/6] arm64: dts: amlogic: a4: add ao secure node
MIME-Version: 1.0
Message-Id: <20240719-soc_info-v3-6-020a3b687c0c@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721376490; l=1080;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=Zl2TiQJDwOdSpUPv3WU4sx37kiV4xoQ/BADR59alPhc=;
 b=wBSeur+SAfT00QiwrwbLZOTSIXxAG7NltC82LZfXjKXJidhqBJYlznZHLPPm46UKO75KdMPV8
 64fpcWa2Q/uCH9GkFYeeIoMKN+9U/7o2E37yA6TO5myILPXOUqMx8rV
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_010814_372885_7DC280F4 
X-CRM114-Status: UNSURE (   7.83  )
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
