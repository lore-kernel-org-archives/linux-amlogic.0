Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F22FC61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 11:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vkosvdfBSvyI2YvJOfl50utXwDuXvD/6U0nhZDaSvaU=; b=VNIaj8f20yGtiI
	XcVhFT0A5O2ya7Fwe/AqPooEHPZFRXnyq4Lwr+Et/p5BSwbg1GTO2DeXVJaZpAoeIzQ2rMe2Y7leg
	sCfIekz85BgTxAb2Ic0zmWs+6Mm/7nZA6Eqgv0Lzc405jNmXByPD65FTzVBL9kQT+z6nJMdQjPQaz
	14nQrgbGxME51/vlEwh9WXYTG40/pDwnDWJCr65bj7Ebx1ljSQQmO4HYxIRUVpmGUFcVNDxtf6QCg
	ybZ6txtCTjQZWRlV114TvQPvyA0GsCxgbopb62ontqf2yTzhFeQ52gFP931K/KgqMBeF1CQh4l16i
	vOg6lFZ49tTLlbV4q7cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paETG-009WAE-Ml; Thu, 09 Mar 2023 11:30:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEEP-009Ns1-2O
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 11:14:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fOclMsW6Dcq/qmgrbzDRG9ABG8aYqQLYxxYoBc5QR74=;
	b=baxC9t6eyk3IKhfv0QWWRuL+z9o1x5ObjJinAnDevrCwiLR4J+EdPGw+aLpSTwUIJeQ33a
	+nsJObcda/838lrLS4ETkgRyacyS2GmZAX3YSLHS9U+90fpSKDwdueG6/Ynu3eiE55uaL5
	oGvY9C4cggX3fRonL50zU7kNToYeGyg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-IbdUNXxlN6KjAYyjD1geoQ-1; Thu, 09 Mar 2023 06:14:42 -0500
X-MC-Unique: IbdUNXxlN6KjAYyjD1geoQ-1
Received: by mail-wr1-f72.google.com with SMTP id ba28-20020a0560001c1c00b002cc6d1f0c06so343724wrb.17
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 03:14:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360481;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fOclMsW6Dcq/qmgrbzDRG9ABG8aYqQLYxxYoBc5QR74=;
        b=wQT/HUOeL7vawldnjhblGA3/FCyzVEkvy2Zewzwwx8TI+ARjG0TDny4LwcsItavHlJ
         WgXu1DJ0KkrxWxlGUqqytYQgY5zpAYIZ3wjA/KQKwwoTxqlQ8aBPS3kTqjYhqJDLAKvq
         voItzqO9nLy2zLU30dJxGAfC9XhQE/QCnL9ljRfvSysvl4tIBUZOY9VwQK4fpOxkeTyf
         sUrLWkpL0s0oFkoLHdE4HQBCGoPHt0+WeojvFwWymVqAX+Si9nt0AWk4vIzhz/WDmOQ6
         HubOAGOs8ESUdDYJBK8JG1TbL57y5IjL6Yjn1p/26Tn2w92xGNni9f1QUJSwTa8eL5R+
         vNsQ==
X-Gm-Message-State: AO0yUKWQpJRwvN7J2RCLUOAMuNa8uPaFSuikKyy0u2bCnnBh2IQei+O4
	YvUF8cNJ9vcinawnaQihJQgLjBhvnjPTNxYT7Wcm1JtVTQXcqnQjOEdKpseJOVWVtNBLxSgv7Kr
	2FwJix6litkcdQ/xeRSDztld29qALvX8=
X-Received: by 2002:a5d:52c4:0:b0:2c7:390e:163c with SMTP id r4-20020a5d52c4000000b002c7390e163cmr15389433wrv.47.1678360480885;
        Thu, 09 Mar 2023 03:14:40 -0800 (PST)
X-Google-Smtp-Source: AK7set915u9SxlnTzfz8tGdDVQASzd1E75MhTfa6AFkSAnvLaeMrUwPtQlpNR4g2GraOjyd7bJsXiA==
X-Received: by 2002:a5d:52c4:0:b0:2c7:390e:163c with SMTP id r4-20020a5d52c4000000b002c7390e163cmr15389414wrv.47.1678360480580;
        Thu, 09 Mar 2023 03:14:40 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q1-20020a1ce901000000b003eb5a531232sm2198602wmc.38.2023.03.09.03.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:14:40 -0800 (PST)
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
In-Reply-To: <87o7p2p4n4.fsf@minerva.mail-host-address-is-not-set>
References: <87o7p2p4n4.fsf@minerva.mail-host-address-is-not-set>
Date: Thu, 09 Mar 2023 12:14:39 +0100
Message-ID: <871qlydvmo.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_031445_231704_71029C02 
X-CRM114-Status: GOOD (  11.18  )
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

Javier Martinez Canillas <javierm@redhat.com> writes:

[...]

>> +	drm_fb_helper_prepare(dev, fb_helper, preferred_bpp, &drm_fbdev_dma_helper_funcs);
>> +
>> +	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_dma_client_funcs);
>> +	if (ret) {
>> +		drm_err(dev, "Failed to register client: %d\n", ret);
>> +		goto err_drm_client_init;
>> +	}
>> +
>> +	ret = drm_fbdev_dma_client_hotplug(&fb_helper->client);
>> +	if (ret)
>> +		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
>> +
>> +	drm_client_register(&fb_helper->client);
>> +
>> +	return;
>> +
>> +err_drm_client_init:
>> +	drm_fb_helper_unprepare(fb_helper);
>> +	kfree(fb_helper);
>> +}
>> +EXPORT_SYMBOL(drm_fbdev_dma_setup);
>
> And this one could also be shared AFAICT if drm_fbdev_client_hotplug()
> is used instead.
>

Scratch this one, you need the custom setup function to pass the 
drm_fbdev_dma_helper_funcs to drm_client_init(). But I think the
other comments this apply.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
