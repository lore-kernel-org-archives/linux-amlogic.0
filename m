Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CD1D41D6B
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Nov 2024 08:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=spDbkI+FNsoQxLZXmrNjfiPmuDqz9uOXJLis9c+ER4k=; b=apl8o2oq1j78kbH/ymsHSA4QSS
	a90JWHV86AWRwkK78rwP3ELQ/cPHWwImbjb74VFbfavAwLx3wNpkri5xqOdYbiP8fFji6w2JuMJDF
	Alb/vUNdbDqZ2qizz26depT0UiKSdafsV6x3IZY567djXKsKrCakf3IHoe/vQvnqUkAvZk4BBnIHt
	7trP/DoiRGxWZVAKT9WPuu1qXWEE/0UveF4+p/4CXYeqm9BJC3+DZqqd1dbggyUXYzJjqgZEWu0zZ
	fP8jTNJVPrvF0kjjnMUGBlfY81IWVYekT0VgFzTktWmo24zqkitjV2l8McToOuSE9z4M9yJUorUVR
	nRs+DOBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmEF-00000002ct5-3KBA;
	Tue, 12 Nov 2024 08:26:27 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmCR-00000002cgO-2csQ
	for linux-amlogic@lists.infradead.org;
	Tue, 12 Nov 2024 08:24:37 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43161e7bb25so43455045e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 12 Nov 2024 00:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731399873; x=1732004673; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BHG/302xW3aLkt5O2SfZxjbGRcjYz+4y3Ps37Vgg7Y4=;
        b=GraHwQXG5M1RsB9HXYQnLlUMrNU003otPuW93RU248o+Y7seCFXDO6mGgA00A9pVCe
         WCuXrT8oWBY6O5u36tFHJ52F71JoafIA1aG1+DWael3rgAsJ4lhAy2e14ad2cv9UaIBL
         Ph9mvRRP3COP0uWmDo8yhngk+8mOYoxicJ2yS5h5chkO4XMy0vJoDkqHPYzv4U5b0tW5
         hTC/QnbOIOLDsKkMFFbuYslkA53u0pKKqcWEClFUMZsv/azwPGwyDMorAhmw1bIvJuTJ
         /DuJvWwUD9NRwSAmBwUF7IcuL7ZnMBrAxhvnlEKq/7RcgJop4gx53rhuIcsE9Q5NXFND
         RBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731399873; x=1732004673;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BHG/302xW3aLkt5O2SfZxjbGRcjYz+4y3Ps37Vgg7Y4=;
        b=mOnqFa67+j15T0qWhF2fVyc1C8FA0wkc4jxusINIVdFWnrxFDYYfUIyxfO+jclh3SQ
         L9l+fP7lCUDxWgT//P9PjJdBUiSTm6suSPdyLQtgMIdQkvWYM8jjUXK1Lo2fa2o5Ue2z
         teZxOr9CBdM/rQ7RKlQyEcFuKsbJIE16lQ8tkUvPWcC7w6BT56N6NFExGZvhOmY7gpIe
         dkbMPL7YjCZiEqOYy8WKkm94LaVt7a7v0YR8AA31VAbSJyd7Ow29cZZqZD3Ku4NMMe6n
         HVIeTnvnRZhDkzXOXeVTNMShwOrUjpbqnp6oO0y4j/Zvj20E+0wSPthKLHWkDxS6WfMb
         5gnw==
X-Forwarded-Encrypted: i=1; AJvYcCUG/lFMBdGkkTXUuMH5TEw5LnL4Xb4S3gdIEb3P/mfbq7KSfFV4WqM1u5ebiCyPtlW3OPAo4NJO8yy+voiN@lists.infradead.org
X-Gm-Message-State: AOJu0YxHH6zKHgAuOJMHx41Yqkxt1rOcES/an3GS1bXXacOQe1LJ2+mk
	ppLEjWXJ7UNGPlfiwetEFRvpfUYEeKnnAIec79JORD8SHUmPNxhlVv1166b8wbs=
