Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E60AC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Apr 2022 05:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M9KzdD7w+BhRF4Hnywh2eI+BwAhxNXTFDpQowrpt/pM=; b=W2b0zGDGx9K8jE
	/bPqpeqf+RuZ6YdlvoRteoGqgG4QhGEL1OSXqIPa9g2sU1L00Pvyho63bzekt+50mjEqXPEH5sMxn
	whYcSQtirt0hhAD4CPKObAItEGYK8yhLG3t/tJ6fOYeBxBJXbUXIXM28wEAy3esivSv9D4UmwSyKr
	RV6LxrTIeih89tzoeWlknFzCyMh235RESD566pKYBpDsQA/Z9lrLt51QIuCjspiLjCVCdMDkGOYWl
	Y7Ey05ifHjk3MMn/My0Fp4LrKMvkSstao69z/Vl5p7iQLwj+wuYxelHoy9ObjSx6CqHfGwa5pJ3Dh
	0E2jzMWk+YOyDsuLUnkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncgml-00F0B0-1B; Fri, 08 Apr 2022 05:03:51 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncgmh-00F0AG-Gw; Fri, 08 Apr 2022 05:03:49 +0000
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 295158125;
 Fri,  8 Apr 2022 05:01:22 +0000 (UTC)
Date: Fri, 8 Apr 2022 08:03:45 +0300
From: Tony Lindgren <tony@atomide.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Mike Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] clk: Drop the rate range on clk_put
Message-ID: <Yk/CMUZ6zRSzYruS@atomide.com>
References: <20220325161144.1901695-1-maxime@cerno.tech>
 <20220325161144.1901695-4-maxime@cerno.tech>
 <CGME20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e@eucas1p1.samsung.com>
 <366a0232-bb4a-c357-6aa8-636e398e05eb@samsung.com>
 <20220330084710.3r6b5pjspz5hdmy6@houat>
 <YkV3ch7R7YxlATW+@atomide.com>
 <20220407075356.lmqnax35cewiwh4k@houat>
 <Yk6a7meIO+fV5J1D@atomide.com> <Yk7GFWdJd2EN7L1V@atomide.com>
 <20220407134514.sct7g23yto47ylgr@houat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220407134514.sct7g23yto47ylgr@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_220347_635102_3905EE01 
X-CRM114-Status: GOOD (  19.22  )
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

* Maxime Ripard <maxime@cerno.tech> [220407 13:43]:
> On Thu, Apr 07, 2022 at 02:08:05PM +0300, Tony Lindgren wrote:
> > It now boots, but does a lot of checks on the clocks before the timers
> > get initialized compared to v5.18-rc1.
> 
> I was about to say that this is fairly normal with the new behaviour,
> but I've reworked the initial patch in that discussion to only call into
> clk_set_rate_range if there was a range on that clock to begin with.
> 
> It should remove the huge majority of the checks you mentioned (and
> hopefully get rid of most of the side effects as well).

OK yeah thanks, looks good to me now. Boot time looks normal, timer clocks
are right, and runtime PM still works too.

> It shouldn't be there anymore after that rework, but I couldn't find
> wher the ssi_ssr_fck clock was defined? The only relevant driver seems
> to be omap_ssi_core.c but I don't see any clock driver registered there
> either.

I'm not seeing this warning any longer :)

FYI, this clock is defined here:

$ git grep ssi_ssr_fck_3430es2
arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi: ssi_ssr_fck: ssi_ssr_fck_3430es2 {
drivers/clk/ti/clk-3xxx.c:      DT_CLK(NULL, "ssi_ssr_fck", "ssi_ssr_fck_3430es2"),

Yeah it's confusing, the clock is still created based on the node name.
I have some clean-up patches coming to fix most of the related make dtbs
checks warnings now that the clock driver changes got merged.

Regards,

Tony


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
