Return-Path: <SRS0=naQK=AN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F2EC433DF
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2020 18:03:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92D7C20760
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2020 18:03:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OpKcDuR2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="SDEAl+v4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92D7C20760
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o4GZDC+w//cw8PQ22ZZKz3v8ueDhZjuID8aRcZs+A20=; b=OpKcDuR2KuMH1RZorJuF7rhf9
	8bL72K2m5LBfOGTpSFQze9obhOEMCDQ/u5dxIzLAIr5ACopIMnTf2lCY4nybXlBzsq5FKuBOgYp9U
	wbuLpSkJC0QcBtVaJzTve6KHE2QqXYMvuzKLNKYaesUVUTfEonXQ+JwmZzi98aFmql1TD71If5qI5
	pYykeIUjahFBMV1WthsxMIl4fJ+O776/HjQJVCj2gIMThsKUlXP57SZs1Vbw2baRQbM52d3jNtnuW
	5MhkYdxNWGYMxiyG5YdbeCJ8F08IInyryAiBKs4B8r6af61qNx2b00o8IOM54IRtI9Ydv/EDwY88f
	+x08R0Yjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jr3Yl-0007hl-NI; Thu, 02 Jul 2020 18:03:43 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jr3Yi-0007gY-Jg
 for linux-amlogic@lists.infradead.org; Thu, 02 Jul 2020 18:03:41 +0000
Received: by mail-wr1-x442.google.com with SMTP id r12so29506467wrj.13
 for <linux-amlogic@lists.infradead.org>; Thu, 02 Jul 2020 11:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=UpAJNr8vpfTKtPQlj/e/glrJ9ulcMqPbKalh3VG00pM=;
 b=SDEAl+v4mwYH2FWXjETOOYOvRfmikj7NShBSNRHJW2UZNJ4YUd+TJJryD9LzQ9QhpA
 eN1lwTgoQwINeLc3RXJ4cU+Y5hdSlkBU1BmgJDNVMOiGHcpYH6pcgDLK52aLrzVZmv6r
 PFnkOFxN+vObKR9N+rJ+7S6/i/cxfEcUkp7XI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=UpAJNr8vpfTKtPQlj/e/glrJ9ulcMqPbKalh3VG00pM=;
 b=LPXzWYMpvA36AH50HMF+m3ZSxGRCghNMdfDGiGqdBfYqr5Caol87CBBYI5yC+6lGkl
 +DynWxHGAnbrri32cr8pkPVq+rufYYvsISeTMsBPe3uerZptskfvKsfjQEkp0lhd2Z2X
 UEpS9ilorPn5Enqplvsl5ZTIwjOcc6ruU8TMhJ1vakOcDc8GJ/gsyoFklU7WiOZIvLm1
 e80GTQcFyorppZNhlWNqafd9AaLRXt8Nyu6t9ygwkAJmhbYbRKxBhkF3eg/5kNgke17y
 Zj3kST+cfaUlpPxtbBfUcVFEubCVb/wHiuhCbKj7HqcA0aKo74kGwnF8NV7R0meQ3dIT
 vKLA==
X-Gm-Message-State: AOAM530e/m2IxeIh9a+AxjHQHvf3YS9ZJTewOkSfh2wuH1Y3GNMJVsTS
 1JMSC0MF+ccNiWzpI+Ec8wAVdmLwTf8=
X-Google-Smtp-Source: ABdhPJwUPiRqviJX4p/wQ4ZlfWVQDt88ex2g1XXDueh/V48dmaVm3xrRzZwLDYoIIaTkFo3VMCW82w==
X-Received: by 2002:adf:f104:: with SMTP id r4mr34105603wro.90.1593713019519; 
 Thu, 02 Jul 2020 11:03:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n16sm11595673wra.19.2020.07.02.11.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 11:03:38 -0700 (PDT)
Date: Thu, 2 Jul 2020 20:03:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v8 1/6] drm/fourcc: Add modifier definitions for
 describing Amlogic Video Framebuffer Compression
