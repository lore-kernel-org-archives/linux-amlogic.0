Return-Path: <SRS0=Hahh=N5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B44FC433FE
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Sep 2021 10:06:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D1EB603E7
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Sep 2021 10:06:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D1EB603E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lexina.in
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ePInaJHFWz0jSHWHr5aeDU2cC/xQRok7iRgfHhp40tg=; b=G7JXS2eHb3OKE9
	CF1V9sYizY/hk9gffUTX39o/As0LORlC7JtB+240ayVUsjN4XeNRXDwKaZDtJNcwQxGIVgRQnmDZf
	NcgGR/OlIlviaz6nPwQUregwTh/0LdE9348uhwFxBH74343aZ14GjBEe0B4S20qiiOlz12TpTp/eR
	M062O9z5/ulPTOG7MrFK2wVObuKAIcGirbtz/+9OUIxkTdzzvAeBQjgMWiWjRr3uxXWVjXKnGDmJJ
	alwRAJtDhDcoLGMkqD64F+DaMgVHOsm1nBbDHeqyKJb8RXrv3lpLBc6y9IP4yGHyp4K4Z0eurqkp4
	iAa0PLUYlRuuC6WE6ZOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNXzm-003G7D-Sn; Tue, 07 Sep 2021 10:06:26 +0000
Received: from mx.msync.work ([2a01:4f9:2b:2dc2::3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNXqG-003D1L-S2; Tue, 07 Sep 2021 09:56:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 57352DDABF; Tue,  7 Sep 2021 09:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1631008594; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=8Qdhec2HP5e1kbDrVuNHeouRztb+b5XkYB2iQ283/Bc=;
 b=duPXLB5gEQLiMxAmjdg8Doi3UOzjtjKAcsss0Xe850LM5exQLGQ+5+foR2LMmJHrdoWW+r
 tY9h9sTuGgGrj6wAVAbCjmzeES/vfFDJOaqnG9MQEeVZ8kcoYb18lkPAQtevtYH9wLhV/e
 CPNmmXW3QnZp21PRN5oP+6h0Qt345QRipV6qCFo7O7wiZdbw2IrvaZO453QMtHoiiKQJ8S
 s9TVXxHATXxJPs01kEYtwPKZxcpPbJRL5bgRtrcYjTd7J4xY7FzKxNaEgmkd6ELZBXuFhY
 il00KXGRNqMo/GDG2/cEdAEJJbOET+OJeDX2LYbOHuavDdxi1G8PS73/L5Sohg==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] arm64: meson: add support for JetHub D1/H1
Date: Tue,  7 Sep 2021 12:56:00 +0300
Message-Id: <20210907095603.1520109-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_025637_284127_E2EC8153 
X-CRM114-Status: UNSURE (   8.80  )
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

Add support for new home automation devices.

JetHome Jethub D1 (http://jethome.ru/jethub-d1) is a home automation controller with the following features:
- DIN Rail Mounting
- Amlogic A113X (ARM Cortex-A53) quad-core up to 1.5GHz
- no video out
- 512Mb/1GB LPDDR4
- 8/16GB eMMC flash
- 1 x USB 2.0
- 1 x 10/100Mbps ethernet
- WiFi / Bluetooth AMPAK AP6255 (Broadcom BCM43455) IEEE 802.11a/b/g/n/ac, Bluetooth 4.2.
- TI CC2538 + CC2592 Zigbee Wireless Module with up to 20dBm output power and Zigbee 3.0 support.
- 2 x gpio LEDS
- GPIO user Button
- 1 x 1-Wire
- 2 x RS-485
- 4 x dry contact digital GPIO inputs
- 3 x relay GPIO outputs
- DC source with a voltage of 9 to 56 V / Passive POE

JetHome Jethub H1 (http://jethome.ru/jethub-h1) is a home automation controller with the following features:
- square plastic case
- Amlogic S905W (ARM Cortex-A53) quad-core up to 1.5GHz
- no video out
- 1GB LPDDR4
- 8/16GB eMMC flash
- 2 x USB 2.0
- 1 x 10/100Mbps ethernet
- WiFi / Bluetooth RTL8822CS IEEE 802.11a/b/g/n/ac, Bluetooth 5.0.
- TI CC2538 + CC2592 Zigbee Wireless Module with up to 20dBm output power and Zigbee 3.0 support.
- MicroSD 2.x/3.x/4.x DS/HS cards.      
- 1 x gpio LED
- ADC user Button
- DC source 5V microUSB

Changes from v3:
- add pinctrl for spicc1 in meson-axg-jethome-jethub-j100.dts

Changes from v2:
- add new vendor to vendor-prefixes
- sync board compatible dt-bindings to jethome,jethub-*
- fix efuse fields
- fix gpio-line-names
- fix spaces and blank lines
- recheck via checkpatch
 
Changes from v1:
- rearrange patches
- add SPDX license and copyright header
- remove attributes without bindings
- small fixes with spaces

Vyacheslav Bocharov (4):
  dt-bindings: arm: amlogic: add bindings for Jethub D1/H1
  dt-bindings: vendor-prefixes: add jethome prefix
  arm64: dts: meson-gxl: add support for JetHub H1
  arm64: dts: meson-axg: add support for JetHub D1

 .../devicetree/bindings/arm/amlogic.yaml      |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/amlogic/Makefile          |   2 +
 .../amlogic/meson-axg-jethome-jethub-j100.dts | 356 ++++++++++++++++++
 .../meson-gxl-s905w-jethome-jethub-j80.dts    | 241 ++++++++++++
 5 files changed, 603 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts

-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
