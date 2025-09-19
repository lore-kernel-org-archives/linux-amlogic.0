Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE35CAC5A5
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Sep 2025 08:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k26bkPslLfabpNA/Yt4EZ7A1V1GFY+JoAXue1N3Xybs=; b=kE++Yy0W1yO6WgZlignqZ7BfdZ
	yjycqQKrJh9Dn80vYmm7z2weuPPzociPJB1fCDma/XhVUaxIsvEeMxoVCszkFRr1c/po+RW/6M053
	xjjSc4HSAX6BtzqCxBOiFZxpgAkQEEumbUFG8AvyCsNejfqce02a1PAFtuqZKTWTf6s7q3INzJGvx
	6trIu4PkUcOCgxD49UqaRaiER/shEsdZU9b0c9BzepT85b8+LUCD+aN+yOtXrFulQpXvmNSURSGL6
	zVnmDTAKjkhZIm25TPy1a3jHHJ/vTbg23k5UjI3lN2j73U+2tZRVvaZClCAE1mZMXlbWBo/WoBaWd
	rxARSkVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWfE-00000002HB6-19G6;
	Fri, 19 Sep 2025 08:40:20 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWfB-00000002HAN-0vzf
	for linux-amlogic@lists.infradead.org;
	Fri, 19 Sep 2025 08:40:18 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45ed646b656so17936455e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 19 Sep 2025 01:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758271215; x=1758876015; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/SvyxtZWUKI1Rdo1Vjcf+SLlqK70xnu3k0FLQZ6kagM=;
        b=bhkAjkrw3RVWXaeGgPvKaomXQKyOwpBGywxZCZi2Z3vivUZUCQiRETUpw16FyqtJeq
         lFR7sjEA1Z+NSc6uM6RgENQlXu4LpTulM16p8pIrKdpzqE/3il7frZWaM9q9lkS12Etu
         920GRbahXUEWN1/1xLR3xsEX96umdkNzWeLko4RHU0tmQpJq48EfdonzMlZ+ggM+qDW3
         +8ui0WBj/aVdNu249RiTBYQn+jNdEVarqOss7tA+RREw9tOXfau8SRYRRAGHZuck3fcR
         pdAb/HjXaAt8lhh069kGJuAyJ2tqiHfBacv8Lalcf7aLHP5SOXJopkUBjSQymz9JEmhf
         BI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758271215; x=1758876015;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/SvyxtZWUKI1Rdo1Vjcf+SLlqK70xnu3k0FLQZ6kagM=;
        b=BST0ATDW1SOxLF/KIYJi469IDRKpLB5Pr8VsaiRt9yQ+jNd2Lfg+BbcHgZMc+JGkk6
         gFp/lRoOaRMx2Nv/7v3zwAV/uCUaISlz/3+4rxH15X5icnAPnOUwq4xhRdEzmqwRcOkA
         ewATfwhtFUVjVAH/hsCokdWjxUdfGp+opul+a66EQLJmXsWUqvZEvvB9G2nZJWXOgvgr
         0+EmJ3qUIZLY4HykkTDuzs1LUTrO1InYXi+hA0bcQttvhUlDX41UDkrlo1oEQiMGXhE6
         IUSYkOeCYh/Jzjbmp4SpiABYtC5/f/D+jSfpIMHG8amRvlaSw9ytacYeUzfzCWggPhIp
         BueA==
X-Forwarded-Encrypted: i=1; AJvYcCXQcsJp0j1PiWKrhd+Gfmld71Pav9N4AnW9KdASPRsevaQjrv8DAkSOLocnhEdp9xqxpB484eGF9WCPtxMM@lists.infradead.org
X-Gm-Message-State: AOJu0YwTXYbGY/9dl2swUQ+FkAo4/ISYCWvXsQev3e/xjH587niEBdY5
	vdAeLnPLaPHK3DJZ3mRfycgXc1Zz0tSYK9wrs49jwX2E/cfRYEeiPpxgPi0Vi8sDk8Q=
X-Gm-Gg: ASbGncv0k82ZOlzBiE9HhNE+w2NS7imZtDO5yhHM8uRuew6OrCD4x6g4DinJculbayF
	clxdu/m/22ojPhocngWAp+Ax+BFIxBKWiqc7qJXWBJro3x+en5HMTSZD3nYC+TSfh4oN5y8aJcQ
	3a70/YpI73Lb8aKDC7reNn+15AWRaHqM5JSkV5/ywN1VBjTlj05a3YFQx0UjFffdtNgtcFbUizP
	hlKhujV5X20yEqKQwnfzNrndnw2JCATwtAM7sSu41HtyuN6HG2mQ8qTIF99nF5+jCjMvCNLg436
	6EejhlCFmM60lEfJ4eM0fSb1Or6ZCVeDZXZngrbi9irW/GSjwQM64CWvMpY9RmFk52tdHHkDivn
	TXHTjdoaIATTddhkTsmypoGip9395SJa5yKm5MIwoCmtnuj9LqGLQAYqHvQNC7LujygrGdo4K
