Return-Path: <SRS0=V5Bc=SZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB9FC282DD
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 08:51:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DFDA20843
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 08:51:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dMHfBTQ5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="EHgRrK7f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DFDA20843
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m5b9qm4+l0N/KT94g6ynOCuwV/zOh95Dy36QyHmcwtk=; b=dMHfBTQ52pBJI2
	i2CkTKztV88OC0A6VKGfpoZCZuSlcSjHKKsgVc8zk8ELAiouo59X6MudohEoqTUKAu+sAgRpS4z8I
	nEKGs3Wcx86eRL5MfNMhce9NTPTr5LVkMMPesdDG4MSIQYqotw844rxDAI6ZYwJxVz6u6+CpFo5Wz
	aMgRCE+0Vy+YATB51npgRq8+YZrtNcbRLp5L3VMfDUtFmpVkxUwZ8t8OtgShrsvJxekORzM++Wyd1
	J4Zj6mJWAiLiDC4LKXplNpEBTJG7lvVefUzK1rB1tTGIXgOaHmLDU/PzLWXnl1DXCG1Mxv7BJ+tLJ
	rtOO28U+DpDE3zmZJfYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIr9S-0001A9-SO; Tue, 23 Apr 2019 08:51:42 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIr9I-0000zF-Nz
 for linux-amlogic@lists.infradead.org; Tue, 23 Apr 2019 08:51:34 +0000
Received: by mail-wm1-x344.google.com with SMTP id v14so17741974wmf.2
 for <linux-amlogic@lists.infradead.org>; Tue, 23 Apr 2019 01:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vxcOBoVoCEyqdET5OW32wKLb2a2q/DXbMFqOTJqKm+g=;
 b=EHgRrK7f6Fkpzc7BY/skKQOuSMaCMXYDMM48lBKgDAEpc6OTz1+plpoQrMYKHvilm6
 95ZqHWyUrsEhvhErNJ5Qo2Gt2ZIaK/UhD6T4TibH8JiXA90bg+VDub++TmjvxwR+77Qf
 9oLJabIjIfUvGxLzG2EqglWiSQrRFKvnHJdVR1WEiBG8lyxp25lmxha4hZ1MXiuEPV0y
 fH7fg4pSmivG2gxBpSveAXzGNHp7Qs5JOkHvk1Bn+5Cay0I9lXBSBUJnFjpYItzkCft3
 N2+xJPcRshMP+GhP2H4hjS//ZRZMJKa6FjpI1qDDJlrRtvLPsoRbaLlRq4Ewyvhj1q3w
 i0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vxcOBoVoCEyqdET5OW32wKLb2a2q/DXbMFqOTJqKm+g=;
 b=DcyAfD7DNa9/QhAaEc7Ht6DC9cFtUfZfEipJsWyXXIvpE7PfxdXpQh59U1IH75ZE2G
 Oox3d5pP2iw1qY5xzSBAaI4cQEV9GMiByWsl9JnJrY7HJguAolfoZDmj3/NT43WEVm54
 Qh7CD7C/onV4n9VgPr22iUIALzOFSZWKv4S02cD17msZlxiC5Wwp3amKPclCwcmCzfzA
 cgk9OQ6df4QdV9S6TU7R0j4RGt4hhNOcYQcoAWvoA1LJkYtem7b5XoLzuJmyi1wCkK/X
 wbZHkZga2zZMN6FW8Z21DgMbNBP3N4YbJzW5/mKEXpObRmPPkVUMpMcWaxNnIfNqn0io
 4n5Q==
X-Gm-Message-State: APjAAAXtx04bPNrQ+svBcpxn4nS8li2CmD7CjpQR0FZ0DKemB6FNqmOF
 nrUqDSfR/avHU/+iSZnqKau54Q==
X-Google-Smtp-Source: APXvYqwWJ5RO1Go7EZGD3n/BLLiBj0PrbDoq+zJVIZWGTdNSJZ71OpNBeAEBv5SMArCfRfZChFIkhA==
X-Received: by 2002:a7b:c769:: with SMTP id x9mr1433791wmk.103.1556009490768; 
 Tue, 23 Apr 2019 01:51:30 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id b8sm12515566wrr.64.2019.04.23.01.51.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 23 Apr 2019 01:51:30 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org,
 kishon@ti.com, chunfeng.yun@mediatek.com
