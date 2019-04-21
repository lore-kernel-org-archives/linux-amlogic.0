Return-Path: <SRS0=TOuI=SX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B84C10F14
	for <linux-amlogic@archiver.kernel.org>; Sun, 21 Apr 2019 14:52:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81CEA2087B
	for <linux-amlogic@archiver.kernel.org>; Sun, 21 Apr 2019 14:52:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pzsPfi1R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Bbifgh/U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81CEA2087B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fMK4xVge8N/SOC3MZVYB2HOSoVyKryR38Kfvt50wBp8=; b=pzsPfi1RRoWTR5
	k2UwM/M765SJAS05Qb8wkyoxMCPxeKrBUHZrQDEeYYFYMhAR+T840HRKfE4s4JB0rr7LAW2eOJGYC
	oO+rxvf/yFuYQi0dF6QddzMeftRGBLVEnPi4nW+QII1lNMjN0KYxtYFRboa1wa7bA6ZbVomvYIcdn
	OCZ6fjpHuCMPoJ3WDdaTXc7sAbjK2+L9MNj9zPTnj6CRS0w9n1950hIOjVJooRIaJL0x8IwB8gLDM
	gPk45TwNatyU+8oEzFcq3RRfrVvqTIBRN5pbEHmcEw538Mj5iZSx6yLTqBHRUPl2FH+XaX9M4egaD
	sxQp8t9E8GTGnUM7bdBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIDoy-0002w7-5U; Sun, 21 Apr 2019 14:51:56 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIDop-0002pR-41
 for linux-amlogic@lists.infradead.org; Sun, 21 Apr 2019 14:51:49 +0000
Received: by mail-pf1-x443.google.com with SMTP id 10so4547801pfo.5
 for <linux-amlogic@lists.infradead.org>; Sun, 21 Apr 2019 07:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=vg7Ja3GBeQXXPyDXu5NWdWtJr9JDFnG734Hx1rjbZ+Q=;
 b=Bbifgh/UKQS5LfQ6UFOKjFZmvODabIoCicx9+NB99aEb4c2PT35KXRbZaS9d7Qt87l
 GHTPzehr/ZZgIhzd3hkHs9IjjG+BS7dfWIoT7J0MCKxDtPZIvfSBL8tDCr0S1mEI/QpO
 qFydrRMFPMNJWM+0jiF2clGH/Pc2f1YpyLtBaHMRW829qqyydGIjS09vyfh4vm3daw70
 XPYCxL7C2AtL1g7dWn+D8JCvrvW0YO6wTyNdQ2FPrDIvXO16H09QHU/gmEICcfnxl61d
 ngG37JPFFLpkjvCasgxlLZbfjMRAFYrV8U1urFCl+BR8Vkyz+WC6UyVQNuRHz35Sy7EL
 O+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=vg7Ja3GBeQXXPyDXu5NWdWtJr9JDFnG734Hx1rjbZ+Q=;
 b=mcBdGkOVyOP4VSAcTi6E4YkGqjio+InMGZclQk3LtUnMXVnbTiJG929oKvK3ETRjSr
 i+BnzGYZDk/Eq8RK9lqMU9x3+W23/sqPMNdGLZs2bZsS1H5Hs064K3WY9FLGGrOuWJmW
 snyQ9aeogAsfsj8rt1q6mUATQGWeEFSCTFmrk/GjI2VSvz6mpjRVQAI4M1mpV1EB61eE
 dsaUaCJbIHOsI+tcR+BvneAE9WtespuTXBsFaKKSsQhnwMZbllWYdU9NIKFIh07VdU5p
 erH0SE8Kd9PXjED/Djr8ri38/SVG+WpjrEdrfDVO+61urh+QK9mgMcEO5GXZhBKL74m8
 JUHg==
X-Gm-Message-State: APjAAAWKPCINyaBMQEw+hEmTotre83JEJnCWwbtfdSZu7lHnXiBQKwke
 yiO6pBXvOOsHgtPSv0s/McTUbQ==
X-Google-Smtp-Source: APXvYqy7EyQn8jC/T2PRfkPahaNKTPAnjClFpmxW7DEtLUE3dLb9jVCINKE0+X+KadSmfxyzIbCNhw==
X-Received: by 2002:a62:aa06:: with SMTP id e6mr15471499pff.254.1555858304899; 
 Sun, 21 Apr 2019 07:51:44 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:6d49:9ddc:13aa:21c9])
 by smtp.googlemail.com with ESMTPSA id f87sm16643247pff.56.2019.04.21.07.51.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 21 Apr 2019 07:51:44 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: arm@kernel.org
