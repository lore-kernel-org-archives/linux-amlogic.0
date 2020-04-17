Return-Path: <SRS0=ZPw0=6B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F35C2D0EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 18:14:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63B5A206F9
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 18:14:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TAqUk0eN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="VITfARv4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63B5A206F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NeRAhP8dHvwNIeT9iuZ0BbTT2kJZpwrh9VfEymZgafk=; b=TAqUk0eNg4VnDS
	sVUegd7dl54n9geP8wEtxukLjMUCvHDArSSqIFTH7c+YYFM/zAO0FWYz1irkoa4RRqWEi74LBvRyV
	xIEs6m49M4CrHCNWf/6gbJ+crxWD1HtG1YUDi0GzJpQx1W+n6kLUjl9OMOvXLomc6Mr9ctoF3XLtE
	bO6ttnDOkkDRknxw9dr84eJiIsMX9Gku6eCzGTDndqGD9p7CItjB43fafQQqqrWo79Jg5/9fH+BPS
	Bf5SqqbbLOb0PxzFyr6yqERYTDvAenxaYH0PyZk16/pS74QD+Spvg6b/QZsHNrTvubSPA9SNA+yzt
	g9dpZgzz2ufHgokROEjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPVVr-0004EL-HU; Fri, 17 Apr 2020 18:14:51 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPVVd-00041y-9A
 for linux-amlogic@lists.infradead.org; Fri, 17 Apr 2020 18:14:38 +0000
Received: by mail-oi1-x243.google.com with SMTP id o7so1095989oif.2
 for <linux-amlogic@lists.infradead.org>; Fri, 17 Apr 2020 11:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8ZtGqnHCQ07/Ew2aP7iD3NcrezbX+AN+GwFRXoG4Q1s=;
 b=VITfARv4/usebH48Hls8WBXhMUQ4Gj5ghaLuDkZLWDvu69+TtDM4myloJYEz7HGLG+
 ctiSRBGjjHoQpLHe9ktSiWjtor4yQjJF8PlYuOTPZPpBh/G/DtZ2VrpUjQNhn4mcSqku
 gJpuiLS0Y/WtCI7eT8UESFjBUlyfLMPIUWc9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8ZtGqnHCQ07/Ew2aP7iD3NcrezbX+AN+GwFRXoG4Q1s=;
 b=L9M16CFy0loswKyPHmQdvlk7WxeD8+eoNrO2FQtuBh4/aa+BUp5oBq+M/H9iRkGnAh
 F60fTvtt6sQaocTac0zaeKWOBzeVP76qTFdYFSyWD6kDBOn/F/xRkmpLwfcfS+UtIsoZ
 amaKnoHF7z3DYHUZSIVq1QY2CDmhVqmtbw3pCq1Xja7nOq6S1T4WHv3UbhEkFHchSdOg
 lrHZ1bOQNGphR5I5Qd86DkxQ1HArMg7IRs2FmgwA9kLNj3hQ9m1Rn5otrAttOBKx9VaD
 ix/rTGm3XPkcaLLqZhNKewsqfW6IID1bfeQcovDTJ1Asb80MTLOYw6jAO1H5QRiNQbgt
 olIA==
X-Gm-Message-State: AGi0PuaC7CD/b13kHppqJhABhmj9sBC9FDGU0UdceSkIS59FiOYGnVn1
 T0NY8npn1PbuOMKg+qKzK2QTZ18uBvzilIbdJyh6nQ==
X-Google-Smtp-Source: APiQypL0F757LauIcBY+JcZyLMy1N/8zxDWB1hXSGdCXb1RXCdnwO8/JVGdpn2VXZvyWPj7TygkZGcDnOVapsu7/az8=
X-Received: by 2002:aca:4408:: with SMTP id r8mr3135520oia.14.1587147275820;
 Fri, 17 Apr 2020 11:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200416152500.29429-1-narmstrong@baylibre.com>
 <20200416152500.29429-2-narmstrong@baylibre.com>
 <20200417150729.GP3456981@phenom.ffwll.local>
 <65879a34-2e31-2908-3cc4-183f62c70ca0@baylibre.com>
