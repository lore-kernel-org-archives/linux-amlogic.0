Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8618CF58F1
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Sep 2024 08:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1ckVGXZ0yVpvCQ9pq7ZlBPJv9k4PbjRJbHvSGQInTw=; b=ejI1AllptGIZDCnHYmuXtmTOZ/
	EU17twEdy/BOuJlhycuyqGOj28hpYDchuTmxjpMCIMk3horf2HghxGGMgAUxPxxqHhKbiIdxb7by8
	Azmlyufcm0uIVkorU+iM632sIqP+OEJ643BOmrgUX8vCCxnQCsUqHhKD7WOCRJQH1RQrD5GXSt7wP
	c1rLtL8nTtRL8QMAXwnjz5OBCBMMSnBzEGgoiSQ+yiYc1WEpACQvVqkjBC+uNa1NLafcawVDdqu7b
	LFp30Agrcvocfvpw4EmZQXlMJzfFfm8ZxfScR8x4skOR0G7Wk6DMaUKw6If0JT+n6tktN33gW//tp
	GVQb2gMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srZJA-0000000Bp9f-1cBV;
	Fri, 20 Sep 2024 08:48:08 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srZ05-0000000Blib-1mCl
	for linux-amlogic@lists.infradead.org;
	Fri, 20 Sep 2024 08:28:26 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-42cb8dac900so15935385e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Sep 2024 01:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726820903; x=1727425703; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QSY/XwkbAFk0AHpPR2dqnekk1R5T+r9ialJRBpwsOMY=;
        b=islJKEAdP+btZ5HftOTVDXElHmMZat+lWuon4wC2qwlQm1tywNpAa1s0AxK9m+cG4d
         mO4zmEgShDARmNcDoagpCWyqL9biXBKRHU5TNxTsvqhR68Ilb7qHIloIH3ZVuhito/7S
         XwmlQnScSNCZzSG3Zh/16gLJdV/UmIAvG1spcXSIFPz6kkk2yocYnPkYUXdvw9hlufgA
         eKxBvMVtqHtLf9aT4UVeG07IafesEpqNu3xS4XYzM4y53yrBNFnujjwTB03D4ax/F53a
         g6rNwx6PiKfR9YljBMI+LzhwgIFc8REHALbvm+pfbNYH2wkB57ZR+pTFGeFnjkPRdjix
         AitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726820903; x=1727425703;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QSY/XwkbAFk0AHpPR2dqnekk1R5T+r9ialJRBpwsOMY=;
        b=wvy3d9oauEaisLHcQsc77YcFXkgZdK0+cGgnmA9BeyTUWr8JyBO/27iCENd6oWHqKc
         TPr7zuNaII8w+lXBsDgSKMcP599uMrAkBx6lFgDbl/URoH4C5wVJO0EMvtd8BAHMzXAj
         SUx/irxG/E2yPLn8jYG1hbKvIHGrgWT6iJr2ZY3HKdDztwn2pwNUMtJNAlAWeOl2oogR
         IKqE9oWOcwIhcDb9Yf7gHgXsYtjDoXUOygsubaXxk4BoDGHZAYAhMGWfuEW73VkifDwN
         HiPhLbQXadMlLQxBpmOTEqbpa8xdpjAn/BBXHkdUmuES7UxY4vFa6D/DbIzBPRjxA/Th
         qEZw==
X-Forwarded-Encrypted: i=1; AJvYcCUfq9mpEyR++gnSEvtQ36Q32cF9SLfCS1oZBecnMjg6WiXdO3O4t+pUoCibMJqyxVsHo4CnjGcuuOHnjiUV@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+tdiYPag95UEpoYNM4vmpNEXc9JNLcAg+j6+bdaCcW4Wcwp+p
	6jzVtwkiUGvoNWbSboPYEBhHCSm02C/nyGsKuWoKKc4nkIjKJ9FOyvNJti9r93A=
X-Google-Smtp-Source: AGHT+IEwpW97abutw3SvbbD+fpsLM/YqBbH/+ujjWdJHEh1aCbcZ94oU53Wv3GaurPQr/FG0QEN0Gw==
X-Received: by 2002:adf:e84b:0:b0:374:cd36:8533 with SMTP id ffacd0b85a97d-37a43197db1mr1010222f8f.54.1726820903286;
        Fri, 20 Sep 2024 01:28:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b3d5:235d:4ae1:4c0f? ([2a01:e0a:982:cbb0:b3d5:235d:4ae1:4c0f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e7809e0fsm17044622f8f.110.2024.09.20.01.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Sep 2024 01:28:22 -0700 (PDT)
Message-ID: <e8906af4-e769-48ea-8ec4-779ca4be9b8a@linaro.org>
Date: Fri, 20 Sep 2024 10:28:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] dt-bindings: mmc: convert amlogic,meson-mx-sdio.txt to
 dtschema
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v1-1-b7bfae886211@linaro.org>
 <20240916174030.GA835203-robh@kernel.org>
 <9394d785-5954-4d44-8ad0-9b57fbecde25@linaro.org>
 <CAFBinCAbb5rh4GZZhjFA1jSGJAPNC80vnUY+PC9AdaApLZphmA@mail.gmail.com>
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
In-Reply-To: <CAFBinCAbb5rh4GZZhjFA1jSGJAPNC80vnUY+PC9AdaApLZphmA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_012825_489441_51882DCA 
X-CRM114-Status: UNSURE (   9.66  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTkvMDkvMjAyNCAxODozMywgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIaSBOZWls
LAo+IAo+IE9uIFR1ZSwgU2VwIDE3LCAyMDI0IGF0IDk6MTPigK9BTSBOZWlsIEFybXN0cm9uZwo+
IDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPiBbLi4uXQo+Pj4+ICsgICAgICBy
ZWc6Cj4+Pj4gKyAgICAgICAgZGVzY3JpcHRpb246Cj4+Pj4gKyAgICAgICAgICB0aGUgc2xvdCAo
b3IgInBvcnQiKSBJRAo+Pj4+ICsgICAgICAgIG1heEl0ZW1zOiAxCj4+Pgo+Pj4gQXJlbid0IHRo
ZXJlIGxpbWl0cyBpbiB0aGUgbnVtYmVyIG9mIHNsb3RzIHRoZSBoL3cgY2FuIHN1cHBvcnQ/Cj4+
Cj4+IEdvb2QgcXVlc3Rpb24sIGxldCBtZSBjaGVjawo+IGFsbG93ZWQgdmFsdWVzIGFyZTogMCwg
MSwgMgo+IAo+IEZvciB0aGUgcmVtYWluaW5nIHF1ZXN0aW9uczogSSBhbHNvIGRvbid0IGtub3cg
LSBzbyBsZXQncyBzZWUgd2hhdAo+IFJvYidzIHN1Z2dlc3Rpb24gaXMgZ29pbmcgdG8gYmUuCgpJ
IGRpZCBzb21ldGhpbmcsIEknbGwgcG9zdCBpdCBzaG9ydGx5LCBubyBpZGVhIGlmIGl0IHdvcmtz
CgpOZWlsCgo+IAo+IAo+IEJlc3QgcmVnYXJkcywKPiBNYXJ0aW4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
