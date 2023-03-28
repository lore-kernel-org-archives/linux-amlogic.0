Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF838C76195
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Mar 2023 11:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0k1/Jurw+DO4zHhiV0SoM+VyhgqWTEIv3dSE6AnQ6tQ=; b=RfW3CsHHdPviqD
	mP6JPKCO9FA8sulnM7lg6xU4twR1G8ioC8Utsnlm0aF9D9QzA+KnwsKiNdvhafFz6wfKA9cr+OuIs
	hW2b+IIaHeuT3uCoYPYrxnZoZeNfg7XJYzsWO0fNaRPiO7VeumpkNMXemUfxTy/SP1QdsRifwT8t4
	QbnQEq0r7bppynO1H8+cjFt8Cuh0rWYppaXCa1J2ZKJCGRsiQIoSpm30SJ07V0NCE4K8IhnFidWkH
	urfFyB59WgVSo6odAkPuk23XS5JhBQjMiAuBfyfGB8h0h4XAc8QXsL2MIGfHkdr96jYgcZT/USdpb
	cPTdarZVKjoNAmT97ArQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph7vf-00EFFL-0D;
	Tue, 28 Mar 2023 11:55:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph7vc-00EFEL-0v;
	Tue, 28 Mar 2023 11:55:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 68EA2616EE;
	Tue, 28 Mar 2023 11:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 985ABC433D2;
	Tue, 28 Mar 2023 11:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680004549;
	bh=o1gbd6Q5+PuxNMWGpMNsW7Voev+NdraTBgWWGtpU/jo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I1coS1fgw8eKHOf0GZTTiaC3squr9cE6N4AbGLMRghil2Ld13FSlWwegdInImTIMC
	 0oOObmG4zAPt1e+UMXYEYdho1rC+4xKcKyiw+pzc+AQ5N7siDyyiii8y/Duul23JIb
	 j3n6YUzqW/PnZMgParnLG88VMWEC1KR82J1STm2Xd4oonlbXWANR7Od6O4ftr9ai35
	 XLfufyKDUMQTRJQFNvEB8JA4a7hesFjyz+NSvOZKHj+CzTCG54bgROx0Oesi6Pd6Di
	 OwJdEVnrQ1wTZVxFKGpRpfLoKDAVON1lx8H4YEcM5Gog73mA7lC0rwQQdP2bzNs3UH
	 NmbaMXG/Ag2qg==
Date: Tue, 28 Mar 2023 12:55:43 +0100
From: Will Deacon <will@kernel.org>
To: Jiucheng Xu <jiuchengxu@163.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>,
	Kelvin Zhang <kelvin.zhang@amlogic.com>,
	Chris Healy <cphealy@gmail.com>, Chris Healy <healych@amazon.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] perf/amlogic: Fix large number of counter issue
Message-ID: <20230328115543.GA1159@willie-the-truck>
References: <20230209115403.521868-1-jiucheng.xu@amlogic.com>
 <20230209115403.521868-2-jiucheng.xu@amlogic.com>
 <20230327141054.GC31752@willie-the-truck>
 <79968005-28f3-d890-dfea-faca2e7d7947@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <79968005-28f3-d890-dfea-faca2e7d7947@163.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_045552_422793_71110757 
X-CRM114-Status: GOOD (  25.63  )
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

On Tue, Mar 28, 2023 at 10:29:04AM +0800, Jiucheng Xu wrote:
> 
> My Amlogic email box has some issues. Use my personal email
> <jiucheng.xu@163.com> to reply.
> 
> On 2023/3/27 22:10, Will Deacon wrote:
> > [ EXTERNAL EMAIL ]
> > 
> > On Thu, Feb 09, 2023 at 07:54:02PM +0800, Jiucheng Xu wrote:
> > > When use 1ms interval, very large number of counter happens
> > > once in a while as below:
> > > 
> > > 25.968654513 281474976710655.84 MB meson_ddr_bw/chan_1_rw_bytes,arm=1/
> > > 26.118657346 281474976710655.88 MB meson_ddr_bw/chan_1_rw_bytes,arm=1/
> > > 26.180137180 281474976710655.66 MB meson_ddr_bw/chan_1_rw_bytes,arm=1/
> > > 
> > > Root cause is the race between irq handler
> > > and pmu.read callback. Use spin lock to protect the sw&hw
> > > counters.
> > > 
> > > Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
> > > ---
> > >   drivers/perf/amlogic/meson_ddr_pmu_core.c | 10 +++++++++-
> > >   1 file changed, 9 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/perf/amlogic/meson_ddr_pmu_core.c b/drivers/perf/amlogic/meson_ddr_pmu_core.c
> > > index 0b24dee1ed3c..9b2e5d5c0626 100644
> > > --- a/drivers/perf/amlogic/meson_ddr_pmu_core.c
> > > +++ b/drivers/perf/amlogic/meson_ddr_pmu_core.c
> > > @@ -14,6 +14,7 @@
> > >   #include <linux/perf_event.h>
> > >   #include <linux/platform_device.h>
> > >   #include <linux/printk.h>
> > > +#include <linux/spinlock.h>
> > >   #include <linux/sysfs.h>
> > >   #include <linux/types.h>
> > > @@ -23,6 +24,7 @@ struct ddr_pmu {
> > >   	struct pmu pmu;
> > >   	struct dmc_info info;
> > >   	struct dmc_counter counters;	/* save counters from hw */
> > > +	spinlock_t lock;		/* protect hw/sw counter */
> > >   	bool pmu_enabled;
> > >   	struct device *dev;
> > >   	char *name;
> > > @@ -92,10 +94,12 @@ static void meson_ddr_perf_event_update(struct perf_event *event)
> > >   	int idx;
> > >   	int chann_nr = pmu->info.hw_info->chann_nr;
> > > +	spin_lock(&pmu->lock);
> > Why doesn't this need the _irqsave() variant if we're racing with the irq
> > handler?
> > 
> > Will
> I think meson_ddr_perf_event_update function is called with hard irq off.
> So update function couldn't be interrupted by irq handler. Right?

I'm just confused about the race, then. The commit message says you have a
race between an irq handler and a callback, which you fix with a spinlock
that isn't irq safe. So either the race is real and the lock needs to be
irqsafe, or the race is something else entirely, no?

Will

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
