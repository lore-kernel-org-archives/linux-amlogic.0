Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856EBC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Apr 2022 07:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebqMidJYhL6rvIZsgb0wUR8wfiTy70E03DhCyRfq0aM=; b=xQ2SFdH9LqNH7LW6NVfpBmfpg1
	hNK1FThsvmkgDsELfsgdb7/1Cq51Sy6d4G2eBf03+KkuZlCq96CVsydoWwwFzy5iwsUnymW5+mXyJ
	T3L0gI5zw4EsjbQa5PZk1nODnCbiGPywXOJCa/ODEhJK1cl6cLgGbQznJ+SEZF675owyj/77eZLRv
	zGcCXsnSST72+YMKRAWVSmFfY/iuuXQj5busSjp2o6p7p40xCXq5vkgRQzrF6j5WuJHiEN2Kt/UF9
	bZbV04pjE/zEYWtMmxLt4JFcjnNwqKRBgmhCKUxF74NQQD7tQNRqpkkpcJC42qyXpMpY4/LiVK+1i
	EWQQfImw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncix2-00FVKj-N1; Fri, 08 Apr 2022 07:22:36 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nciwU-00FV1Q-1l
 for linux-amlogic@lists.infradead.org; Fri, 08 Apr 2022 07:22:04 +0000
Received: by mail-wr1-x42a.google.com with SMTP id c7so11566337wrd.0
 for <linux-amlogic@lists.infradead.org>; Fri, 08 Apr 2022 00:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=ZGcjpUUcfgP9IW26yYzp2+FIg2PXCgHauq2I9TC2kbY=;
 b=f0ChkPMGYvWEb5HOMzhJZGZwXnORO/qvbkabvEKg15tcMUIxo2aVoBVsgHUNckcwrL
 S2Pu0xfcm5tUHA3YjiMyd7G7g4GZPvBB66YDEk5ZrtltHhqPVgD4iSvGiI5hNu1t7CTL
 ak5/LNpwdwrrDQ2fLnL2hnmgGQdwV3NhD0Uclma1EEhHathAh08A6nQyfRjfz+cc5uzN
 rUSjcZeDgkVhykjtZ9edtGpvPmnecVDD4oVQFkFCFknUR1m+pwfE/EoXI8buljH/5suG
 +ka+wtz/Bn4jaRT9l90HGVcIVud6VRbaTectqFT5VTbs+w0REnMd2g+Uvmv8E4PfjpCM
 mmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZGcjpUUcfgP9IW26yYzp2+FIg2PXCgHauq2I9TC2kbY=;
 b=ZJE4BM8Uvi9sgsj3Z0Zr/x/YymZUIrpQbv4RHg0SRc8Ux4j7Ki4BvtJAqpOxxV63GF
 Idv1hQvMmjd5C+Q7BYbbSxjdeZZoqe4St/X8fAdpsr2lwPXJvtFmpnUAOVEGItf15MYy
 vnkxbo+TvT2CGEjBrLYCo4YnFtdZWus1JwadAaavyMnyWsx4vwcV7/jeW8a6yyeoHYTQ
 9thloT6kfpV3lMVg1D/wL8d6I9aC/B8GYunkQp3OGsVdimikfZYiNVpRnwHoLsje1zn3
 kWhh2dvVyYJZI3q8TRpzEn2bqzoYSNLR+HQtG8FI1qrvAAT8+dloFNVuLweZV55/fKGL
 GKGg==
X-Gm-Message-State: AOAM532aJYcvmud+OB/Ui9AYl8IKQJW8pcTSaaZvnV+9h+36sVyKItpo
 G2SVoUJUMlXcMZgdxmECBJlJkg==
X-Google-Smtp-Source: ABdhPJzoBeTvbUia+BRkSc8mokO77vad2moWN4GMwAB8WHAiFj1BA4UNzXTSWzp/mv3LW4OwfSucJg==
X-Received: by 2002:adf:fa4c:0:b0:205:7cb2:e6f0 with SMTP id
 y12-20020adffa4c000000b002057cb2e6f0mr13509715wrr.218.1649402518576; 
 Fri, 08 Apr 2022 00:21:58 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:eacd:ce6:e294:acd1?
 ([2001:861:44c0:66c0:eacd:ce6:e294:acd1])
 by smtp.gmail.com with ESMTPSA id
 q16-20020adff510000000b002079ab38635sm112962wro.81.2022.04.08.00.21.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 00:21:58 -0700 (PDT)
Message-ID: <f4e4b45f-a62d-05ad-9750-787edb0f2146@baylibre.com>
Date: Fri, 8 Apr 2022 09:21:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] ARM: dts: meson: align SPI NOR node name with dtschema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220407142159.293836-1-krzysztof.kozlowski@linaro.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220407142159.293836-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_002202_335183_09EE5E6D 
X-CRM114-Status: GOOD (  13.10  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 07/04/2022 16:21, Krzysztof Kozlowski wrote:
> The node names should be generic and SPI NOR dtschema expects "flash".
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm/boot/dts/meson8-minix-neo-x8.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/meson8-minix-neo-x8.dts b/arch/arm/boot/dts/meson8-minix-neo-x8.dts
> index 61ec929ab86e..56ea875c418c 100644
> --- a/arch/arm/boot/dts/meson8-minix-neo-x8.dts
> +++ b/arch/arm/boot/dts/meson8-minix-neo-x8.dts
> @@ -65,7 +65,7 @@ &spifc {
>   	pinctrl-0 = <&spi_nor_pins>;
>   	pinctrl-names = "default";
>   
> -	spi-flash@0 {
> +	flash@0 {
>   		compatible = "mxicy,mx25l1606e";
>   		#address-cells = <1>;
>   		#size-cells = <1>;

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
