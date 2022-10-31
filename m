Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D00FA3742
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Oct 2022 13:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GE8nz/7uxMlVhshLCjebqODnUQ4MlClYfERkPXP+deU=; b=iMAu8q8wPNZTv5
	x9AIIz8CF+yQlh+kaLFt9sn7z3SOpHRBq+7UWKsADChOWa2BdlKi8ue5q6vf4ievU0zHAw6t+5JVB
	nS0zYmuJGzBQ5JhLLmAxSv3qu2E9vjhY/VGRIVGUDjPm4O42sZ0hMv4YbYh/ceeSAh5PUZJGpo9QI
	3VjjsjjaG2eGGfk2VLvFtS2gKkGUMJNfjyZXxAiRvzriPE9pZhdDrDKg41sX6nDaExVbxdepc7ZTD
	eTq4iv759IkyUWf5h5DMhjr/yD8KOyal+UkWZ3GrMOcSpZ1MpIFbB2akjjeB42723a4ohLA1HAJAU
	HrOlNCDtngcCDkUomuTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opUpA-00C3A7-GA; Mon, 31 Oct 2022 13:27:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opUox-00C34v-96
	for linux-amlogic@lists.infradead.org; Mon, 31 Oct 2022 13:27:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667222838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GwqNSS0OJIleR6uoXEXg4AgYpmJqcWP2KGT201SIVMg=;
	b=W0vqrJETrrXTqQoG3vpBmoqKSRrJS1/Jq7LTpPu+mO9deitZfgbdUDFUfCZ5bixBYlMIUZ
	GrDC02uosAahqXIn6bqCVSZB6T87vh0yNDdytr1uBX2vmgQpsTb5GxCpQz186gv0yM5s91
	Ju+RHUdGinbYv4UwP1yzMQLflk8HTSQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-34-JFFZ9BhePHONewtP8Wd55g-1; Mon, 31 Oct 2022 09:27:17 -0400
X-MC-Unique: JFFZ9BhePHONewtP8Wd55g-1
Received: by mail-wr1-f70.google.com with SMTP id u13-20020adfa18d000000b00236566b5b40so3053533wru.9
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Oct 2022 06:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GwqNSS0OJIleR6uoXEXg4AgYpmJqcWP2KGT201SIVMg=;
        b=Dj4s9ERRN+juWcDWPhgWiAHWxOKvxNVXf7IXfGfM1I6gnJeX/3I6cwIX+PBePFXlf+
         8Y00Lr8tRvbN7WdD2jvDHiyGCxT5D+TzABYrGWK3m43VvKbQsdqhqvFEtbFaAwOnkxsE
         bQVRbRRmJdvVzAtkRae/QAi5IMXZIcgQCpfYPhLz43aN9XEwSqawa8NceIqIE/jDwa6b
         W47RiQo+nFtUgAFyGFoIN9KQt6252zLfuo6lL6tpm51V5evc0Q+ClcBweXt301zr+n+M
         fb/S+msCzgD4KDawdd67UDt7BdWa4JjCKIfyj8Ui95j7NI49/sTaalkZn8ev0X9Cyhvx
         JDmw==
X-Gm-Message-State: ACrzQf33o45YnYYts3koxDKCwGKxZh9RhLMUY2D79ExCWnmVW54a5vek
	uO7x0dJO8yp8lKt0tevs099IEAzDukEQjYtQppfpAXdIMWAi5t5hRMmQo7MwQDzMrUBgGnCQCRA
	7HsbPzP0qrDCRfQq5OPq/nOeaL4YD2uQ=
X-Received: by 2002:adf:ec8a:0:b0:236:5b80:da83 with SMTP id z10-20020adfec8a000000b002365b80da83mr7858628wrn.509.1667222835987;
        Mon, 31 Oct 2022 06:27:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4XoYVkE5jE7vlhuKQ/BuqMv6qQj/pE66jVA36/qVXv1WZdIDiMFN0/ixJs2zjwBzGxtBPgyA==
X-Received: by 2002:adf:ec8a:0:b0:236:5b80:da83 with SMTP id z10-20020adfec8a000000b002365b80da83mr7858599wrn.509.1667222835772;
        Mon, 31 Oct 2022 06:27:15 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bg37-20020a05600c3ca500b003b477532e66sm25116881wmb.2.2022.10.31.06.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 06:27:15 -0700 (PDT)
Message-ID: <0fe3974c-de66-9eaa-b56a-ed1d07644e4c@redhat.com>
Date: Mon, 31 Oct 2022 14:27:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 14/21] drm/fb-helper: Rename
 drm_fb_helper_unregister_fbi() to use _info postfix
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
 <20221024111953.24307-15-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-15-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_062719_409758_D7E95FA7 
X-CRM114-Status: UNSURE (   7.02  )
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
> Rename drm_fb_helper_unregister_fbi() to drm_fb_helper_unregister_info()
> as part of unifying the naming within fbdev helpers. Adapt drivers. No
> functional changes.
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
