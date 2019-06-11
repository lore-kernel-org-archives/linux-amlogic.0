Return-Path: <SRS0=5QiQ=UK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 510FFC43218
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2019 12:23:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2520620673
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2019 12:23:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vi/aGEtD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YsYy1GQV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2520620673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OGDnxK3G4yKO985u5obFDwxRlYGM6SPnammKPQEdaWw=; b=Vi/aGEtDaxrwn3
	bauAsNKUPhcNfStsXw7J+5ilXpGMcpToGTNYjS+9aZbzUSl276wCl+2ge1HP9KZSMTRS/MmY+QmAS
	SMANlifBkTBD1KailgqH8l/78VvsS7hJsGRnh6Mq1bffHd5aZ5WszS0hXLhfe1V00pvqS5M8o/BkL
	pDwsYcnHsqVDyzcTdHOi4eEljUQxoUHp14FNgs5aJ0V5inll1Ksh+XSWKi84b/NbrdBWrFXxNHt2V
	74ximn1yVskbBORQUTP2NGz56sBbZG3PmkhvblMqcRHMSzofiBocT3mo3IgoCJB4t33UpUf9Xd12V
	LdR9A4jSC9G/n0e9eX9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hafoS-0007wH-Ah; Tue, 11 Jun 2019 12:23:40 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hafoO-0007vm-TE
 for linux-amlogic@lists.infradead.org; Tue, 11 Jun 2019 12:23:38 +0000
Received: by mail-wr1-x42e.google.com with SMTP id m3so12820930wrv.2
 for <linux-amlogic@lists.infradead.org>; Tue, 11 Jun 2019 05:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=c73N5jUPM/J0OD+sWtA4JTF4ruEO6lqjlOFnfBibFJ4=;
 b=YsYy1GQVeHNTQznm9/zw9NwkAReGWAuXSF/wJB+OrCZRtpbp+rjw/uhQxFOTSY8jGc
 cdTQUPKB3/YClD6yimkLAnJNgPN7iAnSGY+cR/dSXGqAsiMz2XE8rKZ7aSPlDT86B51W
 i7fdCnAbqeSWReVeapblyV6F5E+MEs2t6CuVZt7ZlUWzx6s8PpiarBMxdMMHASnL0WqW
 TRSyQ5adYSe7qyBtaq0M1yuGWTEg9GX010tMqlbD44g2Fwp2o9jLe0mi2tir4a4vHxTm
 dQK3B9nExt6fKC7OAozQrP/Na35nKC9PWYko9AWsWNBQsV2GEoT/5iaPmiMBOMrbxVCa
 xmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=c73N5jUPM/J0OD+sWtA4JTF4ruEO6lqjlOFnfBibFJ4=;
 b=sbjfVNopUyvUChYOAy/Gu/PBd0XY4qr0jq7geUH1pIgDs5xf+zuCcoTOhmoFn9I2tK
 Y5YHveAKNbWDHUALA/6DZ0DeVmJ9C/zV3orNBdvFNM/qUhkeui4q8c5qdyH5VNhsyYQb
 VUffGYJ60vtwQkW+tFXVQqL/GSZYHn7nLSQ33iePqKFveiskd2FhUzcZGbdcC95Fpvrt
 bcb4eveklsc+pEiz94VxuRFYs+dNQZsKuaQp6MicRyjrSBhS1ggoa5zaAje0aCDlAumE
 UzifECF3gx8mLRoClwzcZlGfjg5x4JxDCp3VEM4GYkzzrVV8y2Gm1eGLpSDqgytbWy5k
 Spbw==
X-Gm-Message-State: APjAAAWsv5uu1uQGNtvODTEpRReYfeT3dEZpDRfL4DJs9El8LAdb20G1
 2batsR3P8XlPoNg7SR4RZeBT+Q==
X-Google-Smtp-Source: APXvYqwYlZ+zFYRWi8q9YLBImzdjepRt/8CxplAnJJHZ/hUrbiOzzjhfkLhOcltyUANCG0YK5OxoGQ==
X-Received: by 2002:adf:fbc2:: with SMTP id d2mr2661934wrs.334.1560255814706; 
 Tue, 11 Jun 2019 05:23:34 -0700 (PDT)
Received: from boomer.baylibre.com
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id b2sm19572023wrp.72.2019.06.11.05.23.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 05:23:34 -0700 (PDT)
Message-ID: <a834836da8de689ec541093f3226a853af001fe4.camel@baylibre.com>
Subject: [GIT PULL] clk: meson: fixes for v5.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>
Date: Tue, 11 Jun 2019 14:23:33 +0200
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_052337_083257_A835AB5E 
X-CRM114-Status: UNSURE (   9.01  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Dear clock maintainers,

Below is a request to pull a couple of fixes on Amlogic clocks for v5.2
These are typos in recently added clocks, the most annoying one being in
the DT binding identifier on the MPLL50M which is used by the network PLL.

Regards

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/clk-meson-5.2-1-fixes

for you to fetch changes up to 3ff46efbcd90d3d469de8eddaf03d12293aaa50c:

  clk: meson: meson8b: fix a typo in the VPU parent names array variable (2019-05-20 12:11:08 +0200)

----------------------------------------------------------------
MPLL50M DT bindings typo fix
Meson9 VPU typo fixes

----------------------------------------------------------------
Jerome Brunet (1):
      clk: meson: fix MPLL 50M binding id typo

Martin Blumenstingl (1):
      clk: meson: meson8b: fix a typo in the VPU parent names array variable

 drivers/clk/meson/g12a.c              |  4 ++--
 drivers/clk/meson/g12a.h              |  2 +-
 drivers/clk/meson/meson8b.c           | 10 +++++-----
 include/dt-bindings/clock/g12a-clkc.h |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
