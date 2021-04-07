Return-Path: <SRS0=M/XH=JE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E34BC433ED
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Apr 2021 15:48:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A909E610C7
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Apr 2021 15:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A909E610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BOmbGke84VKwLD4eBdbuGDTdvj5ZDmvXjR58Eevs+jE=; b=mUE5lIpTZuhNEglv5sVIxcKgB
	c4iYdWHIEGVNmYSCDNenlKQP/CmgW4w1cVVD8MqOzO7hdh0PoK9CG/8ZL3GY7gId2K/YPIdt6Yfs+
	mYIj7Ebke+8pBgMITu9PzBYeY+6HuHRWxeKHsqS4zF23fyREQHEMELidl2nGe6Cl55y2Ew/r0uJdh
	2Fv7TPqYwmJltPr7oQCgU0MaRNe87qrLqvmElVEtyeczk32tDrrIWAOgqmNInJ3vuFUNlBRqKE/78
	v4Y7fHw0Pu67F+Zm+CekRcM0C5uDoXEQxKQjuRIAou1ytgS+UrrhscKaLeodUE3wBPojRcPuN9k8Z
	fY6CchQEw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUAQ2-005Jup-BX; Wed, 07 Apr 2021 15:48:38 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUAPx-005JtP-37; Wed, 07 Apr 2021 15:48:35 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 b133-20020a1c678b0000b02901231346381dso1431750wmc.0; 
 Wed, 07 Apr 2021 08:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=VXyrtGnwTjNkgIA1jrziNG4eeLUP6i3fUCHQ1vhVTNk=;
 b=AT3fDu5INkxhj3Ycskj+25gD7VvEaPZFZOqS+dhmjSsFiVZ01PPcXhLNUTnVfU6F9T
 E0XhY4u1NBJm5jTKMs7AcK+gzPIAXkVqEgk+T49IfKZLkDo5mqKZKRVFf11vkcvr5LUA
 jXeX/IYQl6oBAUQLk3c2+KmMoN8w+LME7R5+tp200su1i7v4ClMarRdCiNqfPZnLAqX1
 k7FMPChv+9NMP1ym25RwMfvTL/6KVRO1Kh1ziGhSI4x7ijLJK86xHGHdwQJ+fVlh/7Be
 Z1oGWwNYGPu9/pqRHVoHZRW8mBI6HXAVhCeK00BOayKoSU9s9USmOKT4eQRZ/kGHWoJ4
 5u1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=VXyrtGnwTjNkgIA1jrziNG4eeLUP6i3fUCHQ1vhVTNk=;
 b=T61SjKdwcEuhU9na0/0Z2BP3MnUr2LERtmIpJlAznqSywfC1r8toGVcZz5H57BRDyX
 /VdNav6oZPL97S5P0KvJ2y08pvrNugoagafgivGDLtjl5tAhobc9sqKnsBOm3DYkIqCw
 KWs3mL50DUrOpuLaXPeNnCXedrjnM8cmWwZmLz+bDl+Nv+MP5CsHFXpa+3bC6r+V9wZL
 aGK5ay6rDglH0GlzkHAoe49tXKycRY+KgpKQ6joYv+F45tyV3531LPJwKz/SIolBrR6V
 t5TKlJC4SblXljtbstvPJxBl40e8Fop80vnESXHZpet+DSxDY7tKCB2jVK2LQzot+WFI
 zYjg==
X-Gm-Message-State: AOAM5319WArocoDam3rMNVpSk6PonzW+Lo0V/KU4tAKDSdmo8PfNnAhA
 b0dsnPjaaZghten2lnRM/Ds=
X-Google-Smtp-Source: ABdhPJzD7dxKEjfVHj/Mt5EH5n5S/dlaxsmEkejN73MZv+TvkDOrEI5rgccyVlOqrKVUnws2nEHr5A==
X-Received: by 2002:a05:600c:2946:: with SMTP id
 n6mr3655449wmd.52.1617810511641; 
 Wed, 07 Apr 2021 08:48:31 -0700 (PDT)
