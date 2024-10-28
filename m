Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B52D13588
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Oct 2024 10:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QOk8EzWp8r9kT3kn05pThfe0nNoiNYPu7PFYsRmzN1s=; b=bS8HOHfok6H5jC8X7766Hi7Vgf
	ISL23537OBkwyHak3Q0LQ7USzzIVHPn4ohkkiwAyYWUYvc6pSNowzll1zUYyIqrisofGMd8Cuo44s
	xkpIoDGL3AXQ6wauVY60Vkh7wgYYLpi5qqhhxSIRZzGaN1SbYBlQsMjvw1VJ38v63VsHqW/f41sQ2
	HM4QaeWIcRAt7MX9p0zbeYGK7kgwNikLfdrob9huYcx4GWCWniz0c4W99tynIJEl6eY0WMx5F3mGB
	nfhfEXmcZo3gOnIe/jOFHYtfw6Q8Kj/a8Ag1CaoQ7xdvDGICPGwxhopKOBy7QxZ97sVQnqlhepaDq
	zGiiedYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5NFS-0000000ARe0-0dmq;
	Mon, 28 Oct 2024 10:45:22 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5NED-0000000ARDN-0hvT
	for linux-amlogic@lists.infradead.org;
	Mon, 28 Oct 2024 10:44:07 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43158625112so42435915e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Oct 2024 03:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730112243; x=1730717043; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1DIKcSVPq+wE693C8oEdDwQ3yKrvTN2au+qI1h4f4Ig=;
        b=ShH0/aeAb3eBiqCWAdLM34+1x10MlzSQRJpaIi8WCmoRePH/sO4SkIHle5G++pySCa
         /kfZ9upWvaQHZF/jtd5NPEaSPiRJdpRuwGYoixfzrYlAvaXdYqArqUik25BRh6/Ddbh0
         HWD8GaFkmp/f4hxMe+jmZ5awCSofPWRtxpNKCYC3XSjAR3GIs1FkLjgRlGWyhpUmp8VY
         nimxDtiYdwC4NWPbqJLEODcqUblm/9J1FG3smjkHuVCJqcSz9JGWZuSe+ua2s0+phxJg
         58PjXDIvpmWRQNW+myshLtSNZkYtFF7z6uHj8soAvdPYo4hXzrrfvWvrL4Mv+qmM5b5y
         W5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730112243; x=1730717043;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1DIKcSVPq+wE693C8oEdDwQ3yKrvTN2au+qI1h4f4Ig=;
        b=nrwk/VMhjCYkyYvT5LjoWC4t6n3UzX2lLRXVZUWP8fSSPeR/1ivZNMwTMJtl8Pd3WG
         lrx0lFT/U9z9mYj5EXZuhR1tiC6zbImVuv22ZMuJNkdjec/t4pjjZK1KgPOlnLkxk+TT
         7mubs6LY3NJwhWT0LmLthYzMxxOjorHjhRDs2GBsjllhlx2PHaXLH9YpdEFskWj9yFIW
         5dJRecAytq2nF6JdMj6p94XXqe7Ky82jOoi6ArLjkn1104lm5P3rCMpr+JKyGe/p3mc8
         h/DA/4+gjJgY9PTFQsObb0jWmmGU4K2TLqkLPL5+xBZkJ+BxRRXa6GtnulBUFWkSsFNC
         2NPw==
X-Forwarded-Encrypted: i=1; AJvYcCWihCv2nL5GewPtvGQYfHjQh2DNkjOpJkzmaO8cKSXAXR2G/J1ds8FRGZ3lFJtV3hPwblKjtFNxglNt1sSM@lists.infradead.org
X-Gm-Message-State: AOJu0Yyoqm9VE0vQJSVR0I163+PPmo2pEvMfpKl47ENgVbYeat94pfz1
	kV48g4EVrahu+w7ltcIJrZnmMAlKmCDPWX95ffLUWQzqufOF4c2EhUjj95IPjbpDDADZZzAFNQY
	blvY=
