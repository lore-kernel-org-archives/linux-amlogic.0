Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6746CD13570
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Oct 2024 09:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7sC1qo8ntJZiQOx+zscMbcxK6Twu6LTXqw+ZWsYZlY=; b=pS3t3QQYa0hPRgKPcALzr3wFcd
	hmjCzkhXejsE5wqiDW+Wrwcpy/17tyz1jgOI2mJSFOp3OU9lc68+7QZo5bXsPU+bZV+1oL+QrRMeY
	XjxLFQDX6nI/aytE4le1P9wm7zVDHha0sP+wlq2hX5ammxpkaDPpyrnfNkq6Vu91J89H5VBWlZP4/
	HXJE/IjiyKgxGbnK+W5yijz65nydGmk/CxARuDqGISEiNZHqSyWIeE735u8m5G36gU3+mk/UYdGsE
	R517BZAargTYnSgJ5EIGswSna48B2QBMmT/V8IOoXkTRqgZ5OgwInqnDdIJi/i8q2ornVIIREBR+l
	7ZLgI3hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Lo7-0000000ABz6-3zmm;
	Mon, 28 Oct 2024 09:13:03 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Ll0-0000000ABVC-31sS
	for linux-amlogic@lists.infradead.org;
	Mon, 28 Oct 2024 09:09:52 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so38150945e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Oct 2024 02:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730106589; x=1730711389; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6WSoUlcilR10/7Zye998C2La39OrksNIeUhu2dsusHQ=;
        b=oHVR55qMyNznGBvzg+Yx8qWUA4Z0NdHfRbjKgHs6LqeWX1aKZmoQ+iSZVw4nUCW24f
         XgXg8KBU0HozPIO7SfCj+LtZpxh0LKIq19q/0LuiUHj41Z702sJ6OMDR0/hJl1PI5gQp
         xlAT3D577sNxrwe2eniJZNiVo5vwnpJ3cStulhoWzj1Lm5xATUVOHPti2yL1VsNNQJSv
         KL0d7Uh/nOIDU+0Yqufr8uZbRIhDctmDJGW2JaZQw+om3gBK0GtFw/QZFhw+09Y6cYnF
         2VydIuBXM/xcd76Gc10hWpUbYwFvu6+il/0wAdoYbt2wiQzjJ4uaFkkz56+rKEL9bDGg
         hS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730106589; x=1730711389;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6WSoUlcilR10/7Zye998C2La39OrksNIeUhu2dsusHQ=;
        b=HeiacCNIRKcHmXKZKApvqmjpgdGYr4zWejcW5EGEKy5t0E6JrKLUwDszrA0rVphPln
         VcoydFeePZ8G4G7GnN+tvVL0KQC71R/CSdPvYFyqZwYfCJmV2aJ2KOJOmQzrodKsbAt/
         w9ZrSCefqIpritVWKxgzmgk1zOVNWJZ1oy6Y6zzfqbdHPgr1RsKoGH5RysaZuIiZ56ZP
         GWeV0TWlwUiwTEOfZukSKgDKtbvTWiSZMbokERkDtjxq9MQsf0J/o2rBUj4JxBgMy/Td
         KiHPAAKL1LPUWwB+d3DBdtIhIz4yriU4J80oqF1bbL+BOYGf4iQEd77gkq797Iy82hI5
         8wkg==
X-Forwarded-Encrypted: i=1; AJvYcCWsbxF3fyUFln669P4aEflAWiE5biiBn+MR+EQsCe2SzzCDVyJp7IVqF6GTmlk+mf65ISHr6vedgPj6Lv8v@lists.infradead.org
X-Gm-Message-State: AOJu0Yyag9zL0t61OuqtZe7uRTKzB4/AEa7zbzhA+9oGBru/nYcKaRVI
	MPLoyo3KF17QhaEamOup2sfJIwjIZ7Uf/MY2ct17Xq+jG9Pn4BaUlWtATYiLc6w=
