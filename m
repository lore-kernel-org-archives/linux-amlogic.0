Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F211CD4F3C
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2026 12:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YqLL5GW4Q554QoTYvTsLMODN/72ejRz6a9dTGpsgds=; b=H7llZdoDUH1lq6vPmpDKXqOAQn
	8ITNYkRIkrKonV9e6CSw37gi3uEFgh36GmDv7M58IXeHaee/6pXVctQWAWqSIpyXALOIH69e/kK78
	Ik4Ux/BATaH8Yp5HCk1ME30u3Q5m83byPLhQNOTDBElg4wXd+4m9kbwzLng7//0Zj4e9aMZnykH/C
	r3fsDtdtwPLHWLGhvy6fEl+BzvAx2ZVgJf3v0cGjWw8wlRt9V6llgMOv6NEMW7HCORVaANi1nIZy7
	4vB6HxKOih+W2ajcoFBxb22FhM38fQpfnV3jfkCgwAXBQWcF5vgd53DWD9m0QXmh56ad5A88I6UMC
	6BubdAbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxWU-0000000Fj0s-1KfS;
	Mon, 18 May 2026 12:56:42 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxWR-0000000FizD-2xIx
	for linux-amlogic@lists.infradead.org;
	Mon, 18 May 2026 12:56:40 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48fe26a177cso15427055e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 18 May 2026 05:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779108998; x=1779713798; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTzZu6PNEHK5eJaUTG9yj4SnM6fDyLlKBKNjBkf8mjE=;
        b=ODw11VenkSBiNuXly80YFJmDNzNvNA7/7joldMHZ7L6FUaUxcO4/yuHSPyO/VkhSy1
         dL6b5sVoGnMENat44cgB9cVqKyhMGwMG2nJ1uhAryK0r5EWb6llYUpD5IwimubapCFir
         OXb1FXtXBNAqnZ/lxETT7PBnS54We0Gcd7fEhOnaePvOhSTutaEByMeVWxnBOiWOdF5P
         BJXXARL0DiMtJCB8tYuuo4KcNC9/IALRwHcHKWTzUGulbb9QiSDRggCFZHM5Wmty2r2m
         y7YYNPgLlQfjcIG4zRh20PL3Fd6CzkkZT9gDtmfikpw3m3H9jgsK50JpeF72h1vufA07
         xyuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779108998; x=1779713798;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fTzZu6PNEHK5eJaUTG9yj4SnM6fDyLlKBKNjBkf8mjE=;
        b=Eh9DSR1FOKX5r6SqOtQZOEnfNQPVuLqUjwt/HNh+4owq4K2KvFTDzbgcWVxti6dTgf
         S4Lpa9ayXCcW9dtRq3g+5nRUr6YnUCTAs58DMay7WtiSS6w3llsUc0SW+GLmuEsoXtVr
         P+EPBX08PTHa2MpSuMS5xXAZ+EU6KGlzHeyADOffJ8tUu3o53oiCXtM17ykzznDQmhTu
         hJyfdk4hIpZjkArd8yMt5vshk+wz5PeOmHVJOom2/WjjDIrBcCRoudAHE1M+9XsMSmYu
         7p3gnWMIkw8eMWLdl+YWURmrSZE9mC6w2rWsU6WxQzFHbysn06dO/tDWt3slL1lxST8O
         OP6A==
X-Forwarded-Encrypted: i=1; AFNElJ/++h4kQTZ4dHyTvakP4YfUpIpLGMWYkMv0c74dDtKWF/Nva8FGJ4931onDtNkAyfuMxhUu4wrOREXwCmp7@lists.infradead.org
X-Gm-Message-State: AOJu0YwiFsXBDAATyy569f6wilCec17ipjoYdDp17tDoR+8rVJGPfaJw
	MBic+QqMnPl3AMX2yUQpjyhARQ/OOSOoVWB7zaryhLv0bHoqopnPnLth71wh1tSdtfk=
