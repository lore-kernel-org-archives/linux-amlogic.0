Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04F1C43219
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Nov 2022 10:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ToKbZiHh/Rb/vT1QzDPdYhPi88ScSM9vRRM5D+uDWUk=; b=LanBQ7mzzR1BM7
	3So4kQySIZFa7928mAqh4The0Nq6EI39nz5i1WIbvKFKfg+ftuEZjYcZoxrjx0QHKOsPYx8j+jeIZ
	HqD9R/aSoyQdDE3b57c2Vdr3gUdD+6BmBzLVVbsHB8Z3AOArK5g9hoZAWmKd/F0ZD/E+Jf8zGEXTc
	7pzc1mnfYySTcndW8Vi++8jlqb7OlAuhwQ0yYoIpP35pzryWFUyxdxOqEX7TlQalm26dh2mK8M8kh
	RKd96/Cs0DrDIRWXh/sWRzXEbKgdzPBk253jWKCmB7W3msXm50dT4rwgyah8zPzs527+pioOPNgCN
	ZwZFQp/KdTsK1CFeM83A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqu5a-003E6x-4J; Fri, 04 Nov 2022 10:38:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqu5W-003E3b-GX
	for linux-amlogic@lists.infradead.org; Fri, 04 Nov 2022 10:38:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667558291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M88yz4GfmbUNq4mWECugnsnJkV6z34uCwDqL3DFZ74U=;
	b=MrQOvOT4UxP3Qtv+fB8Cl9dUzB13vT4MHUxpeRqO0M7dcIyiaU4vcp0tqFUwRxc4Zx0M6i
	k9OUEBmsW29X30aW4lcmdjH20oEtmDRuouU+eN3LVO6xlLHVgWaX6tKgAgwghsiX6W0bxS
	Zi9nCwZOieaNB5Pyewd7sZ5c+c0b+pk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-55-Ga7bN4-mMFmov1eY8zIebQ-1; Fri, 04 Nov 2022 06:38:10 -0400
X-MC-Unique: Ga7bN4-mMFmov1eY8zIebQ-1
Received: by mail-wm1-f72.google.com with SMTP id z15-20020a1c4c0f000000b003cf6f80007cso1552032wmf.3
        for <linux-amlogic@lists.infradead.org>; Fri, 04 Nov 2022 03:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M88yz4GfmbUNq4mWECugnsnJkV6z34uCwDqL3DFZ74U=;
        b=KQqSQKrcn6peKtrybw1j4701mEVk0YLLWHqTy4VLnrV4XRoT/Rhq5yFhgHwwRx95Xp
         U72/Gati8UV7yI8SHPZk6UBGBwqoQl9CsCrr//cMB9Ps6dK/kQ56LPq6S4aaHao39a36
         Mkq2ymi9vV+cvZNiNI3mC1d85hNfjynm3WxBWWdvWzt5qGqT5HJ2W0DDLwxTBa0JAnD6
         XFHtBM4zRZbNWzQKDu5CGOIo/CPI5zyv77bbtw9RVECVssTk7j0GuhD1qxhVNryRb8d0
         44FFG1fr94kUbLWeu9rPp7zxFaCN9Nw6s4EPs7LnVk36DTJi6GIlDJFFemdyJdFA2Sst
         h7bg==
X-Gm-Message-State: ACrzQf3frr59V3bfnpDPwiaKcJ3LtG5Wb5i0a4JHvWd4w2tuKO6c+riU
	87mJuOdUFChz/z50ZgC84AgEP3rwg0KM3NtItDe2NFLINzFXywDHnGruphmHu/NOJNJYSuV+Mtc
	TYAm3jp22Y8rtcEBC8DqnlGni61pUkQI=
X-Received: by 2002:adf:bc51:0:b0:236:8fa1:47ea with SMTP id a17-20020adfbc51000000b002368fa147eamr218086wrh.77.1667558289587;
        Fri, 04 Nov 2022 03:38:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6s9MOXnwXonR8VOapq6d4n3ZU7IGA+EIjACuJbvHHOLIXD7EQUkeJV/V+5P7qnQBQKVLAVkQ==
X-Received: by 2002:adf:bc51:0:b0:236:8fa1:47ea with SMTP id a17-20020adfbc51000000b002368fa147eamr218064wrh.77.1667558289372;
        Fri, 04 Nov 2022 03:38:09 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id k4-20020a05600c1c8400b003b4cba4ef71sm2534442wms.41.2022.11.04.03.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 03:38:09 -0700 (PDT)
Message-ID: <1f5e6de4-3fe2-7933-f8c0-5f13564595cc@redhat.com>
Date: Fri, 4 Nov 2022 11:38:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 23/23] drm/fb-helper: Clarify use of last_close and
 output_poll_changed
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 spice-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20221103151446.2638-1-tzimmermann@suse.de>
 <20221103151446.2638-24-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221103151446.2638-24-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_033814_637820_2E8C76A1 
X-CRM114-Status: UNSURE (   7.66  )
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

On 11/3/22 16:14, Thomas Zimmermann wrote:
> Clarify documentation in the use of struct drm_driver.last_close and
> struct drm_mode_config_funcs.output_poll_changed. Those callbacks should
> not be said for fbdev implementations on top of struct drm_client_funcs.
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
