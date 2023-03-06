Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC758C61DA4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 22:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UMhnk4TXdO+SEnzIkW95vBdXg/7yuEFq+XRKNaqIqHs=; b=t8R49PIH/8pwTi
	kzB+GUxrKsDEH3Y3SpB9svD4Qk63XIGcFc0yDETkKexVRceixuqXjq3vhXC8DrvPbgqspHMkrjvCG
	xXraGnqULUO1So6+/PuD47eFn1mj1sPGTLxRr7DofHGqyi0Sor2Ri2KSpBEnwfLll34gpTuL4N404
	m4ZcibjLSCOAgvJnRW/JvJoEqKh1yeCcMLAltujD7f4bduN4WUJtukhXv6SHTCPC91M09GKE+pggQ
	ytRMBd8a69FdHLql0WzFmXXmoP984VdHP138/wCBHJ8WoCm09NEZcF4tfjJJqashzOhv5gPlGhTi0
	or2ezZ91S9Ym6/ijdMtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZJBB-00FEeb-Rs; Mon, 06 Mar 2023 22:19:37 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZJAx-00FEax-TM
	for linux-amlogic@lists.infradead.org; Mon, 06 Mar 2023 22:19:25 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-53916ab0c6bso210874797b3.7
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Mar 2023 14:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678141159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIwy9GGWWk7FRheyk7kQvNm+28TrmRYb7v9Ze4E4qE4=;
        b=ICZbYBbMVaIDZmAFB6H5iCrhGOEY35M31GUKkKobfQ8xltOrmn8D7FBBCOITMcflZS
         tG44B2qro/h5+lzF6tMxsW8eAPNd9g34RzZohr48LOpkOe65wBRX5KoI/Ijr40eZ47u0
         hg9LCHTphHBINZkB8S5Stwn7tdrs6yBXkgkm5ESSb9puGdqGNkOVYFJ7AlZ5nH8WM/BX
         VLXoEQKY4rimQFW9XQI71Ag9FOrsXPDGATyku/a5MWV099Hb/BvLMCqc0tbzZW/EPoo/
         JYcXWDx5G47YQPkidEUVePtZhKEOq7OFI76H8ngB+J188eN8H6kWVzpgqs5QTDJcNVaE
         PWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678141159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIwy9GGWWk7FRheyk7kQvNm+28TrmRYb7v9Ze4E4qE4=;
        b=j06kUWNqE9SpsW+kCVl2Mzp3m2dA298kLznRRe10Dq3Ork6EH3AUhUpWyib1nEGjEH
         mvmBuO0HDBpsD5uTJsZ1UVOfvI4+csPwVgK4i4VVbJjrHa2y0attaYL2cMI01I8lt25L
         gQB1uzl6fv2Il7tSLsk1DsBbu9R0eMU1FX2wpdN/pufIP1oqRCQe5hk+8NjfHbszekkd
         5JLNxBMHFC3ZVZOBxmUkmQSV5jw7By61RJryGEIbmaitu/IIu+RtIP5lssoSSvOlAbVS
         qPxKLDSI18zpLFwEmeSbpP0ENwoVFzKlJOmbsUPhAirEL5zYs2n5wy3D9FZ0rduUN2on
         g17g==
X-Gm-Message-State: AO0yUKU5czbgdRZvBIG7kPIQgQKosKzw++5luoT6XUx87xaniyRmKVzL
	n53D2MMvYB1dYxW8JsEhE/VjszHFS0SdmAlKqTR26g==
X-Google-Smtp-Source: AK7set+FEBHOTN7jH6jw+W4M/INkl80XRa4XzqDzPxdd9YGD5yqFWOonMchaUl4aHKnjh/2xQeNLpP3z0RkBrl7WU5s=
X-Received: by 2002:a81:b705:0:b0:535:fe26:acc with SMTP id
 v5-20020a81b705000000b00535fe260accmr7785857ywh.10.1678141159600; Mon, 06 Mar
 2023 14:19:19 -0800 (PST)
MIME-Version: 1.0
References: <20230301153101.4282-1-tzimmermann@suse.de> <20230301153101.4282-21-tzimmermann@suse.de>
In-Reply-To: <20230301153101.4282-21-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Mar 2023 23:19:08 +0100
Message-ID: <CACRpkdYS54Svj=B-NfrjX+kBDYw5e9Jyt70L0tr_iX5+mVYK4A@mail.gmail.com>
Subject: Re: [PATCH 20/22] drm/tve200: Use GEM DMA fbdev emulation
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, daniel@ffwll.ch, andrew@aj.id.au, 
	laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-imx@nxp.com, p.zabel@pengutronix.de, anitha.chrisanthus@intel.com, 
	edmund.j.dea@intel.com, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, alain.volmat@foss.st.com, 
	yannick.fertre@foss.st.com, raphael.gallais-pou@foss.st.com, 
	philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, jernej.skrabec@gmail.com, samuel@sholland.org, 
	jyri.sarha@iki.fi, tomba@kernel.org, hyun.kwon@xilinx.com, 
	laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_141923_952797_E5273C84 
X-CRM114-Status: UNSURE (   5.69  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBNYXIgMSwgMjAyMyBhdCA0OjMx4oCvUE0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgoKPiBVc2UgdGhlIGZiZGV2IGVtdWxhdGlvbiB0aGF0IGlz
IG9wdGltaXplZCBmb3IgRE1BIGhlbHBlcnMuIEF2b2lkcwo+IHBvc3NpYmxlIHNoYWRvdyBidWZm
ZXJpbmcgYW5kIG1ha2VzIHRoZSBjb2RlIHNpbXBsZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBUaG9t
YXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KClRoYXQgc291bmRzIG5lYXQ6CkFj
a2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywK
TGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
