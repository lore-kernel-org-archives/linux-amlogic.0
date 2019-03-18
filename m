Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C75C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 13:27:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A77B020850
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 13:27:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RskLHcOY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dMAoexiW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A77B020850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dKKTHvG5C6HLpTMME6cDHyuzAdW61PyGRCadT5lEIFs=; b=RskLHcOYhOdZTU
	EFu/5ZJxzbcp9DjOaYkIBwyvqyxfTG7WIASohZda28MyxFHqMG5nKFGHWu5ac5o5MkgiD+AhB396R
	hke1A4g4Tns9rQxTgSiaCTUmn7RxZuFNnMcTsQcdq3kyf5Rt/OAeRaeIqC2o+02aUtqWj4AV7NdNe
	ktJoEQ7JNK6cwDPX8HgHdfqBnBVaFdII+8VoqZlEhXk4OA3A0U/yv73pcEzcdQ7XLqiSPEYN00S4V
	QNwl90GkowgTnKjVorBtn8X4UQVyrzrmpDEsg018/y9krAMhIsVal1jFU6iBcYl7VxnEj86l1iY/z
	P9hFZjgMm7VYH2YuubhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5sIG-0004Xa-Ji; Mon, 18 Mar 2019 13:27:08 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5sI7-0004LL-R1
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 13:27:00 +0000
Received: by mail-wr1-x443.google.com with SMTP id q1so1374332wrp.0
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 06:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ru6OOQvD1PRf0eN1OL77FtwXrU5QdpTqPkddolVvl5I=;
 b=dMAoexiWzY5+AUKI9gWSmIBzG9poEt5+C+xpUYhRVkdNxfwPd9M0VPBlYDHSFwxXQZ
 DT8FJyawGB0sfgkE0gOBOu32cJLgvZ+tOI03oFmcqeXhPitpMq12AE3xH8bFzaSn7DTa
 uMYQnkDY4QSLj0pipQwYHtNnPzsgMuNwx6Y9Th1+++yccRKTci4S+GqfhZB80EoCBECp
 aGgBX2cDG6UHe/6W+AuJg9i/7aPMfwmmkWmVXern1nAGEfQQRvnKYLR4JpxqzRQQB6bV
 11jR++RbYb5mVQy0jrWlfYtbcw0Ivh8UPHJMt9XOfJ3rSnpZfYuGi1pBMOfSKo1N8DH6
 ecQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ru6OOQvD1PRf0eN1OL77FtwXrU5QdpTqPkddolVvl5I=;
 b=STbk1biFiAHFZDAdCsICu0XwlG8SWguOyQNauSaU13Ak4X1omkKTmHzYBqccDjWoFh
 wXGvCSkG7+SDhIiVjKybtMekioHgqVOhQ9EgynzeD0X328Tn8FswW7IzpPhqi86Ys3Yu
 a8ug8h3Dm+gMvflrhLhvjYP/JQ3UQT9u17IAHLvO67PNnF6d+ew54AJs3SyYk7kS9BP8
 JPZSOYSfgZOEpQAEc7AXD6wZFvC8+KNiKZQvAxWA9B3hVm85CnxObNJIC1YtmmTsIqCV
 y3GKZvVnBPp2N6A8aQYMzELPz3nfLayOtKhnZMHEeV/CIWm8ect2MWTalqjBJFUJJwDm
 s/+g==
X-Gm-Message-State: APjAAAUZBzq4n7h+A8lueMceZtBImf02Zt4sH2H6i7fPPbBLyOkuK29s
 kFZ16YpIbx4rptDN0xyKVH/10g==
X-Google-Smtp-Source: APXvYqw7uRmY3RmMVnXLYqJVKmXgwZFr9OBt1ATxvTVUumK2KslekD2kktmNAIDJ0DnVKHMXg97VsQ==
X-Received: by 2002:a5d:5504:: with SMTP id b4mr11495424wrv.137.1552915617734; 
 Mon, 18 Mar 2019 06:26:57 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j128sm10421601wmb.43.2019.03.18.06.26.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 06:26:57 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org,
 kishon@ti.com
Subject: [PATCH v4 0/8] arm64: meson: Add support for USB on Amlogic G12A
Date: Mon, 18 Mar 2019 14:26:47 +0100
Message-Id: <20190318132655.30040-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_062659_872179_C98EFA78 
X-CRM114-Status: GOOD (  13.48  )
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

[1] https://lkml.kernel.org/r/20190212151413.24632-1-narmstrong@baylibre.com
[2] https://lkml.kernel.org/r/20190304103846.2060-1-narmstrong@baylibre.com
[3] https://lkml.kernel.org/r/20190318101153.7531-1-narmstrong@baylibre.com

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
 drivers/phy/amlogic/phy-meson-g12a-usb2.c     | 341 ++++++++++
 .../phy/amlogic/phy-meson-g12a-usb3-pcie.c    | 413 ++++++++++++
 drivers/usb/dwc2/params.c                     |  12 +
 drivers/usb/dwc3/Kconfig                      |  10 +
 drivers/usb/dwc3/Makefile                     |   1 +
 drivers/usb/dwc3/dwc3-meson-g12a.c            | 602 ++++++++++++++++++
 12 files changed, 1536 insertions(+)
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
