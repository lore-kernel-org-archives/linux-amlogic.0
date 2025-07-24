Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB116C83F26
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Jul 2025 15:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yW93XPt/VxN1c0OCZX0POpXwP9F0HF8oz3/1GSL1nYQ=; b=hgSkoLjIqskvCGgP4P1Lz3/eyM
	+vNaimCq6VaTLV/C7DgdCrrOU+ZLZWSzZD/Iwy39WO6IeE8WHYLCqWAkbL4c5dtvztua06t8UPsJK
	qQYmwY1C/KI5Opic4sFp1MmsO5xQ5C1WZSQWPbpPss1hiYPqtObgbWV8RJlCSvpZLxym1PndPxnbW
	ciF7AkdbsHqhk/F+uniin6viXCMDhJJKhiEwd0xyFJ/6s1GjzyAq1lfOjtLm1jl2s3cDI/ukzim5M
	PIqu4yeOkCL6CNp87wlR9i0ZRK+l/VtVzpMt30r/8r8BcWZ6eCwLByVkvzmyPiQAh3UB4HRb5NeP6
	i0Cs60sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexrr-00000007rwz-1q55;
	Thu, 24 Jul 2025 15:28:23 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewdz-00000007hQu-1POn
	for linux-amlogic@lists.infradead.org;
	Thu, 24 Jul 2025 14:10:01 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4560d176f97so11693615e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 24 Jul 2025 07:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753366197; x=1753970997; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FtkvbalbhW467Ci/TrHI2JYa3ewJ4y6lRxO5bgqakFk=;
        b=y8uAg937ZfaXuOl0y0uJCDs99u0xIMJSky4N9DifdN97sJ1PbG7oJnha3oLqqWmmpm
         /Hhs4oGoTqYSKe7L03dK4KhCFt/KNz1TUFnb7qpGrIpfYxemDomOQlY9TQTfdx3aBvw8
         pNmM1ggm1EkM7GGSQY6ok0lvw7RrJoJZjjn3BFaK1OjgRkJoFAEpEoLAkxa15dWkJJtO
         Tz9FuJZ43Auq8lsX5HuJ4CkMArZPGNpOpt2N6WlO552dUaA9KGze8xARAHY25b2bI4ds
         ZCHBouz206PS6Hn8H0QpHWqpz/RjSWyMxB2Vwx83FRPDZ5vHR+kAoB+ThnsORzxXrzQE
         h5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753366197; x=1753970997;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FtkvbalbhW467Ci/TrHI2JYa3ewJ4y6lRxO5bgqakFk=;
        b=J50Izul/zXAfmDUQhISh5cfp1jaMcqiyoI915sQHBYws7LE+DaLcxoivLRRIrwGheH
         xFAqO3W2BhBE5eXuyFN49DSSZSfkrR0kvi/NvwVqPdL6SdxEgb2iH8bFKLr00mAvggLH
         vEj6t46SUAggW2a6ymvMpR1Po9KL+VmLDfIlRUz9Grha7hQtsuhGSjSbr6zILLhcvnzB
         ejApC7mAcT3pBC5ECLxkfwvmkhHJ1c6hNyfOA43CNH/CkR/mVPzmfL8lQWZZYsvDNM3O
         26RCgECuRCiG41w3NTBLTmlhyWQsHh/Feywp5JDUDjg0rthkjcG35RYaZ0BTRSXfb+rm
         UCig==
X-Forwarded-Encrypted: i=1; AJvYcCU0dcgFGvwtdw0pTIzaiHtwuuA/xAyyRziniVRcfVIv1MmDd5iys94uJjiCLSuN4pOez0NpYwnrSrx8Fw3o@lists.infradead.org
X-Gm-Message-State: AOJu0YwHfpuoIOZyij1ixHwIe4tpfOStJ5ndHZyS2QEui5TXOrxbGdtz
	H1tluRzFHizFAp4quzpx5VYVkzbSzylWjHqg3GEUH1Wh4DlTmEXI4Q5e2z41YYBtbcE=
X-Gm-Gg: ASbGnctBgNzHLpsBOmABkOW9b9HO5MHw9ZXT1qbDH2CH1lFMd3a1GIM/xJM/2ogbcYM
	2Am3E++b05yOx+YpznibL7DB4/76uEKSKQ/FoeEqTKbCs3SiQmJHScAW3RdCqHmb20cZxDIdrz0
	sXCSDg/Fub+DfbT+aFWPtcLWabxgxcH5X25MHHoCeml947ZYCGz+RBwO7xKdqjOQYk/co3Hqe9C
	59AcZle5OOaPUiO1ERx1f06aHSLvl6gAgHp9BmXtZ6NM8mOy+LbAUXCFf1f2+AS389IWTZXtk1H
	jdnr9JiMYEu/lX7CBwEcRgtRRonhk/+NrwsT3yufwZCNXa2FXuO0uVhc0G46ByIcjdPJVwURN+d
	DpJxDTRQfTKOwuU4q3hTvYuf0OfkCyUp+RcbQ/4IBB1ZN2x7zwh/0io/oetFJdvrNiht5n0ymR5
	I=
X-Google-Smtp-Source: AGHT+IEzBJZjwflpIGZm+EhCnzacJZTC2cyh5NeZ7fWUM4qCv/j+DuKgDh48awMiy/In3FsYO7BG9A==
X-Received: by 2002:a05:600c:529a:b0:456:26ad:46d2 with SMTP id 5b1f17b1804b1-45868c75dfamr58753125e9.6.1753366197052;
        Thu, 24 Jul 2025 07:09:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:e2d3:d328:dc00:f187? ([2a01:e0a:cad:2140:e2d3:d328:dc00:f187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458705377dasm22037195e9.4.2025.07.24.07.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 07:09:56 -0700 (PDT)
Message-ID: <d02c400f-d159-451c-b4ac-745e74986591@linaro.org>
Date: Thu, 24 Jul 2025 16:09:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 06/10] pinctrl: meson: Fix typo in device table macro
To: Alexey Gladkov <legion@kernel.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-gpio@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <cover.1753354215.git.legion@kernel.org>
 <c47f5e1ab68248cbc4d51dcd822829da8857ea00.1753354215.git.legion@kernel.org>
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
In-Reply-To: <c47f5e1ab68248cbc4d51dcd822829da8857ea00.1753354215.git.legion@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_070959_393904_D6FCDF5E 
X-CRM114-Status: GOOD (  16.13  )
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

On 24/07/2025 15:49, Alexey Gladkov wrote:
> The typo when using the MODULE_DEVICE_TABLE macro was not noticeable
> because the macro was defined only if the module was built as a separate
> module.
> 
> Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507220009.8HKbNP16-lkp@intel.com/
> Signed-off-by: Alexey Gladkov <legion@kernel.org>
> ---
>   drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> index 385cc619df13..95525e66e5c0 100644
> --- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> @@ -1023,7 +1023,7 @@ static const struct of_device_id aml_pctl_of_match[] = {
>   	{ .compatible = "amlogic,pinctrl-a4", },
>   	{ /* sentinel */ }
>   };
> -MODULE_DEVICE_TABLE(of, aml_pctl_dt_match);
> +MODULE_DEVICE_TABLE(of, aml_pctl_of_match);
>   
>   static struct platform_driver aml_pctl_driver = {
>   	.driver = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
