Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074CEC433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jan 2022 07:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LrBcnLDp7wKblwuHxMj4x43o3+IPl8T60x2XLBf09gs=; b=jf1yxBEWk7NDBJ
	nJSXFY9bvaw+dAyhJ9z71RHbxRIt6iXMfIz9DGbKjbjsRjzu97d5d+NZ12R1tYOf86XwJ4BlJG3tL
	xDCQh9zS4tRAsyvMyYz1Ng+PWrnayLyzO+fckGLnzxQW1zgyVS6OYL3eZIrYpgTNL+s/ysvLWcpSj
	qw2meDyxnWFMKk13iQ3Wd1bGVMF/VE8mjgxzs0dmagv/W6cMTy0TZjQ55P90TDUyGgJicp4bXkGjp
	PBGjbbuYmpYUZrzs5wNtpFN8uryz6IGw1uFd5pQ+kvt0ZI4S4XsI0kZ3C/y91eH78IROnfPsc3SPf
	oxAOvTOG9EoGv6U1Qf4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA556-0044gd-Gv; Wed, 19 Jan 2022 07:08:32 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA54q-0044ZD-QJ; Wed, 19 Jan 2022 07:08:18 +0000
Received: from droid09-sz.software.amlogic (10.28.8.19) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2;
 Wed, 19 Jan 2022 15:08:12 +0800
From: Qianggui Song <qianggui.song@amlogic.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
CC: Qianggui Song <qianggui.song@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 0/4] irqchip/meson-gpio: Add support for Meson-S4 SoC
Date: Wed, 19 Jan 2022 15:08:05 +0800
Message-ID: <20220119070809.15563-1-qianggui.song@amlogic.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.28.8.19]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_230816_880137_CD5F3511 
X-CRM114-Status: UNSURE (   6.67  )
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

Changes since v1 at [0]:
- fix leaking issue
- fix some typos
- change implementation of new feature.

[0] https://lore.kernel.org/linux-amlogic/20220108084218.31877-1-qianggui.song@amlogic.com/

Qianggui Song (4):
  dt-bindings: interrupt-controller: New binding for Meson-S4 SoCs
  irqchip/meson-gpio: support more than 8 channels gpio irq line
  irqchip/meson-gpio: add select trigger type callback
  irqchip/meson-gpio: Add support for meson s4 SoCs

 .../amlogic,meson-gpio-intc.txt               |   1 +
 drivers/irqchip/irq-meson-gpio.c              | 105 ++++++++++++++++--
 2 files changed, 97 insertions(+), 9 deletions(-)

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
