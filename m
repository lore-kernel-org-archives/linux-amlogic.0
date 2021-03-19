Return-Path: <SRS0=D5lY=IR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87ED5C433E0
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Mar 2021 09:41:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBF1764DEF
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Mar 2021 09:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBF1764DEF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dsdKd1DKImbCYUvUOSli2PnDU/Zzs4IF75sD/QdHr2A=; b=FkOpPX3ZebzMoaWJiXMLamihA
	Zc53Jd8y9JA4m8764m4ajZ3aZnkn5lmIcNjrIbSlKuRHS5ruaRUgth4tPGF/lbSazoDkiXYGmtfJ2
	gwBEGLlKuCgoD8/VvxR/mm/mFutZYGZm3pH0FHxaSfKpD+uWmbJ+Wh2JBhp0S8rJ9dJkH0QO/z4Ww
	COXIeGkTHSfxvWpW1zR77zqW/Naz0wMCMoADwsQy3BF5LzMDhKlz+7ABjz2psRtbB1AsRaMBV+nwv
	fokjJbEkvv0CkGW43I7m2V+sx0oiJfgbv+EaI1mk1NNmLOAgNkRkLbJXbKqmglngyYBuZgqY3hw8N
	6zxNJl7zg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNBdD-006xsj-NR; Fri, 19 Mar 2021 09:41:23 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNBd9-006xr5-6U
 for linux-amlogic@lists.infradead.org; Fri, 19 Mar 2021 09:41:21 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 12so5091710wmf.5
 for <linux-amlogic@lists.infradead.org>; Fri, 19 Mar 2021 02:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dE/FMXXwTOcZLfKWiTm5qvJwQlSCibf7/ZnsQ3VuA+I=;
 b=cUvirTqY+bHdROH4xdfpGMrp7CwT1frnVIdSmYUtaWWWWj954Z8j45z71527sO+KrZ
 5WQkEOopheMKChAfrdE9h32SdNhfHFZO0zKs7NPsr2x5b5XK3DrR2cl0OZjZkpcwRPCD
 uyUg6tjYCdewlJ2318NC43fksCK75iQU6y4nAXvkOYfja309Ndyn/kcx+rSunDpADNqj
 7xGGjSPrCOPoP26K9qEQsLNvHBw5r4DrHb1BWvR97GcN4NcnYd3Zs5FrtkbZG8d9W1Nn
 R6AJBNeFdMZFJle8Ob1eyXT4ONSp1qP/ZoB9f8urGPwzK+mHzxAUFh4idR4bZzsc2sq8
 3sjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=dE/FMXXwTOcZLfKWiTm5qvJwQlSCibf7/ZnsQ3VuA+I=;
 b=SyHCV3RCGQ89N4+6liQyS2lECRLUG4eueIV09ZsGFpvKx+C+WvoMu1cKA0tdgI6Q6p
 nhfOQrdK5xTyt7KBXTa+2U0PXAHrG7sQCtUSV2Ujz90X8lR1GGehjv10rjmh6lg2ytOC
 EQVyKk0vT33yd3BqIr2LxD4gl9w9D34JWEMsziUSniZekInQzP/7WdP0wFHCJMktPJlc
 qAzDxXcp6mRDsKnmSSECYQW3liaWxbBDmLuTQapJ2ce7NMLwa4rgNwxTHzZ1wkmgB/NT
 pq5EZfTR0Wczn3dawpBJfXhdzul82AL81r+LRMnr485Fdp8lwXyd5h4YGBT/eDahuaEX
 iHIg==
X-Gm-Message-State: AOAM533vDV2Sug2PXETA7GdDH5CGxlhuzBtufyBxL7bAiS5N+s4w5jn0
 KgSn6/TkNKf59EW3/mzHjkwBdOrea+qqNTOV
X-Google-Smtp-Source: ABdhPJyhmKqPRcT1Q2L0MAxywvHaux8gt0MC/4MXTIbjMyfjntyMA+cOtPLJ+giH8rEkY7Tb8COX6Q==
X-Received: by 2002:a1c:4e12:: with SMTP id g18mr2803941wmh.56.1616146877840; 
 Fri, 19 Mar 2021 02:41:17 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:62a:14da:7a4b:4aee?
 ([2a01:e0a:90c:e290:62a:14da:7a4b:4aee])
 by smtp.gmail.com with ESMTPSA id m17sm7082516wrx.92.2021.03.19.02.41.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 02:41:17 -0700 (PDT)
Subject: Re: [PATCH] drm/meson: Fix few typo
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, airlied@linux.ie,
 daniel@ffwll.ch, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: rdunlap@infradead.org
References: <20210318110046.14830-1-unixbhaskar@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <fd1f66c1-b1ca-bfd2-8a04-64a9b7af4e3c@baylibre.com>
Date: Fri, 19 Mar 2021 10:41:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210318110046.14830-1-unixbhaskar@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_094119_534075_25CB10C0 
X-CRM114-Status: GOOD (  17.60  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 18/03/2021 12:00, Bhaskar Chowdhury wrote:
> 
> s/initialy/initially/
> s/desined/designed/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  drivers/gpu/drm/meson/meson_venc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
> index 5e2236ec189f..3c55ed003359 100644
> --- a/drivers/gpu/drm/meson/meson_venc.c
> +++ b/drivers/gpu/drm/meson/meson_venc.c
> @@ -45,7 +45,7 @@
>   * The ENCI is designed for PAl or NTSC encoding and can go through the VDAC
>   * directly for CVBS encoding or through the ENCI_DVI encoder for HDMI.
>   * The ENCP is designed for Progressive encoding but can also generate
> - * 1080i interlaced pixels, and was initialy desined to encode pixels for
> + * 1080i interlaced pixels, and was initially designed to encode pixels for
>   * VDAC to output RGB ou YUV analog outputs.
>   * It's output is only used through the ENCP_DVI encoder for HDMI.
>   * The ENCL LVDS encoder is not implemented.
> --
> 2.26.2
> 

Thanks,
Applied to drm-misc-next

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
