Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009CCC27C53
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2024 14:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rs8v2GPGS+hXwLkOsZOXrrwWeSu7KOJk2y+rnw71udQ=; b=iPbwyDwapI20hA
	G1JLvrYYZ47tYZtZu16mTKpyJz51F9dufAN1yiLseGWg2csa2MXj4VggfoflYgG0+dlnokoYGi4ax
	GsEZm2HkI7cVFe4aM2d5BdONIYeGivuH8qQAiUiEGDPrqdzWP9wqdz1ZT7In7tpwepJhHrmUv2yYU
	cYWBI9wHHnrQfIb2lcpm/bfa9i+saYSiHQjQPYtaKuqcp3xjWTTdrBRJeiDArpxqNjtE3CK+rshWZ
	807AJFX3GZFr6aF9h2vqIDHnmS78rKV1q512NgAY8RHedlXmBOxVU9+ZPbsTF1F8bVyc/DsqPpGo5
	WdNp/LDBc61hI3lA8Yvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFaww-0000000EWgG-3ULl;
	Fri, 07 Jun 2024 14:52:14 +0000
Received: from mx.adeep.su ([185.250.0.168])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFawt-0000000EWdu-0Xte;
	Fri, 07 Jun 2024 14:52:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6F8D105B34;
	Fri,  7 Jun 2024 17:51:55 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1717771923; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=geCYlXiO0IWtdW5F32VwIPOBGEnsd+xctEzn2zYkT+Q=;
	b=mALkROfww//auwXsXckN7RnBgbpRARuAQO54gWBvcmpHminERhO/pKBKkhW/pNqaEJB6yZ
	lBVDM28GVNkz/hPbPqWCNBVPARmoBbPBd2PuNnJkO5kCm7UY7GMnj4Ok9c++lhwer5Sc+A
	vibn8v8eCzV65Xs6pKFWs4GHZ5zt2TpFB5LII9VHwwO0JjpioZQQJdBHO8ri8zaWIsbIhR
	K8EQH+XVsmsA6IEJ285aKv0pSN5zSHjV9paZNVpIaDrQs7x06BXwnC3jzz6oFb7yMaC3Hv
	2UtpdIB0OzsgYuX2mp5qEk+rb6/dOK2M+hzeE5lvDZ3lsSy1g5JIKb8OF78mrQ==
From: Viacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: meson: add support for JetHome JetHub D2
Date: Fri,  7 Jun 2024 17:50:02 +0300
Message-ID: <20240607145148.2246990-1-adeep@lexina.in>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_075211_567486_EDDE5890 
X-CRM114-Status: UNSURE (   6.84  )
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

Add support for new controller.
JetHome Jethub D2 (j200) is a home automation controller with the following
features:
  - DIN Rail Mounting
  - Amlogic S905X3 (ARM Cortex-A55) quad-core
  - micro-HDMI video out
  - 4GB LPDDR4
  - 32GB eMMC flash
  - 1 x USB 2.0
  - 1 x 10/100/1000Mbps ethernet
  - two module slots for radio/wire interface cards
  - 2 x gpio LEDS
  - 1 x 1-Wire
  - 1 x RS-485
  - 3 x dry contact digital GPIO inputs
  - 2 x relay GPIO outputs
  - DC 9-36V power source with battery UPS on board option

Viacheslav Bocharov (2):
  dt-bindings: arm: amlogic: add binding for JetHome JetHub D2
  arm64: dts: meson-axg: add support for JetHome JetHub D2 (j200)

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../amlogic/meson-sm1-jethome-jethub-j200.dts | 614 ++++++++++++++++++
 3 files changed, 616 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dts


base-commit: 32f88d65f01bf6f45476d7edbe675e44fb9e1d58
-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
