Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08BDC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 11:12:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7106020863
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 11:12:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OmHxg/MV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZXW58RQo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7106020863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6SnUTSuJJHDiryvMkZEydzm4lXYrl3zSFKdpp8fY9fg=; b=OmHxg/MVpxlDwa
	TZVXZmmtv1H/S5IiEG/+L1csPucDG2m/SyZ55Ue0nKRewhDY4D0NJ8w97gx+aflSHmfYnH8FjJ7EG
	OTQa0LochykEuiFK8Y1FSPemsswr9pvuGqn5iJ0XBZCx/9KXefaqallM2ebfehZSSYOdZNpZ4Bi/t
	5NeYcMl2iXpGJ4C+X3jKgp9zANKXrRvKvFxAaKW9KkgJu6jBH7NrGZgizTFB7pHMGmwhPBN1vMAGQ
	cck+ZQ+RCHjP08zaknO54iBuaDPllhwX2yuD9PLdI1v9X6T0silAQwFamb9ZrV2io0ECntS2zkwhU
	t4J5yS/UCLUkRDsWNeaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8NWd-0006yG-1a; Mon, 25 Mar 2019 11:12:19 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8NWV-0006wS-2Z
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 11:12:17 +0000
Received: by mail-wm1-x342.google.com with SMTP id t124so8548614wma.4
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 04:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zq6vRTetM545SboMg3VjgwSgsS+YSQUJaE3MlRK8tIs=;
 b=ZXW58RQonAOpYLFTCrrCFYUt+m+W7pyrOmzvKP1t1j8CQ3BFbne7+d20B0eFhLrlu9
 Wjt+WJVIRmAkgmJxIqmUd8aU5WqI30LH425b6F3e6SoKZLUd+Qi7ASmeA3Daujs2sQ1T
 jzx4ASkf3xJlmrx2nk785v71K4ujbne7Gug4Pp1s8gJayjFB/XlHQXC2apqRUkYtNAam
 k0lr2BX5CDDWq7qaeM6v0COAc/1u1EMGORhSq/1Ytw9Ma7/OClT6Gs7lAvmIJkwX8mEZ
 V7HatMdxobGvN4XU6G2rd+Yh4guUBtIutyhX+7+gW1kZdYod2+YsYAeGVQ87XgVKbMZA
 W+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zq6vRTetM545SboMg3VjgwSgsS+YSQUJaE3MlRK8tIs=;
 b=L52f+h3xTv9PC1ZvdgI7kKFuFMoqUY9+YVezBScoC2d7PqHgiFxTUtJS41VDLhHGCG
 h/0p8OpT6ImcTn4fb/R/8XEfSeV44NaW1kVsXd9FAJa1fyEk4lKXaK1AuO8Zopr7Cwr/
 dbGiqrsBicdEQo3vJgHgy5d/fIvHCbjXqFJbs6rgqjDuFelkUJ7oj7Us81y2GkZhMhCc
 2wxKHB33DmgInLOyl6hr9Sah/F3usMfuQ10XMTWh6TUu6UZqjw1o6Kq+0/5xMXYO8vag
 eRO+d5OEdlvc8rhWIEtrzV723XrS0q7SSaJ0tWATeMgUgkfzd9btgWE+BDbft+aq261G
 xYHQ==
X-Gm-Message-State: APjAAAXskkFumJJC51av0HI3fHavBGt2Fw08VfUrqHiLSHvo3AmM5C5L
 /+0fd5o00eM0sQIjI+XkDt0fTw==
X-Google-Smtp-Source: APXvYqziK48dM7HzQKX85ubGKmdqo9qHPboyMRSgNdub+Iyl+dklAkVTb7jz8nfm8D1YbcH+pwraww==
X-Received: by 2002:a1c:cc0a:: with SMTP id h10mr11048100wmb.22.1553512328021; 
 Mon, 25 Mar 2019 04:12:08 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id
 n188sm15134301wme.13.2019.03.25.04.12.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 25 Mar 2019 04:12:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/4] clk: meson: fixup g12a mpll
Date: Mon, 25 Mar 2019 12:11:56 +0100
Message-Id: <20190325111200.15940-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_041211_116694_FE277569 
X-CRM114-Status: UNSURE (   8.85  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When the g12a support has been initially submitted, the MPLL appeared
(overall) fine. At the time, the board I used was falshed with amlogic
vendor u-boot. Since then, I moved to an early version on mainline
u-boot.

While debugging audio support, I noticed that MPLL based clocks were way
above target. It appeared the fractional part of the divider was not
working.

To work properly, the MPLLs each needs an initial setting in addition to
a common one. No one likes those register sequences but sometimes, like
here for PLL clocks, there is no way around it.

The series adds the possibility to set initial register sequence for the
ee clock controller and the MPLL driver. It is then used to enable the
fractional part of the g12a MPLL.

With this series applied, the fractional part works again but we are still
seeing a significant clock jitter (+/- 1,6% for 294912KHz). Discussion
are ongoing to explain and, hopefully, solve this as well.

Jerome Brunet (4):
  clk: meson: mpll: add init callback and regs
  clk: meson: g12a: add mpll register init sequences
  clk: meson: eeclk: add init regs
  clk: meson: g12a: add controller register init

 drivers/clk/meson/clk-mpll.c    | 33 +++++++++++++++++++++++----------
 drivers/clk/meson/clk-mpll.h    |  2 ++
 drivers/clk/meson/g12a.c        | 32 +++++++++++++++++++++++++++++++-
 drivers/clk/meson/meson-eeclk.c |  3 +++
 drivers/clk/meson/meson-eeclk.h |  2 ++
 5 files changed, 61 insertions(+), 11 deletions(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
