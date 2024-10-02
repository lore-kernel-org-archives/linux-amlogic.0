Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACEFCF31AF
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Oct 2024 11:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3vm68OU+i14g+PbOHht096s1K9OQEo584PpiUYsISDs=; b=ySBX4xRGZU8pay
	q+9bOyFXwA9DSAIMdnTh44bRjn2muVxdGUhF3v1C09hDPY/ZlchnZCYkA8Ci6Kad4evzfVB90yAVd
	ri8rP0l6dpKJhC+hySUikKtT6ASJWBjIDFk0Vkmlfi3r776/5Te9G21C+vakvy8crvVK8AxXrXf37
	xMCQutpwTYo4qCS/hEbPNBUEnq7JRwHBqheHMu/lEatulREEaBj+cvHyw+zl20NVG2r201Ew1KQoe
	NuHBY3P2fYRqPj2f/vN98+K0HlsVCh2P8R3luZuLJarnltd8XETWVshzSaeGvgZgYzDUtu0jmo/c2
	warS9vV+9cSBe2LtIKig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svxF4-00000005c2a-1cB8;
	Wed, 02 Oct 2024 11:10:02 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svx3C-00000005a1b-1mQm;
	Wed, 02 Oct 2024 10:57:48 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B2F5423E20;
	Wed,  2 Oct 2024 12:57:44 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_Zgs1HC9V7b; Wed,  2 Oct 2024 12:57:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1727866664; bh=d19584Ze1FFYfFbk3f91IPn8+zI74A5SE2RaLA6uUno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l4FlZMAkq48GYO3R7RMfJR4fcAeb88A7Hwdpl46hT57grAst7otNnQBRozw7M8ffI
	 ESmOi1lEM5W70I2lYhHvUAPyzVu8HzDY8SfXsR38UqoHuXa+CKAGKUzzBQ2+T7kDKK
	 8ILU3HxZ/ggXh2Em08Wv/QOMy73O7bXJrg1hFBbgXsoAv2R1MdXzLthiD9OA7CeOgn
	 ZUcp6zu63VIaauOd468Xy3IZTUTYaHnNePvZO8mvuLRDhl+V7HcVj12rtH3ngDuXLB
	 4YCoQhN6+lnjyDUqeMIJp75Maf7BRFsFLDfdKboQ1gGWVaYvCb7jDzzIroy6HCj3p2
	 OA6Sh/s9WrhYw==
Date: Wed, 2 Oct 2024 10:57:22 +0000
From: Yao Zi <ziyao@disroot.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/1] drm/meson: Support drm_panic
Message-ID: <Zv0nEqV5G2JamvxL@pineapple>
References: <20241001210403.43535-2-ziyao@disroot.org>
 <20241001210403.43535-3-ziyao@disroot.org>
 <28bd30a6-127d-48f0-8e32-703ebd8f69b6@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <28bd30a6-127d-48f0-8e32-703ebd8f69b6@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_035746_670262_737693EF 
X-CRM114-Status: GOOD (  17.15  )
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

On Wed, Oct 02, 2024 at 09:59:57AM +0200, Neil Armstrong wrote:
> I thing the code should look like:
> 
> if (priv->viu.osd1_afbcd) {
> 	meson_canvas_config(priv->canvas, priv->canvas_id_osd1,
> 			    priv->viu.osd1_addr,
> 			    priv->viu.osd1_stride,
> 			    priv->viu.osd1_height,
> 			    MESON_CANVAS_WRAP_NONE,
> 			    MESON_CANVAS_BLKMODE_LINEAR, 0);
> 
> 	if (priv->afbcd.ops) {
> 		priv->afbcd.ops->reset(priv);
> 		priv->afbcd.ops->disable(priv);
> 	}
> 
> 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
> 		writel_bits_relaxed(OSD_ENDIANNESS_LE, OSD_ENDIANNESS_LE,
> 				    priv->io_base +
> 				    _REG(VIU_OSD1_BLK0_CFG_W0));
> 		meson_viu_g12a_disable_osd1_afbc(priv);
> 	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM)) {
> 		writel_bits_relaxed(OSD_DPATH_MALI_AFBCD, 0,
> 				    priv->io_base +
> 				    _REG(VIU_OSD1_CTRL_STAT2));
> 		meson_viu_gxm_disable_osd1_afbc(priv);
> 	}
> }

Thanks for correction!

> AFBC is quite hard to test since it requires DRM_FORMAT_XBGR8888, but
> I think sway should perhaps support it, Mesa should also support AFBC.

Have tried with Sway 1.9 and weston 14.0.0 and didn't find a way to make
them create buffers with AFBC modifiers. modetest util in libdrm doesn't
support it either.

> At some point I made some memory dumps of AFBC buffers, perhaps they could
> be useful here.
> 
> Another way would be to simply ignore the AFBC case, and bail out since
> it would be a very rare case.

I'm not sure the use case of an AFBC-enabled primary plane. It should be
rare the whole primary plane is filled with pixel data from GPU or video
codec.

If my guess is true, bailing out when AFBC is enabled should be
acceptable. Will try to do some AFBC tests if possible and consider
it as a latest solution.

btw, I forget to check whether drm_gem_fb_vmap() succeeds. Will fix it
later.

Thanks for your advice again!

Best regards,
Yao Zi

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
