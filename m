Return-Path: <SRS0=arCo=SG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A93B7C4360F
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 14:52:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71BAF2082E
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 14:52:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B1hWp3TA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=poorly.run header.i=@poorly.run header.b="DJsGveXc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71BAF2082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RTJWduh8CPzGPeYPd752nzddNkySt/xP2AJ0rsgCxUE=; b=B1hWp3TAxN4IC9
	AjwvCpsxxcKHg+sWirbmw6n52H7lSxSqosKmbGZ9OpzHwpHt/fPijDp2R1RAGuhhmxukLe73oIl3i
	gN0Y/UIji/qJiiLsm2dksSqmRcWxjRebLb5cpxwZXY21tNfrDnE4Fhibhq1o6+jaOI8io7X0l2zex
	ZbF+qBZyW4XfYsOPPuPMFgCNRA1Cl6J1yNArwuvrPcrfaX6Ip3o0GXRSQ9JNcZUU+r6PT881eiNWD
	9eN8fJHutd4i76YgEddfCnREA3HATGro9j5Xcuf7/jG3tWRywQ3XvFbf3JJHT7q+yBhSMdyYPzxW3
	QNxSLkDLmBlNFv6MrEig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hC3ip-0007JM-UB; Thu, 04 Apr 2019 14:52:07 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC3in-0007J0-6B
 for linux-amlogic@lists.infradead.org; Thu, 04 Apr 2019 14:52:06 +0000
Received: by mail-qt1-x841.google.com with SMTP id z17so3478803qts.13
 for <linux-amlogic@lists.infradead.org>; Thu, 04 Apr 2019 07:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=InJAUPygOFNLNyjqZpNbr6k2+i+f1+qkGPj3xxbuH/A=;
 b=DJsGveXcFTItFzq0MNrZW4ey1d9eZrf4VMtIeiyAjiCx6zdCeJia1xuAo061ITmWtw
 aZhmVdnA35B3sDXkJ2HKLQzj+hUIWTCQLxtH8bNbudpaShwW0k9YPLzL/Fbi4Dx4+ShM
 edGkcC3+qqHGiNdsMaun4kBz5y3YVDuiF1qj8YGcoVAnWDVhFP4GNTGbKfPWS676r+vD
 mH8/3YwJceiZJ0GWHn8IjijhWr86HXdaIj6IQC4ZdZpmJY4EVy2Igz2IrS3iv1yxU/SU
 jkZPS6r/CAXiGHIJXqbXE3Jzpi2adPLtdJXsKdC9HMwEyCEfL+7ZOnaoJmsOWZMMoRdA
 50og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=InJAUPygOFNLNyjqZpNbr6k2+i+f1+qkGPj3xxbuH/A=;
 b=pxTFYOnqbx5GUntPe0YB40uzbnRMfAKTnnzV1K0yMsZC1pP1yyX/l3cDETB6qff+ST
 Z+HXXALY53cPplHBFohZrmjkuZxV/9oclHsjBBZBpF3CpPCFdue6AwPHRWYWBaWeRzFb
 j2YlAnGc6hKsZJi3UUqI/dRD/eZefE1vgWUqldGeLGspvjRg5KrKI8Lt1IDBPRLG1FNS
 caDRQVzNDAh6M8JCvo6MhiwiyVZeYQUjIAncTdzsJ/fFBzojO26Nse3anCSYka/IdQUS
 TPaDxiZUTUjQJPtEvweEdyfV10l8NqfJ/YRrH8xU0yiObHsVduL/Usijnqg+GNOhbv+p
 eAPw==
X-Gm-Message-State: APjAAAUT95jFE8khmzjCqLWhyLH4mHzsqP/V3ig5YhW2cyFRV72XmhGa
 2UKYVFv9onEbIN3sufflaiA9LgyvIEU=
X-Google-Smtp-Source: APXvYqwZWADrTY6mLinp1iK2YGu8XUTPwO5g23NmxioeEbg2y3Nbf2d8RH2DJJc46h2298RNi8WThA==
X-Received: by 2002:a0c:81d4:: with SMTP id 20mr5305524qve.2.1554389524156;
 Thu, 04 Apr 2019 07:52:04 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id s64sm9779158qkc.39.2019.04.04.07.52.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 04 Apr 2019 07:52:03 -0700 (PDT)
Date: Thu, 4 Apr 2019 10:52:02 -0400
From: Sean Paul <sean@poorly.run>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] Revert "Documentation/gpu/meson: Remove link to
 meson_canvas.c"
Message-ID: <20190404145202.GC17077@art_vandelay>
References: <20190404144342.15238-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190404144342.15238-1-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_075205_232972_5460FD44 
X-CRM114-Status: GOOD (  13.47  )
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
Cc: maxime.ripard@bootlin.com, linux-amlogic@lists.infradead.org,
 sean@poorly.run, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Apr 04, 2019 at 04:43:42PM +0200, Neil Armstrong wrote:
> This reverts commit a3f98bb22cbfaaf67717e156f79e2bfeb42d4cac.
> 
> Patch "Documentation/gpu/meson: Remove link to meson_canvas.c" was
> incorrectly applied on the wrong branch not containing the fixed
> commit 2bf6b5b0e374 ("drm/meson: exclusively use the canvas provider module")
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Acked-by: Sean Paul <sean@poorly.run>

and I'll leave this for Maxime to apply if he so chooses.

Sean

> ---
>  Documentation/gpu/meson.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/gpu/meson.rst b/Documentation/gpu/meson.rst
> index b9e2f9aa3bd8..479f6f51a13b 100644
> --- a/Documentation/gpu/meson.rst
> +++ b/Documentation/gpu/meson.rst
> @@ -42,6 +42,12 @@ Video Encoder
>  .. kernel-doc:: drivers/gpu/drm/meson/meson_venc.c
>     :doc: Video Encoder
>  
> +Video Canvas Management
> +=======================
> +
> +.. kernel-doc:: drivers/gpu/drm/meson/meson_canvas.c
> +   :doc: Canvas
> +
>  Video Clocks
>  ============
>  
> -- 
> 2.21.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
