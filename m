Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0908C64EC4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 11:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Po+ZQShSUBvhBgO0Sppi4ix4D9HDRWQMBcE56Piy99g=; b=3gFX/mj+4XRu+L
	dekfnpjKPYcKHKvgWp1hPpb06TuTOiGo5g19apsJj22mm6BfsM5DdKNs7nhWAqq9iI01Slk/nvuBd
	kl2CKfmrTZ1M/hQJFXAebmnJYG6vNZTYQPZ7IUuJb6Fau0TImthm/98re2gmhrP7XAAj7G2yVhVRs
	rPwcevUiBZQEtTWXccQKMX4CFxdbaj4bkT7afuWZkzx8PoOeY7M4V9zCQo/zgeKaej16poxkiiYxD
	Er8jOwEV3Viqrooebu0NqK8y0gAuXvudjLoZMEyNW9AeVnRDY+DlWpPZxn/FRWjKYftZdbIHNE2Gh
	y4oARTdrbS+2Y+QB2iQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEUk-009WzL-HY; Thu, 09 Mar 2023 11:31:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEJa-009QhN-Pu
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 11:20:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=SFZp/Og4GvnTEu2G65f1o9EoAFNv75FpzmUCue1CfPD1ONDU2GoXDqwFjHXEH49NuoWmO7
	167/uyGqnDuBrx9ar7A9B4zKPu12ZXEXDCUXXfcZn4hobPJwqZv8Bs9pQCyyZteKDwUMlg
	uu2Hi6mwYIKMJxFrs4GebxZrRcC1wHs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-rRbTwdO6Mty8UlEh3FBTbQ-1; Thu, 09 Mar 2023 06:20:04 -0500
X-MC-Unique: rRbTwdO6Mty8UlEh3FBTbQ-1
Received: by mail-wm1-f70.google.com with SMTP id f26-20020a7bcd1a000000b003e71cde0e70so1562838wmj.0
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 03:20:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360803;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=cT+4zHA+wrio8EODVHwBD/e6SfL5NWC/jTOk+cV40AYuJkW1N/t+DQJpVqTPeSl5O0
         lSE7IXmQ0FVg0yzQ6Xs3Z22SBw7Y5wfwXSuHw7dl7Ivcre7WsyXDb9CtecVQ26ptYJWf
         COCpVl4xML0xDfqaIlVRIdj2ac8eBcSXIUMSrhqtzQ4WiHBSCEsdLXhJFAZbqvPY4AVZ
         fwRExJte/pCVfjEJkfGFBFLTcDOMkY4xUWuV7rQ5u325zQWqxi1Z7eywvj8H5DYsOTbX
         KVUjTCV+5WPup7n46XwgS26mmxGjnltNLA49TI6je3KnDU4hoipFXQl/BFhHXX1Y1bIk
         WC1g==
X-Gm-Message-State: AO0yUKW6Al3K39LKsRnZFSWabgMWx6MaZ6YWeNo31JqtHlaXIsFUyMTG
	fFL4Inu0oN7+8p45ZP5HkjTAV3HWLQgPNxIQEBov29JSdhYOrLhHHBjcHptTYYVtpwF0k2ybztZ
	b05wIqzMG0NGArsBWYmkOcHEKo3EcU7k=
X-Received: by 2002:a05:600c:19c8:b0:3e1:bfc:d16e with SMTP id u8-20020a05600c19c800b003e10bfcd16emr19563118wmq.39.1678360803687;
        Thu, 09 Mar 2023 03:20:03 -0800 (PST)
X-Google-Smtp-Source: AK7set/qnVD0YYOZOg0gATaJ95G2PynE58HCE1Dk3DOhH1ATAU++l0OCrumBkXbrdoQMrJSTJfkHMQ==
X-Received: by 2002:a05:600c:19c8:b0:3e1:bfc:d16e with SMTP id u8-20020a05600c19c800b003e10bfcd16emr19563083wmq.39.1678360803370;
        Thu, 09 Mar 2023 03:20:03 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id t20-20020a0560001a5400b002c54f4d0f71sm18023382wry.38.2023.03.09.03.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:20:03 -0800 (PST)
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
Subject: Re: [PATCH 04/22] drm/aspeed: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-5-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-5-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:20:01 +0100
Message-ID: <87sfeecgta.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_032006_961004_23BF3E3A 
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
