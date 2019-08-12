Return-Path: <SRS0=Dn2N=WI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCEFC31E40
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 09:27:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFFF620820
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 09:27:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ONIR40qm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="RrLAVjZF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFFF620820
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wUhjg/BZhF0So9a/nYogkvUSco4/MtubdZR3HNlIjLM=; b=ONIR40qmK6hfcJ
	3aHxDHCEe+M0KuZ9l0cSecDpaX1xfy8IWETXcg+X+R/bGfqRd48a7Lhx95J6jj4M2WnhYFsOmaEKm
	5D/NJ/bZIEFUpMf7JNbLwGYhgJWy6UwDqdysYCRJzf3hN9nqmpfjegF21QNZ+Hrottdian2FCj87u
	8GKTz+AE6UMGu6F5aUQcLAVs/b/ucbpk+hFR8pMh8fSxsR3aRHnmtF+seqYF6QHdmGlXSPmlOK91V
	fFBnIL1iQv3d69tAKUVZKwUrHjiaxnKJuO7Q1P02prUH3qBkCjpZleVn5IIdNBQXS7C+9wMBg1jcb
	F/IdNU4kgGVD5JRFOt3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hx6c2-0004M2-W7; Mon, 12 Aug 2019 09:27:34 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hx6by-0004LX-Sv
 for linux-amlogic@lists.infradead.org; Mon, 12 Aug 2019 09:27:32 +0000
Received: by mail-wr1-x443.google.com with SMTP id z1so103943283wru.13
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Aug 2019 02:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=GR8qazzT8f+x8TL8FuamVXWkhCPQ1djbAEb+Khg42sE=;
 b=RrLAVjZF5SLIr6VfF2oWZrWLYXA8e5cWwLgTx36VNXuqgTLeQQ/SQfWRcHiJYyfUrA
 IGv/Lxu16lKhAm6B0AgwWIDyTct+pV0UiTJu5MeFxriXbDUie6XScNXpKOV35k7R1+F0
 OusIDfq8L3juao3bjzzwYcFGWmwlwOHH+z70XkFLFWUN/v4olG6VbkCdvFJDli5OcZo4
 ov+yk7AOiAW5DCcVFdUiiwxmWRUQc8pu/gMnFBL7Zx1Pzjn/n5iwaOH2fPOaN3kIoStf
 UnywNeArFDSMizKAfArpadSUz2WNoqg8NVbkL7Sbtt4lv8qvoBSGvu7TpJ2Y9fB2XXkB
 T+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=GR8qazzT8f+x8TL8FuamVXWkhCPQ1djbAEb+Khg42sE=;
 b=JcZlMq4WE3MP7dJ+dZjqfh/36t9oygMDA/EWAH8ScLaHAOl67ZbWzkJfMtPJiFHvI5
 Ed01HdkK98U9NmiG1mtR9No9u4BCLQT6sz6wQkDy+Tn0GcIwmiES4jk4IX2dxXyK3D8m
 wR47+0zfQHs4RiSQzqT5Ct9R1hfsLN5laq3b6adpzLwUoB5cYRGrCuYNk2WEJCFvPwVM
 i2l8FU5F/bqJxUKpmQRrJCZFcGuMzKrFBk7WHs1FC9K1pdw3531shs0tmFhqnOszJ4zo
 6/dgEzaNGmksczrgFPCI2/d7ZA8m5rDdqPX6G8Tl7vcvGEn6uZOCKuXDhmYSga3s80hD
 c3pw==
X-Gm-Message-State: APjAAAVNNNBAgFiIYCVEyyZqcd6mQc3izhCnVecuzDzjQeVbYHzrl9Eo
 WOw5O/+HWisK28ylQH6OW+yHfUrWN4w=
X-Google-Smtp-Source: APXvYqwNXwv21TNgxSZ+0VY405tXAlYYxJaz7T+p7H+h/IRdCcNfuHJdCdbF82S7YVCmO7WqJh4xzg==
X-Received: by 2002:adf:eb4e:: with SMTP id u14mr39668555wrn.168.1565602048674; 
 Mon, 12 Aug 2019 02:27:28 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id p9sm4940942wru.61.2019.08.12.02.27.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 02:27:28 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [GIT PULL] clk: meson: updates for 5.4
