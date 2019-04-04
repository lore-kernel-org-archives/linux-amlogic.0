Return-Path: <SRS0=arCo=SG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B69C4360F
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 14:31:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C453320855
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 14:31:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p/ooAB7y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=poorly.run header.i=@poorly.run header.b="WgCmtclK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C453320855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CudqksBeRhAyiEMM7WFORvTYLHY1I1+AyjwPZQt3xzE=; b=p/ooAB7yQkn2LC
	oK8LVdepLyu1xZhRhcFXgzqLuk9+CBqF5zjE38srBU/NzEhi82U+52PFPS86h0Riqgy8hevoEi1dB
	Rc8cdVe/eKe5+wUoRGRMSnPFYR548dNUKIG4BDUNyGvAFoacLApwG2WdQ1s3btr3bajfWFNjwzN7b
	pqmk2H3x+vPqxb9Uo+b/ZNd18Pn7ZwWn3XEdZ2CyTjKGZC4mkz4ELNKkzvlCMdYDwWlrQNSNzy12H
	9sbVSV8Ylh2jhDW5pdgtwKaTzenNb4Tf/QUNTSwb9FCp1ooffPaYJ9RS6lejhW4rAcVO9fBC3Muoe
	E9025ENpjIPVJQtp4zKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hC3Oy-00019n-J4; Thu, 04 Apr 2019 14:31:36 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC3Oq-00011x-37
 for linux-amlogic@lists.infradead.org; Thu, 04 Apr 2019 14:31:29 +0000
Received: by mail-qk1-x743.google.com with SMTP id c20so1730859qkc.10
 for <linux-amlogic@lists.infradead.org>; Thu, 04 Apr 2019 07:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KLVCm6kIAoTWLgTBe6hlSrtymFpM3bNla2XomwKlVlU=;
 b=WgCmtclKttywXWSDCWjPpURto5mfng++8tzwpsM6R2jQNxjcQl6oipQh0kao44k+w/
 7ScqvFw86j9t8MbvdoxgzLJ+99OgVGYbvoKTu8yFp/S0WmnCp6EOORgB/Yq3PldT4F8I
 LeHqx9xzzGvLvZV3jZ8yrcDgfikppSwtx//pm/BxAHgDbnir1EUWuzpZvCOBUNkdRnd/
 bFEqfhAkszjZdeedNOaTlQEZor77kAEJ1ZeRSZzBoloYidCXsQi1kqYKT1SWgNk1ohdD
 ETWKlcdMgFiS+iBHxZdNUSzIK39d8erKOOQ5t+9dvuwoIpZLjLV4DVWH3Rp3+r8H2/wl
 A/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KLVCm6kIAoTWLgTBe6hlSrtymFpM3bNla2XomwKlVlU=;
 b=Agqg+Z2O6bi15M0K1quhocKybP3/nVeAO4okIqQzU9j/ajgzgiVQtaROwQgHK5ks8H
 7lqJi85bjsN6VuPtyBSFbY8L3+cHFJSUdm79fgfvzSZ4V3rdH62NK8i6g19jbAQORZI+
 3tAYMuCq0pDPVLyCCIq7ytq4N6Jlw1HwINsPCwEbF36eW5wO7sM4Ld2BLDBzawsu0kuQ
 1VAqGvuULmtJh3mcFdJUiz8c83wk76elX0wX/mLPIezQXsn++IfQOFuUyU7qQ9ZpmrdB
 HwCcypwRHw9VZ9Yy+Q7GBi5cigoaY2XlT/nfInpvEzdNPC9JCVdEy9/KC8W06j91lFK8
 sfRQ==
X-Gm-Message-State: APjAAAUf6Xtn3xjwGMR33limNYn++k7404qIqb+1F+wAUcJ70gCwd3ja
 +9sVW+115XTFp0fXZRu0ucg71Q==
X-Google-Smtp-Source: APXvYqy8KZuCsaAN8F+ksKVej12iWMV74pdlf9w93Ybh37/pZDk0uq7iR3Ttsin1ASj87N8UJHm0+w==
X-Received: by 2002:a37:b4c:: with SMTP id 73mr5321954qkl.250.1554388286788;
 Thu, 04 Apr 2019 07:31:26 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id p6sm12604667qtk.70.2019.04.04.07.31.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 04 Apr 2019 07:31:26 -0700 (PDT)
Date: Thu, 4 Apr 2019 10:31:25 -0400
From: Sean Paul <sean@poorly.run>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] Documentation/gpu/meson: Remove link to meson_canvas.c
Message-ID: <20190404143125.GB17077@art_vandelay>
References: <20190403205652.183496-1-sean@poorly.run>
 <2afc7c09-a6e4-5191-d7e3-7a3a75451aab@baylibre.com>
 <de19dd7b-40dd-408b-a024-53036dedf7c3@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <de19dd7b-40dd-408b-a024-53036dedf7c3@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_073128_189315_40DA40F7 
X-CRM114-Status: GOOD (  15.42  )
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

On Thu, Apr 04, 2019 at 10:28:29AM +0200, Neil Armstrong wrote:
> On 04/04/2019 08:56, Neil Armstrong wrote:
> > On 03/04/2019 22:56, Sean Paul wrote:
> >> From: Sean Paul <seanpaul@chromium.org>
> >>
> >> The file was removed in the below patch and is causing this error:
> >> WARNING: kernel-doc '../scripts/kernel-doc -rst -enable-lineno -function Canvas ../drivers/gpu/drm/meson/meson_canvas.c' failed with return code
> >>
> >> Fixes: 2bf6b5b0e374 ("drm/meson: exclusively use the canvas provider module")
> >> Cc: Maxime Jourdan <mjourdan@baylibre.com>
> >> Cc: Neil Armstrong <narmstrong@baylibre.com>
> >> Cc: Kevin Hilman <khilman@baylibre.com>
> >> Cc: dri-devel@lists.freedesktop.org
> >> Cc: linux-amlogic@lists.infradead.org
> >> Cc: linux-arm-kernel@lists.infradead.org
> >> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> >> ---
> >>  Documentation/gpu/meson.rst | 6 ------
> >>  1 file changed, 6 deletions(-)
> >>
> >> diff --git a/Documentation/gpu/meson.rst b/Documentation/gpu/meson.rst
> >> index 479f6f51a13b..b9e2f9aa3bd8 100644
> >> --- a/Documentation/gpu/meson.rst
> >> +++ b/Documentation/gpu/meson.rst
> >> @@ -42,12 +42,6 @@ Video Encoder
> >>  .. kernel-doc:: drivers/gpu/drm/meson/meson_venc.c
> >>     :doc: Video Encoder
> >>  
> >> -Video Canvas Management
> >> -=======================
> >> -
> >> -.. kernel-doc:: drivers/gpu/drm/meson/meson_canvas.c
> >> -   :doc: Canvas
> >> -
> >>  Video Clocks
> >>  ============
> >>  
> >>
> > 
> > Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> > 
> 
> Applied to drm-misc-fixes

Hmm, the commit referenced in the Fixes line hasn't landed in -fixes yet, it's
in -next. So the fix has landed before the bug :(

I'll ping mripard on irc and see what he wants to do about this.

Sean

> 
> Neil

-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
