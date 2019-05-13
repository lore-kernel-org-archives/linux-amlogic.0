Return-Path: <SRS0=LN9z=TN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B6BFC46476
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 12:31:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D51321537
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 12:31:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lTZ8V3QC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mtX1wcS9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D51321537
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0VhlHbzhxCLD5kNuCQPi4Oz25o+ZI1eu03FCSuwHL5E=; b=lTZ8V3QCpOJ7aN
	MrULnW+rL0JhYJi8ySf3ZBkSIyI2k2XLSn3H9jQYU0azAlRpWaLdkNaoDUTlifWdh/XOipkslg2Ot
	bORHKy95xiJlOrQs2tjyHxvUrZ/XLFoUjbd/SfitsJKKht4z5Gt864uVuiFCHTYs5dNb1VxyQi1UM
	qmGsnudILCpfiJCV550fx36yke3Xr8XPheXOAufwZV2yudJQf6c5WRM7qekXSiKcjwOCIRwB1F2vk
	3BPHcKApG9WfeMWZ1WAjOM+mcPKqOLCF9TbH7AaCv16iMgz3F5BCYJ+DYkilyEMp/ARpfHh2xedEC
	WRvFwfj+s6b8MN0Q7v6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQA78-0007OB-2c; Mon, 13 May 2019 12:31:30 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQA73-0007LA-0J
 for linux-amlogic@lists.infradead.org; Mon, 13 May 2019 12:31:27 +0000
Received: by mail-wr1-x444.google.com with SMTP id r4so15033409wro.10
 for <linux-amlogic@lists.infradead.org>; Mon, 13 May 2019 05:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a0zDbTaa26ZySHoR9jAKQENuusgUutv6iF4zZAMHHyo=;
 b=mtX1wcS9kONTXKDjOAvlX2YSMyoJbMEHEStzY48fjKQrJGj9j+ajTQ1w+CC2FH2PYP
 DOSQhUe/lHcfeG6HWyhZ2O0OMEs29Sk9D8p1BHtUL3WTmff3xeteIp+/6aTWrflNBabs
 YLbe1lua9Nnjjwjt7h6QnQ50n3Dv3Y6CVNF6k83a3O1dGOOKfdeHcYVVrJ32Uiuk82/t
 1mNBkIfBIfOseviNJPfkzqEOEI2KPnm9nSjq22WIGIy8I6nAssHLdBxuwHejfPRt7KH9
 iNRVT2pWfFKygo5+U15kIiCNPKiFxRIT5sQk/fsrVh/HjfXgM0jSZst1NFMGmKVsnXCL
 5I9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a0zDbTaa26ZySHoR9jAKQENuusgUutv6iF4zZAMHHyo=;
 b=iWCbpOmDaEhG/DwG2xVm4wSKhlAfhGVQWieZ2eNUgqgrPGjkNu8PajMBEpJOpPogwB
 LXuVOWRvmAAsd01QKNhsle00nllYZz2ao9Dutp0BEWFjlcE5EIln8aVuySDxQk4YCrDZ
 7SjpIk29J685Ns8WbH+QPpt+FhX9gWbPETyz/61aV++IyUTqryrTI5vCE14CHUMVmrEd
 kjPNxB3Ldw/exQC5kwV6akvtreRGQyOmYuDuAkXm8SjbxSNur2z6oQsrsc5cWD33nuh5
 LdCBv8YFQa/jbwFKvShpYJXerF7j9PCotSpC5wRKSBAl5c3Lxo78P8P4wYCpULBQdZ5n
 DPow==
X-Gm-Message-State: APjAAAV55SlvZomKPUtin35HP7lP3g9D2H0j0KL3zqCMlU1aq8bJPfTy
 Aa+YvOFIHju/bucWLjU4GDdirA==
X-Google-Smtp-Source: APXvYqwjb5WcdnNbNi455xLV0O5EORjeFi0LCmBfRmVg75MPPb4ZOa6EeMxt3cqUECWOAand/HVppg==
X-Received: by 2002:adf:fc8f:: with SMTP id g15mr18367756wrr.122.1557750683186; 
 Mon, 13 May 2019 05:31:23 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id t13sm16175584wra.81.2019.05.13.05.31.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 05:31:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 0/7] clk: meson: fix mpll jitter
Date: Mon, 13 May 2019 14:31:08 +0200
Message-Id: <20190513123115.18145-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_053125_348599_E013BD8E 
X-CRM114-Status: GOOD (  11.92  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset is a squash of these previous patchsets [0], [1] without
modification, beside a re-ordering of the changes to facilitate backports

We are observing a lot of jitter on the MPLL outputs of the g12a.
No such jitter is seen on gx family. On the axg family, only MPLL2
seems affected. This was not a problem so far since this MPLL output
is not used.

The jitter can be as high as +/- 4%.

This is a problem for audio application. This may cause distortion on
i2s and completely break SPDIF.

After exchanging with Amlogic, it seems we have activated (by mistake)
the 'spread spectrum' feature.

The 3 first patches properly set the bit responsible for the spread
spectrum in the mpll driver and add the required correction in the
related clock controllers.

When the g12a support has been initially submitted, the MPLL appeared
(overall) fine. At the time, the board I used was flashed with Amlogic
vendor u-boot. Since then, I moved to an early version on mainline
u-boot, which is likely to initialize the clock differently.

While debugging audio support, I noticed that MPLL based clocks were way
above target. It appeared the fractional part of the divider was not
working.

To work properly, the MPLLs each needs an initial setting in addition to
a common one. No one likes those register sequences but sometimes, like
here for PLL clocks, there is no way around it.

The last 4 patches add the possibility to set initial register sequence
for the ee clock controller and the MPLL driver. It is then used to enable
the fractional part of the g12a MPLL.

As agreed with the clock maintainers, I'll submit a series to CCF to
remove the .init() callbacks and introduce register()/deregister()
callbacks later on (pinky swear).

Jerome Brunet (7):
  clk: meson: mpll: properly handle spread spectrum
  clk: meson: gxbb: no spread spectrum on mpll0
  clk: meson: axg: spread spectrum is on mpll2
  clk: meson: mpll: add init callback and regs
  clk: meson: g12a: add mpll register init sequences
  clk: meson: eeclk: add init regs
  clk: meson: g12a: add controller register init

 drivers/clk/meson/axg.c         | 10 ++++-----
 drivers/clk/meson/clk-mpll.c    | 36 ++++++++++++++++++++++++---------
 drivers/clk/meson/clk-mpll.h    |  3 +++
 drivers/clk/meson/g12a.c        | 32 ++++++++++++++++++++++++++++-
 drivers/clk/meson/gxbb.c        |  5 -----
 drivers/clk/meson/meson-eeclk.c |  3 +++
 drivers/clk/meson/meson-eeclk.h |  2 ++
 7 files changed, 70 insertions(+), 21 deletions(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
