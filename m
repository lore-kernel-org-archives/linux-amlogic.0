Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8C4C3064D
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jun 2024 07:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cT1vdnSejhaz5TbNEyOLhqQZYnethv9HcsqvQ/i7YI=; b=2AC40w73rzqyqih3OPZ7J3M2CW
	VMDUfD0ekKlRVjyGdDD99FDa/EyMzz7MoVoNbzYbxYy3sBhsXtod93bieH8H4hO8uvitcnd/0ycDz
	ncc++ShbwHAAm/EDjKB7EBGM9CxVJBk6EILvYNAl5Piax6NiKjngo4Ittrpmz5LU8gYty0uZu1PYG
	4dUXzkRPHw9HuxXzU9IJQMaAUnWHywNdYZaMf8T/J4fdGARbyfWgP27K6LSTreC9xjCgyCs0VYzAC
	80vLsnCMjUreWMTC/8qgFgvwePTZgqs7y9Bpqv0y641gRraaBgRS2+Jssv3qYGXVRgd4SDUrPMCV5
	/fZNQaBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMjvZ-00000009d1j-0Ywo;
	Thu, 27 Jun 2024 07:52:21 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMjvV-00000009czW-2Ztg
	for linux-amlogic@lists.infradead.org;
	Thu, 27 Jun 2024 07:52:19 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-424ad991c1cso19066025e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 27 Jun 2024 00:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719474735; x=1720079535; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBCMffxn4LAJXAIWptmBWF5BGGjLSTVC76JfyXsytmc=;
        b=hXeaJHa0Jke7uXjF6iiM2ZKXwzdIl+EjXXL2G1KQaw0zSQOvMZQBNgL/kqkERVjzMO
         60rbjsgFfrl4DIfbpQQPx8WH5fZNoWUtVcu5dkXjEqoaMedmbE7wUtnTIjUyBriCZhmf
         buLM+vbgpQzt/uHrgEtBRXVVQqAFNpoloqeiJ8yJV/BdPg6ch9gknbS0F4mHQt7ztRrH
         AOgTkEHog4PuSJLCESVx1WXHiU/PYQbqQlOnd9DuPFXYS+EdngkVRGNjkHD8xGaRsRyw
         NRy/UD1Iy+NjgKoXmT8l/znN32w+BJB3MmqJSvJ/nfWAXBgiS2DKqt2OVqrLogKD4DE4
         hhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719474735; x=1720079535;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XBCMffxn4LAJXAIWptmBWF5BGGjLSTVC76JfyXsytmc=;
        b=AuoRMf3HXlVtpCnkc9bIy1bqEOn15SbadAe9/14tsTDJkOj2G1Ql1ecWh5Ldr3QPbs
         OpI8/CorYx0Osszn+NzuB4KfCERzu0bRkHRpMn/+OMI4fQZko26Qkx4iyRkTgfH8PhLK
         7RSpIGrBmif7n1nv+l+q4OmKJeSQqykFpjw/ycKhXKautIBWL88lefKmC5WGzby6NPeO
         m3UwFt0TZNrOfPcD1P6DZpwDtmVFWSieLwpRNMTCJ6acpsBcJzJWEdQ0BC7MzeN848Uv
         dU9f45xrWKn7goq1ev7nbfqafUYxzc5WkVZwF0FYw1JjJQQoZnH3V1MP4wS3Li/uMggo
         WTEA==
X-Forwarded-Encrypted: i=1; AJvYcCVPM9iSZn1sTMWYBuHerr+kJOJV1odmczUXouAmLU1FMh/5MJFzYzqRBrt6vKxwaG7QDAdxbwctdy3Fn2/EqLwjJ0qgvjY6dpnSEIkc1YBO6mw=
X-Gm-Message-State: AOJu0Yy6yaQuzQwmdlVZZYcO9v2sM5A7IyQ4BwZZTl9uAoIuhK26egL4
	MqK8atNTsztfWO2vObPJewSyiMXTVfzpb3UVSuJlzgn0yl2g5J4Z+YAXMyva/4Vuz9RUF6uAE4B
	khYc=
