Return-Path: <SRS0=Ixac=WW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB2CC3A59F
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Aug 2019 11:55:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B43BF2070B
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Aug 2019 11:55:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YcHkq7HW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nLBZKlrp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B43BF2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Um6kOdtR/uooEsZPzaBMl4f+X5juD6K4B88MFlLbLhQ=; b=YcHkq7HWyPWU2o
	zWcpDP7nvaavnkbyFiKIGcqbknaC23ph9RFnFnWfPDCt9Z5j3fFD4L/ZbrtvpYX5IOy7oirhA0o9b
	YUMGvqGcmvwQp+8e9vaLPRzhccKxk3p1z3BI+RNkOICW5SN//7To/z+6PXkUtenbnzno+w+RrZdjS
	GaLfbyqDsmsei8G/pdoVV+aMXsyOoEGZ0YmfFmPPcMiXlUpZDqKLSMoqdgkUG7njPCiP1h1V4RmWa
	Eemf8YKPVzNWvGm7tsVW6mFHbMv82u61LxRhz9JNVOiZfbVVgEyjZHeIHOWZzBIL4p90uJ1XWYHMt
	AkFB7q4+Xr3gCq780L9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2DaJ-0000QQ-OV; Mon, 26 Aug 2019 11:54:55 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2DaG-0000Kn-Kk
 for linux-amlogic@lists.infradead.org; Mon, 26 Aug 2019 11:54:54 +0000
Received: by mail-wm1-x334.google.com with SMTP id o4so15177330wmh.2
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Aug 2019 04:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=mIqaLu1SfbTpcrgwTVGCf5VhKM6jJiI/OPInMvNVNQk=;
 b=nLBZKlrpvXm1nWOcbAsECca5e0S2Ae/0uyRtQYoXtsFLBnsa2+6YrtEt7b1adoQdrQ
 pv2PWNPeyCm9jX6k5iPXbVDs4K49YAtBcVG6OCWIiU4Ih3P47bimIX/ZB2W0pDx/Phbv
 r3jYbGsbC1ilCY4PpFU2krNt1Q9RAAKQjEcKSaBp1oBtmP5zToFNrootvjxWgq7vJwe5
 Hp2PvnsUz+KIOQ/vUFptnZNee3tC6vm9ZluGib9JQmWotzVr7SpHn9clwtL0nb203BQA
 mjJvqlgGOth3gUiRFj3jB+OWaIQszRibZ1mdkCQgXWr2cnM0dfdEPX7uxsbGVa+uiCtR
 xhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=mIqaLu1SfbTpcrgwTVGCf5VhKM6jJiI/OPInMvNVNQk=;
 b=KnbLg48bI6VpZ9pUHL/yCt7WAcXERhIk+5DMPjEGBMc6gGoYTcHRPvg9mEJ8yGF9TQ
 ig4d3n4Jv/ekLS6jnUqEXj29n4wFiPeXqxVb9wZH0x+XjXVpfkJrHpp1l5qlRBJ8LPcY
 FollReKC0BHb/4htwK5L9RfiuPi1hiHD3HhMdNEStV15v8eUN5d0O+clbu4Y9nWxlCGv
 YhTQ1iLAyYhLiupirqnXO0zdHY9U7BL1C5vomMAoKzPqKpa86elLH6KFvCxkYC/vw33q
 Ofy/GHlv3+Ir6B072CfCxY9DDWAtUYoyZ/Y7qa+UqdlkXeslsk+ATmaC4fP4C989uBkF
 advg==
X-Gm-Message-State: APjAAAUx1NYBm6QrYC7iT+7QYlWMf1UbYK5jszSHJZj95hon3ETLaASE
 9QbVPnK/vRGjx+ly6dM6+u0hnA==
X-Google-Smtp-Source: APXvYqwZZ+OBS8TLO989Qm5py1pa4UCf/gKyA4eL6sJJOOXQTSkJpV+ttv3x/MrQpX4ILXdpkX3nmw==
X-Received: by 2002:a1c:9e4b:: with SMTP id h72mr20358120wme.99.1566820490663; 
 Mon, 26 Aug 2019 04:54:50 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f134sm20897712wmg.20.2019.08.26.04.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 04:54:50 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [GIT PULL] clk: meson: 2nd round of updates for 5.4
Date: Mon, 26 Aug 2019 13:54:49 +0200
Message-ID: <1j8srg6t12.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_045452_812406_55C4DA30 
X-CRM114-Status: UNSURE (   9.52  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


Dear clock maintainers,

Below is a request to pull another batch of Amlogic clock updates for
v5.4. It brings reset support in the for the g12a audio controller and
sm1 support in the main clock controller.

Cheers
Jerome

The following changes since commit 1d97657a4794ab23b47bd9921978ddd82569fcf4:

  Merge branch 'v5.4/dt' into v5.4/drivers (2019-08-09 12:12:58 +0200)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.4-2

for you to fetch changes up to da3ceae4ec9f581a50dc0763710078f22d3bc72a:

  clk: meson: g12a: add support for SM1 CPU 1, 2 & 3 clocks (2019-08-26 11:04:54 +0200)

----------------------------------------------------------------
Amlogic 2nd round of clock changes for v5.4

* Add g12a reset support to the axg audio clock controller
* Add sm1 support to the g12a clock controller

----------------------------------------------------------------
Jerome Brunet (4):
      dt-bindings: clock: meson: add resets to the audio clock controller
      Merge branch 'v5.4/dt' into v5.4/drivers
      clk: meson: axg-audio: add g12a reset support
      Merge branch 'v5.4/dt' into v5.4/drivers

Neil Armstrong (4):
      dt-bindings: clk: meson: add sm1 periph clock controller bindings
      clk: meson: g12a: add support for SM1 GP1 PLL
      clk: meson: g12a: add support for SM1 DynamIQ Shared Unit clock
      clk: meson: g12a: add support for SM1 CPU 1, 2 & 3 clocks

 .../bindings/clock/amlogic,axg-audio-clkc.txt      |   1 +
 .../bindings/clock/amlogic,gxbb-clkc.txt           |   1 +
 drivers/clk/meson/axg-audio.c                      | 107 +++-
 drivers/clk/meson/axg-audio.h                      |   1 +
 drivers/clk/meson/g12a.c                           | 544 +++++++++++++++++++++
 drivers/clk/meson/g12a.h                           |  24 +-
 include/dt-bindings/clock/g12a-clkc.h              |   5 +
 .../reset/amlogic,meson-g12a-audio-reset.h         |  38 ++
 8 files changed, 718 insertions(+), 3 deletions(-)
 create mode 100644 include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
