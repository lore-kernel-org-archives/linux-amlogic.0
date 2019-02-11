Return-Path: <SRS0=yrQE=QS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B78C169C4
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Feb 2019 20:55:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01BC22070C
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Feb 2019 20:55:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NKMFYpJw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ev90o9jO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01BC22070C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0koC+KN3mReibm6+RRhMkhKvxtI6bmTeAivOR2kMizc=; b=NKMFYpJwgRAzCJ
	911ByvhKjH4L3/kWRRW4MBARjc3M/SS4d+Qv5bvCxmBhHW1VzvFqSuqwStkq8nv8gyxJTpwdi8gFe
	tk5TkmIV/x3ZX3zgpv10NOBhVfjm15kUFnSpiukqSv9DpYZMk0uq6ZYLpfSOPIb+Z7xbM4kzjZYZ8
	xes9bI/922QCLCTdOBkpgZc8AUGmk/6f2pRMeF3TsyK+qk6arSRktMepJ/BG4M9U4Fd6wK+pLpe0I
	2wv8PmlOA39OvWzdQoNCfGIm4XPU+r3dCyw4CDCpxaqQaO3jOfx9t1Eb8ASyQCFHZUCbmXJhi58t3
	JBZaodyKb5SvWq+c+1YA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtIbv-0005BV-AM; Mon, 11 Feb 2019 20:55:27 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtIbk-00052j-Sx
 for linux-amlogic@lists.infradead.org; Mon, 11 Feb 2019 20:55:18 +0000
Received: by mail-pl1-x642.google.com with SMTP id 101so128395pld.6
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Feb 2019 12:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=E3gZYhDje6E0IaT/EBnoBjaOI7w1TyLiJ9nD64YIpPs=;
 b=ev90o9jOUfjEwO+40mFYQObk4hqfBs8sEPvlH3fK4YumWZZOywBcOxQcBgUm3OYc5V
 PLJ4FcuI+50B4VzHTri/9bs2KUYatA3QrXX/MgL9IhT3VbA9TFnfcuRBjWd7qqKpGAmC
 Fnd2KGOfJnWi138eb0wq1iNkd8UYGdPwyin63HWkUQ8YeO4z5sZ6hIquyxpuK6mpCzvj
 hMxdYGYn/zxM7N3Ex+iOdOzpJ/lmTkDZ+HtKl+Q2BdZPisM1lWv16wPZuNjj5swn00Ni
 ySUSgSDCWON+vpBmZSMl0pOB0LbnvaWSc6ByZavovx5ZP4Nb/GEURupf7Ie5cnnTVFC9
 KI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=E3gZYhDje6E0IaT/EBnoBjaOI7w1TyLiJ9nD64YIpPs=;
 b=U/ZOfFVF3v80RGIOvLqdJBejMHgAGT+yKrQ2sEh3GDbAQbL6nHKqxI9TR7+th1uhu9
 9RK2PEEqCfQlt1Ye4X1VIpZTnKMvvaNZxo8NCUdyBMMgHZONAHXTW6kI76dvKtBjDKNc
 A2YsoEDOVZGvh0Gl0kLQtM9qjiqZ0pkwdFtkk9eMFFhfYTR2oE9F8xpNvH3Tz1faAW7h
 C01vcAn2Qi6mQDztMm90SD/5wBRqfT7x0ldSKjSd9ROBmZX3NqoFV5ShYDh5JthF0h3a
 G46swVufvy1xeA77kSH7YdwC/2SqBkYTv8V8krzFdgPIABEYvMyXqDQfU4276ZFuHZR8
 COQw==
X-Gm-Message-State: AHQUAubtvX/uMVPvuPSfiE6eQl3lQtKYYdLF7q9ObVPo/1J6nco+wK58
 4cZde8HiswOC5I4LxSR/wkk/dvKQlyo=
X-Google-Smtp-Source: AHgI3Iagp9I1AgPzkkj4EQl+YHedjQPi3PruyOczQZPSBR23qEtp3Oz5DGHWojfzLxoLDeM71PfcJA==
X-Received: by 2002:a17:902:bc47:: with SMTP id t7mr176270plz.13.1549918516020; 
 Mon, 11 Feb 2019 12:55:16 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:1d1:285e:6b85:3bfc])
 by smtp.googlemail.com with ESMTPSA id
 z127sm19484620pfb.80.2019.02.11.12.55.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 11 Feb 2019 12:55:15 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: arm@kernel.org
Subject: [GIT PULL] ARM: dts: Amlogic updates for v5.1
Date: Mon, 11 Feb 2019 12:55:14 -0800
Message-ID: <7h36oudozx.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_125516_939872_3B16CCEA 
X-CRM114-Status: GOOD (  10.05  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt

for you to fetch changes up to 99f0619b0d0d87f921b05f0b7e43ff2e080a4fcc:

  ARM: dts: meson8b: ec100: add the GPIO line names (2019-02-11 12:52:26 -0800)

----------------------------------------------------------------
ARM: dts: Amlogic updates for v5.1
- more features for Endless EC100 board
- chip temperature sensor support
- fix ethernet pins
- add Mali-450 GPU

----------------------------------------------------------------
Martin Blumenstingl (17):
      ARM: dts: meson6: add the APB2 bus
      ARM: dts: meson8: add the APB bus
      ARM: dts: meson8b: add the APB bus
      dt-bindings: gpu: mali-utgard: add Amlogic Meson8 and Meson8b compatible
      ARM: dts: meson8: add the Mali-450 MP6 GPU
      ARM: dts: meson8b: add the Mali-450 MP2 GPU
      ARM: dts: meson8b: fix the Ethernet data line signals in eth_rgmii_pins
      ARM: dts: meson: switch the clock controller to the HHI register area
      ARM: dts: meson8m2: use the Meson8m2 specific SAR ADC compatible
      ARM: dts: meson8: add the temperature calibration data for the SAR ADC
      ARM: dts: meson8b: add the temperature calibration data for the SAR ADC
      ARM: dts: meson8b: ec100: add iio-hwmon for the chip temperature
      ARM: dts: meson8b: odroidc1: add iio-hwmon for the chip temperature
      ARM: dts: meson8m2: mxiii-plus: add iio-hwmon for the chip temperature
      ARM: dts: meson8b: ec100: enable the Ethernet PHY interrupt
      ARM: dts: meson8b: ec100: improve the description of the regulators
      ARM: dts: meson8b: ec100: add the GPIO line names

 Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt |   6 ++++++
 arch/arm/boot/dts/meson.dtsi                              |   7 +++++++
 arch/arm/boot/dts/meson6.dtsi                             |   8 ++++++++
 arch/arm/boot/dts/meson8.dtsi                             |  89 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------
 arch/arm/boot/dts/meson8b-ec100.dts                       | 127 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/meson8b-odroidc1.dts                    |   5 +++++
 arch/arm/boot/dts/meson8b.dtsi                            |  83 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts                 |   5 +++++
 arch/arm/boot/dts/meson8m2.dtsi                           |   4 ++++
 9 files changed, 317 insertions(+), 17 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
