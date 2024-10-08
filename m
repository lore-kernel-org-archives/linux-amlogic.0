Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D77CED274
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2024 07:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2k2vOI3NTas2pOt8QoGhklpqCI6sYgGwUtjpXPHR7Lk=; b=yjWQVPlpXWVhwYPuwP7GHNXRYP
	MXwDnm51WIHcOxhn2dXpz30RxbCp74ehZbiFfsO2dmePIfSatCSevrT0QsPXojI9VOn7gFFuUAqkH
	cTuy2WKWokuNHZubcAj12CjRbhoUDwrIOlAjmEo0uEs3I2LnKSdMphWyU012A8EV+/myvbZ2WoxU4
	u+sIvrkc3WEZrxFve4cwGPOYLs71SLggPMK3rEQdIUKo4hAyVxnNIio8XdYSLyoNvezQgf9asHMd5
	OxyFPcllwcj8iBaqWZjriMgxEhlXMZSQOn7qgCH59OAgo/5w5Zr+GbxBT51tfnx0Gql8ZhItSYAvB
	dX16Y50A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4cM-00000004mvY-3Y0q;
	Tue, 08 Oct 2024 07:26:50 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4ai-00000004mhJ-2msO
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Oct 2024 07:25:10 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-42cd46f3a26so46125945e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Oct 2024 00:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728372307; x=1728977107; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5e0vB/xfUb5KsKbGyPnOatGTMRs7uojzkUVkiPqJNdc=;
        b=CJ6Ied/sRO11TacvHjzCbz09C84MEBTZ5ikmvBMfqLIlpOvCaViEdyIZSpiTfcsgZe
         IcCWQedd/cZsppLjUtnajHPdpCfflS3G+6NystMqSNw4rxNd+4Q9tczhVaiaupre812/
         2VUBHXzD1cNfopiHMPdNdt1GKHNVcA9OJ4uWxIaJ5EMaMPna8cPwwJjTK7rm3mPX3YR0
         E9gvFvyUiWmwkLXhAukx43WSUqsuPgwCZzme7X4FwApQR3ESjVpC2fERFdi4uYYnsKPf
         g2URGk7EH8O8Vp3BZBGPXyD4TKxv84gKRecMonvD84pHN4mxVbbL6X6MI94fxdyaISSE
         0F9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728372307; x=1728977107;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5e0vB/xfUb5KsKbGyPnOatGTMRs7uojzkUVkiPqJNdc=;
        b=aNtNZx+lCQ7vxiVMVym1tBHLxDbq4P15ENRi2//7GwlMOHO2FgUVTss/51Cc7ZhZet
         D/ECmzdyVdax3Ic+hMlX90g264qpSh2L7beEHos3p3/OhOV15qp7YjeNjDKw5WKZ4wiS
         rgszvLiNLZ0HVgcQP/T41Y2MfHkxt1zi4DDjmyRx1SwSE3NNqBCQDsbmYZZ6OwxlV+bg
         WAUzxYRUDA/BXsI6JAOfO7C5ExlwztFOZHUmgrR0UDYXTty3ehW3RWzXDXa2F059xdYy
         yg8T7wmPPW4WBaC0uOJgZ+XKl6WJKfiTlKBvXwRlqnAC43GP+Z0P7Kt+OHnk+EwDZ1Ge
         Ey9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTeY85gANr/FyIhggGEay5gZdmArg29cQXgDzZ2zcPTd1lkkNQB6cpMFDj+TPdmU1iZM5nv2KW+l1oF7tU@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ801/MqheaZQQbY2uXds4FhHAACk/+3rHmRf4xqiJ9D7QEPQh
	HV6vRMarFUs3Wy4yh2NO4mcene7Pv0hXzgQIifw5hcn3CkILJaAwvvR5t1LGp8k=
X-Google-Smtp-Source: AGHT+IGKJyKn1CkE8ieX0UPcPGOpB+0hJcZaEl/FBijOrKGtn1bkOSUkYtwO+y6Clre3YaP2L94JBQ==
X-Received: by 2002:a05:600c:3b95:b0:430:5406:a60d with SMTP id 5b1f17b1804b1-4305406a73amr4563595e9.23.1728372306816;
        Tue, 08 Oct 2024 00:25:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4595:23ef:4ba2:2d19? ([2a01:e0a:982:cbb0:4595:23ef:4ba2:2d19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f89e8a25csm100160435e9.17.2024.10.08.00.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 00:25:06 -0700 (PDT)
Message-ID: <356bf96a-862a-4b66-bb63-92127ef5d84f@linaro.org>
Date: Tue, 8 Oct 2024 09:25:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: mmc: controller: move properties
 common with slot out to mmc-controller-common
To: Rob Herring <robh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-0-ad4eb22c2a8d@linaro.org>
 <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-1-ad4eb22c2a8d@linaro.org>
 <20241007200230.GA2301832-robh@kernel.org>
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
In-Reply-To: <20241007200230.GA2301832-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_002508_745772_BE3CC829 
X-CRM114-Status: GOOD (  15.33  )
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

On 07/10/2024 22:02, Rob Herring wrote:
> On Mon, Oct 07, 2024 at 04:03:37PM +0200, Neil Armstrong wrote:
>> Move the common MMC "slot" properties because they are shared by the
>> single-slot or multi-slot controllers, and will help defining a simple
>> mmc-slot bindings document with proper slot properties and nodename.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../bindings/mmc/mmc-controller-common.yaml        | 357 +++++++++++++++++++++
>>   .../devicetree/bindings/mmc/mmc-controller.yaml    | 344 +-------------------
>>   2 files changed, 360 insertions(+), 341 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>> new file mode 100644
>> index 000000000000..e02d3cbcc271
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>> @@ -0,0 +1,357 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mmc/mmc-controller-common.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MMC Controller & Slots Common Properties
>> +
>> +maintainers:
>> +  - Ulf Hansson <ulf.hansson@linaro.org>
>> +
>> +description: |
>> +  These properties are common to multiple MMC host controllers and the
>> +  possible slots or ports for multi-slot controllers.
>> +
>> +properties:
>> +  "#address-cells":
>> +    const: 1
>> +    description: |
>> +      The cell is the slot ID if a function subnode is used.
> 
> Actually, this comment is wrong. When slot is used, this is still the
> cell size for the mmc bus.

OK, not sure how it should be fixed, and it should be fixed before this serie.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
