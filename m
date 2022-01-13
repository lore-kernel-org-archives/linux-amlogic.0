Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6D5C433FE
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jan 2022 11:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pHW0bpK1x2aoI77MfMewmReTk/8KIOIL/z0LoMBiLJ4=; b=umM7Bxx5LBWp04
	VEVMHe8yA+22AqjyjGD42PrZQ28WighWWJnTtF1/J84r3/GcYHpL2z6K/RBAzvGDIUbqQx7532gCw
	glrDQwCLU4NVgfqrLopvexaa+P1YFYE7kq+sZT8EdGK/LrVOOzjum3sK5sJjpceY7y9zbrujJNoOb
	EkjtVPDKayc9Dex/U+jES1B9mRfWhVkqThVADpQYzTxVcC4naRPyurq0lAOYZB29PrfjgoY/nWdnL
	X625D8pbTp0b7nL87dVC3jecKjXFszONbflLP87ywSbLsjx75vQR3c2WWGM1OLN2m4Om+qZ+eSBND
	AWKti5H7sTx7kqKyy/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7yjx-005hLO-8k; Thu, 13 Jan 2022 11:58:01 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7yjt-005hIN-Te; Thu, 13 Jan 2022 11:57:59 +0000
Received: from droid11-sz.amlogic.com (10.28.8.21) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2; Thu, 13 Jan 2022
 19:57:51 +0800
From: Liang Yang <liang.yang@amlogic.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, <linux-clk@vger.kernel.org>
CC: Liang Yang <liang.yang@amlogic.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, XianWei Zhao <xianwei.zhao@amlogic.com>, 
 Kelvin Zhang <kelvin.zhang@amlogic.com>, BiChao Zheng
 <bichao.zheng@amlogic.com>, YongHui Yu <yonghui.yu@amlogic.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v9 0/4] clk: meson: add a sub EMMC clock controller support
Date: Thu, 13 Jan 2022 19:57:41 +0800
Message-ID: <20220113115745.45826-1-liang.yang@amlogic.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.28.8.21]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_035758_217307_892B309A 
X-CRM114-Status: GOOD (  12.18  )
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

Changes since v8 [9]
 - use MESON_SCLK_ONE_BASED instead of CLK_DIVIDER_ONE_BASED
 - use struct_size to caculate onecell_data
 - add clk-phase-delay.h
 - define CLK_DELAY_STEP_PS_GX and CLK_DELAY_STEP_PS_AXG

Changes since v7 [8]
 - move meson_clk_get_phase_delay_data() from header to driver
 - CONFIG sclk-div with COMMON_CLK_AMLOGIC instead of COMMON_CLK_AMLOGIC_AUDIO
 - remove onecell date and ID for internal MUX clk
 - use helper for functions for ONE_BASED in sclk-div
 - add ONE_BASED support for duty cycle

Changes since v6 [7]:
 - add one based support for sclk divier
 - alloc sclk in probe for multiple instance
 - fix coding styles

Changes since v5 [6]:
 - remove divider ops with .init and use sclk_div instead
 - drop CLK_DIVIDER_ROUND_CLOSEST in mux and div
 - drop the useless type cast 

Changes since v4 [5]:
 - use struct parm in phase delay driver
 - remove 0 delay releted part in phase delay driver
 - don't rebuild the parent name once again
 - add divider ops with .init

Changes since v3 [4]:
 - separate clk-phase-delay driver
 - replace clk_get_rate() with clk_hw_get_rate()
 - collect Rob's R-Y
 - drop 'meson-' prefix from compatible string

 Changes since v2 [3]:
 - squash dt-binding clock-id patch
 - update license
 - fix alignment
 - construct a clk register helper() function

Changes since v1 [2]:
 - implement phase clock
 - update compatible name
 - adjust file name
 - divider probe() into small functions, and re-use them

[1] https://lkml.kernel.org/r/20180628090034.0637a062@xps13
[2] https://lkml.kernel.org/r/20180703145716.31860-1-yixun.lan@amlogic.com
[3] https://lkml.kernel.org/r/20180710163658.6175-1-yixun.lan@amlogic.com
[4] https://lkml.kernel.org/r/20180712211244.11428-1-yixun.lan@amlogic.com
[5] https://lkml.kernel.org/r/20180809070724.11935-4-yixun.lan@amlogic.com
[6] https://lkml.kernel.org/r/1539839245-13793-1-git-send-email-jianxin.pan@amlogic.com
[7] https://lkml.kernel.org/r/1541089855-19356-1-git-send-email-jianxin.pan@amlogic.com
[8] https://lkml.kernel.org/r/1544457877-51301-1-git-send-email-jianxin.pan@amlogic.com
[9] https://lkml.kernel.org/r/1545063850-21504-1-git-send-email-jianxin.pan@amlogic.com
Liang Yang (4):
  clk: meson: add one based divider support for sclk
  clk: meson: add emmc sub clock phase delay driver
  clk: meson: add DT documentation for emmc clock controller
  clk: meson: add sub MMC clock controller driver

 .../bindings/clock/amlogic,mmc-clkc.yaml      |  64 ++++
 drivers/clk/meson/Kconfig                     |  18 ++
 drivers/clk/meson/Makefile                    |   2 +
 drivers/clk/meson/clk-phase-delay.c           |  69 ++++
 drivers/clk/meson/clk-phase-delay.h           |  20 ++
 drivers/clk/meson/mmc-clkc.c                  | 300 ++++++++++++++++++
 drivers/clk/meson/sclk-div.c                  |  61 ++--
 drivers/clk/meson/sclk-div.h                  |   3 +
 include/dt-bindings/clock/amlogic,mmc-clkc.h  |  14 +
 9 files changed, 529 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.yaml
 create mode 100644 drivers/clk/meson/clk-phase-delay.c
 create mode 100644 drivers/clk/meson/clk-phase-delay.h
 create mode 100644 drivers/clk/meson/mmc-clkc.c
 create mode 100644 include/dt-bindings/clock/amlogic,mmc-clkc.h

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
