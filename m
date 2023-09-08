Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905DDEE7FE7
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Sep 2023 12:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HG1uBqMoZg7NH01yTaiA5Cb108/XLCwyhWNP0rGzTvg=; b=qf+UoC1u2w92GpfoC0CtZ3Q2N3
	xeRkmIqqCxm/Lc4qNvh9h1E6Fz9YhGXo1b6dFfYOiv+eI9Z7rb6mGbeMU9cLmo7zXvzT/EI0oB3r1
	KS5QyHGbaPHFaHidMdZfSpx9drlSJrRGymgJS1UKBwMkRYgOSOKfwJZAVCssPIaoVHTgfjtNJOH27
	fDwZ3WKj6Xwl6EjxlOspX45WzcKxWbljWGpmqJcHOWQFKW56njCbLtdHRr5+tqYqxyzTYUjAa1uKe
	PJl1amom01b7zlRVeiXgz6x2GLmVLF0XIP5TjXA97Mi892yARn49pjoZESJLBD3WKFiL3seiBzm36
	40bLuC9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeadG-00DlZL-0c;
	Fri, 08 Sep 2023 12:30:42 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeadC-00DlYG-1e
	for linux-amlogic@lists.infradead.org;
	Fri, 08 Sep 2023 12:30:39 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-31f7400cb74so1286924f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 08 Sep 2023 05:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694176235; x=1694781035; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PM2w2IzcLgzoOPeUzfKRLbjxESAa2w9XyRzVdDC8nNA=;
        b=qJOrLyVqs4mke804/11o/sA2E18pU3mMbAEcvXhIlPCpyhEnfr4Tm/9viMAgGf7XhU
         mSUXFeFPjU4RE27cV3gkKZdENix3A1LkxkoHiASFWIBU3muhU3Fypj76zYrweWREsjur
         CCp8svdfaFCKWerYK8WXGjmOdF4zV8AQLW9DNI5ReFupzInKpFjORwXuu3fB3W8GTwbL
         vQMpaeFY42uKDo8v2Ver0MBO5PfOg/AUggH7WFixpPxQsKJ0JZRE2ek2wl3UavQJGFKP
         DhJGH3lyZpq3SRWsZSg/NyeKfGPl+gnYxX8ugepx+JXCNCfdxV9x1edUbfLn+5uT+gdq
         Srqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694176235; x=1694781035;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PM2w2IzcLgzoOPeUzfKRLbjxESAa2w9XyRzVdDC8nNA=;
        b=lAijnnI0AS7dmBBnMxS8e11l3+RHkgPQJFbWq2oKlgP8KEc8+huNAFg4GmAyeRzmGy
         cSXuoRD1JvBVryl+BET8LLv/D+DKxtikBLBrmdbexDu8Ty9b/zXIAtyV0vSil8eOTTOA
         C916oEGW8g8ix5xKGH2q3elvpw2qw6AMZSf9qmDO22yRIgzeb0GodAyPOoB5msJb8WJf
         yM5dSDeQ8xpd3Xrs1wGIXIDzeDZSpReAL2rVHNl6iZhDQM2KMh56kiqxtjIPWhWCoIF3
         O8KHQN24ZbYblY8LaCm3E9PRhQjt/52gqa/PmFdDWDv+iE0cYxUL0xefEMsQkpfaOEFs
         0qOQ==
X-Gm-Message-State: AOJu0Yz2fxxASMzkOsOcFuPNiKQqiYgDmK0a991D00nloUCbI2hZfmgk
	bifHf+DQfVclGR5z7PJwE5IkNg==
X-Google-Smtp-Source: AGHT+IGfiprw2HlOSI7C7qrMQSp2u5C9t9PCNm2p6AHs9JBK00uKP0Ve+a8f9jOa1yEkdzsQTDLAIQ==
X-Received: by 2002:adf:f8d2:0:b0:31c:81ef:f90a with SMTP id f18-20020adff8d2000000b0031c81eff90amr1715968wrq.47.1694176235144;
        Fri, 08 Sep 2023 05:30:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5f1a:ed04:d131:cda4? ([2a01:e0a:982:cbb0:5f1a:ed04:d131:cda4])
        by smtp.gmail.com with ESMTPSA id z7-20020adfe547000000b0031c71693449sm2031144wrm.1.2023.09.08.05.30.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Sep 2023 05:30:34 -0700 (PDT)
Message-ID: <00436bd2-5f3c-4fd6-9db8-799c541c6a33@linaro.org>
Date: Fri, 8 Sep 2023 14:30:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/3] arm64: dts: amlogic: add more basic audio support
Content-Language: en-US, fr
To: Jerome Brunet <jbrunet@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230815092751.1791195-1-christianshewitt@gmail.com>
 <1jh6p0vdyj.fsf@starbuckisacylon.baylibre.com>
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
In-Reply-To: <1jh6p0vdyj.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_053038_548089_7B7BFE71 
X-CRM114-Status: GOOD (  15.99  )
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

On 15/08/2023 11:37, Jerome Brunet wrote:
> 
> On Tue 15 Aug 2023 at 09:27, Christian Hewitt <christianshewitt@gmail.com> wrote:
> 
>> This mini-series adds basic audio support to the P200/P201 (GXBB) and U200 (G12A)
>> reference boards. Few people likely have the original reference boards which have
>> extra audio capabilities, but the device-trees are widely [ab]used by users with
>> Android set-top boxes whose hardware is copy/pasted from the reference designs to
>> get working installs. Adding basic audio support does no harm to the real boards
>> and helps the secondary cause.
> 
> Still, this is something you have not tested on the u200 reference
> design. I believe this was already discussed in the past.
> 
> The u200 is far more complex when it comes to audio and certainly would
> not work on this no-name android device. These device are heavily
> "inspired" by the reference, but trimmed down in many aspect including
> audio capabilities - NOT copied.

I understand you point, but those changes only adds "internal" audio & basic spdif
capabilities so it won't affect the on-board audio electronics in any way.

> 
> People abusing the u200 or p200 DT does make the patchset valid

This is a reality, but still I think this patchset is valid and I'll
pick those since they are used for years out-of-tree and probably works
very fine in the reference design boards.

Neil

> 
>>
>> Christian Hewitt (3):
>>    arm64: dts: meson: add audio playback to p200
>>    arm64: dts: meson: add audio playback to p201
>>    arm64: dts: meson: add audio playback to u200
>>
>>   .../boot/dts/amlogic/meson-g12a-u200.dts      | 129 ++++++++++++++++++
>>   .../boot/dts/amlogic/meson-gxbb-p200.dts      |  60 ++++++++
>>   .../boot/dts/amlogic/meson-gxbb-p201.dts      |  39 ++++++
>>   3 files changed, 228 insertions(+)
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
