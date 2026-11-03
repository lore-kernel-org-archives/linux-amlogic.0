Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C95C606A326
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2026 08:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=alhQxwcP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Yoljmo4S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Rg6bZBfphY1/MKL/CoZUpylDVZ80/1PYKcsvwVrIdog=; b=alhQxwcP7HgpyO1jct8zETCOr9
	2fRz9E7spGOAqOiz0JlizWl2gBmbW85zAVJQrlvZJjxLDM9EyCXCbyRZxR4Bbsl5/mRrKlHb3Od5H
	0GpbktldXWQA/Hgq4C56pYMIGlz/CGDlaEsKQIaMG8OouyXlETXCL2P46r/ZZQSxgU1DR67P1xNEB
	MsVl+twXFLk0F6zdDJI92aqlYJXKIc+eUCp53fEMR62GLRm97LXW1uDkQomNxTcDJGANZa+QKU5J5
	Ottq7UF/9q8n4jAgmr+9EaQuvh1rLnpxcU5YQJzZIYtlnD8TafypSYRRzVnPGuYIrgT16Bj2flxpZ
	4uWxQ8nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAIS-00000001eCa-0mbP;
	Tue, 03 Nov 2026 08:55:12 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAIO-00000001eBY-3s2S
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Nov 2026 08:55:10 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a210470b49so30808515e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2026 00:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793696107; x=1794300907; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=agwTDlVTaDDjvub+/sVTXidA5drfVA/Xuq65aoektFk=;
        b=Yoljmo4Sm4K3FQtu3v7O2wmm8A/2sxgQyJ47vePGJqouhx4Ufp4qr9u4hwx45CMR2z
         VPeqAMd9b3cKocTbyt+sSBHnJ/czUIFwN+IFPK7qaIzWr9Wwm49faokFq34cUSARISE/
         eScJoHxZsa9QnwGRv4u4iHkQLuOTjwSDYyGbvxb2kbZEq9lZ31dxvs/jGftQ1GjYGuHJ
         y1+p1hXvBw3kMiiMX8dRTyuUxTfkKKyx9AZg6BzDN+T0DMOb9+I8JYSoXbeHFztiyUbm
         h0gXFurtTOEygDGh63a9xTFpvoOVWWwkE7pmueSszs8TTkPkIHLPHn1Dolzwqjp8/JY/
         1C6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696107; x=1794300907;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=agwTDlVTaDDjvub+/sVTXidA5drfVA/Xuq65aoektFk=;
        b=t0Uv01hrArUTvWexXb2nVTZO8qdAn6H1LzVmsQvZu8BEKOeUWfRVGHclTNyKkeCJ/e
         C1PmZPiBnv2XZHMb2jNB4sTyR6zDfboS+p3uJcyYHr3PeRYrVopH2C64OHxRQ5l7pzsE
         VktxjzBKNslt1shnyrwdGmvkeHAaYncjimrEjHYvsO5aMy/Iz87/bDDf0BnmjyqC4D+x
         j+fprWph4DhBnG47mxdjS7JJu35SqmTq/HkIJnYy7mflq+//c+ascTzmPogKrTUjejSp
         aBryKy6dHBjruXbrP0kVKloa5hb5XoPASZX1kAB0+l5DRRhTwDFAZtQ0y6yH7sVbB+as
         wR9w==
X-Forwarded-Encrypted: i=1; AKwUvBwzBlMeAtLMCvP3XdCRntXw0TJuGko5LkTbl47jlupYCNFtK2kRADBGLv+Ejjy7nO1t8YKhG3JT44V2hst7@lists.infradead.org
X-Gm-Message-State: APuU4Z/B1/cKVOiPflbtrL/VeV3SOYhiwnFat9o3hM37Ydf7rr6ZT35w
	NZ8wDOMlY8h/2fU/ooxzzIAMK0bq9uFaXjYqeHf24Fi9abWnimLKBc7Jm86liI7M4BM0FRh2nF2
	5sqOlkxc=
X-Gm-Gg: AYBFou0Lna8EcBDq4GGQRCL8pL1yblglDVV7mgqbOVMszPqMawu8qV61cqGNQh/3lIG
	LCzyw0LXoE588Y+L2Ap4qG7VJA61eKOKA9zFQK1cz2/ueERbhb1KtYpS1oH6ZwGxjNo9KvRA8v/
	zh9BlcDiDRlNi/jOTbb4PjcAlkIW3qjVENeyGrvzwW3E/XdTooMXiEllhgxz5plsIKPpAecUj4t
	hApI3Mkw3v2Bzza7wPTpU+I+mTmE4i2BnxK0r5nssWTB9gGuf7V5lyqwGGy2ZAtuGoSQ7SFe4FH
	/SXNkmBLgYDC9NA/awuzqYj8msvV/ysTIgxuge70MaMTc72acoawqKCE641rYOXAACMkEcX7v/6
	J9KCAt34dTdmW4VdjekkznHGjcpDHrifmdLgQFeLqJDs/naXv86AwB/PtIKEozdMJ0A+2U9Pa1A
	CA3qZfmyPFIFUxIujjt7PVWwKAJYDnJfGEPO/a5o3A2pD2ETmx7K7mUH4lF/B+P+sZ/PdW92hoS
	RVbnucs8Vhtk000QWZ8VJridL0Jn8UGOnLAG2VxrkKKtGWXe+CLr0koLJHAUfSAwzG+Rp0V/o9C
	TbvNj7VESBmThFsIt6SDP8RQ/D10XshUQRnaPJF7Saw4+SbE1fiaiLpfgBrISB+F0Z00afMaPCM
	JaO07HB9s
X-Received: by 2002:a05:600c:8119:b0:4a1:cef3:fb3a with SMTP id 5b1f17b1804b1-4ac17a36a28mr255021625e9.9.1793696106916;
        Tue, 03 Nov 2026 00:55:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:95a2:4869:9f46:45f0? ([2a01:e0a:106d:1080:95a2:4869:9f46:45f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9bd5d9fsm40122525e9.15.2026.11.03.00.55.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 00:55:06 -0800 (PST)
Message-ID: <518cba7c-1aba-492f-ac6a-c5c4fe6da847@linaro.org>
Date: Tue, 3 Nov 2026 09:55:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm: dts: meson8m2: add dwmac 3.70a compatible
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20261101232011.1172410-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20261101232011.1172410-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_005509_010832_BFA55D32 
X-CRM114-Status: GOOD (  13.35  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/2/26 00:20, Martin Blumenstingl wrote:
> The Meson8m2 DWMAC reports User ID 0x10 and Synopsys ID 0x37,
> identifying it as a Synopsys DWMAC 3.70a core.
> 
> Add the "snps,dwmac-3.70a" compatible to match meson8b.dtsi.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   arch/arm/boot/dts/amlogic/meson8m2.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/amlogic/meson8m2.dtsi b/arch/arm/boot/dts/amlogic/meson8m2.dtsi
> index 6725dd9fd825..cdc47ee1a233 100644
> --- a/arch/arm/boot/dts/amlogic/meson8m2.dtsi
> +++ b/arch/arm/boot/dts/amlogic/meson8m2.dtsi
> @@ -25,7 +25,7 @@ canvas: video-lut@48 {
>   };
>   
>   &ethmac {
> -	compatible = "amlogic,meson8m2-dwmac", "snps,dwmac";
> +	compatible = "amlogic,meson8m2-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
>   	reg = <0xc9410000 0x10000
>   		0xc1108140 0x8>;
>   	clocks = <&clkc CLKID_ETH>,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
