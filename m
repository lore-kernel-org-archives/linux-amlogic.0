Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFC4C64EC4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 11:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Po+ZQShSUBvhBgO0Sppi4ix4D9HDRWQMBcE56Piy99g=; b=M2MMOthT8Oqwsq
	bEWYkkSsZ5OfInu88se4s7pyzCmhLYBhrGUtrScpzAGSFsB8FmQQbOJqheNVK+bfUhFoZgi+ceigT
	NUIwqLLKA1OBqJQT7Qfq6xJ2F0kU1MKwEVSXgVkgYWgyyApgw2dnjYzu+Dp95/Q/5sKWkGw80Ga2j
	iihwUdsvpiQLZDKYDDc+N95U8L0r82bodj6rmrLMwVFcO0Lfyw9KRdU0KhQDwbVdV3ZFxaOHD8n96
	tLpnZ3mPeuHN5XjP3F2oc6VypSadH5Budz/yD0ZFqVGUa0bR9qNfQwN7E12mvT+vXx6CZpIIbZQi+
	wWqUDkloPFTkFkP5nLhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEfz-009cLj-Kn; Thu, 09 Mar 2023 11:43:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEPW-009U4j-FA
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 11:26:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=a+Zt9OltAkkNGKt9MD83wZG9X8YtxH2RptqjLLcw5oZU/W8sm+5MBUtiI8M+iY1pY0Fl2I
	Sn0BnnOS2FC6euh29XHZ/0CIzRAn1eVKgpbLd4a+jBPFvJOMbOebhmGJKxP83IRnyTSEuz
	5C3FfGsWhNylJDNNbzB8yc1p1cNF29o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-hWU2jLSOOiSdd_BFLEHfJA-1; Thu, 09 Mar 2023 06:26:12 -0500
X-MC-Unique: hWU2jLSOOiSdd_BFLEHfJA-1
Received: by mail-wm1-f69.google.com with SMTP id e17-20020a05600c219100b003e21fa60ec1so658722wme.2
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 03:26:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361171;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=MQsVlFEQUsKQruTHG8SlrRwEo88I9rc9sjNvO/65Q/t1YqML4CLeKsYlGrr4NFWBJK
         eOJsgUiKBEADHgWMQ3ZR0tV6XCVHsXnPZyULoP35DURDlEeoJIKdIAQBMbWniSPHSNJU
         WDgbJrwjIecQzC9+pQ/Fn1ijkiJOB5XUs2J0OmUln8OwrNKLQiEj1Vkhm2vP2rO3bU7e
         IXxfYXabI9+AYzhid5Fgs4dIotHMqLKB+Uf/upJXPnYJl4XC/yYRT58+fngFFfehUacX
         9p4VkKxH6zkLMQhVIanKiI5AUIZC8ndhs+xUyWRhEzij/6fm4b/8jDgOmuXRgA/a1iwt
         aeyQ==
X-Gm-Message-State: AO0yUKVHrjN0jfCZCxNib9LP8xxWTG3J5sH7TOVAZakG1aCGHHTO3azv
	7nd+5NA4iPPQp/56gLgXO/4zyG4BnNL4f6pVPG5jFzzTZk1NCS2abB9Qqtw3oRc8qidn9EFrlkM
	Y2Mk8YWLzdHf21nNX1v7rfNhtycNtjxo=
X-Received: by 2002:a05:600c:310f:b0:3ea:edd7:1f24 with SMTP id g15-20020a05600c310f00b003eaedd71f24mr19249571wmo.39.1678361171523;
        Thu, 09 Mar 2023 03:26:11 -0800 (PST)
X-Google-Smtp-Source: AK7set8P+TR8QVeZTPkvZUtmOPITmpd/ysZXzZ/aUrzjfnJhfAoMKaclBZMuBRrY3afv4leM7oxMzQ==
X-Received: by 2002:a05:600c:310f:b0:3ea:edd7:1f24 with SMTP id g15-20020a05600c310f00b003eaedd71f24mr19249536wmo.39.1678361171233;
        Thu, 09 Mar 2023 03:26:11 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bi18-20020a05600c3d9200b003eae73f0fc1sm2297965wmb.18.2023.03.09.03.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:26:11 -0800 (PST)
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
Subject: Re: [PATCH 14/22] drm/sti: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-15-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-15-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:26:10 +0100
Message-ID: <87sfee6u99.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_032614_605794_DA256CDC 
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
