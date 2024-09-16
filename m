Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAE0C3ABA2
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2024 07:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhZFSCPeBg14P3Gb5rL/j/qlghEb4NMzzMZTQzwoGlU=; b=t53aM0I79oj2fI+rzJf3qyrA7m
	umluVToP487WBYCyA64y99Jwvhe0KjVAuf2NVEpgJ8PzoOBT4jgsT73pFdv4cdcAsU1BtgLM88DwL
	NC3kvG1uwTgTbqz2348GA7mU2jp/Hq9/Yh2ExVEeg9EVC6D/6NSY9+OLmZJsNWFFciDbgHjRM4HB6
	qk1FkbpqPY5j7kAC1EfweOr7YlV/0KHWy4YAm4yjzEDe1vUFU7eMKJkHO3wSul0wO4AYF6Ft+1vCL
	xUH/KFjE9Vw9Q4xtozZWV/DjbLPU5Gdj8XHItufx4ZPo1qEK3LrK1y5w29VYQ4QS6RDmN6Rw3bFRM
	V6Sv1viw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq62V-00000003IVj-24Rj;
	Mon, 16 Sep 2024 07:20:51 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq62T-00000003IUC-0pA0
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Sep 2024 07:20:50 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-42cb1758e41so23124595e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Sep 2024 00:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726471247; x=1727076047; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F4G2KoVlFImQyEEBlvtWpQhFz3zZpE+7zDeyjIho9XI=;
        b=ZtTVrOjVb6U3EFf8pRBFRPQ9fCbQgUWyXzmg+Gef3neq/PkYL5N5r81XrW2Zqz1g7g
         oJlw4uWPK7lS9qUNcrJo4/dU9QgSy2JjBm+NR/EqRZcOpQhlonqG8VF0ulOyg9OssHlo
         VqeSh+b+mzvlEdq2G4IhvSxehYkgAW3T5UnLiSUVb+7p8ds8WGDiMxoZ4uMLjnsBUjMg
         AvklFqu985zCLrS0TNqJoCKuxrG+5ij6oU/VerYcszDBllREUdOSjuq5z96ow72st+0c
         rG5riqPK0KcwEqCXV3wUlu+7ImOGwSgG4T7jiW0wXvOW/BaS2Q5Iglj5OKuvfIbxRnii
         5t5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726471247; x=1727076047;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F4G2KoVlFImQyEEBlvtWpQhFz3zZpE+7zDeyjIho9XI=;
        b=MO5Vokn0fC6rA4odk9/DWWVy6syTciQCYQUB4JrtCbGXY8utdGohe2KgZoAN8BdmXN
         8dQuCNQp1SMkE7NF/rzKLt5VN6Cj4HX+Fs4sdzusiADQnbnh68kLg+vqn0N5Dd6UMlPd
         u0XqIwQFnPkdeGV8Fmc7Z1iMxksI65lNIxmrQlnq47XMDFUDFgDtcmet0mZGnMn23FJu
         mAX1BnnRCHXXh5EFlCyIo4mQ0yHrWqiGPX7lONfso04mJkQsRg+gqfTKgIKcO0kjy26i
         9ziEUrTweh7yDtfaB0yzuZmkUaXFaZNozaXFCaSj5smoRPp5WoHA3DXrYY0GJzuXxOQx
         j5GA==
X-Forwarded-Encrypted: i=1; AJvYcCWleQTB/WKfebQChHDCPwmsZVoTaLkCfFm8hit4jlIGe9qZJ1rx/lqsQBF3/n+BLknoIkH0XK1PKMQ7tw6n@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq9LvGMfPRxsOCX7t3/M6J9LDo1UwEq3yUNdxi3xAI+Tn+dRpS
	+jFXo6TumhYhlDrVfVvoItgwJrhJM47nTq06W2xzHn/uqbDmAAm65rjg6LeVlSc=
