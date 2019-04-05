Return-Path: <SRS0=88k6=SH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DABCEC4360F
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Apr 2019 12:57:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AADCB218AC
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Apr 2019 12:57:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="REBhFiom";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=poorly.run header.i=@poorly.run header.b="DJvQ6R6o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AADCB218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sGElkawZd2MAeXdmxKR2pXWCQe7OjEJMpEnSPpQiUPU=; b=REBhFiomhAq8cZ
	pZLeMUFLifWW+OPK2l+wE3HVaZPHalb3C5OPrVMG1aAyViuaNb87BtGsstohMQv3F7d8JtFCtOJc0
	x+YrhVNqLWvlwePXomh71fkl3onDfSAv7hoX0J7TIf8wEjX8hEzRg971cVl8uDZMVnMdHmlFV3N9R
	ROeFpOFzlh5WCvCmUlwSuNh0mGGNAw3VfCMaWd9HQ3Rz9AB++LxVKUkShHS6AoMEeJ15lWZ+bW8FV
	VuqemKRt6cPzoL8rlnSKK9PQM/cEXe9cofFhGTfHI+dzA4RcQdpfW/M2cAIECoCgoEG/7MbQyrbaF
	R8rC7Rn8z6pybsRkb9/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCOPY-0006Lu-D1; Fri, 05 Apr 2019 12:57:36 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCOPO-0006AA-I6
 for linux-amlogic@lists.infradead.org; Fri, 05 Apr 2019 12:57:28 +0000
Received: by mail-qt1-x843.google.com with SMTP id z16so7215414qtn.4
 for <linux-amlogic@lists.infradead.org>; Fri, 05 Apr 2019 05:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ewPOYsoLdshTz0QFbHBekjbAvAUxAVDFfTNkCeNZ35E=;
 b=DJvQ6R6o7Kw7oyxChXdtwbj1S4jH+15wxMUIKr3qiwvtMv7eowNWk7awAH3ByEnw3j
 ezi653XIxO8/Pf94L17poMYis2IuobgOySIRaSwKjnhQf/5teSx7hCFFQiHEDcE+miKH
 lbRDlm3I+ncirNPCt8yp48jyqI9ZQ7kRHG8OvLhLFI9hiwZLw867rPTbPIO2HMDIYWCD
 qruhozNo2V0ZsuAjBfOpWDGSX9sVvXQrGXOvKB2lTApj3UMbvKpSNvO2uyU9/nImEnqe
 bMzV7kHR4QSGSV9UMyM9rs7IHrmqKxPc6yqzfs7Yv40w6jfO0CZmsEX5EbUeXE8dKXyh
 Df8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ewPOYsoLdshTz0QFbHBekjbAvAUxAVDFfTNkCeNZ35E=;
 b=n2YSVLnp4xWdhgAiNrv6qrABwvCaYas8TnC4f8rkW7RG+Bb4UYfx1W47NwWURq3j/o
 pgYyHjPC1HMWIpLueq8dI8ZIQcejF+pDVHibeZPd0MsNq+GFZ1oCwrMGxVBgnlk/rseA
 rDpWhSxiDvNDv/bpvTlacz49ACB9z7s2SjVed8plHzc0yUbCtGN9zpW/Z+ERAlN+hhWQ
 xLWBKsF0bmpVKUZUejEj+seLgped1/+rrQSv2vxPzvoKcvDyQWEXxoZ0A5wqNv9O37Rb
 /bQMUemzdz5lPXWWjOAwQx3j7bZWZRXkY+fbXh5X1GQvLMruooTOuKGeFDlJ76vvHzGW
 BanQ==
X-Gm-Message-State: APjAAAU/64VB668skpSH+iZfeFibumNm/3TP+gKX1JNjW0jcTKI9tlvR
 B0ou3Hlp9gMnH3qu4MBZHIQvug==
