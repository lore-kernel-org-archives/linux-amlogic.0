Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DC4C4321E
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Nov 2022 11:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T6Kk6YNnP9aG13Eozf8+Zmx5BjwlklV1jOZGvfWUZM4=; b=fjown4NkwDX1tx
	xpBIB7a9VOxqt6jtYTt4q4u3PVE3rC/+HizZlM85+BLhcEEGDtpyg1XF4hOVM5tRbOz4Rg69guLwn
	29lX8T2NMrJIHhRwmIpO/Y4+b+x/KSemMmhCRB/fi9gTqjZRkR8kvNdapTEZeb4ZIDaKN8ssd+n47
	Q0Xo6L47P1/i3RgCxlLYGW8KxBF6PUPTjsBqzJACTar9dWGRDlfnuSFN5Ux7y15masHlkyoMCdboi
	v3Vj/KOC9FEv4oXvvf9v3R7m3pdjDGNDqIHCn7O0yOEaJjzYQXukRNYGxxqo35N+Va65QmESKEGof
	gkQzuOEhBEjfyjyfQ/ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozyUd-008POe-P2; Tue, 29 Nov 2022 11:09:39 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozyUb-008PLQ-9h
	for linux-amlogic@lists.infradead.org; Tue, 29 Nov 2022 11:09:38 +0000
Received: by mail-oi1-x234.google.com with SMTP id m204so14775055oib.6
        for <linux-amlogic@lists.infradead.org>; Tue, 29 Nov 2022 03:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cf9n2jaa6cYTVOklMuNk4qObbBfb+M49DmHuLPAMaG8=;
        b=EQGj1OluD1poCYCp847EqljBv2Ad7K/1G88aFPNPKXsuhiJcjMGoVE4O/IpTOi6grs
         DqYZyeMry7IkWAxmOVsObvHrdr/u4CHzPmyaVR8QTymd3X6LWpY0Dsxs/yLDVDP1VhaP
         tp0sWFghX2mKmvsrtbfPRU8FGxdMLOhH/VuekVTXfdKSaPfa9ZuHJakPCobD31IXWdp4
         +BqClWFUs/lL6XEYozaaPgS+KbkB5k3abcZ8TgF8IvK/p2du9FDw8FXQNZaIfLD9s93T
         2FlZyEzDBvaZtz6FcmRkxwdCpMNAMLiNpNr518cQA9GbdBTia3NupXIlr8ygDt2EeL6l
         ITAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cf9n2jaa6cYTVOklMuNk4qObbBfb+M49DmHuLPAMaG8=;
        b=DUVHam48EUrCsp1qSHgPZivqviGR1lcCJK48hyvyGsBjx6FwcFh8lvU5qO9NDf8y70
         9ChOHurVxwBgfCbXHQOkJ0Zx2aYT/slomoxUPIE/Kyx08el+Z9EzPhEC2Wi2YXaWs+Rc
         r4rZAqEK1haJF9ZxJNk+cN7+Pp1O2hmKJPclerd6fJPbk5e3ubsYFrOrt0qx2DbrXnuU
         xAhlzVgBu3A1zYRznKBgLlQ1KrHc9Fc4ub34yWk3jRHi25Zop9ujwsbuZTrka1lDdUqi
         hKzw+t4kNQrQcn3vkTANUcGMLr4RhgpxaNDoergV2uxEaD2n0IyFGP4XmbCN9XpE5ssF
         ulUA==
X-Gm-Message-State: ANoB5pkrIoeztKl2Ssik8KLD/GueQNkSjJWPTq4DC0lD5v5l15KFW++Y
	ZqwMCBRYI9zh2wBzOMEMf/02bTOLEPG66slmU2UG8A==
X-Google-Smtp-Source: AA0mqf5fbP4ZbObgYQ/PNpZohM7nKX0Xg43wC7ljqPSKkxNSoLuBv0Tby+XmsYnndNx6Rfpcz+xVv2PD+1lW35gFnFY=
X-Received: by 2002:aca:5bc4:0:b0:35a:7056:4f9c with SMTP id
 p187-20020aca5bc4000000b0035a70564f9cmr30858789oib.72.1669720170072; Tue, 29
 Nov 2022 03:09:30 -0800 (PST)
MIME-Version: 1.0
References: <20221116143523.2126-1-the.cheaterman@gmail.com>
In-Reply-To: <20221116143523.2126-1-the.cheaterman@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 29 Nov 2022 12:09:19 +0100
Message-ID: <CAG3jFytyzmRnpj8pzSUitLhAHQM9b0zhkc2cbfVmgKStfHpwVA@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: dw_hdmi: fix preference of RGB modes over YUV420
To: Guillaume BRUN <the.cheaterman@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_030937_349211_CDD29571 
X-CRM114-Status: GOOD (  16.02  )
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

On Wed, 16 Nov 2022 at 15:35, Guillaume BRUN <the.cheaterman@gmail.com> wrote:
>
> Cheap monitors sometimes advertise YUV modes they don't really have
> (HDMI specification mandates YUV support so even monitors without actual
> support will often wrongfully advertise it) which results in YUV matches
> and user forum complaints of a red tint to light colour display areas in
> common desktop environments.
>
> Moving the default RGB fall-back before YUV selection results in RGB
> mode matching in most cases, reducing complaints.
>
> Fixes: 6c3c719936da ("drm/bridge: synopsys: dw-hdmi: add bus format negociation")
> Signed-off-by: Guillaume BRUN <the.cheaterman@gmail.com>
> Tested-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 40d8ca37f5bc..aa51c61a78c7 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2720,6 +2720,9 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>          * if supported. In any case the default RGB888 format is added
>          */
>
> +       /* Default 8bit RGB fallback */
> +       output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
> +
>         if (max_bpc >= 16 && info->bpc == 16) {
>                 if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
>                         output_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
> @@ -2753,9 +2756,6 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>         if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
>                 output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
>
> -       /* Default 8bit RGB fallback */
> -       output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
> -
>         *num_output_fmts = i;
>
>         return output_fmts;
> --
> 2.37.3
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
