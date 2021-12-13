Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FECC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Dec 2021 13:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Cc:To:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G/FjMopiU/YqHVMAXXKpzWmhjeyalwtzUdFCnWZeDv4=; b=4od1RYX/AznOgQ
	fspV5sa+ZhEtHUqWbLZ1HncKWmb/WBdE60vVLbqCvJ0PHoXvBDv/oZ0fi5YFcBri3Bc2FfPMP+hQ1
	hSjTwX/Kuhjjzd0ieHuzvsYGy8/qbHFx0325Q4L6pvfmCKxhxDOxSUeQPB9EcylF/jjHoQFhgFOB1
	3/RC+gejdiBVOZgfEqkxX6UYKj6ogEE4/00Xdw8/kW8wWaThgpE9BjNGyp5n58PenmsxZTLjxyeK1
	ZWx6gvChO/d4bbs/S+tGSAGEG8IvTD9ohp1G+u5a9qZgsS37L2//L0A0Zmf7nRnL1AVJgaSBnAlo8
	lq/+B6wko9B0UVyI8Gjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwlNz-009gWY-KY; Mon, 13 Dec 2021 13:28:59 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwlNl-009gSI-3m
 for linux-amlogic@lists.infradead.org; Mon, 13 Dec 2021 13:28:46 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 137so11899860wma.1
 for <linux-amlogic@lists.infradead.org>; Mon, 13 Dec 2021 05:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:subject:to:cc:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=23RiMUONgxSu+hkWm+3dwrf+Dsp2HM7Sz/XZAGIt32k=;
 b=Mz061YGBwILW/EknAdMN9Q0Bd8GfMCdJaLVUfzm8Ozk/K2O79v+pTnj40XcvWnRM2Z
 DpF7uzprvcKTJEWgtP0LkKLUJByB6crM5gvWaC7R56cHJgJ/0hD0VS8U52RwbBENrO+n
 o4Hkdg1Mc8QlDA5FwlDmulkQ8fvDjwghzCyObPpU6R6IbEXMq8IAg2M4JmA2nrPqCKZJ
 7H2j82O+PZ1Vk7Ya2jLupKEZtPrqUu5vND/F3t3gc8R7RLfuQQROGTsEvW8d3oYs8q06
 hSzuAoP81D/HIDQjFadHZHYTU9zp/qJnYIc+6csbx8Wf2tLymApV7y8UZMV+MQLrOIIL
 1maA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=23RiMUONgxSu+hkWm+3dwrf+Dsp2HM7Sz/XZAGIt32k=;
 b=bgcKHxAdOeg59zaGKeIwXAUr5xMJVKMjJQqLgrZfjGzy1qkcxifTZIhk0ZQrYbpKUk
 Wb72qVpW8djlrpOilNcuCvmcZlGvKN/a8tv7MYYiKZwp9ZOWFcQ0VFNVA8gwqFfCn1PI
 NMcGxFvcfJmep5OH7SZbzGuFVdIS7vbyi9q5XXZZ/zEyex4xW755zWlw87iqbiNHTQAe
 7rWiyF2k45+0d5rFxMMcdx2k23jCVpTLqXU5yGa5Hc8epe5ND7M+XOym0UTYdJgyP2JU
 dLmK9gBjnjk+qknL4QPThALw3U2wWp41+KC7NHJvISTpqgDJ6XGesCcAmwoXd2jdG7D5
 DAOA==
X-Gm-Message-State: AOAM532KbCTJaZX52GXKGarWjKllEFWDx4VlMiQifpmRwC6M5o4FTv3V
 maduSnw9UiW52RsK98u/9QD4in7X0ntsE4d8
X-Google-Smtp-Source: ABdhPJzIBUb6/PVRo+jPBPQcxeKDX3aJlABs5tPk/R0darWP3ToaP2ZpcDX1G931Y4UAqLc2BRQRFA==
X-Received: by 2002:a05:600c:1f08:: with SMTP id
 bd8mr13796805wmb.77.1639402122128; 
 Mon, 13 Dec 2021 05:28:42 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:3328:f8ef:d20f:532a?
 ([2001:861:44c0:66c0:3328:f8ef:d20f:532a])
 by smtp.gmail.com with ESMTPSA id n33sm7359713wms.46.2021.12.13.05.28.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 05:28:41 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] arm64: dts: amlogic updates for v5.17
To: soc@kernel.org, arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Organization: Baylibre
Message-ID: <f47b9b95-6cde-d2f8-eb36-78777d449920@baylibre.com>
Date: Mon, 13 Dec 2021 14:28:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_052845_171775_32DB9B05 
X-CRM114-Status: UNSURE (   9.54  )
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

Hi,

Here's a set of Amlogic ARM64 DT changes for v5.17, with minor fixes and additions.

Neil

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v5.17

for you to fetch changes up to 0a62b3cc0af9322e650fe89bea0bacdedf01960a:

  arm64: dts: meson: p241: add sound support (2021-12-01 10:27:13 +0100)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v5.17:
- Add missing cec nodes for Odroid-C4 & HC4
- Fix thermal-zones indent for G12/SM1 SoCs dtsi
- Fix GPU OPP table node name for G12/SM1 SoCs dtsi
- Fix SPI NOR Flash node name for Odroid-N2/N2+
- Fixes for GXBB Wetek boards:
 - Fix HDMI supply
 - Add missing gpio bindings include
 - Switch to new LED bindings
- P241 additions:
 - Add VCC 5v regulator
 - Add sound nodes

----------------------------------------------------------------
Alexander Stein (3):
      arm64: dts: amlogic: meson-g12: Fix thermal-zones indent
      arm64: dts: amlogic: meson-g12: Fix GPU operating point table node name
      arm64: dts: amlogic: Fix SPI NOR flash node name for ODROID N2/N2+

Christian Hewitt (3):
      arm64: dts: meson-gxbb-wetek: fix HDMI in early boot
      arm64: dts: meson-gxbb-wetek: fix missing GPIO binding
      arm64: dts: meson-gxbb-wetek: use updated LED bindings

Dmitry Shmidt (1):
      arm64: dts: meson-sm1-odroid: add cec nodes

Jerome Brunet (2):
      arm64: dts: meson: p241: add vcc_5v regulator
      arm64: dts: meson: p241: add sound support

 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  | 112 ++++++++++-----------
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |   2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi  |  10 +-
 .../boot/dts/amlogic/meson-gxl-s805x-p241.dts      |  83 +++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |  14 +++
 5 files changed, 162 insertions(+), 59 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
