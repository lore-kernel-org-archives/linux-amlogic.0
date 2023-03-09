Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D29C61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 11:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Po+ZQShSUBvhBgO0Sppi4ix4D9HDRWQMBcE56Piy99g=; b=f/TBpP+PX19QWP
	SamuXtu9wrcYo8wkR2QJyDGLPwLt2iNLgCPlpIgJs9r0jfPrzVtFo7K7UQC4VIriyOAEbSfBCqjg0
	RZ1JY4wa9KhIP0OjzdDvio/X7vK38GDyWgSKfTSR6KxloDZhjQW8g93DSeavtezA0NnJCyxSRdmRN
	GSsKSvAOJ3nl23kdjb9LBOKM9eHk9r/GRD8XbaRM/KEYKF4j3/t0kEdpiRzOUsnlKRDwuTaqt01Op
	tWNip0LLspkWmEoQujUPdvz3+xa6XA3Xqd5A1WzRxRxLItMIkxroWu2f56zsimfs/pwjBWeaNq+QV
	bD5Fve5+5KS6SHQWm5Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paElg-009er3-VN; Thu, 09 Mar 2023 11:49:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEQq-009Up5-1j
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 11:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=Tg8tHneVRsd+W+BnvY/VHtX2lYyoBX4SgPnIf5W+ECT9GcrnsskFJ2yQCAdIIkdfKFeePc
	yReHFHMgEc4RIIHK89iYO4oR1/QeiVL4FPcQL34cpySYL8glQGD7a1aq3FlyFZeT+zOYcc
	y4n28h6SrRTOqcObSbTHR3aFl7991xM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-AHdgcjI6OQ2wCNSJto5JjA-1; Thu, 09 Mar 2023 06:27:34 -0500
X-MC-Unique: AHdgcjI6OQ2wCNSJto5JjA-1
Received: by mail-wm1-f71.google.com with SMTP id z6-20020a05600c220600b003e222c9c5f4so544691wml.4
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 03:27:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361253;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=5u7L4wnR1LhPvv/eXrh2NnY9fJwnJRVoPr6BvSrhfke2GWf9+TLW52L13c5h70divG
         t+FNA6D+oSotDqmVbSDTknQV0LlXAQhLZ+WnjaIylVMM+GtRmHmaBxgy//shOhs59tDv
         1TmgIHFjyr7NaHTqFQ2rKYqCZwfiki8nSUwYB0JyQlmYNxpAOxma+KpeesSGGOmp09Oy
         GA28G0URbQkt79Gv2BNdjdZdShNu2PzzbYWkzrYokkl1ERl6FqhJKGL+/l84JXQUdV7R
         nXo2jFXQDS9iYECivhoM4E3fvUwiKfgcyMCtPl0CGVdOcRw8xfP2G+kBwuaGkk1VmvQr
         GKDQ==
X-Gm-Message-State: AO0yUKVZjO2CkYq1YaSmzbdaf98cKO/8vxm7ZOS4/yCThnEsOuxBpkhe
	+4FEKIPLGNushq8J8ix66T1zB1+DgEHd37LlSUFIqlNbYwyrK7/zsbqpB7K7kmIlXknHQIicudd
	EktawTVVO1S3iBnG4pATn9apNlZzw1eU=
X-Received: by 2002:a05:600c:1d16:b0:3df:9858:c030 with SMTP id l22-20020a05600c1d1600b003df9858c030mr18329028wms.5.1678361253100;
        Thu, 09 Mar 2023 03:27:33 -0800 (PST)
X-Google-Smtp-Source: AK7set9NkiNNv96tpY+ICOstwyMw+enkMfLxXSTreTdhPg1jdkeOeFAU5LDWK20u9ucio+cg3Xhjrg==
X-Received: by 2002:a05:600c:1d16:b0:3df:9858:c030 with SMTP id l22-20020a05600c1d1600b003df9858c030mr18328975wms.5.1678361252754;
        Thu, 09 Mar 2023 03:27:32 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id l6-20020a1c7906000000b003e2052bad94sm2217733wme.33.2023.03.09.03.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:27:32 -0800 (PST)
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
Subject: Re: [PATCH 18/22] drm/tilcdc: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-19-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-19-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:27:31 +0100
Message-ID: <87h6uu6u70.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_032736_203135_CAF2065B 
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
