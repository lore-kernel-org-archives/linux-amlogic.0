Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DF4CD13CF
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Nov 2025 11:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFb0inK5WHFbXcMROw4zKshwenze+n9kEDmWL2W2/+A=; b=3QD+pbfwoANEZfiJV1KN634T9O
	nEVqv5HKBXOoYSP6q/mmMk5NDxh737GhfORN+kFN/OZxLUQKdsdTpNkcfM4JR/cDrOlLZhfiXE/Bq
	j9lUI08q3ineonIdAnWX4TMXEqZCwYs+j9+oUkqZBIgpzqJ8akh5kkMevJ7KdoyPyBM4OpK7qUJJf
	bz4AZhQpzw5KVg+O+yRf6UfwuSuaMlxbq5M+Obyl90iPYkRRNuO8oKUnTxzF/T3z4vBAKJPfRFBOU
	mQIPCllnJrSwozRMqgx4qvw5VtfQSJH3aB3Xuze1kgoI/49G/LE2oVShx0hvD+MX0cSDq/b3V/1LO
	xUPUpodg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPh4-00000005G5B-3dqt;
	Mon, 10 Nov 2025 11:04:18 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPgy-00000005G4A-0a3o
	for linux-amlogic@lists.infradead.org;
	Mon, 10 Nov 2025 11:04:17 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-42b3377aaf2so680548f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 10 Nov 2025 03:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762772650; x=1763377450; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yIWnZ8dEqAIo6e04DNrTq+ZCsjQol4ZAc5Df0I8mreM=;
        b=sKjXapYuKOz9PJcDUKb9Kk5L7LbA+devOQiHdwfRnreUA6BqkNJtFsXG8rempMvzum
         AZvmXPWPlna7Opv9vKNqYpkCWL7m72CTsMfUzx6Rz92H+ObpDffyHIm30c6m6e8k2J7E
         Jx0EpTaMblepxf4GBPFg17yo/az1KM3JMxbvr4fBxFvpJD19vLU5JUj2QVhwzWZhVq0G
         uGsFapDw6n0XoeJ0pV00N5THJ1C+FRUtned5YzQ7Sv9VapehhpPZ5CFTV8FdzZDBacqb
         0cWv8Gc5nEBuvSSuR6p9e3+/c3jmcGjlB5kCvuQiuqOFgVvQU+BYAyinBxm+Aojus3VM
         CVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772650; x=1763377450;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIWnZ8dEqAIo6e04DNrTq+ZCsjQol4ZAc5Df0I8mreM=;
        b=RGHWGYqV8bPVsh8b+U6t9ACE50L1riPxCYu16w4igrWLg8fpm8JcTsQ8B+HO1cSBzO
         LJyO9grp07BbyVtZbgwDXEOTASf1TOaZbFnvYSNx+olUiO6KBpz1kAi6+NC3LUYADdf2
         Tdioiz0wnJXZEDK68juqOA5UsbDtkO6xB0kN2cS1teVV338LKv72/W8N80GWDbBJpRPy
         lXPme7wgUTI3kF4vUVhz+u49EXWBIzjW0N2sAD9CYLyF+9FCHq0XD/LeE84jYCxdZ1Bs
         f/+FeFcbT9k4jXuwAgXEwjPFY8GUyYXtF1UizbWeJTsLXUVs6hcyE+d+Y/o6pcRgAtDV
         AGBA==
X-Forwarded-Encrypted: i=1; AJvYcCVfU0heCIJp+91OCyRfm8sDdnskOZBIUZcFUlNx2NptZkFvmVIY1hNznF/Qrm0+gQBxSCXlUrlGVD/MFC6c@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg7zzUSTUvbdyrQVhZAQKCE3I3lGhhahlW0PykgjYYjrWZiDKP
	ByS3ZkRK3GXxMd8gBgATthWOtXDnjtUKkZC+XgDkLNp+1Uc/XnYON1bgJ+OFGzB/QD4=
X-Gm-Gg: ASbGncv7YLFiTbM5APDwTO1//RlTlBf3clVYSYTOsOSRck5Gazk2c28DPgvHC7qZdOt
	53vb+wY/q/nWImfdDittQFSg6GJSW8o7fNU7LzdPf9NkVafUOBAmh4BQdXgxfeh6OfLOygHwZF6
	UizpS7lD8ILdAYqzsauF1Woo/aCZkBG7kLDhA8Kv88VzdOGMJeTin++6aypSAF6dw8aBU18QDuT
	pylr6qiOZcmc9xN3rQ7SEpM9x7CMk/Bpd06s9CPDOBNjiq+ehpebFYApQF9IfR3NtUxyCd+LbNF
	/hebERnFLaWry4o38TYA2hJMi9MTUoe9+jAiqmc477cWI/vOWbTK7DxDjriuINfNY5JhuXD/mxq
	vzMMNyyVQ553ZWDAu8LYzeWC60weBW0svQEtU7nqFjgH/hOWspsm0vXNzEVmJ7T1WwZkDoeKtmI
	ymgJaPjS8QX0ob/cKovxaZg2Vhh5g8rPmqINjV/HVtAgw3neh6tjzP
