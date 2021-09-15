Return-Path: <SRS0=XSrd=OF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBF2C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Sep 2021 08:57:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44E5560527
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Sep 2021 08:57:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 44E5560527
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lexina.in
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d+lJYMGRTc/rEEQLRT1CSDOrbyabi2xLwPI+xmFhuJE=; b=qgxQM3vtvvO3TP
	lSwXw/B5HsQXyYd1IJUyNhPpfihPuGg6gZK8x0gfC71zI7PZuF/OfeE4VI9F2Ou2jQZxietMQ8Gf2
	mqpeAPdcltTyehc5hPsY0AM11kd4I1v8GsBZvl1p5muDPasK/QW/EBKPrz5F83V44EcZM8tonjTk6
	OtsmmBXdUiBp/+8OTktQPM5J2fOJKn53Vl1RrCg1G+vwBi9deBIY9W5BM/5BDZKWmvS/xp9W8YH9q
	+ueu67FWdLo6Vhqk9UE4PVQMoQQmwDqAEmz+IshFNjgaTJNkMPa2PmU36/teijhj3FjvqD8rBSr6J
	xro4AzWdTMlP4tOzLglQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQQjb-008Xft-89; Wed, 15 Sep 2021 08:57:39 +0000
Received: from mx.msync.work ([95.217.65.204])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQQjX-008Xa1-T5; Wed, 15 Sep 2021 08:57:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 661FBF6273; Wed, 15 Sep 2021 08:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1631696251; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=H5qdDcH8TpR0CnX1Fd/kIIzcZXwfWBWur4Fc/P7iFjE=;
 b=sJBMHob4pjc07+FI0LHrV4RLYZhBHitb73gu5L7eF9r5C/uRg32xKL9Y/Zzt/kKN+W5Z8P
 ymfoG/Z2IZpEo995WiZfn95wxVhFUb3pKX5H6Xgv1/2GPphkqmge2Oz9p3QcRtdhbIW0ew
 Fvhex2NsoOCLAxC1xNqdE5M02NCJtiB4qRFzwjhrIzZrHlVwAOOCF2DJVyRTQsFqgJxJgj
 E8fQ+vD6YTHpQdNRsiiWXX2wmGCinDDwNLB9h0Q7vGRnrB2IZ2fRl9z3OFNNsjNtXj5RNK
 Wq492ZCzlYQh3GG8Wu3xCywBaGX7xy5oj757VR9qc9NBvpt9ZIBNevU+3k2esA==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v5 0/4] arm64: meson: add support for JetHub D1/H1
Date: Wed, 15 Sep 2021 11:57:11 +0300
Message-Id: <20210915085715.1134940-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_015736_379398_A8C2AD4A 
X-CRM114-Status: UNSURE (   9.25  )
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

Changes from v4:
- add 1wire-gpio node in meson-axg-jethome-jethub-j100.dts

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
 .../amlogic/meson-axg-jethome-jethub-j100.dts | 361 ++++++++++++++++++
 .../meson-gxl-s905w-jethome-jethub-j80.dts    | 241 ++++++++++++
 5 files changed, 608 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts

-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
