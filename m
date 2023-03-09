Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19CBC61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 11:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Po+ZQShSUBvhBgO0Sppi4ix4D9HDRWQMBcE56Piy99g=; b=NXHQ4Bc8mUGXl7
	wc6xf5d5oYBWm6upUIzXBRJDRGtnG5x6Gx6lz9k9/qMd7mSjw0cNVIgENOQrScpqUZwxgjwxFRRCk
	0Dtm+4ySbAfbDaQmFSutZFxyZqOWl66jwGiKsq7DIM3rTVxofZEsgIzESDBdeSdieJ9YklZVPCF/C
	GzXaE0bxGVl+0mfT1Zur0Q5n7WBcx5iYVvNyD961DbMJ18dOrL80M3q8pSIfAOFdIK65IKqcU6bgw
	DRvcXWuYXK1xdZprVqN84108HI1Bfu+esp2+2TpXnQzU/ZLN3ROnBaJEqXVsXVFdAuHUeIzloJ61G
	maiQXlfUbFXucNHO6PQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEb7-009aE6-Tu; Thu, 09 Mar 2023 11:38:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEMD-009SBq-8M
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 11:22:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=DQnkNjUvoQtKJKYBHZaepw69JE0SAeCJTfGJ/Hb58PaMvXmDZmAaNCHccwheVNv9X0Heqm
	T4gsUd/IjdZ5ZCnIlHgrjzXKbSrd/Sliv401u1buzRkZsKEaav8Atv9z5nbFCT9GahIoma
	RdrLj+eyFcI0BCcttQGh2goC9Y009Ig=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-3o-KaDSoMYGkEau7CVqL2w-1; Thu, 09 Mar 2023 06:22:44 -0500
X-MC-Unique: 3o-KaDSoMYGkEau7CVqL2w-1
Received: by mail-wm1-f72.google.com with SMTP id m28-20020a05600c3b1c00b003e7d4662b83so2269529wms.0
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 03:22:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360963;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=jN92cmfR+7ie9G7LbhqXHc+iIcxJ8liaVQcddijy3stYHorc4mic85qDXclRIYXz9E
         Il+4InWXBioVcn9LTN1+BeOD6BUVvYWQ+t9yBP2tQBQZRNDEwshj7VEhu4seoHOtp/6n
         FzLpFc62f01zxK1OnwoBspL6jGVOEuzuLXmSjHvc5UzWtvZh28Ld9dkCnGa530wOaleh
         EXMau0/8KS4JgBufh3TNZJfk2aOM+cq4XyIYmpE35NwpxDA/Oura+nOO34s5WXMk5d+M
         xHgKLJ3oCU4sLPQMogcjAmnH2P74eJbn8SKw0WHW1TO5COaonvZK3mEpdAzxnLyFiGcb
         OGsg==
X-Gm-Message-State: AO0yUKWr9po7AVSwkcJzTGhSnq7TZI6D8baMk9CaVAjZvkcTgNfO2gvI
	IcmBElGuHQBFjSqvThG8niPTMY0nzpy58A+VrZlkW5wA/KIVwo/a2GT4j7M79U3/c4r3xLeQh5b
	0BknTLOxKuhnPPZIZKS/FJtMhPcCLyOg=
X-Received: by 2002:a05:600c:1c05:b0:3eb:4501:6c60 with SMTP id j5-20020a05600c1c0500b003eb45016c60mr15506192wms.5.1678360963369;
        Thu, 09 Mar 2023 03:22:43 -0800 (PST)
X-Google-Smtp-Source: AK7set+bXzeTIl7Irwfxa7/DXky+Tf4Fs2Oix8AFpHgk72LnoLDINFW1m3YZeFk72iyLEtfOHY0o9w==
X-Received: by 2002:a05:600c:1c05:b0:3eb:4501:6c60 with SMTP id j5-20020a05600c1c0500b003eb45016c60mr15506159wms.5.1678360963195;
        Thu, 09 Mar 2023 03:22:43 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c458700b003eb966d39desm2539921wmo.2.2023.03.09.03.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:22:42 -0800 (PST)
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
Subject: Re: [PATCH 11/22] drm/meson: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-12-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-12-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:22:42 +0100
Message-ID: <878rg6cgot.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_032249_412457_074E212C 
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
