Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D96C3DA63
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Jul 2024 07:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2oNNSq+mypKQSURTJYISv7G0TL3kw7AxKinEoxbdZ64=; b=RNN2vnZbpWRkT5D1XOwSmo9gmr
	6bGs4h6NLpPtxhUdgzlnO9c7b8Yju8N3CsQfW9PW7kM7aB/vok4fCUacSJC4kYxlwKtQYq12t9a9n
	j0HhNoLXbP40zCeZ+CVg/AhdFn7qEP0jJZBUNpaKM+a/x6uQ9z+j+t3euez8NUl7wMGh5CYaQ+2/m
	EvcYFmfYPi3NrsQVXNN3q5bgjgSAW8NNBDDPkcviMkNWM3posdNnYBjQShCI5Y0w+Zil72EpQcWj7
	NEEoxF/OzyFBdsrvctkfrbZa5uEesShEolfy6MktHgcNOvjxkvwURLr+17RXHSzyrgTKRVYWcKl/g
	+1IMHLxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW9mt-0000000BgrW-4Bos;
	Tue, 23 Jul 2024 07:18:20 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW9mV-0000000Bgjr-1KPc
	for linux-amlogic@lists.infradead.org;
	Tue, 23 Jul 2024 07:17:56 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2eefeab807dso61392711fa.3
        for <linux-amlogic@lists.infradead.org>; Tue, 23 Jul 2024 00:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721719072; x=1722323872; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=umMVmI8IKdHl++O7se9W/HW6MwPFPWF32KbYepYLJFs=;
        b=A959yazqi+0bTR2JL4s97YR/lvZhdcnLnYYdeMumBGAfUyjm2Ta7Nt2ppWjpXsyFlp
         5Y/dYzfwRG7cJQKQlbIm+hvrUafQKXwcOOZtgbVjIxw9OiBpwAvlY6HNFC+tY2266fa9
         7pdOoFIKM2iVMRjnaJJzG3RAsCLMr6yagHuvjtJXuSwYBsn/XZqJzR5jvm/43/weXcXU
         mEkWGyN6eDXxzfXku7ta8dK8CXrBQ5Sx11uKm1KxFdsjsI39UjxvmspR6YOm1FtjpAgC
         WFNObPA3I7Ja+VAHfh23C+18ExPHtpaPmgmcd5HHQ9c1Fbyo49OdXPfHXGWt6WD3E7pS
         CTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721719072; x=1722323872;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=umMVmI8IKdHl++O7se9W/HW6MwPFPWF32KbYepYLJFs=;
        b=vtBLvGkhF6C21bciYfC6k8GPAZRSQ5nvADns+OZrqkN1qMnFkf5pq3bKlu56KehcS4
         wiNBs6UFLEHmL2d2g/KygCJyaVfSAsOqkUk5vsfavNpFyKtwQeT2+V9QINlJ0XWlOBDq
         oh5FF/7uioGirJYvO900ogFogi8aAAOq72ZJjmzWsf9ad0LIurMOzya0tWnsXwrfdbQi
         f9mBN/3O20kmFuhRYRSzXLTQjvMsXJUI70tjSGtMqdrq/VARh1Cjd5WYhUL5GRRctoRr
         OTPOPRGeU8+YRrjL46BcjktJ0m6McCd3EPw7fKLLjc8GdQY1+7xKTafSvHslNTc+EJOF
         1ZmA==
X-Forwarded-Encrypted: i=1; AJvYcCWLhhjCe+yLPrw0jQEaVclt96uorxfKL/JD9gzmIqKxlv5Ze+SWioWtOKxq9ayv13dQBO8EKGTWsEdgZ/V3Z5FOB2jf1yvXAgDaPG3n1dkpETc=
X-Gm-Message-State: AOJu0YxNkp6Vb2nvRpHBFDFpw/8AkRPQx+u39dIihLM2TB52ImBdENwG
	tGLwfnwU/f6UuhunKHiNO/tThqf0l9AQNqjGEg2cxbD+hYddWwgpB4Rl57zdqNg=
X-Google-Smtp-Source: AGHT+IG2SjecpItKKr40kabohOsS8hWl2Ojj6C41sM04HkJaWcPeBeHkQlWCBgjh/tu0HMdUlmzTWA==
X-Received: by 2002:a2e:a162:0:b0:2ee:84af:dfc4 with SMTP id 38308e7fff4ca-2f01ead8ff8mr12996171fa.43.1721719072168;
        Tue, 23 Jul 2024 00:17:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f9d3:b429:5f14:dc9c? ([2a01:e0a:982:cbb0:f9d3:b429:5f14:dc9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d6936e1esm158776455e9.44.2024.07.23.00.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jul 2024 00:17:51 -0700 (PDT)
Message-ID: <86b71a8a-2b8a-4130-9bd7-bb63658093f7@linaro.org>
Date: Tue, 23 Jul 2024 09:17:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 3/6] arm64: dts: amlogic: s4: add ao secure node
To: xianwei.zhao@amlogic.com, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240719-soc_info-v3-0-020a3b687c0c@amlogic.com>
 <20240719-soc_info-v3-3-020a3b687c0c@amlogic.com>
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
In-Reply-To: <20240719-soc_info-v3-3-020a3b687c0c@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_001755_394882_826D7083 
X-CRM114-Status: GOOD (  12.74  )
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

On 19/07/2024 10:08, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add node for board info registers, which allows getting SoC family and
> board revision.
> 
> For example, with MESON_GX_SOCINFO config enabled we can get the
> following information for board with Amlogic S4 SoC:
> soc soc0: Amlogic S4 (S805X2) Revision 37:a (2:1) Detecte
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index c11c947fa18c..957577d986c0 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -763,6 +763,14 @@ reset: reset-controller@2000 {
>   				#reset-cells = <1>;
>   			};
>   
> +			sec_ao: ao-secure@10220 {
> +				compatible = "amlogic,s4-ao-secure",
> +					     "amlogic,meson-gx-ao-secure",
> +					     "syscon";
> +				reg = <0x0 0x10220 0x0 0x140>;
> +				amlogic,has-chip-id;
> +			};
> +
>   			ir: ir@84040 {
>   				compatible = "amlogic,meson-s4-ir";
>   				reg = <0x0 0x84040 0x0 0x30>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
