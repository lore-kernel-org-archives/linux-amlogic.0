Return-Path: <SRS0=jD7o=Z4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B98FCC2BD09
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Dec 2019 12:17:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9046924659
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Dec 2019 12:17:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nw73KOGq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9046924659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2FGziHHvDVP0m0ZWkm6j5nQ6IFN+ofkkl+P3WMdpSKc=; b=nw73KOGqPCtQr5
	oxcfaw1cg3XEZJ2YOCjpdytWR8jYK0lC1lXy9bzTvpc1KererBauXIgW+WWNZvU0r983gvRRJg98i
	9EuWjJE055EYj7vGatimPxtCHzNn8rvaAltvhUdiRzzmSFsmWwgXpgvWZJwkUGZlg51U/8pGE0mpB
	S0Vx2KjA+gvP+Xb8woas82KFU56UE9f6sMPP4FnUivF3befmitm6mUX8YL962Qqj2uejhVV86hhHi
	AgaqwjnjRF+4BEVZVfgA0Zv2vBV39T/cdESykPo/GftKE3mn8FUuwDmkAomBAzTfQPfZ6rg2lH6md
	dijOQuHKm/8yxnni6Edw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1idCYA-0007sn-M7; Fri, 06 Dec 2019 12:17:34 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idCXz-0007h2-B8; Fri, 06 Dec 2019 12:17:24 +0000
Received: from localhost.localdomain (10.28.8.19) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Fri, 6 Dec 2019
 20:17:50 +0800
From: Qianggui Song <qianggui.song@amlogic.com>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, 
 Marc Zyngier <maz@kernel.org>
Subject: [PATCH 0/4] irqchip/meson-gpio: Add support for Meson-A1 SoC
Date: Fri, 6 Dec 2019 20:17:09 +0800
Message-ID: <20191206121714.14579-1-qianggui.song@amlogic.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Originating-IP: [10.28.8.19]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191206_041723_381784_A727A8D3 
X-CRM114-Status: UNSURE (   6.11  )
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
Cc: Qianggui Song <qianggui.song@amlogic.com>, devicetree@vger.kernel.org,
 Hanjie Lin <hanjie.lin@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset add support for GPIO interrupt controller of Meson-A1 SoC
which use new reigster layout, two main things are done in the patchset
1. rework current driver
2. add a1 support

Qianggui Song (4):
  dt-bindings: interrupt-controller: New binding for Meson-A1 SoCs
  irqchip/meson-gpio: rework meson irqchip driver to support meson-A1
    SoCs
  irqchip/meson-gpio: Add support for meson a1 SoCs
  arm64: dts: meson: a1: add gpio interrupt controller support

 .../amlogic,meson-gpio-intc.txt               |   1 +
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |   9 ++
 drivers/irqchip/irq-meson-gpio.c              | 126 +++++++++++++++---
 3 files changed, 117 insertions(+), 19 deletions(-)

-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
