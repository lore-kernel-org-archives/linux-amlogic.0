Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033F1C433F5
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jan 2022 08:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5dqVboost120MPSu4QHpU1QVoRftWjdlTfxesi/RnnI=; b=a+B1rxhx+gOo64
	bbF7DK+H31iqVMifrT3eCP3qfYoYgFB+p5QsgrIQ0sejnqBGYfUyxeH4WoA3XypNfFFo90SRFl9fz
	61TTMuLXso9o7xAUfB1anb1CU+gXfyh8cBxdiI063Q7arKayymUBFFzkkgjFnRuOU1tP+EVvvmifZ
	d3WRlgTMt16oXnq3N8UlXuDYOP00jyHXL31+MbY+wJZY95+b9fkz6AA2IpWz8xs7kfL66w9gO5uPs
	ZQYBm7NEMUg4LtE3Fixxuq/xolqvHR1z5zb91vXLDmwcI2AKBTPryNg7SuYFJnH01hHB7dDk8t5BA
	nH5YFZPRR4YnhJ1Naugg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n67J8-0068gZ-HI; Sat, 08 Jan 2022 08:42:38 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n67Iv-0068c3-9u; Sat, 08 Jan 2022 08:42:26 +0000
Received: from droid09-sz.software.amlogic (10.28.8.19) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2;
 Sat, 8 Jan 2022 16:42:20 +0800
From: Qianggui Song <qianggui.song@amlogic.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
CC: Qianggui Song <qianggui.song@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 0/4] irqchip/meson-gpio: Add support for Meson-S4 SoC
Date: Sat, 8 Jan 2022 16:42:14 +0800
Message-ID: <20220108084218.31877-1-qianggui.song@amlogic.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.28.8.19]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220108_004225_383393_E9A73434 
X-CRM114-Status: UNSURE (   5.60  )
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
Which has somethings different with current other meson chips. To
support the new chips, current gpio irqchip driver need to rework as
below:
1. support more than 8 gpio irq line.
2. add a set trigger type callback function.

With above work, add support for S4 gpio irqchip

Qianggui Song (4):
  dt-bindings: interrupt-controller: New binding for Meson-S4 SoCs
  irqchip/meson-gpio: support more than 8 channels gpio irq line
  irqchip/meson-gpio: add select trigger type callback
  irqchip/meson-gpio: Add support for meson s4 SoCs

 .../amlogic,meson-gpio-intc.txt               |  1 +
 drivers/irqchip/irq-meson-gpio.c              | 97 ++++++++++++++++---
 2 files changed, 86 insertions(+), 12 deletions(-)

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
