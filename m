Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06499C05027
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Feb 2023 10:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLa4ErNj2xrXOE8R0KhRZ5qHcVYlmC4Pop8QIA/tsY0=; b=DfDEr817o/ZsvXYPS0KThN0KT8
	CLFzOVcCYGgrfmS3fNwpV+lyvRbwMEe+6TqIucGWApI8smEflJz+v9Gm+D7TgA/iobWQAx7ZA9qkl
	dKvcAizlQNNyint2oypyvPYUza2/llKc1EdlrNpincQ+qUx9h+gsxn1FGn4SABQ0jS5uem6i3bXdJ
	7N5P6pAHtUPVHnf/fYEDgHez0PQErd8rDW7XV6XtiCZTDi3D5mx2k5YzkKx882iQy5SiFBBJaPAFy
	7ok3/Ftgb96WzYd7bEa+/X5Gc6KF76ou4qZ7yYI9hnJseU0cDpyaM8OGGsYqf70nM2aiTL61QinSh
	L1DG8qkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSxqx-00Deuw-IS; Fri, 17 Feb 2023 10:20:31 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSxqk-00DeoA-Ba
	for linux-amlogic@lists.infradead.org; Fri, 17 Feb 2023 10:20:20 +0000
Received: by mail-wm1-x334.google.com with SMTP id a11-20020a05600c224b00b003e1f6dff952so518363wmm.1
        for <linux-amlogic@lists.infradead.org>; Fri, 17 Feb 2023 02:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WBDuZ1YsthJFSmgGckbyCZ1GxJY3h4+AR0nDnSv5p9E=;
        b=WuRKgVx/abcZcK0HucJ8OjzXyIpHTyHaEz58egQAstY1ADJVR1JsTDjiROMTeDn2Uq
         UFIxDNUqOqEYb/Yh98Skh8i1EqZD8J5voak28hEzBJTErFxFz5IgwFpGgX2F5MQNSjFe
         FH6yX2PU0TFCrYpUIpN+7qXCdgFPKkYVbeywTF4aZPBS6awLEgJj+eyHNp3kT3oQgWDx
         e/+OLuHHd/o/NEBP3PkabCf0j0O2twILyrxffS5tRO4ngZqMN24Bm/svmGh5Wt7JBRj2
         v0YU+wG5jBK66ZAAGj9BYlTjvdWp5WTmq6SMTfeUTvkr0DYn+iacsV0QtDe6Zj8pkhjP
         8hBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WBDuZ1YsthJFSmgGckbyCZ1GxJY3h4+AR0nDnSv5p9E=;
        b=tJafCo526lIQi+U0DjLrGUpOFBesHLMMNdDZWIek3Qifx8oEgTFWFD5BrXmQMzT2Ye
         NO+Kk5JtnWXVXn32kCp2+T78sFVW0AoYMNVgZcvdLfBTJAYrb8itu7vMXNXHRQfQv3/7
         Z6x3J5EQIGCDjk2oTbE+4AwF0603ZNzx0d1SCYin0uBxUzKX+BAlN+j5oVZmEAfdei7b
         4QrPOCZhQtR84NgCRUKAuiGqsFbo3m/8Bkwz/JjAa+cOw1NZJOILu7kXCmguVxzOmLdk
         XP36g3dMFFUBLmxnUJm0hrK4kFh+0ifoBzcBay+7TE7Ngxw4+iKNOr7fnay+Xp1BhrEF
         s7Dg==
X-Gm-Message-State: AO0yUKUi8OE0P+Uwt+uxdJok0FM5bfGnLozbs61WySensu6PncjSPoMw
	N+mGfT4e2fIH4jlOE7svkCkLTg==
X-Google-Smtp-Source: AK7set/NxxmCSIJR7gO1gNoNDErjpfId+Gjra9KrBytdDA56fqSSwlfB1IfuBIhwiAKMe6dJjTWjZA==
X-Received: by 2002:a05:600c:4d06:b0:3dc:1ad6:55fd with SMTP id u6-20020a05600c4d0600b003dc1ad655fdmr893227wmp.32.1676629214411;
        Fri, 17 Feb 2023 02:20:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:f65e:92aa:85d5:15c5? ([2a01:e0a:982:cbb0:f65e:92aa:85d5:15c5])
        by smtp.gmail.com with ESMTPSA id v5-20020adff685000000b002c559def236sm3028656wrp.57.2023.02.17.02.20.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 02:20:13 -0800 (PST)
Message-ID: <86b55b41-3faf-dbb8-a072-9a905d111eaa@linaro.org>
Date: Fri, 17 Feb 2023 11:20:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/meson/meson_venc: Relax the supported mode checks
Content-Language: en-US
To: Carlo Caione <ccaione@baylibre.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Da Xue <da@lessconfused.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230210-relax_dmt_limits-v2-1-318913f08121@baylibre.com>
Organization: Linaro Developer Services
In-Reply-To: <20230210-relax_dmt_limits-v2-1-318913f08121@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_022018_409374_E1E8EA3E 
X-CRM114-Status: GOOD (  14.95  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 13/02/2023 10:32, Carlo Caione wrote:
> Relax a bit the supported modes list by including also 480x1920 and
> 400x1280. This was actually tested on real hardware and it works
> correctly.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
> In particular relax the resolution checks to allow more resolutions like
> 480x1920 and 400x1280.
> ---
> Changes in v2:
> - Lower the hdisplay limit to support 400x1280 as well.
> - Link to v1: https://lore.kernel.org/r/20230210-relax_dmt_limits-v1-0-a1474624d530@baylibre.com
> ---
>   drivers/gpu/drm/meson/meson_venc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
> index 3c55ed003359..fcd532db19c1 100644
> --- a/drivers/gpu/drm/meson/meson_venc.c
> +++ b/drivers/gpu/drm/meson/meson_venc.c
> @@ -866,10 +866,10 @@ meson_venc_hdmi_supported_mode(const struct drm_display_mode *mode)
>   			    DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC))
>   		return MODE_BAD;
>   
> -	if (mode->hdisplay < 640 || mode->hdisplay > 1920)
> +	if (mode->hdisplay < 400 || mode->hdisplay > 1920)
>   		return MODE_BAD_HVALUE;
>   
> -	if (mode->vdisplay < 480 || mode->vdisplay > 1200)
> +	if (mode->vdisplay < 480 || mode->vdisplay > 1920)
>   		return MODE_BAD_VVALUE;
>   
>   	return MODE_OK;
> 
> ---
> base-commit: 38c1e0c65865426676123cc9a127526fa02bcac6
> change-id: 20230210-relax_dmt_limits-355e2a1c7ccf
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
