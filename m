Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34983C46CCD
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Dec 2023 09:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1bEiHIP4o2dnVQghBGAyi1mCBOPlBPZ0+9r0nibSLwE=; b=taqS1kGGyv8M17Y21eQhflP81w
	WWqoY9sGcaLha+HMLk+6IWf/KgvhSMZJBnfixGYuu0a7PQ6EG22/xBmLHcJIaWaqPZEszWqE4ya4J
	ZlzQIqg+Kz7zOxrgbqcmSy4TpBhRcUiU8rgyDrtmoNMROxwdhetEeB66Wo/qUbQYsxo+cnaxbKMG1
	ExjA7ck2Lz0gwy7SVeZktWoVpQmQyBeG8c9bW0VPKTMpfZrvXMpIajP9ipXHDPUTIAkch2Sr+JW3x
	SFOw1CDY8Q9TkZ6HntNoOa7SZDNocahF262AVTMHHXNgVJVXKXPfI9D3xnkv15GSJ46DJ6VkLJEDo
	OAAc05TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGFHe-002Fi6-0x;
	Thu, 21 Dec 2023 09:24:02 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGFHU-002FZC-1V
	for linux-amlogic@lists.infradead.org;
	Thu, 21 Dec 2023 09:23:55 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40d352c826eso7142745e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 21 Dec 2023 01:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703150630; x=1703755430; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ayJJhQ7i8rdsmjen++FBZiEstUK751hYv8bkP/oAYMY=;
        b=HorZUbU4MbvRLnSMB8OAS+E1gtA8nw5HujH5OE5g66XK27L0U8+yV0Yk+DYYcecGlr
         55UDP5L1mYO5dy67rtZRhEHpZ+4NnxcA0N1tWcdawVG4Z7Yv1w7P2icCoxWgI+8Xdt/1
         n+iYnDyByXDFezhg6wYW49x27S7Qh3C2AMNXKCQ0Kz6XWLMHSk6N8r/ak/7UHGTbeTSS
         kF79RSp2t8ijsLzbXjbg5X8bXSubFU9yaAsYCygU7agpFHOanhOtvsN15DWnMLa0k2i4
         Nmgqm8186zVSKqM92CHt1hjeVXh5rqodZ6nZsn8R4Z9A0OGt/zs9RsSG+E7eacUQ3rdw
         k48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703150630; x=1703755430;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ayJJhQ7i8rdsmjen++FBZiEstUK751hYv8bkP/oAYMY=;
        b=gCKg5OSYJVMDEGr2ya+vCFd129JdExtu8dTDRIeW6HidViuKTSREpiw1T3TZAssliU
         qsD+gkOh5qy12ZAXPoJbEftr/J5WmsLF9NL9d90Z6eVudzo3v2dxG0pJDN5cwS9XkEJ7
         egc2etQkD8IAbBD0tsUf6QF/APBc0T6qC5EuWo0PvyoZ+NZf9ITucdX4mQFHrwalpH+P
         dMIiw0B4195x0Z8PPTsT4x8YrpnjC8I0TIK9JhcKiASjDirtT5g8v+W3z795L9QgOmUa
         h3MkZgln57yYsPvXAnXAE1UpV+TASj1Sqb68YQclGpe8yLVD6vj9lsR/HWWiGfuhL7Rv
         XQqQ==
X-Gm-Message-State: AOJu0YzJdkAdqaTUPt/RbT0EIcT5t9w5ngf40yu9fjwXzzgI1rujwTgz
	0rcQEwaR60n8CRNOhs6dNbI25g==
X-Google-Smtp-Source: AGHT+IGQPH4miJHwmO0WHsppv99frSCDU9pJ9/9tPZ+KEmh8y5PL5tj+Ty3LOIWLssOo3WFItjbqRw==
X-Received: by 2002:a05:600c:364f:b0:40b:5e1d:83a7 with SMTP id y15-20020a05600c364f00b0040b5e1d83a7mr596175wmq.59.1703150629738;
        Thu, 21 Dec 2023 01:23:49 -0800 (PST)
