Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5252BCA1010
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Sep 2025 14:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2PBjAUqLOCBP8fP8BG7O8FSoUF0czFsqGOgt53H+NA=; b=X8l/4nC3homh2lvpZ40ubCx6h3
	NUbUPz9A2ex2T727a//NDAjWH2ey5aqR35gzpKo3WmTe/LjyFdtlMOoSrFTfYBDuFl8OOycema6AO
	vWjddFPFYUJO6P4ECWr4rpTPRkjnkdo2RgMhdsl9attkaqndM0UhnDjOmbv2VbgeXtkW/C8HE4MbY
	pUEUptJSVKmawj7cvIPeKpmVg83HBQ9sVwePkUI+n2fHnxpB56tEoCLlnspXXiGZPFzvLuMAVoTTO
	0SzRoeMYzlVWsAm5rz33j4NDTqwWGVSSEz+B5d48ceWSWvSaxk5ucjQ3WavngtI5OP4oSjit88jzz
	SgJk870g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXX8-00000002N0g-2Ivg;
	Fri, 05 Sep 2025 14:35:22 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuTYv-0000000116q-1GWH
	for linux-amlogic@lists.infradead.org;
	Fri, 05 Sep 2025 10:20:58 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45b8b2712d8so18019125e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 05 Sep 2025 03:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757067656; x=1757672456; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5vez/qigeUN3N+Im1RmVn0JRRYgZnIjim3ZE3xXKic=;
        b=L7SUZuBmdg3y1NOxehyVMJOj4MqHY0oQlBglsgsVeRwCp6HmaE1RS4anEd3EznQ9EA
         4/L9JTYjKbjPcEd228ee48LLkeH6at0NkI+IsU8C1rW81z33p2brfNnFh4MDx9D/mvy6
         cymYvYVFPt1zEiJ6ftkK+7ot6QnePhNJFoQOXoDzXuLxTzspkkfmhrq97cdIeqZzsU7Q
         PQ62XK0cl5Td5ZrA79L5LOPoRm4FY82H+fndjDchGtH0kbab6ZkwEgGeRM82Cx3aW7gs
         xdxrd9nrUAivGcrF9kOcg6QCpf/mnzVCVrkVBPs526llK9GI2nt4oyjOFjcmz3tNDUWa
         yixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757067656; x=1757672456;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g5vez/qigeUN3N+Im1RmVn0JRRYgZnIjim3ZE3xXKic=;
        b=RYzYq8YkaBeLevbaOzuqnM9fgf4y1AfcxbFJi2V3xDipb6c7m0d88FsLKgoO9Avmk3
         O8yHmWrET7kLWZeJaarm3fFBG5zgy24bHEaLtGxpZ1LXbkAWHImpP3pEMYRshVwHtWfC
         1NpH54rRvrIlx+WhNWWk5dVR6i4gQD9RgjK+v+3gB56YYZ7gxGMIddRoUZjHATv4mUXv
         l8lLaDePn2RpEnOCfnmB1emjadjkDV5pcHXlY0lYUqvCkU/FFDOcUSOWHXgRyJymwgxj
         sc8wFqzGd1E8xsLPIqdaUj6G8o52gQGCxHdeEtBzEgHzIi6rvZFgyDVvFnfJr6gi3oaW
         PJNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUVlXgTmEApgelyQ/zIk4A5yjK4pa6BdYugnFmuFnHaaTPe2rwjjxcpsjCxt6YZObImGWiaEOVpJlvI7bG@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa7b85l0PaDzNQYwrl7M1JzTxNFpgYjXBC3HMfbhVgnUKfSjAf
	wSd5wCaghjLiUKBIwX23FMUkVCcVotHOhC4imRPMd8EL0WFjmvYQwf+jKFNV0OPtHUA=
X-Gm-Gg: ASbGncsOkzBlxwXfl5LxfWgtDYb+/1kwIHqT0ZqW2KiBH1uQzF6M8vOitGboXf12kiW
	pZHiGtnJ5Mw6loo5+Fn/oQWJBgiEpIzpv+ZyVO8tNt87SwgcSDIBSiS+4ZIUKszD5MnXxQ6skuA
	pmBsJPNPmNwYlOb6U4LF0VuQD+g9cLePnGFV0gz9af63gBlMdWZ19xPrcIMqcrYG/hNgOehfCAp
	QQ3UOc4fNplCWL+/h3xy8YiupmWPVvYTxIZhS58soUTUK7wA7L9XMOM+1mzxuu9CEgnpymGKTRj
	L8ioXn6bCJ7c9zOGKVF92FAsz4a2ZYYangHXuOJa9KhBQDAfKPKu5di1QYels3qtB7bQJuEi2gk
	CBPuQrQhK20G2XzXJcWYYVaCsPSVvRmUM41gouw+YVw3qsQMhLM31cca3JEjMDuRpbOA2T7962G
	1ziDospQa8KLsqyeTSX4X7
