Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31D8C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 15:34:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9335A20693
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 15:34:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XrXPalvX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wHR4ItWv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9335A20693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jXI4UwA7sTiqZR96Lo4gDjZ6HLHmHA20ylLTc22uswQ=; b=XrXPalvXivy1io
	GH7DI+cJSRxJcyHmk/B9W+G9QPL+Xhr6O52xUDge81TDVj82x9v6CYN4JPAOawXlRwBqWQVLBB66P
	zaTF6qOIGhqpaS6AkE+GcgQ2OP0zCwD4tY5oZKbtdnd7elE54IBE5YtZqUtLbfJ+XbMNRLGo7cwYm
	RMmTNFEneWY3cBCI94Cm8nke4cCLh+ZcTiK56+Z7sR/ILapkGwj/jaqZGQ7vrXoqA447S0kZz+cV+
	8977tNYSlpVdSymto3ECOcDobLObwXTGNx3MiCE6qro77qLRliYwsaev1O/s/zgVHkg/KkKN3Bn6Z
	GjkWU2SXo4NA+weEcpQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9tW3-0005R8-I6; Fri, 29 Mar 2019 15:33:59 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9tVf-0004z6-31
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 15:33:42 +0000
Received: by mail-wr1-x442.google.com with SMTP id k11so3121087wro.5
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2019 08:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vCCYZzG5Ka9N2oZ7rttqC09lmztU1e5JZDTYPl18vOw=;
 b=wHR4ItWvESwCW43C9tWHsCFK9V6gu0YOKGckKb8Z3kMeIzkIKTjGuaVv2UIN9aeWzi
 BpjE9VSIjvr5S/K88iK204/7ecIOs6SIiy1t8Tq0i28axpXU+0d/OoBOPVMBNlMV9mvi
 5oB2mYCOffwIo8OBvkEdGVWTlapFH2E7meQy67KN6h38K9NodTEGdnisT+vvKtTFTbCH
 LTZhaunBkQKxO3hr8jBcsTlnygJc8T2DU9DHmz9uPhTpmnd1iQWvZlE8SNBf04m+Tf7M
 2XANNRuO7EbQyMu8FB1x2wPTije34hacTNsJqS1lbVBY/Zi/AMqkxKyrcFFQ1wCCRziQ
 7WvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vCCYZzG5Ka9N2oZ7rttqC09lmztU1e5JZDTYPl18vOw=;
 b=OGfms22je5t7b2IuFWcYtXOMpLkpwKM1ntCeIz5FRe5kJaugL8X9Ms8KwC2J+qwGOj
 kxubSZs8goSJM8wZt7eKyr+u+SVLqTRIlPt1ZHaGj5OG50rHkvO5HCjZ07fEExozE2SE
 BaM1rTeURc0dY+qqLvmgSylkdr5NONA8DFOYKgS0jmQo2PyHmVxO51EpWFa80mZ4I1ps
 628sm92YAzT5mIPpk1ZI/Jovyd397gY+naMjoA8syvZPyL89IVcHXdGNInNgkDGtqvUg
 /gdr4cJgMlDFueTKEfQskbqyk6CevBAj+Pvx3iMpR1Skrgm8Gql2fK/yvQd72I8J5m2N
 2r+A==
X-Gm-Message-State: APjAAAUCRl/uZxwdqwkAZFvX5Om5XGAO6Kb32UaE7NcU+xVxL99joFhG
 Tt3nC5Erzj+6Vsmum2t1banCQQ==
X-Google-Smtp-Source: APXvYqxdSf6XsxRRtkdzz5tcSjr7T+I/B+Cef6fa3PvYVwpHHlB36/NXAlsVCkRMNBlvfnX0EP8NvQ==
X-Received: by 2002:adf:fd41:: with SMTP id h1mr14632674wrs.155.1553873613265; 
 Fri, 29 Mar 2019 08:33:33 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id s18sm1930173wmc.41.2019.03.29.08.33.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 29 Mar 2019 08:33:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/3] clk: meson: fix mpll jitter
Date: Fri, 29 Mar 2019 16:33:22 +0100
Message-Id: <20190329153325.23869-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_083335_546391_19ECCC90 
X-CRM114-Status: UNSURE (   9.59  )
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

As reported on this [0] mpll series, We are observing a lot of jitter
on the MPLL outputs of the g12a. No such jitter is seen on gx family.
On the axg family, only MPLL2 seems affected.

The jitter can be as high as +/- 4%.

This is a problem for audio application. This may cause distortion on
i2s and completely break SPDIF.

After exchanging with Amlogic, it seems he have activated (by mistake)
the 'spread spectrum' feature.

This patchset properly set the bit responsible for the spread spectrum
in the mpll driver and add the required correction in the related clock
controllers.

Jerome Brunet (3):
  clk: meson: mpll: properly handle spread spectrum
  clk: meson: gxbb: no spread spectrum on mpll0
  clk: meson: axg: spread spectrum is on mpll2

 drivers/clk/meson/axg.c      | 10 +++++-----
 drivers/clk/meson/clk-mpll.c |  9 ++++++---
 drivers/clk/meson/clk-mpll.h |  1 +
 drivers/clk/meson/gxbb.c     |  5 -----
 4 files changed, 12 insertions(+), 13 deletions(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
