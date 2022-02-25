Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9941C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Feb 2022 05:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aaDlIMoSoBFthvQqnwhLcyYmD0FKKuS1HfHmzVv2UQk=; b=ddCRv0lgb407NT
	D3ofG3VdYpYEblTeBLxCfr/LEfxOM1CQb6gn5QHN+38qkVu3WQ0xSYpbFwYHopE574TcxtF8LhQ3M
	anuUmW+kpILsoIX6Se3ziY9u6LF0LVle06T1Jpua+hFY25P1SEL92X76Uimy5tiLct4vqzgRnMDrq
	j7fFWWp7mzWh6vB8wpF2OJ0nJ6FdxI0QPv2TPxcyh9l0VK6xomQb9TtWCdZdiSDhuI24eOA6yWsr9
	otY+Axkt/ABihNZw6K3wC02KPDhzRokiEaLAzMvJIcVed029PyRhJHCFplut5aZwvdkmwCF1sIqgT
	x+XXkxDFwvPtvYMrF/FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNTWk-003NHp-BF; Fri, 25 Feb 2022 05:52:26 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNTWX-003NFj-N7; Fri, 25 Feb 2022 05:52:15 +0000
Received: from droid09-sz.software.amlogic (10.28.8.19) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2;
 Fri, 25 Feb 2022 13:52:08 +0800
From: Qianggui Song <qianggui.song@amlogic.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
CC: Qianggui Song <qianggui.song@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 0/4] irqchip/meson-gpio: Add support for Meson-S4 SoC
Date: Fri, 25 Feb 2022 13:52:02 +0800
Message-ID: <20220225055207.1048-1-qianggui.song@amlogic.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.28.8.19]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_215213_797884_A74AE663 
X-CRM114-Status: UNSURE (   6.36  )
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

This patchset add support for GPIO interrupt controller of Meson-S4 SoC
Which has something different with current other meson chips. To
support the new chips, current gpio irqchip driver need to rework as
below:
1. support more than 8 gpio irq lines.
2. add a set trigger type callback function.

With above work, add support for S4 gpio irqchip

Changes since v2 at [1]:
- rework nr channels allocations
- move old controller set_type to a callback

Changes since v1 at [0]:
- fix leaking issue
- fix some typos
- change implementation of new feature.

[0] https://lore.kernel.org/linux-amlogic/20220108084218.31877-1-qianggui.song@amlogic.com/
[1] https://lore.kernel.org/linux-amlogic/20220119070809.15563-1-qianggui.song@amlogic.com/

Qianggui Song (4):
  dt-bindings: interrupt-controller: New binding for Meson-S4 SoCs
  irqchip/meson-gpio: support more than 8 channels gpio irq
  irqchip/meson-gpio: add select trigger type callback
  irqchip/meson-gpio: Add support for meson s4 SoCs

 .../amlogic,meson-gpio-intc.txt               |   1 +
 drivers/irqchip/irq-meson-gpio.c              | 108 +++++++++++++++---
 2 files changed, 93 insertions(+), 16 deletions(-)

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
