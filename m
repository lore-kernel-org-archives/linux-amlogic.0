Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C695BC48BF8
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Feb 2024 07:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SEdfia7m2iqES/y+We0mVbHUx+JrvFILAFH+N+BKcCo=; b=OL9zFpL0Wp94RA
	pG6Je5GDRQRqd/4YVmEczwpBnTKXauntQElgLueydlvqWxIlDIhusmm+i+q3SgZt/nw2S5Rkw0RwW
	+wGcJfSVoQHeu/wrzvre122wfloqofBaAbt320fnuN/xSQGLzLAUDl4Bvq1hfcJ6NKFNoR0bLqOim
	AC8QerOQ2uSMPOjHd3kHS43a27nfUNacOPHCGXigKMhFJA8pHBhzisckcZcmhrBcvT4fI7sSDzV76
	sVx4+TxdSbXTlOJLPDOZihwi0S9Myw3NAxLu7SBcwPOVokIIVyn6N44hLOOVFFzA9ewZ+FLkhUdeN
	+LgrzptdFqUFc0YaItQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd3no-00000003rwR-35Gq;
	Thu, 22 Feb 2024 07:47:32 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd3nk-00000003rrj-2fg8;
	Thu, 22 Feb 2024 07:47:29 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.6; Thu, 22 Feb 2024
 15:47:16 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <tglx@linutronix.de>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <hkallweit1@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [RESEND PATCH 0/3] Add GPIO interrupt support for Amlogic-T7 SoCs
Date: Thu, 22 Feb 2024 15:46:36 +0800
Message-ID: <20240222074640.1866284-1-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_234728_706917_AA0338DA 
X-CRM114-Status: UNSURE (   5.37  )
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

-- 
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
