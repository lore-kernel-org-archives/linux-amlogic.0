Return-Path: <SRS0=Ikdi=X3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F13ECE58B
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Oct 2019 09:23:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCA6E21783
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Oct 2019 09:23:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="upMtRfJk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zc2FBs7z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCA6E21783
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tDmLpuBtjRwIEs4LaYa0yFedLF0zJ41Vh2q+3v9tjdw=; b=upMtRfJkzkJjQw
	clpBp+MNGY30eeAddmWuf7YZcxl6c0RZr92K3kin+Z8kfF61jaqhd7RVWkuzFeKBoJ5hu6u8BfDny
	QBX3PEejhUwAyBWu2pKjlWW5jvVh84u1Ci2wx2MS8cXlzuiZ9PXfSYfFrkcR7SecrqhsVJgKSp3M1
	RPBJv86fzRfHJx/GRbiSwB6HmZdCL5hPGUzz1apT0HY3uV7CxpQzPD0uheKetMt1WXX/sdqnHw6k6
	x7mbSylcEUDtj0B2YF6nRNiLVbzMXIe84qZXFDciv33cQjiDhRcO0xvJcchstGFNoxfpqiiw6TshP
	KrBlYNJZtwsRA25QYj0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFaqZ-0001a1-6G; Wed, 02 Oct 2019 09:22:59 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFajd-00087H-23
 for linux-amlogic@lists.infradead.org; Wed, 02 Oct 2019 09:16:01 +0000
Received: by mail-wr1-x443.google.com with SMTP id a11so18761155wrx.1
 for <linux-amlogic@lists.infradead.org>; Wed, 02 Oct 2019 02:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yH4ZTSk2dw1y5h5K76pORaKv4pdr0m6BUkDf5tas0UM=;
 b=zc2FBs7z5S2aHmF35iyYbauzzs8pRQm213RXAZUZaRZNWslRhXz7GnASQPLyM9q/en
 7T7cS+egsJAyLZFRLbx7NDJfF7bR4qg2p6bVpUTK7EaYjSnkaN9TwDBdnYS2FZv1OMze
 OArWpi9IQhYJzBZzu34oUWewKmSIdOSPNjcmqEyjVXDHLLr94SmkSWe2CD5IobsS/yu7
 s7m2DrWXIVweiWMi4MPzTIjSnx7kc11PmofHBo8+h23lqLKL0gOc6ET0NNqAzz04sM4B
 m9HbhJo3a9IIGRKYGLLFR5NiFHKFsv2DGOZBtC71SWrsD90AKlEaov7T1msz1ppAHosn
 yQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yH4ZTSk2dw1y5h5K76pORaKv4pdr0m6BUkDf5tas0UM=;
 b=T4Tp7JlxGG8749nQFQ6cCB45GpIVpZUyN+K8eAaPcNHKT5+26dUehd/N1ROVN5qhwq
 +QKRLQG9GSSKZ/WujOS42afgO/3qSD++e2wjsqG/KU8lQhNJLwNPcgWcmW9acZlyCIjq
 BqxSAdf7kT7OwB6Ylrp+5uq1/Or8xbUzImcVH+TEOABEU8pZHkIuAJci3Zh6OMUEZwB3
 MxelSndxDFGojEfl6yFu6Irbi1BUoZN77/w8lQ7ttUXrZOkLnKOtGAeNrHHekldf55ox
 qoRch9Sf5gsCE5pbXxp2SdQ3ZHIBxhMtRz4Y3UVQXa96ZkeqeKK5ovsauRIgAYrcgfJr
 DM1Q==
X-Gm-Message-State: APjAAAXZhZU8zn4yHJVyR+P9lheZLNzhZx2u/sSTORjKlMHGCSUfNSnZ
 10uuGRIEggVh2JykSea0hcK7/O3aTCc=
X-Google-Smtp-Source: APXvYqzswOHaJVWMVNqCnIuTNovQzfrpQ6257D/8Uph/LNaRknSti77zAUS9MQUECjWMbtME96+0MA==
X-Received: by 2002:adf:d08b:: with SMTP id y11mr1934045wrh.50.1570007732457; 
 Wed, 02 Oct 2019 02:15:32 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id r13sm32913737wrn.0.2019.10.02.02.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 02:15:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 0/7] clk: meson: axg-audio: add sm1 support
Date: Wed,  2 Oct 2019 11:15:22 +0200
Message-Id: <20191002091529.17112-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191002_021551_651025_445DDC42 
X-CRM114-Status: GOOD (  11.19  )
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
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The purpose of this patchset is to add the sm1 support to the amlogic audio
clock controller. The line count is lot higher than what I hoped for. Even
if extremely similar, there is a shift in the register address on the sm1
which makes a bit of a mess.

I could have patched the address on the fly if running on sm1 but the end
result did not save much lines and would have been a pain to maintain and
scale in the future

Instead I choose to re-arrange the driver to share the macros and declare
separate clocks for the clock which have changed.

Changes since v2 [1]:
 - Add missing gate ops for
  * sm1_clk81_en
  * sm1_sysclk_a_en
  * sm1_sysclk_b_en

Changes since v1 [0]:
 - Fix newline in the last patch

[0]: https://lkml.kernel.org/r/20190924153356.24103-1-jbrunet@baylibre.com
[1]: https://lkml.kernel.org/r/20191001115511.17357-1-jbrunet@baylibre.com>

Jerome Brunet (7):
  dt-bindings: clk: axg-audio: add sm1 bindings
  dt-bindings: clock: meson: add sm1 resets to the axg-audio controller
  clk: meson: axg-audio: remove useless defines
  clk: meson: axg-audio: fix regmap last register
  clk: meson: axg-audio: prepare sm1 addition
  clk: meson: axg-audio: provide clk top signal name
  clk: meson: axg_audio: add sm1 support

 .../bindings/clock/amlogic,axg-audio-clkc.txt |    3 +-
 drivers/clk/meson/axg-audio.c                 | 2021 +++++++++++------
 drivers/clk/meson/axg-audio.h                 |   21 +-
 include/dt-bindings/clock/axg-audio-clkc.h    |   10 +
 .../reset/amlogic,meson-g12a-audio-reset.h    |   15 +
 5 files changed, 1373 insertions(+), 697 deletions(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