Subject: [GIT PULL] arm64: dts: Amlogic updates for v5.2, round 2
Date: Sun, 21 Apr 2019 07:51:43 -0700
Message-ID: <7hmukj9zsw.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190421_075147_159740_AB544B53 
X-CRM114-Status: GOOD (  11.91  )
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

Here's a 2nd round of changes for the 64-bit SoCs from Amlogic.

Note that in order to support display/gfx and USb on these, there's a
dependency on new clocks and resets also added this cycle.  Those
dependencies are already queued in the respecitive maintainer trees for
v5.2, and I've merged those tags into this branch as well to avoid any
build breakage.

Please pull,

Thanks,

Kevin


The following changes since commit e2cffeb398f4830b004774444809ee256b9bc653:

  arm64: dts: meson-g12a: Add CMA reserved memory (2019-03-29 14:19:42 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64-2

for you to fetch changes up to 659f2563d323b09ca12b0e70bb6a50c1b25af3ee:

  arm64: dts: meson-g12a-u200: Add support for Video Display (2019-04-16 11:21:46 -0700)

----------------------------------------------------------------
arm64: dts: Amlogic updates for v5.2, round 2
- add display/gfx support for G12a boards
- enable USB for g12a boards

----------------------------------------------------------------
Christian Hewitt (1):
      arm64: dts: meson-gxm: Add Mali-T820 node

Jerome Brunet (2):
      dt-bindings: clock: axg-audio: unexpose controller inputs
      arm64: dts: meson-g12a-u200: add regulators

Kevin Hilman (2):
      Merge tag 'meson-clk-headers-5.2' of git://github.com/BayLibre/clk-meson into v5.2/dt64
      Merge branch 'reset/meson-g12a' of git://git.pengutronix.de/pza/linux into v5.2/dt64

Martin Blumenstingl (3):
      dt-bindings: clock: meson8b: drop the "ABP" clock definition
      dt-bindings: clock: meson8b: export the VPU clock
      dt-bindings: clock: meson8b: export the video decoder clocks

Maxime Jourdan (1):
      dt-bindings: clk: g12a-clkc: add VDEC clock IDs

Neil Armstrong (19):
      clk: meson-g12a: add cpu clock bindings
      clk: g12a-aoclk: re-export CLKID_AO_SAR_ADC_SEL clock id
      dt-bindings: clk: g12a-clkc: add PCIE PLL clock ID
      dt-bindings: reset: meson-g12a: Add missing USB2 PHY resets
      dt-bindings: clock: g12a-aoclk: expose CLKID_AO_CTS_OSCIN
      dt-bindings: gpu: mali-midgard: Add resets property
      dt-bindings: power: amlogic, meson-gx-pwrc: Add G12A compatible
      arm64: dts: meson: g12a: Add SAR ADC node
      arm64: dts: meson: g12a: Add G12A USB nodes
      arm64: dts: meson: g12a: Add mali-g31 gpu node
      arm64: dts: meson-g12a-sei510: Add ADC Key and BT support
      arm64: dts: meson-g12a-sei510: Enable USB
      arm64: dts: meson-g12a-u200: Enable USB
      arm64: dts: meson-g12a-x96-max: Enable USB
      arm64: dts: meson-g12a: Add VPU and HDMI related nodes
      arm64: dts: meson-g12a: Add AO-CEC nodes
      arm64: dts: meson-g12a-x96-max: Add support for Video Display
      arm64: dts: meson-g12a-sei510: Add support for Video Display
      arm64: dts: meson-g12a-u200: Add support for Video Display

 Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt        |  14 +++++
 Documentation/devicetree/bindings/power/amlogic,meson-gx-pwrc.txt |   4 +-
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts                 |  88 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts                   | 145 +++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts                |  59 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi                       | 282 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi                        |  27 ++++++++++
 drivers/clk/meson/axg-audio.h                                     |  20 +++++++
 drivers/clk/meson/g12a-aoclk.h                                    |   2 -
 include/dt-bindings/clock/axg-audio-clkc.h                        |  20 -------
 include/dt-bindings/clock/g12a-aoclkc.h                           |   2 +
 include/dt-bindings/clock/g12a-clkc.h                             |   5 ++
 include/dt-bindings/clock/meson8b-clkc.h                          |   6 ++-
 include/dt-bindings/reset/amlogic,meson-g12a-reset.h              |   5 +-
 14 files changed, 654 insertions(+), 25 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
