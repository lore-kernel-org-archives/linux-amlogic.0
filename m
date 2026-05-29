Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6497ECD6E45
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 May 2026 07:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oj/00md2c7vd+N0TnEU/OBtqfqzdN6TwdUdFKhPcm7s=; b=P/9tBsWshmsj3n88CUcvYHiIGk
	F4UcygcxuvR/nl5WcA1fUtxnnN1deG7a4VMgRmiYtxfX4GfC+RSP1+KCduOVM42Iwvr2O7Udem2aJ
	Iyu4Wrz6GNcMuJGhWvyoUY9DKREfkfz0r7u8Yc9Nt9FE7MXGdh+w8t8ef119/W5mjwZpuEaSqKkMN
	VVYYNclXQ4tf2BGMF46duenne8JDVWEBTvWxBlwKubWzmTvem+7Trk+kNzapj8rdAh3pxi/YheQzu
	cUpMZ4pEfXjNHpt9UC21HU3R4eHTOMEf6a8YpA64dHMqgmYo6/uqFwBVq+JBz05f2lkQXj1dZf8u5
	XoU4yP7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrgu-00000006saA-3XRU;
	Fri, 29 May 2026 07:31:36 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrgr-00000006sZN-1OJw
	for linux-amlogic@lists.infradead.org;
	Fri, 29 May 2026 07:31:35 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-45eee266c6cso737408f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 29 May 2026 00:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780039890; x=1780644690; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rbf61mTeeb5+bPzWqAJNBcq8SFoXoM6zULZJ7jvwjCw=;
        b=oX7t8BD4tsoi9AXuNeuHVNf4qLTEbxbadTi35fPWQTgFFt/e5oxhxXyjpPyvkAYosv
         MKDrP0FmKcGCifm02eCKGRMgvH0zhDtHrySGP6MacHpDUyCfPqjfuFTcuEiZRObxcCRh
         zTCaOJJohzscXI7BuzEyGBA7YsYRwLvLijWN44ZckTTNBInfSKjjpvGRNnLQ/NeVa2EY
         IRAPmCsDLMnAwJRih6VafXH/qBFebZd9xwxXuZfmn9CmialstZBSkl0ektL9S8P0AF18
         JVJnlBMp5joRshvOWKlGjaHJ7xJibIQGpHnChcI/R2KyVkuYvyiESgQ3uzX6M9BjDnE6
         KGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780039890; x=1780644690;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbf61mTeeb5+bPzWqAJNBcq8SFoXoM6zULZJ7jvwjCw=;
        b=omKiDfpOB2NQi8Y1Mh7EpTcIp1MH9GjS+h3DN+VNYehwKL8qTWiNkQCatUB/qfbGLJ
         wrXsCuUx2RrM1pk/O57/T3vi2QDuzl4tu+3fiEPwcTgj07jneNtGqTHDflojQMT0tYKK
         7HWbtDFewb+UAdYnNtF4qmDlxb6/7jdQjGZlYbAFnMDeFApPeYNF7tn1/ES2nIHwbLMv
         qE+L7jjg8JiHnsTX01pDvGC4qD9QT6cdEEoUr0IVlrKiaV/TsTjLZ/0+kPvbCu5dE4pf
         Q4Pk5Bk6+fK/uK5oA9rTLZBezFx95MlbSby/jJp+DEPfDhLoy24H7ORq1umpyv3RiZtq
         rPIQ==
X-Forwarded-Encrypted: i=1; AFNElJ/+gyVWY8NwDSACJk8mDMdBvh+S8SRoohhqZdNC1qqRUDnHhbBp/IOSZOo9DifH3up96BtcUk69Hm152IrI@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ5l6TMkO2nxnQ0E7IrcWOKHnFbaqWJM9bMdsixuihr6BOrJpb
	YqUno/ngZqoOBznEtu2xfhVgIDXXHqt6YBssm8HO1goupdJQbE7uy8wIj91TXG5xIjc=
