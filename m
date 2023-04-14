Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDF3C77B76
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Apr 2023 15:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LjqplnUkKNLvHdboQ+RqvV4Rqy7ozvUVVWQx1pLtyBI=; b=jpKdpQwHLXVx4x
	SoN5cHkP8kisAv1IlKc+ZE8UlvF0YbXSvoHUHxPABOJCcnvyDmMEKUDXpwQPQmWApjm1/tdpaBH4x
	aBnx8Ywl3W+Pdq39cOXuJWMatYcTkDNCSUdFDQ3lo9BbYCE6j3o2rLR8xRhya6mhP5gRrsz0fUi7X
	WYKSx8FNVD/8Wgu/Fh/jBMfxI2za4M7EtdDO6SEz7Oe3pp1NyPmaCtrea6Eozmm1mDI3NzuQ05+X+
	4hjiv9oq9jLL2wLxowvX2FhVkJE4gXNcWMqp8zL0SxgadLFLkOo6Od56eKsWtIKr97wazQ5B6oyHO
	L0Yz2J1Ye/HnOLLgu94A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLIE-009wrk-0J;
	Fri, 14 Apr 2023 15:24:54 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLHz-009wds-30;
	Fri, 14 Apr 2023 15:24:43 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id E52E95FD0A;
	Fri, 14 Apr 2023 18:24:32 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1681485872;
	bh=27rKXTxLIgcS+trNatx2a2CTSjoT7Q+aM89mbryOnzI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Uz8wBngDVIw48wLM/QWlmCJUlOirzMBsQEOG0xrZzrwXJanZJVT/GiLt80WLq3Q/2
	 EyqqOMbA3EFLL/k68vaZ9evR2Ck+1wGmj1NBcB0vzgULQt83DBTlLNDMhppj16lRiS
	 AgUSq4kYkuG+j9Mye2yaPZSQZuHJmcxqefSQ29d8bKGAANPo4TYT9pnOJNlkGUKfVI
	 NR6uRr1ozPk+9UQQu2Z73RuN0HOpVZJ2HdaEK+Jnx9Mz8p4nSlnjT8eB98IST+K0HE
	 n7qZ5kW2ExUxiV/saf4CctTFseoY2Remenf3CY5tFQqmoH2/upQbsr35n/AP8kx2gC
	 JoNVuwI3dz2QA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri, 14 Apr 2023 18:24:30 +0300 (MSK)
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <mturquette@baylibre.com>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <hminas@synopsys.com>,
	<Thinh.Nguyen@synopsys.com>
CC: <yue.wang@amlogic.com>, <hanjie.lin@amlogic.com>, <kernel@sberdevices.ru>,
	<rockosov@gmail.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, Dmitry Rokosov <ddrokosov@sberdevices.ru>
Subject: [PATCH v1 0/5] arm64: meson: support Amlogic A1 USB OTG controller
Date: Fri, 14 Apr 2023 18:24:18 +0300
Message-ID: <20230414152423.19842-1-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/14 08:08:00 #21104846
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_082440_156171_0E76BE1D 
X-CRM114-Status: GOOD (  10.72  )
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

This patch series introduces full support for the Amlogic A1 USB controller
in OTG mode (peripheral and host modes switching).

Previously, Amlogic's patch series [1] was applied to the upstream tree,
but it only had USB host mode support.
Furthermore, the device tree patchset [2] wasn't merged due to a missing
clk driver.
Patchset [2] has been completely reworked:
    - changed register base offsets to proper values
    - introduced dwc2 in peripheral mode
    - OTG mode support
    - the SoB of Amlogic authors still remain

Testing:
    - USB OTG role switching between gadget and host - OK
    - Peripheral mode - OK (tested with adb shell/push/pop)
    - Host mode - OK (tested only USB enumeration and detection)

Links:
    [1] https://lore.kernel.org/all/1581990859-135234-1-git-send-email-hanjie.lin@amlogic.com/
    [2] https://lore.kernel.org/all/1581990859-135234-4-git-send-email-hanjie.lin@amlogic.com/

Dmitry Rokosov (5):
  phy: amlogic: during USB PHY clkin obtaining, enable it
  usb: dwc2: support dwc2 IP for Amlogic A1 SoC family
  dt-bindings: usb: dwc2: add support for Amlogic A1 SoC USB peripheral
  usb: dwc3-meson-g12a: support OTG switch
  arm64: dts: meson: a1: support USB controller in OTG mode

 .../devicetree/bindings/usb/dwc2.yaml         |  1 +
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi     | 59 +++++++++++++++++++
 drivers/phy/amlogic/phy-meson-g12a-usb2.c     |  2 +-
 drivers/usb/dwc2/params.c                     | 21 +++++++
 drivers/usb/dwc3/dwc3-meson-g12a.c            |  2 +-
 5 files changed, 83 insertions(+), 2 deletions(-)

-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
