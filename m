Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343B7C61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 11:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Po+ZQShSUBvhBgO0Sppi4ix4D9HDRWQMBcE56Piy99g=; b=nCk19JNPbBeNsW
	1CZr6jMxomDcxROJ24MuDsx4tBderHUFwz6guAS39UGpUlWP11+hslR0IXd+rBmU7Ql9EWcDzU8hE
	h6irnjdYtWa9QczUIYb1SftCnA7VKfpLGMVnmskqmw7dVJaQhMJhfa04UCahzFW/glNSLvPmG25vS
	v3ewahL1Ats2Jws8CdYBgn/kgG7M9R9t198NdL22kCpIm9/3Mdjy6Dm2blSagwj4YOxJxs3QK4zGw
	ZJT0p3P8MbiJ6dRwf5HHf6donSwi/2/h6Hl8IwSD5E9chWsNb/PK/HRqt+AfWHgruOGvWGiZYWWnZ
	XmAdcEvIL9jEgJKDRzTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEYd-009Z1W-P0; Thu, 09 Mar 2023 11:35:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paELE-009Rdv-Hz
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 11:21:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=Mb36jRGuC/o/ac716W/VeetYSkISJ0LRdvXaBeIiBaVoNmsX6X+1EXv9Vv8dRfo7eIIqmr
	KCVCseyRgCwqi3mrqn1fC/DOx+7n1PZNw3SuQdEC5JebE7zc2P3gmXQekVmbm3dboIqpkE
	OQZbsLPkY7e6Faa6Q/GSAx3c9kKygxo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-paRCK22DNTWRtokj2CphQQ-1; Thu, 09 Mar 2023 06:21:46 -0500
X-MC-Unique: paRCK22DNTWRtokj2CphQQ-1
Received: by mail-wm1-f69.google.com with SMTP id e17-20020a05600c219100b003e21fa60ec1so654173wme.2
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 03:21:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360905;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=GYhy7Zo0CeDL8mI5l+IzuvPRIVZsYjQmB/v6cyRi+4bdpWfommfYwHw6GBQXkKwHmE
         Ld91SJ+kIe5AddXUPV+ZCc3VmQaKwNHT02zwoxxGSml6Xv1xp1HvxtNf/H4tuLzz61Ly
         5PRc35v2+sHAsrmR2Zydvw98OZ3FiFxWGYrdPPE9OjsXf5hBRjgUWlLL7QCpL6ifKKaF
         g7xes9TKOLEfCddxftq3IceQM12vIX1yJZbH1YeMzScbru8bTj1mCCEde/5EH9Wg5wpH
         8wTGEeDzzV+gYKIiDVO5Q7f73qevtVEuHkMcP9Iy9YVgJtCGEgKYWBw6lZweefBN0E2q
         EqVA==
X-Gm-Message-State: AO0yUKU31DvTZ4pRo5FUsrxVsn1AIyjFnkj04F3uEdOjqEdtwJO49MGi
	7yq1hxujWAvzfK+rmouI2GYGjkfZjRdXgaiG/UUtxGienL5aaZgrv4gdWDOEG0+E6m1EGAa54ZB
	4fRn1YQ4J6VIerqgrQaeIfqqMbf5KAOg=
X-Received: by 2002:adf:da47:0:b0:2c9:f488:5f54 with SMTP id r7-20020adfda47000000b002c9f4885f54mr12321069wrl.57.1678360905537;
        Thu, 09 Mar 2023 03:21:45 -0800 (PST)
X-Google-Smtp-Source: AK7set/T4C0dgvSGGMpJs8/32CGlr56CYDRn+YAtD8UDvYRDVE6ywdBnZAiSainv+9e2TUJLz767pg==
X-Received: by 2002:adf:da47:0:b0:2c9:f488:5f54 with SMTP id r7-20020adfda47000000b002c9f4885f54mr12321033wrl.57.1678360905258;
        Thu, 09 Mar 2023 03:21:45 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id d1-20020a5d4f81000000b002c54e26bca5sm17503473wru.49.2023.03.09.03.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:21:45 -0800 (PST)
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
Subject: Re: [PATCH 09/22] drm/kmb: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-10-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-10-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:21:44 +0100
Message-ID: <87edpycgqf.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_032148_747057_DBD22C43 
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
