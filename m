Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0561C64EC4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 11:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Po+ZQShSUBvhBgO0Sppi4ix4D9HDRWQMBcE56Piy99g=; b=X/WggAL+Vg0s6X
	BEaBrSQ0ztdtbdkLOEhodXym01Qzp4uxEaz1T+pcVrVKPblE/JoHeBV/FndeyfEppdJj2Uj7wLRk1
	qgJs5thvkXBOfrxYMVJdJcy89EhbbRGhkG5v0RgyCQGAV5+DvUZ0BMZuCPivRvaB02dtLXk+qdkCb
	azCLB1fTJ9fcNctxA8H2zYV+K92qwYjX+nzi68rMO2VEb6UDHFKk/gkd8GJ6tzx2urBHEQI9jk7Jw
	NoJVGVyMD/NwJZhCo5go6iDT6PIAwEHA1G7WE9bn37mgXKdl8ceRWKZ9+DC/+teWtbn9g28TVJ4JR
	eZIDitHtXYe9PYYdX2eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEp8-009gWv-8t; Thu, 09 Mar 2023 11:52:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paESJ-009VdC-SO
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 11:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=GwcBUxVB+lcW/SEYDIvZBUIgdsMu4u6EixY/rjJ9d3AJb6JkeOwrV8LUmZzfgVc6EDO0Ep
	P2YFbSIO0gifQl3we+FABKfRpPmerO9PTAic5dciOVqkjKzM/fbk/KYFTizHiBSMo6kcpS
	RYyj+W2LOpsVhdeXtR9TfIRdMbFgEyg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-bsb08cqjPpmkjGnXMVXWew-1; Thu, 09 Mar 2023 06:29:05 -0500
X-MC-Unique: bsb08cqjPpmkjGnXMVXWew-1
Received: by mail-wm1-f71.google.com with SMTP id 4-20020a05600c024400b003eb2e295c05so554275wmj.0
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 03:29:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361345;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=qCMTdwHQgS9cu7k8qJf81ifybJIj7o0yl1irH2JmAPgwMGFtCYbqcykCr/bUe8PZ9R
         9ALRvl+Ct1CkcJBNz65GsSkrb+Jif3Ilqo0c0F9qcwbqxpfjROk0//Mk14z/sPDIecQi
         cegNcLp7fZgIYmGyEDEtEfb08So6brLi6Ys7Ti+hgzvMx41ns2SOBFwqJljv4BssLTAM
         E44bt0M1ZyP9JhxTZwWJmOMzflh8skdPUgEWGVDcL/Efpphk50A+v0grWcSC9AHpjf5T
         zg+xIx1EOdA2EzeEHba5PP9GeePyWaL60df+4iYeDQF+CD+MB5ylFVH7LkSntAX8M9I4
         xJvQ==
X-Gm-Message-State: AO0yUKXrHyAnSwz9frQMJ4J2Vcbq+AuTYELq6fTe+rcUQf3ASXNIBmPt
	UlWJz5W+I8MgnpWMiomC8XHqn3vzerVxbffuHwZBE865mbrwtbEPhS5ExV2NEg0Z5SFv7RIP/fm
	y1DFYc+nMe5yU65EmjkgCNsyWVpTESA0=
X-Received: by 2002:a5d:6505:0:b0:2c6:e682:e55b with SMTP id x5-20020a5d6505000000b002c6e682e55bmr11934457wru.48.1678361344738;
        Thu, 09 Mar 2023 03:29:04 -0800 (PST)
X-Google-Smtp-Source: AK7set/SuOlGzNjzuB+/71QhRoDFVzQZ5KDl1yemHeUwxjB4OayINr1XWjAGx9mSH74oqRW7vJe0XA==
X-Received: by 2002:a5d:6505:0:b0:2c6:e682:e55b with SMTP id x5-20020a5d6505000000b002c6e682e55bmr11934447wru.48.1678361344548;
        Thu, 09 Mar 2023 03:29:04 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bg2-20020a05600c3c8200b003e214803343sm2615371wmb.46.2023.03.09.03.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:29:04 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, andrew@aj.id.au, laurentiu.palcu@oss.nxp.com,
 l.stach@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 p.zabel@pengutronix.de, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, alain.volmat@foss.st.com,
 yannick.fertre@foss.st.com, raphael.gallais-pou@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, jernej.skrabec@gmail.com,
 samuel@sholland.org, jyri.sarha@iki.fi, tomba@kernel.org,
 linus.walleij@linaro.org, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 22/22] drm/xlnx: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-23-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-23-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:29:03 +0100
Message-ID: <875yba6u4g.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_032908_045513_52F2C12A 
X-CRM114-Status: UNSURE (   6.56  )
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use the fbdev emulation that is optimized for DMA helpers. Avoids
> possible shadow buffering and makes the code simpler.
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
