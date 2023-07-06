Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104B7EB64D9
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jul 2023 11:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VHay1GIA9WlE7mkisaqodNS5tu0XcIGQul29D+jrEz0=; b=BUoMTNDXC0YWwy
	7UeRHwDJEz2xubDjh9kUKK3Aze9qKQcIkw8+kT/fZG8VC8chxyVMusdfL6ySVGbhPzw/sNpJPD0qB
	VG0rHBrpE8c5Gf2BnOlPFLTCwmWVBN/8xuUScztO8h7SJJ3m0WLKXpzSVFXYIX8QNvJFc23N/ZNAh
	KeUy8Xl3zyyQ4hpoqwOHq85IVaHUV0fe34KcwsevODoIBxu6slJKGse7MLwMFKu9R+yMH5nmThb2l
	N3AoeNQxUvMuIR67GJpvVmrb3+Gn5Cvm+RKbNRAZhEdRFuoV7uG6N7x+hkQLrOqnOe6VY3YTV8pUs
	g3clT7RB2ygtT2OfPOcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHNR0-001WKN-1q;
	Thu, 06 Jul 2023 11:46:06 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHNQx-001WIX-3B;
	Thu, 06 Jul 2023 11:46:05 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 6 Jul 2023
 19:45:46 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <brgl@bgdev.pl>, <andy@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH 0/2] Add pinctrl driver support for Amlogic C3 SoCs
Date: Thu, 6 Jul 2023 19:45:20 +0800
Message-ID: <20230706114522.2490655-1-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_044604_041063_3D52817A 
X-CRM114-Status: UNSURE (   6.14  )
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

This patch adds pinctrl driver support for Amloigc C3 SoC (C308L and C302X)

Huqiang Qin (2):
  dt-bindings: gpio: Add a header file for Amlogic C3 SoCs
  pinctrl: Add driver support for Amlogic C3 SoCs

 .../pinctrl/amlogic,meson-pinctrl-a1.yaml     |    1 +
 drivers/pinctrl/meson/Kconfig                 |    6 +
 drivers/pinctrl/meson/Makefile                |    1 +
 drivers/pinctrl/meson/pinctrl-amlogic-c3.c    | 1110 +++++++++++++++++
 include/dt-bindings/gpio/amlogic-c3-gpio.h    |   72 ++
 5 files changed, 1190 insertions(+)
 create mode 100644 drivers/pinctrl/meson/pinctrl-amlogic-c3.c
 create mode 100644 include/dt-bindings/gpio/amlogic-c3-gpio.h

-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