X-Google-Smtp-Source: AGHT+IH0yKFYlADFFoNgI+vt5Nvr3682vUUZksEIjYehH1HnbB5yCLv9XtMdyOspZEkknqy2NTGIgA==
X-Received: by 2002:a05:600c:c84:b0:46e:3f75:da49 with SMTP id 5b1f17b1804b1-477732a1d2bmr55933905e9.37.1762772649975;
        Mon, 10 Nov 2025 03:04:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:f168:a23e:c1b2:ae61? ([2a01:e0a:3d9:2080:f168:a23e:c1b2:ae61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47763e4f13dsm106249415e9.5.2025.11.10.03.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 03:04:09 -0800 (PST)
Message-ID: <3c98a3f1-ca68-41ed-a8bb-f99a57ac57d7@linaro.org>
Date: Mon, 10 Nov 2025 12:04:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] PCI: meson: Remove meson_pcie_link_up() timeout, message,
 speed check
To: Bjorn Helgaas <helgaas@kernel.org>, Yue Wang <yue.wang@Amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Linnaea Lavia <linnaea-von-lavia@live.com>, FUKAUMI Naoki <naoki@radxa.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, stable@vger.kernel.org
References: <20251103221930.1831376-1-helgaas@kernel.org>
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
In-Reply-To: <20251103221930.1831376-1-helgaas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_030412_249028_F6DC6C96 
X-CRM114-Status: GOOD (  19.83  )
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

On 11/3/25 23:19, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Previously meson_pcie_link_up() only returned true if the link was in the
> L0 state.  This was incorrect because hardware autonomously manages
> transitions between L0, L0s, and L1 while both components on the link stay
> in D0.  Those states should all be treated as "link is active".
> 
> Returning false when the device was in L0s or L1 broke config accesses
> because dw_pcie_other_conf_map_bus() fails if the link is down, which
> caused errors like this:
> 
>    meson-pcie fc000000.pcie: error: wait linkup timeout
>    pci 0000:01:00.0: BAR 0: error updating (0xfc700004 != 0xffffffff)
> 
> Remove the LTSSM state check, timeout, speed check, and error message from
> meson_pcie_link_up(), the dw_pcie_ops.link_up() method, so it is a simple
> boolean check of whether the link is active.  Timeouts and and error
> messages are handled at a higher level, e.g., dw_pcie_wait_for_link().
> 
> Fixes: 9c0ef6d34fdb ("PCI: amlogic: Add the Amlogic Meson PCIe controller driver")
> Reported-by: Linnaea Lavia <linnaea-von-lavia@live.com>
> Closes: https://lore.kernel.org/r/DM4PR05MB102707B8CDF84D776C39F22F2C7F0A@DM4PR05MB10270.namprd05.prod.outlook.com
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Tested-by: Linnaea Lavia <linnaea-von-lavia@live.com>
> Cc: stable@vger.kernel.org
> ---
>   drivers/pci/controller/dwc/pci-meson.c | 36 +++-----------------------
>   1 file changed, 3 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> index 787469d1b396..13685d89227a 100644
> --- a/drivers/pci/controller/dwc/pci-meson.c
> +++ b/drivers/pci/controller/dwc/pci-meson.c
> @@ -338,40 +338,10 @@ static struct pci_ops meson_pci_ops = {
>   static bool meson_pcie_link_up(struct dw_pcie *pci)
>   {
>   	struct meson_pcie *mp = to_meson_pcie(pci);
> -	struct device *dev = pci->dev;
> -	u32 speed_okay = 0;
> -	u32 cnt = 0;
> -	u32 state12, state17, smlh_up, ltssm_up, rdlh_up;
> +	u32 state12;
>   
> -	do {
> -		state12 = meson_cfg_readl(mp, PCIE_CFG_STATUS12);
> -		state17 = meson_cfg_readl(mp, PCIE_CFG_STATUS17);
> -		smlh_up = IS_SMLH_LINK_UP(state12);
> -		rdlh_up = IS_RDLH_LINK_UP(state12);
> -		ltssm_up = IS_LTSSM_UP(state12);
> -
> -		if (PM_CURRENT_STATE(state17) < PCIE_GEN3)
> -			speed_okay = 1;
> -
> -		if (smlh_up)
> -			dev_dbg(dev, "smlh_link_up is on\n");
> -		if (rdlh_up)
> -			dev_dbg(dev, "rdlh_link_up is on\n");
> -		if (ltssm_up)
> -			dev_dbg(dev, "ltssm_up is on\n");
> -		if (speed_okay)
> -			dev_dbg(dev, "speed_okay\n");
> -
> -		if (smlh_up && rdlh_up && ltssm_up && speed_okay)
> -			return true;
> -
> -		cnt++;
> -
> -		udelay(10);
> -	} while (cnt < WAIT_LINKUP_TIMEOUT);
> -
> -	dev_err(dev, "error: wait linkup timeout\n");
> -	return false;
> +	state12 = meson_cfg_readl(mp, PCIE_CFG_STATUS12);
> +	return IS_SMLH_LINK_UP(state12) && IS_RDLH_LINK_UP(state12);
>   }
>   
>   static int meson_pcie_host_init(struct dw_pcie_rp *pp)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on BananaPi M2S

Thanks !

Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