Received: from 192.168.10.5 ([39.46.7.73])
 by smtp.gmail.com with ESMTPSA id v185sm9224838wmb.25.2021.04.07.08.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 08:48:31 -0700 (PDT)
Message-ID: <5daaeac37cfa5c07a1880ae49b712566a561ba1a.camel@gmail.com>
Subject: Re: [PATCH] staging: axis-fifo: media/meson: remove redundant
 dev_err call
From: Muhammad Usama Anjum <musamaanjum@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: musamaanjum@gmail.com, linqiheng@huawei.com, 
 kernel-janitors@vger.kernel.org, dan.carpenter@oracle.com, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong
 <narmstrong@baylibre.com>,  Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,  "open
 list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, open list
 <linux-kernel@vger.kernel.org>,  "open list:MESON VIDEO DECODER DRIVER FOR
 AMLOGIC SOCS" <linux-media@vger.kernel.org>, "open list:MESON VIDEO DECODER
 DRIVER FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>, "moderated
 list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>
Date: Wed, 07 Apr 2021 20:48:21 +0500
In-Reply-To: <93218bc8-2cbb-bacc-f985-876a842261c4@xs4all.nl>
References: <20210407101047.GA1491258@LEGION>
 <93218bc8-2cbb-bacc-f985-876a842261c4@xs4all.nl>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_164833_333634_86C387B4 
X-CRM114-Status: GOOD (  19.98  )
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

On Wed, 2021-04-07 at 16:05 +0200, Hans Verkuil wrote:
> Hi Muhammad,
> 
> On 07/04/2021 12:10, Muhammad Usama Anjum wrote:
> > devm_ioremap_resource() prints error message in itself. Remove the
> > dev_err call to avoid redundant error message.
> 
> Please split this up into two separate patches! They are independent
> changes and these two drivers are maintained by different people as well.
> 
> The patch itself looks OK, but it really has to be two separate patches.
> 
Okay. I'll send two separate patches. Thank you.

Regards,
Usama
> Regards,
> 
> 	Hans
> 
> > Signed-off-by: Muhammad Usama Anjum <musamaanjum@gmail.com>
> > ---
> >  drivers/staging/axis-fifo/axis-fifo.c   | 1 -
> >  drivers/staging/media/meson/vdec/vdec.c | 8 ++------
> >  2 files changed, 2 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> > index 2bb1c2e9cb57..ed9281089738 100644
> > --- a/drivers/staging/axis-fifo/axis-fifo.c
> > +++ b/drivers/staging/axis-fifo/axis-fifo.c
> > @@ -853,7 +853,6 @@ static int axis_fifo_probe(struct platform_device *pdev)
> >  	fifo->base_addr = devm_ioremap_resource(fifo->dt_device, r_mem);
> >  	if (IS_ERR(fifo->base_addr)) {
> >  		rc = PTR_ERR(fifo->base_addr);
> > -		dev_err(fifo->dt_device, "can't remap IO resource (%d)\n", rc);
> >  		goto err_initial;
> >  	}
> >  
> > diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
> > index 5d4db7a5b4b5..e51d69c4729d 100644
> > --- a/drivers/staging/media/meson/vdec/vdec.c
> > +++ b/drivers/staging/media/meson/vdec/vdec.c
> > @@ -1008,17 +1008,13 @@ static int vdec_probe(struct platform_device *pdev)
> >  
> >  	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dos");
> >  	core->dos_base = devm_ioremap_resource(dev, r);
> > -	if (IS_ERR(core->dos_base)) {
> > -		dev_err(dev, "Couldn't remap DOS memory\n");
> > +	if (IS_ERR(core->dos_base))
> >  		return PTR_ERR(core->dos_base);
> > -	}
> >  
> >  	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "esparser");
> >  	core->esparser_base = devm_ioremap_resource(dev, r);
> > -	if (IS_ERR(core->esparser_base)) {
> > -		dev_err(dev, "Couldn't remap ESPARSER memory\n");
> > +	if (IS_ERR(core->esparser_base))
> >  		return PTR_ERR(core->esparser_base);
> > -	}
> >  
> >  	core->regmap_ao =
> >  		syscon_regmap_lookup_by_phandle(dev->of_node,
> > 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
