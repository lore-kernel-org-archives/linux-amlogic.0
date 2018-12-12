Return-Path: <SRS0=dvnd=OV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA6CAC6786C
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Dec 2018 23:54:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8918D20835
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Dec 2018 23:54:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IvLoueha";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="P9TQqHqw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nJFRfLo6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8918D20835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eUlTVIIk9tzl7kQS8e/XU9fdnvBC7QQhj0U+VXf09eQ=; b=IvLouehaX+1bJr
	+490OC9sWiXTfyvEm30EszqDbouCwxMzcZkO9wfYMgrx6lmSR/JCpNbORZsK01ljsEwfAyg00GUQB
	DEFZ8NVKq2XZGhjFDjFvF/jk/SJ5fdY3GE3mY61JXo3nJOEmhorwMeAxReQqfnmIa2ohNLcYNUIto
	WiSLJjMWsssa8gF9OSzFonJC+SDHx9foap8RB4H5b1TvEN9XdDaCE5wiiWqyWsDxjgBCx7Ycqcn1I
	Qwq3WVQo/MSbMKgLmjhfEEj9s9ra8/hUqai+D7eVULyOgkEx8J/Fiiwvskf4/GabWNEPsahC9Yh06
	Nfqf+/6OQNCDPsx4MroQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXEKI-00029z-Az; Wed, 12 Dec 2018 23:54:02 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXEJn-0001fQ-5s
 for linux-amlogic@bombadil.infradead.org; Wed, 12 Dec 2018 23:53:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5z4MCaDFkjT0GRa/SDnALif67/6+g5XOP06+tm0XC4w=; b=P9TQqHqwj6fojJigRXgWn64Sw/
 8JOnsuYPt8zBtI6sjV4dZMiRJNqAjaZ5FuOeq+WWS/jR436iAH4FkY9kWmkpNfW2AhrhoVVmZls7g
 PmTT+zbnbwZqir9nbRmuCTles+G3bh9sTv9qtp1lESKw+sbbi/HtNJkzOprj85pClp5WfkS2Ao5Ig
 2Hr45QNJGwormgQC92JWIReQXhKcxyzd6E+lrxt8XoUN1fONeJmS7pk+6AbZiYwotN34I6ZlAh5T2
 mQDf9qr2nYrFe2Y0v7weji2gHEm/AaNNHbXHr5J5TG4lSxI7/oMo5X14iInGRW+QpGe2HjIJGSaMp
 8An10sJQ==;
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXEJk-0006d1-2J
 for linux-amlogic@lists.infradead.org; Wed, 12 Dec 2018 23:53:29 +0000
Received: by mail-pg1-x544.google.com with SMTP id 70so102011pgh.8
 for <linux-amlogic@lists.infradead.org>; Wed, 12 Dec 2018 15:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=5z4MCaDFkjT0GRa/SDnALif67/6+g5XOP06+tm0XC4w=;
 b=nJFRfLo678gSoTUXA5f0UIHoo5qORc70Ob7IXiXgfMgFNCK6qA6TeYP4lU5rMOyX5S
 fl2/BtkWqo2dSDDeIHTL2GynK83150ClfacXC2epC6u4mRZ0qjVOY7Jo7CC6yg1jpLfX
 yYxxt0ehBr7NSJA5DtBP9jh+lvsPViuzJgWdst2CP1bWNky+GjQMdkW1UEMkLhWn9IS9
 GMCCXeFpr00zxwtVqj6UabTxMvCer8y+SQ6AiNBh/Is+FQyL2rU6TjX/LuIWSozG2uTt
 zinYHTgN4rTgp5uQ3aTlic13e0HnzZmcGe27eVIfLuhbrbLjwQEt/d5/jfP3kCYXH+K/
 rcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=5z4MCaDFkjT0GRa/SDnALif67/6+g5XOP06+tm0XC4w=;
 b=MeS/UoHdTN5Hb+JySp99UYNdOJh5eJV4fcKkzXLCAzNSq87IvLqDxiMkC9j/Dnhhig
 d9agrUOepC3fHRQ7/EPaWOsc70RVy6kMX5okIMWg45mh7rLallLw8TDeZquPZmxFmG1q
 jcxTn+SbjbwjNaWSWog3QrUkYsEx9M87EA7ADA032a0PbgXMDEGk+q00jJm5P8umBby7
 rCLBz7h5NLvtCK4FrhEHyFzufpWU8fBmn9i25IzZoTEwmeykiXHtPoqNqGDu3HWFPiy0
 SohPik37r9EuACywDpx+SD8cXkjW+xUO60N03fGwTJ+Bey9eIVHfttddSLcA0ONM6QSJ
 ummw==
X-Gm-Message-State: AA+aEWZHBOCk7rPHAbpwiIUmTzrLBwtnEIwVreeEejetlF4HbeY/67+5
 +ktbs3dIRe/GjRofW3QqmYvang==
X-Google-Smtp-Source: AFSGD/XQl+awbHB8f/fv1AFbRGoTD7jvWEc3/vAkFpjKpzFPlYj2eBeNfipklBygTPxeYWwg9w+Qfw==
X-Received: by 2002:a63:1848:: with SMTP id 8mr19836731pgy.81.1544658793589;
 Wed, 12 Dec 2018 15:53:13 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id g5sm131931pgu.57.2018.12.12.15.53.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 12 Dec 2018 15:53:13 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: arm@kernel.org
Subject: [GIT PULL] arm64: dts: Amlogic updates for v4.21, round 2 (redo)
Date: Wed, 12 Dec 2018 15:53:12 -0800
Message-ID: <7hsgz2s3o7.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181212_185328_218384_D6636C9A 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

Arnd, Olof,

Here's a redo PR.  I dropped the bindings adding resets to Mali which I
mistakenly thought was uncontroversial.  I was wrong.

Kevin

The following changes since commit 5e339a1d7e438b2cc9f46ec9f2682efb58ee2dd3:

  arm64: dts: meson-gx: Add Internal Clock Measurer node (2018-11-29 12:30:09 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64-2-redo

for you to fetch changes up to 8b3e6f8999f8d704fccce225b9455b3fa639d1c9:

  arm64: dts: meson: Fix IRQ trigger type for macirq (2018-12-07 13:48:58 -0800)

----------------------------------------------------------------
arm64: dts: Amlogic updates for v4.21, round2

Highlights:
- fix IRQ trigger type
- AXG: enable GPIO IRQs, PHY IRQ, watchdog

----------------------------------------------------------------
Carlo Caione (4):
      arm64: dts: meson-axg: Enable watchdog on Meson AXG SoCs
      arm64: dts: meson-axg: s400: Enable PHY interrupt
      arm64: dts: meson-axg: Enable GPIO interrupt controller
      arm64: dts: meson: Fix IRQ trigger type for macirq

Jerome Brunet (4):
      arm64: dts: meson-axg: remove alternate xtal
      dt-bindings: clk: meson: add ao controller clock inputs
      dt-bindings: clk: meson: add main controller clock input
      arm64: dts: meson: add clock controller clock inputs

 Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt | 10 +++++++++-
 Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt   |  5 +++++
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts                  |  2 ++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi                      | 23 +++++++++++++----------
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi                       |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts             |  1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi               |  1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi                     |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi                      |  4 ++++
 9 files changed, 38 insertions(+), 14 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