Received: from [192.168.7.29] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id iv11-20020a05600c548b00b0040b4b2a15ebsm2597888wmb.28.2023.12.21.01.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 01:23:49 -0800 (PST)
Message-ID: <bdfe5e63-6849-4025-80c1-e8071fce56f1@linaro.org>
Date: Thu, 21 Dec 2023 10:23:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: pwm: Thierry steps down, Uwe takes over
Content-Language: en-US, fr
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: linux-pwm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, kernel@pengutronix.de,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
References: <20231206214817.1783227-2-u.kleine-koenig@pengutronix.de>
 <ZXM72QYBbb32Q_aL@orome.fritz.box>
 <20231208190620.5qobgtyii2wt7tfa@pengutronix.de>
 <ZXbsDRslZNKCeJF9@orome.fritz.box>
 <20231211141900.x6tpyctch5fv3uqf@pengutronix.de>
 <ZXcpswXxb1oQldp5@orome.fritz.box>
 <20231212203352.wl3rzob75fct4lov@pengutronix.de>
 <ZYMPc50eBi6oBClu@orome.fritz.box>
 <6nj7rmq36hj5m26b7yhlbmpfps5wuxkx4zwyvttg4cpgocimj7@xtqm4qleo3s6>
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
In-Reply-To: <6nj7rmq36hj5m26b7yhlbmpfps5wuxkx4zwyvttg4cpgocimj7@xtqm4qleo3s6>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_012352_523713_7F0C04EB 
X-CRM114-Status: GOOD (  21.92  )
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

