Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9A4C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Mar 2022 17:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oqfkdSn10EEJujBQBzjXH6XNiNj6/Pm3/R2x76LgR94=; b=wTC4mUGIx9RoTE
	7wx/K537c0ZoxN0lvPikUBi+VFoueBTMRwd2O7Y1os2yRe74LC1i0APz5yvLjaHTCXfZJ1iFKJUDX
	Go/Y2KtC9K8dE9aTg6T7p97oYPWh/kLA4gsxqWs2ZEcN8OtUCN6rcHtewlXAdD+APcMvQpS8U0zDh
	LfvsbzTiLsnUA3/KkgtDN5i/ZOkbAA7my1Uq9jCiTcF9H/GbznjeXbk/fpwSGbBgqNPBf52Bxlk0u
	ealRhAwWAJZZKve5hoCFpo2qT2NgahEYtTTWQCnWOMTxQY/4gvmv+aFAhWQjgYPjRa25H+LmLsfZ6
	0P/4I5JiLBF9d4hS88Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZy9g-0032Wl-Bw; Thu, 31 Mar 2022 17:00:16 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZy9c-0032VV-Ro; Thu, 31 Mar 2022 17:00:15 +0000
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id D58EA80DB;
 Thu, 31 Mar 2022 16:58:01 +0000 (UTC)
Date: Thu, 31 Mar 2022 20:00:09 +0300
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
Message-ID: <YkXeGS5zaovOaEzp@atomide.com>
References: <20220325161144.1901695-1-maxime@cerno.tech>
 <20220325161144.1901695-4-maxime@cerno.tech>
 <CGME20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e@eucas1p1.samsung.com>
 <366a0232-bb4a-c357-6aa8-636e398e05eb@samsung.com>
 <20220330084710.3r6b5pjspz5hdmy6@houat>
 <YkV3ch7R7YxlATW+@atomide.com>
 <20220331095456.dyyxsiu2b3yw2vvs@houat>
 <YkXCGlrok0niwlyg@atomide.com>
 <20220331153134.h3alp24hzquajkly@houat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220331153134.h3alp24hzquajkly@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_100013_013458_689196E9 
X-CRM114-Status: GOOD (  19.46  )
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

* Maxime Ripard <maxime@cerno.tech> [220331 15:29]:
> On Thu, Mar 31, 2022 at 06:00:42PM +0300, Tony Lindgren wrote:
> > * Maxime Ripard <maxime@cerno.tech> [220331 09:52]:
> > > On Thu, Mar 31, 2022 at 12:42:10PM +0300, Tony Lindgren wrote:
> > > > It seems the dts assigned-clock-parents no longer works now?
> > > 
> > > That would make some kind of sense, __set_clk_parents calls clk_put on
> > > both the assigned clock and its parent.
> > > 
> > > Could you see what parent (and why?) it tries to enforce then?
> > 
> > It picks the other option available for the mux clock that only has
> > two options. No idea why, but if you have some debug patch in mind I
> > can give it a try.
> > 
> > > It looks like the gpt1_fck driver might favor another parent for that
> > > rate, which, if it's an invalid configuration, shouldn't really happen?
> > 
> > Hmm there's a gate clock and a mux clock, there's not really a rate
> > selection available here for the sources.
> 
> If I followed the OMAP driver properly, clk_mux_determine_rate_flags is
> doing the heavy lifting, could you run your test with

Thanks that produces some interesting output. In the working case with
the $subject patch reverted we have:

[    0.000000] Clocking rate (Crystal/Core/MPU): 26.0/400/600 MHz
[    0.000000] clk_core_set_rate_nolock: rate 960000000
[    0.000000] clk_core_set_rate_nolock: rounded rate 960000000
[    0.000000] clk_core_set_rate_nolock: rate 120000000
[    0.000000] clk_core_set_rate_nolock: rounded rate 120000000
[    0.000000] OMAP clocksource: 32k_counter at 32768 Hz
[    0.000000] clocksource: 32k_counter: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 58327039986419 ns
[    0.000000] sched_clock: 32 bits at 32kHz, resolution 30517ns, wraps every 65535999984741ns
[    0.011779] TI gptimer clockevent: always-on 32768 Hz at /ocp@68000000/target-module@48318000

