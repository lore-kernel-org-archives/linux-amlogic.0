Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6C5C4345F
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2024 08:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rpw+0E71cO6k0ffNYUegPr1qohepB5Yqfkzp3lDj0w8=; b=S83ObM38vSZdlsKSva4HXdka7V
	asfeXJ3/ZN+DTye+KAWInl5dDJj9oru1mLVZi7h9SS4U1YsKZLsaMpqu6fBSPClHeNJyp/WpIz3rA
	OYCOP+q8Jh0NPuikeJ1FQefbu+FgbSL3LsDFCfKskCQFVTKBFdDBy/8kenNr1MzITQyurFST2yr51
	5Ia9doYoiEapliLDmD0WHHF1jwbmmP+295RzsQoBt9P2v9NGuqLwkm2jlQDrs0q1bNVtgPksSH0ZK
	drHYtgu2xokZQS3jp1Ns3Z6DLVyAYkgYgNCRoBfda3pJmvb8iGwPL0g1zMZEDNQ8YOaFguM7JTwYq
	zDV95Gpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzBCq-0000000GPas-3j8P;
	Tue, 23 Apr 2024 08:08:48 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzBCn-0000000GPZZ-3Amg
	for linux-amlogic@lists.infradead.org;
	Tue, 23 Apr 2024 08:08:47 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-344047ac7e4so3665822f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 23 Apr 2024 01:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713859722; x=1714464522; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/oC2VtzrpJJKpFX/zRYpL4IVC3DtVUzT3QlRoS7w7o=;
        b=gevn185P2zRkoA7P5g74M8txYrFXOYRhUXCrw2AgE5cGd4qhC7Sdai/wlaJhNiBDfQ
         AhydIqhZ832nzu0oWNdyawECipLCeORaCCxn+USOOKXJs/Q+VHPAY+otlqPCJIZxnjbN
         4l4hjc9hUhgcz2aPwOxe/ktwCf+CVilFqYfCA9qTUKUdtDmabmiSFxlyRo16RytpM+I6
         QBG7DB8lqJIJc2QGEB31DhAx3LxMYbqf2DJ2EvFxJXRoBmNeub6M8gKofBmziPcpIGO0
         JbdHAuWqbcHraWDBCjxXnIGVY5JQfBEkTUf7LV2kTSIbj4rYGOLtbAYcM5GIJbrUT6Fw
         nz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713859722; x=1714464522;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8/oC2VtzrpJJKpFX/zRYpL4IVC3DtVUzT3QlRoS7w7o=;
        b=YLiGU7lcH6Swh+Gup40t2+vdJac3ShaCSnXyGJbZHAyzvo8FORIaCcP9cPN/hhalLA
         vtZv1hmfkrIowyWUQERWMw3stm+hzL67Jou4UIWPjaYbDwOCMH+uobAOoHLRkr0RR4Zs
         tOhC+qOSKASS8p6mJcd3awEmtyzb0IxkbhL1DQoeHLhX5xM1OU2bXOpHOCR5ZhvSfKhv
         hjpGFQ+wGylcQI2KZKrnGmfCgtCsJE0zHVFl+2JToMM482j6geIQontJnjRGvZ8WJeKK
         wNmKBSSBwcGhGkfzlZM+fdw/N/p0Xw066j9TFVpgV39zqC2h3AFazaV9yK8d3XkP85Bp
         usvw==
X-Forwarded-Encrypted: i=1; AJvYcCWckeiXbPaxKNPcVp+ZNZiS2iIz0lvzWv6lDQiEaRTfvhyi6QmIeL18WGei6DSnDMTWtEj4xFxa2LmYLk+dOD394DebTYIqKKr30vxMu/Gu28w=
X-Gm-Message-State: AOJu0YxzyFvTCHP7bUTtNS28Iu2X8B3vYyWjaP0jeYURl/dIp1hWifzM
	BEMQ2FDqE+03D3JykziU3j0YYI0gdTkawJQQNpnVdxi0yHuaRH67kgcK3o9nunM=
X-Google-Smtp-Source: AGHT+IGj3V51mN4o70u97cNRT3Eg+WA5oX7EwBLrwSwL4MS0vJPp5BQU4b374eoAEqNcBb+MC/ho4g==
X-Received: by 2002:adf:a151:0:b0:343:6c07:c816 with SMTP id r17-20020adfa151000000b003436c07c816mr1361089wrr.16.1713859722150;
        Tue, 23 Apr 2024 01:08:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:815e:851b:255f:e3ee? ([2a01:e0a:982:cbb0:815e:851b:255f:e3ee])
        by smtp.gmail.com with ESMTPSA id a16-20020a5d4d50000000b0034a9b75e272sm8664280wru.45.2024.04.23.01.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 01:08:41 -0700 (PDT)
