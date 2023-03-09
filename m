Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3987EC64EC4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 11:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Po+ZQShSUBvhBgO0Sppi4ix4D9HDRWQMBcE56Piy99g=; b=2eA9AWoHWN501q
	KaMGZLU1yss4z7lQim4R7HfpjdZ8OfhY4zqoov1An+ppT0rB7WPyAKqZNASeJjHyuDuUtkjOesK1S
	+VkYBWLfFOG38LzAhqiKxrFLAr3WeilrYZ0Ob3vhsb+s8g0EKdaRgM78bsiseEG1K1/3NwJE0EUPY
	NgwNr//fI3FCwmpDAMiwEjLxHF3C4MTWrcqYUIQCoWoFQSVv/MSNmxo2oIGOBiTWlIozW8gJwqXTG
	Q4mAI3vEU3jcxPeOxy/91oMQOLVMEXWOG2PgJxt408DSZIwbtWYIlJowdvoCYU1q/ncSEenlu+z6t
	1sPV4RjIRcLl27sX2paw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEjn-009e0X-0x; Thu, 09 Mar 2023 11:47:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEQD-009UTW-TH
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 11:26:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=d0N6c/UwBgEz/bFY0nRuZ9Q8tZF9SdSHeNfw6HgDIBTVHGMidBjSuCms2/LH9vuR3KDO9p
	+Biqhn7k0D+f6ZjZedwhc6sRNhOCyoPh3UiaUhRQjJsl5QDryS5DAR6dHKO3EOJs2oPIyg
	ZGaRkmXIz6U5lVwolcKnyWgVT6X0zY0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-Ys5BSX_dNHyX9pcD_cYugA-1; Thu, 09 Mar 2023 06:26:56 -0500
X-MC-Unique: Ys5BSX_dNHyX9pcD_cYugA-1
Received: by mail-wm1-f72.google.com with SMTP id k20-20020a05600c1c9400b003e2249bd2b4so543793wms.5
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 03:26:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361215;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=P/rna9OJ+xUj87U33Xd1mYllZknkcohRQCC7z5nkxzsfCqXDJj/Rp4TutsMJMPOS+d
         iUk6HTquLsYSB1cGOW99qq6zcTbt1rkEZ8p6ganKEnauzsMqbtzggx0I3VWDDaAULfPD
         ZRS0fyoWAshJDQvyhE53QoOsWenKWQPjh6i6P2yOVjrVxAWyQoCPGysUgWrmYXT2OY/p
         VFaaMoNCmt8+lG3uHc2tDxADud3vInh7gvFj71ZwRggoips63Awxseo+XWh7AGxEhNKd
         dAFs6IjE29nTe7dAjJ0QEw0bUNYZFYr8YgL0WNqec/mCe9Zhlgk6SJKSmU/b5W6ifuWH
         hOLA==
X-Gm-Message-State: AO0yUKXtNNM6yeiKMND8oHfqb30uGVzpjJ5lNYf3X+qRMSuGYSLD0m8k
	XwRsP935TPgaqoZTJUt1OZIaKYzR873nf3KF+23mcZ6uto6591leSzU1HD+xBp/G0tekULUySkN
	v58abmQTwT99t+P8K2PFrt3bqdipbAg4=
X-Received: by 2002:a05:600c:19d2:b0:3e7:95ba:e1c7 with SMTP id u18-20020a05600c19d200b003e795bae1c7mr19013896wmq.32.1678361214950;
        Thu, 09 Mar 2023 03:26:54 -0800 (PST)
X-Google-Smtp-Source: AK7set+ootXMCqEk3gOIZKrqE6NGC6vCRZefQop/jJ1mx2KmfjNSeFee8+geTPWhVxDzmhIrEN6nCQ==
X-Received: by 2002:a05:600c:19d2:b0:3e7:95ba:e1c7 with SMTP id u18-20020a05600c19d200b003e795bae1c7mr19013869wmq.32.1678361214645;
        Thu, 09 Mar 2023 03:26:54 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id 5-20020a05600c230500b003db01178b62sm2249369wmo.40.2023.03.09.03.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:26:54 -0800 (PST)
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
Subject: Re: [PATCH 16/22] drm/sun4i: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-17-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-17-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:26:53 +0100
Message-ID: <87mt4m6u82.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_032658_034915_E1612F7C 
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
