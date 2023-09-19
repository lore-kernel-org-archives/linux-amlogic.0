Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B47CD5BA3
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Sep 2023 12:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jim3wxdxXg2vLIxYOl5DD3fDNnk34SJ/7Ixk2mh2LrM=; b=f7vQA14lpARj8mwIPkVoUZzRHP
	wxDgamZe27IUJ9SM0X5SteYd4nyvUSOnJk6jm4P0/6b/9+bs6bRvCiq5u05QGVfMvQB29pxOhl88L
	moGiqp/9WziSbWbECBUG4sR4QGCsVJaF4Bfq+MwwdORnlWh50x1L3I6KbLKIiSxBKlLm3vAWBlkOb
	pUYvlBl6/IMHajzPDbnXQyIvIjZ+3gT+RKT2RQ4fOb+OTvVl1NoZCvQNkLpC33Ij9O+BoeK2lxhhd
	tcWEzvU97HvdgCI0c9fyl24Muz7sk2dVWrl7bLyG928SAfgpbfb2fTluWeBulZ3hBqvq5nzMlV+A4
	MWqW4/+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiZXs-000Myv-39;
	Tue, 19 Sep 2023 12:09:37 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiZXq-000MxP-29
	for linux-amlogic@lists.infradead.org;
	Tue, 19 Sep 2023 12:09:36 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso746236066b.2
        for <linux-amlogic@lists.infradead.org>; Tue, 19 Sep 2023 05:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695125372; x=1695730172; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vyymcUaSguDm3ESbxgv78EI5Vwk9UXn/QWZRGg06uqQ=;
        b=dPN+GhQZyym+PQwG3x9Y5aHbWWdPg0tSSbvCqpFAfwAVnPxI4w3lUPiqyXs3dqd3lk
         CrqkA/7SgOAaMWPoLV+tlJFm9kAfSkSa9TXNWo5ctg4ksHoHVXLk6ireLuHw7ZqOmD7h
         zGdI9nbT7YtTRrcpHlcNfzmrOxYlMTl3CSav7K0iyYsnfEmFv3th1zdDTS1JUZ73hiOM
         gikzW5PrFUKc4MRMsiwRYo5x6d68NtSqLRBsCV/MnaJ46Lq/QYCrYcYwZBjBb1aVnbqV
         iBXXsFmACAd8H28U4u8vaLs0QdrKfRwUD3etjB54PttNn6cE/GEz+2dA2ZxFenyyoYYE
         69Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695125372; x=1695730172;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vyymcUaSguDm3ESbxgv78EI5Vwk9UXn/QWZRGg06uqQ=;
        b=gDQ7RaDVvSTo++kaw45H9llZgtbehlJTeTiAcp8+X1BeQOmLqMjeu+rsPMMmsp8h7s
         gcSr/acF2cGwd5RiC9WIHytWneWL/bhWQtFhDTj8gIX3QCutpOMiFn2dXaySzMqZgVsx
         BZiD5xKg7GytAox7YSt6QK14bXxUemWG2rVSGKIOTIEAKMAMLwUZ+Cy8cBtRFD1RPXIj
         +eB6x3uadfhRkHizg4ruiAbcNKFYzKaVLtYXb6h5Q1sZWGnyX0/m7CTr0N11IH46fVJp
         q0j7iJozvl2Iif18PU5EawoLxqSY/9ywkAWU8Fo8brQv/h8GMwllx1Y/4ruXGdJllyIk
         yToQ==
X-Gm-Message-State: AOJu0YzcQZj1zPfN+Hx/fauekk28S409zfppZU3wshxAP12es6VXLdrX
	CcUraNgW7DjXrXFgTD4fVGk2sQ==
X-Google-Smtp-Source: AGHT+IF1gVma4UEtG0eqhW6UfpvwzjVxvPHSyF5dz/5Ez7OB90lYPomp4o1MKpXc5DjucepgYnDnHg==
X-Received: by 2002:a17:906:73cb:b0:9a5:c4ae:9fec with SMTP id n11-20020a17090673cb00b009a5c4ae9fecmr11336580ejl.52.1695125372060;
        Tue, 19 Sep 2023 05:09:32 -0700 (PDT)
Received: from [172.20.72.244] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id x26-20020a1709064a9a00b009a13fdc139fsm7635969eju.183.2023.09.19.05.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 05:09:31 -0700 (PDT)
Message-ID: <6c4fac8b-cf83-4cfe-9b81-607163c88757@linaro.org>
Date: Tue, 19 Sep 2023 14:09:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/meson: fix memory leak on ->hpd_notify callback
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg
 <sam@ravnborg.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
References: <20230914131015.2472029-1-jani.nikula@intel.com>
 <a4b4432b-fdde-4922-8d95-3697807eefdb@linaro.org> <87msxitrm5.fsf@intel.com>
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
Organization: Linaro Developer Services
In-Reply-To: <87msxitrm5.fsf@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_050934_719971_20F988A2 
X-CRM114-Status: GOOD (  11.59  )
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

On 19/09/2023 11:54, Jani Nikula wrote:
> On Fri, 15 Sep 2023, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>> On 14/09/2023 15:10, Jani Nikula wrote:
>>> The EDID returned by drm_bridge_get_edid() needs to be freed.
>>>
>>> Fixes: 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
>>> Cc: Neil Armstrong <narmstrong@baylibre.com>
>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>>> Cc: Kevin Hilman <khilman@baylibre.com>
>>> Cc: Jerome Brunet <jbrunet@baylibre.com>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: linux-amlogic@lists.infradead.org
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: <stable@vger.kernel.org> # v5.17+
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>>
>>> ---
>>>
>>> UNTESTED
>>> ---
>>>    drivers/gpu/drm/meson/meson_encoder_hdmi.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
>>> index 9913971fa5d2..25ea76558690 100644
>>> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
>>> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
>>> @@ -334,6 +334,8 @@ static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
>>>    			return;
>>>    
>>>    		cec_notifier_set_phys_addr_from_edid(encoder_hdmi->cec_notifier, edid);
>>> +
>>> +		kfree(edid);
>>>    	} else
>>>    		cec_notifier_phys_addr_invalidate(encoder_hdmi->cec_notifier);
>>>    }
>>
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Thanks. I don't seem to have a toolchain to get this to build... would
> you mind applying this, please?

Sure I'll handle this.

Thanks,
Neil

> 
> BR,
> Jani.
> 
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
