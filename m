Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6D2C5DF81
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Aug 2026 05:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xG+xwrQi5XnRte7GCGaPLk66KonXhH9b4mtCFTdZ6Sk=; b=Z+wRx4g3uAaJ7U
	+JriNDhlYZ6sQ/RycqKQQCb6Fe2C0MRzBPMSPUVOo7UOZIczfKFUFA1bS3pIVeTC+tu3g9J1i7H66
	dfRmrAhHzxQ7kZcfQUYRnORe/IK1G1jqk05MpDagSk4gYDz89NhRngEElIWgimzISmOVPLY7xKAyv
	ZOWLBos4fSOeFAGCxQI1Axa1LG6OFGggbuXTKgiQmt1UJ7TwNXAm1nWcNF5xGxLI8kp4VPjGtOsOd
	Q6fkLrPVvIqYFhSqvdkdsnAC5LReFc12hSCMHto45ohJvH7TpT5V7U0t8KP1VodtINO5C7io+OyS1
	AhJYVTvfslXulHSEQIhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvlX-0000000AspX-1KLH;
	Thu, 20 Aug 2026 05:56:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvlW-0000000AspD-2Qmv;
	Thu, 20 Aug 2026 05:56:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7799C43769;
	Thu, 20 Aug 2026 05:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8F91F00A3A;
	Thu, 20 Aug 2026 05:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787205397;
	bh=bTtESEhDqdaJJFf13TJPMsvGwGlOkJtwU8iCH8UJRzI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=Sx/ECOxkrorY3o+MTDG3qDlw0HT8E/cTXE/rqe8svELCermUqUrt6Wz1D0fkuY92z
	 7eoD80Sfzx2VqwviyXDW5AW0oKJRMoxoCw4Jj1l8JZgPjpzKXlZfpbveDFFFHR3CPK
	 266u2W0cPA4LXRWVFnuCOxKceTyx4BsTpWAodATgmimYdZ87R3LkX3UNZqha33FHBo
	 +luXGBcy7XhRmg1Ld3J/lJeOEeoahw/ICOwRim9qFHYNNvQbsLqy2ZSH9Unkx25M1T
	 Rlqq6pD7uQdlqkgCCpFqyShTEU7ohk5Py83Y5hDlDqESjFGj1Q04A08SxecEIy/CXm
	 lwBLBt91ZMu/A==
MIME-Version: 1.0
In-Reply-To: <e6f52b34163c8e708c1100107b437af0b3b049a6.1787165329.git.geert+renesas@glider.be>
References: <cover.1787165329.git.geert+renesas@glider.be> <e6f52b34163c8e708c1100107b437af0b3b049a6.1787165329.git.geert+renesas@glider.be>
Subject: Re: [PATCH treewide 1/5] clk: ti: Make sure clk_init_data is fully initialized
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, linux@analog.com, linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Andy Shevchenko <andy@kernel.org>, Antoniu Miclaus <antoniu.miclaus@analog.com>, Brian Masney <bmasney+clk@redhat.com>, David Lechner <dlechner@baylibre.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Guenter Roeck <linux@roeck-us.net>, Jerome Brunet <jbrunet+clk@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, Kees Cook <kees@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Mark Brown <broonie@kernel.org>, Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Michael Hennerich <Michael.Hennerich@analog.com>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Nuno Sa <nuno.sa@analog.com>, Sunny Luo <sunny.luo@amlogic.com>, Tero Kristo <kristo@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Date: Wed, 19 Aug 2026 22:56:35 -0700
Message-ID: <178720539505.4726.15293940846422145239@lazor>
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

Quoting Geert Uytterhoeven (2026-08-19 12:05:15)
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> _register_mux() fills in init.parent_data, and assumes that
> init.parent_names is NULL.  However, the latter in uninitialized, and
> thus may cause a crash.
> 
> Make sure all members are fully initialized, to fix such bugs, and to
> avoid future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Fixes: 667f420c09f1417c ("clk: ti: mux: resolve parent clocks by DT index, not by name")
> Closes: https://lore.kernel.org/CAMuHMdU3yVqoyHC4eNF2NuYo8wy+6ODLoYat4R71X99Mxc_=kw@mail.gmail.com
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
