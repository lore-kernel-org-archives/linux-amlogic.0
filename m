Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE55C61DA4
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Feb 2023 11:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dg1XzSRN9emC5FnDvBKopjvwdngdnOXTCNvJxcXbDt0=; b=eRIREg+giBBiUn
	2o2K7KXJoKg3HpAdvaAyyzX7kzHz0df2Od9xv8Pdvb7ZarFo7h89sVFi2JHly305bzvEu7PZjPxrq
	temEBI4SPsaXVp7dbPbQaXa0cWUviTUeJ0jBbXw4zKsZjEdoErQreV3vufUf1q35xpz/buUMwa/g3
	++EGzoVFzKdc3jBWG6IrUXWKqcZzdmAQ4Pc+zpzxo2zU6+AT5yjILMFsrtVo8nwI9axyhRKGN2VaX
	jG/RotT+iHj8S1GGUrDoUibOjQfA2ZutrbYaZPL288el7tuXgQ4zxboYHIwH/XSk9iDJJ13jMYHRG
	Y81kKT2m2k1XWRj5uNEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUne2-00CDfN-FM; Wed, 22 Feb 2023 11:50:46 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUndz-00CDbp-4n; Wed, 22 Feb 2023 11:50:45 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 2F5CC5FD60;
	Wed, 22 Feb 2023 14:50:30 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1677066630;
	bh=NI3Qga+qg/qUI1RfYvTnROlNrbv1pdLqP/Xu41xF+44=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=npI7zR4bm4ibCYlSQNIbxEbgoEmFp/7H5S5/LoP2eiyKY7aVjNvszlyGQrzj8kijz
	 nWs4vNNoy8jwKaZexfNevtGtzzGMtx2S7Rp4F3fnyCgkLn9vCL9xglH4eL69QgOV3E
	 SVq2BwM1UnTGPMYfB8xJsrj4erQTyqQxw1b08nxcGtna4tcQ3V0/jQFxAU8vjDjiNZ
	 wxinpAoUhImYlyOPEIIGqidITMeu87ELV4q+W3O8oNwse3K1UYQfiycDXAxX1ZqL6p
	 JWiWkme9ynGmYgytgKQK1Z2OHNlPyWMzDU9Xf8d9llhCUlePBp3Xrl9t3cd7BeeqkG
	 TqBtarvpr9Esg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 22 Feb 2023 14:50:29 +0300 (MSK)
From: Alexey Romanov <avromanov@sberdevices.ru>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <linus.walleij@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@sberdevices.ru>, Alexey Romanov <avromanov@sberdevices.ru>
Subject: [PATCH v1 0/3] Meson A1 32-bit support
Date: Wed, 22 Feb 2023 14:50:17 +0300
Message-ID: <20230222115020.55867-1-avromanov@sberdevices.ru>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/02/22 06:32:00 #20888384
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_035044_025684_8DAC6F80 
X-CRM114-Status: UNSURE (   9.18  )
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

Hello!

This patchset adds support for 32-bit Meson A1 board. 
We describe device tree with following components:
CPU, GIC, IRQ, Timer, UART, PIN controller. 
It's capable of booting up into the serial console.

We have tested this DTS and used drivers at our 
32-bit Meson A1 board and it works correctly.

Alexey Romanov (3):
  meson: pinctrl: use CONFIG_PINCTRL_A1 with CONFIG_ARM
  firmware: meson: use CONFIG_MESON_SM with CONFIG_ARM
  arch/arm: dts: introduce meson-a1 device tree

 arch/arm/boot/dts/meson-a1.dtsi | 151 ++++++++++++++++++++++++++++++++
 drivers/firmware/meson/Kconfig  |   2 +-
 drivers/pinctrl/meson/Kconfig   |   2 +-
 3 files changed, 153 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/meson-a1.dtsi

-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
