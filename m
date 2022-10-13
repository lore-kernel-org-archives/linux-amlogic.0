Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92A3C4332F
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Oct 2022 06:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6PweT5WiJEQGgk8dLmxyGB6daHQ2Ehcim4xOd1z1zw=; b=Xt2e6V7oQt0UvdnJAdYb/1gALI
	JO1JmdZyR4gkL4mDdOoZVR6ihjIAzS+GTX+fRsB2AZGf1XX4X9oEEBgZmLlAKXn5QnvqzofiCpIXX
	z4F8toTMuX8/m8Et1FGNksz77RfS2ihvubI0FQLao1G+PgpHseHwMtmzs8449F4y/jGWosU6l1Ar3
	lvNcdUTqckL1C3MA8b0B6EFmz7d0fCqTa/kPVLYiQ+uRn8jhT9tiZ7IKkqXNpgUFirXYofE6TJ37H
	vdqfX/cK27mOus150xsVAZ64GbolNm9Rq0s6/L7ZP18xCI/FWSWpZa7te797vhdSEzaAZ8c05Qg97
	AVz64R3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiroh-00Arwl-CB; Thu, 13 Oct 2022 06:35:39 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiroe-00Arva-2w
	for linux-amlogic@lists.infradead.org; Thu, 13 Oct 2022 06:35:37 +0000
Received: by mail-wm1-x329.google.com with SMTP id n9so558945wms.1
        for <linux-amlogic@lists.infradead.org>; Wed, 12 Oct 2022 23:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ad6t0uqGWVJ44zoze6OqxJ+0EbFaaFeDJhLvuHxelJE=;
        b=gDZTDHiBofgyauaDwnqK6zQAfw+OCNIJIPu9vPc6qja1dciBLmpAgCFrjGifJ1s081
         P5s/9/i2Uvqtg7QkdvDS1tgNDfIIeAR/O1MfLpY0tqsAnBxjRF6rk8Ywrv/Slxs8QJIv
         Mk2koqyyZomyZ1/zXgAPOss4Y8V8uPPN9tQLtGzFfyIAUJ2Xoa/AaHlPE+n16XjSgvkA
         6ykhLRpdN5b+M6tLQilm4nxYWeCwi1yxqQpM9X8OEpyhpJgkeLXfvfjuGvMnpD5ZGA9A
         R6O8joG3vQB5klrMm7t5m+xDYhVBG63zkT7KYRYt0qoi+3pMuABV7FNKwQJc9kGGThCb
         BV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ad6t0uqGWVJ44zoze6OqxJ+0EbFaaFeDJhLvuHxelJE=;
        b=BE6Bs91aMLP/w7Qwk0yTuVfvwn6iglQdrgJJg1qpQjdGJGZ7MmUdzZesBNeZjPke/n
         +8pDrpy64/1wdx80MQZTPy0V2HVfe1DIU+1FDVd15+ex2pGg7MMa95CUHS+6bkXqiaqp
         0fQ5ISs/48yQ+J1FdZJDgP06aMhLvLIy/GZhsDcE2casxi8ogewrf/1NaZiGw8kpnHqc
         yQUy2La7xWVCId3Zvchw9YJuBj/SOvPHENjHb5+ncXqiGH+JFz7g6zk+McVGi8OnJXKB
         CxaFRQBhZVN7tJWeX5Cg1HO2Mf+WnPCYdE+U0TuimUaKW960785XxaMkb4WBtPXx8Xz6
         F0/A==
X-Gm-Message-State: ACrzQf0XWzT078BMDE8pks3hww9uuNrUgXBLrVjPgZKJEDnFZ6kgpnX/
	CVGjWHw6hJA3CEDLdOoQvw1w9w==
X-Google-Smtp-Source: AMsMyM7PeoryycruOSk5MAIFALAVpRMJZCn11Lyo/I45FavURextDXrWr/zktLQ2xOhVoujOtdzxoA==
X-Received: by 2002:a05:600c:548a:b0:3c6:dd03:2d31 with SMTP id iv10-20020a05600c548a00b003c6dd032d31mr1275616wmb.95.1665642933077;
        Wed, 12 Oct 2022 23:35:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cb49:9049:c0a5:d695? ([2a01:e0a:982:cbb0:cb49:9049:c0a5:d695])
        by smtp.gmail.com with ESMTPSA id az12-20020a05600c600c00b003a62052053csm4263521wmb.18.2022.10.12.23.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 23:35:31 -0700 (PDT)
