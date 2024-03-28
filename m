Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B26C54E67
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2024 14:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCNpJziDnCsVTMEIlCSq0uAZbckAo78zc5Kcug+w/Nc=; b=NcQNfq6lbin9TQn2ZJ7icmaRGS
	Dn5UtG8/PxKy7aU/m0v0T7MRm3nGFxgD32ZSOxkYKqzCVehhtHNsU4olWZOp3T7qxoeZkkq9mdAqn
	fsCBJyJadDvCWT57N5XZUDjCPOTHZe4tZ9mI8ra/0egaNQp/qCYVJpvRfevgY5ojwgiLtQ191uw2s
	5eHReMkiyL1sCk2E7XZoE9SBfaT0gqWDqv0iEh02I0KosBFH5/LtxZzsXu9qjNWoOPLIgU5PI6ESv
	X5yRdEsZ0+Wm/369qm8f+K7dGCXEjZwmxrKBrCapl+NLQiOJ2EM7jj4S1OpUY7DKYlc5qwopx1ZvR
	PDUt4sOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqQi-0000000EF7s-3CX4;
	Thu, 28 Mar 2024 14:08:32 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqQe-0000000EF4Q-0seo
	for linux-amlogic@lists.infradead.org;
	Thu, 28 Mar 2024 14:08:31 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2d6a1af9c07so10839801fa.3
        for <linux-amlogic@lists.infradead.org>; Thu, 28 Mar 2024 07:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711634905; x=1712239705; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KldVMMTU4wvemf1droJVFNbQxm8DF8GfwQOLOEUBIRI=;
        b=DsgcfOcnH1nU6dWW8vO8SylUlrtraR3g36oxzUucxcaP4rlmWnzFzw7EV53i8GeKSX
         DwGpmlzt7q3D4mQ5n1ubcLPexVliuVSEZAY6peGpYV40FQfTDwESCCSZBIkk/bI9Dnbu
         5muWM1cIi8b8BAkH1kv3hlVjt8je0LzRqL/354iOpQVy881mjsjvhh+eIlHllj9hmqJP
         pH1vNvtECqEzA2y4T3cpLGumGRdlqUOnReeYG4aG9B4sArl/n3nN4hbpKubu8WjHwN4/
         G8/5DwaNxDpvj3SDVsTFTabpHD/dedzysF449R1RtywXJRa1S+DxIiJ37yvIMe02L/fs
         1YzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711634905; x=1712239705;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KldVMMTU4wvemf1droJVFNbQxm8DF8GfwQOLOEUBIRI=;
        b=PL7539URC+etr97nkojOigTtmK/sFaNqh5HW5Vmjxbxht7Rq0fS0G3/uuQS3hxv390
         eg9JbhbMuKWuE0NulMVMDdm/nHRV4CCqlMpsT0lHUkUchu+ih5CjC07VDUTB4hLXOUhS
         G+rkVT1pg9d5+x5glGQnChJi6pu+HCNW5n1W7KxnLP7TCuDCdxFm25qCGEi8/XdZSEeS
         m+ePeIANwRBQVxip1cipCECXhJaunzka51J3LOEQ0dpUe7EYLELjyz/PgeRl8suHfgdn
         21T+6vz62ti7W1h6U1TicKEuWNmI6zlw5yTB7hssi2DSUTKvIQcutpWtqFqpXL2oJLvD
         J4PA==
X-Forwarded-Encrypted: i=1; AJvYcCURrxjiCOmsIW2GzA8CsflBrzRueQnP1cIAIlO5+UsfvQ3zjvntT6H1t93vNHW+2a6R7gbyfUf9SivIEkW4PbNh+ODUriR6OujvoRDpKooHU2Q=
X-Gm-Message-State: AOJu0Yw5OrAO8mvGABr3oC394lEpNBtHXLNgWO94uS33mefOckWq+0s0
	2KoCFqe5gxL3yQXRnAEGZ6n8X6YzdqoQVVu5YgnCwuQxNRxqk/F+icC3YZswYW0=
X-Google-Smtp-Source: AGHT+IFzi5IGT2Or39luIJGiqxag++Cnfv2uvw0ITZd6e/aW+yO5N1QhpGpdl7mOdWQlSPUri5HLMw==
X-Received: by 2002:a05:651c:324:b0:2d3:2ecf:c26a with SMTP id b4-20020a05651c032400b002d32ecfc26amr1523605ljp.13.1711634905209;
        Thu, 28 Mar 2024 07:08:25 -0700 (PDT)
Received: from [192.168.7.190] (82-64-249-211.subs.proxad.net. [82.64.249.211])
        by smtp.gmail.com with ESMTPSA id g8-20020a05600c310800b0041488cfd0fesm5549851wmo.28.2024.03.28.07.08.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 07:08:24 -0700 (PDT)
Message-ID: <39ae48ba-02a0-4f68-b0a2-e03272fd50a0@linaro.org>
Date: Thu, 28 Mar 2024 15:08:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 2/2] thermal: amlogic: support A1 SoC family Thermal
 Sensor controller
To: Dmitry Rokosov <ddrokosov@salutedevices.com>, jbrunet@baylibre.com,
 mturquette@baylibre.com, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, glaroque@baylibre.com,
 rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
 lukasz.luba@arm.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org
Cc: kernel@salutedevices.com, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240328133802.15651-1-ddrokosov@salutedevices.com>
 <20240328133802.15651-3-ddrokosov@salutedevices.com>
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
In-Reply-To: <20240328133802.15651-3-ddrokosov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_070828_464734_965D3DC8 
X-CRM114-Status: GOOD (  15.02  )
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

On 28/03/2024 14:37, Dmitry Rokosov wrote:
> In comparison to other Amlogic chips, there is one key difference.
> The offset for the sec_ao base, also known as u_efuse_off, is special,
> while other aspects remain the same.
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>   drivers/thermal/amlogic_thermal.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
> index 5877cde25b79..1d23afd32013 100644
> --- a/drivers/thermal/amlogic_thermal.c
> +++ b/drivers/thermal/amlogic_thermal.c
> @@ -222,6 +222,12 @@ static const struct amlogic_thermal_data amlogic_thermal_g12a_ddr_param = {
>   	.regmap_config = &amlogic_thermal_regmap_config_g12a,
>   };
>   
> +static const struct amlogic_thermal_data amlogic_thermal_a1_cpu_param = {
> +	.u_efuse_off = 0x114,
> +	.calibration_parameters = &amlogic_thermal_g12a,
> +	.regmap_config = &amlogic_thermal_regmap_config_g12a,
> +};
> +
>   static const struct of_device_id of_amlogic_thermal_match[] = {
>   	{
>   		.compatible = "amlogic,g12a-ddr-thermal",
> @@ -231,6 +237,10 @@ static const struct of_device_id of_amlogic_thermal_match[] = {
>   		.compatible = "amlogic,g12a-cpu-thermal",
>   		.data = &amlogic_thermal_g12a_cpu_param,
>   	},
> +	{
> +		.compatible = "amlogic,a1-cpu-thermal",
> +		.data = &amlogic_thermal_a1_cpu_param,
> +	},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, of_amlogic_thermal_match);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Keep it even it you change the compatible,

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
