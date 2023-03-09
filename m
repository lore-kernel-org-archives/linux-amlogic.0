Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352FCC64EC4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 11:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Po+ZQShSUBvhBgO0Sppi4ix4D9HDRWQMBcE56Piy99g=; b=kYwxg+/1TLisPA
	BILckFejy06h1KticB4o3x9K3C+01gBFoYz0vSzFi/oE2R3M6J28y4rsai8kfiVtMn8jPQsyTM3BV
	8RkBUMoy9tj5IXqy3w9yYfTEVTNAfUv5zbUa8FtJgobT6/dZDMw0jAHlxsuJ+EtbWNFRcSYdnmKjQ
	4dLj16eeBUQiSe/iGq8yFCGRi45pmVasoo68OlQ9Wo9rCRRqldKHrdmyUHF/Rlfs1zn9jnUxzj3wb
	s0p09SJzvT1Jf2ELoOXnxii+mP2LN2aGpOJAmSvPB0f6isVdx1gJ/32R1xGYnUXNfHRc9LzsQyVtM
	hyuWFEQRuJfi0h9/86uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEmP-009fC6-5t; Thu, 09 Mar 2023 11:49:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paERN-009V84-PO
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 11:28:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=U3QmQiwOG2L5ks0Rhj0fWFvBjisjYigNj9RK4QwE10iRclRIRWP1dxaMgh7QXaKqBx6tEl
	YqES2lwLKK+h7t1RYAnnHs3qUJ2IMBj5TMpxlRaHaHXQG2BmjYJNRohplCQ73yrwEtlNOO
	iWI8jeSflcJ8hgywBGCrdayfPplN4Po=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-owPB7hlINBCQeGrR73G4rA-1; Thu, 09 Mar 2023 06:28:07 -0500
X-MC-Unique: owPB7hlINBCQeGrR73G4rA-1
Received: by mail-wm1-f69.google.com with SMTP id 4-20020a05600c024400b003eb2e295c05so553217wmj.0
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 03:28:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361287;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=a0RXkdoKCfKzPvBPnZjl+421gx6coBX1RLdds8pF020Y5ES4gVhD3BOHcf2L0pdnJ2
         EAkLOx1vtqoTp8IEOvuXIzlgV9/7Z+DLhM5JGXCqnCufCQGC3+ueZRYycIMIzQ4gWnzZ
         QwWSQ740yv1cKJxrImUzR1fYO7VjRK4jdfcBfrjcUYh3gthap9oSKxrmBv2/8PG+ZcEU
         euup4Lxu70owxcMzpdzgBwZry5CFI47RrpxscscQCEAxKtUptmOggwPQ4Rz3EMNBzpBK
         kCeGCDSWR/nkadT04c5JMg8osbIyk224mLl7oHvHQjBZW2DFEopBveOQla2xARjuGcJu
         by5g==
X-Gm-Message-State: AO0yUKWAYtPoiGPBIBNEEwCsLm532EpMKlzUmUtu8Vl+raKFDspaMIs4
	6YBOpFhb+zmshWx/nvp9YFEhq8loGZLhXQGpQVkYTIlSm51/c9pGwhuxaDOjlzIGJ0w7Mttmztm
	HLg+EI5TNZnjjo/9dF9a6BAqA6GN9WWQ=
X-Received: by 2002:a05:600c:45c6:b0:3eb:2e1e:beae with SMTP id s6-20020a05600c45c600b003eb2e1ebeaemr18094371wmo.25.1678361286863;
        Thu, 09 Mar 2023 03:28:06 -0800 (PST)
X-Google-Smtp-Source: AK7set/WVkqnZjpkmSmEiWhaQK18CsrOsasLB6GMCz1AC0uyDvVk4dRPtB1UV7OYFbDbrMsIDiabKA==
X-Received: by 2002:a05:600c:45c6:b0:3eb:2e1e:beae with SMTP id s6-20020a05600c45c600b003eb2e1ebeaemr18094343wmo.25.1678361286535;
        Thu, 09 Mar 2023 03:28:06 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f10-20020a5d4dca000000b002c70bfe505esm17395825wru.82.2023.03.09.03.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:28:06 -0800 (PST)
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
Subject: Re: [PATCH 19/22] drm/arcpgu: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-20-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-20-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:28:05 +0100
Message-ID: <87edpy6u62.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_032809_943719_48EAD4C6 
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