X-Google-Smtp-Source: AGHT+IGQiU+kRp+7oSBH2pZIbGwL4AQMXeMBFNpTuAKX09/3FoPn8L5rNkO2mZKlz4GakzCW+U30BA==
X-Received: by 2002:a05:600c:1c88:b0:45c:b52d:8d30 with SMTP id 5b1f17b1804b1-45cb52d8f28mr86216625e9.26.1757067655677;
        Fri, 05 Sep 2025 03:20:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ad6e:d9be:21dd:7b96? ([2a01:e0a:3d9:2080:ad6e:d9be:21dd:7b96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45cb61377a7sm115282475e9.13.2025.09.05.03.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 03:20:55 -0700 (PDT)
Message-ID: <32d93739-0ea9-4b75-ae73-c0c8b10f2c3b@linaro.org>
Date: Fri, 5 Sep 2025 12:20:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 00/11] Add cache information to Amlogic SoC
To: Anand Moon <linux.amoon@gmail.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250825065240.22577-1-linux.amoon@gmail.com>
 <175699250964.3374853.16885676491827667777.b4-ty@linaro.org>
 <CANAwSgQGCTs46DVm3gt4PpdSTBTvVg5zga_oBt=rUJh2yhRLtw@mail.gmail.com>
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
In-Reply-To: <CANAwSgQGCTs46DVm3gt4PpdSTBTvVg5zga_oBt=rUJh2yhRLtw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_032057_362327_9A1313B0 
X-CRM114-Status: GOOD (  16.14  )
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

On 05/09/2025 06:01, Anand Moon wrote:
> Hi Neil,
> 
> On Thu, 4 Sept 2025 at 18:58, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> Hi,
>>
>> On Mon, 25 Aug 2025 12:21:40 +0530, Anand Moon wrote:
>>> Most publicly available Amlogic datasheets mention that the CPU employs
>>> a architecture, quad-core ARM Cortex-A53 and ARM Cortex A55 and
>>> Cortex-A73 and Cortex-A53 cluster, sharing a unified L2 cache to enhance
>>> overall system performance.
>>>
>>> However, these documents typically omit details regarding the sizes of the
>>> L1 data cache, L1 instruction cache, and L2 cache.
>>>
>>> [...]
>>
>> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.18/arm64-dt)
>>
>> [01/11] arm64: dts: amlogic: Add cache information to the Amlogic GXBB and GXL SoC
>>          https://git.kernel.org/amlogic/c/d7fc05da8ba28d22fb9bd79d9308f928fcb81c19
>> [02/11] arm64: dts: amlogic: Add cache information to the Amlogic SM1 SoC
>>          https://git.kernel.org/amlogic/c/fd7b48b1f91e1830e22e73744e7525af24d8ae25
>> [03/11] arm64: dts: amlogic: Add cache information to the Amlogic G12A SoCS
>>          https://git.kernel.org/amlogic/c/a4428e52babdb682f47f99b0b816e227e51a3835
>> [04/11] arm64: dts: amlogic: Add cache information to the Amlogic AXG SoCS
>>          https://git.kernel.org/amlogic/c/3b6ad2a433672f4ed9e1c90e4ae6b94683d1f1a2
>> [05/11] arm64: dts: amlogic: Add cache information to the Amlogic GXM SoCS
>>          https://git.kernel.org/amlogic/c/fe2c12bc0a8f9e5db87bfbf231658eadef4cdd47
>> [06/11] arm64: dts: amlogic: Add cache information to the Amlogic A1 SoC
>>          https://git.kernel.org/amlogic/c/2d97773212f8516b2fe3177077b1ecf7b67a4e09
>> [07/11] arm64: dts: amlogic: Add cache information to the Amlogic A4 SoC
>>          https://git.kernel.org/amlogic/c/57273dc063d5a80e8cebc20878369099992be01a
>> [08/11] arm64: dts: amlogic: Add cache information to the Amlogic C3 SoC
>>          https://git.kernel.org/amlogic/c/6d4ab38a0a21c82076105e4cc37087ef92253c7b
>> [09/11] arm64: dts: amlogic: Add cache information to the Amlogic S7 SoC
>>          https://git.kernel.org/amlogic/c/494c362fa1633bba127045ace8f0eea0b277af28
>> [10/11] arm64: dts: amlogic: Add cache information to the Amlogic S922X SoC
>>          https://git.kernel.org/amlogic/c/e7f85e6c155aed3e10e698dd05bd04b2d52edb59
>> [11/11] arm64: dts: amlogic: Add cache information to the Amlogic T7 SoC
>>          https://git.kernel.org/amlogic/c/e97fdb9b8a0f8bd349de48815694f8a7200e3d62
>>
>> These changes has been applied on the intermediate git tree [1].
>>
>> The v6.18/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
>> for inclusion in their intermediate git branches in order to be sent to Linus during
>> the next merge window, or sooner if it's a set of fixes.
>>
>> In the cases of fixes, those will be merged in the current release candidate
>> kernel and as soon they appear on the Linux master branch they will be
>> backported to the previous Stable and Long-Stable kernels [2].
>>
>> The intermediate git branches are merged daily in the linux-next tree [3],
>> people are encouraged testing these pre-release kernels and report issues on the
>> relevant mailing-lists.
>>
>> If problems are discovered on those changes, please submit a signed-off-by revert
>> patch followed by a corrective changeset.
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
>> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>
> Received feedback from Krzysztof to omit the comments in the commit message.
> Should I respin accordingly?

Sure, I'll re-apply the new version

Neil

>> --
>> Neil
>>
> Thanks
> -Anand


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
