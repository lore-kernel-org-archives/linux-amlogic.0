Return-Path: <SRS0=9puk=BH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E3CC433E4
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Jul 2020 22:35:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2FCF2070A
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Jul 2020 22:35:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wv7v6FkE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ti41WhYU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2FCF2070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gn35pBs2LqWMR0F4OpEBM8u09vPM3wiEwVMG6BcMPe0=; b=wv7v6FkED6kZ5kncaGszyIYw/p
	qnPQ5JX/uEZwgGAXodTN8EYOCNlJ2EUgzbXxbnj3TerbRk7VpWGDagA1WKsSUxKrq2hhXr2zq7eZY
	aCYGGuwD5Qp4oLVr0L9BW0+m+aYK8NB7r0rYmTWYKOFQAy4ikaagE3pJkybr/MvlsNQu7LT0bqFMm
	dAS1ACmxJ7HZeeAuTIW7sXvyDDqluWfmTV0z6E4gGW5S38ZLZlaCX0qQBRjzyC4yzyQ2r021sJ9Eu
	ClFtRljnrhsEvPekptbVuhFPzHYbtovGRIpeCuKOwq1yrZwGuucATKb+U+jyuhbCrzJkpDXGiMrrA
	buMevidQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0YBx-0001VN-C6; Tue, 28 Jul 2020 22:35:25 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0YBt-0001Tu-5T
 for linux-amlogic@lists.infradead.org; Tue, 28 Jul 2020 22:35:21 +0000
Received: by mail-wr1-x442.google.com with SMTP id b6so19755684wrs.11
 for <linux-amlogic@lists.infradead.org>; Tue, 28 Jul 2020 15:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=RmXmfzMaEvq/LL9h6CN1HfcK8WevRxqQw1M7ODEjMWI=;
 b=ti41WhYU8KdFm0EWiQmyhFHPuNEiNS24MithdbvpkG/yWqeAo7dAG2BiRxFavaatWg
 /s4J6I6Kt6ZPSaS8Z+QGH4grVc+L7h54t8j+FMAWncZmvG5cgG4j8UTAyLCsHT0XOXJQ
 nxbxMqaCWDeePE8L3arI9S6/rYrF3LhB0bMCGwtwdIUDhnSZ1alI6kfM2QpF1CKdtEEv
 WbI8e7IN0xONnQtnQ0vyEyvkmYcQO4VRzHdGcXAE1Se8UHWzDoYwZNBSebzH1f2mRts5
 LJt2dwjr5N+7NEQrBvTtCStlZcEcGUo0dgXQK11EXLb9Gx+YzuOfrG9FCnSxxlR5QpRW
 l2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=RmXmfzMaEvq/LL9h6CN1HfcK8WevRxqQw1M7ODEjMWI=;
 b=AWCV5EOSTodca1i2/lsc5dWzxvrvIMlQMZR+yscFpzGGqatJD+ja8Jkaj8R9o9VIrA
 fsbiwpv7Sta4BYEfudhMLkhER0LuyExH8fUO3j0/3I/atCeClwiSz1YdlcxQdcVZn4YQ
 TEWRbZUaaQZWRfypFUfROOWz25//rXgrc+XdC3KevjJuPH2adMOzBWdCaCdqvTNnjBZA
 7VdJBtb/lhrULl2ukCohudGBqQZ4ndGLTH0nzz1p10P8Cym3iT5Q23ASfoxcI+QLTuGr
 8kq/GpfufYc4mnPgkGNJ1vy3LrByVfL5gsjLM4yycIeZRLbZJNFvBGPlBa7j11Jht+cf
 lYTA==
X-Gm-Message-State: AOAM5338WsQi0HlI8v3bR9WxnppDVCdYN7/QXvbHdLIDm1G11JeshKv4
 Sm7tOJB835cb6Tv1aqHq4kkOSg==
X-Google-Smtp-Source: ABdhPJwbLgtdyrnksp8ZPMp3HJD+OW5qMl3w0EI41bf1K1jRmAmpKSKlgjz7tuRNwsC6fDUQYJWZeg==
X-Received: by 2002:a5d:4947:: with SMTP id r7mr26633035wrs.165.1595975717794; 
 Tue, 28 Jul 2020 15:35:17 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id b63sm487909wme.41.2020.07.28.15.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 15:35:17 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] arm64: dts: amlogic updates for v5.9 (round 3)
Date: Tue, 28 Jul 2020 15:35:14 -0700
Message-ID: <7h5za746al.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_183521_244232_0ADEA241 
X-CRM114-Status: UNSURE (   8.50  )
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
Cc: linux-amlogic@lists.infradead.org, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The following changes since commit 916a0edc43f03f86b13fbc9943e5dc936671ea6e:

  arm64: dts: amlogic: meson-g12: add the Mali OPP table and use DVFS (2020-07-21 14:12:38 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64-3

for you to fetch changes up to f1bb924e8f5b50752a80fa5b48c43003680a7b64:

  arm64: dts: meson: fix mmc0 tuning error on Khadas VIM3 (2020-07-27 11:53:47 -0700)

----------------------------------------------------------------
arm64: dts: amlogic updates for v5.9 (round3)
- minor fixes

----------------------------------------------------------------
Christian Hewitt (2):
      arm64: dts: meson: misc fixups for w400 dtsi
      arm64: dts: meson: fix mmc0 tuning error on Khadas VIM3

 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi       | 6 ++++--
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi     | 1 -
 arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts | 4 ++++
 3 files changed, 8 insertions(+), 3 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
