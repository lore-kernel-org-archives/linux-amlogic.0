Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884F6EB64D7
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Jun 2023 09:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/27RiosgZwPhvFapp2fBx4ARUljDPfvTHoAfNR9zP7g=; b=cgNHVZavYd2Q/F
	/GpDfNM1v3Y2Ecds1pwOvFJRZzjymHR8m2ISU7nOxNGJqfxAHoIDx7n/XH16NVmrqrQ3lU642YW3E
	r6VEy8ebxPJoruaI+JFYObu3YZuWG09in0N8k4scn7oPyMaObIJjzicsW43KEFq5GBtZk8EiVuUyK
	a6fY/0p93tCI8QFB3OBX+If39pXChpmzA9O2dQDPYTNl7LsdqMJtx3qtKxTSKFOMmhDR6mpq7hTzd
	SG+qeyqqXStj+gb4FsL8vhVA8RSBUpJOpehhMaVq+Dio1+iKV9UYblb6qNLxIHzbi+mfudx5t+MZ9
	draoqSxHCDkH9W40OyiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qERHq-00FE42-0V;
	Wed, 28 Jun 2023 09:16:30 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qERHl-00FE2v-0g;
	Wed, 28 Jun 2023 09:16:28 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Wed, 28 Jun 2023
 17:16:10 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <tglx@linutronix.de>, <maz@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <hkallweit1@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH V2 0/2] Add GPIO interrupt support for Amlogic-C3 SoCs
Date: Wed, 28 Jun 2023 17:15:31 +0800
Message-ID: <20230628091533.3884385-1-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_021627_189754_9D991456 
X-CRM114-Status: UNSURE (   5.64  )
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

This patch adds GPIO interrupt support for Amloigc-C3 SoC (C308L and C302X)

V1 -> V2: Added driver changes

Huqiang Qin (2):
  dt-bindings: interrupt-controller: Add support for Amlogic-C3 SoCs
  irqchip: Add support for Amlogic-C3 SoCs

 .../interrupt-controller/amlogic,meson-gpio-intc.yaml        | 1 +
 drivers/irqchip/irq-meson-gpio.c                             | 5 +++++
 2 files changed, 6 insertions(+)

-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
