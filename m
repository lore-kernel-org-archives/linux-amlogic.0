Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BDEC4332F
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Nov 2022 09:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CcyTPgR0QkA22mfTUAZyMwXNg78VAz0nmZEIGguob+c=; b=WF4ZCM15HSueS8
	1MtmLI00mWp3NL/7BP24woqmeLVz/YY1WURYF1W4kP9Tn6MmLrlWVwBGX0jhzd11hqgieqhOwYo1j
	yKl5x6ji+ceXBH012JeFONnIlxJn3c8dPfk+mWYkfoSKVw4myBgbqb/2WUEhddi9yPzKmzZ+pOWOz
	klL+i64TYyHOp7QJAfmx74HXqNiw20ye6NDsW/fSwHThRMJFBqu0Q8rMnELBggoWRZ43+vpONOYGH
	Dirm6yIK8t1cahQuZ7W75ZBqqDsZocusfFNm+D/SqXZOZRuk+kLJkB2FDD+KGrH2ySX7/ohIpa2ib
	sQob0x4Xtpct4oNwS2Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq9fY-009NNF-PP; Wed, 02 Nov 2022 09:04:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq9fL-009NCz-NA
	for linux-amlogic@lists.infradead.org; Wed, 02 Nov 2022 09:04:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667379846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XBlp2DOijU5hXQ9AriUwp9vEVLgfxcCQxHX+sSZSvOs=;
	b=JEZ26qgK66TQuIjpBJVcw6NVnuvpzUbLFUElvF/3UO5w+UFNXksF2QEt6j8nC5LzDit8KD
	22hd2j3LeRKdOcNmh52W0TnbIKI8E+vB1MXYo2SoI1KKtRyWnAi812MY+GrDotpTdmf6O/
	bVjxYVaGoU0LguaER6yBr3qC9yhNYow=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-583-ZnFDi6gUOtWVAjy_o-tZDw-1; Wed, 02 Nov 2022 05:04:01 -0400
X-MC-Unique: ZnFDi6gUOtWVAjy_o-tZDw-1
Received: by mail-wr1-f71.google.com with SMTP id o13-20020adfa10d000000b00232c00377a0so4621104wro.13
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Nov 2022 02:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XBlp2DOijU5hXQ9AriUwp9vEVLgfxcCQxHX+sSZSvOs=;
        b=IPR7v6epR6rVejGMrmda4zwptORX7m3TeQfxVM3YC6dxjxSguBeSIrC2EHV0zodXW4
         C+CeyCC+KBV33W58oe4uEbrZCX2wPg7d75Ni2Sr/AfZjhMTqwAOoeJnh82nbgLOgRNUD
         CpSmvsvdvv0WpBK/oRQloTcFVTa3CjZkzfHxt6wWlhLcCgjPIQ3xT59eadOk2+i3qUpt
         D8jpY5ja7U9RV7IvH/tGmf90/XnVgrAygUmDCjCBqsgsohK0p9Rg7bsIVzdtzXW32br1
         ZoidneWUZ1J+0CfVSXOmRC53JhI5+FlGcTfgXTUpWvyarjfbOHQhHxUoKpv6XiXAQvXr
         sf4w==
X-Gm-Message-State: ACrzQf35DpsAiAqsOwVGUUY5xWJsKbigXVvtLOjE6IxNtnn6TMpldcsH
	/PVqvjzY0Bdnkmn98lQMNxiTbTUuELe2rCQVRyWU+gewd5E0AAFioffUX5HngX8vlyKF5uRDFDK
	5QgzX0ztf1SQ3Rz8ngIGurpuJTYCt//k=
X-Received: by 2002:a7b:c409:0:b0:3cf:4c81:8936 with SMTP id k9-20020a7bc409000000b003cf4c818936mr24380819wmi.38.1667379840254;
        Wed, 02 Nov 2022 02:04:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM72ckpdUoZR+NwXtu1sv2+7NmgS+YMIWWHB7QdeKnWTKduGDRl7tg4bkpenTZv0mX1kFf34kw==
X-Received: by 2002:a7b:c409:0:b0:3cf:4c81:8936 with SMTP id k9-20020a7bc409000000b003cf4c818936mr24380784wmi.38.1667379840046;
        Wed, 02 Nov 2022 02:04:00 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id b13-20020a5d550d000000b002366b17ca8bsm14083933wrv.108.2022.11.02.02.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 02:03:59 -0700 (PDT)
Message-ID: <87284e5e-859e-3b1c-7142-28d4fa7a7939@redhat.com>
Date: Wed, 2 Nov 2022 10:03:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 15/21] drm/fb-helper: Disconnect damage worker from
 update logic
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-16-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-16-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_020407_839188_F8B2CDFC 
X-CRM114-Status: GOOD (  14.28  )
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

On 10/24/22 13:19, Thomas Zimmermann wrote:
> The fbdev helpers implement a damage worker that forwards fbdev
> updates to the DRM driver. The worker's update logic depends on
> the generic fbdev emulation. Separate the two via function pointer.
> 
> The generic fbdev emulation sets struct drm_fb_helper_funcs.fb_dirty,
> a new callback that hides the update logic from the damage worker.
> It's not possible to use the generic logic with other fbdev emulation,
> because it contains additional code for the shadow buffering that
> the generic emulation employs.
> 
> DRM drivers with internal fbdev emulation can set fb_dirty to their
> own implementation if they require damage handling; although no such
> drivers currently exist.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

>  static void drm_fb_helper_damage_work(struct work_struct *work)
>  {
> -	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper,
> -						    damage_work);
> -	struct drm_device *dev = helper->dev;
> +	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper, damage_work);

This line is an unrelated code style change. But I guess it's OK.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
