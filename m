Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6142606A327
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2026 09:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nAWAw6oh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UpBMU24K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dbaugsSFl4XCoIRjqU9n29nVLHIgEcSuNG0rAtu8BwM=; b=nAWAw6ohHQtptqdWKj3tYUOLxX
	60RkMqy8QVzdF8dwLfQ7awqFWK1yXdCtIKTGHBlWMcQqvjNIFTY6n0FXhAVjBFEsYn9A0SMp71Q/P
	1kcv7adABf+5q56xDvChNvqOp/92A9Pt3ESYWqQYq8+UxYKY6vxTzwBvlBEdtCB8t3Ilv1TcSVH1s
	a5aqhpiS6l9EHVZ1HJkQ9t61gT6II21LNBv85EGEdp3aDwgpZFHdp6rvf0xrcQSyJZfAS6FFpI7ev
	4dpKmG6VjHu5n+t5bTkorKDgQuD9j7ADvcPncwJPjJu6YIjxkc3B8iV4+2ZhY2C/PN/7MqMq5iUv9
	7KO2OzGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAVr-00000001hOh-3BnC;
	Tue, 03 Nov 2026 09:09:03 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAVp-00000001hNo-03Me
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Nov 2026 09:09:02 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48b001cd92bso2083723f8f.2
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2026 01:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793696939; x=1794301739; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+6KD6EavPTxoIx3RdmJF2dsNsMGEPhiTBNUEhG2xw0=;
        b=UpBMU24KJPV/fam7Ak2epnrfQkfrcLCm9H4nkEMwrzOq7DxG/m/pTocZjkpTeilR7i
         fbp6Zds9hwZnXZFxC+vuhLNGHAoB331+YOc9Qqq70urP7+mDta4Mxfp0YK9XuVe6OksV
         qUtamM41isUWYZzMMOMbNuW/UBochWpAP5EkrdU8dPdZ8Cxeucaf0068uGcM+OIj99nb
         JljCE9uGlO5ErjPpYzBbNJoVBYXx1TviU9ycPKSOuIUzuUhXW9XDXTe7S4oW6KdMCWgB
         d/Fe5KVy/YjKgpquq3z7iZeh/GaQo+S15nT0rvXHp4OgPBeWJhmxTUhjLTJkUdLSHsyW
         zMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696939; x=1794301739;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r+6KD6EavPTxoIx3RdmJF2dsNsMGEPhiTBNUEhG2xw0=;
        b=irHdT8QbR4uDU9nYFLfbJTAhBqiU6Y0qQVYLZ8M4wgxiZdoDHsOEHbyRDo9P30KUEd
         RHkV6IAJZHEy/jiAB+NcnJXvHad5BdpH1zGSQTQoe2qUau+VjguUMFFrBWGOZ71uQwaW
         kBqhKMqhvxOA+XlnC4vGBdROddsg5+NtQ6Ky3nnQ8oMUgi6iEn4vK9v7gpca7BkJgDk1
         cHwkM33a8CVDzRDfJ4MJBlpsukxTDjHWQhUUhyhJwDcdIphydqlCkc+TfvBpqn2jgRRA
         cIsw+X428k9btYPy/GWSdoN/+gZ2Sg5vf49ezWWy/4hYn0YPppbtAWb8TWTXcHZQQDe0
         UVJw==
X-Forwarded-Encrypted: i=1; AKwUvBx9kflqxMctOnz2g938JPlbNkOjxTwOQ/Sp0FSmR/XE/DGHSrxAgrqOjgbbUV30QNtkMNaeHwTj5xWmNbuU@lists.infradead.org
X-Gm-Message-State: APuU4Z8KsHkxmsweC4Bic7CI6mAt5PK3IlOIh7V2XLVUsZmfbK2SfJt2
	FG6umQjqNczhZ36z7aSFFdxQT70OTutiPHDiaUAZSSxxq97IfVqswcFgvAEqf2utfdU=
