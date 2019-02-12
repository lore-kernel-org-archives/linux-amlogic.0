Return-Path: <SRS0=SW07=QT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3253FC282CA
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Feb 2019 15:15:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F267C2075C
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Feb 2019 15:15:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VNBQzOxx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Ww4lETpw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F267C2075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zaDzYm/E3FQBwODM/tcgyNpuh3cCucqOUtGxYE6fHa4=; b=VNBQzOxxmpKcDQ
	8AGFm2EH3qPrtXADMPDnEiZOBtk0f+s+XBNKQsZQom8TcKwvhNFOgIs6J2dvcQDf0bRBshOQgvOMV
	n5hEXJJPLhSDBe4y6Qmaa6kwV19oIVsYPig3dtlT2+SmNkGSeI/7GTIKsS8qrE9CAIl/EKwvwVDVB
	u2asALXntCZkCTOFderxgukwRQ9frtbEK2vDdNloiKoIHsOSGoukOJBBwXslT+w5+K4ADVIxo6rdK
	hXdfy5HaDs/naJJ+RuPwjOEWq7M3L4P42rqN0gfiILK9/e2COdW9K94jk+DyDSEjQSPq5xJK0zWBl
	DVAL3VuQfnFBWyYSdEkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtZmI-00084E-5k; Tue, 12 Feb 2019 15:15:18 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtZlN-0006Qw-6r
 for linux-amlogic@lists.infradead.org; Tue, 12 Feb 2019 15:14:26 +0000
Received: by mail-wm1-x343.google.com with SMTP id m1so3374265wml.2
 for <linux-amlogic@lists.infradead.org>; Tue, 12 Feb 2019 07:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UckL5F5wh14/YUh0EVruXB5oWRHagYvkkrGnqq3zUiE=;
 b=Ww4lETpwizQsUdnAm2qIdHMhCP85ZOydMyiTTX6qQKV73ZRx6kagGSPv6iuZr3FAFD
 9ALBszVPoHHnbjOfrsfley8xk0ZNvw4a8KeSW4XPaZtW6JUD5Ay4i4dsZK7ZRC7Xa/p5
 RzJ+kDsIxhcvgT93T8ARnToZElGPd5lrlSMQDHyPFO03BKaLlKp77EDi0oMe/Qi7Q13+
 1vtDtuhN1E9skOfkhu3JSGg92yTg0twl2yZD1kCg5Vr72q40gGtKckNCgKt+ouw6JVUA
 Ans54ZtJEliafc4+KKK0+GA8+AQo0kq+gDnWUzWoyZZIyfPv1lt6ZkcsXiq6QhA5tq8Y
 p8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UckL5F5wh14/YUh0EVruXB5oWRHagYvkkrGnqq3zUiE=;
 b=b0IrrI5m08sqSR1nGDTOAgY0Wbem9BD7KmeDGbHVykFJTl0nbHWIhDhtaR3ACzK1ZH
 JC43riaxrs44fD2KdAjjPi0r5/Mvt6UH55orW6/NABUNUFgp+trso3ny/X3DkoqhMk5i
 usq3nR8FfUZlaLirkPwDj7VSe2X42mitI00PdwXPTZazZd6unkJLVROuNSGTJZN/7SEP
 UA8OItM8/rZ0hPGJ1nDqZAFrngkwye7cBaGnfyWgJJY1mAPA6MsoJIQUGza85wKLKcit
 cmH7nqa/zrXRqrY+GeOq+FhJmz6iQtThJv1c89gGYYHzimzWhB+0QHs0lAoU3f+JZoKq
 e8lA==
X-Gm-Message-State: AHQUAuZuiFz/bQ9TwpZGM/HZm5O/ox/3JkA3qS/vq6Zoj+uVIoPoMXN7
 vRlmF01UzH4bzZYFZs4SUvHNew==
X-Google-Smtp-Source: AHgI3IbE/WnTSfsIWA2e4zZ/8ElQpqHC/9f0glSu8Ltf7WCBwxI7RcaVE8d6ILzTCgdgNRAh69VmAA==
X-Received: by 2002:a1c:b70b:: with SMTP id h11mr3421759wmf.72.1549984455689; 
 Tue, 12 Feb 2019 07:14:15 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c1sm1589515wmb.14.2019.02.12.07.14.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 12 Feb 2019 07:14:14 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org,
 kishon@ti.com
Subject: [PATCH 0/8] arm64: meson: Add support for USB on Amlogic G12A
Date: Tue, 12 Feb 2019 16:14:05 +0100
Message-Id: <20190212151413.24632-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_071421_244638_26FE251F 
X-CRM114-Status: GOOD (  12.67  )
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

The PHYs are children of the Glue node since the Glue controls the interface
with the PHY, not the DWC3 controller.

The PHY interconnect is handled into ports subnodes, which eases describing
which PHY is enabled (like the USB3 shared PHY) and futures layouts on
derivatives of the G12A Family.

This drivers supports the on-probe setup of the OTG mode, and manually
via a debugfs interface. The IRQ mode change detect is yet to be added
in a future patchset, mainly due to lack of hardware to validate on.

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
 .../bindings/phy/meson-g12a-usb3-pcie-phy.txt |  25 +
 .../devicetree/bindings/usb/amlogic,dwc3.txt  | 109 +++
 .../devicetree/bindings/usb/dwc2.txt          |   1 +
 drivers/phy/amlogic/Kconfig                   |  24 +
 drivers/phy/amlogic/Makefile                  |   2 +
 drivers/phy/amlogic/phy-meson-g12a-usb2.c     | 191 +++++
 .../phy/amlogic/phy-meson-g12a-usb3-pcie.c    | 414 +++++++++++
 drivers/usb/dwc2/params.c                     |  12 +
 drivers/usb/dwc3/Kconfig                      |   9 +
 drivers/usb/dwc3/Makefile                     |   1 +
 drivers/usb/dwc3/dwc3-meson-g12a.c            | 650 ++++++++++++++++++
 12 files changed, 1460 insertions(+)
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
