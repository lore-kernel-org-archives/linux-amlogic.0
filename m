Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56889C001DE
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Jul 2023 08:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXMik+eLvq+jc35uMGXm6q8hMBIHmfBRG1Gc3LAD/K8=; b=bWIDU45PnyZX9ZjMkMmZZDjG34
	KIjF3k1dEbTZ0qIkSa6Uu7GpowPyDoNZZ/rbvJdlbGJx0npTCt71AEAwekIuP623oIvpBbv5gufdG
	P2BdiS3OQJa3uGPhnLjMqzI6KuEDIEBiyid8yEjC0FQ2sV2oBCQE3sU7m4j6hIWAUlOhW+wXDunpc
	QRKGK0i1RYxB6Xlju4SgvOONSRQKdF9oEMrVqZ0w84ACm7Tay3eAtKS6GONhwtB1miVd27zAGkNji
	df+s2NLLrK0aC/fewQjSPD6A3InB/zLB19nOylfURzKxXNxTMaPUWJ+MLiFt9IKq5Gr5c8o2lXFmW
	LNNRcxsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOeL-00EbBn-23;
	Mon, 31 Jul 2023 08:53:09 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOeJ-00EbAo-1Y
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Jul 2023 08:53:08 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-307d58b3efbso3767149f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Jul 2023 01:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690793584; x=1691398384;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ramj4YSnzjlXBa9BeMFid4H4KLnlWvwglhchgdb9pJQ=;
        b=l/VccmoBzlMOT1o3Wl9Mjxa3pmorkGuXy9sC3L4wJ32bJUrV5Ke5ximGyMQ+td0muc
         KDTOZIuMN0Prgv4h1KsYAft5qvJXhcLiRyyy/7szNt6RnWuDdUMi++4DwLNge33Z95Bs
         X2PjbuD3YCmgpA3YrKYnQZVhX0xwMPvApdeaujfS2NUgSoLAQXkDQuO+58IkvQc9NoyK
         0qe6tvPxs/vxPxp0hmMZ6x8284YAH4VFTnBNca8KIwWNNjHV87LjCsaVGElWirqwMshI
         L80fzIzZQqF2I95X/vTp0w+2zfwVGIfyfh8mcFY4UICtuM7tkb4wDhAn7thnleAVoyhF
         N35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690793584; x=1691398384;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ramj4YSnzjlXBa9BeMFid4H4KLnlWvwglhchgdb9pJQ=;
        b=EfIQkXV5Q30t++FLmCTjEvRbRLNhSrz0hyY9z5x8ADvX/tuXukgRhUyj39uu3x1q+e
         e/cdEQtYY7mHKchNll3Lk6+m8wgX3ZUBUT7ikCu6mX7lXH50s1vGxBxMwMKJD8LHTyLm
         4qIXWhatJAss6+nQMnsm1TtTSsDNjf0GHwpfrqd5q+4GY8jsm5J9yvifMqr3MFtqjMom
         8uxLlH+MBuL4zHsKmLWfTs5eLxcyr8Vs3RYQYx9gVx7Y79UBowyRhCZZcDvWIoWxtg/J
         h2CO1nf7dgPwG94ptUepMU47Iub8ec/8kt1K6N12kgetZF9QCxAFrvliDY0ODGZcZIXB
         Mcpg==
X-Gm-Message-State: ABy/qLaP47njUDGtsjRxPPbhc7GUFLi7/xyiaB4wxZow09onHGbrcCnU
	+4N3Jn61Uu35tHDdtmVqNr1WnA==
X-Google-Smtp-Source: APBJJlHITvV64XzWf9SsC3Gc9f8URyA8qrsfJY0PwJLzJDE8ULmjuFQZ8qfCZnuilaE4S0mptQdgKw==
X-Received: by 2002:a5d:4e43:0:b0:313:f1ec:f429 with SMTP id r3-20020a5d4e43000000b00313f1ecf429mr4285517wrt.46.1690793583729;
        Mon, 31 Jul 2023 01:53:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:14b8:9aa7:6bf0:256d? ([2a01:e0a:982:cbb0:14b8:9aa7:6bf0:256d])
        by smtp.gmail.com with ESMTPSA id w10-20020a5d4b4a000000b003176c6e87b1sm12151354wrs.81.2023.07.31.01.53.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 01:53:03 -0700 (PDT)
Message-ID: <768ae986-a67b-fedc-d43b-94096d1dd6bb@linaro.org>
Date: Mon, 31 Jul 2023 10:53:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] firmware: meson_sm: fix to avoid potential NULL pointer
 dereference
Content-Language: en-US
To: Zhang Shurong <zhang_shurong@foxmail.com>
Cc: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <tencent_AA08AAA6C4F34D53ADCE962E188A879B8206@qq.com>
Organization: Linaro Developer Services
In-Reply-To: <tencent_AA08AAA6C4F34D53ADCE962E188A879B8206@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_015307_521439_1174DBE3 
X-CRM114-Status: GOOD (  14.76  )
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

On 15/07/2023 16:13, Zhang Shurong wrote:
> of_match_device() may fail and returns a NULL pointer.
> 
> Fix this by checking the return value of of_match_device.
> 
> Fixes: 8cde3c2153e8 ("firmware: meson_sm: Rework driver as a proper platform driver")
> Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
> ---
>   drivers/firmware/meson/meson_sm.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
> index 798bcdb05d84..9a2656d73600 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -292,6 +292,8 @@ static int __init meson_sm_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	chip = of_match_device(meson_sm_ids, dev)->data;
> +	if (!chip)
> +		return -EINVAL;
>   
>   	if (chip->cmd_shmem_in_base) {
>   		fw->sm_shmem_in_base = meson_sm_map_shmem(chip->cmd_shmem_in_base,


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
