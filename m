Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A647CD4F52
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2026 12:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ny/5SVroushc7Kx3MP3kREBliuJKxnjZmyu1sMUlcH0=; b=oq5VW8Cdop4mZjP1G/kHonTy2f
	rZZsMVq5Rg2G9XKVT8I2lVAvTtUHIawYcpV0bhBzSidb1llYIzOI+13sgF8ggGVmuWS92JkCr9+BS
	yhRXFxh1QudhyGYlKEFcWvnpXOM0iw4+ifxxu4rZmOuof7fXaj9SUWtS9h5WSxd4vvuKGzrk1y030
	luiC/ct4g7RJQ4b0ceTDLx1Eqnscnzjj64iQSISSRwnNKGifplkXN1wkJvAAmAgFLHnR3aBRTkpnT
	w3VVw1Uw4B9mDUgnYwaaop2XfEjIz0HwigcbsSMTb0ueqcdly3PCeRZuFpIW1i4HrEXD6eI73X6EN
	cDEET2mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxWN-0000000Fixm-0pxb;
	Mon, 18 May 2026 12:56:35 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxWK-0000000Fiwr-3t9G
	for linux-amlogic@lists.infradead.org;
	Mon, 18 May 2026 12:56:34 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-45e7c636e74so684849f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 18 May 2026 05:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779108991; x=1779713791; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wG5JigRzl+8hFDlaIdzHX8LNfceobFw3oJ/CoEjhnh4=;
        b=dIxW2M6h2DUrcQJw2hQ21dxJb0r68eCHtEGavxlY96lXGGHUmRfDKrYh39U5TS6TK7
         cJ0NDVBjNKGrPcuLfVrmxn16LEvqsuJFqzbwL7/eAmeVkJsXggEfUh7+0vdlh9/gA3MW
         Jlh/fIUtqSpYY9wvbnsLxUURLnPvCRRUe2/5YUH/2LNiHU3cM1Ijblw6gMBYI9WU56MA
         ItgVmhzMtkFtSUcGQF0tNVi//eUclhJwe1Z+0Q5QwjTBRO63aG4raPWOwwrQzg0T5XYc
         nL3w9paoPfKmWKNBf8Qh08xsNROi2w8xnLz+BSiUdlrwgM7s+C13ovgK4VmwwGLpDvX3
         EoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779108991; x=1779713791;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wG5JigRzl+8hFDlaIdzHX8LNfceobFw3oJ/CoEjhnh4=;
        b=p5J3Dc1op7gY/mWPIRlSLiZ1hZi19T48yyWO6XPpw/io4Wq4pyRKbVbKCvDt7g4NBx
         8L988HM8C9AYEuhtj73Arf87+8I0Wg/+uLr7i+hmBLcnbZa5N2V5Ejoo/VQC0AOl8oGM
         inw4iY4sh9ATeDHmh3oYxXouGJjrcGjswcvDc7Rodw6P9DOQXUXAtXtaZR1HvGsUliGx
         AhV/H1VdT1O20uXCrEqO8kDuq/yxq/wleIZKgZOdPM29gBo0TUCwNDfSm5zqy4gPwOgQ
         2FP9XZJvaAM1dLMc2GpXl/URlAfW0cQLwc7Hjgf89zJUrmZtfw4UD7n6fJr27pRBOTnU
         l8AA==
X-Gm-Message-State: AOJu0YwnyIvuPcZ0tPT5xdvnBwsr52hSr3GiufVvW3LKn3ZKnvhWBSCS
	0c/jIoWu2YCfVxCTiNlKrQdBfl8hMNJCNsF6Ws+OEy4LjQxBxcjGqTV+7Jl+A8R9IS0=
X-Gm-Gg: Acq92OHUO06cXM0gUeQf6KBKpUD29KNitadTTw7eDCdMVshI72eVe4M086hvr0sSzSE
	nSV3vuP0Iof/sjLERqvQ4uCE672B0DiHHqSlup2BgkfMN3xY+heRarJzNVGK5+c2s98cblqbQzt
	JlAJ0VzmX61oG1sh+AiT/hQRXWlvM4cbOjscpezD1rm/eS+i5EZ8szI73oesrJek8I0ZRptYCBQ
	9fA8t7553I1jyN5fSuuH0tby3xsV3pePKwQqwmIHLahc6ZC48oW2LBJIMD7z4a9pAYK6E+NYREY
	irAJQwYjn+tcKJMj3OEz5u/le0j2WaBx6DARj/jG2rsrEp75kBgFsYpyjGZX9Z0bFeXKLhKrsES
	oevTXMcBortrPzNH7uNUH1YWMPWxldvr00NjYS81A2Bt94S3zJl3kNhFQkp9GtjX+hmSxgSOE8L
	AVirqI14u34919yyq49LLAf0q5UJwvzK2E9dUGPPxSCIgKAPPhBctaOYuzN1oymWGdQyIIUPbCM
	Pv0ajI=
