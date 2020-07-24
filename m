Return-Path: <SRS0=y/h1=BD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F0F2C433E4
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Jul 2020 19:34:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70DA6206D7
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Jul 2020 19:34:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vap8ZSlV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NMAaAOih"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70DA6206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p+odo0Ic+G+Qc2tEIMivizscB6c5i6g/cxaMnhvEHKg=; b=vap8ZSlVx/u23eNVsVdkeQcS+1
	lvKGm9VTVy5eUOB0F33c9ttAn8WCETb8gsblfNM/ACnE4wAkmt8CS7MADP2khUNtiEvjF+1jLmZmk
	sh/+aIkG2oK5bqT5ZA5rirgWV7nKLKjyiFWlKcz2bF+t0j4VN8kQ2rKSXLqMv3SSt3UdQ7tIGK5kW
	JnaHxNcGeyaezYSsMcF4WsnDqEfNqQoOkOiLEfGTb5XtZrPZZFi3k4XqAq5ywdkb/qwyPdxzdLFZH
	V8pAp4IzQlfUKUhbQVR+bIPvmmzD9LBy7dxelE0JYzCPbiyoaAqi3pn8AKNtjmcbr0HjjlYhQlLpf
	f7YKKNvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jz3St-0003NL-0I; Fri, 24 Jul 2020 19:34:43 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jz3Sq-0003MS-Uo
 for linux-amlogic@lists.infradead.org; Fri, 24 Jul 2020 19:34:42 +0000
Received: by mail-pg1-x542.google.com with SMTP id w2so5876352pgg.10
 for <linux-amlogic@lists.infradead.org>; Fri, 24 Jul 2020 12:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=UkfGCPDv6/4XwldyIZfxfs3il0UL6u6K3tEwTsy+SyE=;
 b=NMAaAOihB6sFkoOfOPbchIm+TY1ZSG8O1XIdIu9h7Ke0ma8CeBXpRblbWyw4DaEz23
 NCqJjAUfZ3iNbC5B6gIZVHEnPqHSGqCMQqKUCVS0Yfdm60dTGV6Zy5LzWJ5G4sFc3qGr
 O79LbQgEknbgo0hKkEFgXxCVBIfWKYIhQowctlMLOyVOx9rH9YhIiknMhPkrBxqMTqVq
 CcHir16SexRV+qKqjmgdwXApImn/nGLU6G1nY/FcEyEFlaui7YtpoDHUmbt8ZXeDkTLd
 jkZWJ7ckSNUHp+w/E1FnLNGOebAEWxf2Yw5WqBc37vzpPWrLl0mpwl3mP8Oip0rEewRg
 y02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=UkfGCPDv6/4XwldyIZfxfs3il0UL6u6K3tEwTsy+SyE=;
 b=gAFl3kLhU0MZzMgHdC2j0b6ARCUVd47f7Yuvu1wXpT1x9dBt0vmC25pYCNIC7Vxpil
 wy5T2N5KlLUHElNzBILSj+Blwz3y/regWcIdAZOAY0wwkVzRqZxxThngAILS9Y5fwnsj
 iPeUzyR3c9Px5TdUCXD81xLOhx3QTEfpQdcIzEq7jDyyk55mADjEF+cMzBZZP26bdkLI
 zTThGMG+1qWNMELaADFUa1uk8cBxqdhHIIbNgAnE40zQMI0PiKlAf+e9AE5dKKVF/KBk
 9w4LaaHhBxjchN30zAYNV750l3eo3HT5ONctFGqozezgwXyPuph37X9dZma8yY05+xK9
 tGCA==
X-Gm-Message-State: AOAM5316vno8S5UVher5xnnLKLEHWwghRcOcjTltoiCxpg4xcbAuGIZA
 tNqhD+i/ZOW/4Bk/+QRp3S+j3g==
X-Google-Smtp-Source: ABdhPJy3m/Jg6VLgGB19nA+IZjymdeacc1lMbOBRwHNb6G+jJD8A8SRixVjs2Hs0CM35u5zWwd+CHw==
X-Received: by 2002:a65:5649:: with SMTP id m9mr9588114pgs.279.1595619278441; 
 Fri, 24 Jul 2020 12:34:38 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id y18sm7201242pff.10.2020.07.24.12.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 12:34:37 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] arm64: dts: amlogic: updates for v5.9 (round 2)
Date: Fri, 24 Jul 2020 12:34:37 -0700
Message-ID: <7h8sf8671u.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_153441_049594_1589D46E 
X-CRM114-Status: GOOD (  10.28  )
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
Cc: linux-amlogic@lists.infradead.org, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Arnd, Olof,

Here's another round of DT updates for Amlogic SoCs.

A couple of these had dependecies on some earlier fixes, so you'll
notice that the amlogic-fixes tag (which I already sent) is merged here.

Please pull.

Thanks,

Kevin


The following changes since commit 32b5f4b63487a24712c3bfa1d6a8eb9257beb8bd:

  arm64: dts: amlogic: Add the Ethernet "timing-adjustment" clock (2020-07-13 11:57:46 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64-2

for you to fetch changes up to 916a0edc43f03f86b13fbc9943e5dc936671ea6e:

  arm64: dts: amlogic: meson-g12: add the Mali OPP table and use DVFS (2020-07-21 14:12:38 -0700)

----------------------------------------------------------------
arm64: dts: amlogic: updates for v5.9 (round 2)
- new board: WeTek Core2
- audio playback support on more boards
- add GPU DVFS

----------------------------------------------------------------
Christian Hewitt (6):
      soc: amlogic: meson-gx-socinfo: Fix S905X3 and S905D3 ID's
      arm64: dts: meson: update spifc node name on Khadas VIM3/VIM3L
      arm64: dts: meson: add audio playback to odroid-c4
      arm64: dts: meson: add audio playback to khadas-vim3l
      dt-bindings: arm: amlogic: add support for the WeTek Core 2
      arm64: dts: meson: add support for the WeTek Core 2

Jerome Brunet (1):
      arm64: dts: meson: add missing gxl rng clock

Kevin Hilman (1):
      Merge tag 'amlogic-fixes' into v5.9/dt64

Krzysztof Kozlowski (1):
      ARM: dts: meson: Align L2 cache-controller nodename with dtschema

Martin Blumenstingl (3):
      arm64: dts: amlogic: meson-gx: add the Mali-450 OPP table and use DVFS
      arm64: dts: amlogic: meson-gxm: add the Mali OPP table and use DVFS
      arm64: dts: amlogic: meson-g12: add the Mali OPP table and use DVFS

Neil Armstrong (1):
      arm64: dts: meson-gxl-s805x: reduce initial Mali450 core frequency

 Documentation/devicetree/bindings/arm/amlogic.yaml           |  1 +
 arch/arm/boot/dts/meson.dtsi                                 |  2 +-
 arch/arm64/boot/dts/amlogic/Makefile                         |  1 +
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi            | 49 +++++++++++++++++++++++++++++--------------
 arch/arm64/boot/dts/amlogic/meson-gx-mali450.dtsi            | 61 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi                  | 51 ++++++++++-----------------------------------
 arch/arm64/boot/dts/amlogic/meson-gxl-mali.dtsi              | 46 ++++++++---------------------------------
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts         |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x.dtsi             | 23 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi                   |  5 +++++
 arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts        | 87 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi                   | 45 ++++++++++++++++++++++++++--------------
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi           |  2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts       | 88 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts          | 88 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/soc/amlogic/meson-gx-socinfo.c                       |  8 +++++---
 17 files changed, 447 insertions(+), 114 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gx-mali450.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805x.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
