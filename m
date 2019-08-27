Return-Path: <SRS0=C9TS=WX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16DC8C3A5A3
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 16:44:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD6BE21881
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 16:44:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FsIyoEmd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Fzqv4nQ+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD6BE21881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MikiU0Pz4bO8FqI2iuVlYK9p2v0kEKpPhfZugYyt9gE=; b=FsIyoEmdT2lrCB
	Mbuju9LT0lwA+Wdt4+M0+4dSul1jrv7lTCs9Bn85F6MK/Qi/4q52s9jJJGay0zWu/eoO21L45qszi
	BFNeSo5P1HCKZlGbR9lRVuJicMlyOjJqzEGrLdG33h+1GVFmUaXNaesaoo+EyINlxx9JuUPseasPp
	9XY47sQmdMe8aLTx24gUWSw57BrEd11Cezrwh4MnVgu3u/B2sgMaAdAECEhKBzJW4owZI32FBaRP2
	ryt/JcmW6A99sqCVpWQOjQWJ5U9qAR4qJ4ueiA7M5jazK6ZvGqz5PjYvv7BU/r3nO9FFVQwTFURwc
	OdD9+XNiDGCXS9O6Rsrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2ea2-0008IS-EW; Tue, 27 Aug 2019 16:44:26 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2eZs-00087P-4i
 for linux-amlogic@lists.infradead.org; Tue, 27 Aug 2019 16:44:18 +0000
Received: by mail-ed1-x542.google.com with SMTP id r12so32223180edo.5
 for <linux-amlogic@lists.infradead.org>; Tue, 27 Aug 2019 09:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=T4/dJTACRgyspP6PQrEfl3SMkEU0BRTMNnpAOcNAN9k=;
 b=Fzqv4nQ+umzv/2+KsGP2IW6/1O7DBQCIYC2HmBh/Ixkm0qxY1XpDuoKgz+tncImxs7
 N7m7N3ReqRn0EeNNxHDIVftSZ9fXBGgZpadIxuWhZwJwT9VgxqDJeUZWp8QGR+pDw7jL
 MrGOVuuTzL+18NS2EevgZPTFpC6D+ugKy/n7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=T4/dJTACRgyspP6PQrEfl3SMkEU0BRTMNnpAOcNAN9k=;
 b=YZPIzmcSR1uV9OT18wXX4VYb/nHLwvAUY3qbd729weOx/Jg453mQ92622ndHZvf3HN
 cfZ0LnHq3JuU+5KXTElH10uNyyqtD3AuUPacelmuqUJmRR3r8TucUDsgTuvMUgAhstTl
 Tzi6l2Wez8XySelhLwyG8S2bThU5XfbQ2NZBdkHCD9xOUm0mAmcFA/Mm4vNZZah8pAWH
 3cJJdQxuXfWBzKJZQpOGlJsB3hlBdcT/L7Q+o4qKqr+g8lfHSSZOC9eqBBqDW6lOa+0w
 9gSwEpeGIQEuo6k+zpwoOgB9Nl1HSNij/NlzDo1yn4jG9iC3y5M3rHPyZsdFDWL9s1IB
 sKHw==
X-Gm-Message-State: APjAAAVdVKCnYrO8TfMw/OLd24z34e3GWidXXGxZjv9XVcgEWCrLoi3v
 kFnhLvRrvsjG8SkggU2nX/q1+A==
X-Google-Smtp-Source: APXvYqzGZWYGoQY3nS9VufjvpYmxU7hjhjBeufmUT4bsglP7TAQ2Nsm6LWhsAFqb4Pi6mCtsDOWt0g==
X-Received: by 2002:aa7:d813:: with SMTP id v19mr25334216edq.45.1566924253874; 
 Tue, 27 Aug 2019 09:44:13 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id l27sm3498970ejd.31.2019.08.27.09.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 09:44:13 -0700 (PDT)
Date: Tue, 27 Aug 2019 18:44:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/2] drm/meson: add resume/suspend hooks
Message-ID: <20190827164411.GE2112@phenom.ffwll.local>
Mail-Followup-To: Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel@lists.freedesktop.org, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20190827095825.21015-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190827095825.21015-1-narmstrong@baylibre.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_094416_186137_F7A54F26 
X-CRM114-Status: GOOD (  12.83  )
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
Cc: linux-arm-kernel@lists.infradead.org, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Aug 27, 2019 at 11:58:23AM +0200, Neil Armstrong wrote:
> This serie adds the resume/suspend hooks in the Amlogic Meson VPU main driver
> and the DW-HDMI Glue driver to correctly save state and disable HW before
> suspend, and succesfully re-init the HW to recover functionnal display
> after resume.
> 
> This serie has been tested on Amlogic G12A based SEI510 board, using
> the newly accepted VRTC driver and the rtcwake utility.

No idea about the hw, but looks all neatly integrated into pm stuff, so on
both patches:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Neil Armstrong (2):
>   drm/meson: dw_hdmi: add resume/suspend hooks
>   drm/meson: add resume/suspend hooks
> 
>  drivers/gpu/drm/meson/meson_drv.c     |  32 ++++++++
>  drivers/gpu/drm/meson/meson_dw_hdmi.c | 110 ++++++++++++++++++--------
>  2 files changed, 108 insertions(+), 34 deletions(-)
> 
> -- 
> 2.22.0
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
