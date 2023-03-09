Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004B4C64EC4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 11:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Po+ZQShSUBvhBgO0Sppi4ix4D9HDRWQMBcE56Piy99g=; b=nSUgnmlg34lGX5
	9iKcAoNvxwZiP7H84Lo6o2ClN9W8qEEu5PRvHvWmeDIH3Sb0goddE9r3KYHNGNhxqRc9QKnW+XJuU
	+Awws8HbSI7yohIvz77nmoX7QA/vmInOydBmgpTnCMzsGlgRyrU/5tu1Sflp7BX35KxTycwl3Fk0z
	4lkjPVpQJZBQMAlg6xT1Fw2sZrZQXz3Pj7awT4Upa3fzZidfzD0FrDusMth5W4z/sPe1rBg8Xfoy8
	RJ6sKqrkMKEHoghMqXqRGw9npDYsvBpEeny6Gq1irQ48TIdYtRjRPNpaaBsBFRmwXmFBwn1bdLDJD
	KLtU/VMWOMRaTcXpu/ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEdp-009bSA-52; Thu, 09 Mar 2023 11:41:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paENo-009T6K-Uc
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 11:24:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=e5SU6G7bLT6rqVpuM0ywmlGUADmVQh/vuXKIHWHrbbOYs12QHjVDS7mynNo7JeSPVsTfYX
	DfRK2ZnpJ3xQyc2iTWHivjkFQhJQcbVLgTB13ShjLa8sLHK4h5z/o+Dw5Ol5wUTaObFhRd
	5ZcesgTMVhYIWCtl0NoDy+L/drOcFSY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-N38BdjaqP32NYf4d_NQZlQ-1; Thu, 09 Mar 2023 06:24:26 -0500
X-MC-Unique: N38BdjaqP32NYf4d_NQZlQ-1
Received: by mail-wr1-f72.google.com with SMTP id o3-20020a5d6483000000b002cc4fe0f7fcso347538wri.7
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 03:24:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361065;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=VcORE4P5Mq2IqsgUzVnZyhSpTrT6z07OZHKJj7f32PgPGJFPAIu0SMruycGzwitR9K
         tQXy8kEPSPHI+jXBVU1UczWgAGrCxxKzHDX5PyeU5REeCXjo9bSdjzuUbqFx/KOg6s9T
         PvtNJ4boQhGQuqxT4RmJcy13YHlt8O/NIJ/Ody8NSFMVQo+xxN3w8eU0mP+uTsUzKt6m
         RaVYR37eWyRNhTKPfg4QDZY+Do+3SRyewB0Iv43LK1p/+Kig8uXAOUxMTXZJvP6iMImV
         nDAsPpb3EzXo0+Uc+CvBtaSBVrA+6bRIFRlHcg4YsSnioKjirDnP6gm8TqvWLufk1oO+
         EKoQ==
X-Gm-Message-State: AO0yUKVRIM0qdIRmasnHeHtzqHpk6ypCeEysHJ7oXeg+EHpXhyU3MzNA
	mBVW8s1ssYcnDYiDi1beDvLz+vQi3atdno8Nl3WpSQ9ATvhNA7DaYksgZoYy7+VnveHsAtMmkBZ
	Dw1vhgO/l6GIfRWMB9Au7x/2BMgyHzPM=
X-Received: by 2002:a05:600c:45d3:b0:3e7:cee4:f8a with SMTP id s19-20020a05600c45d300b003e7cee40f8amr19365853wmo.29.1678361065654;
        Thu, 09 Mar 2023 03:24:25 -0800 (PST)
X-Google-Smtp-Source: AK7set9lVCuiT3oH2S4c0dL4PFGWn3m73Ldrm4xd1nwgxerYQstdGiySSUAK65ix4kHFEogJnnnnZQ==
X-Received: by 2002:a05:600c:45d3:b0:3e7:cee4:f8a with SMTP id s19-20020a05600c45d300b003e7cee40f8amr19365828wmo.29.1678361065371;
        Thu, 09 Mar 2023 03:24:25 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id r1-20020a05600c35c100b003dfe5190376sm2436712wmq.35.2023.03.09.03.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:24:25 -0800 (PST)
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
Subject: Re: [PATCH 12/22] drm/mxsfb/lcdif: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-13-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-13-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:24:24 +0100
Message-ID: <87356ecglz.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_032429_079563_49EBB9DB 
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
