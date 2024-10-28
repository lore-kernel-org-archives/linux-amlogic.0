Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C77D13570
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Oct 2024 08:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AvuaV0RDhvHcx9i2XbHLefM1homxt8Nq/Tx/7SoQ/Hs=; b=xUapsF3JwVkJEhrJUQdVp8joRg
	vIj/AVpk42XBDzq3SEmevnOoTLCMtThvQMJzHPpDrf1Qklp9XIcA8RKSxpWki+mPi+3i//wDNioxt
	ULnhQUXeqZFM8fU72O4DAhJD6Tajk7tDvl6rcT+PqvZ6Q60DXfYf5WXnX4EEr6rpRreskeZRw81B5
	yrdiYZS7AaCxZW7Qmc0HSDcsyNGK3uFBVMesvvZJmyHzMKrSMT+yqLiXFAUuOUhG71AiBjUyTbaSr
	GjSnhxPjYOa7jIDwffKu7XAS3E4OMtGAb66h38Jy8zCDstOEB7eDQFBg9Li3sERFpitfxo4MaeXEO
	v2GLcVug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5L7G-0000000A5eA-0zl2;
	Mon, 28 Oct 2024 08:28:46 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5L3S-0000000A4wJ-0woR
	for linux-amlogic@lists.infradead.org;
	Mon, 28 Oct 2024 08:24:51 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43167ff0f91so40775015e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Oct 2024 01:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730103888; x=1730708688; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zf7yqaY/4fS/sVqxQ5Fn2xLdDE25Fp1r743nxUQDntE=;
        b=piGohdA9sAU4H+JQvHQjYVexDYMpD6l4FscmdyNujLqYVTABPA1PSSXPxE3qliLQii
         cAprA+DXxmh/cl3cDZ2IPDwQUpPEG85SpTCZ4SYKDs+hswCTzE+Wm+EHDb50iwPyJ+jb
         XY1oVZcsE586D3/IRPfFXQl2nSjo54py/rOnfA/d2/4BckzlEwvZbaGh+1kAr9zNVtPT
         ksFo4jVoJpiK1pceqfOdurNGnH7bFKiD85Dhz6ci1tCHHIPPIMGJa4aYdUXvc+0rquzV
         X/ii1bbf+cHp8R4vTCwB9ihzKgXm7c/h87fS8DM+DE3a+k65aoWMeaTDTkOSVvsHX/cF
         iEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730103888; x=1730708688;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zf7yqaY/4fS/sVqxQ5Fn2xLdDE25Fp1r743nxUQDntE=;
        b=eRKPqVJMQ7+Og1H8UhOCmfNcxLUEL5QJbBFwd9glEcfH0l9PvZUvY2hP7MRFq6xvnm
         t4YeRloeVaTUchlHJpI7VH9vQ9ej/JqCHuBdz5xSWTGMqgu0OJRY/oAKxcueOHzTroGp
         Nrh7ueYPGCnKcImeYui0T+MRX4S/FEs1rVna8ngBXNoqAsTarDHYELotJ9LjDD4lYb/5
         ll4BvtA5ClpUrp8Z9PkKs3I/anr2472MK7/7Uoa0paLwMKx3v13Pz0o8PpuAGsrCKLc7
         cJKlGOlzMCIXHlOxrArOnSyiOfM0kHQaeE7XpCOMDpBNM+DleSPrq3PrE4W+TkJLjIsp
         SZrQ==
X-Gm-Message-State: AOJu0Yx7xl1oP3PETCCoH80aPE9KSPVU//SPuYIWdDkLWPHtZdevqK3h
	o5yLIPJNa1+E24UMzLyUbcUaN9+wemgJ+HHb8YAE1zNU+kwTXWtqqqj+9UjFKjE=
