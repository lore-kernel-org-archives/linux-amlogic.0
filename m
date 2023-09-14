Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0E2EDE983
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Sep 2023 05:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wM+r9roCe2/4AzY++7/bw44ILsifjMbY7vm3Jf3em+Q=; b=y9pb7CWlsQnFvD
	RZXM/6FT9l/iE4oBK5AQm38+HhpAES3B4IW2Jy0PK6ijr2jkF1ZqGLWqlIvPB9W7j0QklOEEAzEEz
	8Y2n770nZDg4vYhVUBGbzzg8oJz4q7da1ztSWsH7sooYIWmWwgdMhiDzaCtksQ4XwtnzkKO8sGKSg
	o/dTL8fRuD1rLWp6BjFNFSaLtP2rPhGYzIIeIWWWc6JlIcsTm38suUoHHvsKZ4ROqp70PQrN2Xvs/
	cqo1PuX/hEoQOBuULcA032vqh7in808l24ycUiKsarppXfi40grRP8RjLFBiYIZvREOuFJeiboA4y
	iVnFTcK+3fMNgFwb1HZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgfAi-007S60-0N;
	Thu, 14 Sep 2023 05:45:48 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgfAf-007S2t-0o;
	Thu, 14 Sep 2023 05:45:46 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 14 Sep 2023
 13:45:35 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <brgl@bgdev.pl>, <andy@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH 0/3] Add pinctrl driver support for Amlogic T7 SoCs
Date: Thu, 14 Sep 2023 13:45:22 +0800
Message-ID: <20230914054525.1180595-1-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_224545_286966_990D2E65 
X-CRM114-Status: UNSURE (   6.15  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch adds pinctrl driver support for Amloigc T7 SoC (A311D2)

Huqiang Qin (3):
  dt-bindings: pinctrl: Add compatibles for Amlogic T7 SoCs
  pinctrl: Add driver support for Amlogic T7 SoCs
  arm64: dts: Add pinctrl node for Amlogic T7 SoCs

 .../pinctrl/amlogic,meson-pinctrl-a1.yaml     |    1 +
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   |   16 +
 drivers/pinctrl/meson/Kconfig                 |    6 +
 drivers/pinctrl/meson/Makefile                |    1 +
 drivers/pinctrl/meson/pinctrl-amlogic-t7.c    | 1612 +++++++++++++++++
 include/dt-bindings/gpio/amlogic-t7-gpio.h    |  179 ++
 6 files changed, 1815 insertions(+)
 create mode 100644 drivers/pinctrl/meson/pinctrl-amlogic-t7.c
 create mode 100644 include/dt-bindings/gpio/amlogic-t7-gpio.h


base-commit: e143016b56ecb0fcda5bb6026b0a25fe55274f56
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
