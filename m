Return-Path: <SRS0=Lc8Q=QF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6CD0C282C7
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jan 2019 15:06:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 876182184D
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jan 2019 15:06:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tzE2C6pf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="oeTPzLfQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 876182184D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XHmYJ9Q8CEr19FeWyhshJVGtIo5RiNICFNsRrSrqk/k=; b=tzE2C6pf7S+5FN
	I6Wwtygg2YqSFWwf6D2POWb67r+pRKzgPmy8pQ6dds4YeQkaGNXkGoXnFgFcf+Ct+Fnm423Vv45EA
	DDg/mkGV0fX5N567YP4Oq6pX78mMjAY36FhGFmts9X2lrKJkeP2894r5EbfeSrX1rNSbxwU1IR+ME
	YREctNwgt9Tvmzd9tX+P7E+KpF0Yef64ioQFXsAY+Fyxka10TVoM8e5sWz3QA32daSni/a/LtRq4y
	7apjMDF1Z2OFW1aVJqCkrBedMLQQ0FpRQsZjl9vp3bzwezuRGEe3pYL5lW9LFpzvYwD+/ThQU4Zrm
	bXZmUMjFmUPlgK6KbBUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goUyJ-0006WX-D9; Tue, 29 Jan 2019 15:06:43 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goUxx-0006Bv-4r
 for linux-amlogic@lists.infradead.org; Tue, 29 Jan 2019 15:06:26 +0000
Received: by mail-wr1-x442.google.com with SMTP id r10so22417583wrs.10
 for <linux-amlogic@lists.infradead.org>; Tue, 29 Jan 2019 07:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=OLlFYobvrVCEvJ/v10DiH4jgeYW49SGz+qMGFPAwork=;
 b=oeTPzLfQ1PI6hEU7/MZAVvqosyQ5/M72gnKTRrcyWXR5C08A9baQ8QTRwTz5kkOx7D
 9eVhKYnCm0EEjS0eozWL17lh/RxYKvk/RGstvx+RKF+cgefQiNbLw7jfxgCWxzeMcRfL
 At6FlPf6MpsQa8zRhYnjZCR0nV8jaieVHpze0aaQRT7RVGpAa1s7C9XGYYQQ4SymcLh0
 eEHaPT11nRlBF3p8PmPq7KOcAsGuNcgt9Kbb69X8geSR3G6x3lF47kP+ABaA31cc1+Sy
 AgSyYKsHp+fURKi+dh1PUJsAdKK2nPGBLpeMjPOLi14V4VTBvT6Ld0OBWisrUGdyvI+Z
 bChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=OLlFYobvrVCEvJ/v10DiH4jgeYW49SGz+qMGFPAwork=;
 b=aF/KXasse4SeACiEpE7gENN48CjOShRErDIlcmkTA0I2nihvXFmiu5ZYIq6LUe1yjt
 eVeqGYp+AmV+Ft3fj1Pakm5/mnx8prManj9sJ35GIUR44x8YuUOS3CL9JK9eMfJ2AUoh
 opizVyDI5DhMVWW9chDbUg6EO72aGN74aogahrYNJ8xfHsyoUFP6QfwaYc0zU6KiRSqk
 cwMzkilcuHsAlDxs9HVmi3WPmIROWVSDYMRdRr5TiesvFcMSutm0VEVNQYVMik8kaRc1
 R5ue0KzNotYhxMmqzogbfblcYJUgpKk4JyfpqSmQm97OEjJZKGeWsNf2HKoPb3YwMfs2
 CbSg==
X-Gm-Message-State: AJcUukcsNbtGBg5Qynmhpg6WIHrOKAvsJBdqtCjC1Tp2TgRG+jVKFY6e
 XJbB9Dqz4VJABzoCN8UYmJ1zsA==
X-Google-Smtp-Source: ALg8bN4qMyOdqX0ZXW8+zv7IaYrO8aLSJ1pm8WZVte3+zfDZnOGYNDYFYJKGdySWTM7xrTBOLyzUVg==
X-Received: by 2002:adf:80cf:: with SMTP id 73mr26225724wrl.57.1548774378089; 
 Tue, 29 Jan 2019 07:06:18 -0800 (PST)
Received: from localhost (aputeaux-684-1-12-29.w90-86.abo.wanadoo.fr.
 [90.86.215.29])
 by smtp.googlemail.com with ESMTPSA id l6sm107476541wrv.70.2019.01.29.07.06.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 29 Jan 2019 07:06:17 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: arm@kernel.org
Subject: [GIT PULL] Amlogic fixes for v5.0-rc, round 2 (redo)
Date: Tue, 29 Jan 2019 16:06:16 +0100
Message-ID: <7h1s4vpkpj.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_070621_668933_BBAC28F9 
X-CRM114-Status: GOOD (  10.18  )
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

Olof, Arnd,

Below is a redo of round 2 of Amlogic fixes for v5.0-rc, based on top of
the first round.

This drops the a couple fixes as requested by Anand Moon so he can
rework them.

Kevin


The following changes since commit 19a220dd1e8a1b1d8e5e2f8f4a25313c4b02d527:

  arm64: defconfig: enable modules for amlogic s400 sound card (2019-01-08 15:27:50 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-fixes-2.1

for you to fetch changes up to f29200c8b1e267b109242677ae7f2146c7682d14:

  arm64: dts: meson: Fix mmc cd-gpios polarity (2019-01-14 07:59:40 -0800)

----------------------------------------------------------------
Amlogic fixes for v5.0-rc, round 2
- several fixups for the GPIO cd-inverted change
- IRQ trigger fixes for MAC IRQ

----------------------------------------------------------------
Carlo Caione (1):
      arm: dts: meson: Fix IRQ trigger type for macirq

Loys Ollivier (1):
      arm64: dts: meson: Fix mmc cd-gpios polarity

Martin Blumenstingl (3):
      ARM: dts: meson8b: odroidc1: mark the SD card detection GPIO active-low
      ARM: dts: meson8b: ec100: mark the SD card detection GPIO active-low
      ARM: dts: meson8m2: mxiii-plus: mark the SD card detection GPIO active-low

 arch/arm/boot/dts/meson.dtsi                                   | 2 +-
 arch/arm/boot/dts/meson8b-ec100.dts                            | 3 +--
 arch/arm/boot/dts/meson8b-odroidc1.dts                         | 4 +---
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts                      | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi            | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts           | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts         | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts            | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi               | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi           | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi              | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts   | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts    | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi          | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts          | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts            | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts             | 3 +--
 18 files changed, 18 insertions(+), 36 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
