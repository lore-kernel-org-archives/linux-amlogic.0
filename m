Return-Path: <SRS0=yrQE=QS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,SUBJ_ALL_CAPS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E3E3C169C4
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Feb 2019 20:49:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D80E218A4
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Feb 2019 20:49:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uYKGN/aH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kyfi3dan"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D80E218A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jodMnxiSfcM6rKl4VuQC4pI3Iqk20OeaYse9PZWy0Oo=; b=uYKGN/aH7YnkWT
	OKH7pVFHx12zaldes3Wly+kO1vWu6GBJr4aW7Rr/XApXRSEU2eMCMefhvUaQGHtcIkUdv/owzkRkO
	84BTydhqyze8zyWWBcvtivWSdZ8SEgti4nErBgDKDL3+9Vd5Rw3cvfDZCytPrejAL3GkFJkkHbBP1
	B9QN6Zu3PU91F7/qleXpLInDkKgGl88hRp6US94Un6REd/9EF+RoXP8AEUeG0xS3vIVSM8ESoBHtK
	a64DJo8tT9mk8aaGcc3z+rj/N/WZqk32fxB5lNXMU/T17eP5kCvPkxc7aukVjLsUrFw1wkXSav/7m
	CrBEIDXoMdeINCyOHXJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtIVj-0001KD-Mw; Mon, 11 Feb 2019 20:49:03 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtIVg-0001JS-8F
 for linux-amlogic@lists.infradead.org; Mon, 11 Feb 2019 20:49:02 +0000
Received: by mail-pf1-x441.google.com with SMTP id c123so141315pfb.0
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Feb 2019 12:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=iD/2fmc3WOR75xKs3SOI8RznZuRTsGWHd3f6jaHVDts=;
 b=kyfi3danVhowRODs3bHSnz2xGgr0DF4P4v+EjPqfmcAG6qPV5XUQQj7/ezwvx6sr/M
 2KkYAkp33KRAciQUISTrFMCKZ4BHAmLZMUubk/pGjzadyehjxo1BEAcjiI+X/h/TI3HN
 igBtu0iU4lHzu8uKr+ZEiM+dbG5WjU31hiG5465F0BG3rN67vmov8yWT9hRw4suQxztJ
 CUiOfz2oUpwVPE8O0ys7inkeaURGwK1WHs8NF8xCHCpFq3nbcjKWs1gQfsKn4TgeMY7T
 W/1N/MhpoPJhjdHc6bjIy5cdok5de9/9BzYazHu9759G9rm5J7ZR+qjV1McVVpa6aQ+8
 Lruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=iD/2fmc3WOR75xKs3SOI8RznZuRTsGWHd3f6jaHVDts=;
 b=qAh+8fYVGoamz8JYpQQlWowgFBrIEdMEN4e1YnZKB9wYaEwTgaKbNUjqphXRNfY7sp
 ENzEGMfE1yDr74/eoJzqtIs7yKc6M/XP5HvTBFej12m+U/dwZA+kPh4x0EzJqhRgeNBW
 PJ5NkNM5l6VSSDL/eUeXL3M3J+JSxTbyezh5b+L0jO4rAAnBWM9/7BLnwgHGaCsdHpul
 d1JFlKIN/j4uHKwRnAWg/k4+gJxWYvo9YOVwcYHWSAWEP4Rqm9BKyF+Vujndp2elC2y6
 2ipAqeR7X0IlTFZQ178tgfr6Lvb2C3PV3SkMmS0zhTtQ5G4/1dO9mgw258y/CrwLKtHC
 e6Fw==
X-Gm-Message-State: AHQUAuZ2isVHwrLlJKFemqcU42WhuCiCOVAY7azPzT0nFlKD8Hoyhuny
 md+rKHDjNFwIje0+MXYkU1zh2Q==
X-Google-Smtp-Source: AHgI3Ib4lf6z9Qjmrs9M7eL8SvaRqCk8Uf+gA800Vg6jAcWnU5WVJAuxDkgR4V0sfijIpomyMSqfQA==
X-Received: by 2002:a63:f201:: with SMTP id v1mr140486pgh.232.1549918139610;
 Mon, 11 Feb 2019 12:48:59 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:1d1:285e:6b85:3bfc])
 by smtp.googlemail.com with ESMTPSA id 10sm17683708pfq.146.2019.02.11.12.48.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 11 Feb 2019 12:48:59 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: arm@kernel.org
Subject: [GIT PULL] 
Date: Mon, 11 Feb 2019 12:48:58 -0800
Message-ID: <7himxqdpad.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_124900_289495_42AC9176 
X-CRM114-Status: UNSURE (   8.28  )
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

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-soc

for you to fetch changes up to b3077ffcfa24b05c05af3b990d97a392ef88b22e:

  arm64: meson: enable g12a clock controller (2019-02-08 09:30:25 -0800)

----------------------------------------------------------------
Amlogic SoC Kconfig updates for v5.1:
- arm64: meson: enable g12a clock controller
- drop unneeded COMMON_CLK_AMLOGIC

----------------------------------------------------------------
Jerome Brunet (3):
      arm64: meson: remove COMMON_CLK_AMLOGIC selection
      ARM: meson: remove COMMON_CLK_AMLOGIC selection
      arm64: meson: enable g12a clock controller

 arch/arm/mach-meson/Kconfig  | 1 -
 arch/arm64/Kconfig.platforms | 5 +++--
 2 files changed, 3 insertions(+), 3 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
