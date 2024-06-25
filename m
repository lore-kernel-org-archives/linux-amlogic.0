Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B25EC2BBCA
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jun 2024 09:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hl33b1MDEJOlK1zBRb01PTpMW6BiKHlQc2nVx7m+zGg=; b=q2PUh0vBKz5LSF7pq9LGRXAGrK
	c98a+zqs4htddWmZN7SoY8mCgooku62fAgZDKuSD20tOemhXHnUX924945yq4JVKqhe/nSZ9+iSxq
	SzejBEuSLqhVK9B4S1g8mvNIY/oehqqZS3CtbogJCRyv2CrfqFD1TnepuXZvMMEAF9gvTKmgqjR7H
	H5S5x1tl1+79gmeTLduVymOHn3WTN6uCAcLGwBT+6yxlMjWFce/JYpUa3TQydAdARcCJUAZGd5mNJ
	C5ApTSwDs7Yod5/ULFMCBs8xk0fL9PnvqB9NdJJb52bSgzZ3vBulGQW9YCYTz/82RDN+dQqvIozSy
	L5F0UIcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM2dY-00000002IKD-0lAF;
	Tue, 25 Jun 2024 09:38:52 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM2dU-00000002IIO-0ziF
	for linux-amlogic@lists.infradead.org;
	Tue, 25 Jun 2024 09:38:50 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-35f090093d8so3580863f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 25 Jun 2024 02:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719308326; x=1719913126; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RHsZCkoq8YrIBeg6L5civsW1RJ5veolYvQN+FJ9/Qb4=;
        b=UTp4bpNztsboXCr75pm526JhokOiKafUVPmAXJsFtyV/GcOHDzxiWOUo6/DihsLYwX
         HirA2oAI9oEMDFXUbcsqyY92BO/NDK64/tMuX4Shd4QrmT4OFRu8FBxaU2bSP2ALPZRi
         dMRsnJ5ABNV9ufs4XEY09AvOI9iozAbQZKGKXCHnu4O9E59BcTdAdl+15nbUGG8zHBRl
         YpvDDy82LR+1t09jsO+n8KTeFx8bUyGiQByws5T4eT8rhc6RQjQVzBAAgV5h0hADFSVX
         bJi8Jz8H+r4DHD5cEh0V2MeSyug11T0drNjah8Ka8tcLHwTXMR2eFN2zF7lfjR3B24pr
         mPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719308326; x=1719913126;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RHsZCkoq8YrIBeg6L5civsW1RJ5veolYvQN+FJ9/Qb4=;
        b=lwp6eEQonJRdG6+H18rgCkqvkHd4sRJNGoiMSG9OUMbR74x/JgXlaFJGbbX+bcupkZ
         Mn0gNyfAI/CUJN16D7kkkRi4jvxjxmjg4yNob+o3RWyy7qxkPPybFK81ItpMo7EBePhm
         mVH6d8TJxYGUjcwESY8IhC5sfUXQ3H4X8AsgAZqmLY0fkWJ++AR+3re98aBoyt71u+KA
         aQ93sxP1ff3AvqbH97Jb6SlyxP/PRRj93QC+5YrJrzVPcmjlZ7gTslhOJxOnOku4xhP6
         I9L775TF4bbJ//ZQg97SroBejSQh+g2WG997rQmVLNL/lc7HtkCE6Sk1LiUMr/9NYs0e
         70/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtzBvCamrP+uWc0ezQ1WOPw8FU38LvnFT6sqierqZoPNCdGLjHr70wq4caLLVk1c37bKo0L6/LrPLdq1+pJxGB9KiBcQX4LCJCNQ2vwNXZ4k8=
X-Gm-Message-State: AOJu0Yx0tR5258zG+ZZLpmGyaBGwZwbPeo7FwNR6eRSvHqIF9iebbtH6
	+GcgoCc046bNlh366yzenBTIy+kHqm/0e/gC56wvyOmnYjSAeA5q9+2gROsSgZ4=
X-Google-Smtp-Source: AGHT+IFA7K/K52topEkP/SOJgf7qzSnQq3MCtcizZ8ZhFQwdc4eqMFuNHG0MvgFRUfiOSwUtuolDeg==
X-Received: by 2002:a05:6000:184f:b0:366:ee84:6a79 with SMTP id ffacd0b85a97d-366ee846c15mr6347407f8f.51.1719308325966;
        Tue, 25 Jun 2024 02:38:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:bd71:2ff1:592d:f52a? ([2a01:e0a:982:cbb0:bd71:2ff1:592d:f52a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a2f6977sm12489752f8f.80.2024.06.25.02.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 02:38:45 -0700 (PDT)
Message-ID: <52fab9b5-2b44-49c0-8b90-cb2a74eb6633@linaro.org>
Date: Tue, 25 Jun 2024 11:38:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/2] iio: frequency: add iio support for Amlogic clock
 measure
To: Jerome Brunet <jbrunet@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-iio@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20240624173105.909554-1-jbrunet@baylibre.com>
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
In-Reply-To: <20240624173105.909554-1-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_023848_315914_52FD7222 
X-CRM114-Status: GOOD (  15.10  )
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

[+cc people from linux-msm]

On 24/06/2024 19:31, Jerome Brunet wrote:
> Add support for the HW found in most Amlogic SoC dedicated to measure
> system clocks.
> 
> This drivers aims to replace the one found in
> drivers/soc/amlogic/meson-clk-measure.c with following improvements:
> 
> * Access to the measurements through the IIO API:
>    Easier re-use of the results in userspace and other drivers
> * Controllable scale with raw measurements
> * Higher precision with processed measurements
> 
> Jerome Brunet (2):
>    dt-bindings: iio: frequency: add clock measure support
>    iio: frequency: add amlogic clock measure support
> 
>   .../iio/frequency/amlogic,clk-msr-io.yaml     |  50 ++
>   drivers/iio/frequency/Kconfig                 |  15 +
>   drivers/iio/frequency/Makefile                |   1 +
>   drivers/iio/frequency/amlogic-clk-msr-io.c    | 802 ++++++++++++++++++
>   4 files changed, 868 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/iio/frequency/amlogic,clk-msr-io.yaml
>   create mode 100644 drivers/iio/frequency/amlogic-clk-msr-io.c
> 

While I really appreciate the effort, and the code looks cool, the clkmsr is really
a debug tool, and I'm not sure IIO is the right place for such debug tool ?

There's almost the same interface on qcom SoCs (https://github.com/linux-msm/debugcc) but
they chose to keep it in userspace until we find an appropriate way to expose
this from the kernel the right way.

If it enabled us to monitor a frequency input for a product use-case, IIO would be
the appropriate interface, but AFAIK it's only internal clocks and thus I'm worried
it's not the best way to expose those clocks.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