Subject: [PATCH v6 0/4] arm64: meson: Add support for USB on Amlogic G12A
Date: Tue, 23 Apr 2019 10:51:23 +0200
Message-Id: <20190423085127.3863-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_015132_785007_C9B94159 
X-CRM114-Status: GOOD (  12.44  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds support for USB on Amlogic G12A SoCs.

This patchset is composed with :
- bindings of the PHYs
- bindings of the USB Control Glue
- PHY Drivers
- USB Control Glue driver

Device Tree nodes will be added in a separate patchset.

The Amlogic G12A USB Complex is composed of :
- 2 USB Controllers :
 * DWC3 for USB2 and USB3 Host functionality
 * DWC2 for USB2 Peripheral functionality
- 2 USB2 OTG PHYs, only a single one will be routed to either DWC2 to DWC3
- 1 USB3 PHY shared with PCIE funcionnality
- A Glue to control PHY routing, setup and OTG detection

The Glue configures the UTMI 8bit interfaces for the USB2 PHYs, including
routing of the OTG PHY between the DWC3 and DWC2 controllers, and
setups the on-chip OTG mode selection for this PHY.

This drivers supports the on-probe setup of the OTG mode, and manually
via the USB Role interface. The IRQ mode change detect is yet to be added
in a future patchset, mainly due to lack of hardware to validate on.

Changes since v5 at [4]:
- Dropped already applied PHY patches
- Added patch 3 ack by Minas

Changes since v4 at [3]:
- remove remaining phy_put/clk_put() of patch 8
- handled phy_power_off/on() in suspend/resume
- Collected review tag on patch 8

Changes since v3 at [2]:
- Documented and replaced magic values in USB2 PHY driver

Changes since v2 at [1]:
- Collected review tags
- Removed syscon.h in usb2 phy driver
- Added comment on the USB3/PCIe switch
- Renamed dwc3_meson_g12a_usb_init_mode in glue driver
- Changed indentation in dwc3_meson_g12a_role_set
- Switched to of_get_compatible_child in glue code
- Added devm_add_action_or_reset() to disable clock in case of probe failure
- Checks priv->vbus before enabling regulator
- Switched phy_init/phy_power_on
- Removed priv->phys[i] NULL checks in suspend code
- Removed clk_disable_unprepare/clk_put in remove code

Changes since v1 at [0]:
 - USB2 PHY Bindings: collected tags and updated commit log
 - USB3/PCIE PHY Bindings: collected tag and updated reset list
 - DWC2 Compatible: collected tags
 - DWC3 Glue Bindings:
   - removed clock-names and reset-names for single entries
   - removed ports graph for PHYs and replaced by phys list with phy-names
   - added dr_mode and optional vbus-supply
   - fixed example
 - USB2 PHY Driver: removed USB_SUPPORT and otg.h include
 - USB3/PCIE PHY Driver: removed USB_SUPPORT, fixed comment and unused reg variable
 - USB Glue Driver:
   - Moved debugfs I/F to USB_ROLE_SWITCH framework
   - Integrated USB Glue Control Registers offset
   - Removed of graph parsing to use devm_phy_optional_get()
   - Fixed PHY mode handling and OTG switching
   - Simplified PHY calls by removing the NULL test
   - Added optional vbus regulator handling

[0] https://lkml.kernel.org/r/20190212151413.24632-1-narmstrong@baylibre.com
[1] https://lkml.kernel.org/r/20190304103846.2060-1-narmstrong@baylibre.com
[2] https://lkml.kernel.org/r/20190318101153.7531-1-narmstrong@baylibre.com
[3] https://lkml.kernel.org/r/20190318132655.30040-1-narmstrong@baylibre.com
[4] https://lkml.kernel.org/r/20190325093943.29138-1-narmstrong@baylibre.com

Neil Armstrong (4):
  dt-bindings: usb: dwc2: Add Amlogic G12A DWC2 Compatible
  dt-bindings: usb: dwc3: Add Amlogic G12A DWC3 Glue Bindings
  usb: dwc2: Add Amlogic G12A DWC2 Params
  usb: dwc3: Add Amlogic G12A DWC3 glue

 .../devicetree/bindings/usb/amlogic,dwc3.txt  |  88 +++
 .../devicetree/bindings/usb/dwc2.txt          |   1 +
 drivers/usb/dwc2/params.c                     |  12 +
 drivers/usb/dwc3/Kconfig                      |  10 +
 drivers/usb/dwc3/Makefile                     |   1 +
 drivers/usb/dwc3/dwc3-meson-g12a.c            | 604 ++++++++++++++++++
 6 files changed, 716 insertions(+)
 create mode 100644 drivers/usb/dwc3/dwc3-meson-g12a.c

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