X-Google-Smtp-Source: AGHT+IELGqVFFcBCfJAgURUToEPyQ4ceFB5Cg74ffCU9dil9DlOeFPSPFEncoJEp1KJFhTnqnsa52Q==
X-Received: by 2002:a05:600c:1d27:b0:45b:47e1:ef6a with SMTP id 5b1f17b1804b1-467f15d40b7mr18712765e9.37.1758271215177;
        Fri, 19 Sep 2025 01:40:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:77b3:66a:b2a0:c20f? ([2a01:e0a:3d9:2080:77b3:66a:b2a0:c20f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4613e754140sm113990945e9.21.2025.09.19.01.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 01:40:14 -0700 (PDT)
Message-ID: <a1423d92-657e-45da-84de-7a7b77cc4eac@linaro.org>
Date: Fri, 19 Sep 2025 10:40:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] clk: amlogic: fix recent code refactoring
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chuan Liu <chuan.liu@amlogic.com>
References: <CGME20250918160614eucas1p1657e57414f7db6a57828fc256e8111a6@eucas1p1.samsung.com>
 <20250918160601.3286872-1-m.szyprowski@samsung.com>
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
In-Reply-To: <20250918160601.3286872-1-m.szyprowski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_014017_306665_40E5160E 
X-CRM114-Status: GOOD (  16.12  )
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

On 18/09/2025 18:06, Marek Szyprowski wrote:
> Commit 4c4e17f27013 ("clk: amlogic: naming consistency alignment")
> refactored some internals in the g12a meson clock driver. Unfortunately
> it introduced a bug in the clock init data, which results in the
> following kernel panic:
> 
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> Mem abort info:
> ...
> Data abort info:
> ...
> [0000000000000000] user address but active_mm is swapper
> Internal error: Oops: 0000000096000004 [#1]  SMP
> Modules linked in:
> CPU: 4 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-rc1+ #11158 PREEMPT
> Hardware name: Hardkernel ODROID-N2 (DT)
> pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : __clk_register+0x60/0x92c
> lr : __clk_register+0x48/0x92c
> ...
> Call trace:
>   __clk_register+0x60/0x92c (P)
>   devm_clk_hw_register+0x5c/0xd8
>   meson_eeclkc_probe+0x74/0x110
>   g12a_clkc_probe+0x2c/0x58
>   platform_probe+0x5c/0xac
>   really_probe+0xbc/0x298
>   __driver_probe_device+0x78/0x12c
>   driver_probe_device+0xdc/0x164
>   __driver_attach+0x9c/0x1ac
>   bus_for_each_dev+0x74/0xd0
>   driver_attach+0x24/0x30
>   bus_add_driver+0xe4/0x208
>   driver_register+0x60/0x128
>   __platform_driver_register+0x24/0x30
>   g12a_clkc_driver_init+0x1c/0x28
>   do_one_initcall+0x64/0x308
>   kernel_init_freeable+0x27c/0x4f8
>   kernel_init+0x20/0x1d8
>   ret_from_fork+0x10/0x20
> Code: 52800038 aa0003fc b9010018 52819801 (f9400260)
> ---[ end trace 0000000000000000 ]---
> 
> Fix this by correcting the clock init data.
> 
> Fixes: 4c4e17f27013 ("clk: amlogic: naming consistency alignment")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/clk/meson/g12a.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 7e2c0ce91964..1413eadd8dc6 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -4919,7 +4919,7 @@ static struct clk_hw *g12b_hw_clks[] = {
>   	[CLKID_CPUB_CLK_DYN0_SEL]	= &g12b_cpub_clk_dyn0_sel.hw,
>   	[CLKID_CPUB_CLK_DYN0_DIV]	= &g12b_cpub_clk_dyn0_div.hw,
>   	[CLKID_CPUB_CLK_DYN0]		= &g12b_cpub_clk_dyn0.hw,
> -	[CLKID_CPUB_CLK_DYN1_SEL]	= &g12b_cpub_clk_dyn1.hw,
> +	[CLKID_CPUB_CLK_DYN1_SEL]	= &g12b_cpub_clk_dyn1_sel.hw,
>   	[CLKID_CPUB_CLK_DYN1_DIV]	= &g12b_cpub_clk_dyn1_div.hw,
>   	[CLKID_CPUB_CLK_DYN1]		= &g12b_cpub_clk_dyn1.hw,
>   	[CLKID_CPUB_CLK_DYN]		= &g12b_cpub_clk_dyn.hw,

Thanks for the fix!

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on BananPi M2S

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
