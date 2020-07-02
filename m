Return-Path: <SRS0=naQK=AN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57B9C433DF
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2020 13:18:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73DC320772
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2020 13:18:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DRkg+dJ2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="eGu8Bzdj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73DC320772
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/GwYDexc19YQsfZ/XpBg01TB67G7Vsa48J34bgkowDI=; b=DRkg+dJ2Utduasajdp5G9QbvZ
	xv1uiEfRzlRWurJoYtFBv5yQi4sA2TgIhotqV386qSgl83RaIu7Ae7pX/EkDORxzaCk1VQzE0gl10
	wxT4j46Cjc0h5gh/pfvr7PnPAtZrjGKXsTKMHvlEUgmMVRO2nGnOZQUZ09bVrjYN7Fb+tFKf8XxE0
	BzQ37b9ry7+MkOpiTtIfGdXCWw2XJVrmU2okLuwmmjssawtsPACuVlevNTgSRCwKhH5til0Q8RqLk
	0nCnSvQfAJphmQ7uEnek0b4WkZj7DQ5TZpqJ8MrFC9tT7j/etk9V7wwjq4t/5Nvj7XGMmjRYjZhG5
	wZAOzzuDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqz6x-0003UH-6U; Thu, 02 Jul 2020 13:18:43 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqz6u-0003Sl-5J
 for linux-amlogic@lists.infradead.org; Thu, 02 Jul 2020 13:18:41 +0000
Received: by mail-wm1-x344.google.com with SMTP id q15so26747194wmj.2
 for <linux-amlogic@lists.infradead.org>; Thu, 02 Jul 2020 06:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Cuvm4PH9ymZejClh9/IRJruxX3XybrluMfPe5pcP0ik=;
 b=eGu8Bzdjv2Xqb78qCTzwgtJgVA38HsDO3DGT9ZmJH3Q+H8c4RcNNutL98+WSuTQbu9
 KEsOqEyXvy5AJTLhH7zsr6WVXJ/2xkTTcxjU/AKDadOCUJ+MfKid0+RVbgqG9/2wBZ0l
 4Cy9lOPEBPLmQ33W40GnOmEgKAZ8Mt8Y5cXII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Cuvm4PH9ymZejClh9/IRJruxX3XybrluMfPe5pcP0ik=;
 b=o6IYSKdgk2uvZRiXjDqemO3hWvrsrhDxNsaSh74iDfxEltVacmyZQbJlRDMaIxlcHR
 x+PLP6iGHdxoxc+2Pn1ekHdYXknS7MuvDSNAjO8w4jTPNWKhgl1VdgJxRDzEjwBTPh7W
 sTOG2x+WWGM03SrfyZOFrbrKtqNx1pnSYR5EeGooiwJgousJF+div4zQG7NIB0lMSbn0
 mtkdUHQ7tpHqXOGHD7rXpJpjmwjOHU4/5Elq+KJPF1Hwy+d0eeC24MdgRSQryBGS8LnY
 931/0d/cMHaTF6sC0F/eI4BHuJIvHLxpzu0JyPl4mmhqWjVqoGLq0RCPecuEyVkEzjEr
 Tjag==
X-Gm-Message-State: AOAM532fFMr4gml1nPwevHWBTImrpn6nWOLz5IdAVNbxjS5jWryrCTCV
 s5HdUbd4H2G1GGtVHDuFFtwKhg==
X-Google-Smtp-Source: ABdhPJws7m0llQgCQ3WJpZXwOAgYwXtJKDNub/jxlHaBemJ1pVcESAzqOIr1Y2qhVoHzQpn8e5986g==
X-Received: by 2002:a1c:2183:: with SMTP id h125mr33648435wmh.83.1593695917752; 
 Thu, 02 Jul 2020 06:18:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v5sm10646766wre.87.2020.07.02.06.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 06:18:36 -0700 (PDT)
Date: Thu, 2 Jul 2020 15:18:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v8 1/6] drm/fourcc: Add modifier definitions for
 describing Amlogic Video Framebuffer Compression
Message-ID: <20200702131834.GZ3278063@phenom.ffwll.local>
Mail-Followup-To: Simon Ser <contact@emersion.fr>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jianxin.pan@amlogic.com" <jianxin.pan@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20200702074759.32356-1-narmstrong@baylibre.com>
 <20200702074759.32356-2-narmstrong@baylibre.com>
 <8cBfZpkc4pHBLhihlvJMD_Hq1DEsNRcSY4Y8JaGwklMWcxiYzUMVEx7wH9f_DuCBMVUhXvOR0PcHVslILtKI2wdw79Nfih0N3VnrxfMQd08=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8cBfZpkc4pHBLhihlvJMD_Hq1DEsNRcSY4Y8JaGwklMWcxiYzUMVEx7wH9f_DuCBMVUhXvOR0PcHVslILtKI2wdw79Nfih0N3VnrxfMQd08=@emersion.fr>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_091840_227312_88423A15 
X-CRM114-Status: GOOD (  12.49  )
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
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Jul 02, 2020 at 09:23:11AM +0000, Simon Ser wrote:
> On Thursday, July 2, 2020 9:47 AM, Neil Armstrong <narmstrong@baylibre.com> wrote:
> 
> > Finally is also adds the Scatter Memory layout, meaning the header contains IOMMU
> > references to the compressed frames content to optimize memory access
> > and layout.
> >
> > In this mode, only the header memory address is needed, thus the content
> > memory organization is tied to the current producer execution and cannot
> > be saved/dumped neither transferrable between Amlogic SoCs supporting this
> > modifier.
> 
> Still not sure how to handle this one, since this breaks fundamental
> assumptions about modifiers.

I wonder whether we should require special allocations for these, and then
just outright reject mmap on these buffers. mmap on dma-buf isn't a
required feature.

That would make sure that userspace cannot look at them.

Also I'm kinda suspecting that there's not unlimited amounts of this magic
invisible storage available anyway.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
