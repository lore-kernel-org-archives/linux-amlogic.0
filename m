Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D929C79F92
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jan 2026 13:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WSp8R2xPngstI6C6lQtb/0ySrOj5sOe6pPn4M1Tc2LY=; b=TjYI4GpGUaD4A7RjLIYN4+367W
	ZIJo+JVoMofMSYCRns/dgIyCWA4kc91/6t6VOgyd+2DCkqmDNjjrqvZEOiOV2qU6tWYKAij+AcgKJ
	dUNsEpbfE9dkdl/+8HuSxmJ2UshY2sFEtOcBXodx2AKxHDOZzDOhXy289JlpknJaYD1rLcW/Z0mUO
	bvxElTtNDaHvX64jIJ27hz9CxDCCXWPRby7FzKgeipuW4BzZB3frPaYYXbNZesP16P/lE/+DQWS+7
	dQpylhTxECoL+mvlm0XfAp4/6OonF/FNkrsTf17YEUHsetX7BCZBGskJSP8qxkYXLixYTn5Frr8gS
	XS9qlBSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckwc-0000000BUmx-1dJX;
	Mon, 05 Jan 2026 13:48:26 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckwZ-0000000BUmH-30Qp
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Jan 2026 13:48:24 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so8418288f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Jan 2026 05:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767620901; x=1768225701; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5pm61tHOxVIMRlo2kMdlbFtWUM1V4vVjtzMYxIxE1KY=;
        b=Ii3MI0O5LvgZ5DeZzVe9Yy4+GcmZyNLOHekR7R8hmfjEcrfFNjs3tfUhyEtg/6eRgd
         oRjHhwoi5KiAewdIkpQORNtnmfM2ZLmeKhlh6BiDCfXr3YV9qZUmJckXTXGc9rKEdMk7
         P7MyI7Fku7P+BRUoOxHsIekToLm0Uimp3+H5prGUDrYUwdfNG4IX8rqIVBpUPMrZ8bXq
         /3T2nkKx6p8GxmcDW1otim+9EBz611qQna5pM0Ssj7hrw5k/qKLQWZOh0DaYBN97/wEV
         raBi8cNSl+id+OIwS5GLaPQIuuh4vgk0r1DMq79zf1b9Aaimk9BCGS6UD6sHP6Z883Be
         N3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767620901; x=1768225701;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pm61tHOxVIMRlo2kMdlbFtWUM1V4vVjtzMYxIxE1KY=;
        b=Zn5GayZt/pD/uN3bD6XKLpK3C6FTNvGmZ05nZ0X0Td7JZ3bArYvgwX3IMNOWubnNoV
         AFhpRs4f9MFhkZ72i8wnLx8BOSy3VdDORp+AeytS1Dj4VdT4kk8sPJZ06fh4OjS6u19b
         9X7rhqSJqJwaXfeJCqGf9cXoQpYjhVGN/gXYq2S4ImJme7AUzoCC7LeUprXsS0pXwwhg
         Aw7QPlkgWaB7UThVKeMKfP1hO2CLNt1cnebdQqOGX/rH1+DUtz8XjNf7hReIup0F85eg
         9vhBOKauoy0MjSdW96cdVrvNqCjFT0XLFbYr8TTASJA7d8MlCPJXUA7k++eWPPudzddK
         yC5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFZNPxrtj1ELx6wuKowbjIoOsMACIU6WkCdnhrx5gEUMCxIlmPLyOtwvQwapIU5YjJIWT3wQt+g5K64EEJ@lists.infradead.org
X-Gm-Message-State: AOJu0YysNBFpJqD075HCQN7zEUfzBmjyGtpEHRj9MoJmUW3RIW3ulcAa
	w3QYGVlecvJUc35WbV9mIYYPCMAGFN2FzJ+nPA6HP/3qpDBKnZ2/kh6y24FNTjHvNa8=
X-Gm-Gg: AY/fxX4WEgAUMzTRId2JSZqUQn3vaHhzUM1NXw7Akx0EHVsfJ5vLN4iOGu3CIfnkhlx
	z3708aO1eB/CnDT0nG2G7OrNwKjR+Km6WiwBaajoRUTTq0KTDCY33CZKGmuWlHgbRYJlpgtr4KB
	UOrhIlkY+gTr29tY4gNWDofu5DTsnJMYp1J4oywtAG3i5AN93TupXQmxDcsBYf9g/gfBAr99a2E
	1OgMiDhkzSih7Ax6Tv7MMRAa+jKnKUVJ8pnJGalpXkoqT1Wj/sUx4Dm/Fk2niu49N00aq5pT7Qu
	Oauq7K1LnH641rCTSiun/HbUdDkc5ct9VhcSQmqsGo2iNakqcu4TtLFHTJGObh+wgj3BiGV5q7P
	3C1Wrc+IQaa+SKgDlKh2dnpwB3ZPFr9zu8h0GLzmAl0Cl0vbH1xaveP6dGWiQVMdjmnEYJhhRWe
	UZsKQY936gphHVT5MmubX3lhYxTl8yi682R+nqoDwBaJ3dGkb2MarOCpEYizR22Xc=
X-Google-Smtp-Source: AGHT+IFJH9vjvSt9a1g91foUnNhyxduRLS5b5HEkPDAICFvU5f47KylFUeGSvzLd5WqdKzRrR497ng==
X-Received: by 2002:a05:6000:40dc:b0:432:5bac:3915 with SMTP id ffacd0b85a97d-4325bac3a19mr59539111f8f.39.1767620901179;
        Mon, 05 Jan 2026 05:48:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d4c1:5589:eadb:1033? ([2a01:e0a:3d9:2080:d4c1:5589:eadb:1033])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b1b1sm100156855f8f.3.2026.01.05.05.48.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 05:48:20 -0800 (PST)
Message-ID: <46d049cd-3307-4fbb-b33e-69ba05ded106@linaro.org>
Date: Mon, 5 Jan 2026 14:48:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] PCI: meson: Drop unused WAIT_LINKUP_TIMEOUT macro
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 bhelgaas@google.com, robh@kernel.org, mani@kernel.org,
 kwilczynski@kernel.org, lpieralisi@kernel.org, yue.wang@Amlogic.com
References: <20260105125625.239497-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20260105125625.239497-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_054823_793126_3EA049A1 
X-CRM114-Status: GOOD (  12.14  )
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

On 1/5/26 13:56, Martin Blumenstingl wrote:
> Commit 113d9712f63b ("PCI: meson: Report that link is up while in ASPM
> L0s and L1 states") removed the waiting loop in meson_pcie_link_up()
> making #define WAIT_LINKUP_TIMEOUT now unused.
> 
> Drop the now unused variable to keep the driver code clean.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/pci/controller/dwc/pci-meson.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> index a1c389216362..0694084f612b 100644
> --- a/drivers/pci/controller/dwc/pci-meson.c
> +++ b/drivers/pci/controller/dwc/pci-meson.c
> @@ -37,7 +37,6 @@
>   #define PCIE_CFG_STATUS17		0x44
>   #define PM_CURRENT_STATE(x)		(((x) >> 7) & 0x1)
>   
> -#define WAIT_LINKUP_TIMEOUT		4000
>   #define PORT_CLK_RATE			100000000UL
>   #define MAX_PAYLOAD_SIZE		256
>   #define MAX_READ_REQ_SIZE		256

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
