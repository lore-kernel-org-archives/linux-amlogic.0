Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E696BCD8CA8
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Jun 2026 06:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pb8tRboxIii2hUTDguseUgu5k+TqgtXzfpcco9/cM7s=; b=nCxVizkkorxzvT27uTZmXsqIdr
	1OwkIe3pykbkcN6c2Z1qCQKbN5tm8oE4qIwsHqWjhJIqKMUPHcvUGDW/c8aURm6jJY2FUfuLjxFc7
	53qFyhffkkUx6xJZnujk6iZDPrsxqwcG/Ppa1bgsNLEXKG0fBNUAQl6kfEBPwXVopmIijuF9FUVDv
	mfIO4IUtFPd+iVIklnAl6Jo7Zt9c/rT81Mwoi0z/8bCpDIWm+ZhlD1CMQC0OIA1Ez2vxAfHv5uRSG
	OjPoOMIahwecZt7KdTSAs/I4qrqD8nH5JnNxlf2XIvI2KddHRzzCbXhE3r1dwAa9Qywtg88boEz6e
	EMrmXgXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMxt-0000000FHyr-3aBb;
	Tue, 16 Jun 2026 06:08:01 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMxr-0000000FHxy-10cr
	for linux-amlogic@lists.infradead.org;
	Tue, 16 Jun 2026 06:08:00 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4908b92904fso50800955e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 15 Jun 2026 23:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781590077; x=1782194877; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fg7/Bt2hoSMHwuHZLh5Xj5ceyiuOjajftOMuvqKGx0E=;
        b=l71X16e3PnlNsF9zN5UFezrQG5Sn2CyXlZsrckGTSDZhRzHIf4BT2ixox89U1lu3tY
         PwIlobPxLW8CWagQwR5wRhTgQb8lrZvTxN6t79WNJUDSTFu5z4c71UfMOP1ne5BSTCdk
         5z0zOMf4VJCd1fq86t2FIeUQELMdNf38pleKoEEoPVExxXqkNiK12lPKPCOFaFMZpZ9W
         E9AJt8dOmx4U1DZ2cK6KLL0QyLlD/z6zviqC0egV1DmuBmdRi/j6PFKFhO5S1sN7gXQ5
         iyyE3qJua6VcQ664J60yJM/w696l7cZsvOHzL8qTH43TQy1w51HNEKlW16I0SziyVy8K
         ZVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781590077; x=1782194877;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fg7/Bt2hoSMHwuHZLh5Xj5ceyiuOjajftOMuvqKGx0E=;
        b=sonJ2alSIySD/kJKqkz7/46BHc0z2ZMNIxKgaohop0a/Yt4e6oY60QJZ+EQUxM1lqr
         p1HhTpMHGT2Kz+vMI32DboSf/v7uf43B0ACRHS7TLyegUwmclpaOrfOSi5XkETq/E6du
         joTQDxaxvz6YbDcRWkJhSA+zrHzhLKLlpP6W/mcsUmIY7LiD+pcZgnKkV33nIrmYpt/w
         e1IkvnhvZoYpCRw+pL6r7MimIli6lrNfoc8FQR/8ongbv1V2++Yg6Qyj6jvBeQMK9MSa
         f5X6u923EGQ8VdZT4dVdFEfiP9RnBwgYumCstvHjF5YHiRDgqRH6XDH/8nGGaf+Z1z73
         cjPw==
X-Forwarded-Encrypted: i=1; AFNElJ8R6Cmf0OXTlEIdpDbvm0RVQrSdNWI7sNOI2vsV7nX+Ox4KVRsSqDzB2nz7GXnuiimW/5M1XU56DqlyDZ5d@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0eVtPd27+LSnbFyYsjbCpUc9KGJ3ZIX0pc7jMEe23M03QkvQC
	tbxeucwj3XZ79KoRA6yzHk8ZrWUDVU3UnEAH+rI3jmsrink9iYeQwl6esmFI5kyIxxMOdQW9spp
	VP+Sq69A=
