Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B1C106F303
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2026 08:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/y5PlyocYKLq+z9HXJONSOh1953b8yyihJgL746E2k=; b=If41+XAcT+DRy4e4Nst5h4cloj
	gR/kHK6PUrDD6WphPWn9JZQtulJAlO1t9AoDrfv7sbMDv5ZG5OHOMG412o/5ntnfAOBwOzr9shv4M
	IiHE8hbdmLbZ44PCHHzp4MueqqiFS3PwK94LeWCpWDxynVb47LqATnyQ2QQZTulRAT53Toj7wSPJE
	pCS9FQwJjq+ntlLg/6QNBf+8xHyWisVsBulSHAMvWwh3mrbE8qo8flekqAVpACmmFpJ7YYw+sgjII
	wFtuAOtNaHItaILgyeKrJcBU1aj5iJq5IlimNwc7nEYZM2+BP5dr3JyQdDnfpeD2DeZwGlEelXPw3
	jBaR2yYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gSZ-000000053zv-0gUb;
	Thu, 26 Mar 2026 08:52:59 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gSW-000000053yK-3KrZ
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Mar 2026 08:52:57 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso5702095e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Mar 2026 01:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515174; x=1775119974; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alkbuVKROditw0aGu/OnnUsWfxL3CtIz8SG2uW8L1eU=;
        b=tEtxp2nLSAhUM6tE2ee0LpJp94DEPQNP6tfHkWqPwc1IbBZIg+tmODO9y5CbRUKlVN
         pQ091wrpc4f9g4V/usZztGeXHCS0+vZJuquoR0U2l1m4LY4GFULYFzWbMufSkCQUzP0k
         jif5xnJOtMvnRQybfzs3mHJ9tctedshPvhQJwgAdGcELidfz7HK9rs3+2KwdHQsJWzOy
         MkqNwoW5yUYDyZ6fQ8MOlapwlUHFPfe44U367fs3Mr5Mu0ktxSNK3yOcsgRsNmDTQSDV
         NJ36DebtmutEvv6THsQgOFfY91YcsT6/iOD7iDLmLFUMRUgrHsloTVEnleXhrnoqfGxm
         sZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515174; x=1775119974;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=alkbuVKROditw0aGu/OnnUsWfxL3CtIz8SG2uW8L1eU=;
        b=huywqQYKxR5MMAj20I7WhHuWDQEm3pmvtoJSJuTalxyR4R99bYazL5aJ4lLqbJTVit
         JGwggWvxwD6ZY3qWSJuxtiYjuoF8YGaQ5XsFmt3vLflnce4wILzNy8uC/QvTGUI27LR+
         TLosrkfEb/az9PKxx4CtxfKhInEk1ouVvXNCOnX1rQfvbAmiNM4NrH+7qct65wigJypv
         pOE/pIejrYzsdxO/9tUqy8KSK1MQAYQuAnfyDG8FBdoWNn+NKW2HEoiA7sodHcw8AM4L
         2cfl24kOvfZ9udc6Dbg0w5r4W7t+9/Fb7EZOGlCIpVVvsRudan+fYwafKs0tQdTrCPZ1
         On3A==
X-Forwarded-Encrypted: i=1; AJvYcCVctA1TxBNk2Idiu8eRhDC6HZ9DG3VWmEaTdSkMPRDDH2i5KpDibJ1beLKkkKm9pQb0vWCNP7zq4xp3Tmpp@lists.infradead.org
X-Gm-Message-State: AOJu0YyixXN9nUZTYTMHAQCr9tQpZmxUzayPNlAgeIVuk0Ud1/eEdbDk
	h+we0Xqh0WMzf7iHwp13ymzUQaMCJJJyxjc95OSO5hTvCVb/UAoAQYGGDqCibAu7DLE=
X-Gm-Gg: ATEYQzy1BIHi2RwZbpy9DILaF/htH2Q6F32FVNk+c7axfkPVl5PskQHjnAJiRibPde3
	tMWrCJqawAi7D09cmJFSZb9GHjJ0JC0aaqTBs1HS8ucWRf2/5oIuT0vjkGeyTiaWdzLbFYHWhEc
	yjsTblQTOdGgdH3gBP2MaUqKAsmUQIC08NtDX0u25hV8eMnjU7kU9ampO9WfNVqWTmHjmeEJMn2
	UIEwATYj9nuoto4jCBbHMGq3VdrHEiZMzHj7YqHzCQXNpLgGRfU0n21V35C1LQI1/UlSIQROOW7
	2fYrWvO8qTLG783jaR64E6UXZQXilFjW+nHRSLkA/huElQpeueUCTHkRmhfIwVbv2iEOhPU+MBb
	/S4BQ7cdq+j+RoDzpLo6xBso34O0OihBZzgte3nQYk1J7mePIyLymfvpwPHKXP299lJfk7ooD0B
	aOYGyGKhZzPgMlN1CxylXlFgh4JEOLQDPNJ9kv6RWp5YX9X/ajJX85O5UQluIriuEyrc5TXOpGM
	2/fdIE=
