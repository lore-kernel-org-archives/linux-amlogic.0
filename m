Return-Path: <SRS0=TJbE=BI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2072CC433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2020 15:45:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E74762083B
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2020 15:45:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SG3cz+i7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="b+VLFMtt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E74762083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6ctsIFYLJb6RB6ETtMCJlfvYDFWK/FisuDrVdAJaJjE=; b=SG3cz+i744h4vT/owPFavkfNH+
	JQ7Xn+aZ50XGIt/YxbWd9maMkbyBlroLOoGDjAZ29nKjkNJhs6UYV9kQ0RZ6Ok+ERG3nTPl65rMTa
	MHMMvgfSiqXLyyDmdvik9PocHJ6rcyDTffk83UK8jRndFOgu7UNe4XNZaMgCpE7xhEPdP/5kj2Wwq
	HPHYhYwkTDtPJzUoJG+9wf7qNkwVZqVY7McgYzSzI5sHmwdcvkDTT+96QhIyIb7w5HfKf+T59WE3B
	pns6MVWlpYW/1X/nDNnR8ttG+ClUuE8upLFxkY2nLGCg66rm47lR4NUG61kFrxOBCx4iXGTe0ytZd
	C22IdPRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0oGb-00035B-Qv; Wed, 29 Jul 2020 15:45:17 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0oGZ-00033w-1M
 for linux-amlogic@lists.infradead.org; Wed, 29 Jul 2020 15:45:15 +0000
Received: by mail-wm1-x342.google.com with SMTP id 184so3456739wmb.0
 for <linux-amlogic@lists.infradead.org>; Wed, 29 Jul 2020 08:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tZyrzrT0Nf0x/gyHGp8Cs5MnYb93JhfVD87ZJN1UfIU=;
 b=b+VLFMttcd/AFDxmAsi8VtfuqKDOuaZmXWDAIR/zZ4938MhI4865tTZFGExVfPlBhL
 xLVpSRa6XIhOa+/LP36WaI+2tTZ47GBE9T7gjF+py7giHDrzvkqNyJDvY8382KJNGuVp
 cCjiAw4lVH6uHGR/w6SHFGvU6rIoHbjXgKk2sNWkwv1KGUqiz/nlCfhOix6wC66nQHMS
 t4h1iSP+MVInoN7KMc6D+Rq2vTPy96OMNY9jGhFGRg/JYdivPqc9sGz2XMoh3oR4jqFs
 rnquzA/xfhfueM7cuqjDDJNQuZZUwW2IjIgGWZhDbk0px+wYgok0PiRTq86MuaEBiuo5
 GnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tZyrzrT0Nf0x/gyHGp8Cs5MnYb93JhfVD87ZJN1UfIU=;
 b=g4naZmU1whzBmkueomwDyA5qgmj8EtXkkjI17zDmZzDdPHhbifW7/YI3V5VE5H99d7
 oGAD+r9SEj+5xPWBXpkk8AOia37tu5pfnegG5Yb9MfcINi7FcXrILveROew9g60lrKse
 78Z+gscsDPp8gRoLWiiNkrNr8zVUJFIKpAnKi6ET82lTcrpMqLmPHGrmW40JD1yX443e
 qrHZTDTwPlbLLICwV7mRvbGUPBHADFmNICfpDbFBi46qTC7UE+dlumSfcSNqSuZwS5yV
 ZstUSDUcO4Xe1Kddca5uc0LmIVrttYvrzFkNW8c4PyFwpzOs0UGSBNfP01z8wO9t1c9S
 VPRA==
X-Gm-Message-State: AOAM5317jLhDpoNYbGUUcraiO2dHM2mRnLMSwY2tZQms884zErOe5lRF
 Q7Yyrn/DLOhL82iaa/mtQJnHLSnOjDVvxg==
X-Google-Smtp-Source: ABdhPJw5uFTrnEpbYb0n1UKwvaYWnjt8taRop48MzCBBqK0z4sbTETQUcnZx4nGuZE6MZ/Ja7pWWdw==
X-Received: by 2002:a05:600c:284:: with SMTP id 4mr9474888wmk.48.1596037512993; 
 Wed, 29 Jul 2020 08:45:12 -0700 (PDT)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id k10sm5950967wrm.74.2020.07.29.08.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 08:45:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 0/4] ASoC: meson: tdm fixes
Date: Wed, 29 Jul 2020 17:44:52 +0200
Message-Id: <20200729154456.1983396-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_114515_112534_DCCD5C54 
X-CRM114-Status: UNSURE (   8.98  )
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
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patcheset is collection of fixes for the TDM input and output the
axg audio architecture. Its fixes:
 - slave mode format setting
 - g12 and sm1 skew offset
 - tdm clock inversion
 - standard daifmt props names which don't require a specific prefix

Jerome Brunet (4):
  ASoC: meson: axg-tdm-interface: fix link fmt setup
  ASoC: meson: axg-tdmin: fix g12a skew
  ASoC: meson: axg-tdm-formatters: fix sclk inversion
  ASoC: meson: cards: remove DT_PREFIX for standard daifmt properties

 sound/soc/meson/axg-tdm-formatter.c | 11 ++++++-----
 sound/soc/meson/axg-tdm-formatter.h |  1 -
 sound/soc/meson/axg-tdm-interface.c | 26 +++++++++++++++++---------
 sound/soc/meson/axg-tdmin.c         | 16 +++++++++++++++-
 sound/soc/meson/axg-tdmout.c        |  3 ---
 sound/soc/meson/meson-card-utils.c  |  2 +-
 6 files changed, 39 insertions(+), 20 deletions(-)

-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