X-Gm-Gg: Acq92OH6NsCqGyRaJ/lBv52Ya4UWEmH7jZGXkmujmBZZ2g1/4Phr0RyNcU9MNGCJsr5
	5bd/W+XChZIE1eEUmC3qc0EwG3UgnvuNqVSnR2jTn8wlsf8BQPttao+jQ2DHOCmEiZ5XnXUwccz
	l2OQImm9zfnSWZ+c/bMGwCi9uwOYPtKrq5lCh4W+8y48WlDgEz/UnX2bNpyNvv1jY3J278lQlXM
	rSw1xL/EddGvUixBQMD41UM2V3BlicJ8we3fhKpiFbjvM0QHsQruI5cjPF9svQxCO/H1MgwLllg
	+uXUp74D0PbBIrrAt6GTEkD6V101uwhmhYvsyXHbsSQKa9Zu3XG/I8QSjbHAST01ixHZvNDX5eM
	4jlPrOgTUHOopxxOQnBWJ++tOwDzp7SnNzN3s9UaOC4rIKnCLE7VEPEB3KuKuyH8sPEQbMFor4y
	KfZ+Q/agdnOW3LO0401vbaQppMXnYoHBKmaQNMKBAE9qc=
X-Received: by 2002:a5d:64e3:0:b0:461:a5d6:704c with SMTP id ffacd0b85a97d-461a5d673fcmr202253f8f.27.1781590077340;
        Mon, 15 Jun 2026 23:07:57 -0700 (PDT)
Received: from [172.20.10.3] ([37.167.117.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f4f6sm45062575f8f.16.2026.06.15.23.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 23:07:57 -0700 (PDT)
Message-ID: <1922bb19-78a1-456a-ade8-417290068e3f@linaro.org>
Date: Tue, 16 Jun 2026 08:07:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] soc: amlogic: meson-clk-measure: remove debugfs tree
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260615091531.21964-1-pengpeng@iscas.ac.cn>
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
In-Reply-To: <20260615091531.21964-1-pengpeng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_230759_302761_157857DA 
X-CRM114-Status: GOOD (  19.18  )
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

On 6/15/26 11:15, Pengpeng Hou wrote:
> meson_msr_probe() creates a debugfs tree with entries that reference
> devm-managed measurement table entries and the driver's private regmap
> state. The driver has no remove callback, so unbinding the device can
> leave those debugfs entries behind after the private data is released.
> 
> Store the debugfs root and remove the subtree from a new remove callback.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>   drivers/soc/amlogic/meson-clk-measure.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
> index d862e30a244e..7ca43bcb622a 100644
> --- a/drivers/soc/amlogic/meson-clk-measure.c
> +++ b/drivers/soc/amlogic/meson-clk-measure.c
> @@ -7,6 +7,7 @@
>   #include <linux/of_address.h>
>   #include <linux/platform_device.h>
>   #include <linux/bitfield.h>
> +#include <linux/err.h>
>   #include <linux/seq_file.h>
>   #include <linux/debugfs.h>
>   #include <linux/regmap.h>
> @@ -50,6 +51,7 @@ struct meson_msr_data {
>   struct meson_msr {
>   	struct regmap *regmap;
>   	struct meson_msr_data data;
> +	struct dentry *debugfs_root;
>   };
>   
>   #define CLK_MSR_ID(__id, __name) \
> @@ -952,6 +954,7 @@ static int meson_msr_probe(struct platform_device *pdev)
>   	       sizeof(struct msr_reg_offset));
>   
>   	root = debugfs_create_dir("meson-clk-msr", NULL);
> +	priv->debugfs_root = root;
>   	clks = debugfs_create_dir("clks", root);
>   
>   	debugfs_create_file("measure_summary", 0444, root,
> @@ -967,9 +970,19 @@ static int meson_msr_probe(struct platform_device *pdev)
>   				    &priv->data.msr_table[i], &clk_msr_fops);
>   	}
>   
> +	platform_set_drvdata(pdev, priv);
> +
>   	return 0;
>   }
>   
> +static void meson_msr_remove(struct platform_device *pdev)
> +{
> +	struct meson_msr *priv = platform_get_drvdata(pdev);
> +
> +	if (!IS_ERR_OR_NULL(priv->debugfs_root))
> +		debugfs_remove_recursive(priv->debugfs_root);
> +}
> +
>   static const struct msr_reg_offset msr_reg_offset = {
>   	.duty_val = 0x0,
>   	.freq_ctrl = 0x4,
> @@ -1065,6 +1078,7 @@ MODULE_DEVICE_TABLE(of, meson_msr_match_table);
>   
>   static struct platform_driver meson_msr_driver = {
>   	.probe	= meson_msr_probe,
> +	.remove = meson_msr_remove,
>   	.driver = {
>   		.name		= "meson_msr",
>   		.of_match_table	= meson_msr_match_table,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
