Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35C0F327BF
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2026 08:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZ2U5jkSoAwCtH4Ev8473wu3LJ9e1y8G8wO3XGZweaM=; b=S8SEPKnmraOe4zh66mONXynHu7
	CljK904do/XUeMN0XacT3Vt+Jei0MeZJ70An5QkujWMShBC6cP8W90TK6EEU7uqKuwMGlnv8jQ+ps
	EKKhkb/WDiCbbX0ZKpVs6aOuNAJNqA4fGYg2NZYduMWRqKN4zs8qF8t3EhiUNlg5uaqHNZs/fwcuU
	qY7eFwjnbOrllw71HyDAXtEJnNEMOXQGAnqrpn/i2WR8Y+yWX3hYHT0T1brPP+jQ/jRp4dN09Yq6V
	x1Pf7zGSPF311Xp22tTf50i0jc0Xx8t0xXj3rHFcy5Z4w7n9d7zzeDlKAZEzktHfMTzTgEWM/i5zf
	Rl7Gor0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF6L6-00000008Fkg-1sQS;
	Tue, 21 Apr 2026 08:20:12 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF6L3-00000008Fj1-0dfv
	for linux-amlogic@lists.infradead.org;
	Tue, 21 Apr 2026 08:20:11 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso39217275e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 21 Apr 2026 01:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776759607; x=1777364407; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TeWbx3WFAL4pMrGDmq2TNjEXsVaT12Mw93GvNXeYUa4=;
        b=e9dUEd1o/kZEYcoelltGg8cnnB2RL36CHtRjJyRq698U+DgEQP5ALJyr5CT8MU0xIz
         F6iaubXXTXCQ4vh6XQ+MxRCINscUltclK/M7Xv1Czz0cVjY1wq4W/bP2umWr2MEeKxKp
         eke/hD3yM7SoqlDZXNleFJhS3PH78Dr+VrURgt4rPKkEDctCoWmrQOF9N6zUNh9QzFXQ
         PVlQjc27sQ9gSjdJC3IPSsH3OAJ47dLtjp3o6XRWWD5WB0/9o6c9neYtGw9LV75HOZx5
         WRuZK3ZyjToZ+gEkpYxTcXPMvODJWjfS4wf5x0cvq0ZGLVsTMBaxcqdC9GwuCeTk90y5
         4Dhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776759607; x=1777364407;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TeWbx3WFAL4pMrGDmq2TNjEXsVaT12Mw93GvNXeYUa4=;
        b=fmhfNvJU/kOhY/RcrjukfytaRKouM4gUIrg/tQfO6phWmYbJ5LGrilZvnsZ+tZ3PM0
         39GMLRAGChMcx1nmW9W7fJ9QdWeSFkCbAlx+1VNr5qhgmKkSMd4faAif6W+YvpesYJJZ
         ZTfor4JcO0sR4eHQyiwo7r+qGDlheF49jaDh3Gz9r7TFrYEYJLGFcW+v1xJsJFHRXbqq
         8MZ3QP+bCpTV3HUPKAkfMsrf3gSFDxtwlDnAXoQ55IFWYPSGuk0hbY8savf5IRXiylX/
         yAh8434uAjQ8EctnIe4I0E77KGlO0ACrH6sd3b//gA7RFCXbaa44rJ3zZAAfXIbnB98B
         glxA==
X-Forwarded-Encrypted: i=1; AFNElJ/RoF5gLqw2mx1VieKOvAb0iYqJZQmmj+CZwVUERpKxTSjdjool2okgCxrgRBptvvkJfALWiYJBrWiydtvA@lists.infradead.org
X-Gm-Message-State: AOJu0YxiZzj5xVg833SF7HQT6RbyKAtQyINIKQ1yFe8Xk3dCn+Mrd+TE
	7bpEC5maiw0ZDbkvcC2QrFE1FLgETGxM44FDOHC5xyhpqeEPdK+dNKUvgCcCgR4dwYg=
X-Gm-Gg: AeBDievNaBcYds13/8rul7RM2aYejLoADfh2K6C9dDfT02FNZp5lafsbRtM3YRCEVus
	xo6UvzG8cFLQsBbq0wEwiFCQZePPGMyI+HKNwkbWSoAC9tbtKlYz2hHWfzeiZIUpac84/YguTaH
	raRCxg+BONnvtk3HXAu4AkwzBgXDAE831Ty1QJKjNVa5zMcHFdOiT3ymy49VoTdhcY2Br2yU9lR
	k9YQEFIMmTsQnr563B5ZY0DWhztN8kUaVuJp2YYbOYs1rOhvJefn79E+v6E5r4l6jy9FAYsI7Bm
	ayJgwFgwj6h8y4HhFkTcvWZ2oJJAtepmiYeHyoP+NstvhI1Y842kKpww8LTz8szDmgXauzKt1Bh
	mMFK1d2BlHPG/dEV+CbmiZteMkQ24/ACGWA1Ky1out0TdZtdN8L+fFMtOhRTZ2XgO4l4pNoj2Qd
	S15z6uc/gT69L7J1vNR4BtyPLP3DMQbklw7jfzVLbwwxg6fqOOCm0kHxxqrSEAOvUFER0+1l4CG
	pfq6EUAuaqXAlz6dOYF/DRfVw==
X-Received: by 2002:a05:600c:308a:b0:48a:54fd:54ea with SMTP id 5b1f17b1804b1-48a54fd690emr22699365e9.12.1776759607201;
        Tue, 21 Apr 2026 01:20:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8cb:a891:9d12:1873? ([2a01:e0a:106d:1080:8cb:a891:9d12:1873])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-489fec8f7cbsm90004255e9.11.2026.04.21.01.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 01:20:06 -0700 (PDT)
Message-ID: <3a1dc60d-5da5-4353-bc6c-9cec4b3a9067@linaro.org>
Date: Tue, 21 Apr 2026 10:20:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 4/4] arm64: dts: amlogic: t7: Add clk measure support
To: jian.hu@amlogic.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260421-clkmsr_a1_t7-v3-0-efc00b0f9e6b@amlogic.com>
 <20260421-clkmsr_a1_t7-v3-4-efc00b0f9e6b@amlogic.com>
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
In-Reply-To: <20260421-clkmsr_a1_t7-v3-4-efc00b0f9e6b@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_012009_220239_166C8484 
X-CRM114-Status: GOOD (  11.68  )
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

On 4/21/26 10:17, Jian Hu via B4 Relay wrote:
> From: Jian Hu <jian.hu@amlogic.com>
> 
> Add the clock measure device to the T7 SoC family.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 7fe72c94ed62..6a22b48a42b7 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -656,6 +656,11 @@ pwm_ao_gh: pwm@32000 {
>   				status = "disabled";
>   			};
>   
> +			clock-measurer@48000 {
> +				compatible = "amlogic,t7-clk-measure";
> +				reg = <0x0 0x48000 0x0 0x1c>;
> +			};
> +
>   			pwm_ab: pwm@58000 {
>   				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
>   				reg = <0x0 0x58000 0x0 0x24>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