X-Gm-Gg: Acq92OFb9iW73+TPgvJmmVJQntua1xZxGj5tnvxSAhidVuKJkBqW7WF5YaUmsnfZ8nW
	iShjEz9AufIXelFsTxMp4E12ubu2dxYbwqwb3H+bhQPhBFv5ykJGEahz5Kxakq84IBOUEqn0j2Q
	b/2nNRoy/yMg0QbSjiwPan4bUgS6T0RppOUCic2xw/i3QYXAF2xyZHzHWJfNJm/XGXQAYgT99c2
	KBkaR3bL3LldF0+9nn5Uy9eT0j71PBBhH6ZIvajLV3aKhAalioVXjeeonZtKI7lC9hXGetVAjB7
	VFbpPmYaV2ouVKMIa6bd481YumkbhMZj7UKpvmp4ymdyrJLMJfFTE60+dqqqf+B3WmVKChnYW2r
	7C9MG0P+88GcQiEeCoZhsVt8agEr+GG2gdmDB65bAoxkkyFRnnuZvOLmbiq5nGrM5KUlZB8Hbc3
	iEWO68EPWj6k/nGghLQJN4NnuCuX3QW9i8jTaqY1gxJoQ3ERGohE9oJMB3VpYr6y7gRmehbfQQk
	ysoN+1oDhmKWPWLVw==
X-Received: by 2002:a05:600c:34cc:b0:48e:60a3:220a with SMTP id 5b1f17b1804b1-48fe59af1cemr249848065e9.0.1779108997664;
        Mon, 18 May 2026 05:56:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1029:e3c5:362e:1250? ([2a01:e0a:106d:1080:1029:e3c5:362e:1250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe537c516sm276340275e9.13.2026.05.18.05.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 05:56:37 -0700 (PDT)
Message-ID: <08de1873-d2d8-4387-8521-7161ad71ee46@linaro.org>
Date: Mon, 18 May 2026 14:56:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] PCI: meson: Propagate devm_add_action_or_reset() failure
To: Shuvam Pandey <shuvampandey1@gmail.com>, Yue Wang <yue.wang@Amlogic.com>,
 "Lorenzo Pieralisi <lpieralisi@kernel.org>" <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <177909148011.9588.6639767953842842291@gmail.com>
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
In-Reply-To: <177909148011.9588.6639767953842842291@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_055639_760852_D4B59308 
X-CRM114-Status: GOOD (  14.79  )
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

On 5/18/26 10:04, Shuvam Pandey wrote:
> meson_pcie_probe_clock() enables a clock and then registers a devres
> action to disable it during teardown. If devm_add_action_or_reset()
> fails, it runs the action immediately, disabling the clock.
> 
> The return value is currently ignored, so on that failure path
> meson_pcie_probe_clock() returns the disabled clock and probe continues.
> Return the error so the existing probe error path unwinds normally.
> 
> Fixes: 9c0ef6d34fdbf ("PCI: amlogic: Add the Amlogic Meson PCIe controller driver")
> Signed-off-by: Shuvam Pandey <shuvampandey1@gmail.com>
> ---
>   drivers/pci/controller/dwc/pci-meson.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> index 0694084f612b..8d495bcc3a41 100644
> --- a/drivers/pci/controller/dwc/pci-meson.c
> +++ b/drivers/pci/controller/dwc/pci-meson.c
> @@ -204,7 +204,9 @@ static inline struct clk *meson_pcie_probe_clock(struct device *dev,
>   		return ERR_PTR(ret);
>   	}
>   
> -	devm_add_action_or_reset(dev, meson_pcie_disable_clock, clk);
> +	ret = devm_add_action_or_reset(dev, meson_pcie_disable_clock, clk);
> +	if (ret)
> +		return ERR_PTR(ret);
>   
>   	return clk;
>   }

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
