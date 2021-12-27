Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E42FC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Dec 2021 08:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QExkkCVsCLQvV4HdpggsnqdxKJoq5W/qwN6GcTuGyVE=; b=N6kV6aj9/RSlEw
	4xTFq47Kjvw1VzdJXWKjijs1RStWVh2CdwoH6ZyM5ASgfsaLbFusoc5vrLDk+PbvONAZ6tLKbDT4u
	dCE6TwFkoX+RUIcCmPZE/TBDGF/vPKqTOM6qc4+FB18f55RL8e+IEvEU6i2ReP1G25C8SMdhREkfO
	1O+EiEz6hIEmHuP6xfVFAzCbGZOiJgg6O+xWgILpyv7TVBUqK8Ezb9rccFi8JfFmZTV94zBhivmiw
	efA/2uyKhoCWlv4ktGvU67z+DswZ10a8aGsIY/XjN7mifgar87DD1gnfB54b5HnLhm2LNj2JQM7BK
	bAkZ7fGWRRwyzmBZvVYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1l2F-00GKlh-20; Mon, 27 Dec 2021 08:07:11 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1l23-00GKiy-5X; Mon, 27 Dec 2021 08:07:00 +0000
Received: from droid09-sz.software.amlogic (10.28.8.19) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2;
 Mon, 27 Dec 2021 16:06:53 +0800
From: Qianggui Song <qianggui.song@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>
CC: Qianggui Song <qianggui.song@amlogic.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v2 0/2] pinctrl: meson-s4: add pinctrl driver
Date: Mon, 27 Dec 2021 16:06:47 +0800
Message-ID: <20211227080649.32275-1-qianggui.song@amlogic.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.28.8.19]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_000659_252191_72BE4219 
X-CRM114-Status: UNSURE (   8.91  )
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

This patchset adds Pin controller driver support for Meson-A1 Soc
which shares the same register layout with previous Meson-S4

Note that since dt-binding header file patch(already get ack) has been removed
from this patch set, compiling need header file in patch 2 of [0].

Changes since v1 at [0]:
- fix typos in commit message
- fix coding style problem in pinctrl-meson-s4.c
- change tdm groups makeup and split mclk groups

[0] https://lore.kernel.org/linux-amlogic/20211214022100.14841-1-qianggui.song@amlogic.com/

Qianggui Song (2):
  dt-bindings: pinctrl: meson: Add compatible for S4
  pinctrl: meson: add pinctrl driver support for Meson-S4 Soc

 .../bindings/pinctrl/meson,pinctrl.txt        |    1 +
 drivers/pinctrl/meson/Kconfig                 |    6 +
 drivers/pinctrl/meson/Makefile                |    1 +
 drivers/pinctrl/meson/pinctrl-meson-s4.c      | 1289 +++++++++++++++++
 4 files changed, 1297 insertions(+)
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson-s4.c

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
