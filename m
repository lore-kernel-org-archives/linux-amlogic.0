Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA44C4167B
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Dec 2023 09:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KK7rsB6bCY0pRTB0DV5619pT19WLnRkfmUojD8ILwk4=; b=oXbsT/Zagdi3Jr3jOY53dWXn7g
	/VbKV2pmnHJTOUkUAQAUy5XWPbn2qqlOg9k4CqLGi/5uFkE4wt42RURVDy5Pu/0ZZWXRYnI8Jc7+/
	Pe5h5H+XKBxxgqbszzrpwlRLEavcMiFz9obpEyA8wVuTxZNXxZ4BW9Z5LtDR/w9iZSG0Qj2z8aFQ3
	Ys2c3VlEElQY0MXynM8vrtdzkIc1f3ngqgx0Zmxi4GD0S3PKPrh7Nm9bDUzJWx17qHmhLPFRBXk+N
	p7urXLT53NTGtLeGr05Cj36FIqpReb6bSEBGe/BuxG31NlV/cCwKZdllgqvhW8qeB25DTftqImKhC
	6vrgdIwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCcJ6-004QXa-2S;
	Mon, 11 Dec 2023 09:10:32 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCcJ2-004QVw-2Z
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Dec 2023 09:10:30 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40c48d7a7a7so4926865e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Dec 2023 01:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702285825; x=1702890625; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e1hHdtNOUKQtimSKcn02EUH8wMvcC3cjPEPTtQNRnlQ=;
        b=ZwW4Be7JiqTd+3gQqeVH2w1IP9lqycB1lFxv0Js7lJr+PQG/MZfxbSXUcNK8iE1o2K
         Jy6q7ERa6n3DU9YzEOcsViatBGe/7zXEMtEVSfevRKM1650IoA3uO1e416TBGzvLDyPE
         sZtEBwxZZnDwyRCsOPDGB2b4KMuaNjadbva9WtxvXZkj25AxR90QLfu7wYEyreJO7N/q
         LyQDyiAgeoT8UadjH9ckMFcKOCULnuRPROMCnTY2qHuySYvi4by7G+jov7LSMzqduoob
         KYTdXZms9naIBJd3nWGPqOyJnWVUDRqa2XTcWbqeUVffZVvVm5nmeok82mhq4UicjJxz
         2NSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702285825; x=1702890625;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e1hHdtNOUKQtimSKcn02EUH8wMvcC3cjPEPTtQNRnlQ=;
        b=A3xZEZPAo5DBqyzA1EXNV3bDyoEZKsutDtn3sRF9y2N1KOv6Ac0kUELPdqyUGdORfe
         QaLKt6M4NG6Tw3oISGOBg7fp/+wdv6O4TR9rCfW5kZOTeS3iiLOQAz0n6j3x4X48H0HA
         HF369usW0QXVm+OYQOa0oClrZubQg7DkO++Ex4qSBLRmPNSiUuNVTGW5V8O6LSOZu/mW
         VUNqNeHk3GrSpcIxgYoBp8w0o60wYVM/r7ExGdn+FBfco5/B9DUrV84h6ncczAaPSdTu
         0taBGXqZ/1kWmr6NxDkd+y2D9xC71bn/jNSL6vcofBisQ3P6Hw5KvgXEw6jQXsHBFN1x
         bhkQ==
X-Gm-Message-State: AOJu0YyGk0g75LmxjrAQLQwwjrd2F/vqZQpPS61JAAymsOnc2/Uoe8Ay
	gHLr1e6iUN4meI5jBakkAZ5bKg==
X-Google-Smtp-Source: AGHT+IH64u4s+nNS2hEACtXPcIntf1k/WlEVOEsxu7iP8inZ9hFuymODeAPuiTftKfdWL40tXRirWQ==
X-Received: by 2002:a05:600c:3411:b0:409:79df:7f9c with SMTP id y17-20020a05600c341100b0040979df7f9cmr2584703wmp.36.1702285824976;
        Mon, 11 Dec 2023 01:10:24 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:302e:e0c2:d42c:cb23? ([2a01:e0a:982:cbb0:302e:e0c2:d42c:cb23])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b0040c440f9393sm4627069wmq.42.2023.12.11.01.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 01:10:24 -0800 (PST)
Message-ID: <449d675f-e98c-4924-ab81-14a139081a97@linaro.org>
Date: Mon, 11 Dec 2023 10:10:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: minor whitespace cleanup around
 '='
Content-Language: en-US, fr
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231124094739.58163-1-krzysztof.kozlowski@linaro.org>
 <20231124094739.58163-2-krzysztof.kozlowski@linaro.org>
 <4150bf8e-a48d-4d16-902f-a95f6489c6f5@linaro.org>
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
Organization: Linaro Developer Services
In-Reply-To: <4150bf8e-a48d-4d16-902f-a95f6489c6f5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_011028_853974_3D6B183E 
X-CRM114-Status: UNSURE (   7.75  )
X-CRM114-Notice: Please train this message.
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

Hi,

On 24/11/2023 10:49, Krzysztof Kozlowski wrote:
> On 24/11/2023 10:47, Krzysztof Kozlowski wrote:
>> The DTS code coding style expects exactly one space before and after '='
>> sign.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> 
> Please ignore, that's duplicated of my previous send.

I don't see a previous send, so I'm confused.
I can apply this patch if you're ok.

Thanks,
Neil

> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