Message-ID: <a2a2fa0e-2194-40db-85e7-d586c512231f@linaro.org>
Date: Tue, 23 Apr 2024 10:08:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 5/5] pwm: meson: add generic compatible for meson8 to
 sm1
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 JunYi Zhao <junyi.zhao@amlogic.com>
References: <20240221151154.26452-1-jbrunet@baylibre.com>
 <20240221151154.26452-6-jbrunet@baylibre.com>
 <24ec3iiudmfapiosygpsvgu7kmdqe6csbkpuzx3p3sa4oyodqu@hshmbpvzhufb>
 <1jplumc276.fsf@starbuckisacylon.baylibre.com>
 <4v5lhnjbfnjpj4k4rme6kfphurr56ae5ngup7pcsrxhs4f7qh5@jian42uepseu>
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
In-Reply-To: <4v5lhnjbfnjpj4k4rme6kfphurr56ae5ngup7pcsrxhs4f7qh5@jian42uepseu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_010845_867039_38857F46 
X-CRM114-Status: GOOD (  12.73  )
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

T24gMTgvMDQvMjAyNCAxODowOCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gT24gVGh1LCBB
cHIgMTgsIDIwMjQgYXQgMDE6NTc6MDNQTSArMDIwMCwgSmVyb21lIEJydW5ldCB3cm90ZToKPj4g
T24gRnJpIDEyIEFwciAyMDI0IGF0IDE0OjA4LCBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUt
a29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPj4+IGI0ICsgZ2l0IGFwcGxpZWQgdGhlIHBh
dGNoIGp1c3QgZmluZSBldmVuIHdpdGhvdXQgcGF0Y2ggIzQgb2YgdGhpcwo+Pj4gc2VyaWVzLiBX
b3VsZCB5b3UgYmUgc28ga2luZCB0byBkb3VibGUgY2hlY2sgaXQgd29ya3MgYXMgaW50ZW5kZWQ/
Cj4+Cj4+IEl0IGRvZXMsIFRoeC4KPiAKPiBUaGFuayB5b3UuCj4gICAKPj4+IEJUVywgYjQgZGlh
Z25vc2VkOgo+Pj4KPj4+IENoZWNraW5nIGF0dGVzdGF0aW9uIG9uIGFsbCBtZXNzYWdlcywgbWF5
IHRha2UgYSBtb21lbnQuLi4KPj4+IC0tLQo+Pj4gICAg4pyXIFtQQVRDSCB2NSA1LzVdIHB3bTog
bWVzb246IGFkZCBnZW5lcmljIGNvbXBhdGlibGUgZm9yIG1lc29uOCB0byBzbTEKPj4+ICAgICAg
KyBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwMjIxMTUxMTU0LjI2NDUyLTYt
amJydW5ldEBiYXlsaWJyZS5jb20KPj4+ICAgICAgKyBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5l
LUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+Pj4gICAgLS0tCj4+PiAg
ICDinJcgQkFEU0lHOiBES0lNL2JheWxpYnJlLWNvbS4yMDIzMDYwMS5nYXBwc3NtdHAuY29tCj4+
Pgo+Pj4gSXMgdGhpcyBvbmx5IGJlY2F1c2UgaXQgdG9vayBtZSBzbyBsb25nIHRvIHJlcGx5LCBv
ciBpcyB0aGVyZSBhCj4+PiBjb25maWd1cmF0aW9uIGlzc3VlIHdpdGggdGhlIGJheWxpYnJlIE1U
QT8KPj4KPj4gSSBoYXZlIG5vIGlkZWEuIFRoaXMgaXMgdGhlIGZpcnN0IHRpbWUgdGhpcyBpcyBy
ZXBvcnRlZAo+IAo+IEkganVzdCBwaWNrZWQgdXAgYSBwYXRjaCBieSBvbmUgb2YgeW91ciBjb2xs
ZWFndWVzIGFuZCB0aGVyZSB0aGUgREtJTQo+IHN0dWZmIHdhcyBmaW5lLiBJIGRpZG4ndCBkZWJ1
ZyB0aGF0IGZ1cnRoZXIuCgpHb29nbGUncyBES0lNIGtleSBnZXRzIHJvdGF0ZWQsIGFmdGVyIHdo
aWxlIHRoZSBES0lNIHNpZ25hdHVyZSBnZXRzIGludmFsaWQuCgpUaGUgYmVzdCBpcyB0byBhZGQg
YSBHUEcgc2lnbmF0dXJlIG9uIHRvcCBvZiBES0lNLCBsaWtlIHdpdGggQjQuCgpOZWlsCgo+IAo+
IEJlc3QgcmVnYXJkcwo+IFV3ZQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
