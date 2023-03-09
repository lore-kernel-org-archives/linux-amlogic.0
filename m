Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721C7C61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 11:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Po+ZQShSUBvhBgO0Sppi4ix4D9HDRWQMBcE56Piy99g=; b=Yf8jJYzN4OzuVX
	epvpfA+ddwbbNlt8MuszcKVwwDGDjiscxFMEKKiqO2wvybM6zLVlBbXqLGsA1iZSxm+iqDka10aZD
	3vR6qstAyYwaOom4P2q3p8okV05sIesqvcautWtm64nLIitnU669+0EplofEhHPIcFb8lbCoV7HYh
	MZkgN4opEbxHZP6INu3066fws4GjXY2gSGSJ+M44nY/NOify71c88J5b9qzXWkDPs/aetsbJyDT6/
	z6QGqfbMNnfRieed3Gfou60kWIx+HdtvXsUHryK4UT7Q0kGJZr+CoW1hbdNIg40av+JryNVlv5HPP
	mJpBcRCbj0cws4DyYnaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEnA-009fZa-QX; Thu, 09 Mar 2023 11:50:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paERj-009VJX-2q
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 11:28:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=byuRJFsgwIbmwDoClgXjpGIRY7fzH9iO0cMStxilik1zPmdx7J0FLlIb5ch1zowP9Qs8Md
	1hQ+angNnLqqW5CPIQgTMWFQusJw3av0PZp3pMUI6QgOcylvGMWAprKL7ybDnp6aBLIdhS
	n7iYiQPDhJHLsFHs9yn2X4AobuDRLBQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-A4Up0A31PLSahHNAfNTLNA-1; Thu, 09 Mar 2023 06:28:28 -0500
X-MC-Unique: A4Up0A31PLSahHNAfNTLNA-1
Received: by mail-wm1-f71.google.com with SMTP id c7-20020a7bc847000000b003e00be23a70so2261789wml.2
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 03:28:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361308;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=tePMdyhzFUoWT+nyfObxSHtpm0h0m682salzRax+bd4q1NL4rTRpwo1GfelDHc77+7
         BdQXKhXkr1BILAsTNccoWbPfhQcTRYOySq3Uv0gXph/iE5DWO15OPMqeTXV7txQubk3a
         3nDyMBBa4kHUuZD08rLOeQk5R25mgoeDyw50Z6oRh26OOw3UHakeozeGevf6yiIXdxpZ
         HCMHBk0EE/VMKtoaZzfB9gF1qyJW3zD/39Sw5d5+b9iijT3AfnpdCWPVUiwO/kRLP8ZK
         lzUpT1dBN+sR3sMw9yVj+DqK3k4RFab97CqSzZSBK1JSw82HWH4uY5qVupvVbob0LsOJ
         mu5w==
X-Gm-Message-State: AO0yUKVwJgNukjwuO4tNemYvard6TPtsdyHm7aOYpglWNuQbWrD+4/Ij
	m9WUtkLtID+gdxcL+2RNvIJulYXhxp3n/CqrL5XgW9L4SvyugW6UpIJqW3AYW/TA/ki7ujVpktP
	OOSTrIkV0xVC7/huAgBRjrG96mzNeR6Y=
X-Received: by 2002:adf:e54b:0:b0:2ce:7b14:62fa with SMTP id z11-20020adfe54b000000b002ce7b1462famr5641275wrm.18.1678361307867;
        Thu, 09 Mar 2023 03:28:27 -0800 (PST)
X-Google-Smtp-Source: AK7set9maKowzBLXhrmVUURVySuRkGf+S+tkdt6mfteqqV00Jt+aM76M3w51SKUbdQy9Rrz6LZ2GlQ==
X-Received: by 2002:adf:e54b:0:b0:2ce:7b14:62fa with SMTP id z11-20020adfe54b000000b002ce7b1462famr5641233wrm.18.1678361307645;
        Thu, 09 Mar 2023 03:28:27 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id g11-20020a05600c310b00b003eb68bb61c8sm2498550wmo.3.2023.03.09.03.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:28:27 -0800 (PST)
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
Subject: Re: [PATCH 20/22] drm/tve200: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-21-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-21-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:28:26 +0100
Message-ID: <87bkl26u5h.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_032831_218369_EA3CBC4B 
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
