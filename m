Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAB8CD4851
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 May 2026 12:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0kqZY+dQBG7AEfpB008HmnOeRPBgw2ohbtJRJqQX7k=; b=JLNMi/VZ27A1NhFX6stqCBRU9l
	FKkEro/IUTl7S78J/DmZ0mbf18VDpVkZdrSRaO/urlKBY02G+BEb7As0p2Woao3LOY8SecRuKhz5S
	50A+kCuNYUTNKNAVJQJH3iBLaeM5WBjA8GR2cXjn72HFtiGn0n/v5rtIP8B8/k7Kv+LA6EeVQh03Z
	a2Yuy2mWc9wOsB2D3j/KUZSnbMtzcPNrtkEXd7JOz27U/w7AcNsvy4vnW1aWfyqEoVUUXOpe35xIQ
	i8touQiLAzg3SsfzyqpnXHMjUUZYY7gMeocWK5IxMFkusJdj1RamtXHzHU69FuqhZw4sPKVyvvLP+
	qXoIO8IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8ah-00000002Sqz-2EhI;
	Wed, 13 May 2026 12:21:31 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8ae-00000002SpP-1P1m
	for linux-amlogic@lists.infradead.org;
	Wed, 13 May 2026 12:21:29 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso58829085e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 13 May 2026 05:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778674886; x=1779279686; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zyU4Sq6iUSpynWqIwbV4HNx55pG0GP3Xn1AeqfpoAcY=;
        b=acaE6XLstju+sGNmXUxSTe7m8+Y0YmBUTaryiFNPLkocS6qjO9xiroNLQoNZ7bRsHh
         RazWc7B58K3DoWpYt/r7Lo+YV1gCuDsyF3P2mt2kO1KKLbMj/KuHgRLKjomvuoK3i5dJ
         YZs3Ffyr9nn22n5JnZxSvzTsz3kQvfAf+hx7mxYc8UIH+cDZ/pb8MYe1tUb1AWWEq4CT
         f5wVKivLGguA4tzSQ9X1/C4snTyPtnJQsDHmwFuRtXLZVOeIOICUxU4iedm7JDq0IzeQ
         SpsseOQ3T18xUQCwIZt7d6p1v0agZof29PBFVcrlK3MCPqpW3XkP2/MkwOu3dDSqr+EY
         5vAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778674886; x=1779279686;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zyU4Sq6iUSpynWqIwbV4HNx55pG0GP3Xn1AeqfpoAcY=;
        b=N3xwsmZkbhuuZQfWh8kRPXJa6oCf+xYS9Lvzc1VExEn+3Zyv3YnGz7rsk+UaXK6jrM
         O38YBOBKbsXCVc4blh1Cgdq7eRHjdUCmuNvQxY1IkY3wv0qLQ0Byf5dxioT/TAfTL/uo
         wLzSEZVVTM9qApZcMZszCA4xYIchgGhaVIzGfFdgKSZI53XQfKNe3V8yiQ7CaPlPYiCV
         MV8hQqM9GOWOtWB/JNyrznuymnvILH4BC/vCoWb0Zv2452rwVLj+pReBIDDlkxMaDexB
         F4ivaLObgrbJOBNT5Xt5nZiAlF4NnBPHUEX+JFzgCbss5g7RjsBaXyWzIZ/+n3VLrHTm
         v/Dw==
X-Forwarded-Encrypted: i=1; AFNElJ8fpm8V9yPnDcAHre3ZaUq8awPNTlTnK0UjrEEqdkR7B3cigaTFeZ4Roiu5BvQMQJgCbtOyVRVfF0EkfvVb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2V/P27tp+mRfBwoZBNUY9/Fzp7cpvPLeX+Usz05Iof/GtAcmM
	R3CKG9uDQXqDWok6za0F22BrhbPZLIMWKsF/tPaRxpdQ9z6TaYhPJysD3RQTW47ReDc=
X-Gm-Gg: Acq92OEVttVwUUJNv/HWOjlzzk1KsAQG+5MLpbzWF0AemlNmwF2dYAFFoY96+HxslHT
	97j6EhKuBNx5y88Jzz088MFj/PyYOrDko+NhkwQwG9fbfhEKz5J9d1UfdVDSKkx64eh//u/KuvE
	nDrFP8bKdPtk0ZVCW5AJtQ2NkDGbQu6IwzBuKtH43NKyh/mdkBOk48JWti7ERgmcEe7Ol9t4Mvu
	dFQlcZ0ACmE0WxIjEnaEzB5arLa+KbZ4qS9c+U1BwypepFCQ56amf01cG16cnMe3DF/jxP7AyZ/
	3mY21ww27HZnnGhNW8LlLV82vgTn+obKokXricHAqRg1WxyHQIMzkobjrvYjKCuosAjRROXlKLI
	kNkDaxy9VvrXfYP195SSEw8EeZqroA3L7ws5VrbEKzIGBPpmnvakn+mqRIJFofmAxQvdH/FYSKK
	IMC4z3S2p4q2Iob/xR+ShWxY372Iqp+otlCATI8fGbPlpuPaTIgmRoso5vc7E3Zi3hpJL4PfcoX
	5qnb+nq36XHDto=
X-Received: by 2002:a05:600c:19ce:b0:489:a4:e578 with SMTP id 5b1f17b1804b1-48fc9a34777mr40690665e9.14.1778674886244;
        Wed, 13 May 2026 05:21:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6ee4:8e37:145:d60b? ([2a01:e0a:106d:1080:6ee4:8e37:145:d60b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d68b14sm71555635e9.12.2026.05.13.05.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 05:21:25 -0700 (PDT)
Message-ID: <f965ac54-f302-4e0a-b079-564abcaaa38f@linaro.org>
Date: Wed, 13 May 2026 14:21:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: amlogic: t7: khadas-vim4: reorder root
 node
To: linux-kernel-dev@aliel.fr, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260513-add-kvim4-sysled-v2-0-3ec9779e8875@aliel.fr>
 <20260513-add-kvim4-sysled-v2-2-3ec9779e8875@aliel.fr>
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
In-Reply-To: <20260513-add-kvim4-sysled-v2-2-3ec9779e8875@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_052128_400730_91C49486 
X-CRM114-Status: GOOD (  11.27  )
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

On 5/13/26 12:43, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Move the xtal-clk node to restore alphabetical ordering.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   .../boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts     | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 69d6118ba57e7..fd1b983354a01 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -45,13 +45,6 @@ secmon_reserved_bl32: secmon@5300000 {
>   		};
>   	};
>   
> -	xtal: xtal-clk {
> -		compatible = "fixed-clock";
> -		clock-frequency = <24000000>;
> -		clock-output-names = "xtal";
> -		#clock-cells = <0>;
> -	};
> -
>   	dc_in: regulator-dc-in {
>   		compatible = "regulator-fixed";
>   		regulator-name = "DC_IN";
> @@ -155,6 +148,13 @@ wifi32k: wifi32k {
>   		clock-frequency = <32768>;
>   			pwms = <&pwm_ab 0 30518 0>;
>   	};
> +
> +	xtal: xtal-clk {
> +		compatible = "fixed-clock";
> +		clock-frequency = <24000000>;
> +		clock-output-names = "xtal";
> +		#clock-cells = <0>;
> +	};
>   };
>   
>   &pwm_ab {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