X-Google-Smtp-Source: APXvYqyvrPBZL6zGiH8gNAISAQzWcD2nioJWG6K8Ba4+uCaao35YAFOF2X0cx/Dn1VOE3NE8kAYxnw==
X-Received: by 2002:a0c:89a3:: with SMTP id 32mr9939868qvr.116.1554469044648; 
 Fri, 05 Apr 2019 05:57:24 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id 11sm15697549qtu.5.2019.04.05.05.57.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 05 Apr 2019 05:57:23 -0700 (PDT)
Date: Fri, 5 Apr 2019 08:57:23 -0400
From: Sean Paul <sean@poorly.run>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] Documentation/gpu/meson: Remove link to meson_canvas.c
Message-ID: <20190405125723.GD17077@art_vandelay>
References: <20190403205652.183496-1-sean@poorly.run>
 <2afc7c09-a6e4-5191-d7e3-7a3a75451aab@baylibre.com>
 <de19dd7b-40dd-408b-a024-53036dedf7c3@baylibre.com>
 <20190404143125.GB17077@art_vandelay>
 <0897093a-246b-211b-bddf-6d87877b429c@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0897093a-246b-211b-bddf-6d87877b429c@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_055726_650898_0C137599 
X-CRM114-Status: GOOD (  16.22  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Maxime Jourdan <mjourdan@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>,
 linux-doc@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-amlogic@lists.infradead.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Apr 05, 2019 at 02:14:35PM +0200, Neil Armstrong wrote:
> On 04/04/2019 16:31, Sean Paul wrote:
> > On Thu, Apr 04, 2019 at 10:28:29AM +0200, Neil Armstrong wrote:
> >> On 04/04/2019 08:56, Neil Armstrong wrote:
> >>> On 03/04/2019 22:56, Sean Paul wrote:
> >>>> From: Sean Paul <seanpaul@chromium.org>
> >>>>
> >>>> The file was removed in the below patch and is causing this error:
> >>>> WARNING: kernel-doc '../scripts/kernel-doc -rst -enable-lineno -function Canvas ../drivers/gpu/drm/meson/meson_canvas.c' failed with return code
> >>>>
> >>>> Fixes: 2bf6b5b0e374 ("drm/meson: exclusively use the canvas provider module")
> >>>> Cc: Maxime Jourdan <mjourdan@baylibre.com>
> >>>> Cc: Neil Armstrong <narmstrong@baylibre.com>
> >>>> Cc: Kevin Hilman <khilman@baylibre.com>
> >>>> Cc: dri-devel@lists.freedesktop.org
> >>>> Cc: linux-amlogic@lists.infradead.org
> >>>> Cc: linux-arm-kernel@lists.infradead.org
> >>>> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> >>>> ---
> >>>>  Documentation/gpu/meson.rst | 6 ------
> >>>>  1 file changed, 6 deletions(-)
> >>>>
> >>>> diff --git a/Documentation/gpu/meson.rst b/Documentation/gpu/meson.rst
> >>>> index 479f6f51a13b..b9e2f9aa3bd8 100644
> >>>> --- a/Documentation/gpu/meson.rst
> >>>> +++ b/Documentation/gpu/meson.rst
> >>>> @@ -42,12 +42,6 @@ Video Encoder
> >>>>  .. kernel-doc:: drivers/gpu/drm/meson/meson_venc.c
> >>>>     :doc: Video Encoder
> >>>>  
> >>>> -Video Canvas Management
> >>>> -=======================
> >>>> -
> >>>> -.. kernel-doc:: drivers/gpu/drm/meson/meson_canvas.c
> >>>> -   :doc: Canvas
> >>>> -
> >>>>  Video Clocks
> >>>>  ============
> >>>>  
> >>>>
> >>>
> >>> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> >>>
> >>
> >> Applied to drm-misc-fixes
> > 
> > Hmm, the commit referenced in the Fixes line hasn't landed in -fixes yet, it's
> > in -next. So the fix has landed before the bug :(
> 
> Seems I'll still need to apply it to -next !

I've just applied it, thanks for staying on top of this.

Sean

> 
> Neil
> 
> > 
> > I'll ping mripard on irc and see what he wants to do about this.
> > 
> > Sean
> > 
> >>
> >> Neil
> > 
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
