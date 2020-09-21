Return-Path: <SRS0=01f4=C6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F8FBC4727C
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Sep 2020 22:24:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B690223A63
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Sep 2020 22:24:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dYwnAIe7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="x1+tx4t5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B690223A63
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BAkYi62k+l0EugOXczIGUx6HNX9Q7KFMZhibhLIQYks=; b=dYwnAIe7nqgLWo6s31b8GVwct
	QX7H+vMm9nWayWdtE6qQjeIAiuYwlaVahG9D/fqKHse7BQ/tNXU2ioI9IBpczmHoIW78qK1JUOHuh
	Y/CNCGfDyfs2Q13Al/Gv/XZPFmjEqpExBUnLF6ynh/Z4MA90PLYfiiL1E8STwGaVrMG+N9Uigiphl
	juloW9g2I/ebkCIJ845kZyaQ8FyFVXLcPKPtrDK/+XvF1mDX5f7+RrjG+ULBo027KYskZuJ5dmfYo
	puIMXqEGHFUkgIoFtoTmLvs8Wpw4JjRFEFHh5pUqsuJ38XIPmL5bDrrJ4OjFoOiTHLxTxkQoav0Eb
	6XVddtUFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKUEl-0000ng-0P; Mon, 21 Sep 2020 22:24:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKUEi-0000mV-Oj; Mon, 21 Sep 2020 22:24:41 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2157523A63;
 Mon, 21 Sep 2020 22:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600727080;
 bh=1PUJ5hNzZTNJHRrWsG3qH9Ptt+duX4WCMYgHNreOFF4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=x1+tx4t5xnc8rNe7UWv5d0zvDRXkj6XToXs0Pyf/+5XHpb3DF5wqgSaHpgyzmVx3V
 7ZoJ+jLyb8mOgdPTOYNlXScX9cHDSUghI946B+JsMOUk0PvUp1YpH3s62uCof9b8Jf
 XGpyPrxLFD8nYYIX4fWIYYzjfp/D1vv/F9ThLdAA=
Date: Mon, 21 Sep 2020 23:24:34 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/3] iommu/io-pgtable-arm: Support coherency for Mali LPAE
Message-ID: <20200921222434.GB4409@willie-the-truck>
References: <cover.1600213517.git.robin.murphy@arm.com>
 <d2a3ddb17b3270e268e2f1adf7682ea938823941.1600213517.git.robin.murphy@arm.com>
 <20200921175717.GF3141@willie-the-truck>
 <71cc6c53-7bd1-da1a-05fa-8172510b33d8@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <71cc6c53-7bd1-da1a-05fa-8172510b33d8@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_182440_860801_AC0B42CF 
X-CRM114-Status: GOOD (  23.36  )
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
Cc: robh@kernel.org, tomeu.vizoso@collabora.com, narmstrong@baylibre.com,
 khilman@baylibre.com, dri-devel@lists.freedesktop.org, steven.price@arm.com,
 iommu@lists.linux-foundation.org, alyssa.rosenzweig@collabora.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Sep 21, 2020 at 10:53:23PM +0100, Robin Murphy wrote:
> On 2020-09-21 18:57, Will Deacon wrote:
> > On Wed, Sep 16, 2020 at 12:51:05AM +0100, Robin Murphy wrote:
> > > Midgard GPUs have ACE-Lite master interfaces which allows systems to
> > > integrate them in an I/O-coherent manner. It seems that from the GPU's
> > > viewpoint, the rest of the system is its outer shareable domain, and so
> > > even when snoop signals are wired up, they are only emitted for outer
> > > shareable accesses. As such, setting the TTBR_SHARE_OUTER bit does
> > > indeed get coherent pagetable walks working nicely for the coherent
> > > T620 in the Arm Juno SoC.
> > 
> > I can't help but think some of this commentary deserves to be in the code
> > as well.
> 
> Sure, if you want.

Yes, please.

> > Do you know if this sort of thing is done for other SoCs too, or is this
> > just a Juno quirk?
> 
> Yup, this is a "Midgard working as designed" thing. Juno is the coherent
> example I have to hand, but off the top of my head I believe some of the
> Exynos SoCs can also use their GPUs coherently if a switch is flipped in the
> interconnect to change routing between the CCI and a direct-to-RAM path; I
> expect there are probably further Midgard examples that I'm not aware of.
> Then there are definitely coherent Bifrost GPUs like the Amlogic S922/A311
> that prompted me to revive this patch, which we currently drive in "Legacy"
> mode and thus behave the same way as Midgard (Bifrost's "AArch64" mode
> realigns Ish and Osh with the rest of the system, and instead invents a new
> "Internal Shareable" value in between Nsh and Ish to represent the
> shareability between cores within the GPU for which Midgard hijacked Ish).

That is more than I wanted to know :) "Internal Shareable", jeez...

Thanks,

Will

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
