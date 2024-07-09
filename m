Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8B2C2BD09
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jul 2024 09:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPwEK0J0gR/OyVyrwHgAvzpvtQifKrJwmYHn2lXEzlo=; b=JRgohy3S023koCzIkBKQatElfR
	y5fokCUCuVmBX/SVg88vB9I0qKKVb4a+S3XRRf+z5WgAJriFTUNrL3jvufIv6ziH5sysyg4MiHanM
	NGFEHirOIYzEL6A76cme8Yf0kkpnEJIopZIBoZBUwm9ZgLYCiOR2E8i6fxtm35E3iRDkYBC6fvKdk
	ptPs97cOj/6dvf+jGOk5KEnIzMSCdbehfpIzlvBlT/eW/D5N6I7GjiarH22Z4mBwv2fpYZofyIJ1Y
	gfwy5k45D/g/kLPpANAyYpsjiYm+SeCF17LFVD+HhmIh87tjlkB0FKbbFG1iRxEzphcpBq8zXBLfo
	9jI35RqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR6qT-00000006Y2Q-22UP;
	Tue, 09 Jul 2024 09:09:09 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR6qM-00000006XyJ-3DLI
	for linux-amlogic@lists.infradead.org;
	Tue, 09 Jul 2024 09:09:04 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-367ab76d5e1so1200938f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 09 Jul 2024 02:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720516141; x=1721120941; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8d4w2O1nIUn5g/QRXw3npjVaRdNRoF0bZlM3zD4qDkE=;
        b=W7uhUoBNbFscHw55SL9B11VyU2qWL+wQE/jjtHskvPU13D045E53OytJpYyF7uPFWw
         nbXg/V54+sT5Aawr48ZxPU1lictrcJjms4N04idTXAU3Z49dJLTL4yw9mdl72FIJhefV
         phjPsLdkZur80mmiPV2mLJHqam0nIZ0rGyCwWf6ti0CRqlBGRcaowN2U4pwxitcl5AcU
         gQMIIH9zhRujHOtyIfaEXGOTj+wzpEgDzhofhIDdyBlR/euHMWWIumAxLgAObs9qZWeP
         pA7sjmVz3XfPxyqkSc+WB7KMa0FTLV9tfiyUQZ06vVILnYcvozRyS1Nh+RSwq7Rg8WGy
         Y3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720516141; x=1721120941;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8d4w2O1nIUn5g/QRXw3npjVaRdNRoF0bZlM3zD4qDkE=;
        b=Q4+3h0r2CMmUhPsnQ8NpuQPNDEHSd4aiqIxISddPWIACOdY0d1gyPJDUvSh0VazYM0
         YMOUVaejnwr2Pab14p6Aomspj0KsKaFBxXUQJx/xnQO0eu7om8BD2wfru9ga3ub2rhIP
         zkXBM7cPnCmizxMJcsiCzfPukCyTtj6jQP/xYmAftM35dv/lFkVK01zyZqQiKvJkr7yQ
         XxgIb8rIqnfcNKNUe1go7IDXV2sErD2IJ4EDLkcsPx77Jx2YR6Uga0x0plCZ65hro3PR
         nM/JxSy3fIOoA6DFw0Rl6JLXPVIeQCJIFyjEMB+CTfYlmI1aQR587nB0CxbEYw2PaO5u
         3WKw==
X-Forwarded-Encrypted: i=1; AJvYcCUJF4/CR0VOf4iSINdACAcNNL72D+rrLdOCnlktzn0XVEsBm3c2WMs/c55tUJkUqx1j11Pg+5LTqzaDk/zy7pqG+7k2SZGQ7xxNCwhzJpO0D4E=
X-Gm-Message-State: AOJu0YxrodLiUohsrM3IgMWznKMWT/jipUseoJ2MNQpIruwm+DSXWBR3
	DOk/Mb7+uhmxJ9p9Ytp2OkS75CBbXG28ZuW3bOO4STegugTE2I6gXsQexGwA1dtQwo5sibdkQY7
	1mww=
X-Google-Smtp-Source: AGHT+IFnE7Mlu/oA2xNs5yh5b3FAv23ZbeyVRI55U9NKiyV8/hCQ0+rhzKBcB/0jJITeoPaLM7W3Gw==
X-Received: by 2002:a5d:564a:0:b0:367:8811:5e3c with SMTP id ffacd0b85a97d-367cea6b768mr1343767f8f.20.1720516140977;
        Tue, 09 Jul 2024 02:09:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:b12a:8461:5e2a:dfe? ([2a01:e0a:cad:2140:b12a:8461:5e2a:dfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde7df3dsm1953886f8f.16.2024.07.09.02.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 02:09:00 -0700 (PDT)
Message-ID: <570c715d-4f20-4c3e-8341-627ee975fd77@linaro.org>
Date: Tue, 9 Jul 2024 11:08:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] ARM: dts: amlogic: meson8b-ec100: align GPIO keys node
 name with bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240701165210.578817-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20240701165210.578817-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_020902_855352_6027E873 
X-CRM114-Status: GOOD (  11.23  )
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

On 01/07/2024 18:52, Krzysztof Kozlowski wrote:
> Bindings expect the GPIO keys node names to follow certain pattern, see
> dtbs_check warnings:
> 
>    meson8b-ec100.dtb: gpio-keys: '#address-cells', '#size-cells' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)...
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm/boot/dts/amlogic/meson8b-ec100.dts | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/amlogic/meson8b-ec100.dts b/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
> index 3da47349eaaf..49890eb12781 100644
> --- a/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
> +++ b/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
> @@ -34,8 +34,6 @@ emmc_pwrseq: emmc-pwrseq {
>   
>   	gpio-keys {
>   		compatible = "gpio-keys-polled";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
>   		poll-interval = <100>;
>   
>   		pal-switch {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
