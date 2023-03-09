Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A702C61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 11:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Po+ZQShSUBvhBgO0Sppi4ix4D9HDRWQMBcE56Piy99g=; b=4Hx2VPdnHVgZ8t
	7qi8Uwt1DXyrQJ9Eh/IJMe8vSKwYIDoCIdokPTejPqFd9oxJMRIPf80XqvaQ7/ajANMg5j9Ee6Uxd
	cy0DZXipVANbYrEYMcewjKkBf6O5F7noURq+wI8m7olBxycW695bxmgtPtN1YD+0CK4hw/W5XEhbD
	DB+dogYrjlQZ65WXwt21nFqqFvJPzOTlBsQNY3U+hlxNPqHH9/FqfWQsSCKIyxW40slCumVH/dNXL
	y5dkn/iVHTQp9pW07oPAqsD/Eq2UrtgP9UEHd4kl1XOfiWZDWIXHczbsZ9JffVZQsAhRB1vHS7zMt
	SnJaUm1ZwP9yUFFpfOpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEXr-009Ye1-0J; Thu, 09 Mar 2023 11:34:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEKV-009RFa-Co
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 11:21:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=J8AMSPbfaaWKAdueqBDchdfwCvvjPH6b5rfoKS9mYt5FZwMsDRY7NN8KQQ1LtTPgg8AZXC
	GQRxVvE9O7zrNk7DbpwaTEhE3pdK47y3HIuBADhdV0EUqatg4WJzh30ZTUeKgLBv2Mn3sP
	Ohmepe7GD96m683HdvXgEjcd097g5tI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-4L5Jx9CrOMaDf7p226HhrA-1; Thu, 09 Mar 2023 06:21:01 -0500
X-MC-Unique: 4L5Jx9CrOMaDf7p226HhrA-1
Received: by mail-wm1-f69.google.com with SMTP id bi21-20020a05600c3d9500b003e836e354e0so646494wmb.5
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 03:21:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360860;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=wm4Et05VUyEcGo96rL02dovbi6CegmWWExW424fAf7YJICMFMcHfLJCHvnNVZ460+F
         dv8r4fekZ+gtuyATHsVyWX9xyJ9UAsxDvZpp1bYkaLjA6gflQoMxjk9jlMyK8GhQcXfO
         +t4dA80UsTDuaNF9CJPsfDqRe6a7FXeauVeaWDpE16c1wBzX9pLX/XeIjbXFkJgl9/vl
         QRnIFtHgP5gMRjdo698rg33A3/GHv9PuaDImJ2p5srNqs3pnHQRPgM5PUOkYVWweQ9Qo
         wkJGjbRKnvbJdCZ6VaHS2VSOSQY2RmKiujs8KL+DTPBZTqaJDSMO4RZ0us861v6q+WWx
         pl0g==
X-Gm-Message-State: AO0yUKXXEt51N8D3zlBdep78iUZxW5dj/X91YkQfKQuDNQtepCg9r6sT
	SpA2a5z16zNjFmKTIpbZ3gOHlYXLnPBqHgZj+e9xbpqnS7wpt0mlmyUfoTD9tY+Q0uogTMm4nHd
	8zLYjxO9Kw/lFvtsPUQ+XgA/A2txfS2E=
X-Received: by 2002:a05:600c:3506:b0:3ea:f6c4:5f26 with SMTP id h6-20020a05600c350600b003eaf6c45f26mr18534989wmq.17.1678360860419;
        Thu, 09 Mar 2023 03:21:00 -0800 (PST)
X-Google-Smtp-Source: AK7set8sLO5bKSPBoOiZMye1ieYHzGLgjQdrxGWGVp5ppUvSkKaG+jgho1T4oKqlnOH+WRjzqLQwTQ==
X-Received: by 2002:a05:600c:3506:b0:3ea:f6c4:5f26 with SMTP id h6-20020a05600c350600b003eaf6c45f26mr18534954wmq.17.1678360860177;
        Thu, 09 Mar 2023 03:21:00 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m8-20020a05600c3b0800b003eae73ee4a1sm2681759wms.17.2023.03.09.03.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:21:00 -0800 (PST)
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
Subject: Re: [PATCH 07/22] drm/imx/dcss: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-8-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-8-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:20:59 +0100
Message-ID: <87jzzqcgro.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_032103_546638_DCCC9F20 
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
