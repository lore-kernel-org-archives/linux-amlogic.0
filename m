Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FA0C61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 11:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Po+ZQShSUBvhBgO0Sppi4ix4D9HDRWQMBcE56Piy99g=; b=cSKFBr8lPbMBhT
	cntD6X1LhewFE6or0yN+FD0Yg9SVG1fcgIlyIQGNGkg+Ea927uCiv/vFM0QyFcQI91ZO2PjhZHmir
	6Ncei4wTWnFtI01EYTgX2CNJ+8T3/fb4Va2hw9+tFf3WmObgY4H/4y2SPvvKfzQa8J33ym2HBXE2k
	2n5KpqeBoqXjJhB1Z3QJJunXInpuW0YnqhGImpp9UVRrnNXRXgnzbQaHfdz+/uTLr3r3BmTixDdKR
	m9QQ5Tl1eaJ9UVXCMel0W1i+GZ+iRILSaJH5F1VrmBID1PjaGlUlbuhJGdS6lhZN3fOpPep8z0Jux
	ixv8+myR15s6QbRz1fBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEaF-009Znt-3M; Thu, 09 Mar 2023 11:37:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paELi-009Rpb-IS
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 11:22:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=CcQrOEUB/gHc08FDyHUmbpoI5j6Sxt29lT4DqNfsktbvGB4CYoWTU6NGm5Y+cZuTV9ju5+
	cuoSB8NLuNzi6jh0++rfYbwfGO22kfiwryBDWxs5z7KGzUdVBRyiQ/yb1ydC79sIVR0LGA
	lHgfXd605kMnf4kMXIp0mvlLzqhE+xs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-exJwOCWqNmej1ahTOP6VzA-1; Thu, 09 Mar 2023 06:22:08 -0500
X-MC-Unique: exJwOCWqNmej1ahTOP6VzA-1
Received: by mail-wm1-f71.google.com with SMTP id s18-20020a7bc392000000b003deaf780ab6so649304wmj.4
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 03:22:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360927;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=2/+xAVMavqiW3iPSUrGJC6hQcZZLFC938xighk8gtA3cu4AkK+9Zd7Lj6Dl5jEPYbq
         /cKSrFc0Fl6wKTNqh1+PmL/wyoRsdiHzWvb/a/yjXWGIvUo0Tv7bF5Odk24QTCrg6hwr
         JPIilpOsXTcqQ9majYf3RHS9JjELVVNzPIySDnyo1s5RlypEUoQq1aWjv5ZWPv3VYhNl
         bzyKVT/PdBMPZiuuYq0fF5WYo6+TWiwkwflbMuGXFSeGG7xgnkjaUBWJ5G6Gvui5LxcJ
         BJNKCP623KZYe1Agd+rnVaAa8/8aSqfN+7bQuUqChhaGosCHYThjW+wUc6nRqQ1fPxdL
         xOWg==
X-Gm-Message-State: AO0yUKVYeQw7gySbCYZBUnkexfGakruWWSZ9YqvNWgYjlzylx40klodW
	qtYGyBShv7q4VPs8Mrn24cxzIKGrJ3MTkTFbjsqsIpPPvEu/4SFMHlDIpCP3tXjoBPIN54pIZSu
	eXdGiEWH/nqwKuielX8PJcZJFbRu5LoM=
X-Received: by 2002:a05:600c:1909:b0:3eb:248f:a140 with SMTP id j9-20020a05600c190900b003eb248fa140mr20913740wmq.6.1678360927385;
        Thu, 09 Mar 2023 03:22:07 -0800 (PST)
X-Google-Smtp-Source: AK7set8sm+8KaUtaTToC6ewzxor62agxQaZWhIHs+6czjysLnXbg5f9mG7vIV2yLxia1B+mTwIz1AA==
X-Received: by 2002:a05:600c:1909:b0:3eb:248f:a140 with SMTP id j9-20020a05600c190900b003eb248fa140mr20913724wmq.6.1678360927112;
        Thu, 09 Mar 2023 03:22:07 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id i3-20020a05600c354300b003ebff290a52sm2051380wmq.28.2023.03.09.03.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:22:06 -0800 (PST)
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
Date: Thu, 09 Mar 2023 12:22:06 +0100
Message-ID: <87bkl2cgpt.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_032218_731174_B1403C82 
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