X-Gm-Gg: AYBFou34+NJv8N1l2/lOBRo8V4wPYHDd89UoutbVTOvbhiS3QoA/XFYgOO/VyS2FCKS
	Fvglbod3jWLaqicZEe15t1JpnPLSz9NxJKncD1nSF76jJdzQi8BogTxU9Mx1+E5viXeHRFNy8bt
	v9YxegBrOBuwcpMYVjs1ZhH4tBggAD1ibt3A4FNnYk4JqH9rud6uL8YvvoRKT8Ur3SF72lCPZgJ
	yTZFA6VrB2VoeXsK6rK1iVYymXclae3xMgal1T/3hgbmx4pZ5rRPLI0VkU1l686AH8GQOb1LU6n
	8/at39a7wD3AzN9Zk83m/zbEHUgdNi4aUfXTEB1p/QzckeI7hp2VEtn1Qq1YKLRfgvuGiHd7bDr
	88foBDS3ntqyMtlE99G+EDJgLtegI+N0Tpx7/01Ousxc45lJiJAg/GHdZpm12+m6y55MBllcDmC
	bv+F+rzKjmpw770dk1ajWgiiESh5l++RRuUy7axSfjOyrdOLBKVxlc/L7LAzJCb1JK2aYIY2E9C
	NYwD93imCMGagW59maGpbCZAOIIfHjRlSaMY77CDcBnmHQpypuNBJ+m3A+tjUgajxqPuSm4xX/R
	H/PrI5fglkL36IuVper531wwWgpU7NvHhLm23rBG0cJtOEAY2GgohlLqAkog3JLaRBYmYt5P6Ob
	NKO43WuqQ
X-Received: by 2002:a05:6000:2213:b0:48c:7f18:c85e with SMTP id ffacd0b85a97d-48e6e3042d5mr27695053f8f.45.1793696938764;
        Tue, 03 Nov 2026 01:08:58 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:95a2:4869:9f46:45f0? ([2a01:e0a:106d:1080:95a2:4869:9f46:45f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fbba47a32sm717115f8f.1.2026.11.03.01.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 01:08:58 -0800 (PST)
Message-ID: <054d99f5-3364-48c8-a5ba-ca2faf745179@linaro.org>
Date: Tue, 3 Nov 2026 10:08:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] soc: amlogic: clk-measure: Fix AXG HIFI PLL name
To: jian.hu@amlogic.com, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261027-fix_axg-v1-1-741388f1e851@amlogic.com>
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
In-Reply-To: <20261027-fix_axg-v1-1-741388f1e851@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_010901_076812_7564C231 
X-CRM114-Status: GOOD (  14.51  )
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

On 10/27/26 09:43, Jian Hu via B4 Relay wrote:
> From: Jian Hu <jian.hu@amlogic.com>
> 
> AXG does not have a GP1 PLL. Clock measurement ID 5 corresponds
> to the HIFI PLL, but it is incorrectly named "gp1_pll".
> 
> Rename it to "hifi_pll" to match the actual hardware.
> 
> Fixes: 19e0bde7bf6a ("soc: amlogic: clk-measure: add axg and g12a support")
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>   drivers/soc/amlogic/meson-clk-measure.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
> index 33767f0bc67c..c1ffa2537464 100644
> --- a/drivers/soc/amlogic/meson-clk-measure.c
> +++ b/drivers/soc/amlogic/meson-clk-measure.c
> @@ -182,7 +182,7 @@ static const struct meson_msr_id clk_msr_axg[] = {
>   	CLK_MSR_ID(2, "ring_osc_out_ee_2"),
>   	CLK_MSR_ID(3, "a53_ring_osc"),
>   	CLK_MSR_ID(4, "gp0_pll"),
> -	CLK_MSR_ID(5, "gp1_pll"),
> +	CLK_MSR_ID(5, "hifi_pll"),
>   	CLK_MSR_ID(7, "clk81"),
>   	CLK_MSR_ID(9, "encl"),
>   	CLK_MSR_ID(17, "sys_pll_div16"),
> 
> ---
> base-commit: a848d72aab71e19ea78180f2502ad7d12818723f
> change-id: 20261027-fix_axg-9a1226dd4f1d
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