X-Google-Smtp-Source: AGHT+IGbPSgHOd+5IoVfmKyOdhPyi6YNnIbge2Mu4Zhd8I9c7qhNtGSN9F6GBe245KWWr9fvZyKAoA==
X-Received: by 2002:adf:fb92:0:b0:37d:2e78:8875 with SMTP id ffacd0b85a97d-38061224176mr5337702f8f.56.1730106589096;
        Mon, 28 Oct 2024 02:09:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c11d:e163:200e:8a5d? ([2a01:e0a:982:cbb0:c11d:e163:200e:8a5d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b91d36sm8849790f8f.95.2024.10.28.02.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 02:09:48 -0700 (PDT)
Message-ID: <78e6ca30-9fd6-4384-9583-440c485fb8ed@linaro.org>
Date: Mon, 28 Oct 2024 10:09:45 +0100
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
In-Reply-To: <24acd645-4094-48aa-82e3-42d30a340884@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_020950_792323_471ADA99 
X-CRM114-Status: GOOD (  18.18  )
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

T24gMjgvMTAvMjAyNCAxMDowNywgWGlhbndlaSBaaGFvIHdyb3RlOgo+IEhpIE5laWwsCj4gIMKg
wqDCoCBCYXNlZCBvbiB0aGUgY3VycmVudCBkaXNjdXNzaW9uIHJlc3VsdHMsIEdQSU8gaW5kZXgg
bWFjcm8gZGVmaW5pdGlvbiBkb2VzIG5vdCBiZWxvbmcgdG8gYmluZGluZ3MuIElmIHNvLCB0aGUg
cGluY3RybCBkcml2ZXIga2VlcHMgdGhlIGV4aXN0aW5nIGFyY2hpdGVjdHVyZSwgYW5kIHVzZSBu
dW1iZXJzIGluc3RlYWQgaW4gZHRzIGZpbGUuwqAgT3IgdGhlIHBpbmN0cmwgZHJpdmVyIHVzZSBi
YW5rIG1vZGUgYWNlc3MsIHRoaXMgbWF5IG5vdCBiZSBjb21wYXRpYmxlIHdpdGggZXhpc3Rpbmcg
ZnJhbWV3b3Jrcy4gVGhpcyBpcyBkb25lIGJ5IGFkZGluZyBvZl94bGF0ZSBob29rIGZ1bmN0aW9u
cyBpbiBwaW5jdHJsX2NoaXAgc3RydWN0Lgo+IAo+IFdoYXQgaXMgeW91ciBhZHZpY2UgdGhhdCBJ
IGNhbiBpbXBsZW1lbnQgaW4gdGhlIG5leHQgdmVyc2lvbi4gVGhhbmtzIQoKS2VlcCB0aGUgZHJp
dmVyIGFzLWlzLCBidXQgbW92ZSB0aGUgaGVhZGVyIGZpbGUgaW50byBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL2FtbG9naWMgbGlrZSBpdCB3YXMgZG9uZSBmb3IgdGhlIGxhc3QgcmVzZXQgY29udHJvbGxl
ciBzdXBwb3J0OgphcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1yZXNldC5o
CgpOZWlsCgo+IAo+IE9uIDIwMjQvMTAvMjEgMjM6MjcsIEtyenlzenRvZiBLb3psb3dza2kgd3Jv
dGU6Cj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pgo+PiBPbiAyMS8xMC8yMDI0IDEyOjM4LCBuZWls
LmFybXN0cm9uZ0BsaW5hcm8ub3JnIHdyb3RlOgo+Pj4+PiA9PT09Pjw9PT09PT09PT09PT09PT09
PQo+Pj4+PiArLyogU3RhbmRhcmQgcG9ydCAqLwo+Pj4+PiArI2RlZmluZSBHUElPQl9TVEFSVMKg
wqDCoMKgwqDCoMKgIDAKPj4+Pj4gKyNkZWZpbmUgR1BJT0JfTlVNwqAgMTQKPj4+Pj4gKwo+Pj4+
PiArI2RlZmluZSBHUElPRF9TVEFSVMKgwqDCoMKgwqDCoMKgIChHUElPQl9TVEFSVCArIEdQSU9C
X05VTSkKPj4+Pj4gKyNkZWZpbmUgR1BJT0RfTlVNwqAgMTYKPj4+Pj4gKwo+Pj4+PiArI2RlZmlu
ZSBHUElPRV9TVEFSVMKgwqDCoMKgwqDCoMKgIChHUElPRF9TVEFSVCArIEdQSU9EX05VTSkKPj4+
Pj4gKyNkZWZpbmUgR1BJT0VfTlVNwqAgMgo+Pj4+PiArCj4+Pj4+ICsjZGVmaW5lIEdQSU9UX1NU
QVJUwqDCoMKgwqDCoMKgwqAgKEdQSU9FX1NUQVJUICsgR1BJT0VfTlVNKQo+Pj4+PiArI2RlZmlu
ZSBHUElPVF9OVU3CoCAyMwo+Pj4+PiArCj4+Pj4+ICsjZGVmaW5lIEdQSU9YX1NUQVJUwqDCoMKg
wqDCoMKgwqAgKEdQSU9UX1NUQVJUICsgR1BJT1RfTlVNKQo+Pj4+PiArI2RlZmluZSBHUElPWF9O
VU3CoCAxOAo+Pj4+PiArCj4+Pj4+ICsjZGVmaW5lIFBFUklQSFNfUElOX05VTcKgwqDCoCAoR1BJ
T1hfU1RBUlQgKyBHUElPWF9OVU0pCj4+Pj4+ICsKPj4+Pj4gKy8qIEFvYnVzIHBvcnQgKi8KPj4+
Pj4gKyNkZWZpbmUgR1BJT0FPX1NUQVJUwqDCoMKgwqDCoMKgIDAKPj4+Pj4gKyNkZWZpbmUgR1BJ
T0FPX05VTSA3Cj4+Pj4+ICsKPj4+Pj4gKy8qIEl0J3MgYSBzcGVjaWFsIGRlZmluaXRpb24sIHB1
dCBhdCB0aGUgZW5kLCBqdXN0IDEgbnVtICovCj4+Pj4+ICsjZGVmaW5lwqDCoMKgIEdQSU9fVEVT
VF9OwqDCoMKgwqAgKEdQSU9BT19TVEFSVCArwqAgR1BJT0FPX05VTSkKPj4+Pj4gKyNkZWZpbmXC
oMKgwqAgQU9CVVNfUElOX05VTcKgwqAgKEdQSU9fVEVTVF9OICsgMSkKPj4+Pj4gKwo+Pj4+PiAr
I2RlZmluZSBBTUxPR0lDX0dQSU8ocG9ydCwgb2Zmc2V0KSAocG9ydCMjX1NUQVJUICsgKG9mZnNl
dCkpCj4+Pj4+ID09PT0+PD09PT09PT09PT09PT09PT09Cj4+Pj4+Cj4+Pj4+IGlzIGV4YWN0bHkg
d2hhdCByb2IgYXNrZWQgZm9yLCBhbmQgeW91IG5hY2tlZCBpdC4KPj4+Pgo+Pj4+IE5vLCB0aGlz
IGlzIG5vdCB3aGF0IHdhcyBhc2tlZCwgYXQgbGVhc3QgYWNjb3JkaW5nIHRvIG15IHVuZGVyc3Rh
bmRpbmcuCj4+Pj4gTnVtYmVyIG9mIEdQSU9zIGlzIG5vdCBhbiBBQkkuIE5laXRoZXIgaXMgdGhl
aXIgcmVsYXRpb25zaGlwLCB3aGVyZSBvbmUKPj4+PiBzdGFydHMgYW5kIG90aGVyIGVuZHMuCj4+
Pgo+Pj4gSSBjb25maXJtIHRoaXMgbmVlZCBzb21lIHdvcmssIGJ1dCBpdCBtb3ZlZCB0aGUgcGVy
LXBpbiBkZWZpbmUgdG8gc3RhcnQKPj4+IGFuZCByYW5nZXMsIHNvIHdoYXQgZGlkIHJvYiBleHBl
Y3QgPwo+Pj4KPj4+Pgo+Pj4+IE1heWJlIEkgbWlzc2VkIHNvbWV0aGluZywgYnV0IEkgY291bGQg
bm90IGZpbmQgYW55IHVzZXJzIG9mIHRoZXNlIGluIHRoZQo+Pj4+IERUUy4gTG9vazoKPj4+Pgo+
Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MTAxNC1hNF9waW5jdHJsLXYyLTMt
M2U3NGE2NWMyODVlQGFtbG9naWMuY29tLwo+Pj4KPj4+IFNvIHlvdSB3YW50IGNvbnN1bWVycyBi
ZWZvcmUgdGhlIGJpbmRpbmdzID8gc3RyYW5nZSBhcmd1bWVudAo+Pj4KPj4+Pgo+Pj4+IFdoZXJl
IGlzIGFueSBvZiBhYm92ZSBkZWZpbmVzPwo+Pj4+Cj4+Pj4gTWF5YmUgdGhleSB3aWxsIGJlIHZp
c2libGUgaW4gdGhlIGNvbnN1bWVyIGNvZGUsIGJ1dCBJIGRpZCBub3QgaW1hZ2luZQo+Pj4+IHN1
Y2ggdXNlLiBZb3UgZXhwZWN0Ogo+Pj4+IHJlc2V0LWdwaW9zID0gPCZjdHJsIEdQSU9BT19TVEFS
VCAxPj8/Pwo+Pj4KPj4+IE5vIEkgZXhwZWN0Ogo+Pj4gcmVzZXQtZ3Bpb3MgPSA8JmN0cmwgQU1M
T0dJQ19HUElPKEIsIDApIDE+Owo+Pj4KPj4+IGJ1dCB0aGUgbWFjcm8gc2hvdWxkIGdvIGFsb25n
IHRoZSBkdHMgbGlrZSB3ZSBkaWQgZm9yIHRoZSByZXNldCBkZWZpbmVzLAo+Pj4gc28gcGVyaGFw
cyB0aGlzIGlzIHRoZSBzb2x1dGlvbiA/Cj4+Cj4+IE9LLCBzbyBJIHNhaWQgaXQgd2FzIG5vdCBh
IGJpbmRpbmc6Cj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC91NGFmeHFjM2x1ZHNpYzRu
M2hzM3IzZHJnM2Z0bXNiY3dmamx0aWMybWI2NmZvbzQ3eEB4ZTU3Z2x0bDc3aHEvCj4+Cj4+IGFu
ZCB5b3UgaGVyZSBjb25maXJtLCBpZiBJIHVuZGVyc3Rvb2QgeW91IGNvcnJlY3RseSwgdGhhdCBp
dCBnb2VzIHdpdGgKPj4gdGhlIERUUyBsaWtlIHJlc2V0IGRlZmluZXMgKEkgYXNzdW1lIG5vbi1J
RCBsaWtlIGRlZmluZXM/KSwgc28gYWxzbyBub3QKPj4gYSBiaW5kaW5nPwo+Pgo+PiBXaGF0IGFy
ZSB3ZSBkaXNhZ3JlZWluZyB3aXRoPwo+Pgo+PiBKdXN0IHRvIHJlY2FsbCwgSmVyb21lIGFza2Vk
IHdoZXRoZXIgeW91IGhhdmUgdG8gbm93IHVzZSBhcmJpdHJhcnkKPj4gbnVtYmVycyBpbiBEVFMg
YW5kIG15IGFuc3dlciB3YXM6IG5vdC4gSXQncyBzdGlsbCB0aGUgc2FtZSBhbnN3ZXIuCj4+Cj4+
IEJlc3QgcmVnYXJkcywKPj4gS3J6eXN6dG9mCj4+CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
