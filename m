Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A31DC433FE
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Nov 2022 09:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ntjQo9ihJ4r94n9FaX/fXtlA1/Yfze3PN4kMbqBfwUg=; b=M2wQhIEd/hOvvc
	lViueK12WQOOUlbbq0G5x1kLMNiO2HajkxDUP6J/o57LLWD5PAgIm2r+GcYt8dWhLJQNJq6mbDrhI
	fELYpOPf6NOcEjWIi6nLEwMBdNXIe3l/vJ1zIolO9XJg7F9pVhkXLIJO8qxN6rjYJTt0xWkzAYT0L
	8XuidzI/TgPxfkvfXhPr4cTzhYhAtxw8gDW9mCkb713s4BwKJAT6Wx1bvgfK59XNyuQC1CQI6KPtQ
	E/nfHUzJXgCPGETKK0Ee6YLVCNgNuqbq356mSWLWaWcLpF3/vnDb8l1sZof9X48g3R22i48zupT7C
	DL3mj6f844sOvG4qvnew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq9gb-009Ov4-H8; Wed, 02 Nov 2022 09:05:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq9gL-009OPh-R2
	for linux-amlogic@lists.infradead.org; Wed, 02 Nov 2022 09:05:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667379909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LpYqcUNkPgIA1fAPwB+EiO+Z9dq0ENSiM+RajxMrldI=;
	b=QABVmfZToklNdvumxrtSd259Jj+oeLI5xV1YLK//PW4EDNnyJVGOuH8Kcta6DRkCdxiWYG
	c7MV5QnmzSanxQBGKfqjkQS0ihPymcrU7b61Fv+rZPi7usBLTFoqRnfUgIkFOVYwZkN6jY
	ly5+ihqZcTGjHX2Isj3K7FAWWznwcfU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-256-kN-1h7eSPVSVUnftVNsNzQ-1; Wed, 02 Nov 2022 05:05:05 -0400
X-MC-Unique: kN-1h7eSPVSVUnftVNsNzQ-1
Received: by mail-wm1-f71.google.com with SMTP id x10-20020a05600c420a00b003cf4dbff2e4so793357wmh.8
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Nov 2022 02:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LpYqcUNkPgIA1fAPwB+EiO+Z9dq0ENSiM+RajxMrldI=;
        b=zqIjSowY6QyIa9uUt1AtpsOwCN2YVgPVNbzNrnM1l8Nk9BiK4h4OU7AyzjZUJxkLGt
         4f/0zd5492EtlqtRNG59Bo8NXtplYrhMpc/YQdN9H2N+tweZnFjGyVDEV0Jv2yF4nO34
         PaOER3EqepqMz/yLs2FtY4PvcceNkOtRpLsvKN2tJrYSvZo9fvsrMsXKowdO9dAdGzGu
         G6SW1M5pcOkArtsGHuANBjeQrzS41rQfKBNLVL+vbN9EFYVuDfmxWYy0ISna+AeIEjh1
         kKeXVnbaDdfL0Hpa9W+z0Lnr0yi9HXYZlHz1zkvK7Fd97o5EMeDXaVlyv6I1oEQ9PrAq
         5+kQ==
X-Gm-Message-State: ACrzQf30NYT6ZpceOMHqy7DJgQbxq4JFjzCZT45Kl2O5BqebezOSsGjK
	xuZ/Gl+8cmMTlrnWUr3eswEAmZAOOVhlzkpPTQHfGp27D+6LBsOrzWrztRk24utMN7UPvniXKBu
	OdNfMyRun1ZXy6vE0YjOtjLOqbpCF6Cw=
X-Received: by 2002:a5d:6488:0:b0:22b:3b0b:5e72 with SMTP id o8-20020a5d6488000000b0022b3b0b5e72mr14464161wri.138.1667379904742;
        Wed, 02 Nov 2022 02:05:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Ug/7BR+PMLuqwC0wiYVRKEgerXkzKho5yFNKIDT0bC26SnYKpkqpAn1quqQ9FNF9E1JGkLg==
X-Received: by 2002:a5d:6488:0:b0:22b:3b0b:5e72 with SMTP id o8-20020a5d6488000000b0022b3b0b5e72mr14464139wri.138.1667379904487;
        Wed, 02 Nov 2022 02:05:04 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id p2-20020a5d4582000000b00228d52b935asm12402687wrq.71.2022.11.02.02.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 02:05:04 -0700 (PDT)
Message-ID: <a96d57d8-486d-5a48-a00a-39df6275cbb5@redhat.com>
Date: Wed, 2 Nov 2022 10:05:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 16/21] drm/fb-helper: Call fb_sync in I/O functions
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
 <20221024111953.24307-17-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-17-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_020509_955628_1E7BD2A9 
X-CRM114-Status: UNSURE (   8.72  )
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
> Call struct fb_ops.fb_sync in drm_fbdev_{read,write}() to mimic the
> behavior of fbdev. Fbdev implementations of fb_read and fb_write in
> struct fb_ops invoke fb_sync to synchronize with outstanding operations
> before I/O. Doing the same in DRM implementations will allow us to use
> them throughout DRM drivers.
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
