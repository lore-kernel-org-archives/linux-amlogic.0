Return-Path: <SRS0=KQOD=CX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B122C433E2
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Sep 2020 17:24:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7150720715
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Sep 2020 17:24:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="czBAFE3l";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="F5/z7ocv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7150720715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iHM/rKoexS5pTXgBzbKbPHqDhn26096CflrB0AgnxmU=; b=czBAFE3lWNpZAh3pC2pmnkNDSL
	uI2cDDsnSUUx9CMd0bOvjFAaWppcpiSRDtmqEA1/6MjUMjto34duTX+gJRyIQDEM8PPcb3e396THl
	BsK47/HJmTXWpkcN5hWiO5IgyZnGxXGSWjdXoXrXjNO3cvEGOW/PjxLufhUxqSz/76vQ4vUWFESAR
	uXZVp08L32sA28Rv803faQyuvomhhTjYgkw8xd46WQKAGqSXNiQI7lXmv7bzFLR6m1g0ZGWpcn4SK
	YR83lg8WCeZMOb9YtvpiY78VFV+yD4yH5garQHLYoiaVexBjN1jdqebfk4l1UT92bzZ8K0CDD/S1j
	0KrwmwGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHsD6-00007v-AD; Mon, 14 Sep 2020 17:24:12 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHsD3-00007A-Mf
 for linux-amlogic@lists.infradead.org; Mon, 14 Sep 2020 17:24:11 +0000
Received: by mail-ej1-x644.google.com with SMTP id e23so1112108eja.3
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Sep 2020 10:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=user-agent:from:to:cc:subject:date:message-id:mime-version;
 bh=hFCbjxW8uW+yuxs/JPTkQS9JaMQxM3PMZY1XAnoJQSY=;
 b=F5/z7ocvDKzr+vhOc+7o9bGoSp+bHfkRTTV72pMQAXpnsX9TI0c5Z84L2kMRJoS0qL
 dwGO7znmuaWD81sNt+fK5+U61zrW2+nT89nE0fzkSDA7L93eG8zyugjwVbyjvxIUWozZ
 I9Nr8he0R2Z+EDI3B6qyUXVkiYYxdrjAoUG6rObqvq6UZN8f3m3itpw7fZMipogtx5qW
 GpOd9V1Gbb6iEitjYQEMg0Xkfo2uanPDfS/TwHQMW/eJ3n0/rYt52g9U/mXTpHMG0Vpm
 tVtKxUhAbqTd66MXg6tZZiwKoF6JclouN41fV3dr1l/p7FIVr8RCDAzPPSYZUKfOf2mq
 TeqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
 :mime-version;
 bh=hFCbjxW8uW+yuxs/JPTkQS9JaMQxM3PMZY1XAnoJQSY=;
 b=ReXWnrBjrSTsaiZubzpZ6IeDsw+fIGzDYnV2Bd0nxqFQ/ZXndGQOc5os9hoO+vBxFg
 BoUxbFWSDrjYW02NQvre/bVfEp78j1gXtWYKmFL7y8OJF2Rg6yH4e3maHdM2BQoE17Wy
 Y2nCAqEDOpS06WI9b+T2RXSLsMWgJ7H5EsN7ZC8wh+IN4CMoLKNcT7rY3lLs+202mLnE
 IOCEfWKpxwpoQadViKOIy1iMtYzFnmczJCwhrgB7C4OBahFj82tvK4Mwz5aCGHnoC9Iv
 L8pJxyl3xK+SR4Sd7mNShKFcnT53W0ucN9ZP/wldMXK/wUK4PESHFIZewyLhEz4WtwPf
 QCMQ==
X-Gm-Message-State: AOAM533Ig8sb/etw8QA6kO3dhs1jcSBoH2tqS83Su/2cYcby72/nJQj0
 3FDGDaDAGP9bZNLybOhwtRPhDA==
X-Google-Smtp-Source: ABdhPJy2bQLRu8ffYasf1ax+5TUs//GyxEYDG2pq8Yz0EDxvYyC42y8ku3JnZMrDpoZd7Ij4EGnWXg==
X-Received: by 2002:a17:907:2055:: with SMTP id
 pg21mr16545089ejb.501.1600104246142; 
 Mon, 14 Sep 2020 10:24:06 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id by24sm8199302ejc.100.2020.09.14.10.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 10:24:05 -0700 (PDT)
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Subject: [GIT PULL] clk: meson: updates for v5.10
Date: Mon, 14 Sep 2020 19:24:04 +0200
Message-ID: <1jd02ob7bf.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_132409_852951_5D36B386 
X-CRM114-Status: UNSURE (   7.95  )
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

Hi Stephen,

Here are the Amlogic clock changes for v5.10
Please pull.

Cheers
Jerome

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.10-1

for you to fetch changes up to 7b5c5720a3689c2c16968ee276b7c47edb64ce0f:

  clk: meson: make shipped controller configurable (2020-09-10 11:47:33 +0200)

----------------------------------------------------------------
First round of amlogic clock updates for v5.10

* g12: update audio clock inverter and fdiv2 flag
* config: allow to disable unnecessary amlogic clock controllers

----------------------------------------------------------------
Jerome Brunet (4):
      clk: meson: add sclk-ws driver
      clk: meson: axg-audio: separate axg and g12a regmap tables
      clk: meson: axg-audio: fix g12a tdmout sclk inverter
      clk: meson: make shipped controller configurable

Stefan Agner (1):
      clk: meson: g12a: mark fclk_div2 as critical

 drivers/clk/meson/Kconfig     |  26 +++--
 drivers/clk/meson/axg-audio.c | 214 ++++++++++++++++++++++++++++++++++++------
 drivers/clk/meson/clk-phase.c |  56 +++++++++++
 drivers/clk/meson/clk-phase.h |   6 ++
 drivers/clk/meson/g12a.c      |  11 +++
 5 files changed, 274 insertions(+), 39 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
