Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E6CC48297
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Feb 2024 15:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NTyXf4yQs8w6Tlmyg3lWnOk0nmG69XVzHCgpiKw7V6o=; b=o2OUp80CVmHKHrsFU6+boK0Ey7
	0m7mBfK5PmzSY0EdbU3d1bm8SgKdHKGU5ZXZdG9wQDJc5x2VCKyKJWXRITF3TGAe6EVG9Q95IOGJW
	bdaJw2hZB8YEC/9l3hB74TGZzn6q/7gOrGp4VU4QTwUxa8ktOFIWwH2exZtQYY3PlBJa8EaSejAEI
	p9x75ALztAgJ4QNvHXhh02cyteeSN7d9l2179Wn5RXp6G7q+X0GL5YwaQCkf2YTWQIj1xMXsFrthp
	2s0522WiDyLTcs2gtMQjpCXffVKzbYj3zcP99q3OeHiyZ1DKHi8Yxl7AEMfc3vVWdJbIMIWfFk9cx
	wZ2+bzRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZXq0-00000005syh-1zk3;
	Mon, 12 Feb 2024 15:03:16 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZXpx-00000005swC-0es1
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Feb 2024 15:03:14 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-411a5b8765bso1799445e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Feb 2024 07:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707750191; x=1708354991; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGTRmgzCEblYT2wFMD0YKSqg8Cojz0DyNkeKTFhBxkE=;
        b=M+Gcw3jzT8W8r9td9r+S7aveajUM8xn/ohZPZH1LKsdJefHV/ohx9IUEo0BekQE00J
         Dm6W8LNgczfLho15hlmXkJx6snK/0WYEu8Clya6H4VujnXFfUQFbyWaHESHkP4Ke0tBB
         w7ZPvZQxalJeYnzatBB8CIORC49fcKdiRsRFJeiaBX199WtDdOmWkMfN/qBVIuYCJxgi
         cCCGCq0RtFwFZO8kxi6hewAA/6h2I4yDMSmYu36dC8uo4IIL6Yi3UMmjHDWYN9r3XAQ3
         iuoqYuYwvPZ3Saf4iHNc0ps7IYLtsA56BpqdffX0aiVyi8/YNu+XNAmzUwo3dHbV+6vt
         1G8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707750191; x=1708354991;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gGTRmgzCEblYT2wFMD0YKSqg8Cojz0DyNkeKTFhBxkE=;
        b=p/1v9cAgGVPrwRoLc3iS2q5KqfI48dxJCjzojlYZmqB8I5zlzCBW415mNkbh0fXNRt
         OLZhpT6gspJfKhpTbOOXnIYOZNFYVG8I1eSPCu2abgJljua/Nb1v0PsfC0vgBXka62w4
         whVEfBA38WU5BDNqndnhYMQPHWUeTSvH4h5AzmuC0qQGT2N/6i9ZtrHLQazNj2nsfmip
         Qlg8LaIBEFVILlpb5FoLw0gaM62QyYjKXzXKMklWt7BNN9EAD3A0p/0I8UICKTkj6bCd
         HfXqf5Y/XqlhkEEkv2VXVUqZ2CvqrE2f8RvBTVpVNtQG4pu3sA5eVSaQLju/YsxZ7xTM
         bGHw==
X-Gm-Message-State: AOJu0YyQyPfuhbDRsTObVjfHrhrDCLxeURNArqsugvCIcQFFbP/JtYrI
	6nptpryPQ7NEkRPCLmwY+V90qcqbmctZt8nC65KKb7R2Oj8JKjDz7Kp2D5SzmLs=
X-Google-Smtp-Source: AGHT+IHA1UCG/ZKTQDxhTv2/ZdMRnGA0SzA/uhQLD1cvW016suIRlCYJ8WpJt/Uw8yYV9wQ+hTL9zg==
X-Received: by 2002:a05:600c:3553:b0:410:e1c0:7f9f with SMTP id i19-20020a05600c355300b00410e1c07f9fmr1844057wmq.13.1707750191345;
        Mon, 12 Feb 2024 07:03:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUqbUhdjeRd3+eDi82KiEJfyaTc1NlRHfTeXx8eqck9pPTwemYnPemYwHGjho4Rint6aXa4gIteX27NSVmPjHBFuGGUfKA9H37ouOp8SmyFErLvoxbwKQghhVechkKnY9ZJRvtw3PEmlmLUJYf7XA+3Q1BY/Y6g6HNy0R2RDGkRTH6EBct57NsHbSopYPl4b95fTr3Ly7EgyXxeyaiJtl5pT1HgFG/sa0kvNImXYMp6edRe4koYUKj1GmpCKPAPowyfM838AAyFn8lJVhZFWiqINOk7omFPTbBQ+fhkmksoROJMzPRSISvtq3YAPOMsp5iparQCdWfJp3vKJq63HXuRAmkkCrMobW4t3+F1Ea8nhSL83cnoG+8JbKFncPOnOwr3FPQyDjW1
Received: from ?IPV6:2a01:e0a:982:cbb0:fcee:f026:296d:135f? ([2a01:e0a:982:cbb0:fcee:f026:296d:135f])
        by smtp.gmail.com with ESMTPSA id fm8-20020a05600c0c0800b0040ef718cf81sm9146044wmb.28.2024.02.12.07.03.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 07:03:11 -0800 (PST)
Message-ID: <7aade7aa-68eb-4585-94c1-6bec11ff296d@linaro.org>
Date: Mon, 12 Feb 2024 16:03:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: t7: minor whitespace cleanup
Content-Language: en-US, fr
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240208105252.128940-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20240208105252.128940-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_070313_213196_B2C00861 
X-CRM114-Status: GOOD (  11.46  )
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

On 08/02/2024 11:52, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space before '{'
> character.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index a03c7667d2b6..ad1cac42e9d8 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -54,7 +54,7 @@ cpu100: cpu@100 {
>   			enable-method = "psci";
>   		};
>   
> -		cpu101: cpu@101{
> +		cpu101: cpu@101 {
>   			device_type = "cpu";
>   			compatible = "arm,cortex-a53";
>   			reg = <0x0 0x101>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
