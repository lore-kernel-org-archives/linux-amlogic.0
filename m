Return-Path: <SRS0=t54K=26=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8513DC33C9E
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2020 02:31:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3721120705
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2020 02:31:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ITCYiMkW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3721120705
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uRhfx5/c+QuUyPlvzEORFpVqrjKwPLnV3bu4fuR0UKE=; b=ITCYiMkWcA6IHA
	kd/4GbrgwDt/B2vcohKH9bQ+iGDWonsqpd+JgwejnkzBxwyk0F2aIyHfH1+oeShCjtNrZfIt01WEB
	oYJhF4v65K0mAILMDwYAOJSM+WqLuAFu8rHajaaKsTgFP3K7I6cYc4WrAKUyORCArl7Z+XuvuvkQ/
	wGDgEMzsBo4ElIwyq+xShDIA08nuiQICRZX5LQRYk6UTeGJs32ixRUcgWy3UoLb+uuaZjk0RI9st6
	C9h8DHuQAcBTboZ5tosEr7CiVNkWSJ9BWsrDsE4h169Z4UbTa1hadC17yuw0ImicK1MVzYVWnvsDa
	7c8WrlhBRZ3SucJ8QuRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipNbW-0002Yg-Oh; Thu, 09 Jan 2020 02:31:22 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipNbE-0002JO-RR; Thu, 09 Jan 2020 02:31:06 +0000
Received: from droid10.amlogic.com (10.18.11.213) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.1591.10; Thu, 9 Jan 2020
 10:31:20 +0800
From: Hanjie Lin <hanjie.lin@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v4 0/6] arm64: meson: Add support for USB on Amlogic A1
Date: Thu, 9 Jan 2020 10:30:39 +0800
Message-ID: <1578537045-23260-1-git-send-email-hanjie.lin@amlogic.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.18.11.213]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_183104_890165_4CDE841C 
X-CRM114-Status: UNSURE (   7.77  )
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

[0]
https://patchwork.kernel.org/project/linux-amlogic/list/?series=185477
https://patchwork.kernel.org/project/linux-amlogic/list/?series=180055
https://patchwork.kernel.org/project/linux-amlogic/list/?series=189643

[1] : https://lore.kernel.org/linux-amlogic/1574405757-76184-1-git-send-email-hanjie.lin@amlogic.com

[2] : https://lore.kernel.org/linux-amlogic/1576636944-196192-1-git-send-email-hanjie.lin@amlogic.com

[3] : https://lore.kernel.org/linux-amlogic/1577428606-69855-1-git-send-email-hanjie.lin@amlogic.com

Hanjie Lin (6):
  dt-bindings: phy: Add Amlogic A1 USB2 PHY Bindings
  dt-bindings: usb: dwc3: Add the Amlogic A1 Family DWC3 Glue Bindings
  phy: amlogic: Add Amlogic A1 USB2 PHY Driver
  usb: dwc3: Add Amlogic A1 DWC3 glue
  arm64: dts: meson: a1: Enable USB2 PHY
  arm64: dts: meson: a1: Enable DWC3 controller

 .../bindings/phy/amlogic,meson-a1-usb2-phy.yaml    | 56 ++++++++++++
 .../bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml  | 11 +++
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi          | 43 ++++++++++
 drivers/phy/amlogic/phy-meson-g12a-usb2.c          | 99 +++++++++++++++-------
 drivers/usb/dwc3/dwc3-meson-g12a.c                 | 99 ++++++++++++++++------
 5 files changed, 250 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml

-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
