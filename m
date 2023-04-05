Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB613C76188
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Apr 2023 11:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QN9Jb2rdv/PPZvyPDKk1rEGe1+KBvkf9L7UBqwEeqwM=; b=zZtiENxpJ5EZRZ
	58QdT5wApIovkNzfnnYCBX0pxQte2m+7fnA74lP0zv+GqboJ627OXqSQ8uUnHYP9WxVlRzWyCE9UR
	myclmMaymCNgZL1mLH2LAdtuEp8xO2EwXSOo7xwWZCEJHHbIhi8XuMdkv44/w1iszTH2hdM8lTAYi
	y1pEtbyVKo2C1JDixi11XNI8Mi8/haM5Hv1NoRktR2njZjDdxbrIMmKVIPouu7pGX8Uvhv4dNkPIA
	k7KX7pnAfT9AbxdaSHpNhKbfl5ZXdYyqubf4kfIFDaK7y6F89nVeflsM42LmeY+aPsrilfn2SLUO5
	352iLhax+Gi2j1RBZIeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk1Lm-004HDs-2I;
	Wed, 05 Apr 2023 11:30:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk1Lf-004HBP-0M
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Apr 2023 11:30:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680694241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RNLFmKiaJhCbpMv6NNLJ01MSUH3fUGQXMqewzc3mLvQ=;
	b=BZs+HwCcgryZzf0yFcaLKg69NyJNanxskTnW0zXXUGJKeu9o1+gsgna9jDCWWmJNrV8hA0
	MJbuFujqipGMwje2djkZEnoVerg5l53c+vft//Xqbkx+aOtRJ4mvKKgS4IvmcGjy35AX2H
	N9/FQMgKqQhgY4ur/qYUpphmCqea0Ms=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-W_dpLYHhNZSFytRKF_dF4A-1; Wed, 05 Apr 2023 07:30:38 -0400
X-MC-Unique: W_dpLYHhNZSFytRKF_dF4A-1
Received: by mail-wm1-f71.google.com with SMTP id m5-20020a05600c4f4500b003ee8db23ef9so18834699wmq.8
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Apr 2023 04:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680694237;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RNLFmKiaJhCbpMv6NNLJ01MSUH3fUGQXMqewzc3mLvQ=;
        b=ZPoeiM5oj0AZ4EE3cS6cE8XcgqbX21D6nsFaH49dB0e2r6BXiW7JO8zY5sm10tc3My
         2/EcAyeDvqTMbrz6hXNzgIy/E1ROvswkjSTqDwi6XzNsjvUIS3ZOHdFv1HqS3efMEb6n
         qMnu93WfEvwjRW3T0gD/Mc/pNsyNq75xvMbNPHIZkrEbrjnTUk64kuSGBiDpb7ixhSmp
         w9Z/uRmRSuBxMVR9EGAHfhZHjfN4j33sZiAJGp0BnRXS1vCRzEVsC/nSIV5bWbq3ferU
         fFJauSwKV4DdEXCtOn4s7DXBEklyieyRq58TG+ZFFkg5851dpr5YxcUuS8orMFpQLQz9
         tMwQ==
X-Gm-Message-State: AAQBX9cqXDpk+bUjBAE6BuD08n6/tVJUVLLkqKYfRmSzWpHGZP14uKCx
	7Av2N0JY6i9QELj3y26s16FPGKGJ9EL/h1tQM31xVqXvKva0KqdEl5Xxgk3155ZkCfT1S+6KMtN
	WekO5CT3SePkiKKGhW7vaOAc8cfVXXqU=
X-Received: by 2002:adf:e409:0:b0:2ce:a0c1:bcaa with SMTP id g9-20020adfe409000000b002cea0c1bcaamr1759125wrm.9.1680694237463;
        Wed, 05 Apr 2023 04:30:37 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z+rEnxummXTXBERQ/WiQlDGMhXDsQ6asLHd92imjUbjJ+WG229BKVrkkBNa50e3N/32xHrgg==
X-Received: by 2002:adf:e409:0:b0:2ce:a0c1:bcaa with SMTP id g9-20020adfe409000000b002cea0c1bcaamr1759090wrm.9.1680694237126;
        Wed, 05 Apr 2023 04:30:37 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id w3-20020adfcd03000000b002d45575643esm14727267wrm.43.2023.04.05.04.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 04:30:36 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Daniel
 Vetter <daniel.vetter@ffwll.ch>, Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Deepak Rawat <drawat.floss@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Emma
 Anholt <emma@anholt.net>, Helge Deller <deller@gmx.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-hyperv@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 3/8] drm/aperture: Remove primary argument
In-Reply-To: <20230404201842.567344-3-daniel.vetter@ffwll.ch>
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
 <20230404201842.567344-3-daniel.vetter@ffwll.ch>
Date: Wed, 05 Apr 2023 13:30:36 +0200
Message-ID: <871qkyd0rn.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_043043_223218_22534D93 
X-CRM114-Status: GOOD (  10.15  )
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

Daniel Vetter <daniel.vetter@ffwll.ch> writes:

> Only really pci devices have a business setting this - it's for
> figuring out whether the legacy vga stuff should be nuked too. And
> with the preceeding two patches those are all using the pci version of
> this.
>
> Which means for all other callers primary == false and we can remove
> it now.
>
> v2:
> - Reorder to avoid compile fail (Thomas)
> - Include gma500, which retained it's called to the non-pci version.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

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
