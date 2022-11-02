Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5992DC433FE
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Nov 2022 10:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cUcYynlpavM60JshHZxLCsvqli6rivYMKS6t0OT1xd0=; b=E36RYAJdXr2lsB
	MXo0nmr73NE85hqqAP7b6cCprAqMwIo8EHSplLII1Bezgoh9uEm3HlkQjUfoeDfDP6imCZ3zUNaA+
	bUWqSljO8BfyEryhR8EXWt5cCjsBiLLAQNm5eehbOUiFU6plyxS3dkVjeZh2trw9Mm5QV6SxJidjv
	6GLF9MbU/y7Qrg2Erzr6QzPx9KSBdSMdTeQCXLGXNMXmSHb3zkUeaR8V6QRKxwymyR3IJi2Cg/Mgz
	x4Nh/MTMQr45lo4muK4kmJgrCElrZORJKHJ/VpuSmK2OSM4wXNSaWD9VOky3DlNWAuOH88NhyR1zO
	cdRZJCNABGTkrPM7XyGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqAaQ-00AQEN-E6; Wed, 02 Nov 2022 10:03:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqAaN-00AQCq-Tj
	for linux-amlogic@lists.infradead.org; Wed, 02 Nov 2022 10:03:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667383383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lYDm2f88uo7N+T5CuGh2kGVIDaWbYMjQLaRZ3nU/m+Y=;
	b=OpmiEAshpilxSdy+Kw+yLMEPdCdSUFG/DbPfoMwuPjZJIK/Z3Gj9Dc5XtywiTKVKx4Yn7J
	ipQZbssa+I8T/t/mtK81Du05KgquxDBwY2pgSAkFUM+Ufry2mDO0CC5VG1rTOhA+qrqYWQ
	Lh+A815ae6jbWmtPmSipjwg1mHQDbCM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-534-jLoCXAr8O6-PIC0ayxbvpg-1; Wed, 02 Nov 2022 06:02:31 -0400
X-MC-Unique: jLoCXAr8O6-PIC0ayxbvpg-1
Received: by mail-wr1-f70.google.com with SMTP id s11-20020adfbc0b000000b0023659af24a8so4665144wrg.14
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Nov 2022 03:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lYDm2f88uo7N+T5CuGh2kGVIDaWbYMjQLaRZ3nU/m+Y=;
        b=6WjUXXQv9PdWMiuu7TFzhoeRsxKgGNt4a8pLZO/L7bPQMk5ontqxj4VnOmEcHdfL0Q
         z20ObFZspSbBPxvCOGDGSiHVrT91daf+EAOgs7QIm2ByPDl+b+qx16ysjm13m4Atvvp1
         nkTnF4ZZOhmT90KVDWpPH5GQlpSVdn/knrKYgRWcePa78KpDLAMPuRPqCfOh2Zy6a1MO
         +/9fKFUuyKWeU47vbrYwddBBnZTUIWUGFLSkhLq61vkuvtxdU/rp/PvMLlZgvUa306Ko
         00vSm7rNeZodwGfyckUrz2jiXKr5eSZ48Ztz/qrIb+jkbvmsOmf+Gk0PSc7l4uxiRFlO
         WLYA==
X-Gm-Message-State: ACrzQf1kzB5YaRQ1BwsQO6ZEo73JMGI3596p3I2XAheqHsatKXIrsT1e
	EpgEVIO3L7x6pPhyGaBpUqgjc54P4O0FpHHD5WX9TucZDCjZzEC80TVBAEiTcXaZd+30MAl0tck
	ZUb+RrCMf2yux7BCYKSawjTj/XGuiPHc=
X-Received: by 2002:adf:f9cf:0:b0:236:6a26:c055 with SMTP id w15-20020adff9cf000000b002366a26c055mr14584866wrr.195.1667383350613;
        Wed, 02 Nov 2022 03:02:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6OHHkFmpcUlQhLx4VZSF/FNGP0hsrmpEExWtKIxFg2Jf6dmbAckk/gQVQTytU8dXpfU2B04w==
X-Received: by 2002:adf:f9cf:0:b0:236:6a26:c055 with SMTP id w15-20020adff9cf000000b002366a26c055mr14584846wrr.195.1667383350420;
        Wed, 02 Nov 2022 03:02:30 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id fn13-20020a05600c688d00b003a3170a7af9sm1564836wmb.4.2022.11.02.03.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 03:02:30 -0700 (PDT)
Message-ID: <68309442-ad39-36da-b1ec-680dd4129a7f@redhat.com>
Date: Wed, 2 Nov 2022 11:02:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 21/21] drm/fb-helper: Remove unnecessary include
 statements
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-22-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-22-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_030304_052723_6D1FD839 
X-CRM114-Status: UNSURE (   8.24  )
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

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Remove include statements for <drm/drm_fb_helper.h> where it is not
> required (i.e., most of them). In a few places include other header
> files that are required by the source code.
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