X-Received: by 2002:a05:6000:603:b0:45d:3aa3:7f76 with SMTP id ffacd0b85a97d-45e5c5ebd5amr24498434f8f.33.1779108990553;
        Mon, 18 May 2026 05:56:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1029:e3c5:362e:1250? ([2a01:e0a:106d:1080:1029:e3c5:362e:1250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm38940230f8f.23.2026.05.18.05.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 05:56:30 -0700 (PDT)
Message-ID: <940d7714-4303-4e82-a006-3066d2165844@linaro.org>
Date: Mon, 18 May 2026 14:56:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] PCI: meson: Propagate devm_add_action_or_reset() failure
To: sashiko-reviews@lists.linux.dev, Shuvam Pandey <shuvampandey1@gmail.com>
Cc: linux-amlogic@lists.infradead.org, linux-pci@vger.kernel.org
References: <177909148011.9588.6639767953842842291@gmail.com>
 <20260518082022.F4229C2BCB7@smtp.kernel.org>
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
In-Reply-To: <20260518082022.F4229C2BCB7@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_055633_004551_8821BA6C 
X-CRM114-Status: GOOD (  20.21  )
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

On 5/18/26 10:20, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Missing `.remove` callback or `.suppress_bind_attrs = true` leaves PCI subsystem and PHY active after driver unbind.
> --
> 
> commit fde9e1cd9d05730f72b074fa8edf3a1233d11384
> Author: Shuvam Pandey <shuvampandey1@gmail.com>
> 
> PCI: meson: Propagate devm_add_action_or_reset() failure
> 
> This commit updates meson_pcie_probe_clock() to check the return value
> of devm_add_action_or_reset(). If it fails, the error is returned so
> that the probe error path can unwind normally.
> 
>> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
>> index 0694084f612b7..8d495bcc3a41a 100644
>> --- a/drivers/pci/controller/dwc/pci-meson.c
>> +++ b/drivers/pci/controller/dwc/pci-meson.c
>> @@ -204,7 +204,9 @@ static inline struct clk *meson_pcie_probe_clock(struct device *dev,
>>   		return ERR_PTR(ret);
>>   	}
>>   
>> -	devm_add_action_or_reset(dev, meson_pcie_disable_clock, clk);
>> +	ret = devm_add_action_or_reset(dev, meson_pcie_disable_clock, clk);
>> +	if (ret)
>> +		return ERR_PTR(ret);
> 
> This isn't a bug introduced by this patch, but could this driver be unbound
> via sysfs, triggering a use-after-free?
> 
> The meson_pcie_probe() function registers the PCI host controller via
> dw_pcie_host_init(&pci->pp) and powers on the PHY via meson_pcie_power_on().
> 
> However, the driver does not implement a .remove callback to call
> dw_pcie_host_deinit() and meson_pcie_power_off(), nor does it set
> .suppress_bind_attrs = true in its platform_driver struct.
> 
> If the driver is unbound via /sys/bus/platform/drivers/meson-pcie/unbind,
> the device core will trigger devres cleanup. This frees the mp structure,
> unmaps IO memory, disables clocks, and releases resets.
> 
> Because the PCI subsystem is never explicitly unregistered via
> dw_pcie_host_deinit(), the PCI core retains references to the destroyed root
> bus and freed structures.
> 
> Can a subsequent access by the PCI subsystem or userspace cause a
> use-after-free and system crash?

This probably a bug to fix, but totally unrelated to this change

> 
> Additionally, the PHY is left permanently powered on without its required
> clocks. Should the driver either implement a proper teardown in a .remove
> hook or prevent unbinding by setting .suppress_bind_attrs = true?
> 
>>   
>>   	return clk;
>>   }
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
