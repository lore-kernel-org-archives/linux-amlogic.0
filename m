Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FF1C64EC4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 11:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=EwYtG2ejONr37sQFi2QsjxpfpqkL/OxyEKuH10Ephx8=; b=weF
	GQ+8498yEAjB1Js7xoomC1FP/Dl5x9B84Qdly7//A9bcQ7pjAlB2KSlinj5QLo/1G4sFvxTYEwE+M
	tiZsVCiXQH4hvKyJpK3V5+Jsjxd9YlDX07C308RcJSdWXSK/ZJFV4LeXccvHxvNuhWBXPav9Eij9I
	okRqEpofIVrnMCbgft+LI8Kgcqh/jvz8oMFacCDM5M4EQ14Ei1b84rqk6Ia5o21FkS02bIs0emwqh
	+3TI9uFbqEwOQg32TTu7O4vxmBDJ4MXLxIh/9yH7xXmNgmwDAvVvhl2cPYgQRikvR1reMV/n53DCF
	KwuV8k+/tlZptUm7ZGjcV3UPlI2Odlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEOV-009TVg-Sc; Thu, 09 Mar 2023 11:25:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paE4c-009JSJ-Du
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 11:04:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678359875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=rIKq23+uaKpJ1OE/0bOsZp271hw8KGnFAFpE9HnsfKM=;
	b=PeYuYhxH9BCdeO/ViemcYdtNtEu5dbcJR5Rix1vQpVQjCA1O8hwbtgyITkup+EEtNM9nTW
	phznnx7/DVI65NVO57jMez4UZDOeTfmXLBcFJUcbQJloTZ3io2LxW7SCg6+673s2N6xO9C
	ENxsH/lyhjGoJvsuhYBOX2q37y1md+M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-xTlk7yMQNBiS5juJSKO-UQ-1; Thu, 09 Mar 2023 06:04:34 -0500
X-MC-Unique: xTlk7yMQNBiS5juJSKO-UQ-1
Received: by mail-wm1-f69.google.com with SMTP id j6-20020a05600c1c0600b003eaf882cb85so627240wms.9
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 03:04:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678359873;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rIKq23+uaKpJ1OE/0bOsZp271hw8KGnFAFpE9HnsfKM=;
        b=PviJ2nYJTnsWvdtn4z2iPG9XlbYaV+KnMW9B0+7/cJ0J/bIBw4xxClPsXchh7lQPPU
         jB9EKlFlkdqYdkcHl9jrZhVgVtuNenKvAqMRu9GLhCDTbQfBRDXdkmNitLEltWeloGMa
         WNloOO7f8u3IaETMl1VnC/uL1twNqWngXjrMAdmzfXP6JTbct3fcoGZGQjBBJRPWUQxk
         nOlJ679hoFyNKaGZyxe/uxk+FNQIxXTa5Fnaojx2xffe7xQtoG4cuCBJVMnElzAjfO8K
         xxjg41hi36s8xdYuZ0a6n0XNazNm7460RhVINyT8wNsracxsWLZHsOuXeBvuedEMtm2s
         ruLg==
X-Gm-Message-State: AO0yUKUMW4Iag988rPHEh9KQkFNHhNCk67gpI2ZoISA4vh08N4porX6C
	nYqj7u/piJUKfnoNy6R1tOxj5iI5vFe0GjHHLKxzeII8R5WwdW1Kjar60p7PbGtuoqzgkUrosWl
	liQdeNSBcG8R4PRIKTP4nscLutyPLnug=
X-Received: by 2002:adf:dd4d:0:b0:2c7:dfc:47a8 with SMTP id u13-20020adfdd4d000000b002c70dfc47a8mr13928119wrm.66.1678359873464;
        Thu, 09 Mar 2023 03:04:33 -0800 (PST)
X-Google-Smtp-Source: AK7set/WEjfKPC+jhxXW6ijuedDfyidmiJJoYJDI9DsQt9cbEhaxwvCHVmnIbZ4cOwrnEzJA2b9WDA==
X-Received: by 2002:adf:dd4d:0:b0:2c7:dfc:47a8 with SMTP id u13-20020adfdd4d000000b002c70dfc47a8mr13928071wrm.66.1678359873107;
        Thu, 09 Mar 2023 03:04:33 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id o6-20020a5d6706000000b002c573778432sm17174423wru.102.2023.03.09.03.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:04:32 -0800 (PST)
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
Subject: Re: [PATCH 01/22] drm/fbdev-dma: Implement fbdev emulation for GEM
 DMA helpers
