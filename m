Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44194CD8CA8
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Jun 2026 06:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1KOvNd0ZusY1XY/3okaoCy9Cvjce/9FaBIUGt8cFFw=; b=dggiJXfuhK0yHnfoB261zaRVMP
	tj0zO2QE54m84LuGeOKQn/DO+Dr1z4jGHWH5vyj8/li+5aLDWZbAk2FfcF5oaRQKa8OMn9nXyBTke
	boCxRi2JkfmmrPOjxhuLHNR0s1H2BwNE95sG//HEqtCB7woBSt6Hh0KzKlwCMBadVcMCNaDDNeE5H
	oZQxowZZg+1dXRGMhmHrtZ1LxlB0U/umVNYDu+lYL6c/fftmzWhyWY/4/yFFlLMjbXXOvNXrpQhqa
	Dk/fh4IuGsTsUMe4xuTHzYMJZH6uQiutsvHp5zDl24JKNg85iCyyQ8DDjdQUkig6oFFJkzpXbA6Bs
	Cw60oE4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMw7-0000000FHbz-1S5C;
	Tue, 16 Jun 2026 06:06:11 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMw4-0000000FHbC-1BPr
	for linux-amlogic@lists.infradead.org;
	Tue, 16 Jun 2026 06:06:09 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-490b613a17bso37405505e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 15 Jun 2026 23:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781589966; x=1782194766; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d3BJdilVoM5GU6RaftGRrjnToveeVu99NI9zfibDhTk=;
        b=kZTHt3Rqilfhpoc1DfyjoFegRQPXvQro/r1E7kqYX5m0LRFiU8Fz6yIEDGNgBHLdTr
         WP2zUqTvGLrdyMaAmBTACC1qU798iO3NzQJbfBhGFjWsS1jn6Vxgk4IZExI2WP/wbriK
         yS2uaeOENsMNhkL2k5lYbz2ZoT9KkN+PvDjWFnkk5THy8KkWtb+276Xw0AYhxDQy6Hfh
         IvQKxUdezMMv4K3LULrZvFWw4zFDNQX7REQAsG9JX4J9Gyzb6YlO79V88Z3oJa1jLf2D
         UEtc3TtAUTrt3HySfNKdcVYSt6UDxNa0LdoPqCdXa9WWR6wGfN0HdEafRDv1rcKOdH/H
         3koQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781589966; x=1782194766;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3BJdilVoM5GU6RaftGRrjnToveeVu99NI9zfibDhTk=;
        b=KzDlWuE+5C23IN76dDVRHsZwfinDgr7u6wagtIt10bHbaNzEo+zsGVulMUEwqo/0Ax
         RCKccrrjGlPnyvkFe5ScOuAtJnIdmJQwcgecOKBSKG5FFqRLVY65kXPLSkCnOBVZHW0j
         C7vt6f7yJRfaGlavwvWxs60HXpLJgZzycaXrYBNXC/a+IY0y6cyn0ohaAE+3431PeU+m
         ocJyRVjWQRt1eU3A7IWTFrIUHOcAAofkZzB0/iy5SekN+27Jz0mTSvSpvyVmKjoicpMn
         9TcgegxHPFpI4jbTT+QfHS5tjI64v7jd43sRq4Iso9FZfzDOQvtZq3J1gw2/9TPoL8yX
         KA5A==
X-Forwarded-Encrypted: i=1; AFNElJ8swauMplGXAh/8lkgoHE3SMA/SwoG1Oz3ojlS1y6aPPtNcLWl0lUrvdxLP6OWGz/szqBn5/KuRC8/2uVnc@lists.infradead.org
X-Gm-Message-State: AOJu0YwAkKULydvz1mihMDU8Vv4N08uB1sOoOIc9vGDTHeNYBKZu/4g+
	Q0MK1HWMHT6LaDrTQ+yc46SeyJjx9sWKNFYq87qz+HHWXLQJ6JaCj/mkcylG82q8F1A=