In the failing case With the $subject patch not reverted, the debug
output goes a bit crazy, see below :)

Regards,

Tony

8< ----------------
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 0
[    0.000000] clk_set_rate_range_nolock: clamped rate 0
[    0.000000] clk_core_set_rate_nolock: rate 0
[    0.000000] clk_core_set_rate_nolock: rounded rate 0
[    0.000000] clk_set_rate_range_nolock: core req rate 0
[    0.000000] clk_set_rate_range_nolock: clamped rate 0
[    0.000000] clk_core_set_rate_nolock: rate 0
[    0.000000] clk_core_set_rate_nolock: rounded rate 0
[    0.000000] clk_set_rate_range_nolock: core req rate 0
[    0.000000] clk_set_rate_range_nolock: clamped rate 0
[    0.000000] clk_core_set_rate_nolock: rate 0
[    0.000000] clk_core_set_rate_nolock: rounded rate 0
[    0.000000] clk_set_rate_range_nolock: core req rate 0
[    0.000000] clk_set_rate_range_nolock: clamped rate 0
[    0.000000] clk_core_set_rate_nolock: rate 0
[    0.000000] clk_core_set_rate_nolock: rounded rate 0
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 0
[    0.000000] clk_set_rate_range_nolock: clamped rate 0
[    0.000000] clk_core_set_rate_nolock: rate 0
[    0.000000] clk_core_set_rate_nolock: rounded rate 0
[    0.000000] clk_set_rate_range_nolock: core req rate 0
[    0.000000] clk_set_rate_range_nolock: clamped rate 0
[    0.000000] clk_core_set_rate_nolock: rate 0
[    0.000000] clk_core_set_rate_nolock: rounded rate 0
[    0.000000] clk_set_rate_range_nolock: core req rate 0
[    0.000000] clk_set_rate_range_nolock: clamped rate 0
[    0.000000] clk_core_set_rate_nolock: rate 0
[    0.000000] clk_core_set_rate_nolock: rounded rate 0
[    0.000000] clk_set_rate_range_nolock: core req rate 0
[    0.000000] clk_set_rate_range_nolock: clamped rate 0
[    0.000000] clk_core_set_rate_nolock: rate 0
[    0.000000] clk_core_set_rate_nolock: rounded rate 0
[    0.000000] clk_set_rate_range_nolock: core req rate 0
[    0.000000] clk_set_rate_range_nolock: clamped rate 0
[    0.000000] clk_core_set_rate_nolock: rate 0
[    0.000000] clk_core_set_rate_nolock: rounded rate 0
[    0.000000] clk_set_rate_range_nolock: core req rate 0
[    0.000000] clk_set_rate_range_nolock: clamped rate 0
[    0.000000] clk_core_set_rate_nolock: rate 0
[    0.000000] clk_core_set_rate_nolock: rounded rate 0
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 32768
[    0.000000] clk_set_rate_range_nolock: clamped rate 32768
[    0.000000] clk_core_set_rate_nolock: rate 32768
[    0.000000] clk_core_set_rate_nolock: rounded rate 32768
[    0.000000] clk_set_rate_range_nolock: core req rate 12000000
[    0.000000] clk_set_rate_range_nolock: clamped rate 12000000
[    0.000000] clk_core_set_rate_nolock: rate 12000000
[    0.000000] clk_core_set_rate_nolock: rounded rate 12000000
[    0.000000] clk_set_rate_range_nolock: core req rate 13000000
[    0.000000] clk_set_rate_range_nolock: clamped rate 13000000
[    0.000000] clk_core_set_rate_nolock: rate 13000000
[    0.000000] clk_core_set_rate_nolock: rounded rate 13000000
[    0.000000] clk_set_rate_range_nolock: core req rate 19200000
[    0.000000] clk_set_rate_range_nolock: clamped rate 19200000
[    0.000000] clk_core_set_rate_nolock: rate 19200000
[    0.000000] clk_core_set_rate_nolock: rounded rate 19200000
[    0.000000] clk_set_rate_range_nolock: core req rate 26000000
[    0.000000] clk_set_rate_range_nolock: clamped rate 26000000
[    0.000000] clk_core_set_rate_nolock: rate 26000000
[    0.000000] clk_core_set_rate_nolock: rounded rate 26000000
[    0.000000] clk_set_rate_range_nolock: core req rate 38400000
[    0.000000] clk_set_rate_range_nolock: clamped rate 38400000
[    0.000000] clk_core_set_rate_nolock: rate 38400000
[    0.000000] clk_core_set_rate_nolock: rounded rate 38400000
[    0.000000] clk_set_rate_range_nolock: core req rate 16800000
[    0.000000] clk_set_rate_range_nolock: clamped rate 16800000
[    0.000000] clk_core_set_rate_nolock: rate 16800000
[    0.000000] clk_core_set_rate_nolock: rounded rate 16800000
[    0.000000] clk_set_rate_range_nolock: core req rate 12000000
[    0.000000] clk_set_rate_range_nolock: clamped rate 12000000
[    0.000000] clk_core_set_rate_nolock: rate 12000000
[    0.000000] clk_core_set_rate_nolock: rounded rate 12000000
[    0.000000] clk_set_rate_range_nolock: core req rate 13000000
[    0.000000] clk_set_rate_range_nolock: clamped rate 13000000
[    0.000000] clk_core_set_rate_nolock: rate 13000000
[    0.000000] clk_core_set_rate_nolock: rounded rate 13000000
[    0.000000] clk_set_rate_range_nolock: core req rate 19200000
[    0.000000] clk_set_rate_range_nolock: clamped rate 19200000
[    0.000000] clk_core_set_rate_nolock: rate 19200000
[    0.000000] clk_core_set_rate_nolock: rounded rate 19200000
[    0.000000] clk_set_rate_range_nolock: core req rate 26000000
[    0.000000] clk_set_rate_range_nolock: clamped rate 26000000
[    0.000000] clk_core_set_rate_nolock: rate 26000000
[    0.000000] clk_core_set_rate_nolock: rounded rate 26000000
[    0.000000] clk_set_rate_range_nolock: core req rate 38400000
[    0.000000] clk_set_rate_range_nolock: clamped rate 38400000
[    0.000000] clk_core_set_rate_nolock: rate 38400000
[    0.000000] clk_core_set_rate_nolock: rounded rate 38400000
[    0.000000] clk_set_rate_range_nolock: core req rate 16800000
[    0.000000] clk_set_rate_range_nolock: clamped rate 16800000
[    0.000000] clk_core_set_rate_nolock: rate 16800000
[    0.000000] clk_core_set_rate_nolock: rounded rate 16800000
[    0.000000] clk_set_rate_range_nolock: core req rate 26000000
[    0.000000] clk_set_rate_range_nolock: clamped rate 26000000
[    0.000000] clk_core_set_rate_nolock: rate 26000000
[    0.000000] clk_mux_determine_rate_flags: requested rate 26000000
[    0.000000] clk_mux_determine_rate_flags: current parent virt_26000000_ck
[    0.000000] clk_mux_determine_rate_flags: current parent rate 26000000
[    0.000000] 8<--- cut here ---
[    0.000000] Unable to handle kernel NULL pointer dereference at virtual address 00000000
[    0.000000] [00000000] *pgd=00000000
[    0.000000] Internal error: Oops: 5 [#1] SMP ARM
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.17.0-13433-g14667a708872 #193
[    0.000000] Hardware name: Generic OMAP36xx (Flattened Device Tree)
[    0.000000] PC is at clk_mux_determine_rate_flags+0x284/0x2dc
[    0.000000] LR is at clk_mux_determine_rate_flags+0x9c/0x2dc
[    0.000000] pc : [<c0a3e28c>]    lr : [<c0a3e0a4>]    psr: 600000d3
[    0.000000] sp : c0f01e68  ip : 3ffff7ff  fp : c0b49f04
[    0.000000] r10: c0b49ef8  r9 : c18843c0  r8 : c18843c0
[    0.000000] r7 : c0f01eb0  r6 : 018cba80  r5 : 00000000  r4 : 018cba80
[    0.000000] r3 : 00000000  r2 : 00000000  r1 : c0f01d38  r0 : c0c923e8
[    0.000000] Flags: nZCv  IRQs off  FIQs off  Mode SVC_32  ISA ARM  Segment none
[    0.000000] Control: 10c5387d  Table: 80004019  DAC: 00000051
[    0.000000] Register r0 information: non-slab/vmalloc memory
[    0.000000] Register r1 information: non-slab/vmalloc memory
[    0.000000] Register r2 information: NULL pointer
[    0.000000] Register r3 information: NULL pointer
[    0.000000] Register r4 information: non-paged memory
[    0.000000] Register r5 information: NULL pointer
[    0.000000] Register r6 information: non-paged memory
[    0.000000] Register r7 information: non-slab/vmalloc memory
[    0.000000] Register r8 information: slab kmalloc-192 start c18843c0 pointer offset 0 size 192
[    0.000000] Register r9 information: slab kmalloc-192 start c18843c0 pointer offset 0 size 192
[    0.000000] Register r10 information: non-slab/vmalloc memory
[    0.000000] Register r11 information: non-slab/vmalloc memory
[    0.000000] Register r12 information: non-paged memory
[    0.000000] Process swapper/0 (pid: 0, stack limit = 0x(ptrval))
[    0.000000] Stack: (0xc0f01e68 to 0xc0f02000)
[    0.000000] 1e60:                   00000000 ffffffff 018cba80 00000000 ffffffff 018cba80
[    0.000000] 1e80: c180adc0 c0f051c8 c18843c0 c18843c0 00000000 018cba80 00000000 ffffffff
[    0.000000] 1ea0: c18843c0 c7c9fae8 c7c9fb54 c0a3e378 018cba80 00000000 ffffffff 018cba80
[    0.000000] 1ec0: c180adc0 c0f051c8 c1028c80 c180aa40 018cba80 018cba80 00000000 c065349c
[    0.000000] 1ee0: 00000000 00000000 c7c9fb54 00000000 c180aa40 c180aa40 c180aa80 c0f01f24
[    0.000000] 1f00: c180aac0 00000000 00000001 c0653720 00000000 c180aa80 c0f01f24 c0e2c1a0
[    0.000000] 1f20: 00000000 c180a788 c1880b48 c7c9f940 00000000 00000000 00000000 c7cd0d98
[    0.000000] 1f40: c0e69b50 c0f01f70 a00000d3 c082c740 c7ca0c00 c0e69b50 c0f051c0 c7dffa40
[    0.000000] 1f60: ffffffff 00000000 10c5387d c0e0f6dc 00000000 c0f051c8 ffffffff c100843c
[    0.000000] 1f80: c0e5ba60 c0f051c0 c7dffa40 ffffffff 00000000 10c5387d 00000000 c0e0ba4c
[    0.000000] 1fa0: c1008000 c0e10e7c c1008000 c0e00f80 ffffffff ffffffff 00000000 c0e00728
[    0.000000] 1fc0: 00000000 c0e5ba60 a5aa33e0 c0f051c8 00000000 c0e004bc 00000051 10c0387d
[    0.000000] 1fe0: ffffffff 86feb000 413fc082 10c5387d 00000000 00000000 00000000 00000000
[    0.000000]  clk_mux_determine_rate_flags from clk_core_set_rate_nolock.part.0+0x84/0x1a8
[    0.000000]  clk_core_set_rate_nolock.part.0 from clk_set_rate_range_nolock.part.0+0x278/0x2a0
[    0.000000]  clk_set_rate_range_nolock.part.0 from __clk_put+0x58/0x160
[    0.000000]  __clk_put from of_clk_init+0x1b4/0x268
[    0.000000]  of_clk_init from omap_clk_init+0x38/0x58
[    0.000000]  omap_clk_init from omap_init_time_of+0x8/0x10
[    0.000000]  omap_init_time_of from start_kernel+0x480/0x6b0
[    0.000000]  start_kernel from 0x0
[    0.000000] Code: 0a000008 e587400c e5874000 e59f0050 (e5952000) 
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
[    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
