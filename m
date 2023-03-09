Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D60C64EC4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 11:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Po+ZQShSUBvhBgO0Sppi4ix4D9HDRWQMBcE56Piy99g=; b=Ou3TD3SYuxIldv
	OAume9ud5QQgswQV4PMqD3pCkuDqCZzq5fiOcxJd+zrKRKqfKV6GTEOsQ+PH4z2kM3lRLtxeCLoiA
	9RvMlLShne6SgnH9x3KP4W0ZjyJERiI3TPkA37khNxMZGQrGORh6JQa5iqVu6Msp2TXFIYyMKsfci
	WNj97mcU0g1Tt5BPCZ6hps3xmIMrNfVFaETsZ11s4bUFLmmdnrEfnOP2w+UCLtpGRO9MT9/hgQlOR
	O66xcRxKHxPRtA1AynDLdJz5PlTxizoFnWyqmQMrMNir9UvTwdX++yVey1GwM3CeZ7JbYRhAfUcVv
	9kWFox2s+p9WXYSo2RFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEcu-009b1k-HM; Thu, 09 Mar 2023 11:40:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paENC-009Sii-1U
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 11:23:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=RchviBk9BaJnOhNnVKFVpd9CCx1Z6McWsVQIkpIYmuFjfpkK5H00q/ga26aFn9WpZQYxid
	zU8U+U6Im0rFb2LUOL1fzaeuORo21Hr8v5JpWrb6i7E8VcLIRUHgmSIZveT3+XATXxSNRi
	KN/2RTAIrzWjat81XrcVJAWOk0UK6sQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-5g58iJaKOyyOHiGCVS0-mQ-1; Thu, 09 Mar 2023 06:23:47 -0500
X-MC-Unique: 5g58iJaKOyyOHiGCVS0-mQ-1
Received: by mail-wm1-f71.google.com with SMTP id bi21-20020a05600c3d9500b003e836e354e0so649156wmb.5
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 03:23:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361026;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=IS6zAHieHO9yJMDcllWBb9B5PYZIW8bL3wKyycVXV9OlqvXVQpCmcQnD62JhOawOMs
         4CTx0bSpBvXQAfiP1nD93sdgSmYse07PhpyLTzoSAC9Sm77+ncAa3qxtXAtjoZvT9Jkw
         mZYz8NBY5jq/meSCTUqrahxtEJapoFbqAz+C6d470XY84v0sefgVVw6vdZGAphqvbwAD
         82kfAagG8iKntZXeIE8ItCOCXrvsp8fYawCz93ly+NEjKtvBnlYY0mCfzj6/43B+gGRw
         xS1bjros8uvuFq4CCaQrxJfxomnL1D3MM69PlJXtzsMmohEPKXZ35UKPBavyeE+sLc4N
         LGxg==
X-Gm-Message-State: AO0yUKXW4gtDq0Czj/zrkvF2hVdMCe1lfVe8xz55+RLWkDVzHqzvIFw5
	DEqs2phQTc5EOXJ2SkJQYo1/VB+DtgXTwtHxlZat6zCWeuZmEf4+NYhQqcmjnghAYMoGiRdSmWE
	svU7w03pfGbY9S3Pi15lVq+xDP+IZQMY=
X-Received: by 2002:a5d:6789:0:b0:2c8:dc70:ab13 with SMTP id v9-20020a5d6789000000b002c8dc70ab13mr14211745wru.18.1678361026296;
        Thu, 09 Mar 2023 03:23:46 -0800 (PST)
X-Google-Smtp-Source: AK7set/SH5LP3JdoN3TXJ/TYCOAs9QXCd0H2gq8nSZeQO9vW4n5twpVp9hXlg9qp/3ZX39KGtC3WSg==
X-Received: by 2002:a5d:6789:0:b0:2c8:dc70:ab13 with SMTP id v9-20020a5d6789000000b002c8dc70ab13mr14211721wru.18.1678361026031;
        Thu, 09 Mar 2023 03:23:46 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id d18-20020a5d6452000000b002c71dd1109fsm17321700wrw.47.2023.03.09.03.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:23:45 -0800 (PST)
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
Subject: Re: [PATCH 10/22] drm/logicvc: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-11-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-11-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:23:45 +0100
Message-ID: <875ybacgn2.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_032350_188076_881B268D 
X-CRM114-Status: UNSURE (   6.66  )
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
