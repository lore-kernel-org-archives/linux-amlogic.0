Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAEDC10DC1
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Dec 2023 07:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hKYKYg8xwNJDNfmeDYbch1PL5kSgNFV0bbgB+PcvPjI=; b=sUK4ZCNybWg5p5
	LBsqwdVKPoBPNmRwWX6Phw1CfXT0KL4R++N1UR9n2gsok1FNKdg0IgniwBbpERZtn5zbNkEomaMLW
	wa5+BvXbdbHODRi/3XGxvKPrIop0AZ5PirGqHKgpONavCvEdD2UKhO/jK8YxyrQXzjqmg929iGpJs
	8B/Zl4mk9n5Wigop6juSfZ1MUF4ZD+Smc8XzBqJAWw70lashN0tGppxpf0tDgB8ETQ9mRQmkDz6kH
	YkoZTrLRAiGWju83yyVeVoT0UuAtsLt7gV53t9YbZHxcsnezcA8TZ+flI37D6mHapuOpVAS+PPZT4
	qaMzZKe0oso9YQoiGgXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBV69-00Ew4z-2N;
	Fri, 08 Dec 2023 07:16:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBV67-00Ew41-25;
	Fri, 08 Dec 2023 07:16:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 51E036222D;
	Fri,  8 Dec 2023 07:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E433BC433C8;
	Fri,  8 Dec 2023 07:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702019790;
	bh=x1LVuWnPlnaL4+2ytK6scMJJiGc0PC686IXbzerTiJw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=rTe+JZ0zp4T5LGm27ilvRzON+mk5FlHVKXQJcllo9M0PActoOXd7UAMozvAlSqU/h
	 crjfKAq7bKOH7JH3RoZf9uVkZYmSDScuiHlq5loAD/Uy8Lwa/GEnbEhU5MdybkPipd
	 0nGrdnmb7E5/DRQ/XLSjoqsKgR7K/lWa6r7xNdxMvPVfNk7z1MhOiqMm0ro4ZIH5W2
	 aT1ybXcPoGAelDhD8YaItF2KVQF98lxlBSg2kmXkmPi885cFS8F9htZlu5YQheZ/IQ
	 JWKEezRxxHHPfcqw0aDgbf9+ft5qqoy0oWriqaP03RMTDYs+I5NlqeXqF7gXf62pcY
	 I1v4UJ5NSEzPA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD23DC4167B;
	Fri,  8 Dec 2023 07:16:29 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/2] Add some devices nodes for S4.
Date: Fri, 08 Dec 2023 15:16:25 +0800
Message-Id: <20231208-s4-dts-v2-0-5a93fa356c5d@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMnCcmUC/0XMQQ6CMBCF4auQWTuknVZCXXkP46LSASYRSlqiR
 MLdbdy4/JL/vR0yJ+EMl2qHxC/JEucCOlXQjX4eGCUUAykymlSL2WJYM5IN/AjNuSHloMRL4l6
 239HtXtynOOE6Jvb/uSanHDnratLKGNOixk38/GapP6OPVz894yBd3cUJjuMLP2hC5pwAAAA=
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702019788; l=1074;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=x1LVuWnPlnaL4+2ytK6scMJJiGc0PC686IXbzerTiJw=;
 b=ec+Ua7KFxOXT8HGqxc1F4xX4Bxgl9cTzrFEJxXZPSLqxRST5tvzJdnm2ui19/ZBp6SAD0ck5l
 lZlTeCFIAC2BJ+NJl5bWz97x6ZiBFhzLebcuXOWgOFX6ZZnSMlCmcE4
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_231631_742066_50D39E5F 
X-CRM114-Status: UNSURE (   8.48  )
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

Add some device nodes for SoC S4, including periphs clock controller
node, PLL clock controller node, I2C nodes, SPICC node, NAND
controller node, Ethernet MAC and PHY node.

Add reserved memory for board AQ222 which is used by ATF.
Enable NAND, SPICC nodes for board AQ222.

---
Changes in v2:
- Separate and independent commit for dts file.
- Revision format error.
- Add comment for resered memory.
- Link to v1: https://lore.kernel.org/all/20231129092949.2103338-1-xianwei.zhao@amlogic.com/

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

---
Xianwei Zhao (2):
      arm64: dts: amlogic: add some device nodes for S4
      arm64: dts: amlogic: enable some nodes for board AQ222

 .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     |  56 ++++
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 350 ++++++++++++++++++++-
 2 files changed, 405 insertions(+), 1 deletion(-)
---
base-commit: 093098370b4693b0da8b7fdf5fd212cb46705928
change-id: 20231208-s4-dts-24debd656209

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
