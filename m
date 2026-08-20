Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE01CC5DF81
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Aug 2026 01:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2qIB3foNiB27XhFNJdfLAIXPkvQz2b8V9I20lMEWuCk=; b=wBFMptATs9YXT6
	uxK7tERn1bLTdM1dldnfYtVsc3uAktmadKIHk4R9hf7FhzFH+9EW7p0mlloZvxngdfrn2ZUr6ojO+
	84iZqkMinkALmt/vDpJ8aH1ymjyt2Q4vYhe9iSl9reg6Nro36YRNPUKa1InB44zugbcieS1OsMM64
	mf69aYrPcDjSUpaNV6mKYh7geKQbMy2uCWc1rXG8y50cvqoZlBwlUFQAFlSyIz1f88bSazuhZDkfr
	r3QBQsZCjoORUJ9A0qSHaAvShIKCN0I7qaqXq0WjpMwD/4gKX10PaRk3zkGaIetQCHoYmBHMd4aNc
	fPFUvpCKBp4ogh7/eeyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwrjS-0000000AjBn-0AHO;
	Thu, 20 Aug 2026 01:38:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwrjQ-0000000AjBe-0VM2;
	Thu, 20 Aug 2026 01:38:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A73826187F;
	Thu, 20 Aug 2026 01:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 609D21F00A3A;
	Thu, 20 Aug 2026 01:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787189890;
	bh=7A6JesNR31qbM8jFMjX5uG+J+rXUo91CSdPomfFkkHE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=CZMkr2kwPcjJvMeEgedtJWG1ojnfdOz1937Nbdm4EWQtkYeYW3m8xArP3mLJBF/IL
	 MAzJJOKD1scDjgvBwwrST/fB2Jyoba4j+Ghq+nagPOPxbnNunmQdQSKZJbchZeudbP
	 u60FNlGetJI1+3ALTuQlVRqScRpi3GxzpuLlPi+b1cdT0n8e/ciunLYs4aoo9opzbG
	 5ANoIuR92ive30NLGR3Li7Im5/YYatfyQ38MydVx17mtmSaoTstgpdYg3ErKSUqwDb
	 mrU/dAosK/xAWqC6BYR3TTcIYb5TLnj1g1ZvFGwsio8ZBGuUkQVQkJQ6Hf3h7DmGMJ
	 d3yZMkfxkhAnQ==
Date: Thu, 20 Aug 2026 02:38:04 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Tero Kristo
 <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Nuno Sa
 <nuno.sa@analog.com>, Guenter Roeck <linux@roeck-us.net>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Antoniu Miclaus
 <antoniu.miclaus@analog.com>, David Lechner <dlechner@baylibre.com>, Andy
 Shevchenko <andy@kernel.org>, Sunny Luo <sunny.luo@amlogic.com>, Xianwei
 Zhao <xianwei.zhao@amlogic.com>, Mark Brown <broonie@kernel.org>, Kees Cook
 <kees@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Mathieu
 Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org, linux@analog.com, linux-iio@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH treewide 4/5] iio: frequency: adf4377: Make sure
 clk_init_data is fully initialized
Message-ID: <20260820023804.70ba61d1@jic23-huawei>
In-Reply-To: <aoYeoSnvf5-l69lE@redhat.com>
References: <cover.1787165329.git.geert+renesas@glider.be>
	<302584628c4c0699239a0218376fe1c11cdc8944.1787165329.git.geert+renesas@glider.be>
	<aoYeoSnvf5-l69lE@redhat.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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

On Wed, 19 Aug 2026 17:22:41 -0400
Brian Masney <bmasney@redhat.com> wrote:

> On Wed, Aug 19, 2026 at 09:05:18PM +0200, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> > 
> > adf4377_clk_register() fills in init.parent_data, and assumes that
> > init.parent_names is NULL.  However, the latter in uninitialized, and
> > thus may cause a crash.
> > 
> > Make sure all members are fully initialized, to fix such bugs, and to
> > avoid future breakage when converting drivers to a different method for
> > specifying the parents.
> > 
> > Fixes: 60e5448ddbec2dc2 ("iio: frequency: adf4377: add clk provider support")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>  
> 
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> 

Applied to the fixes-togreg branch of iio.git
I'll rebase on rc1 before sending a pull request (so waiting for that
to be available)

Thanks,

Jonathan

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