X-Gm-Gg: Acq92OF4pknQDHFYpUnN4a4T4Vgybxcahn0NDdVbmcVC9LD2vVM1TdWGKCv3hubaHnY
	8rrBNUk7dX0ITrBbaBD4ZQEY+TRa5N1w7w3vJvNjpq41f3cjMpE2RnaXgysG/prDrDwWIIpUST6
	Bl2cBYyo9DmNf+KrU3O7nhTWSCFeSIHvrWoKK8a7vKNobe0OxkDWygAKzV80uWagtMcn4uGFXWx
	1aXM9DSs2RVJtlBMMOaUi1YoMbr8/visXHTDIubHO04KMw2pCuFO27X3Ib92K3zARybb+Pt+c8V
	dWiUhzhl4jTQn2vuJZptbj9DKY9fhoIm4Q4sTqLvTyKkgZ5C8eJsmDNA63zubH7RI9YUk2nQUCE
	MhwBFnbv7GuO5AtIEpJ7iYB2/Wgl9Lpx1PGpMPlQ9HXuQ2l3yKYunJXMv6ds7YrHgTVAtQpSTxf
	hlkUpV6k4N+ZRWvkfdIVc7gibImhIDBsMP
X-Received: by 2002:a05:600c:46cf:b0:490:b6a4:9f43 with SMTP id 5b1f17b1804b1-4922ff8ee49mr30603825e9.7.1781589964995;
        Mon, 15 Jun 2026 23:06:04 -0700 (PDT)
Received: from [172.20.10.3] ([37.167.70.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa891acsm51925935e9.9.2026.06.15.23.06.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 23:06:04 -0700 (PDT)
Message-ID: <b2d8cb85-5529-4a4c-a233-64ca7a436f0b@linaro.org>
Date: Tue, 16 Jun 2026 08:06:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] PCI: meson: Fix PERST# timing by asserting reset before
 LTSSM enable
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Gowtham Kudupudi <gowtham@ferryfair.com>
Cc: robh@kernel.org, bhelgaas@google.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 yue.wang@Amlogic.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org
References: <20260614015620.20432-1-gowtham@ferryfair.com>
 <84cc8b0c-da06-4d01-a076-9743c29c91f6@aliel.fr>
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
In-Reply-To: <84cc8b0c-da06-4d01-a076-9743c29c91f6@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_230608_368146_0CA60F91 
X-CRM114-Status: GOOD (  17.11  )
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

On 6/15/26 12:34, Ronald Claveau wrote:
> On 6/14/26 3:56 AM, Gowtham Kudupudi wrote:
>> On warm reboot, the PCIe controller's LTSSM starts link training
>> immediately if PERST# is already deasserted from the previous boot.
>> The driver then pulses PERST# for only 500us, which is too short to
>> properly reset the endpoint device that has already started training.
>>
>> Fix by moving the PERST# assert/deassert pulse BEFORE enabling LTSSM,
>> so the endpoint gets a clean reset cycle before link training begins.
>>
>> This was found on Amlogic G12B (A311D) with NVMe on an M.2 slot.
>> Cold boot worked because POR held PERST# low; warm reboot did not.
>> The fix was confirmed on a Banana Pi CM4 with Waveshare IO base board.
>>
>> Signed-off-by: Gowtham Kudupudi <gowtham@ferryfair.com>
>> ---
>>   drivers/pci/controller/dwc/pci-meson.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
>> index 5f8e2f4b3c12..3a7e9f1d5b8c 100644
>> --- a/drivers/pci/controller/dwc/pci-meson.c
>> +++ b/drivers/pci/controller/dwc/pci-meson.c
>> @@ -310,8 +310,8 @@ static int meson_pcie_start_link(struct dw_pcie *pci)
>>   {
>>   	struct meson_pcie *mp = to_meson_pcie(pci);
>>   
>> +	meson_pcie_assert_reset(mp);
>>   	meson_pcie_ltssm_enable(mp);
>> -	meson_pcie_assert_reset(mp);

I think this change is valid, other controllers resets PERST
in the host init callback, so either this or move to the
init callback.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

>>   
>>   	return 0;
>>   }
> 
> Hi Gowtham,
> 
> I have a patch [1] that I haven't submitted yet.
> This might be related to your issue, what do you think ?

Ronald, This fix is valid, it's definitely better to probe the
driver with PERST asserted, please send it.

Neil

> 
> [1] https://github.com/rclaveau-tech/linux-khadas/commit/bee0a02d9756
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