X-Gm-Gg: Acq92OG0vHb/gC/JCX+5xfQMz8G0w3AQR4kQuFyNldVrl+7Nieqi/VigfotC63DA4R2
	rN/NZqLNPtlol7zk5BdnerZe/s8EFe6dXJMIE4a5CzW3GYI8waai2cgtH1li1mxgdy5+jeT5s21
	NnaQY8nZLjjsBoDc/2/N0xLDrOqdneMWTFJOI2vfwtmmFO3j5CumFAILNxFAFutwTaz64cY6WE5
	dWVAgpMyFf1nuYzsLDCXt6xkOe2MNQNthRfkiiI40tekjIGI0Z8TDkxyQHu5ihCA0thedSBZ4T8
	0Y5FX6f9Vh69f48wDpXmLSG56mtv9Aau/bDexArBgE8eY36Drm9LE/QjPn2FHx6668ZQqyafukA
	RWYqQ0VEhjktjbqghAyUnqHcm/mjClFztk1vTjtnK2STAOZKauWOHbexFnlkTEaYVP81Ebq3MDM
	HlapCULuNXfixS1JFN7i9Tf4dO8tzty1RDl848e5xtiw==
X-Received: by 2002:a05:6000:4b07:b0:45e:ec27:b4b1 with SMTP id ffacd0b85a97d-45ef140cc1bmr2805286f8f.12.1780039890330;
        Fri, 29 May 2026 00:31:30 -0700 (PDT)
Received: from [172.20.10.3] ([37.167.96.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a090dsm1495768f8f.3.2026.05.29.00.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 00:31:29 -0700 (PDT)
Message-ID: <8ef7a26d-8e32-4684-b0ff-dc0c3ff4af73@linaro.org>
Date: Fri, 29 May 2026 09:31:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] media: cec: meson: ao-cec-g12a: name the CEC core regmap
 to avoid debugfs clash
To: Yi Ding <yi.s.ding@gmail.com>, Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260529060005.94700-1-yi.s.ding@gmail.com>
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
In-Reply-To: <20260529060005.94700-1-yi.s.ding@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_003133_780995_A9786ED7 
X-CRM114-Status: GOOD (  17.30  )
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

On 5/29/26 08:00, Yi Ding wrote:
> The driver registers two regmaps on the same platform device: an MMIO
> regmap for the AO CEC registers, and an indirect regmap (using
> reg_read()/reg_write() callbacks) for the CEC controller core registers.
> Neither regmap_config sets a .name, so both default their debugfs
> directory to the device name and collide:
> 
>    debugfs: 'ff800280.cec' already exists in 'regmap'
> 
> Because of the clash the second regmap's debugfs directory fails to
> register, so its registers can no longer be inspected via debugfs.
> 
> Give the indirect CEC core regmap a distinct name. The two debugfs
> directories then become "<dev>.cec" and "<dev>.cec-core". This only
> affects debugfs naming; register access is unchanged.
> 
> Tested on an ODROID-N2 (Amlogic S922X): the warning is gone and both
> /sys/kernel/debug/regmap/ff800280.cec and ff800280.cec-core are present.
> 
> Fixes: b7778c46683c ("media: platform: meson: Add Amlogic Meson G12A AO CEC Controller driver")
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Yi Ding <yi.s.ding@gmail.com>
> ---
>   drivers/media/cec/platform/meson/ao-cec-g12a.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/cec/platform/meson/ao-cec-g12a.c b/drivers/media/cec/platform/meson/ao-cec-g12a.c
> index 41f5b8669..2c914f000 100644
> --- a/drivers/media/cec/platform/meson/ao-cec-g12a.c
> +++ b/drivers/media/cec/platform/meson/ao-cec-g12a.c
> @@ -405,6 +405,7 @@ static int meson_ao_cec_g12a_write(void *context, unsigned int addr,
>   }
>   
>   static const struct regmap_config meson_ao_cec_g12a_cec_regmap_conf = {
> +	.name = "core",
>   	.reg_bits = 8,
>   	.val_bits = 8,
>   	.reg_read = meson_ao_cec_g12a_read,

Good catch


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
