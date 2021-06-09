Return-Path: <SRS0=+B/b=LD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A69A3C48BCD
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jun 2021 21:12:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 315F06140C
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jun 2021 21:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 315F06140C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QmVggk86P8CftK/djOQc+dlzJ56+N8zDHMeafgVOUwU=; b=luRy3bmC/zDJWy
	R2mGpTeFUgRgCx/OZcpysfVm6uIho9ZCQxhBt8pmMHtvWtlqGp7jXO0+U/B8dmJwv/immsFFLBnoQ
	at64KVtWMKudhvt5jVd/YT2c8OmGXBAGj/js3IomjptuMaJyixdpIlNzw2uuKrpUWYEKcyV3ZjDmO
	eHFR4r8mG24mygnXozykMo3HCMgHbx9Ho52PjPoBMOq3znhcK5fZmEU6cjv64Vt70F+h5UoVeYe/r
	e22A0foIehT6iEoNVMSSLo2xgMq+BuD4Ghjt99/7Xb5WAdj0S+im0x72fZI1YAV+ur2VTgA0BIIkZ
	PBcZxazCUSWyNBXgvMdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lr5Uf-00FtYA-GA; Wed, 09 Jun 2021 21:12:09 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lr5Uc-00FtXr-DK
 for linux-amlogic@lists.infradead.org; Wed, 09 Jun 2021 21:12:08 +0000
Received: by mail-wr1-x42e.google.com with SMTP id c9so18308429wrt.5
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Jun 2021 14:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=user-agent:from:to:cc:subject:message-id:date:mime-version;
 bh=3VtZ8ivaZvGzK6Q1s3dI3c9qaKU47zDuYw8RL8xc2lc=;
 b=SBfTK/ksMVjYx1JSJn/DqFxv4tUY9JJUVK27Kl8WOCOp61H7xuCGKLdva1v8/8m7w7
 PSD0OfU90j/oxzYUqquuSGTKuAfo5vKV9hXSwoO5l4mbimZtpgS8ba6EZWiV+1gTt2aI
 TWwvIPtl4umSjNPiZjw9bSANLMADqxENv5/GzR7Q4A7QhnPocoNiIlGji1ALkibrccc8
 ZB5btbuJkPy5noNfAjk5TC8oqAGoTq+NNiskHieboLMjh+gjwdRJ9+CIktrcTizqNPeq
 vYJwnvjn5lviCLkLPfu279CIbRAyJ+7qvDuUoXfxGAufPF76OA8NyHPtc1ccFt0biydz
 yJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:user-agent:from:to:cc:subject:message-id:date
 :mime-version;
 bh=3VtZ8ivaZvGzK6Q1s3dI3c9qaKU47zDuYw8RL8xc2lc=;
 b=tnEYkQyLayJvIM6oB7bkwdWfciX2VAd6LZl88ePPjKzBQA+yA9C+Cg68OQyFZJbBlj
 15BWzekV9L4wvuPdj7eGLB1t3DGNsZPCtDqtbhIx1cRwS6p9WsK4tPDOy5Xtt7yGdy2P
 9KhIKewRyY/JZhsPOzeZ6s4nuitYzB5XvEFwr+dOPACBq009YWoRmb/j2W2DX/3JxkTG
 WHFDnHRJOYok9WnCLrIMac9OKayWqlS5vjJghvC6257GnddwDTccLjumFmky4erWsMub
 oaVzGt/We9oi3Ml2jwBNeSqdKcchzT2wbo++Ue2D5DCxXG1Tn+tfXF0HlUlls35/7f47
 PvJA==
X-Gm-Message-State: AOAM5302f8hoYr3+/reH82l0uJa1U+taMp1yioVk152kZIe3b3SXxLiE
 XWiW842W0w3sMvbImhEPu1AVwg==
X-Google-Smtp-Source: ABdhPJxm0KumdxJ4X/b0nxIMWOW9OqcX4x3xSUJgPGSBixUDqwWMmR+eUSjag7O+08+8JpfImBLl9w==
X-Received: by 2002:a5d:4567:: with SMTP id a7mr1759586wrc.362.1623273124616; 
 Wed, 09 Jun 2021 14:12:04 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id g17sm1346392wrh.72.2021.06.09.14.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 14:12:04 -0700 (PDT)
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, linux-clk@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: [GIT PULL] clk: meson: amlogic updates for v5.14
Message-ID: <1j4ke6215o.fsf@starbuckisacylon.baylibre.com>
Date: Wed, 09 Jun 2021 23:12:03 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_141206_901857_AB67E94E 
X-CRM114-Status: UNSURE (   6.06  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


Hi Stephen,

Here are the updates of the amlogic clocks for v5.14. Nothing out the
ordinary. Please pull.

Thx.
Cheers

Jerome

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git clk-meson-v5.14-1

for you to fetch changes up to 8271813e404cd0620f99fbccffd2746f85a17259:

  clk: meson: g12a: Add missing NNA source clocks for g12b (2021-06-09 21:39:50 +0200)

----------------------------------------------------------------
Amlogic clock updates for v5.14

* Use determine_rate() for the pll ops instead of round_rate()
* Restrict gp0/1 and audio plls range on g12a/sm1
* Improve axg-audio controller error on deferral
* Add NNA clocks on g12a

----------------------------------------------------------------
Jerome Brunet (2):
      clk: meson: g12a: fix gp0 and hifi ranges
      clk: meson: axg-audio: improve deferral handling

Martin Blumenstingl (1):
      clk: meson: pll: switch to determine_rate for the PLL ops

Nick Xie (1):
      clk: meson: g12a: Add missing NNA source clocks for g12b

 drivers/clk/meson/axg-audio.c |  5 ++---
 drivers/clk/meson/clk-pll.c   | 26 +++++++++++++++-----------
 drivers/clk/meson/g12a.c      |  8 +++++++-
 3 files changed, 24 insertions(+), 15 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