X-Google-Smtp-Source: AGHT+IGZ0+JGsE9MkHXAcU6IkVnXDchLT2F09ZqRiYJ04+9+dW1daenHhuh5nEca5lNjPLx9FocpcA==
X-Received: by 2002:a05:600c:b91:b0:431:5e53:2dc4 with SMTP id 5b1f17b1804b1-432cce680efmr13102955e9.6.1731399872977;
        Tue, 12 Nov 2024 00:24:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:860c:aff4:d0e9:9db8? ([2a01:e0a:982:cbb0:860c:aff4:d0e9:9db8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b0566544sm196515055e9.24.2024.11.12.00.24.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 00:24:32 -0800 (PST)
Message-ID: <97e2b1e4-1763-42c4-a3f0-986492ecfd97@linaro.org>
Date: Tue, 12 Nov 2024 09:24:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC v4 0/4] Pinctrl: A4: Add pinctrl driver
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241101-a4_pinctrl-v4-0-efd98edc3ad4@amlogic.com>
 <27aa3716-1d28-4da8-80e6-212d7f94d193@linaro.org>
 <84bbb8b3-d638-47e5-a0e9-371e9e56c89f@amlogic.com>
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
In-Reply-To: <84bbb8b3-d638-47e5-a0e9-371e9e56c89f@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_002435_700079_762CD2AE 
X-CRM114-Status: GOOD (  18.82  )
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

T24gMTEvMTEvMjAyNCAwNDoyNiwgWGlhbndlaSBaaGFvIHdyb3RlOgo+IEhpIE5laWwsCj4gIMKg
wqAgVGhhbmtzIGZvciB5b3VyIHJlcGx5Lgo+IAo+IE9uIDIwMjQvMTEvMTAgMjA6MjQsIE5laWwg
QXJtc3Ryb25nIHdyb3RlOgo+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4KPj4gSGksCj4+Cj4+IExl
IDAxLzExLzIwMjQgw6AgMDk6MjcsIFhpYW53ZWkgWmhhbyB2aWEgQjQgUmVsYXkgYSDDqWNyaXQg
Ogo+Pj4gQWRkIHBpbmN0cmwgZHJpdmVyIHN1cHBvcnQgZm9yIEFtbG9pZ2MgQTQgU29DCj4+Pgo+
Pj4gSSB3YW50IHRvIGZpbmQgb3V0IHdoYXQga2luZCBvZiBzb2x1dGlvbiBpcyBmZWFzaWJsZSB0
bwo+Pj4gbWVldCB0aGUgbmVlZHMgb2YgYWxsIHBhcnRpZXMuIFRoaXMgUkZDIHZlcmlvbiBpcyBv
bmUgb2YgdGhlbS4KPj4+Cj4+PiBBbGwgb2YgQW1vZ2ljIFNvQ3MgR1BJTyBkZXZpY2UgcmVxdWly
ZW1lbnQgaXMgbWV0IGhlcmUgYnkKPj4+IGFkZGluZyBHUElPIGJhbmsgZGVmaW5pdGlvbiBpbnN0
ZWFkIG9mIHRoZSBwaW4gZGVmaW5pdGlvbi4KPj4+IEJpbmRpbmcgaGVhZGVyIGZpbGVzIHdpbGwg
bm8gbG9uZ2VyIGJlIGFkZGVkIHRvIGZ1dHVyZQo+Pj4gU29DcydzIHBpbiBkZXZpY2VzLgo+Pj4K
Pj4+IFRoZSBwaW5jdHJsIHNvZnR3YXJlIG9ubHkgYWRkcyBpbnN0ZXJmYWNlIG9mIG9mX3hsYXRl
IHRvIHN1cHBvcnQKPj4+IGZvciB0cmFuc2Zvcm1hdGlvbiB3aXRob3V0IGFmZmVjdGluZyB0aGUg
b3ZlcmFsbCBmcmFtZXdvcmsgYW5kCj4+PiBpcyBjb21wYXRpYmxlIHdpdGggcHJldmlvdXMgZHJp
dmVycy4KPj4+Cj4+PiBUaGUgY29kZSBpbiBEVFMgZmlsZSBpcyBhbHNvIHJlYWRhYmxlIHdoZW4g
dXNpbmcgR1BJTywgYXMgYmVsb3c6Cj4+Pgo+Pj4gcmVzZXQtZ3Bpb3MgPSA8JmdwaW8gQU1MT0dJ
Q19HUElPKEFNTE9HSUNfR1BJT19YLCA2KSBHUElPX0FDVElWRV9MT1c+Owo+Pgo+PiBGaW5lLCBi
dXQgd2h5IG5vdCB1c2UgMyBjZWxscyBpbnN0ZWFkIG9mIHRoaXMgbWFjcm8gPyBTaW5jZSB5b3Ug
aW50cm9kdWNlZCB0aGUKPj4gY3VzdG9tIHhsYXRlLCBwYXJzaW5nIHRoZSAzIGNlbGxzIHdvdWxk
IGJlIGVhc2llciB0aGF0IHVzaW5nIGEgbWFjcm86Cj4+Cj4+IHJlc2V0LWdwaW9zID0gPCZncGlv
IEFNTE9HSUNfR1BJT19YIDYgR1BJT19BQ1RJVkVfTE9XPjsKPj4KPj4gTmVpbAo+IAo+IEkgd2Fz
IHByZXBhcmVkIHRvIGRvIHRoaXMgYmVmb3JlLCBtYWlubHkgbGF0ZXIgY29uc2lkZXJpbmcgaW5j
b21wYXRpYmxlIGJpbmRpbmcsIHVzaW5nIHRoZSBvcmlnaW5hbCB0d28gcGFyYW1ldGVyIHBhc3Np
bmcKPiAKPiBJZiB1c2UgdGhyZWUgcGFyYW1ldGVycywgScKgIG5lZWQgdG8gbW9kaWZ5IHRoZSBj
b3JyZXNwb25kaW5nIGJpbmRpbmcgcHJvcGVydHkuIGluIGZpbGU6Cj4gRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvYW1sb2dpYyxtZXNvbi1waW5jdHJsLWNvbW1vbi55
YW1sCj4gCj4gIMKgwqDCoMKgwqAgIiNncGlvLWNlbGxzIjoKPiAgwqDCoMKgwqDCoMKgwqAgY29u
c3Q6IDIKPiBJdCBtdXN0IGJlIGNvbXBhdGlibGUgd2l0aCB0aGUgY3VycmVudCBudW1iZXIgb2Yg
cGFyYW1ldGVycygzKQoKWWVzLCB5b3UgbWF5IG1vdmUgdGhlICNncGlvLWNlbGxzIGRlZmluaXRp
b24gb3V0IG9mIHRoZSBjb21tb24geWFtbAphbmQgZGVmaW5lIHRoZW0gaW4gdGhlIHNvYyBzcGVm
aWMgeWFtbCBhbmQgc2V0IGl0IHRvIDMgZm9yIGE0LgoKTmVpbAoKPiAKPj4KPj4+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPj4+IC0t
LQo+Pj4gQ2hhbmdlcyBpbiB2NDoKPj4+IC0gQWRkIGludGVyZmFjZSBvZiBvZl94bGF0ZSBzdXBw
b3J0Lgo+Pj4gLSBBZGQgY29uc3QgZm9yIHNvbWUgdmFyaWFibGUuCj4+PiAtIExpbmsgdG8gdjM6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDEwMTgtYTRfcGluY3RybC12My0wLWU3NmZk
MWNmMDFkN0BhbWxvZ2ljLmNvbQo+Pj4KPj4+IENoYW5nZXMgaW4gdjM6Cj4+PiAtIFJlbW92ZSBo
ZWFkIGZpbGUgZnJvbSBiaW5kaW5nLgo+Pj4gLSBNb3ZlIEdQSU8gZGVmaW5lIHRvIGZpbGUgKi5j
Lgo+Pj4gLSBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQxMDE0LWE0
X3BpbmN0cmwtdjItMC0zZTc0YTY1YzI4NWVAYW1sb2dpYy5jb20KPj4+Cj4+PiBDaGFuZ2VzIGlu
IHYyOgo+Pj4gLSBVc2Ugb25lIG1hcmNvIGluc3RlYWQgb2YgYWxsIHBpbiBkZWZpbmUuCj4+PiAt
IEFkZCB1bml0IG5hbWUgZm9yIGR0cyBub2RlLgo+Pj4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyNDA2MTEtYTRfcGluY3RybC12MS0wLWRjNDg3YjE5NzdiM0Bh
bWxvZ2ljLmNvbS8KPj4+Cj4+PiAtLS0KPj4+IFhpYW53ZWkgWmhhbyAoNCk6Cj4+PiDCoMKgwqDC
oMKgwqAgZHQtYmluZGluZ3M6IHBpbmN0cmw6IEFkZCBzdXBwb3J0IGZvciBBbWxvZ2ljIEE0IFNv
Q3MKPj4+IMKgwqDCoMKgwqDCoCBwaW5jdHJsOiBtZXNvbjogYWRkIGludGVyZmFjZSBvZiBvZl94
bGF0ZQo+Pj4gwqDCoMKgwqDCoMKgIHBpbmN0cmw6IG1lc29uOiBBZGQgZHJpdmVyIHN1cHBvcnQg
Zm9yIEFtbG9naWMgQTQgU29Dcwo+Pj4gwqDCoMKgwqDCoMKgIGFybTY0OiBkdHM6IGFtbG9naWM6
IGE0OiBhZGQgcGluY3RybCBub2RlCj4+Pgo+Pj4gwqAgLi4uL2JpbmRpbmdzL3BpbmN0cmwvYW1s
b2dpYyxtZXNvbi1waW5jdHJsLWExLnlhbWwgfMKgwqDCoCAyICsKPj4+IMKgIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLWE0LmR0c2nCoMKgwqDCoMKgwqDCoCB8wqDCoCAzNiAr
Cj4+PiDCoCBkcml2ZXJzL3BpbmN0cmwvbWVzb24vS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgIDYgKwo+Pj4gwqAgZHJpdmVycy9waW5jdHJs
L21lc29uL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqDCoMKgIDEgKwo+Pj4gwqAgZHJpdmVycy9waW5jdHJsL21lc29uL3BpbmN0cmwtYW1sb2dpYy1h
NC5jwqDCoMKgwqDCoMKgwqDCoCB8IDEzMjEgKysrKysrKysrKysrKysrKysrKysKPj4+IMKgIGRy
aXZlcnMvcGluY3RybC9tZXNvbi9waW5jdHJsLW1lc29uLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqDCoMKgIDQgKwo+Pj4gwqAgZHJpdmVycy9waW5jdHJsL21lc29uL3BpbmN0cmwtbWVz
b24uaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAgNCArCj4+PiDCoCBpbmNsdWRl
L2R0LWJpbmRpbmdzL2dwaW8vYW1sb2dpYy1ncGlvLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oMKgIDUwICsKPj4+IMKgIDggZmlsZXMgY2hhbmdlZCwgMTQyNCBpbnNlcnRpb25zKCspCj4+PiAt
LS0KPj4+IGJhc2UtY29tbWl0OiA1OGUyZDI4ZWQyOGU1YmM4ODM2ZjhjMTRkZjFmOTRjMjdjMWY5
ZTJmCj4+PiBjaGFuZ2UtaWQ6IDIwMjQxMDEyLWE0X3BpbmN0cmwtMDlkMWIyYTE3ZTQ3Cj4+Pgo+
Pj4gQmVzdCByZWdhcmRzLAo+PgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
