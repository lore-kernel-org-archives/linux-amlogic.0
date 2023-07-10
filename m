Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B2CEB64D9
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jul 2023 04:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bJxdemtu82qlIi/VnbdnvVIakZgBxkvXCDW80zvxVws=; b=CPctoPAcJTnM68
	s72ttyjU7dfNAhXyvqtpjBqr9Qy+modDrBsGojlhpIwwBtqe4ukdhkwAsMvL+Q4mlg6XNSh+o3OZo
	M0V1SW45R35JI0EafUxLCGIqmvGr0vvUsMnKh2HB7zAXphPWQPWKxdTGDzYB+XYN4uNtQoacBjDrk
	OsUwJpmmtQ9jJzfozQfiXvoMIZlW6pXu4UpQk3eAIUD9ZgD8DLEQOVgaRpbT62blkyRNVYDTu6MKQ
	2m8tXOVK3s3z+gH/K31XUKZhAuEqPtAweGjhQNuc/SQ8vRFcLYs5wF3UvhNfBrt6BH1bT8IWlLJgy
	4I4efJuB2lmwBEGPPfJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIiVv-00ANei-38;
	Mon, 10 Jul 2023 04:28:43 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIiVs-00ANbm-2R;
	Mon, 10 Jul 2023 04:28:41 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Mon, 10 Jul 2023
 12:28:23 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <brgl@bgdev.pl>, <andy@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH V2 0/2] Add pinctrl driver support for Amlogic C3 SoCs
Date: Mon, 10 Jul 2023 12:28:10 +0800
Message-ID: <20230710042812.2007928-1-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_212840_819123_484FA190 
X-CRM114-Status: UNSURE (   6.78  )
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
 drivers/pinctrl/meson/pinctrl-amlogic-c3.c    | 1108 +++++++++++++++++
 include/dt-bindings/gpio/amlogic-c3-gpio.h    |   72 ++
 5 files changed, 1188 insertions(+)
 create mode 100644 drivers/pinctrl/meson/pinctrl-amlogic-c3.c
 create mode 100644 include/dt-bindings/gpio/amlogic-c3-gpio.h

-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
