Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BFDC46CD2
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Dec 2023 09:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mJ/CzGZUC6p53ENPxZ660L9MBrK/xg1AGbWmaSTIy1E=; b=ZM3tjvTff+uxfY
	hHSkOqOCTZVPzmBFmTaq7ffJ2jdWB9bbZQSRLAEixvFQCjtzG0ma4y39X4Ap3l216/ZWoAcgZXzNV
	1ZTOqoDs8JuBtmqJOcMdH1leyFH9rGBsxMsj9o5AyHI4ez8QS6LbRRuSvz17VCxcyj9at6Uv3QBq7
	mI224wj4dA/Df/ExM6CvF+5TvNi96uiwONh6sjJFdxEsD/ZGBfbNSGXObpCYK8PWeXhcaTWg08XpB
	y6VeyZCStkuHgAUoqBBCcBX6mJNm4XuxRJr3OCqy3o5Ffzp7ND/cIDj+jxX6ONK8cS4Xm4nke+t4e
	Ua8I+5UQb9sSXvOmAeFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFWSM-00DSiR-28;
	Tue, 19 Dec 2023 09:32:08 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFWSJ-00DShX-0l
	for linux-amlogic@lists.infradead.org;
	Tue, 19 Dec 2023 09:32:04 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3365d38dce2so3195541f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 19 Dec 2023 01:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702978320; x=1703583120; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:from:content-language:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8d+QOU8zUm8QbxpYvbJ8bwCgdEIlJN4SLs1T/X2vfb8=;
        b=BSDJyEx0mdQ+r/cfcOf8H6t+I4txq8G7PNxBsflZ6XupMI0Es81CQeSAgsT12rZSa5
         vR+oj10LH1Km7Au4B0vKvTxyiDHiD4+XLZpPsvx6mc2LbP6Hh+H6rVvdnQFvFlG1e9xm
         zocZOv5gBluFnBa4Aje/OL7RNp4Yl2cIxRfyUNL5CzDGQs9pK5YP1Eox/hww4NiC9zow
         qTDGoHv2VzDcOcj+DC8Od7xoYgw1qcim4rUWz+QwO33WAO43tawSS6JwtubMzzXd8/H1
         q9+q5Yej7l2xIJ/VImByFUcz56/+BqFyeM9j3m9oeVXo3eTCepxxLa2GVj4SCerWMkhB
         PQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702978320; x=1703583120;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:from:content-language:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8d+QOU8zUm8QbxpYvbJ8bwCgdEIlJN4SLs1T/X2vfb8=;
        b=lLf+0HClqMMnQZZMQLQsZRDiBEmEUlcVcS3hekZjYI7QtpuFdiYh3PiHdn504xxKoR
         8SM2v97oIhVzjRSUjbMJhpdX1uOimiA2+9TxHD0Qsfh6PM07WIcKlT5J3c4Z+AzyCmcz
         Rz2+oCqKlhA8bw7RAQmawszbfFrXP0I60V9hgPzipsNdSLDiu4VBtMVMUBv8ffvn6sjq
         8J0E2og1AcpYHykk2ycq67W+hESahLEESlIge7cm+2+ykUsgLXaV3UwlwWIjbmif92/n
         JR00CLQIcmfUrPcIHvw9chtUoDgMNC0Q0Ta65K6PJwqYfjEuRqPcxXIkNkXowTyEafLc
         GOUA==
X-Gm-Message-State: AOJu0Yy1y2EJO+f6XPnNc1lmVuwA1qlJYJRFYGNt4ac9dPCl+vLY+x2J
	bVP5pAt/bYFB4YVAkaX3UolEvg==
X-Google-Smtp-Source: AGHT+IEKcawHVs1XcASn4G7P5IkWKcPU6h8xJVicsfUFRxN21iKQMmP7Vd1QKc9Kng8c8H7O4tv9aw==
X-Received: by 2002:a05:600c:b8c:b0:40c:6e0b:69d0 with SMTP id fl12-20020a05600c0b8c00b0040c6e0b69d0mr2567912wmb.12.1702978320152;
        Tue, 19 Dec 2023 01:32:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:e99:1baf:483a:7533? ([2a01:e0a:982:cbb0:e99:1baf:483a:7533])
        by smtp.gmail.com with ESMTPSA id e2-20020a05600c4e4200b00407b93d8085sm2034921wmq.27.2023.12.19.01.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 01:31:59 -0800 (PST)
Message-ID: <e0d29b32-2302-4a2f-ba78-e76dd7b5e570@linaro.org>
Date: Tue, 19 Dec 2023 10:31:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v4 0/3] reset: amlogic-c3: add reset driver
Content-Language: en-US, fr
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 zelong dong <zelong.dong@amlogic.com>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 yonghui.yu@amlogic.com, kelvin.zhang@amlogic.com
References: <20230914064018.18790-1-zelong.dong@amlogic.com>
 <170126076055.2880660.13057388884278592366.b4-ty@linaro.org>
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
In-Reply-To: <170126076055.2880660.13057388884278592366.b4-ty@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_013203_277694_EDF73B13 
X-CRM114-Status: GOOD (  17.81  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 29/11/2023 13:26, Neil Armstrong wrote:
> Hi,
> 
> On Thu, 14 Sep 2023 14:40:15 +0800, zelong dong wrote:
>> From: Zelong Dong <zelong.dong@amlogic.com>
>>
>> This patchset adds Reset controller driver support for Amlogic C3 SoC.
>> The RESET registers count and offset for C3 Soc are same as S4 Soc.
>>
>> Changes since v1:
>> - remove Change-ID
>> - run scripts/checkpatch.pl and fix reported warnings
>> - sort dts node by base reg offset
>>
>> [...]
> 
> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.8/arm64-dt)
> 
> [3/3] arm64: dts: amlogic: add reset controller for Amlogic C3 SoC
>        https://git.kernel.org/amlogic/c/a5468f5ea9a01acf29d02745abae7b82482989d4

I'll need to drop this patch from v6.8/arm64-dt since the amlogic,c3-reset.h is missing from
my tree, I'll postpone it to v6.9.

Thanks,
Neil

> 
> These changes has been applied on the intermediate git tree [1].
> 
> The v6.8/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
> for inclusion in their intermediate git branches in order to be sent to Linus during
> the next merge window, or sooner if it's a set of fixes.
> 
> In the cases of fixes, those will be merged in the current release candidate
> kernel and as soon they appear on the Linux master branch they will be
> backported to the previous Stable and Long-Stable kernels [2].
> 
> The intermediate git branches are merged daily in the linux-next tree [3],
> people are encouraged testing these pre-release kernels and report issues on the
> relevant mailing-lists.
> 
> If problems are discovered on those changes, please submit a signed-off-by revert
> patch followed by a corrective changeset.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
