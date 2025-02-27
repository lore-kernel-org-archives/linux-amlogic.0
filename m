Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E92C197BF
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Feb 2025 19:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YzMdQ1B/ImeuJ1E6AEua6mrVvhe8/wuAliwGa/xKugo=; b=Qq8nMSJkEhElTx5Zg/rvt5Kime
	VSc+WoS/wIIskGNjGmAcl4NaEK9+HOCM2RcjKCr+AswaQkK3/nnU55NpRS6eIe19mcuyteBFRhEd7
	gN0JBiwNzj7BLV8Sxew5Sw88JfSC6zNk4nUWqAkPR0Hl3FEnADOTmezRvcPZeUYuO4R0/gGH6Dnra
	FoFdZLIkd+5D8li8r2W4iUTAN3FNupKDE6hnCh1mKb9RQ6WdBkeUyGEm5tEDg9y1sJOu+2EE6jLXL
	WfYDwiAGKBhRI9f5EVYKdafh96fGir/K5ykU+nOnlh60zkwv+moLkjbSfjomMEUDFM0edF0fZ1ZRa
	74+8Hb/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjh2-00000008Tez-47D5;
	Thu, 27 Feb 2025 19:37:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf2R-00000007m81-3fIU
	for linux-amlogic@bombadil.infradead.org;
	Thu, 27 Feb 2025 14:39:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=gDcODo9ERLNHFPyFhG+ldH6uGhEwuHVDSakPGts/Q/0=; b=mCVXGvg6SY8y3Sk8myoB+vU6sR
	GEX8cYN5gmLJPy+a2k119y3qkGRB2W1CRvV6Iz3uOyXPO4WheRFrbUgwZzavK48aixhp/IrtWrHqf
	H0wvMbfzYJWLkeTBXqWuHhApFft4E4Y4ovgW0fWCpD3e/p8GDTK3GzMR/u8Azc1shGUGEaaViF1iC
	Z6OLtNxZfXLiXFKTNOXhxJPsqP7oPILrZfWX4SEcFXNK4+OdjfrpmDA/q3lIbyIn2EU/vGCMzTc1D
	5APAzyetDpiaxmwKptomQnWnD8Y7uF1wChoCm13EFQSJO9bYuUqnuACTaPW0bDOQj5PjXNomJPhA3
	CXyoTYxg==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf2O-00000003oUn-37KT
	for linux-amlogic@lists.infradead.org;
	Thu, 27 Feb 2025 14:38:58 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38f24fc466aso615005f8f.2
        for <linux-amlogic@lists.infradead.org>; Thu, 27 Feb 2025 06:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740667135; x=1741271935; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDcODo9ERLNHFPyFhG+ldH6uGhEwuHVDSakPGts/Q/0=;
        b=Wu3JZHtHjfwYM3iNoNJ3Du810P2j99ayih/1eMlUscTLnaPQcdskI9E0GP/nEae7uU
         rRhronlydlgdmFQPLu/6WNAFM3YCZYqFjKxBU9214vD8XW7ALqkpnmAPHvyJ69zWivhL
         46jyj7ViS8fH3k1GDtUcAn2QoLRW+j0uqj23GJ6+emMKUrCW0qjO9LZ9sX6drS3zeROt
         SWUo0HPcghAFT4R8a97v/lWT71KeG8eegGoosSWmrzWEsKrGBuTVwdlfF7qkbyBjTNuG
         LG3SL58b+TuBarikhCR5sk7LYLWXHWxqw0IYa6HmRbw7tdi4pZJNmdB5ezvrqxKIfcEB
         0jPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740667135; x=1741271935;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gDcODo9ERLNHFPyFhG+ldH6uGhEwuHVDSakPGts/Q/0=;
        b=ldkeh7irpExs2aEyfCZ5DJfOf91Jq/SzD89cEgy6ngPltI18GFVl9xXfNarShwIh7t
         OKGbVfCHctIbsyiKQeWBNM6dPRVqYy5hAJqKDppXUicA2JAChDb16dAebdOZqTcAwz/b
         OlCCh51uNFza2nWMV8wYPDMCHGJMN5KdUiqeQ+/OfsVUHXf91hbqqjHLTOMzp+hkS3Xo
         Voh40omvHowauPQkTllr9unVeHV39pgGwg2nWRjwP77fPCUEqdN3EHLbasuH4/Ku3pmz
         DBgY5ABIkRT7oP3q0WaTi+BDKglh9RLUCMc8LokUwTwCzY4ghuU0i3ZwWmc4j/fq3Mqx
         gV1A==
