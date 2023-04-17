Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DD7C77B70
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Apr 2023 06:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HeAgcUFJwjoYtKqoj3TrA99ZafwXzVY3QtQjaPPXMKA=; b=mTu4ni6qv1BF9m
	9r33vHF/F5fYtOwdS4s9rgmso7HoR5XjKJ+dOfaWsLvcf+KNVjl6HnM53++gSarG5YynK2FxPKC95
	wozf6l5bXXbeJxujdVJXsoHCrl+Hdjbft5rvjQcWo3CaIqy0SOcdnJ8Q5SXPwIlUy+wxJJwveilGT
	RbMFBmiyb0ExyGo+WBRKusPDagZdT1rt6blwynmQ54F/I7NtR9jHxBXXk6dGEj9B4fbVXuhjdWwMT
	/nNVaBKPuDBBYHHcmUqeWU20gYBxK2OOQdfpn0FtHbMpneXpxw/7Shtd5MMwRIn7UoiCyk7sgWLA8
	Ywkuy93rGITayNR1SeXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poIhb-00F5Hi-2I;
	Mon, 17 Apr 2023 06:51:03 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poIhX-00F5Ft-07;
	Mon, 17 Apr 2023 06:51:00 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Mon, 17 Apr 2023
 14:52:00 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: <kelvin.zhang@amlogic.com>, <qi.duan@amlogic.com>, Yu Tu
	<yu.tu@amlogic.com>
Subject: [PATCH V7 0/4] Add S4 SoC PLL and Peripheral clock controller
Date: Mon, 17 Apr 2023 14:50:01 +0800
Message-ID: <20230417065005.24967-1-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_235059_340447_0EBFEF44 
X-CRM114-Status: UNSURE (   6.84  )
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

1. Add S4 SoC PLL and Peripheral clock controller dt-bindings.
2. Add PLL and Peripheral clock controller driver for S4 SOC.

Yu Tu (4):
  dt-bindings: clock: document Amlogic S4 SoC PLL clock controller
  dt-bindings: clock: document Amlogic S4 SoC peripherals clock
    controller
  clk: meson: S4: add support for Amlogic S4 SoC PLL clock driver
  clk: meson: s4: add support for Amlogic S4 SoC peripheral clock
    controller

V6 -> V7: Change send patch series as well change format and clock flags
suggested by Jerome. Change dt-bindings suggested by Krzysztof.
V5 -> V6: Change send patch series, as well change format and clock flags.
V4 -> V5: change format and clock flags and adjust the patch series
as suggested by Jerome.
V3 -> V4: change format and clock flags.
V2 -> V3: Use two clock controller.
V1 -> V2: Change format as discussed in the email.

Link:https://lore.kernel.org/all/20230116074214.2326-1-yu.tu@amlogic.com/

 .../clock/amlogic,s4-peripherals-clkc.yaml    |   97 +
 .../bindings/clock/amlogic,s4-pll-clkc.yaml   |   50 +
 MAINTAINERS                                   |    1 +
 drivers/clk/meson/Kconfig                     |   25 +
 drivers/clk/meson/Makefile                    |    2 +
 drivers/clk/meson/s4-peripherals.c            | 3814 +++++++++++++++++
 drivers/clk/meson/s4-peripherals.h            |  217 +
 drivers/clk/meson/s4-pll.c                    |  902 ++++
 drivers/clk/meson/s4-pll.h                    |   87 +
 .../clock/amlogic,s4-peripherals-clkc.h       |  131 +
 .../dt-bindings/clock/amlogic,s4-pll-clkc.h   |   30 +
 11 files changed, 5356 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
 create mode 100644 drivers/clk/meson/s4-peripherals.c
 create mode 100644 drivers/clk/meson/s4-peripherals.h
 create mode 100644 drivers/clk/meson/s4-pll.c
 create mode 100644 drivers/clk/meson/s4-pll.h
 create mode 100644 include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,s4-pll-clkc.h


base-commit: 5883d6b83cb0c84c8bc86bd1ff937ea313eb7325
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