X-Google-Smtp-Source: AGHT+IF+BiCZpHlNGDJ0WVsb2BbNS1rcnnfUaWDIzT2pr8fr1gMxHSS2QBCjtZVj34KgbZSFWvXMFg==
X-Received: by 2002:a05:600c:63d3:b0:426:6a53:e54f with SMTP id 5b1f17b1804b1-42d964e10b0mr60254615e9.33.1726471246241;
        Mon, 16 Sep 2024 00:20:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:46e0:9b1e:8680:c41c? ([2a01:e0a:982:cbb0:46e0:9b1e:8680:c41c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da2427227sm67433715e9.44.2024.09.16.00.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 00:20:45 -0700 (PDT)
Message-ID: <c9392d3a-8336-4cac-83c6-6b85a8cb92f0@linaro.org>
Date: Mon, 16 Sep 2024 09:20:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: clock: convert amlogic,meson8b-clkc.txt to
 dtschema
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson8-clkc-v1-1-e0b8623c090d@linaro.org>
 <CAFBinCBZ8kowT_R6MnVkQO_BpxPA88xz-=KPStFDYQgH=P5upA@mail.gmail.com>
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
In-Reply-To: <CAFBinCBZ8kowT_R6MnVkQO_BpxPA88xz-=KPStFDYQgH=P5upA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_002049_303691_42B357A3 
X-CRM114-Status: GOOD (  14.91  )
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

SGksCgpPbiAxNS8wOS8yMDI0IDIxOjI1LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdyb3RlOgo+IEhp
IE5laWwsCj4gCj4gT24gV2VkLCBTZXAgMTEsIDIwMjQgYXQgNTowOeKAr1BNIE5laWwgQXJtc3Ry
b25nCj4gPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+IHdyb3RlOgo+Pgo+PiBDb252ZXJ0IHRo
ZSBBbWxvZ2ljIE1lc29uOCwgTWVzb244YiBhbmQgTWVzb244bTIgQ2xvY2sgYW5kCj4+IFJlc2V0
IENvbnRyb2xsZXIgdG8gZHQtc2NoZW1hLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0
cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KPiBUaGFuayB5b3UgZm9yIHdvcmtpbmcg
b24gdGhpcyEgRmlyc3Qgb2YgYWxsIHRoaXMgcGF0Y2ggaXM6Cj4gUmV2aWV3ZWQtYnk6IE1hcnRp
biBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+Cj4gCj4g
RG8geW91IHdhbnQgbWUgdG8gc2VuZCBhIHBhdGNoIHRvIGRvY3VtZW50IHRoZQo+ICJhbWxvZ2lj
LG1lc29uLWhoaS1zeXNjdHJsIiBjb21wYXRpYmxlIHN0cmluZyBuZXh0Pwo+IFdlIGVpdGhlciBo
YXZlIHRvIHVwZGF0ZQo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvYW1s
b2dpYy9hbWxvZ2ljLG1lc29uLWd4LWhoaS1zeXNjdHJsLnlhbWwKPiBvciBjcmVhdGUgYSBzaW1p
bGFyIGJpbmRpbmcgZmlsZSBmb3IgdGhlIG9sZGVyIFNvQ3MuCj4gQWxzbyBJIHRoaW5rIHdoZW4g
ZG9jdW1lbnRpbmcgdGhhdCBjb21wYXRpYmxlIHN0cmluZyB3ZSdsbCBoYXZlIHRvIGFkZAo+IHBl
ci1Tb0MgY29tcGF0aWJsZXMgYXMgSSB0aGluayB0aGlzIGdlbmVyaWMgb25lIGlzIG5vdCBlbm91
Z2guCgpJIGhhdmUgaXQgcmVhZHkgYWxyZWFkeSwgd2FpdGluZyBmb3IgdGhpcyBvbmUgdG8gZ28g
dXBzdHJlYW0gZmlyc3QhCgpodHRwczovL2dpdC5jb2RlbGluYXJvLm9yZy9uZWlsLmFybXN0cm9u
Zy9saW51eC8tL2NvbW1pdC8xYmU4ZjhjNjdlNWI4M2ZhNDA2OWNjYmNmYTgwZDA2MTRmNjY4YTY1
CgpOZWlsCgo+IAo+IEJlc3QgcmVnYXJkcywKPiBNYXJ0aW4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
