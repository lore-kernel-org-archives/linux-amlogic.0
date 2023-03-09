Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADDAC61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 11:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Po+ZQShSUBvhBgO0Sppi4ix4D9HDRWQMBcE56Piy99g=; b=ktuvN9xycueVzw
	kD4LGc99+hOBujnjHohdffmbDViLAu82sakOyt3kW22012z8XUrROn11FkijE/sG5gP/jQ0HKNNbx
	dAK1VRUm5aU6trrNtmwKiQy7WQDAxV08jjJweG+3kA2UPvnqMLHl2syot+5c5ybttlsp+PDotuHxL
	erLJ0GtRGqW2ioh2PmAKnZQ8SZ1BxtRB9Ci10eXG5WZkbG03l9nPqAYEgsJN7TThJwBrc3nJNFyz6
	z6ZEMUzH7Yu/zKQRvIt9Oj7f1dXySMbelB3corduXIQwn2HpLaQZVYWe/xfbN9hIDHRLN+UAm9IbY
	RLkzr/97mQnS9LnAw/7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEfx-009cKY-Ga; Thu, 09 Mar 2023 11:43:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEPC-009Tv8-EC
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 11:25:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=G2zxcM5XFvPOogQgAGhDYLPFj6iK2DQb/QIqJxf2mAsgto0qflhs0OoQ0IXuT/oLwOIPUt
	1bAsgPyflJLaEkqonW6oY7WfG/sL6b87tQh5XOm6ZG1u5QjUopYqJCJDkbc6w6jH/rh2KN
	o9UYHuz23jYsj4eC4+yq//yWych3usE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-L6__YSHjPV-u7ft_iCnl9w-1; Thu, 09 Mar 2023 06:25:52 -0500
X-MC-Unique: L6__YSHjPV-u7ft_iCnl9w-1
Received: by mail-wm1-f71.google.com with SMTP id l16-20020a05600c1d1000b003e77552705cso649634wms.7
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 03:25:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361151;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=kqxmGwcJMUrztspOf/cQif95ftBgGpvNSbpQ7MtM5zGFupCzLS+0fUpPLe3Q/h8xUU
         j32nOfd+IEH/6VL8tyUCJsOzMQSHgz0z27uMxPKmueW8xI7iH0BtHG0uzAXajSoZvn7O
         /FjfA4uHPAkuQDFIRNKfU1N0GzFUlRZqMmL5zpr+M8xJcuE6Z0TxsubZKbSd8rwR24kd
         V1IrHjvKPzMD9300KzIaoiFMNCP7YzzKGujghCp+v6XPUsyn6S/mB4QGka0mCfYrjYAQ
         +irgrrzJoZYir8z+FgGnqpaSGUcOW2/gpxjpu6jfJAZXpPYmCBCl8bXBERdt30mOsTez
         NMNQ==
X-Gm-Message-State: AO0yUKXWeYDk6qvRiumulZRNskhtLHliyWGeHCw9v1hFQgbbfbrMOsOu
	FFqxhipC0Fikp3yLPeeHyZ2kKTvyfL/YTVOf8XjVHWMv5lKy8s4wo1uMUHYJejM/dW9YohRU19Q
	RhUJAfGWj4q4oHX6ny+dSScSd1LXpK3o=
X-Received: by 2002:a05:6000:1a54:b0:2ca:6cb1:c9c5 with SMTP id t20-20020a0560001a5400b002ca6cb1c9c5mr14672867wry.30.1678361151278;
        Thu, 09 Mar 2023 03:25:51 -0800 (PST)
X-Google-Smtp-Source: AK7set+fKWERQDzcgswyQf9IdMUANe41W2TE3VA84WcXGdem8/aR/1UT8t++iE4upU8MSOqw2VB+mg==
X-Received: by 2002:a05:6000:1a54:b0:2ca:6cb1:c9c5 with SMTP id t20-20020a0560001a5400b002ca6cb1c9c5mr14672854wry.30.1678361151005;
        Thu, 09 Mar 2023 03:25:51 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id b3-20020a5d40c3000000b002ce37d2464csm13808052wrq.83.2023.03.09.03.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:25:50 -0800 (PST)
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
Subject: Re: [PATCH 13/22] drm/mxsfb: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-14-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-14-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:25:50 +0100
Message-ID: <87v8ja6u9t.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_032554_572199_E999C04E 
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
