Return-Path: <SRS0=naQK=AN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E0CEC433DF
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2020 14:16:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECD0620772
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2020 14:16:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bFQYX9mE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="MTS+DY37"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECD0620772
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=urHVoCl28EtmN6R8isOLILUshvBqD9HBYxZqawEi2LY=; b=bFQYX9mEEDZCsdrP49VCAu3nz
	ZIVPHGUk/mHadFftP8cdldXbn2LFzYMgbItgXfggTVgZEpE4qhrKLg0gsKppFt+H431dt7Wys9RFy
	E4/AMcm4exXUV8SaFf9SMdP5Ics2HSqXVfpCwEeLXJcEHD7HvngNDMLsa8KiqcS0eqSz71IsQ6J+6
	79aX/aj1ptqAruE03wvOMdnHGTijuQKOEtnhfVW54WMB5ClF7r10kSOAznJMkea/CwtHF0BXb/eWm
	gHkDeJMDIqChsmCHNgFO4kvmwlfefKuXGxrfvkLieuc7lhm0roJkM3ouYu+AdFGvbRz6SASpMBJne
	xEzdsRZSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jr00O-0006gd-NE; Thu, 02 Jul 2020 14:16:00 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jr00L-0006fi-6U
 for linux-amlogic@lists.infradead.org; Thu, 02 Jul 2020 14:15:58 +0000
Received: by mail-ot1-x343.google.com with SMTP id n24so22005554otr.13
 for <linux-amlogic@lists.infradead.org>; Thu, 02 Jul 2020 07:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9A7iY5vgoWTo7GNwa7G63eYFYvMacp50tlztFrDTtic=;
 b=MTS+DY37g24tK3D8pt2+U8KwQfmhQUXnYI74XgJj3V7kT/uYoUcT9IrsWGpHBoagcY
 qP2mCi82Yr4+2GBLslXn0mA3qDebBbuA63m8UPq5VJHYK3Q8yc9JNsMerUbq8w2R5vHy
 O0M9Xm4Ek/saTssTVrfAmwSbCKdT4MYzVS3Uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9A7iY5vgoWTo7GNwa7G63eYFYvMacp50tlztFrDTtic=;
 b=ELToSvpwlC8801d+BUZ00XdpUmpVAbAmlxlM6QfQu+nm0Srh2531cDQM+DJlcPxmgL
 CvyS4Na4/DR6kJNvekcEDRMlSCr2YUgICM5dphS3Uodh2jm0jGqAC0vKX+26a/ioDppc
 nQpZpRPjzJeBSQrnKxRlMSena8cqSkxqof6MBV7pL1oXgQNR9wU5AlV1Q/F5Ck7TrKdH
 lc8jJAcuOI/kvRrcIUwLVUd7CFJtvyKK1fkgKTQKgsqeqdXl8KOmNGhkBYjjXK0rJzdm
 zvzA2t7Pc2CTj0wHRAO34+qin1zEjDdzmHYrJcGS6BfGyWOib5fpoq6Tt1X68KV4nRek
 tK/w==
X-Gm-Message-State: AOAM530RydrBRTrBHFV08/b1ovYjqH6i+HISNBzYGZpTJTN6RqJgFUws
 AbnHU4aXJybbjWWxQk+OEjUPMP+Vs5RgBoKC8aiQNw==
X-Google-Smtp-Source: ABdhPJwaoRuELQ86SMBX24OJmZreO2Szy92aZ3dQsxrJRTUi1P616DpufT08jo7MpSCeSJZoPYNU7WeJQ7wwc5qWVOE=
X-Received: by 2002:a05:6830:1d0:: with SMTP id
 r16mr15024239ota.188.1593699355009; 
 Thu, 02 Jul 2020 07:15:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200702074759.32356-1-narmstrong@baylibre.com>
 <20200702074759.32356-2-narmstrong@baylibre.com>
 <8cBfZpkc4pHBLhihlvJMD_Hq1DEsNRcSY4Y8JaGwklMWcxiYzUMVEx7wH9f_DuCBMVUhXvOR0PcHVslILtKI2wdw79Nfih0N3VnrxfMQd08=@emersion.fr>
 <20200702131834.GZ3278063@phenom.ffwll.local>
 <044964ad-b927-57d7-9361-beda5c8d99a8@baylibre.com>
In-Reply-To: <044964ad-b927-57d7-9361-beda5c8d99a8@baylibre.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 2 Jul 2020 16:15:44 +0200
Message-ID: <CAKMK7uHa4ajC5_SA_fFUhB-Amxcbt7T9UZ+pvRhqDeUeX9Ez6A@mail.gmail.com>
Subject: Re: [PATCH v8 1/6] drm/fourcc: Add modifier definitions for
 describing Amlogic Video Framebuffer Compression
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_101557_263129_1FE6D060 
X-CRM114-Status: GOOD (  18.75  )
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
Cc: "jianxin.pan@amlogic.com" <jianxin.pan@amlogic.com>,
 Simon Ser <contact@emersion.fr>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Kevin Hilman <khilman@baylibre.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Jul 2, 2020 at 3:34 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 02/07/2020 15:18, Daniel Vetter wrote:
> > On Thu, Jul 02, 2020 at 09:23:11AM +0000, Simon Ser wrote:
> >> On Thursday, July 2, 2020 9:47 AM, Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >>> Finally is also adds the Scatter Memory layout, meaning the header contains IOMMU
> >>> references to the compressed frames content to optimize memory access
> >>> and layout.
> >>>
> >>> In this mode, only the header memory address is needed, thus the content
> >>> memory organization is tied to the current producer execution and cannot
> >>> be saved/dumped neither transferrable between Amlogic SoCs supporting this
> >>> modifier.
> >>
> >> Still not sure how to handle this one, since this breaks fundamental
> >> assumptions about modifiers.
> >
> > I wonder whether we should require special allocations for these, and then
> > just outright reject mmap on these buffers. mmap on dma-buf isn't a
> > required feature.
>
> Yes, it's the plan to reject mmap on these buffers, but it can't be explained
> in the modifiers description and it's a requirement of the producer, not the
> consumer.

Hm I think worth to add that as a note to the modifier. Just to make
sure. And avoids questions like the one from Simon.
-Daniel

>
> >
> > That would make sure that userspace cannot look at them.
> >
> > Also I'm kinda suspecting that there's not unlimited amounts of this magic
> > invisible storage available anyway.
> > -Daniel
> >
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
