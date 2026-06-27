Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CF8C43602
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jun 2026 17:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y4H5lJi8Fv4+TgS+lkwzpzMi/R/v5KnDJoLjIy9B8hM=; b=NHfWYXqicV3IuJ
	xERt+h0CACT+IW3Cgi6XphZ3kRCbKQTvsRaakRDLCAmEBRyRTjcnO1gEFCFbmHPIwYPVqxqkaVyX2
	x+sEwj2LCCENKNivrzY4M6412wcQ+Vne1K3E4Np8CMVgBGxpXHxhA72+g+fqYJGsLq3X+k2+qL2wO
	TKpMKH2j2Vp76Ha5+BqJvv8WUZzXoSzClDb1O5mL+clv0WuzlVzU4IClKZ/+321mFCgS3qjqeEnS7
	xoSXaiZU0Gj9HVu4YUAiaJFu1ez3XeMmOpfP3qO3IDOTNH0zOonhWKzcqZneMzIJwcn2AnPX/CTXM
	DdpQnyorzHyRq7NK7akA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdX9q-0000000Cg4w-0pjl;
	Sat, 27 Jun 2026 17:49:34 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdX9m-0000000Cg3i-3s5y
	for linux-amlogic@lists.infradead.org;
	Sat, 27 Jun 2026 17:49:32 +0000
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-7353fc918d9so1497243137.2
        for <linux-amlogic@lists.infradead.org>; Sat, 27 Jun 2026 10:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782582569; x=1783187369; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+uflCN5dEoFADXWjqBtV9JZXNhAeBkbLG/4dD0z7b4I=;
        b=enbq5aJmBRgE9Dwx5N2J4LBd0rGu3SBnGF/8e8ZT0vzjDuc7N/nkirSWLPJUucVMaW
         gT5+h+rqL/qkc8cakQxBnN9niJYs1A5+ln0eM24yy/BiKHjPwVjhF+a4BtVN9EYeDrMr
         Cg1kpcOzXP7+9o0Ae8io9sV4YRW6hV1PSA2GHYGT8PAVNYuGbU3a3JPfEMThh5bz1Qdf
         4LvgCsNlFd3toBQMfCoRNd+0NQuuLZn22qmE8BwarV3etA3GNp7QWfTYyN3Lq8MwKHnx
         r1n7neInRdYHLPTmKTCXmqyQ766pLELIhGHV2ryG3Bj87WotgJN+c7yNtqNY8iz+3iNA
         o6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782582569; x=1783187369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uflCN5dEoFADXWjqBtV9JZXNhAeBkbLG/4dD0z7b4I=;
        b=WYhVFE5Af5j2QnSCuXUHQ4def+8DUzXANB2ulue4oEjVv04ZMixO8flmcetaqXjP+Q
         c74kEZhQsB+ee6IJAg277j/XGyD1mLb/LwZJ8YfmaS3XwrTfZDGE+HwpBbIlz0V4cHlY
         ubTlydjxebx643WYMXaoNJhHF4da0V4xI6EBRDb+xLavT1xN8t7NcQB4NMc88XRiLYqX
         5+dwUSleriXu3QEQS+x24BjJFEkCTtn+pfxkmQhCtE9NbbJuvYUDIls7EWQKvHAk9m9l
         tk6A2XXHBFieUb+p49B0gJa5fg0+RGUFhoCBM3GHlf0khmk3Gy8Uuxr337Hs9PyrXrmM
         65Jg==
X-Forwarded-Encrypted: i=1; AHgh+Rq0fHt+E/k3BNt26ucHNA8DuACf6Dp3hnaLCkqtepg0cdVkC1wQg7kkgHeDiXip30hUZtxtnm7pAIY/hqM6@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2s1jc2M9YXOLwoVrIsDZF/EUSuGPRzg6tc7HuPrv0GIFo4hkR
	enguxUJoLCgMbqaHfl9v9P8dxQzVxZIQc9Ry92Lerc/FT4Ju84rJpTGx
X-Gm-Gg: AfdE7cmsbEEEgu3DKuuq0pD1XXL/aWyiXNm/cZCLVi//6GfKw1eNsQFJrGa3A8p2Sz1
	icn5KRdWZ35bOdqYJwlUDVfKlPPIZWBlPThtXGkMGFKZGBF3m96DkXRSfoTIkpLRrN+UwDat7K6
	lipt3QnJ768asPqvvnssAIqWl44Gr/RUzkCKcM4V9HS7WsZySNj02Of4dUJAUCMoAEQM41fHfXp
	dqxl2S4zhM7azjHl+fur3QylsC4b8j3z4EiqEBwktED+UfY0aaBZYeHbyjnoiGpLacne5ybzPWJ
	UrKFs4lTb7vwgdwnmRWDPSaljY0aKdsz2esa5S8WrND1E9cKZiHJWZ1k+kCDKKL1Rm+qnqRNmud
	J/z6ShOPO8A0IS99gr4wfQAhmEq8eaIOq75Kue42c+ErUZgROUA8Xb26wukX7mFxIwYCzlYPaVD
	0LuNZBd1+ir9sOmLl3MpKl+uSHrgU1PVllNKVX5PdWPttL
