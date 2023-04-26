Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FADAC7618E
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Apr 2023 10:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xToBAXPf72DPZaBENAnuTnDNMvBLnpuZVDa8Uqjk320=; b=B0gZsssfrG7FPw
	TD+V2z3rmez9gbgTs0u2nZi2geKCmOl6molfR+m4mjRFfYq5COq2G1nqjT7Da/jeEqhG2ZMLJkcTo
	cg8aCduo/yqlDSG39hHzzsbhSdVeo52M/iqY+wtXsbGJ5xbc97ZdMLp3O391165kKk2D0pJTbhhr3
	VzIIswBHSDLsfRgqOwAe1szJvxnth9y2X4UATHyQLBbKyzSsHykIYWFLGTL6FC64WVe8vpsbSrtKo
	45EIs+ZAJfonXtC5btbbWxjTgvRACPeN2MUaj+AOG308De5BPnlwRXz1DNZViOzXNv1UsbhkF9FDa
	K7i7UeIiJNTd4c3mBnMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prcPE-003S6C-1v;
	Wed, 26 Apr 2023 10:29:48 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prcP8-003Rxj-2j;
	Wed, 26 Apr 2023 10:29:44 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id A06385FD7A;
	Wed, 26 Apr 2023 13:29:37 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1682504977;
	bh=G2zp6fXp50ZrnxTL45q7kYiCTTf6jCTtGwh/0Q+wtss=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=TuYBmAqFr809pIi+6bVNedFGOtePyBzWRfuu4qWOQbnHjW3reDXL/t3nwejNgv53k
	 FiXNL54F3rxJtviC8KOfwrX/pM5EgqXxiC+uAuNHP6Ra+TsLWDhLZx+6Po6fW4EEtR
	 LqBqIpoBFQKnNtw/w3RRyyMUJH2MM3tjwLFht3fyey2WuV4iiixgYkeQjipdH8dPjT
	 3u3kBl77oMxFJ9WwanIiJ52RtHisH0hDzJP0lNW7vyxv9TYeORcoidVvUdFxRsfJux
	 6VeTgFjrDiEuFNGHwNpU1lxF51TO7DbCdvNDdIDNA8MKg7XMkOqNrLgoTBQNyh9biA
	 YUThncWFN1BCw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 26 Apr 2023 13:29:35 +0300 (MSK)
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <mturquette@baylibre.com>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <hminas@synopsys.com>,
	<Thinh.Nguyen@synopsys.com>
CC: <yue.wang@amlogic.com>, <hanjie.lin@amlogic.com>, <kernel@sberdevices.ru>,
	<rockosov@gmail.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, Dmitry Rokosov <ddrokosov@sberdevices.ru>
Subject: [PATCH v3 0/5] arm64: meson: support Amlogic A1 USB OTG controller
Date: Wed, 26 Apr 2023 13:29:17 +0300
Message-ID: <20230426102922.19705-1-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/26 04:45:00 #21166225
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_032943_256082_2BE33F75 
X-CRM114-Status: GOOD (  12.75  )
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

This patch series introduces full support for the Amlogic A1 USB controller
in OTG mode (peripheral and host modes switching).

Previously, Amlogic's patch series [1] was applied to the upstream tree,
but it only had USB host mode support.
Furthermore, the device tree patchset [2] wasn't merged due to a missing
clk driver.
Patchset [2] has been completely reworked:
    - changed register base offsets to proper values
    - introduced dwc2 in peripheral mode
    - OTG mode support
    - the SoB of Amlogic authors still remain

Testing:
    - USB OTG role switching between gadget and host - OK
    - Peripheral mode - OK (tested with adb shell/push/pop)
    - Host mode - OK (tested only USB enumeration and detection)

Changes v3 since v2 at [4]:
    - if reset_control_reset() fails during phy_exit() callback
      execution, do not disable clkin, instead, return an error
      immediately
    - provide proper 'phy-names' for the dwc2 device tree node as
      'usb2-phy' instead of 'usb2_phy' (replace underscore with dash)

Changes v2 since v1 at [3]:
    - as Martin suggested in v1, this commit completely removes
      the 'otg_switch_supported' parameter from dwc3_meson_g12a_drvdata;
      this parameter is no longer necessary as all IP versions now
      support OTG switching
    - this commit moves the USB PHY clkin enable/disable calls to
      the PHY init/exit routines

Links:
    [1] https://lore.kernel.org/all/1581990859-135234-1-git-send-email-hanjie.lin@amlogic.com/
    [2] https://lore.kernel.org/all/1581990859-135234-4-git-send-email-hanjie.lin@amlogic.com/
    [3] https://lore.kernel.org/all/20230414152423.19842-1-ddrokosov@sberdevices.ru/
    [4] https://lore.kernel.org/all/20230418111612.19479-1-ddrokosov@sberdevices.ru/

Dmitry Rokosov (5):
  phy: amlogic: enable/disable clkin during Amlogic USB PHY init/exit
  usb: dwc2: support dwc2 IP for Amlogic A1 SoC family
  dt-bindings: usb: dwc2: add support for Amlogic A1 SoC USB peripheral
  usb: dwc3-meson-g12a: support OTG switch for all IP versions
  arm64: dts: meson: a1: support USB controller in OTG mode

 .../devicetree/bindings/usb/dwc2.yaml         |  1 +
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi     | 59 +++++++++++++++++++
 drivers/phy/amlogic/phy-meson-g12a-usb2.c     | 15 ++++-
 drivers/usb/dwc2/params.c                     | 21 +++++++
 drivers/usb/dwc3/dwc3-meson-g12a.c            | 16 +----
 5 files changed, 97 insertions(+), 15 deletions(-)

-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