X-Google-Smtp-Source: AGHT+IHyl9qO9CUAbJUctNyfN4E20tM1JVg7g4qzkYELMVvThFrpv+ksGp8ws1vmuhMFSjeR566dgw==
X-Received: by 2002:a05:600c:3b16:b0:431:58bc:ad5e with SMTP id 5b1f17b1804b1-4319ad0b8a9mr56932795e9.28.1730103887594;
        Mon, 28 Oct 2024 01:24:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c11d:e163:200e:8a5d? ([2a01:e0a:982:cbb0:c11d:e163:200e:8a5d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4319360cc2esm101135725e9.44.2024.10.28.01.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 01:24:47 -0700 (PDT)
Message-ID: <2fb6cdf7-c22d-45bc-94ad-213a3c865495@linaro.org>
Date: Mon, 28 Oct 2024 09:24:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: meson: Enabling full-range HDMI output
To: Francisco Ayala Le Brun <francisco@videowindow.eu>
Cc: linux-amlogic@lists.infradead.org
References: <CAN-StX2faaw60pUqRcDtHgrovWYFsM+PGDDAhU8wbT6aeDQKwg@mail.gmail.com>
 <40c07e23-0784-4bcd-8da6-485866e81425@linaro.org>
 <CAN-StX1D8-noDF5a_b08FX-7GAgw+o3UYryUXh3_zmG-MTWfZg@mail.gmail.com>
 <0dea0c5d-62e8-4671-abd2-63790dcfb237@linaro.org>
 <e3224c02-3b5d-48af-828a-f01017fd0fd9@linaro.org>
 <CAN-StX04sLnx+zSSJau=7tngNBH0nikVro+_8RmpbD4cbSa8GA@mail.gmail.com>
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
In-Reply-To: <CAN-StX04sLnx+zSSJau=7tngNBH0nikVro+_8RmpbD4cbSa8GA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_012450_302109_9FDA9E7F 
X-CRM114-Status: GOOD (  27.81  )
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

SGksCgpPbiAyNS8xMC8yMDI0IDEwOjU3LCBGcmFuY2lzY28gQXlhbGEgTGUgQnJ1biB3cm90ZToK
PiBPbiBUaHUsIE9jdCAyNCwgMjAyNCBhdCA4OjUx4oCvQU0gTmVpbCBBcm1zdHJvbmcKPiA8bmVp
bC5hcm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIDI0LzEwLzIwMjQgMTA6Mzgs
IG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmcgd3JvdGU6Cj4+PiBPbiAyMy8xMC8yMDI0IDE0OjEy
LCBGcmFuY2lzY28gQXlhbGEgTGUgQnJ1biB3cm90ZToKPj4+PiBUaGFuayB5b3UgZm9yIHlvdXIg
cmVzcG9uc2UuIEkgY2FuIGNvbmZpcm0gcmV2ZXJ0aW5nIHRoZSBjb21taXQgc29sdmVzCj4+Pj4g
dGhlIGlzc3VlLiBIb3dldmVyLCBpdCBvbmx5IGxlYXZlcyBtZSBtb3JlIGNvbmZ1c2VkIGFzIHRv
IHRoZSByb290Cj4+Pj4gY2F1c2UuCj4+Pj4KPj4+PiBJZiBkdy1oZG1pIGlzIHNldCB0byBvdXRw
dXQgUkdCLCBhbmQgeW91IHNldCB0aGUgQ1NDIG1hdHJpeCB0byB6ZXJvZXMsCj4+Pj4gdGhlbiBp
dCB3aWxsIHNob3cgYSBjb3JyZWN0bHkgY29tcGxldGVseSBibGFjayBvdXRwdXQuIEhvd2V2ZXIs
IGlmIHlvdQo+Pj4+IHNldCB0aGUgZmlyc3QgY29sdW1uIG9mIHRoZSBZVVYtdG8tUkdCIG1hdHJp
eCB0byBvbmVzLCBhbmQgc2hvdyBhCj4+Pj4gYmxhY2sgaW1hZ2UgdmlhIERSTSwgdGhlbiB0aGUg
dG9uZSBpcyBpbiB0aGUgbGltaXRlZCByYW5nZS4gVGhpcwo+Pj4+IHNlZW1lZCB0byBpbmRpY2F0
ZSBkdy1oZG1pIGNhbiBvdXRwdXQgZnVsbCByYW5nZSBSR0IsIGFuZCB0aGUgcHJvYmxlbQo+Pj4+
IHdhcyBmYXJ0aGVyIHVwc3RyZWFtLgo+Pj4+Cj4+Pj4gUGVyaGFwcyB0aGUgcHJvYmxlbSBpcyB0
aGUgQ1NDIG1hdHJpY2VzPyBJIHdhcyB1bmRlciB0aGUgYXNzdW1wdGlvbgo+Pj4+IDB4MjAwMCBj
b3JyZXNwb25kZWQgdG8gMSwgZXZlbiB0aG91Z2ggaS5NWDYgbWFudWFsIGNoYXB0ZXIgMzMgc2Vl
bXMgdG8KPj4+PiBzdWdnZXN0IHdpdGggYSBjc2Nfc2NhbGUgb2YgMSwgdGhlbiAweDgwMCB3b3Vs
ZCBjb3JyZXNwb25kIHRvIDEuCj4+Pj4gU3RpbGwsIEkgd291bGQgZXhwZWN0IGF0IGxlYXN0IGZ1
bGx5IGJsYWNrIHRvIGJlIGNvcnJlY3QgYXMgdGhhdCB3b3VsZAo+Pj4+IGdpdmUgYSBtdWx0aXBs
aWNhdGlvbiBieSB6ZXJvLgo+Pj4+Cj4+Pj4gT3IgdGhlIHN0YXRlIG9mIGR3X2hkbWkgaXMgYWZm
ZWN0aW5nIHRoZSBWSVUgaW4gc29tZSB3YXk/IFBlcmhhcHMgdGhlCj4+Pj4gVklVIGhhcmR3YXJl
IGlzIG1hZGUgdG8gY2xhbXAgbHVtaW5hbmNlIHdoZW4gZHdfaGRtaSBpcyBvdXRwdXR0aW5nCj4+
Pj4gUkdCPyBJIG5vdGljZWQgZm9yIHRoZSBDU0MgdGhlcmUgaXMgb25seSBhIHNwZWNpYWwgbWF0
cml4IGZvcgo+Pj4+IFJHQi10by1saW1pdGVkLVJHQiwgYnV0IG5vIHNwZWNpYWwgbWF0cml4IGZv
ciBZVVYtdG8tbGltaXRlZC1SR0IuIFRoYXQKPj4+PiBzZWVtcyB0byBzdWdnZXN0IHRoZSBjbGFt
cGluZyBtYXkgYmUgZG9uZSB1cHN0cmVhbSBpbiB0aG9zZSBjYXNlcy4KPj4+Pgo+Pj4+IEZyYW5j
aXNjbwo+Pj4+Cj4+Pj4KPj4+PiBPbiBXZWQsIE9jdCAyMywgMjAyNCBhdCA4OjMw4oCvQU0gPG5l
aWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+IHdyb3RlOgo+Pj4+Pgo+Pj4+PiBIaSwKPj4+Pj4KPj4+
Pj4gT24gMjMvMTAvMjAyNCAxMDowMCwgRnJhbmNpc2NvIEF5YWxhIExlIEJydW4gd3JvdGU6Cj4+
Pj4+PiBIZWxsbywKPj4+Pj4+Cj4+Pj4+PiBJIGFtIHNlZWtpbmcgc29tZSBndWlkYW5jZSByZWdh
cmRpbmcgZW5hYmxpbmcgZnVsbC1yYW5nZSBIRE1JIG91dHB1dC4KPj4+Pj4+IFNwZWNpZmljYWxs
eSwgSSBhbSB3b25kZXJpbmcgd2hpY2ggY29tcG9uZW50IGluIHRoZSB2aWRlbyBwaXBlbGluZQo+
Pj4+Pj4gY291bGQgYmUgY2xhbXBpbmcgSERNSSBvdXRwdXQgdmFsdWVzIHRvIDE2LTIzNT8gRnVy
dGhlciBkZXRhaWxzCj4+Pj4+PiBmb2xsb3c6Cj4+Pj4+Pgo+Pj4+Pj4gSSBoYXZlIGJlZW4gdHJ5
aW5nIHRvIGdldCBmdWxsLXJhbmdlIEhETUkgb3V0cHV0IGZyb20gYSBMZSBQb3RhdG8KPj4+Pj4+
IHM5MDV4IFNCQy4gQXQgdGhlIG1vbWVudCwgSERNSSBvdXRwdXQgc2VlbXMgdG8gYmUgaGFyZC1j
b2RlZCB0byBjb2xvcgo+Pj4+Pj4gcXVhbnRpemF0aW9uIGxpbWl0ZWQgcmFuZ2UgKDE2LTIzNSku
IFRoaXMgZ3JlYXRseSBkaW1pbmlzaGVzIHRoZQo+Pj4+Pj4gY29udHJhc3QgaW4gZnVsbCByYW5n
ZSBkaXNwbGF5cy4KPj4+Pj4+Cj4+Pj4+PiBTbyBmYXIgc2V0dGluZyB0aGUgVklVX09TRDEvMl9G
VUxMX1JBTkdFIGJpdCBpbiB0aGUKPj4+Pj4+IFZJVV9PU0QxLzJfQ1RSTF9TVEFUMiByZWdpc3Rl
ciBkb2VzIG5vdCBzZWVtIHRvIHdvcmsuIEkgaGF2ZSBhbHNvCj4+Pj4+PiBsb29rZWQgYXQgdGhl
IGNvbG9yIHNwYWNlIGNvbnZlcnNpb24gbWF0cml4IGluIGR3X2hkbWkgaW4gY2FzZSB0aGF0IGlz
Cj4+Pj4+PiB0aGUgY3VscHJpdCwgYnV0IHRoZSB2YWx1ZXMgc2VlbSBmaW5lIGFuZCBzZXR0aW5n
IHRoYXQgdG8gemVybyBkb2VzCj4+Pj4+PiBwcm9kdWNlIGEgc2lnbmFsIGluIHRoZSBmdWxsIHJh
bmdlICgwKS4gVGhlIGJ1ZmZlciBmcm9tIHRoZSBWSVUgaXMKPj4+Pj4+IHVzaW5nIGEgWVVWIGZv
cm1hdCBzbyBkd19oZG1pIGlzIG5vdCB1c2luZyB0aGUgZnVsbCB0byBsaW1pdGVkIHJhbmdlCj4+
Pj4+PiBjb252ZXJzaW9uIG1hdHJpeC4KPj4+Pj4KPj4+Pj4gSW5kZWVkIHRoZSBpbnRlcm5hbCBW
UFUgcGlwZWxpbmUgaXMgaW4gMTBiaXQgWVVWNDQ0LCBzbyBpdCByZXF1aXJlcyBlbmFibGluZwo+
Pj4+PiB0aGUgZHctaGRtaSBDU0MsIHNvIHBlcmhhcHMgdGhvc2UgYXJlIG5vdCBkZXNpZ25lZCB0
byBvdXRwdXQgZnVsbC1yYW5nZSBSR0IgPwo+Pj4+Pgo+Pj4+PiBDb3VsZCB5b3UgcmV2ZXJ0Ogo+
Pj4+PiBkM2Q2YjFiZjg1YWUgZHJtOiBicmlkZ2U6IGR3X2hkbWk6IGZpeCBwcmVmZXJlbmNlIG9m
IFJHQiBtb2RlcyBvdmVyIFlVVjQyMAo+Pj4+Pgo+Pj4+PiBUaGlzIHdvdWxkIGdpdmUgeW91IGRp
cmVjdCBZVVY0NDQgSERNSSBvdXRwdXQgd2l0aG91dCBDU0MgaW52b2x2ZWQsIHJldmVydGluZwo+
Pj4+PiBpcyBub3QgYW4gb3B0aW9ucyBiZWNhdXNlIG9mIGxvdy1jb3N0IEhETUkgcGFuZWxzIGx5
aW5nIGluIHRoZWlyIEVESUQKPj4+Pj4gYW5kIG5vdCByZWFsbHkgc3VwcG9ydGluZyBZVVYgSERN
SS4uLgo+Pj4+Pgo+Pj4+PiBTbyBpZiB0aGUgb3JpZ2luYWwgWVVWIGlzIGluIGZ1bGwgcmFuZ2Us
IHRoZSBjdWxwcml0IGlzIGluIHRoZSBEVy1IRE1JIENTQwo+Pj4+PiB0YWJsZS4KPj4+Cj4+PiBT
byBzZWVtcyB0aGUgY3VycmVudCBDU0MgdGFibGVzIG91dHB1dHMgbGltaXRlZCByYW5nZSBmcm9t
IFlVViwgY291bGQgeW91IHRyeToKPj4+Cj4+PiA9PT09PT09PT09PT09PT09PT48PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1oZG1pLmMKPj4+IGluZGV4IDAwMzFmM2M1NDg4Mi4uOWUxY2I5YmU0NjIyIDEwMDY0
NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4+PiBAQCAt
MTc2OSw4ICsxNzY5LDExIEBAIHN0YXRpYyB2b2lkIGhkbWlfY29uZmlnX0FWSShzdHJ1Y3QgZHdf
aGRtaSAqaGRtaSwKPj4+ICAgICAgICAgICBkcm1faGRtaV9hdmlfaW5mb2ZyYW1lX2Zyb21fZGlz
cGxheV9tb2RlKCZmcmFtZSwgY29ubmVjdG9yLCBtb2RlKTsKPj4+Cj4+PiAgICAgICAgICAgaWYg
KGhkbWlfYnVzX2ZtdF9pc19yZ2IoaGRtaS0+aGRtaV9kYXRhLmVuY19vdXRfYnVzX2Zvcm1hdCkp
IHsKPj4+ICsgICAgICAgICAgICAgICBib29sIGlzX2lucHV0X3JnYiA9IGhkbWlfYnVzX2ZtdF9p
c19yZ2IoaGRtaS0+aGRtaV9kYXRhLmVuY19pbl9idXNfZm9ybWF0KTsKPj4+ICsgICAgICAgICAg
ICAgICBib29sIGlzX2xpbWl0ZWRfcmFuZ2UgPSBoZG1pLT5oZG1pX2RhdGEucmdiX2xpbWl0ZWRf
cmFuZ2UgfCFpc19pbnB1dF9yZ2I7Cj4+Cj4+IE9mIGNvdXJzZToKPj4KPj4gICAgICAgICAgICAg
ICAgYm9vbCBpc19saW1pdGVkX3JhbmdlID0gaGRtaS0+aGRtaV9kYXRhLnJnYl9saW1pdGVkX3Jh
bmdlIHx8ICFpc19pbnB1dF9yZ2I7Cj4+Cj4+IFNvcnJ5IGZvciB0aGUgdHlwby4KPj4KPj4+ICsK
Pj4+ICAgICAgICAgICAgICAgICAgIGRybV9oZG1pX2F2aV9pbmZvZnJhbWVfcXVhbnRfcmFuZ2Uo
JmZyYW1lLCBjb25uZWN0b3IsIG1vZGUsCj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBoZG1pLT5oZG1pX2RhdGEucmdiX2xpbWl0ZWRfcmFuZ2Ug
Pwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aXNfbGltaXRlZF9yYW5nZSA/Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIEhETUlfUVVBTlRJWkFUSU9OX1JBTkdFX0xJTUlURUQgOgo+Pj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBIRE1J
X1FVQU5USVpBVElPTl9SQU5HRV9GVUxMKTsKPj4+ICAgICAgICAgICB9IGVsc2Ugewo+Pj4gPT09
PT09PT09PT09PT09PT0+PD09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPj4+Cj4+
PiBJdCB3b24ndCBvdXRwdXQgZnVsbCByYW5nZSwgYnV0IGF0IGxlYXN0IHRoZSBtb25pdG9yIHdp
bGwga25vdyB0aGUgcmVhbAo+Pj4gc2lnbmFsIHF1YW50IHJhbmdlLgo+Pj4KPj4+IFRoZSByZWFs
IGZpeCB3b3VsZCBiZSB0byBjYWxjdWxhdGUgc29tZSBuZXcgcGFyYW1ldGVycyBmb3IgZnVsbCBy
YW5nZSwKPj4+IGJ1dCBJJ20gbm90IGFibGUgdG8gZG8gdGhhdCBwZXJzb25hbGx5Lgo+Pj4KPj4+
IE5laWwKPj4+Cj4+Pj4+Cj4+Pj4+IE5laWwKPj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBUaGFuayB5b3Ug
aW4gYWR2YW5jZSwKPj4+Pj4+IEZyYW5jaXNjbwo+Pj4+Pj4KPj4+Pj4+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4+PiBsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdAo+Pj4+Pj4gbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4+Pj4+
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMKPj4+Pj4KPj4+Pj4KPj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPj4+Pj4gbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKPj4+Pj4gbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4+Pj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo+Pj4KPj4+Cj4+PiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4gbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKPj4+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4gaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCj4+
Cj4gCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guIEhvd2V2ZXIsIGl0IGRvZXMgbm90IGZpeCB0
aGUgaXNzdWUgaW4gdGhlCj4gcGFuZWwgSSBhbSB1c2luZy4gUGVyaGFwcyBpdCBkb2VzIG5vdCBz
dXBwb3J0IGxpbWl0ZWQgcXVhbnRpemF0aW9uCj4gcmFuZ2UgYXQgYWxsLgoKV2hhdCBtb25pdG9y
IGlzIHRoaXMgPwoKVGhlIEhETUkgMS40YiBzcGVjIHNheXMgY2xlYXJseToKPT09PT09PT09PT09
PT09PT09PT09PT09Pjw9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0KQmxhY2sgYW5kIHdoaXRlIGxldmVscyBmb3IgdmlkZW8gY29tcG9uZW50
cyBzaGFsbCBiZSBlaXRoZXIg4oCcRnVsbCBSYW5nZeKAnSBvciDigJxMaW1pdGVkIFJhbmdlLuKA
nQpMaW1pdGVkIFJhbmdlIHNoYWxsIGJlIHVzZWQgZm9yIGFsbCB2aWRlbyBmb3JtYXRzIGRlZmlu
ZWQgaW4gQ0VBLTg2MS1ELCB3aXRoIHRoZSBleGNlcHRpb24gb2YKVkdBICg2NDB4NDgwKSBmb3Jt
YXQsIHdoaWNoIHJlcXVpcmVzIEZ1bGwgUmFuZ2UuCj09PT09PT09PT09PT09PT09PT09PT09PT48
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
CgpTbyBpZiB0aGUgbW9uaXRvciBpcyBjb21wbGlhbnQgd2l0aCBIRE1JIHNwZWMsIGl0IHNob3Vs
ZCBzdXBwb3J0IGxpbWl0ZWQgcmFuZ2UuIEJ1dCBpdCBzZWVtcwp0byBiZSBvayB3aXRoIHRoZSBZ
VVYgbGltaXRlZCByYW5nZS4KCkJ1dCBwZXJoYXBzIHRoZSBFRElEIGRlY2xhcmVzIGEgc2VsZWN0
YWJsZSBZQ0MgUXVhbnRpemF0aW9uIFJhbmdlIGFuZCBleHBlY3RzIGZ1bGwgcmFuZ2UgPwoKTmVp
bAoKPiAKPiBIb3BlZnVsbHkgSSBjYW4gaGF2ZSBhIGxvb2sgYXQgdGhlIENTQyB0YWJsZXMgc29v
bi4KPiAKPiBGcmFuY2lzY28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