In-Reply-To: <20230301153101.4282-2-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:04:31 +0100
Message-ID: <87o7p2p4n4.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_030438_598151_99431D9E 
X-CRM114-Status: GOOD (  37.06  )
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

> Implement fbdev emulation that is optimized for drivers that use
> DMA helpers. The buffers may no tbe moveable, may not require damage

"may not be"

Is may the correct verb here though? I guess you meant "shall not".

> handling and have to be located in system memory. This allows fbdev
> emulation to operate directly on the buffer and mmap it to userspace.
>
> Besides those constraints, the emulation works like in the generic
> code. As an internal DRM client provides, it receives hotplug, restore
> and unregister events. The DRM client is independent from the fbdev
> probing, which runs on the first successful hotplug event.
>
> The emulation is part of the DMA helper module and not build unless
> DMA helpers and fbdev emulation has been configured.
>
> Tested with vc4.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> +static int drm_fbdev_dma_fb_open(struct fb_info *info, int user)
> +{
> +	struct drm_fb_helper *fb_helper = info->par;
> +
> +	/* No need to take a ref for fbcon because it unbinds on unregister */
> +	if (user && !try_module_get(fb_helper->dev->driver->fops->owner))
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
> +static int drm_fbdev_dma_fb_release(struct fb_info *info, int user)
> +{
> +	struct drm_fb_helper *fb_helper = info->par;
> +
> +	if (user)
> +		module_put(fb_helper->dev->driver->fops->owner);
> +
> +	return 0;
> +}
> +

These two functions are the same than what's used by the generic fbdev
emulation. Maybe they could be moved to drivers/gpu/drm/drm_fb_helper.c
and be reused ?

> +static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
> +					 struct drm_fb_helper_surface_size *sizes)
> +{
> +	struct drm_client_dev *client = &fb_helper->client;
> +	struct drm_device *dev = fb_helper->dev;
> +	struct drm_client_buffer *buffer;
> +	struct drm_gem_dma_object *dma_obj;
> +	struct drm_framebuffer *fb;
> +	struct fb_info *info;
> +	u32 format;
> +	struct iosys_map map;
> +	int ret;
> +
> +	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
> +		    sizes->surface_width, sizes->surface_height,
> +		    sizes->surface_bpp);
> +
> +	format = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
> +	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
> +					       sizes->surface_height, format);
> +	if (IS_ERR(buffer))
> +		return PTR_ERR(buffer);
> +	dma_obj = to_drm_gem_dma_obj(buffer->gem);
> +
> +	fb = buffer->fb;
> +	if (drm_WARN_ON(dev, fb->funcs->dirty)) {
> +		ret = -ENODEV; /* damage handling not supported; use generic emulation */
> +		goto err_drm_client_buffer_delete;
> +	}

Should we have a similar check for drm_fbdev_use_shadow_fb(fb_helper)
and warn on ?

