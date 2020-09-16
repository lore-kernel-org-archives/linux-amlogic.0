Return-Path: <SRS0=Xszf=CZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57141C433E2
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2020 17:46:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA08B206B6
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2020 17:46:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GgiYeFRQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="B5ESeMEU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA08B206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DwXivvCW+K6yR/YYuXccHR6prkWgzqRk5T6ON88UffA=; b=GgiYeFRQ1G39VnyAc64hbwyQi
	RT+vNqYtvNic9cIduelFCeq7XXzT5lfnLYvUA/h7xAIMkBUwZEXvgu19a5i3+beFk1Rzqxs/0Zkx5
	O1YBNStgEI9Eo4k4mwhtvcCGqoEs9sa6TRrTeHkMsRYeLWp8amiTQ0TZU/yKfgjqO0uXo32o66A9u
	7+iO2BSfNyOQUHZhO1SSKhbWcRdOohk6frclH6C+IT8A1wZZ/YIOeDuzaOFeVfB9BVcWOviOwCmpg
	PO2WMikI2hMfGLz16CrOtJJInydCzdxVLTUw6fSfmDv3QijcousB1k5sxxgnGsREG8s8mW0yzQASn
	pKKrFCiUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIbW2-0004ps-In; Wed, 16 Sep 2020 17:46:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIbW0-0004pH-21; Wed, 16 Sep 2020 17:46:44 +0000
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 270622074B;
 Wed, 16 Sep 2020 17:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600278403;
 bh=T7fAAdGMEwmTUz3pfaivZhFKXEL+DDksEtd73K/d1go=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=B5ESeMEUtj1Na7fmLooTO8GkHarnHss8zBYCfN/dmFbqoxSgiuinIyUxGXgDBiHRD
 wVyiSJIvR2essfm0M43MtG9+p1eZkTr/kBrVnLRsjPY6AVwDHkkeciV16Nwyt618Qi
 AQzbMGHh21c31NP/94SPiEy7qaTP3ohI6MHi7vzI=
Received: by mail-oi1-f176.google.com with SMTP id c13so9060038oiy.6;
 Wed, 16 Sep 2020 10:46:43 -0700 (PDT)
X-Gm-Message-State: AOAM531T6PVl6LIWRFrV9/Qv4/mLEat0WnD0qZ4PzHMTldqXtMDKje0x
 Bl/G0KZiGBRYYJ1dfK5LaAxOkuaQ2fYO2ftX/A==
X-Google-Smtp-Source: ABdhPJzrTvS63xEc/YGj1M1VvkjQrHbt5CCRuhwhSuLfTUE5WrBgivzbCA7OeSqMGDgazvs3cRxd8meuptTx472enRI=
X-Received: by 2002:aca:1711:: with SMTP id j17mr4051983oii.152.1600278402414; 
 Wed, 16 Sep 2020 10:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1600213517.git.robin.murphy@arm.com>
 <d109e9da-feb3-c09f-2b7f-98c92ce39593@baylibre.com>
 <20200916170409.GA2543@kevin>
In-Reply-To: <20200916170409.GA2543@kevin>
From: Rob Herring <robh@kernel.org>
Date: Wed, 16 Sep 2020 11:46:31 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLGO4YYPjQsjnzZCW5iT6n+keZw9G9mFALJip0nDo42Hw@mail.gmail.com>
Message-ID: <CAL_JsqLGO4YYPjQsjnzZCW5iT6n+keZw9G9mFALJip0nDo42Hw@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm: panfrost: Coherency support
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_134644_317976_ABCC6D04 
X-CRM114-Status: GOOD (  13.20  )
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Kevin Hilman <khilman@baylibre.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Sep 16, 2020 at 11:04 AM Alyssa Rosenzweig
<alyssa.rosenzweig@collabora.com> wrote:
>
> > So I get a performance regression with the dma-coherent approach, even if it's
> > clearly the cleaner.
>
> That's bizarre -- this should really be the faster of the two.

Coherency may not be free. CortexA9 had something like 4x slower
memcpy if SMP was enabled as an example. I don't know if there's
anything going on like that specifically here. If there's never any
CPU accesses mixed in with kmscube, then there would be no benefit to
coherency.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