In-Reply-To: <65879a34-2e31-2908-3cc4-183f62c70ca0@baylibre.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 17 Apr 2020 20:14:24 +0200
Message-ID: <CAKMK7uHXtcMFv6LpCEjTg5V-TXbkt2eLyitZoCfSc-nMnwJbuA@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] drm/fourcc: Add modifier definitions for
 describing Amlogic Video Framebuffer Compression
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_111437_323644_CC493041 
X-CRM114-Status: GOOD (  22.72  )
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
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Apr 17, 2020 at 6:05 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 17/04/2020 17:07, Daniel Vetter wrote:
> > On Thu, Apr 16, 2020 at 05:24:53PM +0200, Neil Armstrong wrote:
> >> Amlogic uses a proprietary lossless image compression protocol and format
> >> for their hardware video codec accelerators, either video decoders or
> >> video input encoders.
> >>
> >> It considerably reduces memory bandwidth while writing and reading
> >> frames in memory.
> >>
> >> The underlying storage is considered to be 3 components, 8bit or 10-bit
> >> per component, YCbCr 420, single plane :
> >> - DRM_FORMAT_YUV420_8BIT
> >> - DRM_FORMAT_YUV420_10BIT
> >>
> >> This modifier will be notably added to DMA-BUF frames imported from the V4L2
> >> Amlogic VDEC decoder.
> >>
> >> This introduces the basic layout composed of:
> >> - a body content organized in 64x32 superblocks with 4096 bytes per
> >>   superblock in default mode.
> >> - a 32 bytes per 128x64 header block
> >>
> >> This layout is tranferrable between Amlogic SoCs supporting this modifier.
> >>
> >> Tested-by: Kevin Hilman <khilman@baylibre.com>
> >> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> >> ---
> >>  include/uapi/drm/drm_fourcc.h | 39 +++++++++++++++++++++++++++++++++++
> >>  1 file changed, 39 insertions(+)
> >>
> >> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> >> index 8bc0b31597d8..a1b163a5641f 100644
> >> --- a/include/uapi/drm/drm_fourcc.h
> >> +++ b/include/uapi/drm/drm_fourcc.h
> >> @@ -309,6 +309,7 @@ extern "C" {
> >>  #define DRM_FORMAT_MOD_VENDOR_BROADCOM 0x07
> >>  #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
> >>  #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
> >> +#define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
> >>
> >>  /* add more to the end as needed */
> >>
> >> @@ -804,6 +805,44 @@ extern "C" {
> >>   */
> >>  #define DRM_FORMAT_MOD_ALLWINNER_TILED fourcc_mod_code(ALLWINNER, 1)
> >>
> >> +/*
> >> + * Amlogic Video Framebuffer Compression modifiers
> >> + *
> >> + * Amlogic uses a proprietary lossless image compression protocol and format
> >> + * for their hardware video codec accelerators, either video decoders or
> >> + * video input encoders.
> >> + *
> >> + * It considerably reduces memory bandwidth while writing and reading
> >> + * frames in memory.
> >> + *
> >> + * The underlying storage is considered to be 3 components, 8bit or 10-bit
> >> + * per component YCbCr 420, single plane :
> >> + * - DRM_FORMAT_YUV420_8BIT
> >> + * - DRM_FORMAT_YUV420_10BIT
> >> + *
> >> + * The first 8 bits of the mode defines the layout, then the following 8 bits
> >> + * defines the options changing the layout.
> >
> > None of the modifiers you're doing seem to have these other 8 bits
> > defined anywhere. And it's not encoded in your modifiers. Can't we just
> > enumerate the ones we have/need and done?
>
> It's introduced in patch 5

Hm must have been blind, I overlooked the << 8 shift. I'd just do a
macro which encoders all fields into the modifier, instead of
hand-rolling this.

> >
> >> + *
> >> + * Not all combinations are valid, and different SoCs may support different
> >> + * combinations of layout and options.
> >> + */
> >> +#define DRM_FORMAT_MOD_AMLOGIC_FBC(__modes) fourcc_mod_code(AMLOGIC, __modes)
> >> +
> >> +/* Amlogic FBC Layouts */
> >> +#define DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_MASK              (0xf << 0)
> >> +
> >> +/*
> >> + * Amlogic FBC Basic Layout
> >> + *
> >> + * The basic layout is composed of:
> >> + * - a body content organized in 64x32 superblocks with 4096 bytes per
> >> + *   superblock in default mode.
> >> + * - a 32 bytes per 128x64 header block
> >> + *
> >> + * This layout is transferrable between Amlogic SoCs supporting this modifier.
> >> + */
> >> +#define DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC             (1ULL << 0)
> >
> > This is kinda confusing, since this isn't actually the modifier, but the
> > mode of the modifer. Generally what we do is only define the former, with
> > maybe some macros to extract stuff.
> >
> > To make this more mistake-proof I'd only define the full modifier code.
> > Definitely don't add a #define with the DRM_FORMAT_MOD_ prefix which isn't
> > actually a full modifier code.
>
> Exact, I'll use the same scheme as AFBC: AMLOGIC_FBC_FORMAT_ ...

Yup there's a number of parametried modifiers. As long as the stuff
you get from a DRM_FORMAT_MOD_ ... macro is a full modifier with
everything it should be all fine.
-Daniel

> Neil
>
> > -Daniel
> >
> >> +
> >>  #if defined(__cplusplus)
> >>  }
> >>  #endif
> >> --
> >> 2.22.0
> >>
> >
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