X-Google-Smtp-Source: AGHT+IEjUL+j70G/hi3yuY2Bt9Gi9CL/4CNNycH9kWTRZ1nc6f9jw44NE1DzWx8PIaKqbU2R2xAN0Q==
X-Received: by 2002:a05:600c:681:b0:424:a578:fcc with SMTP id 5b1f17b1804b1-424a5781102mr48497425e9.7.1719474734436;
        Thu, 27 Jun 2024 00:52:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:feeb:faed:66fa:9e6a? ([2a01:e0a:982:cbb0:feeb:faed:66fa:9e6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8266a37sm52129085e9.19.2024.06.27.00.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 00:52:13 -0700 (PDT)
Message-ID: <02a58f83-2340-4004-9412-692967639908@linaro.org>
Date: Thu, 27 Jun 2024 09:52:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v8 2/2] arm64: dts: amlogic: Add Amlogic S4 PWM
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
Cc: kelvin.zhang@amlogic.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Junyi Zhao <junyi.zhao@amlogic.com>, George Stark <gnstark@salutedevices.com>
References: <20240613-s4-pwm-v8-0-b5bd0a768282@amlogic.com>
 <20240613-s4-pwm-v8-2-b5bd0a768282@amlogic.com>
 <a5ucz5r4eb2z5uzi4zaunpqhym5b6l37qszozhv4igcuduatnp@lzzk4tvil3yd>
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
In-Reply-To: <a5ucz5r4eb2z5uzi4zaunpqhym5b6l37qszozhv4igcuduatnp@lzzk4tvil3yd>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_005218_071228_23EB0C63 
X-CRM114-Status: GOOD (  14.34  )
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

SGkgVXdlLAoKT24gMjcvMDYvMjAyNCAwNzo1MCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4g
SGVsbG8sCj4gCj4gT24gVGh1LCBKdW4gMTMsIDIwMjQgYXQgMDc6NDY6MzZQTSArMDgwMCwgS2Vs
dmluIFpoYW5nIHZpYSBCNCBSZWxheSB3cm90ZToKPj4gRnJvbTogSnVueWkgWmhhbyA8anVueWku
emhhb0BhbWxvZ2ljLmNvbT4KPj4KPj4gQWRkIGRldmljZSBub2RlcyBmb3IgUFdNX0FCLCBQV01f
Q0QsIFBXTV9FRiwgUFdNX0dIIGFuZCBQV01fSUoKPj4gYWxvbmcgd2l0aCBHUElPIFBJTiBjb25m
aWdzIG9mIGVhY2ggY2hhbm5lbC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVueWkgWmhhbyA8anVu
eWkuemhhb0BhbWxvZ2ljLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IEdlb3JnZSBTdGFyayA8Z25zdGFy
a0BzYWx1dGVkZXZpY2VzLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogS2VsdmluIFpoYW5nIDxrZWx2
aW4uemhhbmdAYW1sb2dpYy5jb20+Cj4+IC0tLQo+PiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1s
b2dpYy9tZXNvbi1zNC5kdHNpIHwgMTk5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxOTkgaW5zZXJ0aW9ucygrKQo+IAo+IFdoYXQgaXMgdGhlIG1l
cmdlIHBsYW4gZm9yIHRoaXMgcGF0Y2g/IFRlY2huaWNhbGx5IGl0J3MgaW5kZXBlbmRlbnQgZnJv
bQo+IGRyaXZlciBzdXBwb3J0IChpLmUuIHBhdGNoICMxIGluIHRoaXMgc2VyaWVzKS4gVGhlIG9i
dmlvdXMgb3B0aW9ucyBhcmU6Cj4gCj4gICAtIEkgcGljayBpdCB1cCB0b2dldGhlciB3aXRoIHBh
dGNoICMxIHZpYSBwd20KPiAgIC0gWW91IHBpY2sgaXQgdXAgdmlhIGFybS1zb2MKPiAKPiBDYW4g
SSBwbGVhc2UgZ2V0IGFuIEFjayBpZmYgeW91IHByZWZlciB0aGUgZmlyc3Qgb3B0aW9uPwoKSSBj
YW4gdGFrZSBidXQgSSB3YXMgd2FpdGluZyBmb3IgdGhlIGRyaXZlciBwYXJ0IHRvIGJlIG1lcmdl
ZC4KCkFueXdheSwgSSdsbCB0YWtlLCBzb21ldGhpbmcgbGVzcyBvbiB0aGUgbGlzdCEKCk5laWwK
PiAKPiBCZXN0IHJlZ2FyZHMKPiBVd2UKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
