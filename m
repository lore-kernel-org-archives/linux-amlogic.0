Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F45C43334
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Jul 2022 06:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I6q/BocDu4rVKNiRu2PemAk5eBayTm1N89EWtq02U64=; b=D3rm+UuBbFCsNS
	UIaVmqTEmEFTZzW7tz1nvWlRcAu8RPEYmArVk46hji2cutTEKvJZkShSuplwpg4UOAcsK4OYutpm1
	6CBmW81NDeTfbYF++wycAcUQAeSo1qYdQsCygBohWZ+Q+qB8shyIbyF/bvtjlxLDfRxeiVYJqjV7O
	IuaX9OsRHia/KyMw3sTvGN7C1cgBixrXjI4gHdntIdicdOb34T9LaqRfF0N74nwOVeCvJjnPkHe8z
	/fBXPpdNcvlS7yykZW1MijRIdQk5kEL0v2OfJHU60rEQP/ZdP2ka+p33z/opGrKIis3SbEK0TJ4Wq
	zETigpnHdqPbhhS8kiMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9hUf-0021wC-2I; Fri, 08 Jul 2022 06:29:37 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9hUU-0021sO-NU; Fri, 08 Jul 2022 06:29:27 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Fri, 8 Jul 2022
 14:29:16 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Neil
 Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH 0/3] Add S4 SoC clock controller driver
Date: Fri, 8 Jul 2022 14:27:54 +0800
Message-ID: <20220708062757.3662-1-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_232926_799604_97DE095F 
X-CRM114-Status: UNSURE (   6.78  )
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

1. Add clock controller driver for S4 SOC.

Yu Tu (3):
  dt-bindings: clk: meson: add S4 SoC clock controller bindings
  arm64: dts: meson: add S4 Soc clock controller in DT
  clk: meson: s4: add s4 SoC clock controller driver

 .../bindings/clock/amlogic,gxbb-clkc.txt      |    1 +
 MAINTAINERS                                   |    3 +-
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi     |    9 +-
 drivers/clk/meson/Kconfig                     |   17 +
 drivers/clk/meson/Makefile                    |    1 +
 drivers/clk/meson/s4.c                        | 4678 +++++++++++++++++
 drivers/clk/meson/s4.h                        |  156 +
 include/dt-bindings/clock/s4-clkc.h           |  354 ++
 8 files changed, 5217 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/meson/s4.c
 create mode 100644 drivers/clk/meson/s4.h
 create mode 100644 include/dt-bindings/clock/s4-clkc.h


base-commit: 292dcfc1f60eee7d389d0184df4ef27be8b55077
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
