Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFF7C48297
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Feb 2024 13:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IdE80c7LVlmvms6Wlw6on9S5kQeyr7lNFZI5Nsz0IU=; b=18pdmHYVitLYZ1ybqWDZ2SCDfv
	OUnrZNV/ssk7B0lqHHR6mLW0qh5PCD+IB79+vkjBXOGoC5ycOkZIfUwzb/A4eCMaV3wRVZldQ42W8
	bHfp+ms3/OwvCuS9hUnYnyiC6e4ArFkBThQa0xIKZoy1ElFJ222MhQujS2QpuGmuCsWWoLGIQ3+pt
	ShsPBOKZf6kMNqPQhEeUttnkTBj8SxX+8xXmwdRxGfdHba57ntDk0GEu8Bnj2S2L5vw6z+Mr2AfmX
	TyRgzjfawKHEXj4F9XhS3IAv7xcUJnq/bft/SVedjAHVkgujPZpCd0lv+8uBEbNaMJX9pAjxSqXoZ
	Ujvx1HfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXLXG-00000007iya-1MmQ;
	Tue, 06 Feb 2024 13:30:50 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXLXE-00000007ixu-0czE
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Feb 2024 13:30:49 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-60482b91650so3358107b3.3
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Feb 2024 05:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707226247; x=1707831047; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y5MrG6KJ2h0ocHoW3P3efQdtjIXhzJJv+SpOY6lhOJs=;
        b=Vbcokxw91hfhogHslGaQHdpDMaJk0sQqOIsEGHQryBRWGIXfBl7iHtXKvvEUvh0sbn
         LkcVNd5DzASkwu7kd1PwaRTMc4108at3ri0exumgiF4ASW+/i4kadQg0BLcHpxn/VL/A
         2ZBgX7VVzADwRDzcky4X+vwPUFJ72Fs2qMdFu//pu9tawY8jSILvrTDqKeN24iXLzL4k
         GxNY+V9TgteNZV+dHe9Sg6zTy5mNu9Pl1NLlgcNUcn29rolOooMYcpYXBm/mb6KVL1p3
         2vWqBSa3keSRfyO3S7KY76LxtkfQKKrrzrBg7G0kxBYX3jaajdXvoJtR0DLQkbgpdPbl
         DMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707226247; x=1707831047;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y5MrG6KJ2h0ocHoW3P3efQdtjIXhzJJv+SpOY6lhOJs=;
        b=NLWcYyYfALWSA9kIglXWNE9AcK7Z7M5UdB68MsPaGHhGqgUhVMITsn21Hxec0lEKv5
         NY3TQ2yIbbM+i28MfwD2Jfm0jg0ySr5q6toYC5TEApaQ+H4uk3NONG/EnAPg02MOvs6Q
         jBrMjUWcAxXFPHwtl3O6cyIq/Rb5q/3P7A5ccZQckroGFhnklO8QFwnT8wkDTy33nBQY
         sJhaADLNpndxXyPRM4i1qcvE9xFACLWxRY7i+V3cDgC6ojuoAr2t/8Q4OJEbgAg4ELrl
         iT5EKEEtAbb3p/dtSEuq8KLygtMxbG2dRQPDYkmVq1wNWaptaTWhK8PPAI6GuoZzSeIC
         dTjA==
X-Gm-Message-State: AOJu0YyXB1p965AIvq9QuwpBPriywbT4hYUaFLrfK1hFImbdm2budv8M
	a8Al94zQ7grEIoqxCrWoUREka45HiAfE6unfgOlnrmJXizOWERjJ708Y1DCMJgw=
X-Google-Smtp-Source: AGHT+IEzs1Oc6Uv9Ui8CAZofCtSgiVRA802AaFGwuDKpPXVDkrPKOEryIuwrS39UXIrFl9BCfI0v2g==
X-Received: by 2002:a81:8b54:0:b0:5ff:4959:1da8 with SMTP id e20-20020a818b54000000b005ff49591da8mr1311304ywk.50.1707226246826;
        Tue, 06 Feb 2024 05:30:46 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWTHR1f8CC5a9UESoGNNb8JdK1elDwQys5PMfCLVpxh8M4DYu1WoPlvyB6p92GwfxjQ/rvcoBtsDUeavMlhTFSEeDqm9Zx8BCrh7f/zImNFznV+L0+EKPV17yKHXGCVJYNRYoBDnD/JQensrIas7ZFaR2wR8XnQQqu7RnflCO6q0FkeL5WBstb7e8jUNZ0o9Um3d2JUXVtKHizgpO22gdGmqpGW1TQrWwV+bgq/7FN0xDJ8ssCmClDdK25eEvjs/cNHaKAs28y1YQwtxghabLBcuM33W6zne3cLXXc7dLkU8Ko013jUYPEQSKAmQigKp85/rS9JfCDi8QQ+TQ==
Received: from ?IPV6:2a01:e0a:982:cbb0:ba23:8574:fa8:28dd? ([2a01:e0a:982:cbb0:ba23:8574:fa8:28dd])
        by smtp.gmail.com with ESMTPSA id fd2-20020a05690c318200b005ffa141d9f4sm466055ywb.18.2024.02.06.05.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 05:30:46 -0800 (PST)
Message-ID: <59ef3824-13d3-40af-9a3a-9b1ec8add9d3@linaro.org>
Date: Tue, 6 Feb 2024 14:30:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC PATCH v1] arm64: dts: amlogic: Add Freebox fbx8am boards
Content-Language: en-US, fr
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Marc Gonzalez <mgonzalez@freebox.fr>, AML
 <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <8c865c62-cd80-4c78-9fc5-c85491c037ca@freebox.fr>
 <b69a2132-25c0-4acd-808e-d134f5034e58@linaro.org>
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
In-Reply-To: <b69a2132-25c0-4acd-808e-d134f5034e58@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_053048_226345_49DD10B4 
X-CRM114-Status: GOOD (  11.58  )
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

On 06/02/2024 14:22, Krzysztof Kozlowski wrote:
> On 06/02/2024 14:12, Marc Gonzalez wrote:
>> From: Pierre-Hugues Husson <phhusson@freebox.fr>
>>
>> The fbx8am boards are based on the Amlogic Meson G12A S905X2 SoC,
>> and the SEI510 board design.
>>
>> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>> ---
>> Request For Comments to spot obvious mistakes before formal submission
>> NB: on IRC, narmstrong mentioned:
>>> adding dtbos for variants seems to be the new preferred way to handle such case
>>> the fdtoverlay utility works well for this case
> 
> Please run scripts/checkpatch.pl and fix reported warnings. Some
> warnings can be ignored, but the code here looks like it needs a fix.
> Feel free to get in touch if the warning is not clear.

I don't have checkpatch errors, I'm running with `--strict --terse`.

I do have some dtbs_check errors, but those are expected since they are not specific to this patchset.

Neil

> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