Date: Mon, 12 Aug 2019 11:27:27 +0200
Message-ID: <1jr25qivi8.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_022730_998103_F57FF613 
X-CRM114-Status: GOOD (  11.42  )
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


Dear clock maintainers,

Below is a request to pull Amlogic clock updates for v5.4.

The main changes in this PR are the migration to the new parent
description method and DVFS support on g12, based on notifiers.

Kevin requested a tag to test DVFS so sending the PR now so he can use
it well. We may send additional changes later on.

Cheers
Jerome

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.4-1

for you to fetch changes up to 1d97657a4794ab23b47bd9921978ddd82569fcf4:

  Merge branch 'v5.4/dt' into v5.4/drivers (2019-08-09 12:12:58 +0200)

----------------------------------------------------------------
Amlogic clock changes for v5.4

* Migrate to new clock description method
* Add DVFS support to g12

----------------------------------------------------------------
Alexandre Mergnat (13):
      clk: meson: g12a: fix hifi typo in mali parent_names
      clk: meson: axg-audio: migrate to the new parent description method
      clk: meson: g12a-aoclk: migrate to the new parent description method
      clk: meson: gxbb-aoclk: migrate to the new parent description method
      clk: meson: axg-aoclk: migrate to the new parent description method
      clk: meson: remove ao input bypass clocks
      clk: meson: g12a: migrate to the new parent description method
      clk: meson: gxbb: migrate to the new parent description method
      clk: meson: axg: migrate to the new parent description method
      clk: meson: meson8b: migrate to the new parent description method
      clk: meson: clk-regmap: migrate to new parent description method
      clk: meson: remove ee input bypass clocks
      clk: meson: remove clk input helper

Jerome Brunet (1):
      Merge branch 'v5.4/dt' into v5.4/drivers

Neil Armstrong (4):
      clk: core: introduce clk_hw_set_parent()
      clk: meson: add g12a cpu dynamic divider driver
      clk: meson: g12a: add notifiers to handle cpu clock change
      clk: meson: g12a: expose CPUB clock ID for G12B

 drivers/clk/clk.c                     |    6 +
 drivers/clk/meson/Kconfig             |   11 +-
 drivers/clk/meson/Makefile            |    2 +-
 drivers/clk/meson/axg-aoclk.c         |   63 +-
 drivers/clk/meson/axg-audio.c         |  261 +++---
 drivers/clk/meson/axg.c               |  207 +++--
 drivers/clk/meson/clk-cpu-dyndiv.c    |   73 ++
 drivers/clk/meson/clk-cpu-dyndiv.h    |   20 +
 drivers/clk/meson/clk-input.c         |   49 -
 drivers/clk/meson/clk-input.h         |   19 -
 drivers/clk/meson/clk-regmap.h        |   12 +-
 drivers/clk/meson/g12a-aoclk.c        |   81 +-
 drivers/clk/meson/g12a.c              | 1626 ++++++++++++++++++++++++---------
 drivers/clk/meson/g12a.h              |    1 -
 drivers/clk/meson/gxbb-aoclk.c        |   55 +-
 drivers/clk/meson/gxbb.c              |  657 +++++++++----
 drivers/clk/meson/meson-aoclk.c       |   37 -
 drivers/clk/meson/meson-aoclk.h       |    8 -
 drivers/clk/meson/meson-eeclk.c       |   10 -
 drivers/clk/meson/meson-eeclk.h       |    2 -
 drivers/clk/meson/meson8b.c           |  710 +++++++++-----
 include/dt-bindings/clock/g12a-clkc.h |    1 +
 include/linux/clk-provider.h          |    1 +
 23 files changed, 2626 insertions(+), 1286 deletions(-)
 create mode 100644 drivers/clk/meson/clk-cpu-dyndiv.c
 create mode 100644 drivers/clk/meson/clk-cpu-dyndiv.h
 delete mode 100644 drivers/clk/meson/clk-input.c
 delete mode 100644 drivers/clk/meson/clk-input.h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
