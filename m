Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C4CC77B7F
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 May 2023 08:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ROyhoHrmVWQTtu5nLVS30N8uv1MCR1GRdc9EhG2Kp8=; b=NFtesl0JsCvSZkvra/XH4+T1DT
	FS++KcA7W75eA90Cj15lDjK1ubkUuNYYO6DeRApQkc4IZSFj5mzPT361EiXjUUqP/WhbFmCDdXoKd
	cO0ff4gTyVCFqxw2Gc5aEceqKmvmo4CDLb/iXHOtLywYQqPh2c7UNIpZb/I8I5gaCbV6BLj1Sx2gA
	gB9Xzwwpy9Z+Gdap1iro7d+LqDPEWiqewHK4Z8WlFnXr9phimIQxYt84fXstundvQ4Uwy/rOCOhBE
	sUWUDl9XuI/X/VwT9/OdDYxTN2Ia+AaMy1xBn5w4Vtd4GrX/qAnvwfC1dKkcFRQx3Kf8athR0qh0W
	tDr7+HwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px1l2-008FV4-0r;
	Thu, 11 May 2023 08:34:40 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px1kz-008FUP-18
	for linux-amlogic@lists.infradead.org;
	Thu, 11 May 2023 08:34:38 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f450815d0bso20244935e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 11 May 2023 01:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683794075; x=1686386075;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Eyhkadwy76PvtTG8OTGK3oTxfpKVBdNtjIXr+9MoiDs=;
        b=fsubfTEI2BtlX6kxz7dYaSrHibGdZ5zzvXiSkL3zgHh7TgTzu+YfFL/j7LTeGcthcR
         X0wxeAtY7ZOS1spFT1VVA7rWb67xJbO5UVhTw/+L5IO88h8pCEMhXMt60t3UCF5E8xUD
         6jcrmv0XRHF9cbuCK78hozX1rolI+R9JSX+MF9jUgIkkXisgonH+nwYgCX78QBLHJzN0
         6kdeyJTz+6n3mNaoc0RaAE1l4tr0A7InOKo+uYPYtZLXIc8vo3b9WEnvjU8maxzOf4KJ
         887HykpwZKrOp/+6TSaIIokJR91mYFk5ArQQYoBMTP+5kOxqQrGCj+QJ/Q/oPNQPJ47l
         dRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683794075; x=1686386075;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eyhkadwy76PvtTG8OTGK3oTxfpKVBdNtjIXr+9MoiDs=;
        b=QXP1ROdlGIBOFvac+ENkDHeVcDsnuoljgHZozIKO5qQpHHYeRURSaIIvWDzdWpExk4
         Q6d9zw+SSKy9Hb1fDOCVfq3X+YgHRYn3Dl+PLxMDhnjLsN4TeHDcdUClrZvSA1CA7vf6
         9XEE5UvZd/sLRWy1owST/5wiMtSoVOGbCDv4vCuIkj6hpiM3bYp4q2NttBWCRvYhzOaL
         rYeQkI1tmQPzUOQzIG8zwXm+rtX2SyJjyCVhzw4r0nb5NGCvY1tJShRuVyrMZLXfO5fV
         wpqD45FEx/ZRCvrFhRDpDb9DQejS4RrV1nQ798TYETQWbuHWYwLSGBW6IK3Du5KYuUbu
         dHLw==
X-Gm-Message-State: AC+VfDzTX61r2/qR2urlwGQ8KHzkTsLXiJ8BFoCbUoxJVijGXW6YOWGI
	Ek5kIYYPcY8VVZAqKK9GeCFYKg==
X-Google-Smtp-Source: ACHHUZ4gH4IivEWz8QiW7o78Y0QhaNUiSoUPbbKtCiyPYCVSiuxVXZc2m5HIiHYNT+Qn0lAUxh/azw==
X-Received: by 2002:a7b:c7da:0:b0:3f4:2df7:e332 with SMTP id z26-20020a7bc7da000000b003f42df7e332mr5052691wmk.13.1683794075571;
        Thu, 11 May 2023 01:34:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:182d:9e6c:b8ff:5a99? ([2a01:e0a:982:cbb0:182d:9e6c:b8ff:5a99])
        by smtp.gmail.com with ESMTPSA id x25-20020a1c7c19000000b003f42a75ac2asm7531323wmc.23.2023.05.11.01.34.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 01:34:35 -0700 (PDT)
Message-ID: <ed230bf6-ef9c-f7e4-81eb-9c01b447aad4@linaro.org>
Date: Thu, 11 May 2023 10:34:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] ARM: dts: meson8: correct uart_B and uart_C clock
 references
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Hans-Frieder Vogt <hfdevel@gmx.net>
References: <20230510210847.996980-1-martin.blumenstingl@googlemail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230510210847.996980-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_013437_419627_911034BE 
X-CRM114-Status: GOOD (  15.20  )
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

On 10/05/2023 23:08, Martin Blumenstingl wrote:
> On Meson8 uart_B and uart_C do not work, because they are relying on
> incorrect clocks. Change the references of pclk to the correct CLKID
> (UART1 for uart_B and UART2 for uart_C), to allow use of the two uarts.
> 
> Fixes: 57007bfb5469 ("ARM: dts: meson8: Fix the UART device-tree schema validation")
> Reported-by: Hans-Frieder Vogt <hfdevel@gmx.net> # for meson8b.dtsi
> Link: https://lore.kernel.org/linux-amlogic/trinity-bf20bcb9-790b-4ab9-99e3-0831ef8257f4-1680878185420@3c-app-gmx-bap55/

This is confusing, please move this link to the commit message instead, I'll add
the Link to reference the patch from Lore.

With that changes:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   arch/arm/boot/dts/meson8.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
> index 4f22ab451aae..1054297fa69f 100644
> --- a/arch/arm/boot/dts/meson8.dtsi
> +++ b/arch/arm/boot/dts/meson8.dtsi
> @@ -769,13 +769,13 @@ &uart_A {
>   
>   &uart_B {
>   	compatible = "amlogic,meson8-uart";
> -	clocks = <&xtal>, <&clkc CLKID_UART0>, <&clkc CLKID_CLK81>;
> +	clocks = <&xtal>, <&clkc CLKID_UART2>, <&clkc CLKID_CLK81>;
>   	clock-names = "xtal", "pclk", "baud";
>   };
>   
>   &uart_C {
>   	compatible = "amlogic,meson8-uart";
> -	clocks = <&xtal>, <&clkc CLKID_UART0>, <&clkc CLKID_CLK81>;
> +	clocks = <&xtal>, <&clkc CLKID_UART2>, <&clkc CLKID_CLK81>;
>   	clock-names = "xtal", "pclk", "baud";
>   };
>   


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
