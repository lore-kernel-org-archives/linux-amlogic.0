Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A6EC4363D
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 14:31:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DC34208A9
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 14:31:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KILy3wt7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="S3VQn0gr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DC34208A9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F4a2naYhYl6IFfPMqK3XXIU+D/8EUoyMMpNvep8PUUQ=; b=KILy3wt7FhME8ip1BikeQVr7Ik
	IhxyopAtE73igt/QrKR6hruKZWa7bvooe2rA9M+vAAlLbF0c+VFof39qGe1vfDbCApm2CQF6OQWnK
	20Ur+oQtdquyojbQi24PmNr36Fbw/E3IPy4eJYeOuNcgTtAX2mbBIy7cTec4ykBfPhd9Ql396970z
	QqfJYX4IMSAhmaZmKw0UDI3OAbVuUj6jD3SnkL6JZLgcApBrIZvzp/8yP5MrHMqBUVwJws77IEUNc
	Gnav9Ucj52LVH9tAQNfk9cA2KJYg+z35Jxwy7lZ8mUV8UWvldXBg8+56++eOpinx/zsCUlNJ9DWof
	x9P2igSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLokY-0005Gl-E7; Fri, 25 Sep 2020 14:31:02 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLokU-0005Eo-N2
 for linux-amlogic@lists.infradead.org; Fri, 25 Sep 2020 14:31:00 +0000
Received: by mail-wr1-x441.google.com with SMTP id t10so3878521wrv.1
 for <linux-amlogic@lists.infradead.org>; Fri, 25 Sep 2020 07:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=arq6hBqKcw4xpRgA4LyIIax3DkHTeRanbUeXwfcpX84=;
 b=S3VQn0grifi9xYru7o5R6mX6oIPlQKEiYWl9uw6XTxHTExJHyq8GTxc3VjOSndjlv5
 dlwS8WRhEwzMYrMo7tI6YbnS65gMKTgtigADC0yHC5l2AzGWpRkNpQ3qrPiegAnfY6tY
 FXDpzMpBaTc7E+jywvaaUQITmMsJdsdN9TVBpk4T39mXgp4BwMbp/BimAz4aHVDr9nW3
 DlCsp1oBOZKRBtmDu6zuHgNH4hTYqxEcRIvMlA1CcE3A4Xp+zPP8p+DRr35zMTxzerQE
 Iip5nayi3KRq2CwtGBmPVua5oNCCXEthrogaqRjywJocRW4BTGPy9hUbLcq362N43uaR
 2eoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=arq6hBqKcw4xpRgA4LyIIax3DkHTeRanbUeXwfcpX84=;
 b=HWLhBdys5v1UeTogVnte3jd1TqGzBfym2Yb0uXhDzptihcfbw4nHrM8IaqmxHj/WZF
 UK8yak4c6nTeV9D5lIyR0EFsFkULzuIRKnNfwaA/kA8PtCPp5JQss6PQRc3qN9zDzrRk
 aCXOelK86RMUrZWhOUSCwZ6H5YGI4Ftw83rymVtLDl+pGuDa83Ghxc7Bf0/L57SU2VCq
 GQkDQukoAXyQ9tDqn1zGhMSDSAnuXcQIAohUPt3tb/3FPV88Un6ITBJ2Ah2MEBe0H7pM
 ouGm1YCqQjfC5bT9PiUyTaxgbHNv0cIZy+gzHwc7BaYaVyygEz+V+sg9sj3HzFPdlvUW
 E/iw==
X-Gm-Message-State: AOAM530ht/Ma77RcndHdBiwSym7cpqzcTVMCucqHiBi4qZ30QamY9HpS
 a4jfYtXVTS0gpsnlewfBdHO9hw==
X-Google-Smtp-Source: ABdhPJwmhtc51Rrtzom4ng21ESoGLAWUQoFH+4tXWhCys0e+s0LRoV38gAF4QOxHwGSAgQyRvwF4kA==
X-Received: by 2002:adf:93e5:: with SMTP id 92mr4719786wrp.31.1601044257528;
 Fri, 25 Sep 2020 07:30:57 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id p11sm2922941wma.11.2020.09.25.07.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 07:30:56 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL] arm64: dts: amlogic updates for v5.10
Date: Fri, 25 Sep 2020 07:30:54 -0700
Message-ID: <7h3636kjxd.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_103058_805290_E6B01489 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, arm@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The following changes since commit 67d141c1f8e604a9c02d6a60f7827443d7f44762:

  arm64: dts: meson: odroid-n2: add jack audio output support (2020-07-29 12:18:32 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64

for you to fetch changes up to 63fafc5a046b1e21756de691b48f0c70c25e1426:

  arm64: dts: meson: initial support for aml-s905x-cc v2 (2020-09-18 13:35:27 -0700)

----------------------------------------------------------------
arm64: dtc: amlogic updates for v5.10
- new boards: libretch s905x cc v2, Hardkernel ODROID-N2+
- vim3: sound updates

----------------------------------------------------------------
Christian Hewitt (3):
      arm64: dts: meson: convert ODROID-N2 to dtsi
      dt-bindings: arm: amlogic: add support for the ODROID-N2+
      arm64: dts: meson: add support for the ODROID-N2+

Jerome Brunet (5):
      arm64: dts: meson: vim3: correct led polarity
      arm64: dts: meson: vim3: make sound card common to all variants
      arm64: dts: meson: vim3l: remove sound card definition
      dt-bindings: arm: amlogic: add support for libretch s905x cc v2
      arm64: dts: meson: initial support for aml-s905x-cc v2

 Documentation/devicetree/bindings/arm/amlogic.yaml              |   2 +
 arch/arm64/boot/dts/amlogic/Makefile                            |   2 +
 arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi         |  88 ------------
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts       |  31 +++++
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts            | 618 +--------------------------------------------------------------------------------
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi           | 625 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts | 318 ++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi              |  94 ++++++++++++-
 arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts          |  86 ------------
 9 files changed, 1071 insertions(+), 793 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
