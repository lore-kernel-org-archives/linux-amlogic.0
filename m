Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF65FC61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 11:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Po+ZQShSUBvhBgO0Sppi4ix4D9HDRWQMBcE56Piy99g=; b=eXuTKdc5Z+dujx
	o7K+fC2EpPdrhiP6YYibpuQMn2U3TI2WVlkPNmAXsirROFrqqw9s/HxF+KFMI6ghaXXLsm9zHzvOS
	q5uMfDaLc84NE6r/g/KpuEPWmqQS7AIBFp9efKSdMfiILmRIvc08sQEnRcmHeaZWMdnmBn4RQ/uyd
	m/4EDKlW2G7xWIpURcfpi1utIi0fbXpcsD15BRJHPTaZob+pe3jga7CDvmvCiSxdzEYIZ3IAG67YI
	5gKCDlikhKWzH61YxyXBAR3Gie3bjukzEiPWi87VvMjzvwhBXmmQ2Cq+PxaH8hhFH+r/lCqZL7kJL
	VsMxE/WKlFzAaDZeiFsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paETy-009WWj-B7; Thu, 09 Mar 2023 11:30:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEHQ-009PQ7-OQ
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 11:17:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=KFI5NolLW00M30XYJxkQ4MIHgLq0upzBFWGrVN73sW1eARaypBeC/FuDewBCvaVTJctFoq
	iIEqDyM+fu03ea/H2UFE5LU+JNir/dQlYcXI9pEKpD+V8yEto9nPEZstTrMkLCPOFg16Bf
	eJHZuZApcuEiBi9juOPLHameLIR0iU8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-hRFMitJNOmykFsbOaEj6zQ-1; Thu, 09 Mar 2023 06:17:49 -0500
X-MC-Unique: hRFMitJNOmykFsbOaEj6zQ-1
Received: by mail-wr1-f69.google.com with SMTP id bx25-20020a5d5b19000000b002c7ce4ce3c3so347461wrb.13
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 03:17:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360669;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=lEHiE8UbSuVHOgGm32oBbAFR5WHTkX68Wqaoo5xHfR9rx3K1VO2AZnSMZVhpuYVNTd
         qskeaPrg2piI+Jwxv1udLUrqyspq0rnHXUUJCcgZuYjSDSTPomRlJ1deY60z+BbN/ogt
         He8M8J4ayorb6G6UxXU/ZKd0bw7YD53f0nIrNj8XHNqZaAb7aoZs5sIksaISlXfJ8heW
         I4wGreZ8J0xkbIZZPzROcgYtNEW/081/9UQ7Df/Y3A4RQsf1qgdFo9p78F4sEGu34Sbt
         O6SP48h2N/RAeALcG60Tj7cULF+CTuQX/xv/BzwcgvS131b6UVR3JytQHUyZJe9PCJqt
         Cq5A==
X-Gm-Message-State: AO0yUKVR/LNvkDiEUqPFgXta4Yi0EdG7fEc6O5B7lZGSpvGZUMV8a32R
	ONTEav3F/abk1o4xwbTW3rXlKGijQT6mzqo5NlTXeOiCEgYC15qs4Lih8+srMx35hOqK4NUUEl0
	dBKYD4rCeFViP9c6BEz2+Ki3RojI4MJ8=
X-Received: by 2002:a5d:670d:0:b0:2c7:1319:7b1d with SMTP id o13-20020a5d670d000000b002c713197b1dmr13606694wru.39.1678360668802;
        Thu, 09 Mar 2023 03:17:48 -0800 (PST)
X-Google-Smtp-Source: AK7set8t7W3VVjilkedn2prHPhya2P0ttMZiu2dHkADuEES7J7gfekac/bMcyXv4f/qMKVji9jryrA==
X-Received: by 2002:a5d:670d:0:b0:2c7:1319:7b1d with SMTP id o13-20020a5d670d000000b002c713197b1dmr13606665wru.39.1678360668526;
        Thu, 09 Mar 2023 03:17:48 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id c12-20020a5d63cc000000b002c5801aa9b0sm17711159wrw.40.2023.03.09.03.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:17:48 -0800 (PST)
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
Subject: Re: [PATCH 02/22] arm/hdlcd: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-3-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-3-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:17:47 +0100
Message-ID: <87y1o6cgx0.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_031752_987037_25E588BE 
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
