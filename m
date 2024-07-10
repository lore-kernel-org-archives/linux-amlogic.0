Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253B9C3DA41
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jul 2024 22:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oWEOOB61dzYgBGD+psDnZWtGzLuFTXoOcR5NjdS3N6k=; b=GkISWY18aRyEp1
	RzjTlSwqQ5AxHzGtSKJmX1FFe5A6jAugVK5Xb/3lOR6CbJg0Up2IafalZGtffN2QRg/Z19tgX7DTy
	JBVvFGaoMHv7R13cvuYwjpNSPNJFpUhqqBE2yDOhVhpscr7iooeIXXPtPPPL4HWG4368t8uCJguVr
	sLy9o5oP685nYV9hg4KLG+qIA47yCNKVenG3TtOFmPVh+WOwxjiji/rzDX8kmgZRDO50ns6IpMsQ1
	2j1ADfoeO5E9R61AbbdDoKLo6K2C0TAkKqRB1plDIVB9ytpMcSBRCavto23U/WuCWBVERbl5S6kGA
	yxoRI5iJlFHTRUChejTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRftk-0000000BxcZ-3vPs;
	Wed, 10 Jul 2024 22:34:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRfti-0000000Bxc0-2HUX
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Jul 2024 22:34:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 905B0CE16B6;
	Wed, 10 Jul 2024 22:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5BEC4AF09;
	Wed, 10 Jul 2024 22:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720650887;
	bh=HYCH07DJRn0g9/T/c4ky/ALqDjbwGIKesbT6TTrlvrE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=g6k6ujZRyWx3gPwuJSaRxYXQ54a0RKSrxCqIThBk5FSraoSk7RBurJgpfI3uRUvEU
	 VLllZ6YBWBWdZizlxAtOoJui8Av7S+za2woikoHWPD4Hr5u4d4RX1OxfMdLsOSbJVR
	 aLTz6igs7fCXwh5bjECNI/Lki8IAX3QZPx1Rufrzblfx01uz5W8i7l1rjUMva7QS5a
	 HjcCdHee2Q01ATlKG75YzVTSlL11jFidPeaERnjD40qviMhmeJgkoJVIj1UnUi5Vd6
	 m2w4GtLNDklB4BhHCTlLivvyaXSuU6VUSdpHzKojZjNR6IGm5wfdBsxXzsecm3wYVS
	 Ixv+F3QGNCfnw==
Message-ID: <014a49f07aee0fda5b03706f2fbd9de7.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240710162526.2341399-3-jbrunet@baylibre.com>
References: <20240710162526.2341399-1-jbrunet@baylibre.com> <20240710162526.2341399-3-jbrunet@baylibre.com>
Subject: Re: [PATCH 2/8] reset: amlogic: add driver parameters
From: Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Jan Dakinevich <jan.dakinevich@salutedevices.com>, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>
Date: Wed, 10 Jul 2024 15:34:45 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_153450_774513_5787BDA5 
X-CRM114-Status: UNSURE (   8.39  )
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

Quoting Jerome Brunet (2024-07-10 09:25:11)
> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
> index 8f3d6e9df235..59126c9f194a 100644
> --- a/drivers/reset/reset-meson.c
> +++ b/drivers/reset/reset-meson.c
> @@ -18,7 +18,9 @@
>  
>  struct meson_reset_param {
>         int reg_count;
> +       int reset_offset;

Make this unsigned?

>         int level_offset;

Probably this one too, but not in this patch.

> +       bool level_low_reset;
>  };
>  
>  struct meson_reset {

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
