Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46307C64EC4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 11:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Po+ZQShSUBvhBgO0Sppi4ix4D9HDRWQMBcE56Piy99g=; b=o4W6U68KCZG78S
	z3Bdk0JXD7xwsPQ2VzL5EUuepZm+VMXuXEAa0qy1G6G3p9y+MqJu/OetbYHqsLiSupmgTK5kVvmW0
	hYw7Rlwj+jKLkjIX1S+5QG/Zg0ziskugYC/ADzBiRyPtoG4RI8rRLd1ltKEYBrmDpxzDDG3IEBqbv
	17d+rZezlKmglH3rk5z9NOyg54F6/s0hJjkqHwnWCnz20+FalqYo/7ZJQNBfSoPpjsEVXWAG0UVJm
	KRbSNi+WHfXbz4Oj9m/i1zuVqE7lo/q1mDSqA6hZ+1J7DwNshFLFnzco2uHR1pK0ynfZoNhcg/RMy
	IqjSiG2j3/FlU3oJwSVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paETz-009WX9-4O; Thu, 09 Mar 2023 11:30:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEHl-009PeF-Nz
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 11:18:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=Q1AOpfNjOxvAZETLXJ3cfQNQDRtqZl5XqWjuhR9Ks4YTtlnDz9eoHhtfM3H4QOpF67nuoc
	ualrTISMJpGPYc4U/J782WtzMxZbPPwiYNgM+hZocunVuj155Gf9QqD/4NuvicVITIJSby
	rnoH6F1bFB6Z7XOZgYRy2YATEK8wee0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-wW-ymVBXPKqnaF8lfFszKw-1; Thu, 09 Mar 2023 06:18:11 -0500
X-MC-Unique: wW-ymVBXPKqnaF8lfFszKw-1
Received: by mail-wr1-f70.google.com with SMTP id a7-20020a056000188700b002cdd0562b11so348395wri.11
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 03:18:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360690;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=AcstAKhrVSogyV2jJTzkIz8DnFoKuWiCRBDE8fjXqACMLs/S7Jr8UVH79cJsfIi/7H
         VKIRwhPqM91Zbwyxc1O3BDAq25w9BuQv5vO/E1/SfYt6HMN14ZJdFYPwKJD4QxgRw9Oa
         tcstfZSvvQ+zMm3NRpGkF1Z8pIOcqcr2mvFREFcevf+beU7M6zd5Ir9BoH61yekW8IsQ
         CfFCl33NDhv5vUV99xr7N4mHs3qUEJIZnj/wMPc/YXVc3eGeS2ADbbucHsP5hVqbB0QU
         zvZffds+Hfz0lfNeg/VGRMKZ3zdwSM4IBJUBtg0vuufma/jSnYyrf+xA8ocXuHazKuCe
         x3yw==
X-Gm-Message-State: AO0yUKUuZikCh/cczPssXlcsWDBczFmQVkuyewd99WIKH59UKMRyi7kn
	MHG/+6cKvDBB0c+2Zyb9MHwWbtBQIYDOoz1IUqa2GCtETS0tYFXleVPdHvGbKlp7XWd3yShpUBk
	i3ilxrNbAghOmW5ywT5IsyFIioLXiJD8=
X-Received: by 2002:a05:600c:458b:b0:3ea:d620:570a with SMTP id r11-20020a05600c458b00b003ead620570amr19256925wmo.38.1678360690501;
        Thu, 09 Mar 2023 03:18:10 -0800 (PST)
X-Google-Smtp-Source: AK7set8nz/b/mv461MJo6uCh18V+HWYnANd/m5ucTuXO+pUDMtWMOWVVOePuNeDpPXiYp2Mt7j7R+w==
X-Received: by 2002:a05:600c:458b:b0:3ea:d620:570a with SMTP id r11-20020a05600c458b00b003ead620570amr19256887wmo.38.1678360690262;
        Thu, 09 Mar 2023 03:18:10 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id 16-20020a05600c229000b003eb2e33f327sm4775721wmf.2.2023.03.09.03.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:18:10 -0800 (PST)
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
Subject: Re: [PATCH 03/22] arm/malidp: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-4-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-4-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:18:09 +0100
Message-ID: <87v8jacgwe.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_031813_916969_027D52F7 
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
