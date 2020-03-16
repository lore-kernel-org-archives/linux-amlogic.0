Return-Path: <SRS0=TbEC=5B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A516AC3F2CE
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Mar 2020 21:35:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7963020679
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Mar 2020 21:35:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J3gWSgtT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LOGql7I8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7963020679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9A6YQegD/uoiTpHf6KcOrGmTl0RGPGJ9gMj3PLDPODI=; b=J3gWSgtTfXV/1x
	qc9x3GtekD6AgEEkg4ig+Cvr/IoPL09qziTQQZRYt65WEqq/jK07m7syeCio0H4Pu6f7TLZZok29I
	LytCSDNH4sHDZsHDNYRV/YSw79/4sSb4X8fpi5nQfcAWwUfjmsnijNXDc7AmVvZf8mGi7m35nK+bv
	l8UOTVJV66EwOUb/XHuvqgOgTiITcQzoJf0BGTqqKOX2uaACnDykldFl1saWXcSMEqbmK2fbSYkOA
	xLfRr85Ofeb7u61qXQlX2B15CkJ3FAOT3GAqPZrnGDk2HqU0JCt4+d17pbQYbw9n803PFcG/nl//L
	x9uzwrbEPMfW0c5Gf2lg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDxOG-00023J-Mb; Mon, 16 Mar 2020 21:35:16 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDxO6-0001GT-IQ
 for linux-amlogic@lists.infradead.org; Mon, 16 Mar 2020 21:35:08 +0000
Received: by mail-pg1-x542.google.com with SMTP id m5so10483595pgg.0
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Mar 2020 14:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=kGMxo20LU+fXaJ0iQYb8+S13qwzWPsSgredfgAygFoY=;
 b=LOGql7I8bSFMmzE0IGW6jgK0x1oBx0hWOFu3k+j/byJSyg00ea0q1oPd3J9YrDoBlr
 ErjSGa00z7cZqVkRh1GXGam0Iob0+LvTMr0UWHBI2vjqfcZQPT7eU6vURpwR1pd6dypv
 De7/s9TgbjZhmuoTC4O6zcogfChHi2Q6JXsrCHjqI2A3OCbZmHgHRFSL42f/K1GG2zLp
 DIIVUMRebsefZCyYOzc3d/xCjt5fUIjClI/duls5o77BPB5DivF4fSgqixuI/zQknMpW
 FvswhrEWSyT9MEkHcJsB8Eh3p3S+7XimNV6Gk7E3C6bjoviwITJ5Vqe/bwMNlDiQMT9r
 PANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=kGMxo20LU+fXaJ0iQYb8+S13qwzWPsSgredfgAygFoY=;
 b=Nq6HRAh/BHYjnHiRK9/kEo/pWzUF+rdl0ZtXm757QpyoC4Q5l3IGajp7G8Obx5d0b4
 wo4SFcMEQ1W4Vb2hzZ/Ohp/H5LIGM8bNY/2OPkzJ90R4r2xY9utR0wzPIWjKx/2DbtpR
 CNwGgF2ilBvMmaFCwszSKacAFHtYZyZnID4RFXHEPVB5NS08/R7eplzuM1C+xJQ98KCB
 k13jl/DOSoKSuIx5Tgi4bt+npXVI/IhcNaqnnTfL/NtXkAzw6QuV1O3/9OUS0XLVCLmr
 SUox6aaVgn85P2nJeCYbSdCvvDgmSkeO4vvCEzJNgrDYEJoYHvZNp+i8H4qPxKSS0q+N
 mzIg==
X-Gm-Message-State: ANhLgQ3SeOQbTY4vFBlGTwb1+nEOPlfcpwuHk3KDNvgto+lnmlSUCwdn
 UaaB5sd8WXVmrJP3M1+ChgqPZxdNxbg=
X-Google-Smtp-Source: ADFU+vseYOPv4xp6NnuNLAlsRWCSYMVRa6zF12LGHtUCYM279p+UmioUsLKlrKmKv/VjCIx7SCluFQ==
X-Received: by 2002:aa7:99d1:: with SMTP id v17mr1753776pfi.165.1584394504998; 
 Mon, 16 Mar 2020 14:35:04 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:dcc4:2a10:1b38:3edc])
 by smtp.gmail.com with ESMTPSA id u24sm400505pgo.83.2020.03.16.14.35.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Mar 2020 14:35:04 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL] soc: drivers: Amlogic updates for v5.7
Date: Mon, 16 Mar 2020 14:35:03 -0700
Message-ID: <7hpndcugoo.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_143506_680969_352913C1 
X-CRM114-Status: UNSURE (   9.60  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-drivers

for you to fetch changes up to d85eed038ef4919933b7f4f9d3b4f49ede4092aa:

  dt-bindings: power: Fix dt_binding_check error (2020-03-03 00:41:21 -0800)

----------------------------------------------------------------
soc: drivers: Amlogic updates for v5.7
- Add secure power domain controller

----------------------------------------------------------------
Jianxin Pan (5):
      firmware: meson_sm: Add secure power domain support
      dt-bindings: power: add Amlogic secure power domains bindings
      soc: amlogic: Add support for Secure power domains controller
      soc: amlogic: fix compile failure with MESON_SECURE_PM_DOMAINS & !MESON_SM
      dt-bindings: power: Fix dt_binding_check error

 Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml |  40 +++++++++++++++++
 drivers/firmware/meson/meson_sm.c                                   |   2 +
 drivers/soc/amlogic/Kconfig                                         |  13 ++++++
 drivers/soc/amlogic/Makefile                                        |   1 +
 drivers/soc/amlogic/meson-secure-pwrc.c                             | 204 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/dt-bindings/power/meson-a1-power.h                          |  32 +++++++++++++
 include/linux/firmware/meson/meson_sm.h                             |   2 +
 7 files changed, 294 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
 create mode 100644 drivers/soc/amlogic/meson-secure-pwrc.c
 create mode 100644 include/dt-bindings/power/meson-a1-power.h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
