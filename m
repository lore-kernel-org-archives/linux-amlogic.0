Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20FFEB64DD
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jul 2023 06:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bQUG19eayNq1zLUee2jCMKSkewswfWKuuy2Aufy28t8=; b=jEdOIuvWnakytuvZMgfBZepEUs
	12TbBlmaHJkQSTrUBJKtx8xzwj09y6qNBdM/jMAH71QsMwyIrRYkT8FQCMTq9IO+mEPJCW+SOIZAz
	jG118kGt6mwOD8+Z+O/n9zyer7dPSopp+i/b9VLu2uR6mASuB0KMZ2ZmsD80nD2kkJKrXl63pAaEt
	4C3Vy+q0+wSgZIe25V7YaawHex7m4lUO8vqN2smLqkdRsPTz2xJ17RD60m/nJUlI1PUFSYT5fbJNk
	n172RmsfrVKTvhr8dmFBlq24l6PS7gs0IuzWjdWzy7gnol4FtIYl1bN3UFbW2wQ0gn/8OnfWXZs8E
	jKwxeqSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHIxP-000ign-0H;
	Thu, 06 Jul 2023 06:59:15 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHIxM-000ifh-2z
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jul 2023 06:59:14 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fb77f21c63so353303e87.2
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Jul 2023 23:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688626749; x=1691218749;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n9jFGb+PSmEKw8iM/L00npVmUzIMITjEUhyzwx30WLI=;
        b=bmDp52z15koXF7vGD+7OtpSMg8hXMZxBA5HXT+R2fq3fCMXEPDAL6DMaPcZrckr+L5
         kQRjAKeMtrn0RWYeixsJIdXvpfEkHydJscG8G8oy7nFvsV0WBJZHENFa7tyY87aufkrR
         WmysYoFxfFwHVOzn8HTqVamcfMl31dAG1T9yzKiB7GxN4HtGXPbjAW9dOOHZ/v8R+xB4
         RRpVHVhZgfR2oQNn2INzHjN1qzM1cJ5Rs5mMHwRzKjKJPwaAllJ0GoMiS/zgLRJzITyN
         5S4Aqakeq9i9MbDh1OAp0bkOvLRo0OiT0Jp/aihP30j9ohvhtEXwFROlJ8glr0V0hyLi
         a21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688626749; x=1691218749;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9jFGb+PSmEKw8iM/L00npVmUzIMITjEUhyzwx30WLI=;
        b=FCSkJjEQ/PZtG+awtKMod4Dyep1+22y7uBGMNxIx5lVEy46hzajOH9O+JjD1+lOaxE
         UmqKN6aSN4+CQnNJGGo/MuwF+D8wiAXokqk1WeGD7bBVJUCJAELyWvG0xdWUbpJQqWuN
         Q2l9SfhYAWJQx8cR5EIy10kx0hg/rG7+HvH3u1rhRK6bUHi/RpEK+eDJWEm7xLmVyYzy
         nqBGcunzyowqW6aoLE59m5Q9MY/Qw2jJmSuIfrCexTaLJ8lFoI2qNUwIrdl2fpFbAPZ7
         IhFJOKhx9ZxohwqjP6zPmCEYFZfvno+y7R70ZHhasA7YkuP9o+Qbt9cvbehMDyMNPPaH
         dt/A==
X-Gm-Message-State: ABy/qLbe2PqJBBW9h9jyN5ODuy78TKVx6piRRK8UMRg1qFnQ4MioGZsr
	liht4U1QibdS0ToMdDlg7dohEQ==
X-Google-Smtp-Source: APBJJlHTzvV9NhPMkxSawgnU9Y4RN/6R8ct5nXX+3GLyP9CpFEYnVs5XlufLfY0d5j2KuXPAyOMDFg==
X-Received: by 2002:a05:6512:451:b0:4f9:5ac3:4133 with SMTP id y17-20020a056512045100b004f95ac34133mr825472lfk.25.1688626748995;
        Wed, 05 Jul 2023 23:59:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:15d1:2748:ead4:bdff? ([2a01:e0a:982:cbb0:15d1:2748:ead4:bdff])
        by smtp.gmail.com with ESMTPSA id z8-20020adfdf88000000b003143bb5ecd5sm1001522wrl.69.2023.07.05.23.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 23:59:08 -0700 (PDT)
Message-ID: <3beac94b-1a82-df36-1390-8321aa1a8e57@linaro.org>
Date: Thu, 6 Jul 2023 08:59:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 1/7] tty: serial: meson: use dev_err_probe
Content-Language: en-US
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, gregkh@linuxfoundation.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jbrunet@baylibre.com, jirislaby@kernel.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: kelvin.zhang@amlogic.com, xianwei.zhao@amlogic.com,
 kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230705181833.16137-1-ddrokosov@sberdevices.ru>
 <20230705181833.16137-2-ddrokosov@sberdevices.ru>
Organization: Linaro Developer Services
In-Reply-To: <20230705181833.16137-2-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_235912_993280_05540166 
X-CRM114-Status: GOOD (  14.97  )
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

On 05/07/2023 20:18, Dmitry Rokosov wrote:
> Use dev_err_probe() helper for error checking and standard logging.
> It makes the driver's probe() function a little bit shorter.
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>   drivers/tty/serial/meson_uart.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 2501db5a7aaf..bca54f3d92a1 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -726,8 +726,8 @@ static int meson_uart_probe(struct platform_device *pdev)
>   	of_property_read_u32(pdev->dev.of_node, "fifo-size", &fifosize);
>   
>   	if (meson_ports[pdev->id]) {
> -		dev_err(&pdev->dev, "port %d already allocated\n", pdev->id);
> -		return -EBUSY;
> +		return dev_err_probe(&pdev->dev, -EBUSY,
> +				     "port %d already allocated\n", pdev->id);
>   	}
>   
>   	port = devm_kzalloc(&pdev->dev, sizeof(struct uart_port), GFP_KERNEL);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
