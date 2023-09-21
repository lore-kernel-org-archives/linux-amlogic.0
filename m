Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C67E706F0
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Sep 2023 08:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kLe+xYTl+BWCi8Xdm+Er4656QuI5vNUYNiBkV9kn/nk=; b=UiXa2+vsTXNAE/
	8CYx+7e5w7fhM0qSoCrcRLRnSswEC+OKkhEZlME0iWgkBDtp5+AdFxMGbwZ37ycFj3XDvaOz/spRM
	IZvTztOwKcdDW3FVZ+ay8hARjJLY7NUs0NxMhrdJ/32lNHr9Lfr+2mRrsHqvalvooWkJYA1hTzW9Q
	IANZSHrru+v/lL0A4j0GrtbGMnHix4fVKHpWS2DrQPw0QnWtCJdloLHG+P/HKUk6HkcEQOgScREoZ
	gfFn+vDLcq6JNGvY+vmkxAaKmb9ILuSVQ4mJVbLZFqtIDz+vqBEZYdPCb73Pls2yCCRsWF5BFkFb0
	K9FkGyJZ8Gl3Sk/BGxrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjF9Y-005Uv3-2I;
	Thu, 21 Sep 2023 08:35:16 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjF9V-005Uu3-2m;
	Thu, 21 Sep 2023 08:35:15 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 21 Sep 2023
 16:34:57 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <brgl@bgdev.pl>, <andy@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH V2 0/3] Add pinctrl driver support for Amlogic T7 SoCs
Date: Thu, 21 Sep 2023 16:34:05 +0800
Message-ID: <20230921083407.1167510-2-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_013513_922518_A84C08AB 
X-CRM114-Status: UNSURE (   6.79  )
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

[PATCH 1/3]: 
  V1 -> V2: Rename amlogic-t7-gpio.h to amlogic,t7-periphs-pinctrl.h

[PATCH 2/3]:
  V1 -> V2: Include header file changed to amlogic,t7-periphs-pinctrl.h

[PATCH 3/3]:
  V1 -> V2: Unchanged.

Huqiang Qin (3):
  dt-bindings: pinctrl: Add compatibles for Amlogic T7 SoCs
  pinctrl: Add driver support for Amlogic T7 SoCs
  arm64: dts: Add pinctrl node for Amlogic T7 SoCs

 .../pinctrl/amlogic,meson-pinctrl-a1.yaml     |    1 +
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   |   16 +
 drivers/pinctrl/meson/Kconfig                 |    6 +
 drivers/pinctrl/meson/Makefile                |    1 +
 drivers/pinctrl/meson/pinctrl-amlogic-t7.c    | 1612 +++++++++++++++++
 .../gpio/amlogic,t7-periphs-pinctrl.h         |  179 ++
 6 files changed, 1815 insertions(+)
 create mode 100644 drivers/pinctrl/meson/pinctrl-amlogic-t7.c
 create mode 100644 include/dt-bindings/gpio/amlogic,t7-periphs-pinctrl.h


base-commit: e143016b56ecb0fcda5bb6026b0a25fe55274f56
-- 
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
