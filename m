Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BE7CA5506
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Sep 2023 08:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pqkFwAqP6+HvJMPGBddFpmXbSU54OUQOpJXBx6I9UWc=; b=K6NZJPhUAy92kQ
	zlJQS+rn20a7rS10V3QRo1X8j4dP0QNvrDUljs/ttAkF5bm2eTKu65NIik6qpooUNPE9zngIN7WfL
	9xY8HucV71Dj7PDfOkZ0+62MrQNqcE8OK70IY/ZoIvzc+t/vT2z3qgVU+++H7GPTLWw2OU8EUC+0u
	IsOVn9ApBYeeF4qyEjDVj9lW0EpUv1ejOethkDDqGjnjtwiMSWfXtCLeatx3gFeJuvbFGkqD4uLlQ
	3QbX0smeZii84dbPYQP8sX+X8O0OPC1Rm0EtLQVADNOXPnKqmBE1oWu0QRxKCOAnuLQaX3JYMpkOT
	WSIkvxDoz9CphhxNK4Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgKwr-0052dM-0D;
	Wed, 13 Sep 2023 08:10:09 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgKwn-0052b1-2M;
	Wed, 13 Sep 2023 08:10:06 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Wed, 13 Sep 2023
 16:09:45 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <tglx@linutronix.de>, <maz@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <hkallweit1@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH 0/3] Add GPIO interrupt support for Amlogic-T7 SoCs
Date: Wed, 13 Sep 2023 16:09:21 +0800
Message-ID: <20230913080924.3336391-1-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_011005_771476_2C9B43E0 
X-CRM114-Status: UNSURE (   5.54  )
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

This patch adds GPIO interrupt support for Amloigc-T7 SoC (A311D2)

Huqiang Qin (3):
  dt-bindings: interrupt-controller: Add support for Amlogic-T7 SoCs
  irqchip: Add support for Amlogic-T7 SoCs
  arm64: dts: Add gpio_intc node for Amlogic-T7 SoCs

 .../interrupt-controller/amlogic,meson-gpio-intc.yaml  |  1 +
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi            | 10 ++++++++++
 drivers/irqchip/irq-meson-gpio.c                       |  5 +++++
 3 files changed, 16 insertions(+)


base-commit: e143016b56ecb0fcda5bb6026b0a25fe55274f56
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