T24gMjEvMTIvMjAyMyAxMDoyMSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSXQncyBub3Qg
ZWFzeSB0byBsZXQgZ28gcmVzcG9uc2liaWxpdHkgZm9yIGEgc3Vic3lzdGVtIHRoYXQgb25lIGNh
cmVkCj4gZm9yIGZvciBhIGxvbmcgdGltZSwgYnV0IFRoaWVycnkgcmVhbGl6ZWQgdGhhdCBoaXMg
aGVhcnQgaXNuJ3QgaW4gdGhlCj4gcHdtIGZyYW1ld29yayBhbnkgbW9yZS4KPiAKPiBUaGllcnJ5
IGNhcmVkIGZvciB0aGUgcHdtIHN1YnN5c3RlbSAoY29tbWl0IDIwMGVmZWRkODc2NiAoInB3bTog
VGFrZQo+IG92ZXIgbWFpbnRhaW5lcnNoaXAgb2YgdGhlIFBXTSBzdWJzeXN0ZW0iKSkgYXMgYSBt
YWludGFpbmVyIGR1cmluZwo+IG5lYXJseSAxMiB5ZWFycy4gQSBiaWcgdGhhbmtzIGZvciB0aGUg
dGltZSwgZWZmb3J0IGFuZCBkZWRpY2F0aW9uIHNwZW5kCj4gZHVyaW5nIHRoYXQgdGltZS4KPiAK
PiBVd2UgdGFrZXMgb3ZlciBtYWludGVuYW5jZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xl
aW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+IC0tLQo+IEhlbGxv
IFRoaWVycnksCj4gCj4gT24gV2VkLCBEZWMgMjAsIDIwMjMgYXQgMDQ6NTk6NDdQTSArMDEwMCwg
VGhpZXJyeSBSZWRpbmcgd3JvdGU6Cj4+IE9uIFR1ZSwgRGVjIDEyLCAyMDIzIGF0IDA5OjMzOjUy
UE0gKzAxMDAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+Pj4gT24gTW9uLCBEZWMgMTEsIDIw
MjMgYXQgMDQ6MjQ6MzVQTSArMDEwMCwgVGhpZXJyeSBSZWRpbmcgd3JvdGU6Cj4+Pj4gSXQgYWxs
IGFkZHMgdXAgaW4gdGhlIGVuZCBhbmQga2VlcHMgbWUgZnJvbSBkb2luZyBvdGhlciB0aGluZ3Mu
Cj4+Pgo+Pj4gSWYgdGhhdCBtZWFucyB5b3UnZCBiZSBnbGFkIHRvIGdpdmUgdXAgdGhlIFBXTSBt
YWludGFpbmVyIGpvYiwgSSdkCj4+PiBoYXBwaWx5IHRha2Ugb3ZlciB0aGlzIHBvc3QuCj4+Cj4+
ICJHbGFkIiBpcyBub3QgdGhlIHdvcmQgdGhhdCBJIHdvdWxkIGNob29zZS4gQWZ0ZXIgYWxsIEkn
dmUgbG9va2VkIGFmdGVyCj4+IHRoaXMgc3Vic3lzdGVtIGZvciBhbG1vc3QgMTIgeWVhcnMsIGFu
ZCBsZXR0aW5nIGl0IGdvIGlzbid0IHNvbWV0aGluZwo+PiB0aGF0IGlzIHBhcnRpY3VsYXJseSBl
YXN5LiBIb3dldmVyLCBJIGRvIHJlYWxpemUgdGhhdCBteSBoZWFydCBpc24ndCBpbgo+PiBpdCBh
bnltb3JlIGFuZCBJIGRvbid0IHdhbnQgdG8gYmUgaW4gdGhlIHdheSBvZiBhbnlvbmUuCj4+Cj4+
IFNvIEknbGwgdGFrZSB5b3UgdXAgb24gdGhhdCBvZmZlci4gRG8geW91IHdhbnQgdG8gc2VuZCBh
IHBhdGNoPwo+IAo+IFN1cmUsIGhlcmUgaXQgY29tZXMuCj4gCj4gSSBoZXNpdGF0ZWQgdG8gcmVt
b3ZlIHlvdSBjb21wbGV0ZWx5LCBidXQgSSBndWVzcyB5b3UgaW50ZW5kZWQgYSBjbGVhbgo+IGN1
dD8gT3Igd291bGQgeW91IHByZWZlciB0byBzdGF5IGFzIGEgcmV2aWV3ZXI/Cj4gCj4gVXN1YWxs
eSBJIHdvdWxkIGhhdmUgYWRkZWQgeW91IHRvIENSRURJVFMsIGJ1dCBhcyB5b3Ugd2lsbCBjb250
aW51ZSB0bwo+IGZpbGwgeW91ciB2YXJpb3VzIG90aGVyIHJlc3BvbnNpYmlsaXRpZXMgKEkgZXhw
ZWN0KSwgdGhpcyBmZWx0IHdyb25nLgo+IAo+IEJlc3QgcmVnYXJkcwo+IFV3ZQo+IAo+ICAgTUFJ
TlRBSU5FUlMgfCA1ICsrLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJT
Cj4gaW5kZXggNTM0MmNmMzJkNzNmLi4xNmM2YWEwYWQxYWUgMTAwNjQ0Cj4gLS0tIGEvTUFJTlRB
SU5FUlMKPiArKysgYi9NQUlOVEFJTkVSUwo+IEBAIC0xNzU2MSwxMiArMTc1NjEsMTEgQEAgRjoJ
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvaXJsZWQvcHdtLWlyLXR4Lnlh
bWwKPiAgIEY6CWRyaXZlcnMvbWVkaWEvcmMvcHdtLWlyLXR4LmMKPiAgIAo+ICAgUFdNIFNVQlNZ
U1RFTQo+IC1NOglUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgo+IC1S
OglVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+ICtN
OglVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+ICAg
TDoJbGludXgtcHdtQHZnZXIua2VybmVsLm9yZwo+ICAgUzoJTWFpbnRhaW5lZAo+ICAgUToJaHR0
cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4LXB3bS9saXN0Lwo+IC1UOgln
aXQgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RoaWVycnku
cmVkaW5nL2xpbnV4LXB3bS5naXQKPiArVDoJZ2l0IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3VrbGVpbmVrL2xpbnV4LXB3bS5naXQKPiAgIEY6CURvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL2dwaW8tbXZlYnUueWFtbAo+ICAgRjoJ
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS8KPiAgIEY6CURvY3VtZW50YXRp
b24vZHJpdmVyLWFwaS9wd20ucnN0Cj4gCj4gYmFzZS1jb21taXQ6IDg4MTc5MTg4NmJmYThlMzUz
YzMyMDNmOTViZmJhYWVlZTI1ZDJkNTAKClRoYW5rcyBUaGllcnJ5IGZvciBhbGwgc3VwcG9ydCBh
bmQgd29yayBvdmVyIHB3bSBhbmQgeW91ciBoZWxwIGZvciBwd20tbWVzb24hCgpSZXZpZXdlZC1i
eTogTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
