Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B240C61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 11:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Po+ZQShSUBvhBgO0Sppi4ix4D9HDRWQMBcE56Piy99g=; b=gqmP+/2veCuZml
	HYiaToaAVSMwEpE/PtbHGFMR6I2ThwBCagGp0IMR+jSAjzLSSubaGxYq1fwL208Rb1e+XZZLaVIt5
	fjC6oa1RHnqcnRHydqlj8MQ7N7QbNddMlqIET6SoANWURMF2XNK04bDH0pmTTOAp5ZZ/qvIYnAB++
	fTpAZEppYSiJOF+Lj2ZPKz91jM3PghvqZeB9ih8EcArHVXWKMVYEkurSGbAQobmHNWehy7rxje/0u
	TXrU8BZ1R/yq4R/o2nVoJh2dIIqL105xTaubJAdLEiegU4t3TbASfPIDuTfCyVfWZs4+zo939HHoh
	YzP/t3RB33RtCkVaGILQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEkk-009eSA-Rx; Thu, 09 Mar 2023 11:48:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEQe-009Uiy-Li
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 11:27:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=binvrvhEKYLPQy1sANOy0R9NKSSYw6HUYheSxYZouQ5Rinr3ZE3iGs7R3NK44OooR2RECF
	Ml26tAfR4VBZGVJQrsUZYGzFqcGhc6BXedEX4fm86cSo0f/T1HI69mga9DcxxG4fUKwF4n
	pWJZld/lVRMv0KHaylSigLyJsW7ESiw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-iAoKfJE8NCeZ7jqvSt2iDg-1; Thu, 09 Mar 2023 06:27:14 -0500
X-MC-Unique: iAoKfJE8NCeZ7jqvSt2iDg-1
Received: by mail-wm1-f70.google.com with SMTP id u19-20020a05600c00d300b003eb24ce58ceso542902wmm.9
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 03:27:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361234;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=ZezvnJD4FH2fGuDNJFfozo+7MMjoDmcAy0qbR1yml6UYfDgxRjvg7loHIo3fYuijI0
         bnjCajGTEdlj9woFO1qHZe2XtQgr47NkdRf6tyymGiH6EBl9bylpXKkKo7dVjBfuiN0T
         /OUnHW5OPDRkKt/tn9/yZ4zykmlYnkeY3lP4TAA6dfrcY21kzaXfCDIZsVXuv839myyj
         6roB5OgnZRjKtfyIb0VKTWGV22UzfYqv0le6uBdspB7mnUfa0m/19SO5JSvsuP+LCQX8
         tea6GiiDk7LdsbB85EvAJnQrFgRFXuGGvrZaHp0CJ0/+zBXugnAfe2+PO5TzF79IJFzX
         HeLg==
X-Gm-Message-State: AO0yUKV0SpjlQ3C06DPCaAmLrOs4DFHPiu21bBBhaUbIZGWCd/hzVw2j
	O1PKAkJkNHcZZO5SMpG/3W7pR+bpMpKu0hl2asnDLRqu0C3zwvR9EOW2qXLzq079/kgCKYZ7CAu
	eYqcs3BNx7SXanska9eQJxhMfMovjTCo=
X-Received: by 2002:adf:eec2:0:b0:2c5:8d06:75c2 with SMTP id a2-20020adfeec2000000b002c58d0675c2mr16142997wrp.35.1678361233893;
        Thu, 09 Mar 2023 03:27:13 -0800 (PST)
X-Google-Smtp-Source: AK7set8ARdxfkcrK23hiLLxHMM+1xly+a483wuNbL82OhsV1hVbBQRT5MxfXfizo4EESj/6UVgIYTA==
X-Received: by 2002:adf:eec2:0:b0:2c5:8d06:75c2 with SMTP id a2-20020adfeec2000000b002c58d0675c2mr16142965wrp.35.1678361233574;
        Thu, 09 Mar 2023 03:27:13 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id z16-20020adfdf90000000b002c707785da4sm17592422wrl.107.2023.03.09.03.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:27:13 -0800 (PST)
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
Subject: Re: [PATCH 17/22] drm/tidss: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-18-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-18-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:27:12 +0100
Message-ID: <87jzzq6u7j.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_032724_829643_9090F1AB 
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
