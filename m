Return-Path: <SRS0=Ohoh=3C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F30EC33CA9
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jan 2020 23:56:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65CDE2084D
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jan 2020 23:56:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KB1BvdWJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="px6J+r1E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65CDE2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2CcgVPDo7JdjqYMZ88mXJs2KDAjh8fB3KAkOva09PPo=; b=KB1BvdWJNOLncG
	5h2NB6F6sTiw5qbkwUUKrPGzJ7g5olhK/dG0974QWGKL0tBadhy6uRoOntR0j1gZcNKz+KbxAj0rl
	RRx8kx3yoDHgYPaF493B/x4IriIsKFiGgw9ZtdNWPrIyWoQHgki6jXFVupHqxB0PP7F6KWaX7JSJG
	Tmf08iEph/ocfUe0Rz3U6GZhIb1pl3t2u6N3+zLoiUwPxqz5zKkbbCS9KKcbhxQ9wk144SjKXdVOz
	Ic3pGkp+AnjMk9/T896tyZm5k6cRn0yhfN2SWb/gO1tmhqFoctvqtDXxPiAQQsdML/miin/L839U2
	QQwD4p4GsxBld0sw4k8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ir9Yw-0001iF-4q; Mon, 13 Jan 2020 23:56:02 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ir9Yt-0001hd-C9
 for linux-amlogic@lists.infradead.org; Mon, 13 Jan 2020 23:56:01 +0000
Received: by mail-pl1-x643.google.com with SMTP id g9so2253149plq.1
 for <linux-amlogic@lists.infradead.org>; Mon, 13 Jan 2020 15:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=TqPvJI4RPAezkldNEOC17IHHTl68zFcqkqu+vA06JuU=;
 b=px6J+r1ELxTvch3mGhy6KycOqat8WHWjSARXWDzpG6huGygjMWKgopxCB81Ie+821k
 W9GndkoQWvLenzgdq3B4jOjXhUG+2+6et6DAgpOF7aEeFKKf9l37BxGKolM0ZLtN+3s8
 9cwQJH5D2raIVydWICE+s3jHzsOiM5I+29zuX//HepBaUgLzl7scijYGMwOE5BW/nlWq
 cBoYuhFRcES6qMQDTJYGAG6GpBrTDrZlor3inwtW4nitUP0muNPNdfE6zqqcqbgYKWq7
 IbTC3KhoX7uzuZjGHsQC2v5PExcmIFqSi9n7Ce4lkCFxA8MdQrEpxNFELrRe8ds2pm89
 KbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=TqPvJI4RPAezkldNEOC17IHHTl68zFcqkqu+vA06JuU=;
 b=LHAZaUeTjKCs8TjZmYhYU/W5t8vZN2UaXL7X51q3+c+/KPSgUdpE1bRmSum809l7JN
 I8xcvSKpO6pGCQEjIaW+7i59kowrcgHmzViSRzl5JTgLQKVJ3LcyK6DqnCWYxjiR9Sn9
 4AY3YOnlNOMCCWPISJS6nqEeUWz3J9XshcOtY9Yvb94gdupMxywoa4wjwr5mXs1x/NZ6
 84OMU3/NWq3hzrfosu3sxQdqMkxgyhA4lrTlmK9H9KwoJGK/I/f/c31axICAIc8oCyBr
 O9YfrK9pA0QTiHKMcG0E+E5KWK3BB6B3yKkLmZ4whGG6f7OHuXBRRZmOoE8b/bsZV8Bx
 MBrQ==
X-Gm-Message-State: APjAAAVqXCAkwbnPYU27/nQkSl//91JqM467mMXHXTdgEpq/rM92kUMZ
 O8kj96zbQqxFVOHOlue4Q3p/Gg==
X-Google-Smtp-Source: APXvYqw3N/XdapMwdsoi/H4yirjyKKIZlykIdMZZTllXW7MzFKueRoIJNXUGJkFkBfL2bVJprZoWPw==
X-Received: by 2002:a17:902:7046:: with SMTP id
 h6mr15895290plt.231.1578959758723; 
 Mon, 13 Jan 2020 15:55:58 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id w11sm15820761pfi.77.2020.01.13.15.55.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Jan 2020 15:55:58 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Subject: [GIT PULL] arm64: dts: Amlogic updates for v5.5
Date: Mon, 13 Jan 2020 15:55:57 -0800
Message-ID: <7hwo9udi7m.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_155559_416564_4ABCBDCB 
X-CRM114-Status: GOOD (  10.98  )
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

Hi Arnd, Olof,

Here's a round of 32-bit DT updates for Amlogic SoCs for v5.5.

Only thing of note is a merge of a clock dependency branch for some new
clock IDs.

Kevin


The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt

for you to fetch changes up to c3dd3315ab58b2cfa1916df55b0d0f9fbd94266f:

  ARM: dts: meson8b: use the actual frequency for the GPU's 364MHz OPP (2020-01-08 11:00:58 -0800)

----------------------------------------------------------------
ARM: dts: Amlogic updates for v5.6
- add DDR clock controller
- GPU OPP updates

----------------------------------------------------------------
Kevin Hilman (1):
      Merge tag 'clk-meson-dt-v5.6-1' of https://github.com/BayLibre/clk-meson into v5.6/dt

Martin Blumenstingl (8):
      dt-bindings: clock: add the Amlogic Meson8 DDR clock controller binding
      dt-bindings: clock: meson8b: add the clock inputs
      ARM: dts: meson: provide the XTAL clock using a fixed-clock
      ARM: dts: meson8: add the DDR clock controller
      ARM: dts: meson8b: add the DDR clock controller
      ARM: dts: meson8b: fix the clock controller compatible string
      ARM: dts: meson8: use the actual frequency for the GPU's 182.1MHz OPP
      ARM: dts: meson8b: use the actual frequency for the GPU's 364MHz OPP

 .../bindings/clock/amlogic,meson8-ddr-clkc.yaml        | 50 +++++++++++++++++++++++
 .../devicetree/bindings/clock/amlogic,meson8b-clkc.txt |  5 +++
 arch/arm/boot/dts/meson.dtsi                           |  7 ++++
 arch/arm/boot/dts/meson6.dtsi                          |  7 ----
 arch/arm/boot/dts/meson8.dtsi                          | 28 +++++++++----
 arch/arm/boot/dts/meson8b-ec100.dts                    |  2 +-
 arch/arm/boot/dts/meson8b-mxq.dts                      |  2 +-
 arch/arm/boot/dts/meson8b-odroidc1.dts                 |  2 +-
 arch/arm/boot/dts/meson8b.dtsi                         | 30 +++++++++-----
 include/dt-bindings/clock/meson8-ddr-clkc.h            |  4 ++
 10 files changed, 108 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,meson8-ddr-clkc.yaml
 create mode 100644 include/dt-bindings/clock/meson8-ddr-clkc.h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
