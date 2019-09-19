Return-Path: <SRS0=mQoY=XO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D073DC49ED7
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Sep 2019 10:25:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A60E621A49
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Sep 2019 10:25:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KeIwIxd5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ARPIhl8y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A60E621A49
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wwoqu7cgwfBfaFZfFd2zms8CvYGMcsP36kHC4Spt2ig=; b=KeIwIxd5BEdLks
	CCifdBMb5QM95grDC6wy8NgBEZGjHZIo7RI3biBBm3a0cxdKycz/r1SDIFXGDHCM+olsQTgYRkMHs
	sFBPz5H8S2YZ1Uy2g7Oq+Zyxh9yUhWffRrWH5m0ep0A8iIk491ELd9NjDXT5P12gOuBFf8TQiKkyj
	EWHR/G1pv4AJI4jPLn8NAO1JJ9KFGo71UnrfmH+Y7a2rzwPiWAj2F68kXGcpir9xD4/GxyIhkVwtP
	I+uD1sPbAluwAr0l3X+/ANGQLH5JReDrkLj0LtxAFQgfRZNzHtgdAlGd8RATD1cxW1b/3KSsV1Hwc
	UygsNYXqeTy1r7eYol4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAtcs-0002xZ-Iu; Thu, 19 Sep 2019 10:25:26 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAtcq-0002vz-59
 for linux-amlogic@lists.infradead.org; Thu, 19 Sep 2019 10:25:25 +0000
Received: by mail-wr1-x441.google.com with SMTP id i1so2505737wro.4
 for <linux-amlogic@lists.infradead.org>; Thu, 19 Sep 2019 03:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2A0oosZIpjBMenE6Tjm33BxMZdklQECEBVCtAhWMYQs=;
 b=ARPIhl8y30FO/F6oN6rrJzhE+e4JFkdGSwgjSFtfDZWZcWA/5EH5LBr4L6b0SKWglH
 UbVGQsTdPnHYSTM0FLHAvMtgmlZahzJaO25HwC8vbQ12W7cm3h9dFlL3FkstMUbU3S28
 4fm6Vth4wRpsGNZHNR6meJZD//S5QE3E6NFqQnYecq2YfXug/zatNdwqIm9lhAAKb9hY
 Mk7OrUEA6satXsZqIOlyBR39Nioo4KQgA4VYIhCnVz9Y91y2ppbs4ap7veYd6uCv2lOI
 pjhQdI9L7aOmQq/5zwbXHxCW9UhgyjR6TRmw74BMHQyWnyMsXrvAs6P17sdEuZdTqPji
 QWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2A0oosZIpjBMenE6Tjm33BxMZdklQECEBVCtAhWMYQs=;
 b=LrYU4kAWMK4UYiyiPQqE9a+UETc0NsJq2DJ3MYhPff6SJ+Y9SyqK5HzxMTA3YBB6mJ
 tzrQ/peIwsjSiNbPZdtWFQTJGaQ7B7H81vr3oDXX2aD/oOVSazXxgnbV2NGzSeSwnVRk
 mUSx9Adyd+mQLEIMEGTfFK/JO79z09X3rxCw1f7OD0W339wJmQiFXlgQCK9VbJUsTp1I
 tOCXutrqfpZ+vdTKdXSo0YD5Oh3xZWZKUp8/AawTkcBl6nliIwszvep1wjOwTNrDUtl6
 gxBhLs+FqmSaTzhxzcf1RvEWEcrUNU5YzsXKd9PhHIZHVeHA+M8Oo64iVel8NleIaZGN
 hhfQ==
X-Gm-Message-State: APjAAAXwu3DU6JJUGXaXvzHrs38XoQdlkw2HJJMm8miipr9aI4bQ7zjF
 hasS9vUYbKcpLKYu4Wfjp2iBfA==
X-Google-Smtp-Source: APXvYqzpnu2phlLQMoNEuMIncosAx77n7gxWTvOlJbGfGU75RyLU3YIELaLuaI5zdmBNdg+SLbrCIA==
X-Received: by 2002:adf:cc0a:: with SMTP id x10mr6471942wrh.195.1568888722613; 
 Thu, 19 Sep 2019 03:25:22 -0700 (PDT)
Received: from bender.baylibre.local
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id a18sm19542000wrh.25.2019.09.19.03.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 03:25:21 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: sboyd@kernel.org,
	jbrunet@baylibre.com,
	mturquette@baylibre.com
Subject: [PATCH RFC 0/2] clk: meson: g12a: handle clock hw changes while in
 suspend
Date: Thu, 19 Sep 2019 12:25:16 +0200
Message-Id: <20190919102518.25126-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_032524_196429_DDA0FFBE 
X-CRM114-Status: UNSURE (   7.52  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This serie aime to support when the suspend/resume firmware alters the
clock tree, leading to an incorrect representation of the clock tree
after a resume from suspend-to-mem.

For the Amlogic G12A/G12B/SM1 case, the SCPI firmware handling suspend
alters the CPU clock tree in various ways.

Since we know which part of the tree is possibly altered, we introduce here
the clk_invalidate_rate() function that will rebuild the tree from the
hardware registers in case parents and dividers have changed.

Finally we call clk_invalidate_rate() from a new resume callback to refresh
the CPU clock tree after a resume.

With the clock tree refreshed, CCF can now handle the new clock tree
configuration and avoid crashing the system on further DVFS set_rates.

Neil Armstrong (2):
  clk: introduce clk_invalidate_rate()
  clk: meson: g12a: add suspend-resume hooks

 drivers/clk/clk.c        | 70 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.c | 71 +++++++++++++++++++++++++++++++++++-----
 include/linux/clk.h      | 13 ++++++++
 3 files changed, 146 insertions(+), 8 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
