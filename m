Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FF7E99069
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Apr 2026 10:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1hGSDi/aBqxFpwg1UV2LzPjNm6pLbIU2oQnVOPyG+jk=; b=K5XgveD0MXl0ua
	WNG+UmtS4cgszkeaORGWIeWDYtmLgb6l7c7te93iU/AfrLqNUOjdaLNFC2/EpPADdutrwc2Iouit3
	zwvt9LYh70RkpdgNSgmzoyqwDRB1LffeKfUzvITwZ0ITR8gXoAWade7jhRM7QRDv/TZ2efZDZPeCG
	V3mhFRyfM4C2QOtgv4fNnYnx5kSFgMdn+DmwTu4wXdQvNk+kgr9Xgg8s5VuhKJoE8sEjTGhEDO9Go
	9eMDW4jAtyefcr6/6p15zZsYCNAbjMudGETo7A7/VCwvH4BeP+XMnbQzZuRPgFhME6FmMhSqssMKF
	yii+ugPCO5JysoPG/3ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8iJ-0000000By8d-49uA;
	Fri, 10 Apr 2026 10:03:48 +0000
Received: from [64.106.246.77] (helo=mail-sc.amlogic.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8iI-0000000By81-0Zzg;
	Fri, 10 Apr 2026 10:03:47 +0000
Received: from rd03-sz.software.amlogic (10.28.11.121) by mailsc.amlogic.com
 (10.8.11.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 10 Apr
 2026 03:02:38 -0700
From: Jian Hu <jian.hu@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, "Michael
 Turquette" <mturquette@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, robh+dt <robh+dt@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
CC: Jian Hu <jian.hu@amlogic.com>, devicetree <devicetree@vger.kernel.org>,
	linux-amlogic <linux-amlogic@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 0/4] soc: amlogic: clk-measure: add A1 and T7 support
Date: Fri, 10 Apr 2026 18:03:25 +0800
Message-ID: <20260410100329.3167482-1-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Originating-IP: [10.28.11.121]
X-ClientProxiedBy: mailsh.amlogic.com (10.18.11.5) To mailsc.amlogic.com
 (10.8.11.35)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_030346_177711_4AE680CF 
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

This series adds Amlogic clock measurement support for A1 and T7 SoCs,
including binding updates, driver additions, and device tree enablement.

Jian Hu (4):
  dt-bindings: soc: amlogic: clk-measure: Add A1 and T7 compatible
  soc: amlogic: clk-measure: Add A1 and T7 support
  arm64: dts: meson: a1: Add clk measure support
  arm64: dts: amlogic: t7: Add clk measure support

 .../amlogic/amlogic,meson-gx-clk-measure.yaml |   2 +
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   |   5 +
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |   5 +
 drivers/soc/amlogic/meson-clk-measure.c       | 272 ++++++++++++++++++
 4 files changed, 284 insertions(+)

-- 
2.47.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
