Return-Path: <SRS0=oV4S=6F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D9B6C55183
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2020 12:17:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53DBF2064C
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2020 12:17:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nyN6vXqH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="kdV7+rdO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53DBF2064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PN9MYvCD2jZnPdmGWoh7Cji2pYOlxcHawYgLSFIc2dY=; b=nyN6vXqHRR2Rf2
	CsSc+689G/OqzpXeWhyFOq8zlFbTtFFIE9qYLiWQ2dbNXsPszNVas9qw89/hx1474u4Za1IY2KudO
	1d9GZ2wwJTbkpoZokUSXQw7qiwu66YfT5Um1YZlzOOFOCnei4M2U623+rIpaSSZodLbJhUstLqWoM
	he01Zh/pvnjWJwMDw5PBuNn/DRUCdwjHfiQHjE+MmHX+3+59UNv4Iy2SvXKy+etqWrreLIy0HyHAD
	7vMqRYTI/cuLugwKrcVV8n1g9zHW9ZTeXO1vPttou7kWsfSLHP5g58RtrC8HEWnwUOsZbKw4x3gws
	BQdSj7E016OV0QVuddiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQrpg-0005DG-7x; Tue, 21 Apr 2020 12:16:56 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQrpW-00052v-0L
 for linux-amlogic@lists.infradead.org; Tue, 21 Apr 2020 12:16:48 +0000
Received: by mail-wm1-x342.google.com with SMTP id g12so3417542wmh.3
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Apr 2020 05:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=HlX9CDNaQn0ah+4R2AJ8wU9V1YmJ5LGY+YY4RdpAxCc=;
 b=kdV7+rdOTNmiPODp9VtKU4EpsM+j0zHeqYPxjmux0otaOS7b/KLp9tNgpGGH2KjNhE
 o1nuHapdqGwdeIK7l7EzC76Krca+ooeFj/9WU2im5j1/SdHjGluDrkALqRqWu/c7To61
 SbCPhDmUc+mKUw2JuqgyJ+cTndnRdCZ8LNAaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=HlX9CDNaQn0ah+4R2AJ8wU9V1YmJ5LGY+YY4RdpAxCc=;
 b=B72ax1Nz3q6tWGaU3Xd18ygQS8VaLpgUmq2RoHDP+fEAA+OXoknbcAodOVXZ0OVJSk
 Bn8B1Km+hcFO5jg5juiEZJSFSkb42zFiJ9EAUEqSbUi0j3+VdOVJw5Pt30td+6lhvge5
 6SQywV8bTAsK9QJEJd/hQtiz5+0JQQzQ8CYxx3F2fsxKL5m66H+s4aEhJ7lLxGD3cT38
 nIKYlanxMq0DPSkQ+2mQ6advnzlJjheIdufYQdRKrhO2X6O5TL8Hz4JVmx0zijh+BW/F
 32q+7uxxjM2JGslPusoYZjKqWC7IVbT8532uXwegLA6IYzDtlMZwcM7IRO5uZKt5HHh6
 6ejg==
X-Gm-Message-State: AGi0PubpWCqp5TO5O1FUl+2Igv0c614FQxDUsCBTSmbvOLu/yxMLYFEN
 gFonL2hfAaMgYyDaAsExc40d4g==
X-Google-Smtp-Source: APiQypLp+msXrwjQeDf59CmGpFmh2wKSOzgAEen1QE4ESErJgzU2kye0C9MqIxLWezadPjOfFk67bw==
X-Received: by 2002:a1c:9dd1:: with SMTP id g200mr4976643wme.82.1587471403637; 
 Tue, 21 Apr 2020 05:16:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 91sm3728608wra.37.2020.04.21.05.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 05:16:43 -0700 (PDT)
Date: Tue, 21 Apr 2020 14:16:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v5 1/8] drm/fourcc: Add modifier definitions for
 describing Amlogic Video Framebuffer Compression
Message-ID: <20200421121641.GU3456981@phenom.ffwll.local>
Mail-Followup-To: Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-amlogic@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>
References: <20200416152500.29429-1-narmstrong@baylibre.com>
 <20200416152500.29429-2-narmstrong@baylibre.com>
 <20200417150729.GP3456981@phenom.ffwll.local>
 <65879a34-2e31-2908-3cc4-183f62c70ca0@baylibre.com>
 <CAKMK7uHXtcMFv6LpCEjTg5V-TXbkt2eLyitZoCfSc-nMnwJbuA@mail.gmail.com>
 <25f5ed14-2caf-6b2b-2cd4-3dbf0dd9a03c@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25f5ed14-2caf-6b2b-2cd4-3dbf0dd9a03c@baylibre.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_051646_204774_D5F61099 
X-CRM114-Status: GOOD (  13.96  )
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
Cc: Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-amlogic@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Apr 20, 2020 at 12:21:24PM +0200, Neil Armstrong wrote:
> On 17/04/2020 20:14, Daniel Vetter wrote:
> > On Fri, Apr 17, 2020 at 6:05 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> On 17/04/2020 17:07, Daniel Vetter wrote:
> 
> [...]
> 
> > 
> > Yup there's a number of parametried modifiers. As long as the stuff
> > you get from a DRM_FORMAT_MOD_ ... macro is a full modifier with
> > everything it should be all fine.
> 
> Would something like that be ok ?
> 
> #define __fourcc_mod_amlogic_layout_mask 0xf
> #define __fourcc_mod_amlogic_options_shift 8
> #define __fourcc_mod_amlogic_options_mask 0xf
> 
> #define DRM_FORMAT_MOD_AMLOGIC_FBC(__layout, __options) \
> 	fourcc_mod_code(AMLOGIC, \
> 			((__layout) & __fourcc_mod_amlogic_layout_mask) | \
> 			((options) & __fourcc_mod_amlogic_options_mask \
> 			 << __fourcc_mod_amlogic_options_shift))
> 
> /* Amlogic FBC Layouts */
> 
> /* bla */
> #define AMLOGIC_FBC_LAYOUT_BASIC		(1ULL)
> 
> /* bla */
> #define AMLOGIC_FBC_LAYOUT_SCATTER		(2ULL)
> 
> /* Amlogic FBC Layout Options Bit Mask */
> 
> /* bla */
> #define AMLOGIC_FBC_OPTION_MEM_SAVING		(1ULL << 0)

lgtm.
-Daniel

> 
> Neil
> 
> > -Daniel
> > 
> >> Neil
> >>
> >>> -Daniel
> >>>
> >>>> +
> >>>>  #if defined(__cplusplus)
> >>>>  }
> >>>>  #endif
> >>>> --
> >>>> 2.22.0
> >>>>
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
