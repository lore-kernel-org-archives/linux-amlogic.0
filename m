Return-Path: <SRS0=0I7C=UT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A1CC43613
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 21:32:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E93252070B
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 21:32:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WFaD3tVG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QXWzh6ab"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E93252070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sYuww6/IXbWHjRr1COTxPcYvKf5d3FWG81AzSQSOZ2M=; b=WFaD3tVGeln7A3
	GDrxgUqHPE/23qrdt/D+JTLJwZlj3OKfmfoH/aHvomgeXSMVqfrOB7MehOwaWZZaS8KoabFpeCHwy
	wZOqQNoorD07GBSMJP9wQtYOgqQx249IFRVXHONnebeEmnzQtuzk1VVPkX2G5T7qg8WyhMAuQx5vA
	RU8RJmB9CP5gzRmBme+W+hNeHAtgkx0PcyYw2CESiuy6Y2GQpza3CBglHKwKH/0GXwkuUKAr9K3Z1
	MP/zO68N3wgRU1dcwO7vmtb2TocbVzz2vKzYwY6yfI/Afrp/98DXWh8tKybsZMi5L3+hTI0FxlgJ8
	yNKUHeu7FC5Y/C0XzLdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1he4ey-0000hB-5g; Thu, 20 Jun 2019 21:31:56 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1he4ev-0000a2-FU
 for linux-amlogic@lists.infradead.org; Thu, 20 Jun 2019 21:31:55 +0000
Received: by mail-pl1-x634.google.com with SMTP id p1so1915973plo.2
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Jun 2019 14:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=LA2byWf25MGtOfC7J6iW/rcMxjse6CVHJ6rWUn1KKNA=;
 b=QXWzh6ab8zvmLfzqY6NgD4pAIgfOuYVmkZiDPIn/0NfdhyQyCc68UBHjd9v+eW5aYx
 UX44OeK8q+2E22O+iDV35zv1kD4LB/9kRqiMMsgWXHzF+CbMD2BK63y4k1u42d+nK0Dp
 91m+fS/tmYGON+A9nQdTehkGJl4UE7ke7QzC8OLU3D+6lsRw+jLnGGoxlGvp7L+qy6Km
 7+2gPYrPUKlTCAMnEmC99masL0Q7GUFt4hF5PeTVfc5rnhAul4lVFjzH/v73EYxvgB4v
 kJu9WB4GG6w52i6xVDOL7IheiZfQLxRZKfb+gTxfzneKOMfJbNYP37GDZF/ZtSptra71
 knOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=LA2byWf25MGtOfC7J6iW/rcMxjse6CVHJ6rWUn1KKNA=;
 b=oAAF5mIwHRuU2vH3YCZy4FIaowEm7p1ezQaHFJbLsazNMUZ4JpL3EmCeUOdn+N7Apc
 n7rE0e+mc+i0P+Ti1vYC87IiW8zFk4BLav5iWMoV91GguhXmL+jvi2zR7UkE7CyE6ysX
 tscx7V+GIqqXr8+sLdEWjQHohIzqCJcsTMjSwElrc99O6az2mHEO71JbK+8ywsKoOoG9
 6dpdUTAo+IdImL23AfNwwT6jyt82sysFDcvuhjD1hbA6GOtE2vFssGicwLpO8B7+yijw
 kdSLKKkTdCDtkJ0f5Hmrz5vLs/fIUCpG/5MxZX5yueKJQ5Z9g1yrz6ocTgLlUGQs26jO
 9KHw==
X-Gm-Message-State: APjAAAXHDA6v+P6x0OI+pI21uqHMWpounVGjEZn0XkgutAIHW2Ki6jg4
 dhg77SWjf/aHlA3ZVwOgqyOu/RiCAYG7nA==
X-Google-Smtp-Source: APXvYqyv378BHtXcWMIVzB5B7/TmnQ3LgvYsvSOvqHTCZMdAWRk3SnG4MAD/oUAbpC/ua4PG3msihQ==
X-Received: by 2002:a17:902:42a5:: with SMTP id
 h34mr90991811pld.16.1561066312639; 
 Thu, 20 Jun 2019 14:31:52 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id c129sm401469pfa.106.2019.06.20.14.31.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 20 Jun 2019 14:31:52 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: arm@kernel.org
Subject: [GIT PULL] ARM: dts: Amlogic updates for v5.3
Date: Thu, 20 Jun 2019 14:31:51 -0700
Message-ID: <7hd0j8eyew.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_143153_535928_950F1415 
X-CRM114-Status: GOOD (  10.34  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt

for you to fetch changes up to a2c6e82e5341a283b06b04029f952598e445b159:

  ARM: dts: meson: switch to the generic Ethernet PHY reset bindings (2019-06-20 13:58:11 -0700)

----------------------------------------------------------------
ARM: dts: Amlogic updates for v5.3
- SPDX updates
- switch to generic ethernet PHY reset bindings
- add the canvas module
- mxiii-plus board: add regulators

----------------------------------------------------------------
Martin Blumenstingl (7):
      ARM: dts: meson8: add the canvas module
      ARM: dts: meson8m2: update the offset of the canvas module
      ARM: dts: meson8b: add the canvas module
      ARM: dts: meson8m2: mxiii-plus: rename the DCDC2 regulator
      ARM: dts: meson8m2: mxiii-plus: add the supply for the Mali GPU
      ARM: dts: meson8b: mxq: improve support for the TRONFY MXQ S805
      ARM: dts: meson: switch to the generic Ethernet PHY reset bindings

Neil Armstrong (8):
      ARM: dts: meson: update with SPDX Licence identifier
      ARM: dts: meson6-atv1200: update with SPDX Licence identifier
      ARM: dts: meson6: update with SPDX Licence identifier
      ARM: dts: meson8-minix-neo-x8: update with SPDX Licence identifier
      ARM: dts: meson8: update with SPDX Licence identifier
      ARM: dts: meson8b-mxq: update with SPDX Licence identifier
      ARM: dts: meson8b-odroidc1: update with SPDX Licence identifier
      ARM: dts: meson8b: update with SPDX Licence identifier

 arch/arm/boot/dts/meson.dtsi              |  44 +-------------------------------------------
 arch/arm/boot/dts/meson6-atv1200.dts      |  44 +-------------------------------------------
 arch/arm/boot/dts/meson6.dtsi             |  44 +-------------------------------------------
 arch/arm/boot/dts/meson8-minix-neo-x8.dts |  39 +--------------------------------------
 arch/arm/boot/dts/meson8.dtsi             |  64 +++++++++++++++++++++++----------------------------------------
 arch/arm/boot/dts/meson8b-ec100.dts       |   9 +++++----
 arch/arm/boot/dts/meson8b-mxq.dts         | 182 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------------------------------------
 arch/arm/boot/dts/meson8b-odroidc1.dts    |  51 ++++++--------------------------------------------
 arch/arm/boot/dts/meson8b.dtsi            |  64 +++++++++++++++++++++++----------------------------------------
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts |  17 +++++++++++------
 arch/arm/boot/dts/meson8m2.dtsi           |  10 ++++++++++
 11 files changed, 223 insertions(+), 345 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
