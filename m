Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3F7C61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 11:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Po+ZQShSUBvhBgO0Sppi4ix4D9HDRWQMBcE56Piy99g=; b=pIwrn2JpktLoC/
	lLkZMjF2mBfvkdLsdfej6HDZq09BzrN9JjKbl1UdE1GI0IIccS0yAdJQ2jCIXUK+fY1WeSa3E8KjZ
	LgTyRbNRflKfjK+rJW9byfNtgBDEBC6SfzHbuoRQqq1aRjarjb89o4D+nrthO4K+Ix1xSsd/86HKf
	vgcyRf7hKrO+KnbCGyQ5/StcT9KHDIqavyFd+j/bvPiFEiJkrX1wzpRexQsl4tq1ZkiwwFjKIB3IH
	ayrZd6cIrh1CwyOTfhzzkSM+f6HBjI7DRFJPvZtcfryYZ6LfKnbwBtymur1qOHDWF0GvumIJ0bcgs
	c9ZMTHhqJwP5lJHsIy+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEWn-009Y2g-4R; Thu, 09 Mar 2023 11:33:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEKB-009R2x-2d
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 11:20:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=VcaBdZhCNdA2qk6UngItWJM2Zsy2DJgYqGVMFCWRvl2uWu5Gf6grEEm8MtDqgnEQOVVCSZ
	6lPELiORVZeOuFVO5ki1VzOQEEKPUqb0hmKe8AcxVHfoKFJFKu1elPmlfWzx8ZlnctBgds
	bD7pwk4/dRg+d/FRy30yDu9hm+zGeZc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-L30UdUEANH-pRn0mMjfM0w-1; Thu, 09 Mar 2023 06:20:41 -0500
X-MC-Unique: L30UdUEANH-pRn0mMjfM0w-1
Received: by mail-wm1-f71.google.com with SMTP id e22-20020a05600c219600b003e000facbb1so2239963wme.9
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 03:20:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360840;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=HtSTUwQJCwzdm4Fop75151MvAphQ5t7KRKSPlTqUed0osQDuGntSDsqdBROsXn4fjX
         NyZ7ZTJMEtfBO0IVPHy+SRDAxpCmf2GFyaFTw4eIUF82MKWPKP5XO/VEhAH1FfKxLiaB
         D7+uhlUl+wVG6cK9XmEbNnR56AJ0Ro5DPeabZdjOtI1tTRSLCdRTGpXJ9fEB1VRF1KuL
         FLgXB3WPcy8fYlhz7ZAu+Ck4gD+6q2H5/nzzGbk5rlIeFIlALq1oIzrTcrchwPDWigX9
         9s3k+o6zfss+43eU8bwlG5+qmE0kjRqAk610R9Ngk7Mtp45RmJ2R5axLmm9SBzgEw/mp
         r4Eg==
X-Gm-Message-State: AO0yUKXTpugpwiM14IFqDu1lhQwnQ2Bb2lv0EbjCnsn6A0/LKUh3urQq
	dcZA/TFFNXvgXLBBMpK9pdOgX+EFIilWNXhofsyQOVUr8fIgiEnBA59T/V8yYz0pESIr5rfPamN
	ff6ihhyk46pxEfOuX9u9pfxMkHlHNj14=
X-Received: by 2002:a05:600c:4449:b0:3df:e659:f9d9 with SMTP id v9-20020a05600c444900b003dfe659f9d9mr17924816wmn.34.1678360840102;
        Thu, 09 Mar 2023 03:20:40 -0800 (PST)
X-Google-Smtp-Source: AK7set90uCM0Kw514Efx0RC1JOWrOFPoY3H9ZtCG8DZJ7CZ4XdZwaIBFGLtcMSgQBx3eBGbTb1Y4bA==
X-Received: by 2002:a05:600c:4449:b0:3df:e659:f9d9 with SMTP id v9-20020a05600c444900b003dfe659f9d9mr17924778wmn.34.1678360839923;
        Thu, 09 Mar 2023 03:20:39 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id az5-20020a05600c600500b003eaf666cbe0sm2386747wmb.27.2023.03.09.03.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:20:39 -0800 (PST)
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
Subject: Re: [PATCH 06/22] drm/fsl-dcu: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-7-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-7-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:20:39 +0100
Message-ID: <87mt4mcgs8.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_032043_250801_14A8AE52 
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
