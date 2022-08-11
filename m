Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D866C19F2A
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Aug 2022 10:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yD0aRwBkbiUvVBY+a6xsGfplyidmS/AWeRH/9sQ4a+U=; b=hrpMzu4TKOpYzA
	3rSk6bLFSKG+gDHWu/qE42JEvT73QCz63mgjIMXqp2BUVwGFuiXklOx4x15CQscdjTZP0KxlEWHRr
	eoctaVtVHCN6H/a4XCIdSCi0zg5IvFOtjcpwvtvft+KaXA8mkX6qsy+l5+2h6LKi6a3BMyIqavhZe
	ayqD3c8vzOmdMzHrCaAMCcpf0ZZgKKonwcVNPxv9Tr3luIP40bsumkBRbmVsXGuQTp5A4jRB0a09u
	kcPa1oESn5ONDtfE6S5b/WkVxMCRMr+QbldpuusE+jMXJ7+FYUvWdnMTxxT26tkKjI+QXWqIH71nr
	kdyDm9c65t1BjD21i8yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM5TY-00BE63-7N; Thu, 11 Aug 2022 10:31:40 +0000
Received: from mx.msync.work ([185.250.0.168])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM5TU-00BE1u-Sn; Thu, 11 Aug 2022 10:31:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 94B88A5320;
	Thu, 11 Aug 2022 10:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1660213886; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=LlRYyMFxzR+8bD7PyKB59D9fCelhvAh2RwZ8mF4ga1A=;
	b=czTuahj2avkQIsG1xWBgeYzO/qlOM2gV/U4Flg16szQ2Ib596FpdkX1mFJHD+PANvm0+Ma
	gsXOl/BA/ZWF11pl+NdZ8wUwzZzLKAJrRFmuEKCYTealX4Zvjuu7ix8ZnrpC4KDcS7LXfN
	W8g9e6xYSm/MJ/DozN4DItyeOGyzwP518TmHk784Xhdv0kC7l2eqbVsP7fkSsz8u02emgB
	TIzsK6PUFjOwhuXOdqZFXrPZu9iieLzDWsTFEu43XaBAkl8yWVJZST4Kfg4V3kqGDjmIbw
	c5clMwD31PpuX0PdfQr4E3tkZ1D0skZS8gOdh7jKuHCqzrHyrJWQeuOgrVzh3Q==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] arm64: meson: add support for JetHome JetHub D1p (j110)
Date: Thu, 11 Aug 2022 13:31:11 +0300
Message-Id: <20220811103113.3097868-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_033137_521769_957FC641 
X-CRM114-Status: UNSURE (   7.76  )
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

- add support for JetHome JetHub D1p (https://jethome.ru/d1p) is a home
automation controller with the following features:
  - DIN Rail Mounting
  - Amlogic A113X (ARM Cortex-A53) quad-core up to 1.5GHz
  - no video out
  - 1/2/4GB LPDDR4
  - 8/16/32GB eMMC flash
  - 1 x USB 2.0
  - 1 x 10/100Mbps ethernet
  - WiFi / Bluetooth Realtek 8822CS or similar IEEE 802.11a/b/g/n/ac
  - TI CC2652P1 Zigbee Wireless Module with up to 20dBm output power
    and Zigbee 3.0 support.
  - 2 x gpio LEDS
  - GPIO user Button
  - 1 x 1-Wire
  - 2 x RS-485
  - 4 x dry contact digital GPIO inputs
  - 3 x relay GPIO outputs
  - DC source with a voltage of 9 to 56 V / Active POE

- unify device tree files for JetHub D1/D1p devices

Vyacheslav Bocharov (2):
  arm64: dts: meson-axg: add support for JetHub D1p (j110)
  dt-bindings: arm: amlogic: add bindings for Jethub D1p (j110)

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   2 +
 .../amlogic/meson-axg-jethome-jethub-j100.dts | 338 +----------------
 .../meson-axg-jethome-jethub-j110-rev-2.dts   |  37 ++
 .../meson-axg-jethome-jethub-j110-rev-3.dts   |  27 ++
 .../meson-axg-jethome-jethub-j1xx.dtsi        | 351 ++++++++++++++++++
 6 files changed, 422 insertions(+), 334 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-3.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi

-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
