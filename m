Return-Path: <SRS0=EzQI=3J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1BAEC33CAF
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jan 2020 02:59:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DBA220684
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jan 2020 02:59:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BXrO7Fi9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DBA220684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=deIVYA9Y4aPgjuOLm6ZrR9G8v5M4m8UCq9wHAEH16NE=; b=BXrO7Fi9jp+jvW
	vDQ1TcH0qHiOfi7InI7ZJMe1UuVWephScyvuI9IjZBXYO64KdIsWlTgD894cZaN+O7yEoeX5iB04k
	YfK+zevFQ/RDxSirxRtqvNXlDuvycczKOpwRYX/nHFIbY/2DiXaaa7MGFWjQZOteld6W5MoSohDTa
	s1rjzM+Y5ODo99kjpbkmGw1J94LoODYBFp5gr824Y/U+KVTrzMatkL7YvDS33f7F75hmWx7hx27w5
	nrGV8Z/GDa8c1DCC34JXPrhpdCnEwCZLAobFKnFQ6/i2nkZSaeWboEnPWm0lu8DEoe10z/2TswBoU
	7sEee8CENuHQIoUPMrhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itNH5-0004uV-O7; Mon, 20 Jan 2020 02:58:47 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itNGr-0004iD-LU; Mon, 20 Jan 2020 02:58:35 +0000
Received: from droid10.amlogic.com (10.18.11.213) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.1591.10; Mon, 20 Jan 2020
 10:58:55 +0800
From: Hanjie Lin <hanjie.lin@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v7 0/5] arm64: meson: Add support for USB on Amlogic A1
Date: Mon, 20 Jan 2020 10:58:01 +0800
Message-ID: <1579489086-157767-1-git-send-email-hanjie.lin@amlogic.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.18.11.213]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200119_185833_701209_AC5C86A8 
X-CRM114-Status: UNSURE (   8.25  )
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-usb@vger.kernel.org, Yue Wang <yue.wang@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liang Yang <liang.yang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>,
 Xingyu Chen <xingyu.chen@amlogic.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jian Hu <jian.hu@amlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds support for USB on Amlogic A1 SoCs.

This patchset is composed with :
- bindings of the PHY
- bindings of the USB Control Glue
- PHY Driver
- USB Control Glue driver
- dts of the PHY
- dts of the USB Controller

The Amlogic A1 USB Complex is composed of :
- 1 DWC3 USB controller for USB2 Host functionality
- 1 USB2 PHY for USB2 Host functionality

The USB Control Glue setups the clocks and the reset about DWC3 USB
controller, and binds to the USB2 PHY. It also configures the 8bit
UTMI interfaces for the USB2 PHY, including setting USB2 phy mode.

The USB2 PHY driver initializes the phy analog settings, phy PLL 
setup and phy tuning.

This patchset is based on A1 clock/power domain/reset series at [0].

Changes since v1:[1]
 - integrate glue and phy drivers into g12a's
 
Changes since v2:[2]
 - modify amlogic,meson-g12a-usb-ctrl.yaml with dt_binding_check tool
 - phy/glue driver use of_device_get_match_data to distinguish A1 from G12A

Changes since v3:[3]
 - fix bindings mistakes of the PHY according Rob's comments
 - fix bindings mistakes of the USB Control Glue according Rob's comments
 - phy driver add xtal_usb_phy clock which moved from glue driver
 - glue driver use otg_mode instead of soc_id to support otg function

Changes since v4:[4]
 - phy driver revert reset-names changes
 - phy driver change clock name to "xtal" to consistent with g12a
 - glue driver add drvdata otg_switch_supported

Changes since v5:[5]
 - integrate phy bindings into g12a
 - modify glue bindings format according to martin's advices
 - glue driver add dwc3_meson_g12a_otg_init() do otg related work
 - glue driver add clk_bulk_disable_unprepare() in remove

Changes since v6:[6]
 - fix glue bindings dt_check_bindings error.
 - squash phy and glue dts patches and set usb status to disabled default
 
[0]
https://patchwork.kernel.org/project/linux-amlogic/list/?series=185477
https://patchwork.kernel.org/project/linux-amlogic/list/?series=180055
https://patchwork.kernel.org/project/linux-amlogic/list/?series=189643

[1] : https://lore.kernel.org/linux-amlogic/1574405757-76184-1-git-send-email-hanjie.lin@amlogic.com

[2] : https://lore.kernel.org/linux-amlogic/1576636944-196192-1-git-send-email-hanjie.lin@amlogic.com

[3] : https://lore.kernel.org/linux-amlogic/1577428606-69855-1-git-send-email-hanjie.lin@amlogic.com

[4] : https://lore.kernel.org/linux-amlogic/1578537045-23260-1-git-send-email-hanjie.lin@amlogic.com

[5] : https://lore.kernel.org/linux-amlogic/1578634957-54826-1-git-send-email-hanjie.lin@amlogic.com

[6] : https://lore.kernel.org/linux-amlogic/1579220504-110067-1-git-send-email-hanjie.lin@amlogic.com

Hanjie Lin (5):
  dt-bindings: phy: Add Amlogic A1 USB2 PHY Bindings
  dt-bindings: usb: dwc3: Add the Amlogic A1 Family DWC3 Glue Bindings
  phy: amlogic: Add Amlogic A1 USB2 PHY Driver
  usb: dwc3: Add Amlogic A1 DWC3 glue
  arm64: dts: meson: a1: Enable USB2 PHY and DWC3 controller

 .../bindings/phy/amlogic,meson-g12a-usb2-phy.yaml  |  15 ++
 .../bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml  |  23 +++
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  43 ++++++
 drivers/phy/amlogic/phy-meson-g12a-usb2.c          |  85 ++++++----
 drivers/usb/dwc3/dwc3-meson-g12a.c                 | 172 ++++++++++++++-------
 5 files changed, 256 insertions(+), 82 deletions(-)

-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
