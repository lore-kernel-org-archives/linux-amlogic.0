Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D5CC4167D
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Nov 2023 14:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3fhj1s9/1nj+t605mqEkN3TqJLGVrDy9kJvijLEXJM=; b=MKdi1/Ul3CDM7cO7M4jdl2ytjb
	p5qjhqIftUZS5rOzhJ8k0aSTu1hHwMJv/d4PXouL2QhAiKruOokCRFUnZsXtohM5ikFPFrgHibFxF
	/1pv/8XXc8tRDpFCQSYBwnqwVCgIdPoqVhY65jm54EdyaenfHw1OHT591J+rqKNKeyndJmrOWkuAz
	UXDZRzHg05PbTM9egwHJSVCSA4GHP70P27Q/BZXRScwi7Fmf7n+litxI5Yw3NypvUowm0LVdj0sOz
	9RcZtwZ2v9uszfqAkc9Fl4H6FIR+qiz0rs/lEZuQfPZo9a9wKLfQClUkhHfaBV+Pec7GGFpad8aPC
	abuJE0EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2u5q-00G8AF-0u;
	Tue, 14 Nov 2023 14:08:42 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2u5n-00G88f-0L
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Nov 2023 14:08:40 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-408382da7f0so46974585e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Nov 2023 06:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699970918; x=1700575718; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oqf6gytLqFb8qEPqoHx08oC5AruJuDr18v95ngS2z6E=;
        b=ZXxTGGm7Moz7YLI24vk0Y6EOAwwm0+44E+TR51QsDLnDWtaZlCEayN79eoZSXZ/CAO
         DxLShM8HeZ1IwF0yg/Kt25xOb9T4m7rvs9AMftBdaBlrph/kcateFQ62Y3uqVykZAyu7
         VSZOGDDoOcC6bqs1pam6yyRIBmLS4PlPKizAToHrTtMZeu/lgvdzBZ5eS2ZFwvxVt/FJ
         qUM6BFBZxPGZCAI/feLVmaxdOgeiolN+TExHDw1Tepht3FEnUUPj4gaOhmWUwcDjVegG
         /YO0xy5z830JCOfXaEVyGmfWmYkKFz67by7vjWGXMSOa/3iFt8dl2p4VyfgYfuxg2+C9
         fKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699970918; x=1700575718;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Oqf6gytLqFb8qEPqoHx08oC5AruJuDr18v95ngS2z6E=;
        b=FK5h5w6ofA8DBYioJyfG8xRrhuN60Hesk1Y3k9RYW+QuFIDNiugPkEJE+ls8coPIIv
         +P1oGGffzi5G9k7O/UfPmJxgwyrjqr69tDtFdPdOb4Q1fcjOR8TeED79uSLsEgzAaiOj
         qAm+VhjwjjNx3jnbs2kU2vk1moymT745A7w+UjzUfgXev7J/itnNN7bumphHD/IyaznY
         4Cu4F2CaOfKu5hzpM93jP6fATF1z0ijPvBIqpzf3BIaMMqWsxfXURPwG8Gh4R1YcH170
         veJppvuH3KjI4htnqWIXkNN775EvnOMuqtasGGPIQslyRg7DBIjGsXbdbVwwqdfA2BMa
         bLeQ==
X-Gm-Message-State: AOJu0YxbfjTJN3rCkgR+LaWrhtOcyOqrB5gtlsvHQLLCY9MBocenPTZ7
	aI7PkZ8lp6XrDs8fGLlQoxg0CQ==
X-Google-Smtp-Source: AGHT+IFTU2lq4vDw46y+DKgUmMqgoWFvNm96LbGHVmRkHynSA3vr4y39kjkdpLQGvpzK9zKQ5nKYPg==
X-Received: by 2002:a05:600c:4715:b0:40a:42dd:c82c with SMTP id v21-20020a05600c471500b0040a42ddc82cmr7754829wmo.27.1699970917579;
        Tue, 14 Nov 2023 06:08:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:a90d:d9d5:9399:5adf? ([2a01:e0a:982:cbb0:a90d:d9d5:9399:5adf])
        by smtp.gmail.com with ESMTPSA id y7-20020a1c4b07000000b003fe1fe56202sm11435423wma.33.2023.11.14.06.08.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 06:08:37 -0800 (PST)
Message-ID: <c45a3094-501f-408d-9bef-7e634f99185e@linaro.org>
Date: Tue, 14 Nov 2023 15:08:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v8 04/12] dt-bindings: phy: amlogic,g12a-mipi-dphy-analog:
 drop unneeded reg property and example
Content-Language: en-US, fr
To: Rob Herring <robh@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jagan Teki <jagan@amarulasolutions.com>, Nicolas Belin
 <nbelin@baylibre.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
 <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-4-81e4aeeda193@linaro.org>
 <20231110205716.GA413638-robh@kernel.org>
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
In-Reply-To: <20231110205716.GA413638-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_060839_143914_D65F49BA 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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

On 10/11/2023 21:57, Rob Herring wrote:
> On Thu, Nov 09, 2023 at 10:00:05AM +0100, Neil Armstrong wrote:
>> Now this bindings is referred from amlogic,meson-gx-hhi-sysctrl.yaml and is
>> documented as a subnode of a simple-mfd, drop the invalid reg property.
> 
> Why is it invalid? It's preferred to have 'reg' in MFDs even if Linux
> doesn't use them. If there's a chunk of registers you can define, then
> do so. If it's all register bit soup, then fine, omit it.

I still don't understand why this particular MFD subnode needs a reg and not
the other ones, using reg would need adding #address-cells/#size-cells on top
node and change all examples/DT for nothing.

Like the other meson-gx-hhi-sysctrl subnodes, it's a register bit soup and this
one is no exception.

Neil

> 
> Rob


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
