Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07F2D13570
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Oct 2024 09:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/otSTzIU5KGtVZFjMQ2TNAlRjoNtF4cu+FpABunjfY=; b=WfrZyixAq44T6fvyFfZpjRw/9a
	PXW+C24ZImttyRExflkd6TCFlm2dtJQoykFtVYgZsu8/dkyppPWrT1YOFnRcM+vwLXBHPQDo0eAp7
	+B9luiMXnkW8BlgFrf/U2wGwXaIIWvN2DTuRjsKyEM8s12m7w7tddFrFw8UpxAyd057pqGd41lRIy
	ouRFmretamhSexQMnT8XvEceKTgEkhTyfRq0rfH08NILqj/nknO13+Skg2MX6lhFNd0dLEDIYJZDa
	FMAj2ohmiRI81cczLDsJZBlFvFQbJoTo+N7M6JUNmHo7VS0SnBvlk7+CMUfHI9RMqvILyR3zUIdHP
	CfGIfzfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MWv-0000000AKGV-3rTM;
	Mon, 28 Oct 2024 09:59:21 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MKS-0000000AHcE-3ACY
	for linux-amlogic@lists.infradead.org;
	Mon, 28 Oct 2024 09:46:31 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2fb51f39394so38862491fa.2
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Oct 2024 02:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730108787; x=1730713587; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hxtPA/U78ERZ+ppdXXWbhxnMqxfDhJ72xcfBzWrzRXU=;
        b=DVz2z2DuGRn4LJR4JgqrHDyg/A9zAQKQolDdvZytjPIwY0jOGwdOeu7DDL04YVk78G
         hxvZ9ez+AuqDe34XsmuUZA54HyBJavVY77RKV07Fh6FkGp8AWSIQUoGROZFLl47tApzS
         gGdZylmPdxxxss4eI6gdag4Z0P5AvBwwMhXl+Hb21xHkf0ovsUJv5tWd7eN0vYCuao1M
         IuTvMRzOZ0z2LkPmZ3t+nIgEsn2rL5gJKNgM6sCaLzAh1Lk2M5aV+H+cLecfve3xQl0P
         uLpvSg6VTyws2DcOAUdvP3UhIrFygKMAgTbzX9J3nJQOyNB5lGuW6nkdIE8O65BQUm9p
         ttDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730108787; x=1730713587;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hxtPA/U78ERZ+ppdXXWbhxnMqxfDhJ72xcfBzWrzRXU=;
        b=HWV8ISZDeBWrp3WkMJqdjWs4pplcVbLZttGCX9m5l8RBWS8WXHyKwCNxzo+FfP/auB
         2oE9qULvY7lpAsGxWpnG0Pqah5y3RRlK5266LgIU7rw1UAWfQVVSj0hzBtWSj3zLyZ3T
         31PP9et1YFbEqf+G7uYiHIWIzOj52/JkmEczHoTauRyGb0Nm0KSwfxUexjujAiZYk8fn
         unyvq5+d84hpps5PkXY3yNCdhxYt+7HCNt+LUMgzZag1bCZrcprYGe/+kEJVlu5Gni4z
         y4ev3dcn7Jhh5KbU6E0nTOfwC7NYzQ+PQERu1RRQZwrT5yzFTDgO/inib8eVSH3v/ylc
         sVog==
X-Forwarded-Encrypted: i=1; AJvYcCVFpWeSaFngt0y7tRI2yrbzdZWp3JOe5bywp8/tDpfDlqU6nE7PTAdR7f3BSIWGPVAvhGZGH/wQCiUblW03@lists.infradead.org
X-Gm-Message-State: AOJu0YxtwRKyxOBtwv3rhYCiD8i7d6PNJZIAZvEmjwj927VW9XmDqqRB
	XYBpK6qAjxsZOzv8C3lJxqaLX2vDYbDB1uL4z8npspLbcB/wQtsGcgJkk93euNo=
