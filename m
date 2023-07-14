Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED48DEB64DA
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jul 2023 12:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N/mX5SFPB7pfgrzSP89BDa2tRIonhtxBpdS6RinvR0Q=; b=hQnYvWFr6yHy+U
	Cr187rwoIULjQV2vJhJL2HAmI1qSQIjVil/6f+GXeAIKUZ/lcPQ/w/ixo01zcoaJG5J9sH/NzMI3c
	bWXNWNGkNr0TlVAqJkZk3T3wq4r4AZacr/xs7vIG1B0FTXmkvNo46XYSzhJQsM33IeEka8alTfaNb
	8AeUtx/ggArwWUnX0mDhgqyuMAKTz/XYkKuIKwW/4IMUHd09suPBPzS4mWV+IkpdWM2/ndY6KyYuA
	a5TA4wGckpYKxxzEy2DvMj2WEbxuGugXSTCtd2rnMXmvCB3w/aXVyzuE7CsnI9oFDWrMifEEqB48G
	JeXy8/cDYfDJh/Pm8pQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKHrH-006BX4-2L;
	Fri, 14 Jul 2023 12:25:15 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKHrE-006BVK-1X;
	Fri, 14 Jul 2023 12:25:13 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Fri, 14 Jul 2023
 20:24:44 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <brgl@bgdev.pl>, <andy@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH V3 0/2] Add pinctrl driver support for Amlogic C3 SoCs
Date: Fri, 14 Jul 2023 20:24:39 +0800
Message-ID: <20230714122441.3098337-1-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_052512_539032_1C8CE3B9 
X-CRM114-Status: UNSURE (   6.43  )
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

[PATCH 1/2]: 
  V1 -> V2:
    Unchanged.
  V2 -> V3:
    Updated commit message, and compatible are sorted alphabetically.

[PATCH 2/2]:
  V1 -> V2:
    Added a comma to the last item of the array and a period to
    the commit message.
  V2 -> V3:
    Ditto, and corrected license.

Huqiang Qin (2):
  dt-bindings: pinctrl: Add compatibles for Amlogic C3 SoCs
  pinctrl: Add driver support for Amlogic C3 SoCs

 .../pinctrl/amlogic,meson-pinctrl-a1.yaml     |    1 +
 drivers/pinctrl/meson/Kconfig                 |    6 +
 drivers/pinctrl/meson/Makefile                |    1 +
 drivers/pinctrl/meson/pinctrl-amlogic-c3.c    | 1108 +++++++++++++++++
 include/dt-bindings/gpio/amlogic-c3-gpio.h    |   72 ++
 5 files changed, 1188 insertions(+)
 create mode 100644 drivers/pinctrl/meson/pinctrl-amlogic-c3.c
 create mode 100644 include/dt-bindings/gpio/amlogic-c3-gpio.h


base-commit: fe57d0d86f03a8b2afe2869a95477d0ed1824c96
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