Message-ID: <53df94fe-3a86-fa27-c32c-3177bc7080df@linaro.org>
Date: Thu, 13 Oct 2022 08:35:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] firmware: meson_sm: Fix memcpy vs iomem type warnings
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
Cc: kernel test robot <lkp@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20221012185234.never.936-kees@kernel.org>
Organization: Linaro Developer Services
In-Reply-To: <20221012185234.never.936-kees@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_233536_209991_F06A5857 
X-CRM114-Status: GOOD (  15.32  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 12/10/2022 20:53, Kees Cook wrote:
> Use memcpy_{toio,fromio}() instead of memcpy(). Silences warnings from
> Sparse:
> 
> drivers/firmware/meson/meson_sm.c:170:17: warning: incorrect type in argument 1 (different address spaces)
> drivers/firmware/meson/meson_sm.c:170:17:    expected void const *
> drivers/firmware/meson/meson_sm.c:170:17:    got void [noderef] __iomem *sm_shmem_out_base
> drivers/firmware/meson/meson_sm.c:170:17: warning: incorrect type in argument 2 (different address spaces)
> drivers/firmware/meson/meson_sm.c:170:17:    expected void const *
> drivers/firmware/meson/meson_sm.c:170:17:    got void [noderef] __iomem *sm_shmem_out_base
> drivers/firmware/meson/meson_sm.c:206:9: warning: incorrect type in argument 1 (different address spaces)
> drivers/firmware/meson/meson_sm.c:206:9:    expected void const *
> drivers/firmware/meson/meson_sm.c:206:9:    got void [noderef] __iomem *sm_shmem_in_base
> drivers/firmware/meson/meson_sm.c:206:9: warning: incorrect type in argument 1 (different address spaces)
> drivers/firmware/meson/meson_sm.c:206:9:    expected void const *
> drivers/firmware/meson/meson_sm.c:206:9:    got void [noderef] __iomem *sm_shmem_in_base
> drivers/firmware/meson/meson_sm.c:206:9: warning: incorrect type in argument 1 (different address spaces)
> drivers/firmware/meson/meson_sm.c:206:9:    expected void const *
> drivers/firmware/meson/meson_sm.c:206:9:    got void [noderef] __iomem *sm_shmem_in_base
> drivers/firmware/meson/meson_sm.c:206:9: warning: incorrect type in argument 1 (different address spaces)
> drivers/firmware/meson/meson_sm.c:206:9:    expected void *
> drivers/firmware/meson/meson_sm.c:206:9:    got void [noderef] __iomem *sm_shmem_in_base
> 
> While here, fix this warning as well:
> 
> drivers/firmware/meson/meson_sm.c:85:24: warning: Using plain integer as NULL pointer
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/lkml/202210122023.zF56nCzM-lkp@intel.com
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-amlogic@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>   drivers/firmware/meson/meson_sm.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
> index 77aa5c6398aa..4efde225a580 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -82,7 +82,7 @@ static void __iomem *meson_sm_map_shmem(u32 cmd_shmem, unsigned int size)
>   
>   	sm_phy_base = __meson_sm_call(cmd_shmem, 0, 0, 0, 0, 0);
>   	if (!sm_phy_base)
> -		return 0;
> +		return NULL;
>   
>   	return ioremap_cache(sm_phy_base, size);
>   }
> @@ -167,7 +167,7 @@ int meson_sm_call_read(struct meson_sm_firmware *fw, void *buffer,
>   		size = bsize;
>   
>   	if (buffer)
> -		memcpy(buffer, fw->sm_shmem_out_base, size);
> +		memcpy_fromio(buffer, fw->sm_shmem_out_base, size);
>   
>   	return ret;
>   }
> @@ -203,7 +203,7 @@ int meson_sm_call_write(struct meson_sm_firmware *fw, void *buffer,
>   	if (!fw->chip->cmd_shmem_in_base)
>   		return -EINVAL;
>   
> -	memcpy(fw->sm_shmem_in_base, buffer, size);
> +	memcpy_toio(fw->sm_shmem_in_base, buffer, size);
>   
>   	if (meson_sm_call(fw, cmd_index, &written, arg0, arg1, arg2, arg3, arg4) < 0)
>   		return -EINVAL;

Thanks,

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
