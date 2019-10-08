Return-Path: <SRS0=0688=YB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5762C4360C
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2019 11:11:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FB68206BB
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2019 11:11:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eg1DrG53"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FB68206BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2Jylw/M4cGi6VISpq+hzG2jX0xK+E1yu4LQ1pIQDgf4=; b=eg1DrG53E5bn2T
	oJ6HTdFHVkzT4ixxSCVpx2fI4cX6vbJc9l5ljc121STHNuhzN4+K9J8M+Nmk7Mi7DIDlH6j75Zj3+
	IWA5Haout6d0AZ7pptQXEOvj/X50EqwYnFYbM6ukiRudq9TRiCNUGsHyi55IqhkJP5ST0oCprmd7h
	hSJBY/+7WgFqhz2AAbxj48V6Xn0r55MM/cP+gXcO/ud3tnVOwfUpSdCrpCerV7X6aER3UvOEqjWpQ
	N98os3FwCvfZap5qFPqIczZXbGvEpbsrH2jzGZWmwMJK2Up6AJYcke9zyG0S9uM4zIVwysrsmCV1p
	xF+BAPg9LAfjBtrjQJeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHnOJ-0006ch-Nk; Tue, 08 Oct 2019 11:10:55 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHnOG-0006b1-Ey; Tue, 08 Oct 2019 11:10:54 +0000
Received: from localhost.localdomain (10.28.8.19) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Tue, 8 Oct 2019
 19:10:38 +0800
From: Qianggui Song <qianggui.song@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v2 0/3] pinctrl: meson-a1: add pinctrl driver
Date: Tue, 8 Oct 2019 19:09:56 +0800
Message-ID: <1570532999-23302-1-git-send-email-qianggui.song@amlogic.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.28.8.19]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191008_041052_499311_C81AFF52 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Qianggui Song <qianggui.song@amlogic.com>,
 Mark Rutland <mark.rutland@arm.com>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, Xingyu Chen <xingyu.chen@amlogic.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds Pin controller driver support for Meson-A1 Soc
which shares the same register layout of pinmux with previous
Meson-G12A, however there is difference for gpio and pin config
registers in A1.

Changes since v1 at [0]:
 - collect Reviewed-by
 - modify commit log
 - add an extra dt parser function for a1

[0] https://lore.kernel.org/linux-amlogic/1568700442-18540-1-git-send-email-qianggui.song@amlogic.com/

Qianggui Song (3):
  pinctrl: add compatible for Amlogic Meson A1 pin controller
  pinctrl: meson-a1: add pinctrl driver for Meson A1 Soc
  arm64: dts: meson: a1: add pinctrl controller support

 .../devicetree/bindings/pinctrl/meson,pinctrl.txt  |   1 +
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  18 +
 drivers/pinctrl/meson/Kconfig                      |   6 +
 drivers/pinctrl/meson/Makefile                     |   1 +
 drivers/pinctrl/meson/pinctrl-meson-a1.c           | 942 +++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson.c              |  16 +-
 drivers/pinctrl/meson/pinctrl-meson.h              |   5 +
 include/dt-bindings/gpio/meson-a1-gpio.h           |  73 ++
 8 files changed, 1061 insertions(+), 1 deletion(-)
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson-a1.c
 create mode 100644 include/dt-bindings/gpio/meson-a1-gpio.h

-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
