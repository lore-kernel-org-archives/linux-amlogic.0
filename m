Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013EDFE51F3
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Apr 2026 09:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gkX+xVM2PG7hnoFS2VtNa21FHn/EP28txICGyy1XgtU=; b=3oi1L3fAicDwM1dRrUTT/e/gxa
	zgLTIbJQxlyvYrjLgqMUXRj6+P7CfeSgQ5/adJeiJd2iP8gbpdVQSOO5BXoSclVb5aSBT2Awk4EbQ
	H4QGGY1tDVjMJo0BGSalVmmMgF0vcr6afrKrSR03sHISy9i7Q/HpXreosePW/eLvCFy/DLnwHObVr
	PD8glQ7g2eYtR2dS9dw9yiVf6s3gSgMaBkCKBrZMcKijTvLjSCeZIvgbi1JT4IJbcp9HxQnV+xSD/
	x50aHbLIRz6Xj0i/e65J0E67CbdvPe/Cv1eh8t2RZd/EFAIKUXDIngsC8LlhAVimblKleAWYbj1MA
	tixQPBYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGD8H-0000000CxFh-3Ryt;
	Fri, 24 Apr 2026 09:47:33 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGD8F-0000000CxF1-188l
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Apr 2026 09:47:32 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-43cfbd17589so6084939f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Apr 2026 02:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777024049; x=1777628849; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cXOyeqVZTuYmkbP/VNEswETXiZyV/j1DeIymNd6Gck=;
        b=JSSQfFL8DrvmdY09FBLydBTN6+VZ+kvvaamqwiIEv6X/o5BpPh5ZMpOIBLG1z5OBgB
         MlO97bLV4jp6XI0m/8bXqOgP1nnYy0YNYGgBBP7bQ6baZhVmAxqnHonBfB6IJfKd8CUJ
         NdnMv2cv4U8gppc9JT1OvqNrcemoWj3A84P5HvZ9vBuG8z6Wfnafho+2N9U6qz/z3nuj
         yoW2A4cXTTclVJkUNei7X5jImj44igaHbCQVZIAVOGzp2z3D+Cxy8gUwtnoeH/QuiGxB
         DnQ7+OsNHm5JmCbtyNu8M7LxqQkfRLPctzZbbfXxVrQCXIqlwP0wM8qeuiu0C4KPyw3C
         0j3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024049; x=1777628849;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1cXOyeqVZTuYmkbP/VNEswETXiZyV/j1DeIymNd6Gck=;
        b=j+DohZn64NrKZ6F/2rFGEGFBndkp8N8XVTExGWtBT8FRKHIz4+/9j6V6fPmJESBDis
         SR6JeoDEBUNSqGsvhq+4L4pF/9WEAEwFn+4bT8naFkzID6Ccae4pX6snfIo8qOqFq6bi
         23zzm3T4NcGEB1Mf2+DBzq2rCallIOyrYWjBua3sXwLHRbNTUZI+1nXVIl4nMwYrSDhP
         dURH3ope5HKd0TO7VcaDHzVtzt8CU43xYHdvXyHM10+peReTtJ3SrFgNUmsnzDd6nx5B
         V08WFU4tTkFQs/sbvZVtGvyyUT2ud5tEn/VLn8jZbftS5YHacF11VL88tOGPsiu0AMqz
         +6xQ==
X-Forwarded-Encrypted: i=1; AFNElJ9nuoa9+atMDwB4RVlneU1RqsE3T3izo43J2z15m1YYsOPf/n383D848sJ4kjFT7Y6ge+wEfzixC5zeNvS0@lists.infradead.org
X-Gm-Message-State: AOJu0Yy48FQHouHqw4nWqjL13X8KVRkJiWLNkXeSCXmkqiInD4ZNoLEQ
	e/O4uf8G02LqXQrypjk3PvLrEJ0oPgW+RD7vknz/GszqJUvR+X2AhffFx1l66ZqhMBM=
