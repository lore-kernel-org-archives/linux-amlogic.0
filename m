Return-Path: <SRS0=88k6=SH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59160C4360F
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Apr 2019 11:43:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24C122186A
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Apr 2019 11:43:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y1e5vfe4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VEtENkkC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24C122186A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mRVrKUbGVd2d6+db0kStOvgCGIb6+iH0S1h6Vxx4cPI=; b=Y1e5vfe4CKHerT
	z34vZMieeXzB8ZgEhJaSsuzZUmBcQ+a2n34ryqeq7pBDhlYFDnLDwdSmNi/1qSCWF0qV0xHn7yCXN
	7RRhktcbg+tmrPvGDsCKBrGtoq4Giv9GIYW9a5+gBnQYEQK7MNUmXiipgOSYp1Y4m+wlte458av0G
	WnNXQYDm4HIojcBAMIJHmjNg6ubR9koD+YxBNPcXA6u7k94GQ22eEkZOxeo+/GU5xvPBvfQi2HjEN
	f2zFQStzl9EehoAmNqWhGpy4qAwS+hx7FL7FVcjKNR65JN7nAHVjwCWJuqDUa17nNipSHYULlAK+K
	DX8yrYejAF05pyc8VGqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCNG3-00016i-RS; Fri, 05 Apr 2019 11:43:43 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCNFu-0000y8-SE
 for linux-amlogic@lists.infradead.org; Fri, 05 Apr 2019 11:43:36 +0000
Received: by mail-wr1-x442.google.com with SMTP id k11so7622202wro.5
 for <linux-amlogic@lists.infradead.org>; Fri, 05 Apr 2019 04:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gpfxNDWzN/lDwOzvYsaszMMS2bWA067N9o6KMdno+Sg=;
 b=VEtENkkChRlawaWLGL0UktdTMqQvT6OIdAqkP1vVlh5CM+ixrKMGoJIJd3Tai3Vzn2
 ijrv5I/k+JzIyztt3GpNXlhq+XRFdfDNqrF3MnzZn+f1aZhMvRTZDVKQ3HQ9zuCs734W
 4rFzXzw7jM6qc0obHbli+/rDVbeym7gpZNCxiAIboEXeV/gjvkppGczGiLX7prNr5JlD
 mGKlhn2vzzf00B9kKfvzHivnT5yRNMkmbcfdTDPhOkjaF759XUaUArY7A32yXwcQb5Hr
 jub2Qx5YKDUxga4/UfHhMmeV7JRTx/sEm6vGGVP2IfqjHCyKAk0QywbaGT5yd9TNZQgO
 b60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gpfxNDWzN/lDwOzvYsaszMMS2bWA067N9o6KMdno+Sg=;
 b=dFMN5eLMdnQGqrL6k63G+URQvExdRHHjAkAN8Eauz0+x1P7yoILi2V2POeSoQYSKfe
 XA8mUw+GuFcbO+jaRZgnvnGfns4pxtgipw8fhE7BSC5cINlCdGrsXUOfBKul3yf/TWJZ
 ZS6LpqNpMmr3p7BK0rvkVVz+FtlDWjuIrRsvpDGpbBqrmtg7G5dXFMDkWM6w21Ff0XTv
 lV5bmLPhZD6gkpp8I9A+e+IJ1CPM1pjFOVYS2OraeS9l22mQGOfJXhq92ugAPD1PCmFM
 htq6Y2JNCG6q0QR/VVuOQ8h8xL0pczXjSMILlz1rBLlrKepagG6orp6hIgjk5M4oqSZo
 lC2A==
X-Gm-Message-State: APjAAAW0trGcc/41Pa0S6GL4xtdVmtJufHgalJUDb1Z9IJ8KQ2Ab9ryD
 d+oRWu8bcI79hFl++7v+OLhoYMd9pbtkCmV6mxUm7Q==
X-Google-Smtp-Source: APXvYqxNhn/S888Oagmx6upP9dvFkew+zCKkT/hl+Jj/FWTLJNOGsjms5kXSveGWQFKaTn6E/NMw4uXDVNDmyzFNjrM=
X-Received: by 2002:adf:e9c1:: with SMTP id l1mr8021048wrn.270.1554464612316; 
 Fri, 05 Apr 2019 04:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190403205652.183496-1-sean@poorly.run>
In-Reply-To: <20190403205652.183496-1-sean@poorly.run>
From: Maxime Jourdan <mjourdan@baylibre.com>
Date: Fri, 5 Apr 2019 13:43:21 +0200
Message-ID: <CAMO6nax7zzzgAzh=F+JTSb6+KxZrOGZAX-t2G8JbyRBubDk6fw@mail.gmail.com>
Subject: Re: [PATCH] Documentation/gpu/meson: Remove link to meson_canvas.c
To: Sean Paul <sean@poorly.run>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_044334_908841_A8791A17 
X-CRM114-Status: GOOD (  13.72  )
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
Cc: linux-doc@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Sean,
On Wed, Apr 3, 2019 at 10:56 PM Sean Paul <sean@poorly.run> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> The file was removed in the below patch and is causing this error:
> WARNING: kernel-doc '../scripts/kernel-doc -rst -enable-lineno -function Canvas ../drivers/gpu/drm/meson/meson_canvas.c' failed with return code
>
> Fixes: 2bf6b5b0e374 ("drm/meson: exclusively use the canvas provider module")
> Cc: Maxime Jourdan <mjourdan@baylibre.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  Documentation/gpu/meson.rst | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/Documentation/gpu/meson.rst b/Documentation/gpu/meson.rst
> index 479f6f51a13b..b9e2f9aa3bd8 100644
> --- a/Documentation/gpu/meson.rst
> +++ b/Documentation/gpu/meson.rst
> @@ -42,12 +42,6 @@ Video Encoder
>  .. kernel-doc:: drivers/gpu/drm/meson/meson_venc.c
>     :doc: Video Encoder
>
> -Video Canvas Management
> -=======================
> -
> -.. kernel-doc:: drivers/gpu/drm/meson/meson_canvas.c
> -   :doc: Canvas
> -
>  Video Clocks
>  ============
>
> --
> Sean Paul, Software Engineer, Google / Chromium OS
>

Thanks for the patch, I missed that completely!

Maxime

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