X-Received: by 2002:a05:6102:440f:b0:730:db02:1d08 with SMTP id ada2fe7eead31-73434452fd5mr5471882137.10.1782582569056;
        Sat, 27 Jun 2026 10:49:29 -0700 (PDT)
Received: from localhost (d-24-145-72-22.fl.cpe.atlanticbb.net. [24.145.72.22])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96916e5b10dsm2811280241.4.2026.06.27.10.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 10:49:28 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
Date: Sat, 27 Jun 2026 13:49:27 -0400
To: David Laight <david.laight.linux@gmail.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
	Moritz Fischer <mdf@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	Dan Williams <djbw@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Will Deacon <will@kernel.org>,
	Jiucheng Xu <jiucheng.xu@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Xu Yang <xu.yang_2@nxp.com>, Linu Cherian <lcherian@marvell.com>,
	Gowthami Thiagarajan <gthiagarajan@marvell.com>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Aboorva Devarajan <aboorvad@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>, Ma Ke <make24@iscas.ac.cn>,
	Chengwen Feng <fengchengwen@huawei.com>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-perf-users@vger.kernel.org, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-fpga@vger.kernel.org,
	linux-rdma@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 13/16] perf: Use sysfs_emit() for cpumask show callbacks
Message-ID: <akANJ-AT7nHpRMq-@yury>
References: <20260528183625.870813-1-ynorov@nvidia.com>
 <20260528183625.870813-14-ynorov@nvidia.com>
 <7e980b99-1e4e-408b-8ebd-4d28116e7ad5@arm.com>
 <20260529130619.12f24264@pumpkin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260529130619.12f24264@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_104930_978773_A7C5966F 
X-CRM114-Status: GOOD (  25.29  )
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

On Fri, May 29, 2026 at 01:06:19PM +0100, David Laight wrote:
> On Fri, 29 May 2026 12:05:08 +0100
> Robin Murphy <robin.murphy@arm.com> wrote:
> 
> > On 2026-05-28 7:36 pm, Yury Norov wrote:
> > > These callbacks are sysfs show paths.
> > > 
> > > Use sysfs_emit() and cpumask_pr_args() to emit the masks.
> > > 
> > > This prepares for removing cpumap_print_to_pagebuf().  
> > 
> > TBH, looking at this diff I think it only shows the value of having a 
> > helper to abstract the boilerplate...
> > 
> > I'm not sure I agree with the argument of removing something entirely 
> > just because it may occasionally be misused, but could we at least have 
> > something like:
> > 
> > #define sysfs_emit_cpumask(buf, mask) \
> > 	sysfs_emit((buf), "%*pbl\n", cpumask_pr_args(mask))
> >
> > to save the mess in all the many places where the current 
> > cpumap_print_to_pagebuf() usage _is_ entirely appropriate?

This way you have to add 2 wrappers:

 #define sysfs_emit_cpulist(buf, mask) \
 	sysfs_emit((buf), "%*pbl\n", cpumask_pr_args(mask))

 and

 #define sysfs_emit_cpumask(buf, mask) \
 	sysfs_emit((buf), "%*pb\n", cpumask_pr_args(mask))

There are people who complain even about DIV_ROUND_UP(), how hard it is
to keep all that helpers in memory, and all that things.

https://lore.kernel.org/all/20260304124805.GB2277644@noisy.programming.kicks-ass.net/

Disagree about DIV_ROUND_UP() (because yeah, I'm bad in math), but
this sysfs_emit_cpumask() is a complete syntax redundancy.

Once we have it, people will do this type of things:

        tmp = kmalloc(PAGE_SIZE);
        sysfs_emit_cpumask(tmp, mask);
        sysfs_emit(buf, "my prefix: %s\n", tmp);
        kfree(tmp);

Patch #1 in this series is one example. My series that removes
bitmap_print_to_pagebuf() will give you more:

https://lore.kernel.org/all/20260303200842.124996-2-ynorov@nvidia.com/

It doesn't mean that *you* will misuse the API. It means that *I* will
have to inspect the codebase for that type of bugs periodically.

So, the overall state is simple: we've got well-established
printf()-like functions that people know and understand, and we also
have exotic APIs here and there with a non-standard interface and a
clear potential to misuse. In this case, they have historical roots,
but now we don't need them.

> That has the advantage of letting you change how it is done (again)
> without having to find all the callers.

You mean things like silencing the prints or adding a prefix?

If you believe that perf subsystem would benefit from it - that's
OK. Just please keep it local. The kernel globally doesn't need to
'change how it is done' beyond the lib/vsprintf.  The kernel really
needs people to use something that the other people are familiar with.

Thanks,
Yury

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
