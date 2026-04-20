Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5A4F36C5C
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2026 12:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53Qi67e3w4tmlwsqmUeqo+B2DamfGR+0thcUSDl8vDc=; b=BQg+e2hnDVcqrG3o2PuKDH4qqc
	i9hxT81msveAiIJIdSEiL17LeCM8+UO1V/P7v2sRgP4HiHBiBZdMpYtnpXwFuflecTxLx70n/dCug
	RV5TxJS6Co/tBPAXTvQheJjgYqmL6DWeMqP/i8PSIY5UYRk7k8+eVG2A8wL+p38wXGWC1G5QQoEsx
	NMSk/o8iRkn3MCEnU0RMvHyCGqGh4Cj2KluCNivEotfrkSeEqEVtvERNmvjjpxUd0wMmO207s3p43
	kLj72M62Hafqu13y49o61KirO2Qg6oQfRmEG/lZ8ueQnEBdPXEVtGOpEuGQahqZDXq4UOL3JHzeh8
	UAlq1HkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnL9-00000006qpA-1DzG;
	Mon, 20 Apr 2026 12:02:59 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnL5-00000006qnz-3zrl
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Apr 2026 12:02:58 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-43d43e09de5so1598005f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 05:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776686574; x=1777291374; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H8b7fULVtzI56Bio+ZPKMEGYjw8VcHhdEK82O/OfdDU=;
        b=YqYpYKJaWvR48VNISHhzXTBl0XMm38SawN5UlK8V4TpNXXLTjHEH+iKwckn9STr1WD
         jqtakgJCKAxIEBTlNs5rHyDGTCseoMfhGy5TIJlm+itvLou+qGDZwW0/LhV7Sc78UjQQ
         bF06an2yMZpU1Epe0QiKr1KwFmpIf2sRE5+OVZ/KPQPSTsyAWz2Rx2VJh4PpTdQKeU+L
         uNNNYW12vG9q7WlzOdmNGJZu/tupmz5r40GdzxXNB7BfJsnEadRa/kFRwxdPMolBARUJ
         rds0x2d36TiM38VD6IF7/7zPVX5W2qN+jP7QG/EhGJEWBh3Q+Q4oP1wEU+fCu5RbxGTH
         B5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776686574; x=1777291374;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8b7fULVtzI56Bio+ZPKMEGYjw8VcHhdEK82O/OfdDU=;
        b=T4mIXBTiE+QAj9I67QzyqTShA3r4mUWj3OMF+Jt3US7oYh2InQa+94qmZ4M/jVSxli
         3Dbmk8drDx73GJ5KcYTTnWtiHdNLkjfgc1DdLPwfX8ZI3uUAF6sUzMWjuQlf0YV330q2
         rhPk98Bp/YIJwH9H47l5vKzHtjBLGUYsLj5XwKHAXJNvxvmIXQeXLBNfBTNVbbmKVRQf
         twS/ymvZ5Sj7Rl2dDZkdkh6TEw4QwZ+FiMjaO0UxGN8K7k98eVhmANnlWfhThuIED4dR
         zPUm6pcgA4Od7sD6n6N0ecAZlJlvgq8DNquIV4suhpusKbhOjYwixruKICVqD/m4Da/R
         GOwA==
X-Forwarded-Encrypted: i=1; AFNElJ9j45iitoIxayYp4PlIZ7H4G7xe+TUvliN+y0b1BtqUp/bksX7HLlcxRKBjuLQwVzvNx2hlSyQ2I+lkZi2j@lists.infradead.org
X-Gm-Message-State: AOJu0YwskgB1MtRNUtA1yHHJhD5pKd+WKT3Meo/7nd4MJoldlSTIorbM
	kMlSXAAhGSRetdlhFrGYbWS1n1dqGkQ12C+iM9FaYiVLOIybWnBLVEHTmy/TBaO4YM0=
X-Gm-Gg: AeBDieuhlDl2bPSmisnnNUyx2pe2QW83F1ikhtchQE0asZR7HL38FxXuK0dSqXiIqY0
	IrqeCaBBivt1wpUn4RJtV0y53UuUPuLZbOQX7hHUsEXbRCnbwTWeZqSspu2J8b5kIUtocC6xw6A
	sweke4lJvtaY/Zc8ca9c/Yju/Q0O8ebKEoTm5WLFmEo5y4XtZF9qTtiNA7tiWPa6B2vDbulPp/H
	FNg/JhqpkdOelf8HAkqqww9Rz2M7+t7gljWt2Y9hAL3Om6QiFcYfo1JOZNBKDZoXsCrEhhngbS5
	CrtJ8ykbN6VyXYaZHOFlKYDmEC16qmoZo5hk3DFWpGlAlvKZzhrm2fK8V7dGEiUlymNjCPFy1KU
	mcDZRek7PLqdS1WcbbywknSioHuZJj6Q71iC1UsnFlbUC6KiWijEY6CgBXOcYA36RRisEueGrW1
	j4sRdYTQOQJR9JGYe7oOs1NCH8ERqhO+uENc4SZCodeJhqTKalvav4ko2ivOVChBvhvAltw5DoI
	K+yD9fWvNYhWYzfxA==
X-Received: by 2002:adf:fd4c:0:b0:43f:e414:4c6a with SMTP id ffacd0b85a97d-43fe4144cabmr12333460f8f.0.1776686573966;
        Mon, 20 Apr 2026 05:02:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:851d:cf13:ef26:f254? ([2a01:e0a:106d:1080:851d:cf13:ef26:f254])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a18csm32493652f8f.20.2026.04.20.05.02.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 05:02:53 -0700 (PDT)
Message-ID: <7bbaf370-3b66-4889-9abb-c31983948ac3@linaro.org>
Date: Mon, 20 Apr 2026 14:02:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 3/4] arm64: dts: amlogic: t7: khadas-vim4: Remove
 redundant clocks from UART A
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420-add-bluetooth-t7-vim4-v3-0-669cd2530ae5@aliel.fr>
 <20260420-add-bluetooth-t7-vim4-v3-3-669cd2530ae5@aliel.fr>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260420-add-bluetooth-t7-vim4-v3-3-669cd2530ae5@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_050257_159673_3546E82F 
X-CRM114-Status: GOOD (  10.19  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 4/20/26 13:58, Ronald Claveau wrote:
> Remove clocks and clock-names for UART A, as they are defined in DTSI.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 69d6118ba57e7..3227ab27de107 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -250,6 +250,4 @@ &sd_emmc_c {
>   
>   &uart_a {
>   	status = "okay";
> -	clocks = <&xtal>, <&xtal>, <&xtal>;
> -	clock-names = "xtal", "pclk", "baud";
>   };
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
