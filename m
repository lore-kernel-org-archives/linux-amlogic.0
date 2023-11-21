Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CF4C61D92
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Nov 2023 11:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=geRfmKLBi0CTJEYkKEDsxDHJ/YUvWg48FvENZWjnolU=; b=Xw5dYTO5AiV8zLKUQ5PjXoieLi
	bzyPC9TWajm80xNGSAY4wVH+oNDOrAkY+qWrNw4er28O//VfpvmtJdMnHM5j6Ujh5v9u3bau6HOeV
	uLIS6Xa0TwyU868xuTXzoBQu/7GJA/rnLOm2MJI3XUPOE3JCJsjr6tahKZyoPGvC7qV9K1Qy7emR6
	AU6icMnvxm9dfmwKQNypUbyMPKachBasDnJXLHLeP5q4wQfyU8rJu9e9Xiq612AWSgitHykPCHPGI
	ZzICZYDqmrfOE+1GtC4poCq4i54usDfFLiqCMPfK/1LaXbtBjlst8Fg1d07ZHvuShCmtIgcvuDw7w
	h+B910gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5OYt-00GMYi-1w;
	Tue, 21 Nov 2023 11:04:59 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5OYp-00GMX6-3B
	for linux-amlogic@lists.infradead.org;
	Tue, 21 Nov 2023 11:04:57 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-32daeed7771so3285537f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 21 Nov 2023 03:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700564692; x=1701169492; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIK/f1U9gj42KtTbzVAHFRC1UQ6zgDgmA86Cyhg1HRw=;
        b=kSPwBig1N+6MQmi1qW5Y73nhPhFVYOttSd4E0ERIH9QWo0Q5hif0KK++/QrrqorFdy
         mdTE61Pqn6mmxs7hK3rWXMM7+Yt7A+xc8GGbROBJc8wy/zYC0HM1FMtlsdQQROSrklhi
         RBpja9TJeCURDPiyMcHYtPPPd37qh8w6Ep1Eaf7Oq5fwH+H9LWcSBK4XhelSagOUcUiD
         KhzuX2MHruML6O3XenJaTcFvBseFzoDchOEDSe9jZ+2GSWxxmu+H+BCEKveTwXS+Gsq5
         DEZBQGwdn8tsJOh5mnqrDEWRQME/mokoHjn3w/lcCyue80p013uD8lVqJCg4gE3oBVPr
         x4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700564692; x=1701169492;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kIK/f1U9gj42KtTbzVAHFRC1UQ6zgDgmA86Cyhg1HRw=;
        b=R7qYWpuUWSUa2qmIoqtBkhcLbHosso7p/FrENhgFWRkkeqRwe2qzDWL1LP4Aq0cNu3
         JLFqwxeMpvbTHhiPcomoatgdDfGgQGR2zESDxpdWhdztl7PrP5VyRThkH32GHCCfwcIL
         o7JCIifsrANfVBExcbrnkAUNwsgLlcvV8E39Gsgw5zRcexNKr2yzRwI/BU880JP70uzG
         LhdcpJ8dv3ZNkLV0mAgK9+hOF9YnXFin4dzyCyHzI/7uDnJ8kew9tX4kYQtUb9QqxVFc
         FgQ+6dhEIZVa2p+IsflXxYVuDZdb7X2b1PFopOCMRv8w+MXhua4UdA/iE++abDS9r7qI
         cFUw==
X-Gm-Message-State: AOJu0Yx+fl2fDs55bIIBB43GwrMNAiGC/Nklg+iuGnbRwKoCvBFMvj5Z
	kWWUGopeqluxi0Okcn7943kn/w==
X-Google-Smtp-Source: AGHT+IHIYLaPdDRrbJE5uQgQlOj1dJoooND6JHpZCP3BrMLOAYeMAn/fpW4er0klLi7y3R6yE9dZMg==
X-Received: by 2002:adf:f4cc:0:b0:332:cb97:2cb6 with SMTP id h12-20020adff4cc000000b00332cb972cb6mr2183534wrp.21.1700564691910;
        Tue, 21 Nov 2023 03:04:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:2a39:bc19:20b6:16a? ([2a01:e0a:982:cbb0:2a39:bc19:20b6:16a])
        by smtp.gmail.com with ESMTPSA id e1-20020adff341000000b0032f79e55eb8sm14010312wrp.16.2023.11.21.03.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 03:04:51 -0800 (PST)
Message-ID: <a69e5dd0-8efe-4415-9747-0554f8370fcf@linaro.org>
Date: Tue, 21 Nov 2023 12:04:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] pmdomain: amlogic: meson-ee-pwrc: add support for
 G12A ISP power domain
Content-Language: en-US, fr
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Daniel Scally <dan.scally@ideasonboard.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20231114-topic-amlogic-upstream-isp-pmdomain-v1-0-f01e6fca67a0@linaro.org>
 <20231114-topic-amlogic-upstream-isp-pmdomain-v1-2-f01e6fca67a0@linaro.org>
 <CAFBinCDe3yoEBd6SzozNZtC=zGaUHt4VeO_uhV1s5XBaWp0w1Q@mail.gmail.com>
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
In-Reply-To: <CAFBinCDe3yoEBd6SzozNZtC=zGaUHt4VeO_uhV1s5XBaWp0w1Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_030456_047198_2CF00F39 
X-CRM114-Status: GOOD (  10.36  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjAvMTEvMjAyMyAyMToxNSwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIaSBOZWls
LAo+IAo+IE9uIFR1ZSwgTm92IDE0LCAyMDIzIGF0IDExOjE54oCvQU0gTmVpbCBBcm1zdHJvbmcK
PiA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4gWy4uLl0KPj4gK3N0YXRpYyBz
dHJ1Y3QgbWVzb25fZWVfcHdyY19tZW1fZG9tYWluIGcxMmFfcHdyY19tZW1faXNwW10gPSB7Cj4+
ICsgICAgICAgeyBHMTJBX0hISV9JU1BfTUVNX1BEX1JFRzAsIEdFTk1BU0soMzEsIDApIH0sCj4+
ICsgICAgICAgeyBHMTJBX0hISV9JU1BfTUVNX1BEX1JFRzAsIEdFTk1BU0soMzEsIDApIH0sCj4g
SSBleHBlY3RlZCB0aGlzIHNlY29uZCBsaW5lIHRvIHVzZSBHMTJBX0hISV9JU1BfTUVNX1BEX1JF
RzEgKG5vdGUgdGhlCj4gbnVtYmVyIGF0IHRoZSBlbmQ6IDAgdnMgMSkKPiBJcyB0aGlzIGNvcnJl
Y3Q/CgpJbmRlZWQgeW91J3JlIHJpZ2h0LCBsZXQgbWUgZml4IGl0IGluIGEgdjIsCgpUaGFua3Ms
Ck5laWwKCj4gCj4gCj4gQmVzdCByZWdhcmRzLAo+IE1hcnRpbgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
