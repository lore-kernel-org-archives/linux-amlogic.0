Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C48CC38A02
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Oct 2022 12:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5nRYbSC0kAjiEk60w/6heuiKNDpSbmkVNXcQzUWcB9g=; b=iBV6UeR8AzsQIB
	H61bjGpJWbGDa7OKICFaVjF+72Q90tYyW7jaRWh1CVG1Wp54/uNQ7OVo2Y2yu/zA/Kh3vzbNxODyr
	GJ79J8G/cRQnzeRDOEgk4oZnXzdue/t6NCL8+wb5/q4AMTHMoyFGs3826sdFhTtmwRGFi1d5vrVXF
	ViAGD/dtX20wVuDndEleSd9iOnh115qK5uGq7sEjIODy6gq9g3Qbmvv7v4Q97vRVXoJwQBSbm4H6l
	0q61Xs+GAaQnKTq9Kc+Tw5gLApTQEHD7GcbRK/gms7Mp/kg+DsKq1+tqt+Q5VJl+bY4kuY612snca
	2zHqFscHNzr1ORC12TdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opTT6-00BVXf-W5; Mon, 31 Oct 2022 12:00:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opTSt-00BVQc-5a
	for linux-amlogic@lists.infradead.org; Mon, 31 Oct 2022 12:00:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667217626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HRPxwW2zKPepuA8PR9mUAwCAVRj8pp1PiT5CedYG760=;
	b=A81TQWzRANSt9UBXkN6GWZECwAj2+GPLXn6gdwd5irFl8gEo3FGTWQ0tGgzwhMkxQ2lwHk
	9EJ9dIXq62KH3h5oOwgKZ83yltwQfjYnOnaHOR1ePZXUP1C+hxUKtaADOJgdSnV4tlZcO1
	vZWbNYGFj0c0lpX1hv6hD75EP2wEoSM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-652-rERGhx74OlexFv19NTGM-g-1; Mon, 31 Oct 2022 08:00:24 -0400
X-MC-Unique: rERGhx74OlexFv19NTGM-g-1
Received: by mail-wm1-f69.google.com with SMTP id bg21-20020a05600c3c9500b003c2acbff422so5659819wmb.0
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Oct 2022 05:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HRPxwW2zKPepuA8PR9mUAwCAVRj8pp1PiT5CedYG760=;
        b=RzWmSNvUeZgNNcZeWkqIaEZhqiDTwUfU9ZGGQNocLnqdo/j3gPwIoowSZsgtIc9OQc
         fA7khLvQLS2FR5qFXGTmy4f5f0rxeiJQNiuWufS+tnk8QWf46I1N9aCpXezpMqjHBWNF
         q7FEQYdd5je8F6WccsA1PyoYVZX7QjegEiAoGaE0GRLfjek1D19JEvRpGk0bG9vZ2Xfm
         z8rcTuf3qPb5qeRwUylBZysnJV41iCLKz/N8DXqQBK99H6axwbgcEoJT0+NBT1O+EVKO
         3oKQ7xqEpbrbyL874BhCs1qUbAsGd9dJ7FWxcuGOefxlbyc3ghfcj+XNO6qS3djeozKC
         jEFQ==
X-Gm-Message-State: ACrzQf33OMKmwVAGPiiV2CFtQOoGpJRJYyw8Y3yP8wRTcPl54unp3f5f
	vF7r/odI+OYH9LLEET9yvM+pUErYJ3GObnDlsLhXBwNtmxVhiZjp1hFQtk7lJIKR80wfJlbpipb
	wmIK7+wrTTDlAi1cZ33jzGuZ5cKlJ9lc=
X-Received: by 2002:a5d:560e:0:b0:236:c325:4858 with SMTP id l14-20020a5d560e000000b00236c3254858mr4606553wrv.259.1667217623900;
        Mon, 31 Oct 2022 05:00:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7SGo+SId6me5X0r4rljOgpSC8TPNcKC+21wfNb2F4dclcZs6G1cIUREq2tk/ot5/dgyLJVEQ==
X-Received: by 2002:a5d:560e:0:b0:236:c325:4858 with SMTP id l14-20020a5d560e000000b00236c3254858mr4606520wrv.259.1667217623655;
        Mon, 31 Oct 2022 05:00:23 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bi19-20020a05600c3d9300b003c6c1686b10sm5388458wmb.7.2022.10.31.05.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 05:00:23 -0700 (PDT)
Message-ID: <2e2e3915-a7b2-d030-2ffd-117b12deedb2@redhat.com>
Date: Mon, 31 Oct 2022 13:00:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 03/21] drm/vboxvideo: Don't set struct
 drm_driver.lastclose
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
 <20221024111953.24307-4-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_050027_330400_752BB7BC 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
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
> Don't set struct drm_driver.lastclose. It's used to restore the
> fbdev console. But as vboxvideo uses generic fbdev emulation, the
> console is being restored by the DRM client helpers already. See
> the call to drm_client_dev_restore() in drm_lastclose().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

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