Message-ID: <20200702180336.GB3278063@phenom.ffwll.local>
Mail-Followup-To: Neil Armstrong <narmstrong@baylibre.com>,
 Simon Ser <contact@emersion.fr>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jianxin.pan@amlogic.com" <jianxin.pan@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20200702074759.32356-1-narmstrong@baylibre.com>
 <20200702074759.32356-2-narmstrong@baylibre.com>
 <8cBfZpkc4pHBLhihlvJMD_Hq1DEsNRcSY4Y8JaGwklMWcxiYzUMVEx7wH9f_DuCBMVUhXvOR0PcHVslILtKI2wdw79Nfih0N3VnrxfMQd08=@emersion.fr>
 <20200702131834.GZ3278063@phenom.ffwll.local>
 <044964ad-b927-57d7-9361-beda5c8d99a8@baylibre.com>
 <CAKMK7uHa4ajC5_SA_fFUhB-Amxcbt7T9UZ+pvRhqDeUeX9Ez6A@mail.gmail.com>
 <190ac909-c78b-81e0-35a1-353cd24e9f44@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <190ac909-c78b-81e0-35a1-353cd24e9f44@baylibre.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_140340_657449_BD4F6CDF 
X-CRM114-Status: GOOD (  24.13  )
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
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Jul 02, 2020 at 05:11:25PM +0200, Neil Armstrong wrote:
> Hi,
> 
> On 02/07/2020 16:15, Daniel Vetter wrote:
> > On Thu, Jul 2, 2020 at 3:34 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> On 02/07/2020 15:18, Daniel Vetter wrote:
> >>> On Thu, Jul 02, 2020 at 09:23:11AM +0000, Simon Ser wrote:
> >>>> On Thursday, July 2, 2020 9:47 AM, Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>>>
> >>>>> Finally is also adds the Scatter Memory layout, meaning the header contains IOMMU
> >>>>> references to the compressed frames content to optimize memory access
> >>>>> and layout.
> >>>>>
> >>>>> In this mode, only the header memory address is needed, thus the content
> >>>>> memory organization is tied to the current producer execution and cannot
> >>>>> be saved/dumped neither transferrable between Amlogic SoCs supporting this
> >>>>> modifier.
> >>>>
> >>>> Still not sure how to handle this one, since this breaks fundamental
> >>>> assumptions about modifiers.
> >>>
> >>> I wonder whether we should require special allocations for these, and then
> >>> just outright reject mmap on these buffers. mmap on dma-buf isn't a
> >>> required feature.
> >>
> >> Yes, it's the plan to reject mmap on these buffers, but it can't be explained
> >> in the modifiers description and it's a requirement of the producer, not the
> >> consumer.
> > 
> > Hm I think worth to add that as a note to the modifier. Just to make
> > sure. And avoids questions like the one from Simon.
> 
> Something like:
> 
>  /*
>   * Amlogic FBC Scatter Memory layout
>   *
>   * Indicates the header contains IOMMU references to the compressed
>   * frames content to optimize memory access and layout.
>   *
>   * In this mode, only the header memory address is needed, thus the
>   * content memory organization is tied to the current producer
>   * execution and cannot be saved/dumped neither transferrable between
>   * Amlogic SoCs supporting this modifier.
> + *
> + * Due to the nature of the layout, these buffers are not expected to
> + * be accessible by the user-space clients but only accessible by the
> + * hardware producers and consumers.
> + *
> + * The user-space clients should expect a failure while trying to mmap
> + * the DMA-BUF handle returned by the producer.
>   */

lgtm, Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Thanks,
> Neil
> 
> > -Daniel
> > 
> >>
> >>>
> >>> That would make sure that userspace cannot look at them.
> >>>
> >>> Also I'm kinda suspecting that there's not unlimited amounts of this magic
> >>> invisible storage available anyway.
> >>> -Daniel
> >>>
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > 
> > 
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
