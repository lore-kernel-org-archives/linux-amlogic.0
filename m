Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE9BC7EE2C
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Aug 2023 12:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dvGbzZtp+ElVoYxnF75IoVlByapzxIPaochNHcyOdFs=; b=nSIRru3vhtBM4iIIyXMi26ieQo
	JlKMaNVi+urV1BUFDGumKROxG2/gjP7guJQsFcXn1Fa8GBLqZrVIyc9emuWBlYKSeHBEkZ8f/+zVp
	g/MTayi6HDLteExj8J0oNqTsbv5YjdVn5ofG8SGZBWV3OntYdyTeodUji6U61jKRxJA9MgnpNTLUd
	KSsFAbsCZzS6gGPX51pyaP/BMTGIc/+qAC0fSQ4htbYIDHWiWQjKEJCMPeCQ3vlS9vq9NM7I03nZo
	G3kILSxd+82ymT6askO3DSTe8/tu4nUk8uIrFi0ue9SMqCz6lo4Ex9+JHbYeuamAJbfgWnKZDwkSl
	xHAAt40Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVnH-005Mwn-2c;
	Fri, 25 Aug 2023 12:20:03 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVnD-005Mve-1j
	for linux-amlogic@lists.infradead.org;
	Fri, 25 Aug 2023 12:20:00 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-31c5c06e8bbso685160f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 25 Aug 2023 05:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692965998; x=1693570798;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHMjHCi8nL3iHIgcbWKICMPh5N5wLAaAe8hnVrLWWts=;
        b=stSpww4kF0HfI75b/eWOhExLhhjPevwnLfPVWe0HermHZAv8tXzhNecSqYc8XiE3X8
         y+gRUNDTSriSSKp1j84eabEVaRwcXVfo9X2TH/Fo/oQ1wVGKvSAf0E6Pzv/JOcPlbd6M
         XS1WgHhrc5XbSd61e4DYhdf4mulHv+qsmvZnjvOUlboMm24zPMFMKXQdkir77/TaA4tN
         XLah1OSo9F8POQxkSIhMOUp+j3UwKw/Hmv77+8UGKRr9R/WBPi1mVG6B1/3iTUSdp1KK
         eh97E7gdcVBzuYdRYK7+Le7w/+eCQHjwO5nTBTEtIx8chlzcbLl2vfwHwBVi24rUYr0j
         wHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692965998; x=1693570798;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nHMjHCi8nL3iHIgcbWKICMPh5N5wLAaAe8hnVrLWWts=;
        b=GujOrympoLRI/xAOlEoD0FKuxf9+YhrVBe8Zt+zQXykwDsDereAopgbS3PxxREIECs
         IjuQ1ixdWE+SsYaF7TJ6/9prEbO4DJQZ/HlAeHRXS1YbKCbvd+d29ZuXM8nX+ZAdidwE
         gVBb/E0MRrog0Xa+J3CqGf0POIYvw8nxVZaY7aNWm0WW0Wjt8oqhqid1lyBRCrASeG1A
         CdTxTsQyMAuJ0YbONYz//WW8JyqpxZedC4a2y2oVWAZKhVcS2VYrF5toYyMB7ZzmSB3Y
         6SFOb6Cbe2vTpd2/X+OGnxQOcYRsXn42xuQrqsR2Cl0rzzONjRHdVcj7X/FGwodyVjhJ
         7ZmA==
X-Gm-Message-State: AOJu0Yw6DP5a8VL5a/HLx3OsRxdaNjMylC7kDTHQth3oM3d1mAdtoQAB
	uyOr//XiAJ+LN3fH3M5VoUrW3+8jPDPH86ch/CdjoQ==
X-Google-Smtp-Source: AGHT+IErkRB/kpj/09WspYrWIaceU32Ug6rXwPqFBa48iPDlFLCkFheTF9ANCrHi7SZ2AjSvH8UDuw==
X-Received: by 2002:a5d:5963:0:b0:31a:ccc7:29ee with SMTP id e35-20020a5d5963000000b0031accc729eemr12307289wri.7.1692965997883;
        Fri, 25 Aug 2023 05:19:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4e1:71e1:b02b:811e? ([2a01:e0a:982:cbb0:4e1:71e1:b02b:811e])
        by smtp.gmail.com with ESMTPSA id g13-20020a5d64ed000000b003177f57e79esm2095673wri.88.2023.08.25.05.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 05:19:57 -0700 (PDT)
Message-ID: <fcdb1fb2-784d-4235-aa47-9e489395c028@linaro.org>
Date: Fri, 25 Aug 2023 14:19:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/3] media: rc: meson-ir: support rc driver type
 RC_DRIVER_SCANCODE
Content-Language: en-US, fr
To: zelong dong <zelong.dong@amlogic.com>, Sean Young <sean@mess.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com, kelvin.zhang@amlogic.com
References: <20230825115310.39993-1-zelong.dong@amlogic.com>
 <20230825115310.39993-2-zelong.dong@amlogic.com>
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
In-Reply-To: <20230825115310.39993-2-zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_051959_576830_6DF1B6A1 
X-CRM114-Status: UNSURE (   8.61  )
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

On 25/08/2023 13:53, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Meson IR Controller supports hardware decoder in Meson-S4 and later
> SoC. So far, protocol NEC could be decoded by hardware decoder.
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---
>   drivers/media/rc/meson-ir.c | 522 +++++++++++++++++++++++++++++++-----
>   1 file changed, 451 insertions(+), 71 deletions(-)
> 

<snip>

It looks pretty good now, so far I'm ok with it:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

I think some test reports would be needed to be sure it doesn't regress existing HW.

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