X-Gm-Gg: AeBDievxikQe0/m8DLZ+kKxCNYztbH6WANY9Rpuu7rhpdg7tKz+GpMpUupJ4TB4mUne
	Tp512a5BDRWO/2MkjMx2xLu2VtdQ3DTRLEsHAbGbD53IbE/jSYNJH0zY/NZOPTycmqd9CVJ6xAD
	7A4Xb+f33tZu4mLeL15VRWD5712nZSZCzmYBH/DK4jFkSwNJZZHC6lfO1ldDYe2mW278CBkh9j2
	O3+0U+IjK3irdRTU62/vFMRBYAqXSuDn1LwsdhPYUwg7ONqs8w26P0VKD+swTa4c216Pukg0WVO
	ul0xV+pabPJj0bp9YAY7LLchw4KuG7NgrZtkzP8yeXkPvl6rFw9qSKkE05sS/NHnYUK/dUsKwRm
	jP/T2ZgT+TcqQrDcu1oYYVtNgi5RZ9bPPCel7JtdC5JEIaznyn7Qd1H7ITxhLTtLSSl+5iZ1Vmt
	kQx1+DWEX7CFp9kfBWsOvevjWI1ef6plxvzVkmdSg05hF48UrgBPfHd9YUQQr2uFdDpz9AjXXXG
	KbeJ49ihEU1m59iMXlCC4K2Shpi
X-Received: by 2002:a05:6000:288c:b0:43e:a69b:d804 with SMTP id ffacd0b85a97d-43fe3df26b1mr48732901f8f.29.1777024048585;
        Fri, 24 Apr 2026 02:47:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1176sm60412901f8f.3.2026.04.24.02.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:47:28 -0700 (PDT)
Message-ID: <86adec56-2234-44c0-b165-71fa91b17e96@linaro.org>
Date: Fri, 24 Apr 2026 11:47:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/8] firmware: meson: sm: Thermal calibration read via
 secure monitor
To: linux-kernel-dev@aliel.fr, Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260423-add-thermal-t7-vim4-v4-0-d4c1528d5044@aliel.fr>
 <20260423-add-thermal-t7-vim4-v4-2-d4c1528d5044@aliel.fr>
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
In-Reply-To: <20260423-add-thermal-t7-vim4-v4-2-d4c1528d5044@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_024731_340275_4353876F 
X-CRM114-Status: GOOD (  11.47  )
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

On 4/23/26 18:07, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Add SM_THERMAL_CALIB_READ to the secure monitor command enum and
> introduce meson_sm_get_thermal_calib() to allow drivers to retrieve
> thermal sensor calibration data through the firmware interface.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   include/linux/firmware/meson/meson_sm.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
> index 8eaf8922ab020..3ebc2bd9a9760 100644
> --- a/include/linux/firmware/meson/meson_sm.h
> +++ b/include/linux/firmware/meson/meson_sm.h
> @@ -12,6 +12,7 @@ enum {
>   	SM_EFUSE_WRITE,
>   	SM_EFUSE_USER_MAX,
>   	SM_GET_CHIP_ID,
> +	SM_THERMAL_CALIB_READ,
>   	SM_A1_PWRC_SET,
>   	SM_A1_PWRC_GET,
>   };
> @@ -27,5 +28,7 @@ int meson_sm_call_read(struct meson_sm_firmware *fw, void *buffer,
>   		       unsigned int bsize, unsigned int cmd_index, u32 arg0,
>   		       u32 arg1, u32 arg2, u32 arg3, u32 arg4);
>   struct meson_sm_firmware *meson_sm_get(struct device_node *firmware_node);
> +int meson_sm_get_thermal_calib(struct meson_sm_firmware *fw, u32 *trim_info,
> +			       u32 tsensor_id);
>   
>   #endif /* _MESON_SM_FW_H_ */
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