X-Google-Smtp-Source: AGHT+IFWhDgOD4KwMZ5u7zjg9xk4YCKQ/VGKmAhMl71E6/XB3UI+mDlDu4avbbZcnOkfYTddUxKcDw==
X-Received: by 2002:a05:651c:b20:b0:2fb:3bc0:9c7c with SMTP id 38308e7fff4ca-2fcbe005e17mr28310221fa.25.1730108786669;
        Mon, 28 Oct 2024 02:46:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c11d:e163:200e:8a5d? ([2a01:e0a:982:cbb0:c11d:e163:200e:8a5d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431935a4ad8sm103872435e9.23.2024.10.28.02.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 02:46:26 -0700 (PDT)
Message-ID: <a0c30691-ad28-4217-bf46-924fca5f48de@linaro.org>
Date: Mon, 28 Oct 2024 10:46:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Amlogic A4
 SoCs
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
 <20241018-a4_pinctrl-v3-1-e76fd1cf01d7@amlogic.com>
 <4a79f996-9d82-48b2-8a93-d7917413ed8c@kernel.org>
 <1jttd9rein.fsf@starbuckisacylon.baylibre.com>
 <4127b448-a914-4c69-b938-29512995326f@amlogic.com>
 <1jmsj1rclh.fsf@starbuckisacylon.baylibre.com>
 <d654d2b2-977b-44c0-8b01-b26f5eb0a3fe@kernel.org>
 <5ad8f396-84a5-486d-b90d-98fbf8882d1b@linaro.org>
 <e6cd13b5-2f7a-4ab1-899c-5867bc0ea64f@kernel.org>
 <fdb4d0eb-a5e5-4061-b3cc-14958473baf3@linaro.org>
 <c8a03fa6-9ac5-434f-ba13-78e47ad341b8@kernel.org>
 <f6c4cee8-dd22-4b30-a3b2-aee48e2c3611@linaro.org>
 <91bcc765-2e56-433d-a629-c5255fc8d256@kernel.org>
 <24acd645-4094-48aa-82e3-42d30a340884@amlogic.com>
 <78e6ca30-9fd6-4384-9583-440c485fb8ed@linaro.org>
 <d4ae04da-d841-49e8-be88-b0fe0c7b3de5@amlogic.com>
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
In-Reply-To: <d4ae04da-d841-49e8-be88-b0fe0c7b3de5@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_024628_832149_B0231A9A 
X-CRM114-Status: GOOD (  20.49  )
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

T24gMjgvMTAvMjAyNCAxMDozNiwgWGlhbndlaSBaaGFvIHdyb3RlOgo+IEhpIE5laWwsCj4gIMKg
wqAgVGhhbmtzIGZvciB5b3VyIGFkdmljZS4KPiAKPiBPbiAyMDI0LzEwLzI4IDE3OjA5LCBuZWls
LmFybXN0cm9uZ0BsaW5hcm8ub3JnIHdyb3RlOgo+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4KPj4g
T24gMjgvMTAvMjAyNCAxMDowNywgWGlhbndlaSBaaGFvIHdyb3RlOgo+Pj4gSGkgTmVpbCwKPj4+
IMKgwqDCoMKgIEJhc2VkIG9uIHRoZSBjdXJyZW50IGRpc2N1c3Npb24gcmVzdWx0cywgR1BJTyBp
bmRleCBtYWNybyBkZWZpbml0aW9uIGRvZXMgbm90IGJlbG9uZyB0byBiaW5kaW5ncy4gSWYgc28s
IHRoZSBwaW5jdHJsIGRyaXZlciBrZWVwcyB0aGUgZXhpc3RpbmcgYXJjaGl0ZWN0dXJlLCBhbmQg
dXNlIG51bWJlcnMgaW5zdGVhZCBpbiBkdHMgZmlsZS4gT3IgdGhlIHBpbmN0cmwgZHJpdmVyIHVz
ZSBiYW5rIG1vZGUgYWNlc3MsIHRoaXMgbWF5IG5vdCBiZSBjb21wYXRpYmxlIHdpdGggZXhpc3Rp
bmcgZnJhbWV3b3Jrcy4gVGhpcyBpcyBkb25lIGJ5IGFkZGluZyBvZl94bGF0ZSBob29rIGZ1bmN0
aW9ucyBpbiBwaW5jdHJsX2NoaXAgc3RydWN0Lgo+Pj4KPj4+IFdoYXQgaXMgeW91ciBhZHZpY2Ug
dGhhdCBJIGNhbiBpbXBsZW1lbnQgaW4gdGhlIG5leHQgdmVyc2lvbi4gVGhhbmtzIQo+Pgo+PiBL
ZWVwIHRoZSBkcml2ZXIgYXMtaXMsIGJ1dCBtb3ZlIHRoZSBoZWFkZXIgZmlsZSBpbnRvIGFyY2gv
YXJtNjQvYm9vdC9kdHMvYW1sb2dpYyBsaWtlIGl0IHdhcyBkb25lIGZvciB0aGUgbGFzdCByZXNl
dCBjb250cm9sbGVyIHN1cHBvcnQ6Cj4+IGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxv
Z2ljLXQ3LXJlc2V0LmgKPj4KPiAKPiBJIGRvbid0IHNlZSBleGFtcGxlcyBDIGZpbGUgYXBwbGll
cyBkdHMgaGVhZGVyIGZpbGUuCj4gQyBmaWxlIG5lZWQgdG8gYmUgZGVmaW5lZCBvbmNlLCBhbmQg
dGhpcyBuZWVkcyB0byBiZSBkZWZpbmVkIGFnYWluIGluIGR0cyBoZWFkZXIgZmlsZS4KClNvcnJ5
IGNvdWxkIHlvdSByZXBocmFzZSwgdGhlIHNlbnRlbmNlIGlzbid0IGNsZWFyLgoKTmVpbAoKPiAK
Pj4gTmVpbAo+Pgo+Pj4KPj4+IE9uIDIwMjQvMTAvMjEgMjM6MjcsIEtyenlzenRvZiBLb3psb3dz
a2kgd3JvdGU6Cj4+Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Pj4KPj4+PiBPbiAyMS8xMC8yMDI0
IDEyOjM4LCBuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnIHdyb3RlOgo+Pj4+Pj4+ID09PT0+PD09
PT09PT09PT09PT09PT09Cj4+Pj4+Pj4gKy8qIFN0YW5kYXJkIHBvcnQgKi8KPj4+Pj4+PiArI2Rl
ZmluZSBHUElPQl9TVEFSVMKgwqDCoMKgwqDCoMKgIDAKPj4+Pj4+PiArI2RlZmluZSBHUElPQl9O
VU3CoCAxNAo+Pj4+Pj4+ICsKPj4+Pj4+PiArI2RlZmluZSBHUElPRF9TVEFSVMKgwqDCoMKgwqDC
oMKgIChHUElPQl9TVEFSVCArIEdQSU9CX05VTSkKPj4+Pj4+PiArI2RlZmluZSBHUElPRF9OVU3C
oCAxNgo+Pj4+Pj4+ICsKPj4+Pj4+PiArI2RlZmluZSBHUElPRV9TVEFSVMKgwqDCoMKgwqDCoMKg
IChHUElPRF9TVEFSVCArIEdQSU9EX05VTSkKPj4+Pj4+PiArI2RlZmluZSBHUElPRV9OVU3CoCAy
Cj4+Pj4+Pj4gKwo+Pj4+Pj4+ICsjZGVmaW5lIEdQSU9UX1NUQVJUwqDCoMKgwqDCoMKgwqAgKEdQ
SU9FX1NUQVJUICsgR1BJT0VfTlVNKQo+Pj4+Pj4+ICsjZGVmaW5lIEdQSU9UX05VTcKgIDIzCj4+
Pj4+Pj4gKwo+Pj4+Pj4+ICsjZGVmaW5lIEdQSU9YX1NUQVJUwqDCoMKgwqDCoMKgwqAgKEdQSU9U
X1NUQVJUICsgR1BJT1RfTlVNKQo+Pj4+Pj4+ICsjZGVmaW5lIEdQSU9YX05VTcKgIDE4Cj4+Pj4+
Pj4gKwo+Pj4+Pj4+ICsjZGVmaW5lIFBFUklQSFNfUElOX05VTcKgwqDCoCAoR1BJT1hfU1RBUlQg
KyBHUElPWF9OVU0pCj4+Pj4+Pj4gKwo+Pj4+Pj4+ICsvKiBBb2J1cyBwb3J0ICovCj4+Pj4+Pj4g
KyNkZWZpbmUgR1BJT0FPX1NUQVJUwqDCoMKgwqDCoMKgIDAKPj4+Pj4+PiArI2RlZmluZSBHUElP
QU9fTlVNIDcKPj4+Pj4+PiArCj4+Pj4+Pj4gKy8qIEl0J3MgYSBzcGVjaWFsIGRlZmluaXRpb24s
IHB1dCBhdCB0aGUgZW5kLCBqdXN0IDEgbnVtICovCj4+Pj4+Pj4gKyNkZWZpbmXCoMKgwqAgR1BJ
T19URVNUX07CoMKgwqDCoCAoR1BJT0FPX1NUQVJUICvCoCBHUElPQU9fTlVNKQo+Pj4+Pj4+ICsj
ZGVmaW5lwqDCoMKgIEFPQlVTX1BJTl9OVU3CoMKgIChHUElPX1RFU1RfTiArIDEpCj4+Pj4+Pj4g
Kwo+Pj4+Pj4+ICsjZGVmaW5lIEFNTE9HSUNfR1BJTyhwb3J0LCBvZmZzZXQpIChwb3J0IyNfU1RB
UlQgKyAob2Zmc2V0KSkKPj4+Pj4+PiA9PT09Pjw9PT09PT09PT09PT09PT09PQo+Pj4+Pj4+Cj4+
Pj4+Pj4gaXMgZXhhY3RseSB3aGF0IHJvYiBhc2tlZCBmb3IsIGFuZCB5b3UgbmFja2VkIGl0Lgo+
Pj4+Pj4KPj4+Pj4+IE5vLCB0aGlzIGlzIG5vdCB3aGF0IHdhcyBhc2tlZCwgYXQgbGVhc3QgYWNj
b3JkaW5nIHRvIG15IHVuZGVyc3RhbmRpbmcuCj4+Pj4+PiBOdW1iZXIgb2YgR1BJT3MgaXMgbm90
IGFuIEFCSS4gTmVpdGhlciBpcyB0aGVpciByZWxhdGlvbnNoaXAsIHdoZXJlIG9uZQo+Pj4+Pj4g
c3RhcnRzIGFuZCBvdGhlciBlbmRzLgo+Pj4+Pgo+Pj4+PiBJIGNvbmZpcm0gdGhpcyBuZWVkIHNv
bWUgd29yaywgYnV0IGl0IG1vdmVkIHRoZSBwZXItcGluIGRlZmluZSB0byBzdGFydAo+Pj4+PiBh
bmQgcmFuZ2VzLCBzbyB3aGF0IGRpZCByb2IgZXhwZWN0ID8KPj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBN
YXliZSBJIG1pc3NlZCBzb21ldGhpbmcsIGJ1dCBJIGNvdWxkIG5vdCBmaW5kIGFueSB1c2VycyBv
ZiB0aGVzZSBpbiB0aGUKPj4+Pj4+IERUUy4gTG9vazoKPj4+Pj4+Cj4+Pj4+PiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyNDEwMTQtYTRfcGluY3RybC12Mi0zLTNlNzRhNjVjMjg1ZUBh
bWxvZ2ljLmNvbS8KPj4+Pj4KPj4+Pj4gU28geW91IHdhbnQgY29uc3VtZXJzIGJlZm9yZSB0aGUg
YmluZGluZ3MgPyBzdHJhbmdlIGFyZ3VtZW50Cj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gV2hlcmUgaXMg
YW55IG9mIGFib3ZlIGRlZmluZXM/Cj4+Pj4+Pgo+Pj4+Pj4gTWF5YmUgdGhleSB3aWxsIGJlIHZp
c2libGUgaW4gdGhlIGNvbnN1bWVyIGNvZGUsIGJ1dCBJIGRpZCBub3QgaW1hZ2luZQo+Pj4+Pj4g
c3VjaCB1c2UuIFlvdSBleHBlY3Q6Cj4+Pj4+PiByZXNldC1ncGlvcyA9IDwmY3RybCBHUElPQU9f
U1RBUlQgMT4/Pz8KPj4+Pj4KPj4+Pj4gTm8gSSBleHBlY3Q6Cj4+Pj4+IHJlc2V0LWdwaW9zID0g
PCZjdHJsIEFNTE9HSUNfR1BJTyhCLCAwKSAxPjsKPj4+Pj4KPj4+Pj4gYnV0IHRoZSBtYWNybyBz
aG91bGQgZ28gYWxvbmcgdGhlIGR0cyBsaWtlIHdlIGRpZCBmb3IgdGhlIHJlc2V0IGRlZmluZXMs
Cj4+Pj4+IHNvIHBlcmhhcHMgdGhpcyBpcyB0aGUgc29sdXRpb24gPwo+Pj4+Cj4+Pj4gT0ssIHNv
IEkgc2FpZCBpdCB3YXMgbm90IGEgYmluZGluZzoKPj4+PiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvdTRhZnhxYzNsdWRzaWM0bjNoczNyM2RyZzNmdG1zYmN3ZmpsdGljMm1iNjZmb280N3hA
eGU1N2dsdGw3N2hxLwo+Pj4+Cj4+Pj4gYW5kIHlvdSBoZXJlIGNvbmZpcm0sIGlmIEkgdW5kZXJz
dG9vZCB5b3UgY29ycmVjdGx5LCB0aGF0IGl0IGdvZXMgd2l0aAo+Pj4+IHRoZSBEVFMgbGlrZSBy
ZXNldCBkZWZpbmVzIChJIGFzc3VtZSBub24tSUQgbGlrZSBkZWZpbmVzPyksIHNvIGFsc28gbm90
Cj4+Pj4gYSBiaW5kaW5nPwo+Pj4+Cj4+Pj4gV2hhdCBhcmUgd2UgZGlzYWdyZWVpbmcgd2l0aD8K
Pj4+Pgo+Pj4+IEp1c3QgdG8gcmVjYWxsLCBKZXJvbWUgYXNrZWQgd2hldGhlciB5b3UgaGF2ZSB0
byBub3cgdXNlIGFyYml0cmFyeQo+Pj4+IG51bWJlcnMgaW4gRFRTIGFuZCBteSBhbnN3ZXIgd2Fz
OiBub3QuIEl0J3Mgc3RpbGwgdGhlIHNhbWUgYW5zd2VyLgo+Pj4+Cj4+Pj4gQmVzdCByZWdhcmRz
LAo+Pj4+IEtyenlzenRvZgo+Pj4+Cj4+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
