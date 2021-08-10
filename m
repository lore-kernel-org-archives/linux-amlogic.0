Return-Path: <SRS0=4Wh7=NB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62959C4338F
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Aug 2021 07:56:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC62A61051
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Aug 2021 07:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC62A61051
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=oHwBXSh6SwLPaRl7AeHuNNeeF6gtg7ySnWI2Xsk38Eo=; b=dinSAsMDZ9d9P6ePIwcW52oZSi
	1juqznhk6ZDO34Lzt2+Fh0kpHuGo2MRmnjWL+CIJqW6HyjisjhPnE8ttCwtjPojQ3i0u4VIWSrZ8f
	4ZeIsWE9WgcWa8sFI7r4sahm+WUKdIRTWZCjuIzqBd/AOrt7HBbrj2H5zIPP4lV829b54Sh0Dlhyt
	t5uAv5661dOF8FXrPAfeJ45oEMkeTnL+g2taPuSmXHmBdEP/rr5dO/AKL23Z+ELxh2norHPldVE1a
	qgUwJkyDbetd0NlV96acvtIe479j4iZKrf5UjViKypqVjKdkCs5fm+G1wikU7Bno3iYWUPJyGBBZI
	h04ZaROA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDMcs-002ppu-Ur; Tue, 10 Aug 2021 07:56:42 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDMcf-002pmi-1Y
 for linux-amlogic@lists.infradead.org; Tue, 10 Aug 2021 07:56:30 +0000
Received: by mail-wr1-x42f.google.com with SMTP id m12so24976940wru.12
 for <linux-amlogic@lists.infradead.org>; Tue, 10 Aug 2021 00:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g7xZOOYURLM8XcD5J99k+2d4NDKwxrhzd/8vUo2Rxec=;
 b=lJe8DfOqSzhVqsQKF2gJZOsppP55UjVKP99FQppWg8q90NbCPTzbc1GuDcxAXWe8BI
 NWMh02VhCrqy/UA5hlfI8W6rFsKIVdhASM2hwtpgRomk+sVosEcKadGTHz1WaPtuh8mq
 NmeYsDRp4bqZXgXp5yPmmqJg05jUmIt8PgA/PXIKmQ03U7HEAwlESRKGw+I28sE8ux9L
 IKsV1sSAF4jouBJYewjEGkjkB7Y7b1Na7iakOsCTC7wkd6GIszSS+Dv9w3FD230jT2UE
 n/+3buJdzUHNq+qeJJfwkpwX/tDae1NtkYSOXDfWhw+JxwJ5UsOvOg5cR6G1MEoPDxJa
 Wrjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=g7xZOOYURLM8XcD5J99k+2d4NDKwxrhzd/8vUo2Rxec=;
 b=X9Ui8U1nuk5ruHS5DqRE0qW6b8SrtnMVI8bDO883TMXgSptWX8Uq9ubyieiAYdmb4K
 Y+1z97gZL4MKvVD5bUzrF1n9w/TbGx9/7yQK7bd5FQmRj4a30CvomtJ3l8VerE8UWLph
 KnK2yf5zltg8xsh5j6Q5DQHRnCgxM8yIqQkbH/F5YLciCwQxVxKWY5PH9TUNrhRn7XdD
 a5A0LgQtavlXEhYwhF74Ofsnjf6x2aYRYvez6q9zHHRguQlK5lFx9qcOFk+qougbDFCK
 howw6aihLw9mqfz5gBvfB2bzBIui+AdoFK0CymPTy0vqcobph35YHCpbXaNXhnKMMpjR
 msRQ==
X-Gm-Message-State: AOAM5300xXNkx5/z2KHzVtnhK3gyVxEyqEDnF/ZGzRX45cyL5iX9lYRD
 AilYEr5Xf3P+TXh1/tHQEUhN/A==
X-Google-Smtp-Source: ABdhPJwOZhP4fC1wKufdN+dukh6SNDa58xx8JMlRd8bbRZsfg3aDAUj8aZIsq9rgX3dFzWSMa1Y5Ew==
X-Received: by 2002:a5d:6107:: with SMTP id v7mr7785077wrt.408.1628582187453; 
 Tue, 10 Aug 2021 00:56:27 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:b710:2b6e:27aa:f0a0?
 ([2001:861:44c0:66c0:b710:2b6e:27aa:f0a0])
 by smtp.gmail.com with ESMTPSA id c9sm8087681wrm.43.2021.08.10.00.56.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 00:56:26 -0700 (PDT)
