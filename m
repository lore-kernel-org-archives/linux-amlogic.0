Return-Path: <SRS0=/5FS=RH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A8FC43381
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 10:39:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4D7F20663
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 10:39:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dGWA02Is";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YtIG9XTP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4D7F20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1CGABdC59booXfeWOz+2rUJyMHsSOdpFgremXLfTYDE=; b=dGWA02Is6841zx
	cuPrhUcBPBep/bkb7i8miacvpTCExb+7DyU99cky9NTBm01IYPunE964EQNsMqxF3FywbR1jnSwXU
	tDzr7HuLB83JvnhWBGeJzZy2zYKIhe4pupyVeLRmbaBZ2DbjGuE/RPh1m10VBIv1By8bahKnOhQfK
	u4JFRtRYVk+AMAyOILS4a4Te+SQHH+ldJPHVmVZJtSkJW864CJdRmk4F17tuykL4DO2jQvYUFvv3n
	T9cP7gwQMZa/Gm9ns879NI0xWIwB42WLIFQe8zO3CJduT4if3dieb4pln3+1z/WIJhGcVPMWhZOa5
	4rET/2G5EfOT1Q3FX9FQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0kzn-0001wN-7i; Mon, 04 Mar 2019 10:38:55 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0kzi-0001u4-KY
 for linux-amlogic@lists.infradead.org; Mon, 04 Mar 2019 10:38:52 +0000
Received: by mail-wm1-x344.google.com with SMTP id x7so4077702wmj.0
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Mar 2019 02:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iqnLDh/3gLgzm3EIH21yBdzEwG5/GlGIoE3ShsGuFac=;
 b=YtIG9XTPn1uaQa/M7AQRGKz4zhlKj7GrtQH+ixTBgonNRZEtzjSVpz8kgODOYuWkkc
 yHUY0TwV2h5o1kw0B5wahRpDgt5cWubbqaXq6jkmpC//79KsG28oFDoaL22BkocaKW+p
 OjD8AB4ZHkAkcAbQIRRw6QagjTlBVmI2mP4k2cQgPcV60Jei80bXcwb4Zfa2Vj5R2QK0
 JsPcAZvBnL5yHRYekfd91CVPBtsUIccCCWoRbQFukcwYyOlP8K81ndPkCEdH8Y3WOrOI
 OAI+dT9qjZoqlP/1fdd849qfFWibFU5XIduM4z+5BJkkZh1TA0ZmaujPFTE9NnBM6H9H
 WT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iqnLDh/3gLgzm3EIH21yBdzEwG5/GlGIoE3ShsGuFac=;
 b=mcD7icsg6rHJV65l3aOO2HU5N697df9UJ3kcQgGKLrdxkKjHyOl7DXajETSU2twu2w
 wrfjjfp0ErZD3QUBkPxTD+Jd6H4rWssro2GXwYzTHekHOvmFi4BC6vxcfV3NWocDg66+
 7Scw662fomD0ix+wrkV2XDuoQQfxOZ8fsVipB3L6Ed03gewUF5lcBpoh/vTvaM0uUdDj
 N2+yYIgDZssCE3ASGcyX9Jo/dygODEZu+157p3PpajEw8Ph5WoT0xPjIJYeu/JvUEhDU
 qrg+EClnMK4sFUG+nmGRwgRqrxOgr8JkxofT7GlpvqYRfF9Xbib8jy4SGfl2rGpTCnls
 sIMQ==
X-Gm-Message-State: APjAAAWhtruCqZIMRS55Bv7Vn0O4IaiZ49DyT+RLXeeldRK+uFtvD9pa
 fkJyGnTqaysasJ7l7nzl9QPLBQ==
X-Google-Smtp-Source: AHgI3IYDqs9ktZSOth4VaPNWVQVgUt+c49TG6jQTehHmHmO6iahrN5Lg7DiAC4B9mlyVohSujkrmVw==
X-Received: by 2002:a7b:c413:: with SMTP id k19mr11128597wmi.75.1551695928981; 
 Mon, 04 Mar 2019 02:38:48 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g24sm5505676wmh.45.2019.03.04.02.38.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 04 Mar 2019 02:38:48 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org,
 kishon@ti.com
Subject: [PATCH v2 0/8] arm64: meson: Add support for USB on Amlogic G12A
Date: Mon,  4 Mar 2019 11:38:38 +0100
Message-Id: <20190304103846.2060-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_023850_711660_B2344A91 
X-CRM114-Status: GOOD (  13.02  )
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

[1] https://lkml.kernel.org/r/20190212151413.24632-1-narmstrong@baylibre.com

Neil Armstrong (8):
  dt-bindings: phy: Add Amlogic G12A USB2 PHY Bindings
  dt-bindings: phy: Add Amlogic G12A USB3+PCIE Combo PHY Bindings
  dt-bindings: usb: dwc2: Add Amlogic G12A DWC2 Compatible
  dt-bindings: usb: dwc3: Add Amlogic G12A DWC3 Glue Bindings
  phy: amlogic: add Amlogic G12A USB2 PHY Driver
  phy: amlogic: Add Amlogic G12A USB3 + PCIE Combo PHY Driver
  usb: dwc2: Add Amlogic G12A DWC2 Params
  usb: dwc3: Add Amlogic G12A DWC3 glue

 .../bindings/phy/meson-g12a-usb2-phy.txt      |  22 +
 .../bindings/phy/meson-g12a-usb3-pcie-phy.txt |  22 +
 .../devicetree/bindings/usb/amlogic,dwc3.txt  |  88 +++
 .../devicetree/bindings/usb/dwc2.txt          |   1 +
 drivers/phy/amlogic/Kconfig                   |  22 +
 drivers/phy/amlogic/Makefile                  |   2 +
 drivers/phy/amlogic/phy-meson-g12a-usb2.c     | 190 ++++++
 .../phy/amlogic/phy-meson-g12a-usb3-pcie.c    | 411 ++++++++++++
 drivers/usb/dwc2/params.c                     |  12 +
 drivers/usb/dwc3/Kconfig                      |  10 +
 drivers/usb/dwc3/Makefile                     |   1 +
 drivers/usb/dwc3/dwc3-meson-g12a.c            | 601 ++++++++++++++++++
 12 files changed, 1382 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
 create mode 100644 drivers/phy/amlogic/phy-meson-g12a-usb2.c
 create mode 100644 drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
 create mode 100644 drivers/usb/dwc3/dwc3-meson-g12a.c

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
