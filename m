Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D235CFB43F
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2024 09:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T5dAX8XURJ62rYtPj+QRfphnrj3dtHuFzWl+gbw1K5g=; b=axH6+zsUcPnrYHsq5hHGH55NxB
	S5aOF6OtB6OiDILwv72AAfD/I3Fc1nZVU/dHgq2rJktgLgMMJNvSRJQD6EeUN8WD+QUgmYiaoaHxZ
	UrjhIY+1w7y6hRxGe4BEDZcMAO5Ta4FQ/PKcEDjBNCn893HaMZD8roM6UXKI0GDvx09CIf25/GZ6I
	rldxZb5X5Lfcka5lQWYMl8E6QF5fodME3LOl7sG4TiYq8Tuky/63ndFDU4/9b2M73ikpep0Oxin4B
	ej6gCMEnTqsTG39hjjLneqSluNxgcjgHxEOMVsTgUf3153Sis7wQ++eRgZTAIHyCi4QhBvVam8JLR
	AtAnvgIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxjcT-00000001rk6-1C0B;
	Mon, 07 Oct 2024 09:01:33 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxjbM-00000001raP-20Ze
	for linux-amlogic@lists.infradead.org;
	Mon, 07 Oct 2024 09:00:25 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-37ccebd7f0dso2760224f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 07 Oct 2024 02:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728291622; x=1728896422; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EpuhbLasEadVeMuVqG8sosX+rym3WCHEJ89sUQ5d+fI=;
        b=b1rNcu1Wjyvnwm7C6fgI3q2OWfvn/aHvHOSydYcnE34tpb5hqj7jEsHGvXb34BE+0O
         JWqoEiY3L37L50iAMiRJiTPecfkL2xNqIkJt8lArpXjVb7lqUjwiwbhLYxVB+J+qNPKk
         fyzV5maEkcGxXiRh9tx7YjjeSFU1Mca3il92oRj/q53qG4Ifw0rGfxkNTblywAbXIf9c
         zJq4TPRtQ09fOuXcD66yBln60aAMAtzwug1/F8Nco2g1qhBce7RmimxJBwK5lT3xztQd
         mk3k4SQERXCBDMKDbAVGUCmD/s/9jmWzfe7nirOY74ggnv3cfRG3BPvxZZxDx0lV9rPn
         1uPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728291622; x=1728896422;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EpuhbLasEadVeMuVqG8sosX+rym3WCHEJ89sUQ5d+fI=;
        b=t3EekhrfPmQpDcqwjzHzKAtXp+NINYt/FVXIicoIuDMFnvCrWaD7+/vmwzF5jw9ykU
         +LCafGp101xja12iEfH0jjyGxxK1+SwsDxUWzALAyGCtdLMQdA6fHTtSm127vAoyucW+
         N4TxazbkVzi/sG71Do4POHp/aFEDx60tapA08bo7IQCxnSSXRSZ6a9AnjTdLypHxrmQj
         jmnocoK0qd9iClcGX0CAX7eRDt0rMupluqWCm8XWE3vwQeNYfUpkNis6ySAxHEJBCDve
         bpXwRtS9Z4Xg02KTrp5HnbU/ianInoCgrwtyEECUoaclPsz8jm9pMwwFxiVYZ5E1jtfX
         T2LQ==
X-Forwarded-Encrypted: i=1; AJvYcCW816gMr4ud3Bb6EKWnZyOvGNRmv22yY/GRa35by8A+5OKOBxOfA0zg3N1MB5cthH0/s2uSII2AF3AeG3gt@lists.infradead.org
X-Gm-Message-State: AOJu0YwiG9ajs/gLMK2p+ftzlesRTb2YbkRBEy38Mx0pCIhXHjIHn2EJ
	jse8w3GXhe17x9kiSWWRMAlQD6cZninmMDTzszx2V1dLla8w6Erm2s5CsYUSWBo=
X-Google-Smtp-Source: AGHT+IHjPdkrn1WCWqVQPWn/3AXhMdcCGbb+rmueJ3DkfERdPUW77sBkwqH9tc7v+VJ0Q+jVuYVwxg==
X-Received: by 2002:a5d:4eca:0:b0:37c:cc67:8b1f with SMTP id ffacd0b85a97d-37d0e8de221mr6087900f8f.48.1728291609655;
        Mon, 07 Oct 2024 02:00:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a99f:3c24:fa3b:1e7? ([2a01:e0a:982:cbb0:a99f:3c24:fa3b:1e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1691a4eesm5210437f8f.31.2024.10.07.02.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 02:00:08 -0700 (PDT)
Message-ID: <818f287d-4ea5-4899-b4a9-98accc1be049@linaro.org>
Date: Mon, 7 Oct 2024 11:00:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: mmc: controller: allow node name to
 be named slot@*
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-0-5aa8bdfe01af@linaro.org>
 <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-1-5aa8bdfe01af@linaro.org>
 <qt3ivwsa3uaidcgkzbd2ewohbyd6zbzseraihftdhxpziuhnpq@xsne3f4wdfua>
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
In-Reply-To: <qt3ivwsa3uaidcgkzbd2ewohbyd6zbzseraihftdhxpziuhnpq@xsne3f4wdfua>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_020024_574230_476928B9 
X-CRM114-Status: GOOD (  16.69  )
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

Hi Rob, Krzysztof,


On 24/09/2024 11:12, Krzysztof Kozlowski wrote:
> On Fri, Sep 20, 2024 at 10:38:03AM +0200, Neil Armstrong wrote:
>> In preparation of supporting the mmc-slot subnode, allow
>> the nodename to be either mmc@ or mmc-slot@
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/mmc/mmc-controller.yaml | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
>> index 58ae298cd2fc..f797c32ea688 100644
>> --- a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
>> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
>> @@ -20,7 +20,9 @@ description: |
>>   
>>   properties:
>>     $nodename:
>> -    pattern: "^mmc(@.*)?$"
>> +    oneOf:
>> +      - pattern: "^mmc(@.*)?$"
>> +      - pattern: "^slot(@.*)?$"
> 
> I don't think mmc-slot is allowed by this.
> 
> This should be squashed with mmc-slot child patch. It does not make
> sense to allow mmc-slots if there are no mmc-slots.

Right, I don't like this oneOf/pattern, slot@(@.*)? should really only be for slots,
by I do not see how this can be achieved because we can't override properties: pattern.

Do you have any suggestions ?

Neil

> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