X-Forwarded-Encrypted: i=1; AJvYcCW0pv53uUDAZbEIyqZoJQEzOruizXI9nOEq8gNypgUmkMJVCVh5Z/U7cg2mTOwN4LSk1X/iQI6VBIH8dCA6@lists.infradead.org
X-Gm-Message-State: AOJu0YxCig6iCHPQCFFvqYBUuZbv6MhMvNL4DTgm77VH4+PX2ekgU4R/
	6D4rIIq2q4CiGTTghmqtb9wmc9tGeNs09Yn34Ed7zGcTCCLiXofOB3K7erK4FxQ=
X-Gm-Gg: ASbGncvlcVVrNdFxDUNULktVn49+gtloLPeR5kOBaMnJ1z4+fKMvI84murVt1lOraxj
	FGR+wmG3KjgMEvHXp3OYL4bwl/EFbizioVeN6IQuCp/5QGVAvHzUQWnqNgj3pjx9fZ6svhrrPw7
	rJSWYybqS85WqnYK7PonBxHVejY+0GuYl+qw3aXl26FoqiY5/Gd7uazL7EuFXkBGH2bcMeIADOh
	sxIlzfXw++g87QJ6Bs5otjyP56DdHBzR130R89Pd/h5zmL/Z/hI/Gvpz3y0XfwfAcK2Glxs81ij
	ktViaBBg3vJljWQknKXKVTwiTYKb+wo76gD656hgQVriBrfW4Q+7uBaHnnzJvUxRTIJs6svDE3N
	Yjrk=
X-Google-Smtp-Source: AGHT+IGglvD0BjLjUSReKQ3M4zIhgXtSEWvSxDygsXG0F96YWhydQ0BMAYxWezFgG1DgXlMFXIW6VA==
X-Received: by 2002:a05:6000:1541:b0:38d:e48b:1783 with SMTP id ffacd0b85a97d-38f70825febmr20148963f8f.42.1740667134786;
        Thu, 27 Feb 2025 06:38:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5de:e7f3:73c7:7958? ([2a01:e0a:982:cbb0:c5de:e7f3:73c7:7958])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba58713bsm59521635e9.34.2025.02.27.06.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 06:38:54 -0800 (PST)
Message-ID: <f21edb2c-e49d-4448-a25d-fb75f44c902a@linaro.org>
Date: Thu, 27 Feb 2025 15:38:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH net-next 10/11] net: stmmac: meson: switch to use
 set_clk_tx_rate() hook
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
 <E1tna0z-0052tN-O1@rmk-PC.armlinux.org.uk>
 <2198e689-ed38-4842-9964-dca42468088a@linaro.org>
 <Z8B4OSbY954Zy37S@shell.armlinux.org.uk>
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
In-Reply-To: <Z8B4OSbY954Zy37S@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_143856_935294_F342492D 
X-CRM114-Status: GOOD (  18.14  )
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

On 27/02/2025 15:35, Russell King (Oracle) wrote:
> On Thu, Feb 27, 2025 at 03:18:22PM +0100, Neil Armstrong wrote:
>> Hi,
>>
>> On 27/02/2025 10:17, Russell King (Oracle) wrote:
>>> Switch from using the fix_mac_speed() hook to set_clk_tx_rate() to
>>> manage the transmit clock.
>>>
>>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>>> ---
>>>    drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c | 9 ++++++---
>>>    1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
>>> index b115b7873cef..07c504d07604 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
>>> @@ -22,9 +22,10 @@ struct meson_dwmac {
>>>    	void __iomem	*reg;
>>>    };
>>> -static void meson6_dwmac_fix_mac_speed(void *priv, int speed, unsigned int mode)
>>> +static int meson6_dwmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
>>> +					phy_interface_t interface, int speed)
>>
>> You can keep priv as first argument name and remove the next changes
> 
> I *can* but I don't want to. Inside the bulk of the stmmac driver,
> "priv" is used with struct stmmac_priv. "plat_dat" is used with
> struct plat_stmmacenet_data.

Right, it's still an unrelated change in this case.

> 
> Having different parts of the driver use the same local variable
> name for different structures is confusing, and has already lead to
> errors. Consistency is key. This is called "bsp_priv" in
> struct plat_stmmacenet_data, and therefore it should be referred to
> as "bsp_priv".
> 
> I am not yet going to be doing a big rename, but it *will* come in
> time.
> 

Doing it in a big rename patch would be much better indeed.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