Subject: Re: [PATCH] drm/meson: fix colour distortion from HDR set during
 vendor u-boot
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Mathias Steiger <mathias.steiger@googlemail.com>
References: <20210806094005.7136-1-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <75c870f1-af7c-88ac-9884-43cc62b22411@baylibre.com>
Date: Tue, 10 Aug 2021 09:56:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806094005.7136-1-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_005629_121186_3BA589CA 
X-CRM114-Status: GOOD (  23.73  )
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

Hi Christian,

On 06/08/2021 11:40, Christian Hewitt wrote:
> Add support for the OSD1 HDR registers so meson DRM can handle the HDR
> properties set by Amlogic u-boot on G12A and newer devices which result
> in blue/green/pink colour distortion to display output.
> 
> This takes the original patch submissions from Mathias [0] and [1] with
> corrections for formatting and the missing description and attribution
> needed for merge.
> 
> [0] https://lore.kernel.org/linux-amlogic/59dfd7e6-fc91-3d61-04c4-94e078a3188c@baylibre.com/T/
> [1] https://lore.kernel.org/linux-amlogic/CAOKfEHBx_fboUqkENEMd-OC-NSrf46nto+vDLgvgttzPe99kXg@mail.gmail.com/T/#u
> 
> Fixes: 728883948b0d ("drm/meson: Add G12A Support for VIU setup")
> Suggested-by: Mathias Steiger <mathias.steiger@googlemail.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> Tested-by: Neil Armstrong<narmstrong@baylibre.com>
> Tested-by: Philip Milev <milev.philip@gmail.com>
> ---
>  drivers/gpu/drm/meson/meson_registers.h | 5 +++++
>  drivers/gpu/drm/meson/meson_viu.c       | 7 ++++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_registers.h b/drivers/gpu/drm/meson/meson_registers.h
> index 446e7961da48..0f3cafab8860 100644
> --- a/drivers/gpu/drm/meson/meson_registers.h
> +++ b/drivers/gpu/drm/meson/meson_registers.h
> @@ -634,6 +634,11 @@
>  #define VPP_WRAP_OSD3_MATRIX_PRE_OFFSET2 0x3dbc
>  #define VPP_WRAP_OSD3_MATRIX_EN_CTRL 0x3dbd
>  
> +/* osd1 HDR */
> +#define OSD1_HDR2_CTRL 0x38a0
> +#define OSD1_HDR2_CTRL_VDIN0_HDR2_TOP_EN       BIT(13)
> +#define OSD1_HDR2_CTRL_REG_ONLY_MAT            BIT(16)
> +
>  /* osd2 scaler */
>  #define OSD2_VSC_PHASE_STEP 0x3d00
>  #define OSD2_VSC_INI_PHASE 0x3d01
> diff --git a/drivers/gpu/drm/meson/meson_viu.c b/drivers/gpu/drm/meson/meson_viu.c
> index aede0c67a57f..259f3e6bec90 100644
> --- a/drivers/gpu/drm/meson/meson_viu.c
> +++ b/drivers/gpu/drm/meson/meson_viu.c
> @@ -425,9 +425,14 @@ void meson_viu_init(struct meson_drm *priv)
>  	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM) ||
>  	    meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXL))
>  		meson_viu_load_matrix(priv);
> -	else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
> +	else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
>  		meson_viu_set_g12a_osd1_matrix(priv, RGB709_to_YUV709l_coeff,
>  					       true);
> +		/* fix green/pink color distortion from vendor u-boot */
> +		writel_bits_relaxed(OSD1_HDR2_CTRL_REG_ONLY_MAT |
> +				OSD1_HDR2_CTRL_VDIN0_HDR2_TOP_EN, 0,
> +				priv->io_base + _REG(OSD1_HDR2_CTRL));
> +	}
>  
>  	/* Initialize OSD1 fifo control register */
>  	reg = VIU_OSD_DDR_PRIORITY_URGENT |
> 

Thanks for taking time to re-submit this patch,
Applying to drm-misc-fixes

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
