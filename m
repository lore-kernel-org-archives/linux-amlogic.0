Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A80CD8CA8
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Jun 2026 22:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VP0e1/xFcrnPpy/d7ISxMVtTlY4eljmvgUDbH8CV1Cg=; b=AcZXFtQz4u+RhP
	u9t8atT2xhKrrQiqJE4ZNqxs0wkisDPNGcCeHnJKQrcBznl3IfVMOw33j5YOgwyaq5y3ZvcX3otaR
	vLIXW5E9BLPfUjZ85/sAJFRZ7+hQtH3FoJdrzBEvuNoGg+DRFWKxc/XP7LTkAX9FrAF8TcILpksM6
	rOByE1DO43zQTgD03XkNDJ3Ua5oU4L3me9r6UvMz7OcbZFgWGK2nveKPI3oDMxSE44qMORVtbcN0y
	8FkPOcC9/O7pXZ0ikgWYqWSFiVD++VLd1CA1VmmKPzEKSI+i83iJogrt7Z3ZeMsRQQ1F2l2zrOnLF
	Fmd0dl94+gkiKwCgMN7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXFn-0000000CakU-3jnK;
	Sat, 13 Jun 2026 22:55:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXFm-0000000CakE-14ea
	for linux-amlogic@lists.infradead.org;
	Sat, 13 Jun 2026 22:55:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 02783600AB;
	Sat, 13 Jun 2026 22:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D46F1F000E9;
	Sat, 13 Jun 2026 22:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781391300;
	bh=zM54oc2YQKLJooiixhUvIE9F7hA5LAA6bb7CaMov7/s=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=JuoEU+pFBTG3I5jQxbPP0PcF6jPibfwTDoBVk0Ea8M+wgQBJvUgm7GvYd/3bT/ROk
	 LTE/UZ6b+RbvfFPHUufH0wP+cQZFy8+RhPrXf98Lc1Oy1Y3CjjvjFAk2BVKlFe0Dbm
	 e8BYPbLxpIW0D84uATTPu4wDFQ9HhGggzAERhzDGMQxx8j38OZPaLA1MrEt8mYvgiv
	 zt4d+cvYnjwtZqwva0tsjjWe6IQJku/XIXS11o/OOCpds/GpBL26dQyZb14saL9x+9
	 Y6rd9Vhtu6SfHe5qlcautl+0q9HzVgYrX4zCAnlrlOY0ukDCx9wi9jSHDjX+V2ow0K
	 TIuSBPBnhNg2Q==
MIME-Version: 1.0
In-Reply-To: <1j1peu5nny.fsf@starbuckisacylon.baylibre.com>
References: <1j1peu5nny.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: Amlogic clock changes for v7.2
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk <linux-clk@vger.kernel.org>, linux-amlogic <linux-amlogic@lists.infradead.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Sat, 13 Jun 2026 14:21:26 -0700
Message-ID: <178138568669.819343.12989878200172062964@localhost.localdomain>
User-Agent: alot/0.12
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

Quoting Jerome Brunet (2026-05-29 06:51:45)
> 
> Hi Stephen,
> 
> Here are the Amlogic clock changes for v7.2.
> There is just a couple of minor DT bindings fixups. Nothing major.
> 
> Please Pull.
> 
> Cheers
> Jerome
> 
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v7.2-1
> 
> for you to fetch changes up to ca89c88bcf69daca829044c638a8163d5ce47af0:
> 
>   dt-bindings: clock: amlogic: t7: Add missing mpll3 parent clock (2026-04-28 10:42:47 +0200)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
