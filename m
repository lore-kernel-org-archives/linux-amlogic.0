Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AC9CAC597
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Sep 2025 01:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GJFdM9+/DdNES5mQHa4Vj/Qy2/UXWWcj8LXbuuv56cc=; b=NtKWaOTyR/7krF
	VUURsFNwmu01UaL7B7HFIdoOm+80G0ZufioMbvNn106sRY6jz4pZcGwEb/r4Hi3BwP4uoKUlbX78h
	DzD4PXyE3P2jz6U8kbkwgJHPG/LIaw2OxaDnc5eqJUb4BwhAI6XqPIRM0axR2Q5gWlkqaJGApe2lU
	zaGmo/HluotP+uP/rEXIX3E/CmNkPgbhWDNDmGG9i+nYzLl/J+Aqt86+Qcg2/wS+q96s6De/84EcP
	Uzdf5YGx6cNZyUOKVPpoMBYk4FXrQ+xIsF69UBPE+0LpEO8ePdrCoXi95B9KnZCPZWhos44UFkcQf
	VsoGTkdkmAEpyv/zSEyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyKeu-00000006ApO-2IT3;
	Tue, 16 Sep 2025 01:39:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyKer-00000006Aoz-1zZP
	for linux-amlogic@lists.infradead.org;
	Tue, 16 Sep 2025 01:39:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CD21A401B3;
	Tue, 16 Sep 2025 01:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96873C4CEF1;
	Tue, 16 Sep 2025 01:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757986739;
	bh=8sFoEaMtB3SAvjyszuoCB6AyW4HgU2Zoq6ImsftTPwA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=tssAsw8nmknUbBtb8FYPFPee3d0mnYeNgt6A64N/SdHsvhKbrBLylQGUkKZbbq25t
	 eLzv2RfEOB2lNcp7l/ohgtWUB37ZsNr6qcu4Rdhbp5hkppXd/X1/9J+I3hKBnvK2+C
	 RMQC+IRrJ4SXcP0IX/413jOnnBI7M5eXe4FahR5p5kCxyJSUBsWj75B/9HqBCAD1Fq
	 zJ2tyA7x06v/rkUwWe5tOcT5JPL9gIv5oUmmZQKceQG5TmWjQsVt1B5zggXPXDECbH
	 pwxuNOMbHewAJylwiz3xa1sjmm1h4uLADL9+x1G06eq+AUXgW9yaLgeC72AcXn3ZrT
	 yvrZhlnH4gsLQ==
MIME-Version: 1.0
In-Reply-To: <1jecs8hxry.fsf@starbuckisacylon.baylibre.com>
References: <1jecs8hxry.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: amlogic updates for v6.18
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>, linux-amlogic <linux-amlogic@lists.infradead.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 15 Sep 2025 18:38:44 -0700
Message-ID: <175798672445.4354.9868549804401398525@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_183901_534946_CA19A670 
X-CRM114-Status: GOOD (  10.68  )
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

Quoting Jerome Brunet (2025-09-15 02:26:25)
> 
> Hi Stephen,
> 
> Here are the Amlogic clock updates for v6.18.
> 
> This is mostly a clean up of pointless differences between the
> controllers which have been accumulated over the years. Hopefully, this
> will help with the maintenance and simplify the review of the incoming
> new controllers.
> 
> Overall, this is just simple stuff but since it touches every Amlogic
> controllers, the diff is fairly large.
> 
> Please pull
> Cheers
> 
> Jerome
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.18-1
> 
> for you to fetch changes up to 01f3a6d1d59b8e25a6de243b0d73075cf0415eaf:
> 
>   clk: amlogic: c3-peripherals: use helper for basic composite clocks (2025-09-04 18:27:12 +0200)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
