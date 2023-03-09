Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C28C61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 11:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Po+ZQShSUBvhBgO0Sppi4ix4D9HDRWQMBcE56Piy99g=; b=ATO6WjupZBt4m4
	m6qkKk/iLMJiknl0Hi3I6Ph5ISUOkM20IV2nFxg8dxG09PmkPJplVsNzlxRLu04EgBj8Nss0pmReb
	F7sSCoXbzTbmO7dKj2UGM/0jIXjZOa65hVf2TkWAIzttCGuG444lBQ0pg1DTz0rDZUWR/YbpYuCFx
	8rdSWvAwadphHj1A4YCOcYHn6XYR7Gh5pOjO7YyQ65KwdZYYiGDkkmEcYRD274zzIeyvExMUiRbSS
	X2AjrH5ZZogtceRwZz9rUraNtFw0OKy0wNT+/c9KUFpwJ8gVfk7NqFJjNJ+7YMKmFPAfZW8xmRSYp
	mddo+l+dpVqPg3iw3Nqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEi7-009dHr-FP; Thu, 09 Mar 2023 11:45:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEPw-009UK1-JR
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 11:26:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=dyNhlerx4KGeQzPVLdJY9VxEpDzCTyrV4VJYcaj79/bXeb17BW28rHrFQeZrrULp0wu0Nk
	Yqg+k0I23aVXEDWC6CXPOgHW4gtwm+aen/P3xovNsKwOt/Xrt2bl3CEELAYS29f9k66XjV
	UsP8oh8wPGAH/qrupd7RhTP5rXhqPbU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-h9aSDxzTNpWWkrqMnecuqA-1; Thu, 09 Mar 2023 06:26:38 -0500
X-MC-Unique: h9aSDxzTNpWWkrqMnecuqA-1
Received: by mail-wr1-f69.google.com with SMTP id t19-20020a0560001a5300b002ce013276b8so352072wry.1
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 03:26:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361197;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=2+946NY7W4IHqvoIl25BfPZm5GdhujomRkQqSNqmdz0YjGfG8odn3NBPZFVT+T2xHx
         xybFA9swJ0TXxYQFa6Pwhg9175A/SSk0upNzu4GRXO/9VTit0k/b9CROy8kO6YdMLyFG
         tr6J9fRAnG8vyCbV2SFAyhnBTldBGgFUD+iD6rL66TnJNKPPcseVdWu+oju5J0nGqGdy
         u0BbaVKM2uD+4lcYRvNN9nnCGtTUHAokp7YtnCS/LXibu31KeDOiNxtO7TI7ockI7akB
         Wyo8h5RFCpuUY3ALrLGapEZ1NsDQ1TQ29C8oXIWh17itUGzWrSEOAsaSaEljwg9MBjRm
         ErwQ==
X-Gm-Message-State: AO0yUKVUjzAnrbQa6XU9p1qruOKXMe8hU1/sBEJ4mcTDa49Q2QNaFrSk
	FdxNthlcJIc9xIMkaQgbQm6IOeNcL+BoWcGJJWKgcyq4foHXd7SfwTuycMAJqAOxMog+BYUsJIA
	apQP9oxGyiE4oWJnJofKwrTI0zhDukVk=
X-Received: by 2002:a05:600c:19cf:b0:3db:5f1:53a5 with SMTP id u15-20020a05600c19cf00b003db05f153a5mr19369372wmq.20.1678361197618;
        Thu, 09 Mar 2023 03:26:37 -0800 (PST)
X-Google-Smtp-Source: AK7set+RyBjxyYc/phvqksZd0yr2bTO+U8qhrE/l56ozt/Hpw5EwIkObMj058GJMfnxZhhD8JebzIw==
X-Received: by 2002:a05:600c:19cf:b0:3db:5f1:53a5 with SMTP id u15-20020a05600c19cf00b003db05f153a5mr19369354wmq.20.1678361197403;
        Thu, 09 Mar 2023 03:26:37 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id k23-20020a05600c1c9700b003e21f01c426sm2647711wms.9.2023.03.09.03.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:26:37 -0800 (PST)
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
Subject: Re: [PATCH 15/22] drm/stm: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-16-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-16-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:26:36 +0100
Message-ID: <87pm9i6u8j.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_032640_752821_0D6DE5E4 
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
