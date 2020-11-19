Return-Path: <SRS0=1amn=EZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 520D2C2D0E4
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Nov 2020 14:17:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1F3C22256
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Nov 2020 14:17:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JD7S0LgF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="an3c4i3/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1F3C22256
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tFmeI1kpT8XTgebIYXFrXvg9yJG5fa+2yJfxkp0U6po=; b=JD7S0LgFBsuSTblYQYAaIbtpJ
	hwDmIwwA4Y8E3vBQTWBH5Ps5ZWLY2wlH0RW+E5s3YL1E/O+N2SyvMrqXFYKg/2ax9iNQuv/ZkW+yN
	Hv09jJSjiE0H0dFHutRL02wni44bgcTUBSypOjqf5FMYEDQk5JXpi+sGtOIV1w82dCwjLP2k963O7
	KFdAnAQgk+vIJTa3JeJrZuYhjh6gKs7foQKam+V3sJioNtz9SBAcuNM8KXlIuZld5RhIZj7HKl9Nl
	meLxiJ//d5GS8AHF+/dYjSOUTVCX6qz8Gwdbm33E/jERdTBYSMm9W/l/6dz1PKJnTaoAO4bVkOqN3
	VNK+7HXFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfkkr-0003Cq-HE; Thu, 19 Nov 2020 14:17:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfkkl-0003BK-TJ; Thu, 19 Nov 2020 14:17:43 +0000
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 39E00246D3;
 Thu, 19 Nov 2020 14:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605795458;
 bh=tRhzgdnm49wLGYBksavMXrneoZPG3bG+rYPWCGwty94=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=an3c4i3/DR0eegqVhBgJASPzCAUqbuw0i6yqXdVFm63zrutAXecwqwhxsbd2T8/+0
 Vx/sUvWnGfyrMTxDMmD/Cgj6e7pKor/xTDNlebSCRfoSUH/8F3gCMMq02UxVNnIfR2
 BmmSwsaYs1PtAhkC1J3iX5IKxqJijwUETa+7QiH8=
Received: by mail-oi1-f171.google.com with SMTP id m143so6424924oig.7;
 Thu, 19 Nov 2020 06:17:38 -0800 (PST)
X-Gm-Message-State: AOAM531Z9qW9szKAkRfLe9xTyXcOIwtRsPjmR23mXHk48+IGmNbLDjHf
 yArFFsxcX3n4qV/bYhLX4Jo4FhewVAuNqKgIDA==
X-Google-Smtp-Source: ABdhPJy5aycKt4bA/mJAKjfO7Q4kZb+EgCZ07oXCa+mWpPC51S/i92s2ptkiAs0/ZTKg40x95hPXeAYFk9BQvyQfpiw=
X-Received: by 2002:aca:fdd4:: with SMTP id b203mr3032696oii.152.1605795457466; 
 Thu, 19 Nov 2020 06:17:37 -0800 (PST)
MIME-Version: 1.0
References: <20200921074953.25289-1-narmstrong@baylibre.com>
 <CAL_JsqLZzxXcvoqd29NM45UjL-mbSiHphTO_zOwbCwPKd+jWEw@mail.gmail.com>
 <20201119111201.GA19942@e121166-lin.cambridge.arm.com>
In-Reply-To: <20201119111201.GA19942@e121166-lin.cambridge.arm.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 19 Nov 2020 08:17:26 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKxLxijhcG7SHEqfA3j6xM6cJpv-3fT2r1Nysst_8ireg@mail.gmail.com>
Message-ID: <CAL_JsqKxLxijhcG7SHEqfA3j6xM6cJpv-3fT2r1Nysst_8ireg@mail.gmail.com>
Subject: Re: [PATCH] PCI: dwc/meson: do not fail on wait linkup timeout
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_091740_090155_3A76CABE 
X-CRM114-Status: GOOD (  20.68  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, PCI <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yue Wang <yue.wang@amlogic.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Nov 19, 2020 at 5:12 AM Lorenzo Pieralisi
<lorenzo.pieralisi@arm.com> wrote:
>
> On Tue, Sep 22, 2020 at 11:30:30AM -0600, Rob Herring wrote:
> > On Mon, Sep 21, 2020 at 1:50 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> > >
> > > When establish link timeouts, probe fails but the error is unrelated since
> > > the PCIe controller has been probed succesfully.
> > >
> > > Align with most of the other dw-pcie drivers and ignore return of
> > > dw_pcie_wait_for_link() in the host_init callback.
> >
> > I think all, not most DWC drivers should be aligned. Plus the code
> > here is pretty much the same, so I'm working on moving all this to the
> > common DWC code. Drivers that need to bring up the link will need to
> > implement .start_link() (currently only used for EP mode). Most of the
> > time that is just setting the LTSSM bit which Synopsys thought letting
> > every vendor do their own register for was a good idea. Sigh.
>
> Should I drop this patch then ?

Yes, this is done by my series.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