X-Google-Smtp-Source: AGHT+IGwwvEdc6hLaLg/f7E4XxjcCHeh2tfD4+HJQtwSrRaq4oRzi88MRNZHsYZkUFz1ggMLARvUvQ==
X-Received: by 2002:a05:600c:358e:b0:431:52f5:f497 with SMTP id 5b1f17b1804b1-4319ac956fdmr61029195e9.9.1730112243335;
        Mon, 28 Oct 2024 03:44:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c11d:e163:200e:8a5d? ([2a01:e0a:982:cbb0:c11d:e163:200e:8a5d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b54303fsm135287475e9.7.2024.10.28.03.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 03:44:02 -0700 (PDT)
Message-ID: <3b712cc6-3f3d-4786-b2f8-d66e40cf5008@linaro.org>
Date: Mon, 28 Oct 2024 11:44:02 +0100
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
 <a0c30691-ad28-4217-bf46-924fca5f48de@linaro.org>
 <7c069b82-c31b-45cc-8cf3-a2181a56c2f5@amlogic.com>
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
In-Reply-To: <7c069b82-c31b-45cc-8cf3-a2181a56c2f5@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_034405_367762_34F70389 
X-CRM114-Status: GOOD (  25.83  )
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

T24gMjgvMTAvMjAyNCAxMDo1OSwgWGlhbndlaSBaaGFvIHdyb3RlOgo+IAo+IAo+IE9uIDIwMjQv
MTAvMjggMTc6NDYsIG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmcgd3JvdGU6Cj4+IFsgRVhURVJO
QUwgRU1BSUwgXQo+Pgo+PiBPbiAyOC8xMC8yMDI0IDEwOjM2LCBYaWFud2VpIFpoYW8gd3JvdGU6
Cj4+PiBIaSBOZWlsLAo+Pj4gwqDCoMKgIFRoYW5rcyBmb3IgeW91ciBhZHZpY2UuCj4+Pgo+Pj4g
T24gMjAyNC8xMC8yOCAxNzowOSwgbmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZyB3cm90ZToKPj4+
PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+Pgo+Pj4+IE9uIDI4LzEwLzIwMjQgMTA6MDcsIFhpYW53
ZWkgWmhhbyB3cm90ZToKPj4+Pj4gSGkgTmVpbCwKPj4+Pj4gwqDCoMKgwqAgQmFzZWQgb24gdGhl
IGN1cnJlbnQgZGlzY3Vzc2lvbiByZXN1bHRzLCBHUElPIGluZGV4IG1hY3JvIGRlZmluaXRpb24g
ZG9lcyBub3QgYmVsb25nIHRvIGJpbmRpbmdzLiBJZiBzbywgdGhlIHBpbmN0cmwgZHJpdmVyIGtl
ZXBzIHRoZSBleGlzdGluZyBhcmNoaXRlY3R1cmUsIGFuZCB1c2UgbnVtYmVycyBpbnN0ZWFkIGlu
IGR0cyBmaWxlLiBPciB0aGUgcGluY3RybCBkcml2ZXIgdXNlIGJhbmsgbW9kZSBhY2VzcywgdGhp
cyBtYXkgbm90IGJlIGNvbXBhdGlibGUgd2l0aCBleGlzdGluZyBmcmFtZXdvcmtzLiBUaGlzIGlz
IGRvbmUgYnkgYWRkaW5nIG9mX3hsYXRlIGhvb2sgZnVuY3Rpb25zIGluIHBpbmN0cmxfY2hpcCBz
dHJ1Y3QuCj4+Pj4+Cj4+Pj4+IFdoYXQgaXMgeW91ciBhZHZpY2UgdGhhdCBJIGNhbiBpbXBsZW1l
bnQgaW4gdGhlIG5leHQgdmVyc2lvbi4gVGhhbmtzIQo+Pj4+Cj4+Pj4gS2VlcCB0aGUgZHJpdmVy
IGFzLWlzLCBidXQgbW92ZSB0aGUgaGVhZGVyIGZpbGUgaW50byBhcmNoL2FybTY0L2Jvb3QvZHRz
L2FtbG9naWMgbGlrZSBpdCB3YXMgZG9uZSBmb3IgdGhlIGxhc3QgcmVzZXQgY29udHJvbGxlciBz
dXBwb3J0Ogo+Pj4+IGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LXJlc2V0
LmgKPj4+Pgo+Pj4KPj4+IEkgZG9uJ3Qgc2VlIGV4YW1wbGVzIEMgZmlsZSBhcHBsaWVzIGR0cyBo
ZWFkZXIgZmlsZS4KPj4+IEMgZmlsZSBuZWVkIHRvIGJlIGRlZmluZWQgb25jZSwgYW5kIHRoaXMg
bmVlZHMgdG8gYmUgZGVmaW5lZCBhZ2FpbiBpbiBkdHMgaGVhZGVyIGZpbGUuCj4+Cj4+IFNvcnJ5
IGNvdWxkIHlvdSByZXBocmFzZSwgdGhlIHNlbnRlbmNlIGlzbid0IGNsZWFyLgo+Pgo+IAo+IEkn
bSBzb3JyeSBJIGRpZG4ndCBkZXNjcmliZSBpdCBjbGVhcmx5Lgo+IAo+IFRoZSBwaW4gaW5kZXgg
ZGVmaW5pdGlvbiBpcyB1c2VkIGluIGRyaXZlciBDIGZpbGUgYW5kIGluIERUUyBmaWxlcy4KPiBJ
dCdzIG5vdCBsaWtlIHJlc2V0IGRlZmluaXRpb24gb25seSB1c2VkIGluIERUUyBmaWxlcy4KPiBJ
ZiB0aGUgcGluIGRlZmluaXRpb24gaGVhZGVyIGZpbGUgcGxhY2UgYXJjaC9hcm02NC9ib290L2R0
cy9hbWxvZ2ljLCBzbyB0aGUgZHJpdmVyIEMgZmlsZSBuZWVkcyB0byBiZSBkZWZpbmVkIGFnYWlu
LiBJIGRvbid0IHNlZSBleGFtcGxlcyBvZiBob3cgYSBDIGZpbGUgYXBwbGllcyBhIERUUyBoZWFk
ZXIgZmlsZS4KCkdvb2QgcXVlc3Rpb24sIEkgc3RpbGwgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgdGhl
IG1vZGVsIHdlIHVzZWQgc28gZmFyIGlzIHN1ZGRlbmx5IGJhZC4KClJvYiBzaW1wbHkgcG9pbnRl
ZCBmb3IgQU9CVVM6Cj09PT09PT09PT0+PD09PT09PT09PT09PT09PT09PT09PQpJIGZpbmQgZGVm
aW5lcyB3aXRoIHRoZSB2YWx1ZSBvZiB0aGUgZGVmaW5lIGluIHRoZSBuYW1lIHByZXR0eQpwb2lu
dGxlc3MuCj09PT09PT09PT0+PD09PT09PT09PT09PT09PT09PT09PQoKUmlnaHQgYnV0IHRob3Nl
IGFyZSBhbiBleGNlcHRpb24gYmVjYXVzZSBHUElPX1RFU1RfTiBpcyB0aGUgZXhjZXB0aW9uLAoK
QW5kIG9mIHRoZSBwZXJpcGhzOgo9PT09PT09PT09Pjw9PT09PT09PT09PT09PT09PT09PT0KSSdt
IG5vdCByZWFsbHkgbXVjaCBvZiBhIGZhbiBvZiB1c2luZyBkZWZpbmVzIGZvciBHUElPcywgYnV0
IGlmIHlvdSBkbywKd291bGRuJ3QgYmUgYmV0dGVyIHRvIHNwbGl0IGJhbmtzIGFuZCBsaW5lcyB1
cCByYXRoZXIgdGhhbiBhIGdsb2JhbApudW1iZXIgc3BhY2UuIFNlZSBBU1BFRURfR1BJTygpIG9y
IHRlZ3JhIGhlYWRlci4KPT09PT09PT09PT48PT09PT09PT09PT09PT09PT09PT09CgpUaGlzIGlz
IGV4YWN0bHkgd2hhdCB3YXMgcHJvdmlkZWQgaW4gdjIsIGFuZCBtYXBwZWQgd2hhdCB3YXMgaW4g
YXNwZWVkLWdwaW8uaAoKSSByZXBlYXQ6ClRoZSBHUElPIG5hbWVzIGFyZSBub3QgbGluZWFyIHRv
IGEgbnVtYmVyLCBwb2ludGluZyB0byB0aGUgZmlyc3QgQU9CVVMgZmlyc3QgaXMgYSBub25zZW5z
ZSBzaW5jZSBHUElPX1RFU1RfTiBpcyB0aGUgZXhjZXB0aW9uLgoKQW5kIHRoZSBkcml2ZXIgbmVl
ZHMgdGhvc2UgbnVtYmVycyBzaW5jZSB0aGV5IGFyZSBiaW5kaW5ncy4KCk5laWwKCj4gCj4+IE5l
aWwKPj4KPj4+Cj4+Pj4gTmVpbAo+Pj4+Cj4+Pj4+Cj4+Pj4+IE9uIDIwMjQvMTAvMjEgMjM6Mjcs
IEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+Pj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+
Pj4+Cj4+Pj4+PiBPbiAyMS8xMC8yMDI0IDEyOjM4LCBuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3Jn
IHdyb3RlOgo+Pj4+Pj4+Pj4gPT09PT48PT09PT09PT09PT09PT09PT0KPj4+Pj4+Pj4+ICsvKiBT
dGFuZGFyZCBwb3J0ICovCj4+Pj4+Pj4+PiArI2RlZmluZSBHUElPQl9TVEFSVMKgwqDCoMKgwqDC
oMKgIDAKPj4+Pj4+Pj4+ICsjZGVmaW5lIEdQSU9CX05VTcKgIDE0Cj4+Pj4+Pj4+PiArCj4+Pj4+
Pj4+PiArI2RlZmluZSBHUElPRF9TVEFSVMKgwqDCoMKgwqDCoMKgIChHUElPQl9TVEFSVCArIEdQ
SU9CX05VTSkKPj4+Pj4+Pj4+ICsjZGVmaW5lIEdQSU9EX05VTcKgIDE2Cj4+Pj4+Pj4+PiArCj4+
Pj4+Pj4+PiArI2RlZmluZSBHUElPRV9TVEFSVMKgwqDCoMKgwqDCoMKgIChHUElPRF9TVEFSVCAr
IEdQSU9EX05VTSkKPj4+Pj4+Pj4+ICsjZGVmaW5lIEdQSU9FX05VTcKgIDIKPj4+Pj4+Pj4+ICsK
Pj4+Pj4+Pj4+ICsjZGVmaW5lIEdQSU9UX1NUQVJUwqDCoMKgwqDCoMKgwqAgKEdQSU9FX1NUQVJU
ICsgR1BJT0VfTlVNKQo+Pj4+Pj4+Pj4gKyNkZWZpbmUgR1BJT1RfTlVNwqAgMjMKPj4+Pj4+Pj4+
ICsKPj4+Pj4+Pj4+ICsjZGVmaW5lIEdQSU9YX1NUQVJUwqDCoMKgwqDCoMKgwqAgKEdQSU9UX1NU
QVJUICsgR1BJT1RfTlVNKQo+Pj4+Pj4+Pj4gKyNkZWZpbmUgR1BJT1hfTlVNwqAgMTgKPj4+Pj4+
Pj4+ICsKPj4+Pj4+Pj4+ICsjZGVmaW5lIFBFUklQSFNfUElOX05VTcKgwqDCoCAoR1BJT1hfU1RB
UlQgKyBHUElPWF9OVU0pCj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+PiArLyogQW9idXMgcG9ydCAqLwo+
Pj4+Pj4+Pj4gKyNkZWZpbmUgR1BJT0FPX1NUQVJUwqDCoMKgwqDCoMKgIDAKPj4+Pj4+Pj4+ICsj
ZGVmaW5lIEdQSU9BT19OVU0gNwo+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4gKy8qIEl0J3MgYSBzcGVj
aWFsIGRlZmluaXRpb24sIHB1dCBhdCB0aGUgZW5kLCBqdXN0IDEgbnVtICovCj4+Pj4+Pj4+PiAr
I2RlZmluZcKgwqDCoCBHUElPX1RFU1RfTsKgwqDCoMKgIChHUElPQU9fU1RBUlQgK8KgIEdQSU9B
T19OVU0pCj4+Pj4+Pj4+PiArI2RlZmluZcKgwqDCoCBBT0JVU19QSU5fTlVNwqDCoCAoR1BJT19U
RVNUX04gKyAxKQo+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4gKyNkZWZpbmUgQU1MT0dJQ19HUElPKHBv
cnQsIG9mZnNldCkgKHBvcnQjI19TVEFSVCArIChvZmZzZXQpKQo+Pj4+Pj4+Pj4gPT09PT48PT09
PT09PT09PT09PT09PT0KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBpcyBleGFjdGx5IHdoYXQgcm9iIGFz
a2VkIGZvciwgYW5kIHlvdSBuYWNrZWQgaXQuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IE5vLCB0aGlzIGlz
IG5vdCB3aGF0IHdhcyBhc2tlZCwgYXQgbGVhc3QgYWNjb3JkaW5nIHRvIG15IHVuZGVyc3RhbmRp
bmcuCj4+Pj4+Pj4+IE51bWJlciBvZiBHUElPcyBpcyBub3QgYW4gQUJJLiBOZWl0aGVyIGlzIHRo
ZWlyIHJlbGF0aW9uc2hpcCwgd2hlcmUgb25lCj4+Pj4+Pj4+IHN0YXJ0cyBhbmQgb3RoZXIgZW5k
cy4KPj4+Pj4+Pgo+Pj4+Pj4+IEkgY29uZmlybSB0aGlzIG5lZWQgc29tZSB3b3JrLCBidXQgaXQg
bW92ZWQgdGhlIHBlci1waW4gZGVmaW5lIHRvIHN0YXJ0Cj4+Pj4+Pj4gYW5kIHJhbmdlcywgc28g
d2hhdCBkaWQgcm9iIGV4cGVjdCA/Cj4+Pj4+Pj4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gTWF5YmUgSSBt
aXNzZWQgc29tZXRoaW5nLCBidXQgSSBjb3VsZCBub3QgZmluZCBhbnkgdXNlcnMgb2YgdGhlc2Ug
aW4gdGhlCj4+Pj4+Pj4+IERUUy4gTG9vazoKPj4+Pj4+Pj4KPj4+Pj4+Pj4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjQxMDE0LWE0X3BpbmN0cmwtdjItMy0zZTc0YTY1YzI4NWVAYW1s
b2dpYy5jb20vCj4+Pj4+Pj4KPj4+Pj4+PiBTbyB5b3Ugd2FudCBjb25zdW1lcnMgYmVmb3JlIHRo
ZSBiaW5kaW5ncyA/IHN0cmFuZ2UgYXJndW1lbnQKPj4+Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBX
aGVyZSBpcyBhbnkgb2YgYWJvdmUgZGVmaW5lcz8KPj4+Pj4+Pj4KPj4+Pj4+Pj4gTWF5YmUgdGhl
eSB3aWxsIGJlIHZpc2libGUgaW4gdGhlIGNvbnN1bWVyIGNvZGUsIGJ1dCBJIGRpZCBub3QgaW1h
Z2luZQo+Pj4+Pj4+PiBzdWNoIHVzZS4gWW91IGV4cGVjdDoKPj4+Pj4+Pj4gcmVzZXQtZ3Bpb3Mg
PSA8JmN0cmwgR1BJT0FPX1NUQVJUIDE+Pz8/Cj4+Pj4+Pj4KPj4+Pj4+PiBObyBJIGV4cGVjdDoK
Pj4+Pj4+PiByZXNldC1ncGlvcyA9IDwmY3RybCBBTUxPR0lDX0dQSU8oQiwgMCkgMT47Cj4+Pj4+
Pj4KPj4+Pj4+PiBidXQgdGhlIG1hY3JvIHNob3VsZCBnbyBhbG9uZyB0aGUgZHRzIGxpa2Ugd2Ug
ZGlkIGZvciB0aGUgcmVzZXQgZGVmaW5lcywKPj4+Pj4+PiBzbyBwZXJoYXBzIHRoaXMgaXMgdGhl
IHNvbHV0aW9uID8KPj4+Pj4+Cj4+Pj4+PiBPSywgc28gSSBzYWlkIGl0IHdhcyBub3QgYSBiaW5k
aW5nOgo+Pj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL3U0YWZ4cWMzbHVkc2ljNG4z
aHMzcjNkcmczZnRtc2Jjd2ZqbHRpYzJtYjY2Zm9vNDd4QHhlNTdnbHRsNzdocS8KPj4+Pj4+Cj4+
Pj4+PiBhbmQgeW91IGhlcmUgY29uZmlybSwgaWYgSSB1bmRlcnN0b29kIHlvdSBjb3JyZWN0bHks
IHRoYXQgaXQgZ29lcyB3aXRoCj4+Pj4+PiB0aGUgRFRTIGxpa2UgcmVzZXQgZGVmaW5lcyAoSSBh
c3N1bWUgbm9uLUlEIGxpa2UgZGVmaW5lcz8pLCBzbyBhbHNvIG5vdAo+Pj4+Pj4gYSBiaW5kaW5n
Pwo+Pj4+Pj4KPj4+Pj4+IFdoYXQgYXJlIHdlIGRpc2FncmVlaW5nIHdpdGg/Cj4+Pj4+Pgo+Pj4+
Pj4gSnVzdCB0byByZWNhbGwsIEplcm9tZSBhc2tlZCB3aGV0aGVyIHlvdSBoYXZlIHRvIG5vdyB1
c2UgYXJiaXRyYXJ5Cj4+Pj4+PiBudW1iZXJzIGluIERUUyBhbmQgbXkgYW5zd2VyIHdhczogbm90
LiBJdCdzIHN0aWxsIHRoZSBzYW1lIGFuc3dlci4KPj4+Pj4+Cj4+Pj4+PiBCZXN0IHJlZ2FyZHMs
Cj4+Pj4+PiBLcnp5c3p0b2YKPj4+Pj4+Cj4+Pj4KPj4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
