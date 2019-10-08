Return-Path: <SRS0=0688=YB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0579C4360C
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2019 07:26:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72DD120640
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2019 07:26:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lG9f7a+Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VLEkmuDM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72DD120640
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZPV54EaVRs7B07m5H7Mrq7QkqFSQd7Kg13zdc7T5hPo=; b=lG9f7a+ZKI6Dkr
	/1G7ssNkZ2iZDN6KwpRh1fvhB2nrDDZIHd+lcnJPiq48c3CqTCNcBilTQ5v7O63IgrBHA96Wi5wDT
	7uvLl6gHC2imT+YDlo91Tov0GFvUemvrXPSdvjMtIk9Z3FkP1n8000Tvnq6Yr+leu4O7jfxZfXHhu
	fAsS9uVVP89Syjme9gzEzFwDo0L0lzgHKUkIVThwdUfOLrZfRqQ01tsUofgIjYjCSWceveYf2xGbU
	P+gE6KgXwIv6UdlMGkJYFaYpd5E/Q6dHWimUouNrcA2bV7LSp0xulJpd8scZ4Su2cs32dnduP85Py
	gm5fkeCZLIM0r/6wki9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHjsz-0004TB-CC; Tue, 08 Oct 2019 07:26:21 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHjsu-0004R2-KQ
 for linux-amlogic@lists.infradead.org; Tue, 08 Oct 2019 07:26:19 +0000
Received: by mail-wr1-x443.google.com with SMTP id q9so18057906wrm.8
 for <linux-amlogic@lists.infradead.org>; Tue, 08 Oct 2019 00:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=user-agent:from:to:cc:subject:date:message-id:mime-version;
 bh=YJvy9nsXaskuwsNETGxqbLFMHW5hYq6DMzsdXiXCa9s=;
 b=VLEkmuDMTW45fFL33LNxB4BnipNy7ebQhOyZioGwQBnouB+t9IbM7Qnqg6+t6inysP
 tF5vNqhYUOXAjM6M7GFtmRO1Y2ZM30mgnIsT0gGaNjPC/36LBVB2/mi9c43WcS8U88c8
 Pz9D4JJ22IMB6x3cbW95oeIaMbxCeJOX3YZO2SjWRiBwldp428Y+2uGa7RfG5PcdnkmR
 /x7W0H7YyzxyzY0GuHAmajtcyrPswnx7xrRfxNzXj7DkclWNgvxNodnxBc8ER8otdMUD
 ZnHTxOYi/9MsEG6qeM8gExvN8YZeMfzMHYLAN+hSnDLXwytocOG9bCwF0HEdK874bYA7
 kT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
 :mime-version;
 bh=YJvy9nsXaskuwsNETGxqbLFMHW5hYq6DMzsdXiXCa9s=;
 b=kmWx6jP+i5envJnV0TCQld4ifEPKwGybEos2ca38uYW+y5zAB2jVa+AMOnjfYB4T4Z
 eXuG77xkyzXhk9AQ1a8zsHJKMdLhoW0vaS6SbVi7EuIRhBsL+Vc56z/BT2BCLj1LtraK
 +ucL+LL1crWwiQqKJPKhXxBjXn/D5XV/QdzXTMT6+/8IRzIhNZ50NkiFtTE5QRlPBY9+
 hOaPi95I0A2k+b0Ky9rYC4KOcd/PEuHWaFQphOmV/3mOvpo6pTAhI9sMvYVCYMA91hsK
 lloDJsU1GuRMl3OLVeWQ3P1Q7J/fj0Uj1KWPkcT0wsd6wz+DbW1j/1TaXsp9+WwWGRdn
 I/kw==
X-Gm-Message-State: APjAAAWiIiQ+7Xgnoh7yNGTyHdM4u51sztXPVbJZThpgN5qkA22hpXVm
 0g438G2Z8B2bV1N1Pr/poPqpoK4APlk=
X-Google-Smtp-Source: APXvYqxbbHsF9Yfc9ZjXLR7Vy96blle3+q70yYI8j1SXjf038VkmOu/KxRq6y4WUP5xpChrP4gZfew==
X-Received: by 2002:a05:6000:1090:: with SMTP id
 y16mr1708129wrw.316.1570519574639; 
 Tue, 08 Oct 2019 00:26:14 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i11sm6757471wrw.57.2019.10.08.00.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 00:26:14 -0700 (PDT)
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [GIT PULL] clk: meson: fixes for v5.4
Date: Tue, 08 Oct 2019 09:26:12 +0200
Message-ID: <1jzhibaeaz.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191008_002616_690358_C744353E 
X-CRM114-Status: UNSURE (   7.61  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Stephen,

Please pull these few fixes for the current release.

Thanks
Jerome

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/clk-meson-fixes-v5.4-1

for you to fetch changes up to 90b171f6035688236a3f09117a683020be45603a:

  clk: meson: g12a: set CLK_MUX_ROUND_CLOSEST on the cpu clock muxes (2019-10-01 14:51:15 +0200)

----------------------------------------------------------------
First round of amlogic clock fixes for v5.4.

This fixes the clock rate propagation for the g12a cpu clocks and
the gxbb adc clock.

----------------------------------------------------------------
Martin Blumenstingl (1):
      clk: meson: gxbb: let sar_adc_clk_div set the parent clock rate

Neil Armstrong (2):
      clk: meson: g12a: fix cpu clock rate setting
      clk: meson: g12a: set CLK_MUX_ROUND_CLOSEST on the cpu clock muxes

 drivers/clk/meson/g12a.c | 13 +++++++++++--
 drivers/clk/meson/gxbb.c |  1 +
 2 files changed, 12 insertions(+), 2 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
