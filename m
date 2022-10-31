Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B99FA3740
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Oct 2022 12:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vLCZ9Hp9iDZOgBkbvy4uJKFpuG4m5fPc3IWS/ij/WA4=; b=RNajvQ/CjYboGc
	iuvxVbw3j6NBwDn7cecypsdHKmrfj+xXOkwnoMvXmpMRAWWM8gPU8821+wbD0fE+skeqpBT3WbYCv
	Np2nge1oDhwTur5thh9pM2xDENT1EXjFb3AZ3g3Lk4Q+whRxKGR4YtXRvJMNOQZz0dSDgSYmmC3wK
	JXQrmQHJoZMMR2pspF7QI7yMRLazSiJ5pZsKvUG7HzPg9H863yR7Wx4zozYVkAGWmcnaCkbwES6Sp
	TXA15WJjXDQTN0DhR3vC0gacn2s/qDGp+tygNxVkAjz+qqMshQgt0SCNkvkJWvYQ+u/7KnM4p/yv7
	2rRaTc4WKqQzUBSxV9yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opTny-00BcwF-RC; Mon, 31 Oct 2022 12:22:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opTnh-00Bcip-8k
	for linux-amlogic@lists.infradead.org; Mon, 31 Oct 2022 12:21:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667218912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sz8PAZx0cLc5RAaRO0sQR4MZQyCy7VtrjJT7yq4jHuw=;
	b=dtQVGo+IZpIyUJY4zXXEG/jalqF9M1pfn2IdTmrz7mYYRpF87IBrQkBlR5B3RpuR3G+aTI
	k40MuyKuCdqnmW1jG7fFCXifOR3s3Ok4Quh2y1JHM0a5/wUppWpI1Ut0YG88m5KLySqOoG
	LhUFfBKyizj5dA8s/Vl8MiAhsJnE5hc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-317-uBX5QcQhOmm7BAITW81zeA-1; Mon, 31 Oct 2022 08:21:51 -0400
X-MC-Unique: uBX5QcQhOmm7BAITW81zeA-1
Received: by mail-wm1-f72.google.com with SMTP id i128-20020a1c3b86000000b003cf4ff1b917so5239302wma.2
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Oct 2022 05:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sz8PAZx0cLc5RAaRO0sQR4MZQyCy7VtrjJT7yq4jHuw=;
        b=iWIbCG0Cw6XDDqO02AzIWdoOqTzm5UwDBWoo7dthBO8S+mZ7/QjnoT63jbgRxVEcS+
         z/J+M4hrSPImu0S0iMIzmWvO4YU8MFaxYsdQs8v3HrB+jQFd+n+O5ATdbigu4bxkLNjQ
         yMpgxrJ3DLLh1IfQgowCx3KZCmiOjLD1P5ea6sbwdvTeqaKp3gRsprzNYyFQHuSKdQEK
         Tji2MHfjoDnVo8IdO5RdTdYA9RZCqAskQxPZVWPHPSq0icSJjJMphuXOX3Fbe5uFNqec
         d5PVBXuKFEl31GEiW/o1gTs9mbN+Hh7Qy51EampxB2hCXKLWYZJm/FwuQQWchC6jemY7
         JUGQ==
X-Gm-Message-State: ACrzQf1559I6qyePUc2N0J+LvBkpebzkirs8ceyZX/gpwjK5bw7YQtWj
	N/kkDr00qt2hzpiDWgS1UfjOk9lDQ1dgVblUPyMsenfUeWPJxFX3b77TOFoEU8eCsWkMeGvca/Z
	7twYr0UMpNR/Tmuj+xnYPCz+wPJY4D6A=
X-Received: by 2002:a05:600c:3c8e:b0:3b4:d224:ae27 with SMTP id bg14-20020a05600c3c8e00b003b4d224ae27mr7935989wmb.187.1667218910339;
        Mon, 31 Oct 2022 05:21:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7kQh5/EvsJvI9K3W2EFLXezwgTMZr8BgFr4Dt+IxgUiTtboeKKAu1FK4Es/7ETyez8XSTV6g==
X-Received: by 2002:a05:600c:3c8e:b0:3b4:d224:ae27 with SMTP id bg14-20020a05600c3c8e00b003b4d224ae27mr7935971wmb.187.1667218910155;
        Mon, 31 Oct 2022 05:21:50 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id i4-20020a05600c354400b003cf4c1e211fsm7421692wmq.38.2022.10.31.05.21.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 05:21:49 -0700 (PDT)
Message-ID: <e9192382-f04c-4ebd-ca1c-b2fceaa29f86@redhat.com>
Date: Mon, 31 Oct 2022 13:21:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 09/21] drm/panel-ili9341: Include <linux/backlight.h>
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
 <20221024111953.24307-10-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-10-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_052157_414953_7FA32C27 
X-CRM114-Status: UNSURE (   6.54  )
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
> Include <linux/backlight.h> for devm_of_find_backlight().
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
