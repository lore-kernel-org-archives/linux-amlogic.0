Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E831DC64EC4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 11:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Po+ZQShSUBvhBgO0Sppi4ix4D9HDRWQMBcE56Piy99g=; b=Aasx4cI4ugHSOc
	g3cULFwbKG9kZ1KboxBDPZJkoz0hKMwMmVZkug9+82VYlBq/kSIsMz06dXWb/jVkhPMj5YdDfwWwq
	hI/nK23Nxk6NU4iB0+9gZtgl74YB4KcxNCRBS2U2Chuyj8G9iHpa4YheBUZ5G07VXXguqpR8Ylug+
	qHl0I2xSN9ZKbKZ6GEJ7tJ5mmN+DgU5iGkBvdpO4eUYKSvyj7M8fIX06JG18hTis6EZLEYX0D8u5t
	+ZEH2s/VMKDOdW9gle/PMHv0DKOEqZSq91pRxiYK7Ho0tw0JPiGNAoZ0A9gz2rZPMUkSIcnmZAzfb
	uHIc5Pti6eDXeYmppqOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEYc-009Z12-JA; Thu, 09 Mar 2023 11:35:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEKs-009RRz-FM
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 11:21:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=CU40T/dhvBztNwrsVnlRl1wprx1SK03OK+kO20wyYBCfHjLSrOzvCMrcJr8eMnaabGSwIh
	rqf/haMMXQc/ahc1CEeEffYvx33ny7wNJXLmUDu8XDDt1OlIiAdOI799V1fy5g+wAOqDNL
	XtBiep6tjUK7UqV/VT5k/GhgUf8UOGU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-mLqA1a-vMVW7uV3oDWxTJw-1; Thu, 09 Mar 2023 06:21:24 -0500
X-MC-Unique: mLqA1a-vMVW7uV3oDWxTJw-1
Received: by mail-wr1-f70.google.com with SMTP id l5-20020a5d6745000000b002c91cb49949so345968wrw.14
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 03:21:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360883;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=p/OfIkPcDTP3XkpE9ztlC+u5hqyUBdLc/cum1FMDTCJwSFyIri/VJvb91paiebLF1l
         4Cdu+qBduDX/G0z+Am8GzAA0wnQ7UBRdfckIpJdWiJZ6Lk65P7yE4zuFL7d+7jmuXkWN
         /2424xZGJx7wHnhy+c8mt68Vd7TqAmQUAA0Npr7FjbJlr+QjhfG92kagk7HvaNRnkggt
         Gm6LGaRfmbySOGSHqJ0WV7J0o535I2lKNC+QOriT8BR3+P5k3LQwQc0E1+QoPW/yeS2S
         9JUn7Abn/PbPQS5qfUJjbCO+2yM7J1pvtsj3jvw8Emxg6Uwli/sjT8oggqaofQq4XhSF
         yBmA==
X-Gm-Message-State: AO0yUKVzz/Uarcca3kMteP59Sitcfg7XR8cKSDH8rYa0HXFasU0z4m/k
	q8MUe6szCM5ID2SSHjtZl6ag7vpd6yg1YzIJlutWPI5yuJUSohtxpEhpsBY1PWmuqL4vKfklEJ1
	zpbZoOdBWQOYGyy+9fQ9OsA942e0QhHw=
X-Received: by 2002:a05:600c:19cf:b0:3e7:772d:22de with SMTP id u15-20020a05600c19cf00b003e7772d22demr18809454wmq.30.1678360883238;
        Thu, 09 Mar 2023 03:21:23 -0800 (PST)
X-Google-Smtp-Source: AK7set9QvIelUa3ZPRMnnDZU4wSkpr+jKhTz8vzz9MlATkeg82OLoMst/ctfKDlY/kc1tAF7ljMTyg==
X-Received: by 2002:a05:600c:19cf:b0:3e7:772d:22de with SMTP id u15-20020a05600c19cf00b003e7772d22demr18809404wmq.30.1678360882944;
        Thu, 09 Mar 2023 03:21:22 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m16-20020a7bca50000000b003eb5a0873e0sm2237300wml.39.2023.03.09.03.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:21:22 -0800 (PST)
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
Subject: Re: [PATCH 08/22] drm/imx: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-9-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-9-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:21:22 +0100
Message-ID: <87h6uucgr1.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_032126_621668_8D899CB0 
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