X-Received: by 2002:a05:600c:4ed4:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-487160083f4mr106443395e9.15.1774515174254;
        Thu, 26 Mar 2026 01:52:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8431:f88b:714d:f78d? ([2a01:e0a:106d:1080:8431:f88b:714d:f78d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9179b212sm6621276f8f.0.2026.03.26.01.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 01:52:53 -0700 (PDT)
Message-ID: <7c207f00-fff3-4506-858e-db7dfdc32ccd@linaro.org>
Date: Thu, 26 Mar 2026 09:52:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 4/9] arm64: dts: amlogic: t7: Add PWM pinctrl nodes
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org
References: <20260325-add-emmc-t7-vim4-v4-0-44c7b4a5e459@aliel.fr>
 <20260325-add-emmc-t7-vim4-v4-4-44c7b4a5e459@aliel.fr>
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
In-Reply-To: <20260325-add-emmc-t7-vim4-v4-4-44c7b4a5e459@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_015256_877621_A0AFF4EA 
X-CRM114-Status: GOOD (  11.57  )
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

On 3/25/26 10:15, Ronald Claveau wrote:
> These pinctrl nodes are required by the PWM drivers to configure
> pin muxing at runtime.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 136 ++++++++++++++++++++++++++++
>   1 file changed, 136 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 62c87d0ef7065..eb09a26bcd0e0 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -307,6 +307,142 @@ mux {
>   					};
>   				};
>   
> +				pwm_a_pins: pwm-a {
> +					mux {
> +						groups = "pwm_a";
> +						function = "pwm_a";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_a_pins: pwm-ao-a {
> +					mux {
> +						groups = "pwm_ao_a";
> +						function = "pwm_ao_a";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_b_pins: pwm-ao-b {
> +					mux {
> +						groups = "pwm_ao_b";
> +						function = "pwm_ao_b";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_c_pins: pwm-ao-c {
> +					mux {
> +						groups = "pwm_ao_c";
> +						function = "pwm_ao_c";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_c_hiz_pins: pwm-ao-c-hiz {
> +					mux {
> +						groups = "pwm_ao_c_hiz";
> +						function = "pwm_ao_c_hiz";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_d_pins: pwm-ao-d {
> +					mux {
> +						groups = "pwm_ao_d";
> +						function = "pwm_ao_d";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_e_pins: pwm-ao-e {
> +					mux {
> +						groups = "pwm_ao_e";
> +						function = "pwm_ao_e";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_f_pins: pwm-ao-f {
> +					mux {
> +						groups = "pwm_ao_f";
> +						function = "pwm_ao_f";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_g_pins: pwm-ao-g {
> +					mux {
> +						groups = "pwm_ao_g";
> +						function = "pwm_ao_g";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_g_hiz_pins: pwm-ao-g-hiz {
> +					mux {
> +						groups = "pwm_ao_g_hiz";
> +						function = "pwm_ao_g_hiz";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_h_pins: pwm-ao-h {
> +					mux {
> +						groups = "pwm_ao_h";
> +						function = "pwm_ao_h";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_b_pins: pwm-b {
> +					mux {
> +						groups = "pwm_b";
> +						function = "pwm_b";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_c_pins: pwm-c {
> +					mux {
> +						groups = "pwm_c";
> +						function = "pwm_c";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_d_pins: pwm-d {
> +					mux {
> +						groups = "pwm_d";
> +						function = "pwm_d";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_e_pins: pwm-e {
> +					mux {
> +						groups = "pwm_e";
> +						function = "pwm_e";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_f_pins: pwm-f {
> +					mux {
> +						groups = "pwm_f";
> +						function = "pwm_f";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_vs_pins: pwm-vs {
> +					mux {
> +						groups = "pwm_vs";
> +						function = "pwm_vs";
> +						bias-disable;
> +					};
> +				};
> +
>   				sdcard_pins: sdcard {
>   					mux {
>   						groups = "sdcard_d0",
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