> +
> +	ret = drm_client_buffer_vmap(buffer, &map);
> +	if (ret) {
> +		goto err_drm_client_buffer_delete;
> +	} else if (drm_WARN_ON(dev, map.is_iomem)) {
> +		ret = -ENODEV; /* I/O memory not supported; use generic emulation */

I also wonder if here and above instead of the warn on, there should
just be a normal check and print more verbose warning messages.

[...]

> +static void drm_fbdev_dma_client_unregister(struct drm_client_dev *client)
> +{
> +	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
> +
> +	if (fb_helper->info) {
> +		drm_fb_helper_unregister_info(fb_helper);
> +	} else {
> +		drm_client_release(&fb_helper->client);
> +		drm_fb_helper_unprepare(fb_helper);
> +		kfree(fb_helper);
> +	}
> +}

This is again the same than drm_fbdev_client_unregister() so I think
that can be made a helper and shared bewteen the two implementations.

> +
> +static int drm_fbdev_dma_client_restore(struct drm_client_dev *client)
> +{
> +	drm_fb_helper_lastclose(client->dev);
> +
> +	return 0;
> +}

Same for this one.

> +
> +static int drm_fbdev_dma_client_hotplug(struct drm_client_dev *client)
> +{
> +	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
> +	struct drm_device *dev = client->dev;
> +	int ret;
> +
> +	if (dev->fb_helper)
> +		return drm_fb_helper_hotplug_event(dev->fb_helper);
> +
> +	ret = drm_fb_helper_init(dev, fb_helper);
> +	if (ret)
> +		goto err_drm_err;
> +
> +	if (!drm_drv_uses_atomic_modeset(dev))
> +		drm_helper_disable_unused_functions(dev);
> +
> +	ret = drm_fb_helper_initial_config(fb_helper);
> +	if (ret)
> +		goto err_drm_fb_helper_fini;
> +
> +	return 0;
> +
> +err_drm_fb_helper_fini:
> +	drm_fb_helper_fini(fb_helper);
> +err_drm_err:
> +	drm_err(dev, "fbdev-dma: Failed to setup generic emulation (ret=%d)\n", ret);
> +	return ret;
> +}

And this one.

> +/**
> + * drm_fbdev_dma_setup() - Setup fbdev emulation for GEM DMA helpers
> + * @dev: DRM device
> + * @preferred_bpp: Preferred bits per pixel for the device.
> + *                 @dev->mode_config.preferred_depth is used if this is zero.
> + *
> + * This function sets up fbdev emulation for GEM DMA drivers that support
> + * dumb buffers with a virtual address and that can be mmap'ed.
> + * drm_fbdev_dma_setup() shall be called after the DRM driver registered
> + * the new DRM device with drm_dev_register().
> + *
> + * Restore, hotplug events and teardown are all taken care of. Drivers that do
> + * suspend/resume need to call drm_fb_helper_set_suspend_unlocked() themselves.
> + * Simple drivers might use drm_mode_config_helper_suspend().
> + *
> + * This function is safe to call even when there are no connectors present.
> + * Setup will be retried on the next hotplug event.
> + *
> + * The fbdev is destroyed by drm_dev_unregister().
> + */
> +void drm_fbdev_dma_setup(struct drm_device *dev, unsigned int preferred_bpp)
> +{
> +	struct drm_fb_helper *fb_helper;
> +	int ret;
> +
> +	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
> +	drm_WARN(dev, dev->fb_helper, "fb_helper is already set!\n");
> +
> +	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
> +	if (!fb_helper)
> +		return;
> +	drm_fb_helper_prepare(dev, fb_helper, preferred_bpp, &drm_fbdev_dma_helper_funcs);
> +
> +	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_dma_client_funcs);
> +	if (ret) {
> +		drm_err(dev, "Failed to register client: %d\n", ret);
> +		goto err_drm_client_init;
> +	}
> +
> +	ret = drm_fbdev_dma_client_hotplug(&fb_helper->client);
> +	if (ret)
> +		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
> +
> +	drm_client_register(&fb_helper->client);
> +
> +	return;
> +
> +err_drm_client_init:
> +	drm_fb_helper_unprepare(fb_helper);
> +	kfree(fb_helper);
> +}
> +EXPORT_SYMBOL(drm_fbdev_dma_setup);

And this one could also be shared AFAICT if drm_fbdev_client_hotplug()
is used instead.

> diff --git a/include/drm/drm_fbdev_dma.h b/include/drm/drm_fbdev_dma.h
> new file mode 100644
> index 000000000000..2da7ee784133
> --- /dev/null
> +++ b/include/drm/drm_fbdev_dma.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +#ifndef DRM_FBDEV_DMA_H
> +#define DRM_FBDEV_DMA_H
> +
> +struct drm_device;
> +
> +#ifdef CONFIG_DRM_FBDEV_EMULATION
> +void drm_fbdev_dma_setup(struct drm_device *dev, unsigned int preferred_bpp);
> +#else
> +static inline void drm_fbdev_dma_setup(struct drm_device *dev, unsigned int preferred_bpp)
> +{ }
> +#endif
> +
> +#endif
> -- 

And you should be able to drop this header too if split the common
helpers from drm_fbdev_generic.c or maybe I'm missing something ?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
