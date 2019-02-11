Return-Path: <SRS0=yrQE=QS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 880E4C169C4
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Feb 2019 20:41:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55FDD2084D
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Feb 2019 20:41:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kH9k4gOC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PouLwnYF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55FDD2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WviF4JaK+gXVy5oyIvZLfDBscCmSnYtUd/JQTE1vfw4=; b=kH9k4gOCVFZTAn
	18O1F8Z87SvUvXK9Dd0mssCLD2D68KHaD91KaOclEBMqqaLGCGozac3Rur3Y0meE0X+oP1oTpv/sJ
	kjzISDYaEld1IB4+aJEShI9a5TPLL5ivT1OH2EyRMSeHZQeQ0z10aJCOp7Z+eQxl/HzAX4Zs9PgAu
	Wm98twAcRuXrbfIHgPIoIX23rkWBT40WnOd2PFQ0rSRL9q8euwynNYwd4QllJm3pzZ77i0DS5Cepj
	pmR1jUluDqNgubfF2y5oYlL9XQ1Y0gnuQFLXsv9KANaYAlh6ICv5Fx9x7nfSydoRpbsAVgrrNDDAz
	cX3sCxWTS8yuz4iMwHRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtINw-0007F8-ML; Mon, 11 Feb 2019 20:41:00 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtINk-00075e-OP
 for linux-amlogic@lists.infradead.org; Mon, 11 Feb 2019 20:40:51 +0000
Received: by mail-pf1-x444.google.com with SMTP id c123so131847pfb.0
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Feb 2019 12:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=qaAwhFAqBZ1GfDiWGBctc/I7nn7/IozezkQ049IDIIw=;
 b=PouLwnYFSreBN5YeSDK7wcqoKf5oD76zHuQfTt3fjYE65708tyAcOUNkcwALvWtgxx
 u0fSy1OcpHUszm2K/Gx6Nh1EU1aYlzXKmlszvDAtKXVrKnlwc4eC7OYwhVB8MrGYJxo7
 Fv51p8Oc+FJtZS6fr1DSZdUVv16g83cbunzjlDXDFzGAyZgscV8KeQEhjBdu+RKdeITO
 0q/0hZrFyLm0fr7oEbLKJ0SC7zP3esjrCSkbR8vi7S25dGQ3Cq27RC7TERFFLX3bI53q
 gSMRQULKHZ38hVt6d8+G+JbBqtA5FBuUHxhoDRdcI0vjcFPZ+2OWjkxfaZMHAWgyPvCg
 BV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=qaAwhFAqBZ1GfDiWGBctc/I7nn7/IozezkQ049IDIIw=;
 b=ikBdWiTRA38SXB36TMPaie9Vrgx0cJzucf2xR1hgoFV0czKSqKG9fKHCEE5/FMuuWW
 jvdQJwl597x+dGGpEQ2cbz/0bp22hDv3y98a9PchK3MNiatDsrQ4a9uZl2kGcrN2hUIQ
 PwjlUaYTQIYIkdHZGUK3xCSCylJGme2Liyq1bf02kanEM3W5R9xkKLxsYEwAti6eCDWb
 ksWqsbU13pE/EOOddd3v1i2JLR95zAs4xzyscH3sGeZCnDtxiz8+FPFfPFEe8SN5ya3j
 hTfpJbpfeofs4APIKw3ix7gVzquEJU2pkS581kcVXFcEq44cii4NhIEFVS+fZt1U3u2f
 I4Eg==
X-Gm-Message-State: AHQUAuahFUdyx7wn/hbAgqOdq6aVJGSAAFtJJvQ5VsdIYO94nnxzUVIP
 uAE7BepYJ6ol7lK47y8q+15mQA==
X-Google-Smtp-Source: AHgI3IZlhFzTTycRgR2hXxQV4KXEwpon4M8m9h0a9ZvP3IX/btB6OkD0AKCo/RS7nMSsXb0/J3TXRg==
X-Received: by 2002:a65:488a:: with SMTP id n10mr77642pgs.261.1549917647471;
 Mon, 11 Feb 2019 12:40:47 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:1d1:285e:6b85:3bfc])
 by smtp.googlemail.com with ESMTPSA id 27sm4203597pgn.56.2019.02.11.12.40.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 11 Feb 2019 12:40:46 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: arm@kernel.org
Subject: [GIT PULL] Amlogic: driver updates for v5.1
Date: Mon, 11 Feb 2019 12:40:46 -0800
Message-ID: <7hlg2mdpo1.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_124048_858443_EDD2A508 
X-CRM114-Status: UNSURE (   9.20  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-drivers

for you to fetch changes up to 19e0bde7bf6a18a910e5d633ef606d6ff298c2cb:

  soc: amlogic: clk-measure: add axg and g12a support (2019-02-07 16:50:36 -0800)

----------------------------------------------------------------
Amlogic: driver updates for v5.1
- clock measure: add support for G12a SoC family
- misc. fixes

----------------------------------------------------------------
Jerome Brunet (2):
      dt-bindings: amlogic: add new compatible devices to clk_measure
      soc: amlogic: clk-measure: add axg and g12a support

Neil Armstrong (1):
      soc: amlogic: canvas: Fix meson_canvas_get when probe failed

wen yang (1):
      soc: amlogic: add missing of_node_put()

 Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt |   2 ++
 drivers/soc/amlogic/meson-canvas.c                            |  18 ++++++++++--
 drivers/soc/amlogic/meson-clk-measure.c                       | 196 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 214 insertions(+), 2 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
