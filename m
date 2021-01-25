Return-Path: <SRS0=vGGV=G4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1062C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Jan 2021 13:18:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C7A922D50
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Jan 2021 13:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C7A922D50
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y1DZs8gSk+SW170JxguDtjOyJ8KuPIhxHh73+QWvqDM=; b=vpJtde3ml3IvdZzM2rZRkIM/QR
	ZSZ2c8/YtUp+Id5mEDv2WJo7wDa4+KqDbgNbBVJkqpS0AMR18yIW7Flz75yGyf+v7bjLhR4Vko2H2
	ZoaafnCdga8uaSAXeZ4A1LeIDdOd74SQ5bgUKw5O3oHSF63tTypGwl/7lbS1aSqDPoiMwuk7Rm5Oh
	zF3hvthxPO5myKZpzmY2YFxL4dK9O0NEyUfQxxZSuCcGyetxXzpJ2gATzdlU5gBsp2MLM/p0wvbfX
	jPul+H8qbfbJAGD3CdKiOycFpHeyTg7Z4+hdgJd+92bx1vaOsBN4iRB04gMzWsRJdWJTbQemaOAe+
	8481dyfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l41lW-0006Gi-18; Mon, 25 Jan 2021 13:18:46 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l41lT-0006FD-1e
 for linux-amlogic@lists.infradead.org; Mon, 25 Jan 2021 13:18:44 +0000
Received: by mail-wr1-x42b.google.com with SMTP id l12so12462367wry.2
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Jan 2021 05:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=user-agent:from:to:cc:subject:message-id:date:mime-version;
 bh=8xoToqjd1UStdUQYba00mf5Yg6qyUV8aYxspMqz+348=;
 b=MQAyMG6wHg7Oy8c3zLqnYJjF72gC3raqFDf//YAuZCo8u3RwBwWpYuLmJwRLPkXTyx
 HLzpHZk5Z0Voh/CcWeCtqt+c+gio/sK9KGyaiQxgG36er7rqrg7s8fIsLcU/zKjVVzy8
 2WfibzURNra1hM6bdDWZqUNyAwjkMSSBsPeECNxnjp/ENpA61rmKKoYKyrdYCHK73Zva
 8qf/ooCa9yesM5NJ/Hdyh3b51/z9uJ/tCN9us4ofgOtSKzhgF544o3+WyHjAMpEOaDVI
 SeRTvPMZWnGdaQvt/1cIajy/kpAKE0b0x+/SifJlnAF1y4YxYXkkR77yQUtKiklsmDYY
 V2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:user-agent:from:to:cc:subject:message-id:date
 :mime-version;
 bh=8xoToqjd1UStdUQYba00mf5Yg6qyUV8aYxspMqz+348=;
 b=C6TKZ2YZz4002th0Bus8ACQayqIFVycejcUQHD54ZmFn4aFSqLUO1rRLIrrLbx/7Xm
 GpaxL5XTphy1W+mkcNBbymHMCKILRDX4YgwsbLd1QkYGxHVi93D+ovxQnKMXptzNgzxS
 I+OrJontoXZpJPGAUsHsRpr89HGuKp9BFQIxx/m65xhqakahDGnpWlcTvpsSK/DwIjuO
 MFeKyKQP+zlMPUh9GsrBXT09vje2D87m4PfkW/U2B/ILx0h7RKfn9riroTJJzR1TvPSc
 tHrKe9SeADVZUXEbp4g24Kz7AJcpr7EPhxgA5ldBxswtSnbf3hMAAlU6oYMccgLfo3OM
 YFSA==
X-Gm-Message-State: AOAM532U5U14mrBptr9xvRVQfrfFil6OB2VTzmitNaTDOXq3vdO2mM15
 0z4Z6tCpGZS9Od69YfKYwRU74g==
X-Google-Smtp-Source: ABdhPJzCGzDFsaH+t49kkVepF1jOykGdNIRNUK5oB4G6A6Jm8xyhEmlL9BIViv50I+WDYDtxIsxAWg==
X-Received: by 2002:a05:6000:1542:: with SMTP id
 2mr953692wry.356.1611580717460; 
 Mon, 25 Jan 2021 05:18:37 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id k15sm10333615wmj.6.2021.01.25.05.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 05:18:36 -0800 (PST)
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Subject: [GIT PULL] clk: meson: amlogic updates for v5.12 
Message-ID: <1jy2gh17f7.fsf@starbuckisacylon.baylibre.com>
Date: Mon, 25 Jan 2021 14:18:36 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_081843_237839_76E3A1D0 
X-CRM114-Status: UNSURE (   7.14  )
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

Here are the updates of the amlogic clocks for v5.12. Nothing out the
ordinary. Please pull.

Thx.
Cheers

Jerome

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.12-1

for you to fetch changes up to af57824425389adab637a2ae872ac488f50b5832:

  clk: meson: axg: Remove MIPI enable clock gate (2021-01-04 12:03:02 +0100)

----------------------------------------------------------------
Amlogic clock updates for v5.12

* pll driver fixup
* meson8b clock controller dt support clean up
* remove mipi clk from the axg clock controller

----------------------------------------------------------------
Martin Blumenstingl (5):
      clk: meson: clk-pll: fix initializing the old rate (fallback) for a PLL
      clk: meson: clk-pll: make "ret" a signed integer
      clk: meson: clk-pll: propagate the error from meson_clk_pll_set_rate()
      clk: meson: meson8b: remove compatibility code for old .dtbs
      dt-bindings: clock: meson8b: remove non-existing clock macros

Remi Pommarel (2):
      clk: meson-axg: remove CLKID_MIPI_ENABLE
      clk: meson: axg: Remove MIPI enable clock gate

 drivers/clk/meson/axg.c                  |  3 ---
 drivers/clk/meson/axg.h                  |  1 -
 drivers/clk/meson/clk-pll.c              | 10 ++++---
 drivers/clk/meson/meson8b.c              | 45 ++++----------------------------
 include/dt-bindings/clock/axg-clkc.h     |  1 -
 include/dt-bindings/clock/meson8b-clkc.h |  2 --
 6 files changed, 11 insertions(+), 51 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
