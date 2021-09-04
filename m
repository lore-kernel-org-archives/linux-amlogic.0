Return-Path: <SRS0=mTG8=N2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4EA8C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Sep 2021 14:28:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D289604AC
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Sep 2021 14:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D289604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=lexina.in
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kIbVtYrzyl9xfzKhcEAQnM/2oVNb+nnsDu9wQbF/BeU=; b=eheWCYQHBBsC0E
	IWNlhhGAIfyDautCa6g+3yiXVbzPw/R3lU6J6l89RITQPieTxUOa/wmwF3XASPzE5ijSN66t60bFQ
	OfLzVv9Tod2M1cYjps9GXWmeE3dKKXL7m0UFMk1LeIAkJBsq57A9JVG4wJbEfSt4P6VeeDuOK+nxe
	Tt/jVtXwLodW1r7SO+5x3mIMrg8YceE6McTM9+xybNSL6JRn/q0ydNPuBO5IIMP9AtcxDLFqhdZvq
	NTsGK787rYpDL5lYEjgi3DtEUbLfFm1U72CvjipYf5YB+7pzYIAqmRm+FmD+56OAY/oInr3HdJXRD
	LPwYSml1CRQC9OQkmOMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMWeZ-00EFpN-2y; Sat, 04 Sep 2021 14:28:19 +0000
Received: from mx.msync.work ([95.217.65.204])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMWeV-00EFoU-Fc; Sat, 04 Sep 2021 14:28:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1662AD8488; Sat,  4 Sep 2021 14:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1630765688; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=UGDBfN3W2rgzQ1T13p8le+aEw+VtrpE2AyjgxfF7sm8=;
 b=k4NnB8XodHhj5lFn7e23KiIIX6ows7YnpPKXKPqCLXxZrqnKHufwOqiRrMKdf0Oz4ZilKu
 AUtulJEGibKMMxMQ1LlFSsYKjkkBWlL8CGgaoukrnyP1Z6GfgSIKVfvg7ZrzmC8SwHVUqV
 e6Jj0JMQdwhBsA5xoleuf0nswzBCmfqnatRWNtZW+JAj59RpJoy3V9ZY4xOykEb3Z5dnmi
 5Xro0si0HKn3azqjbJ7cpHMkYvYP/OpqLa9phqWGjwwQtimIdPlt38A3dVLW2eYvaeJEP5
 MRTEgca7/Oqbor1Lj+kEaVxtc416zy+h9f/FkfzrtYWyPOlL6teKVtR9B5d7RQ==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] arm64: meson: add support for JetHub D1/H1
Date: Sat,  4 Sep 2021 17:27:41 +0300
Message-Id: <20210904142745.183875-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210904_072815_726517_560C415B 
X-CRM114-Status: UNSURE (   8.57  )
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
 .../amlogic/meson-axg-jethome-jethub-j100.dts | 354 ++++++++++++++++++
 .../meson-gxl-s905w-jethome-jethub-j80.dts    | 240 ++++++++++++
 5 files changed, 600 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts

-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
