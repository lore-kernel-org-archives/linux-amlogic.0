Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBE3C02192
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Feb 2025 09:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9CZDOCDHaiisDgkEuhtKb9Nvohb9bEESZz8xOgT4EE=; b=qa31Bx/VSZOmiT6y934wfwYlAJ
	EGRiQmyU1j7qqeBzXwb0yisJX3reHNACoUTEiAMkwq8onK3gezYMgjISxuQkHg6Fj3Krx2Xx7Z4AP
	ASLh+JMySftDXu8e74m34CL/PfT1IQ3SWZVjvAmhk+dVkIMZEEE1bmsAWCvYUdIpmt12w36Awu6mh
	tyIJ+1PIzgz9/T3QyuNBAwKzRR5XVCcbGvQClSHIuQcyQXY9QmwKzuk9zvxX508M1OJyWIe4mNGra
	kWtUeQun/82GJ1XyX3PJnquvFmSGA/HAjDVgwil2Y/tuvQHErYvu+aQxbC7Gr1mf0deMo3t7pQIqo
	6TwvaY1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKWL-00000008zc0-1IbW;
	Fri, 07 Feb 2025 09:19:33 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKUO-00000008zHG-1uhK
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Feb 2025 09:17:33 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso12053975e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Feb 2025 01:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738919851; x=1739524651; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tq0arpYSvoFDp5urlt72DtEA/DJDLUpDJMGDTdBFzlc=;
        b=TpoRWvwR8hN8VazbZKTLEoR8+z28DLwcn+6uV8MMwmotyEwXsBqN+hhIMAXSyAQ8IW
         Q5UrXewT24RsZZSSMMrCwMf2hRiIIZUFYKhZDlsOLiqbAkqAkKA8KCBh60pBb2NiqDD8
         /vrkWuo9TRRt/aeKgOmTh17O01ZmKbOqExP74RBpbT9aL1fNcVd4TZ3ZC+mBegxZvYPC
         l0W/b9mop/VkRBpO1Bx1lTSZJeibB1X84b/RQ8FBP0ueQ++/Ara+u71WHAAabGNbe1s9
         vLww5CBo8vA5eNXDwHud98B1PQzNp/2Pz1dvjnWgS/6N01msy9RAqN/UJubX9kopKybi
         Gvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738919851; x=1739524651;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Tq0arpYSvoFDp5urlt72DtEA/DJDLUpDJMGDTdBFzlc=;
        b=WuSFK5ZMP/fyja2Ja0X+InpTyNV8IIXVs6BTQN78bNCIzZic6vPUAe3tXmYKW+aTVO
         gXRxdXD8JDC3UygQmVpGk5KMWke1KrkL8lh9HXYxvZo0mKq2vbWp+U7GpsHar08uyTFY
         yqXzQEgX5DP/8hLeA8wYYuemS6ylHa1puhWFOxzeac8G8jvsGGP41ec8kuqxSkIOu6Ms
         4CeE1MytCw4gxT77vLTyavjzDJxANBWIBpwwKAc6Ut33Ej9MPbr2PyxWSSEM/ZHx93zC
         MlY8697SiXYqEUh4tc1J9N943lqugRLHlGx5Jj7VoR6vHsz010lkObVwe2opSy7ePKS5
         NmwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXESsNurPrRrn1IPWwuDanCCb3iUNc0Wf8oWrlTtzAq6oMt3w6gIrXp8/spcHzIOejSRBc9SyDblOr0xhlB@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm/EKt2jwHaIQOi7sz5uCrTp7gcJ/iUXOLrzMi0l6g41rTKQgh
	mBZ7l5mOmLHExOp8fjJVUUDLMtc6sSYWQUKBzHjHNp5UEs+P571UOXbrYZsBse8=
X-Gm-Gg: ASbGnctQBSgJCcRABIr/3jPfE9RfyAukrPUPGSoVA9TVN9JMP1dpGkq9rLIFSpB1aBa
	NGAb96bQD6ZPihlGr8TmRvTHQf3JQvcQ3PI2Jcmj743lbuK6oEw0qiZ+I4ouCMF5besf4WBuP41
	/7Bb+wcLwb8WvQQe/oZMV04dv06+lhJ01wZnUSArICoj6BLiHMYpheX/QJpf+puHFWgWDZjwnaM
	Fe1uP0Uh4xaftFGvcP842TyCqQzsF0VqHbycaiHvef7UwMDKylC4GZJuCO90ZUMwq24xkF85gpT
	oN1gDC3oXn9EtfxLbJPBqNzPRSZHn5BBFvqafvXEndPDjz0/x3yBB6MPxGFCDAgSmK/q
X-Google-Smtp-Source: AGHT+IGQfxMRIuGwsG2LhdgudYjnLLYSobR1Dg5dLuvm+yyL57tGU6pvxJPHQWM8uWlNOLtqEwvAaw==
X-Received: by 2002:a05:600c:1d90:b0:436:faeb:2a1b with SMTP id 5b1f17b1804b1-43924991f5dmr20328145e9.13.1738919850827;
        Fri, 07 Feb 2025 01:17:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5b26:96be:712e:30cd? ([2a01:e0a:982:cbb0:5b26:96be:712e:30cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dca0179sm47187875e9.11.2025.02.07.01.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 01:17:30 -0800 (PST)
Message-ID: <7180babd-302a-4f86-8770-bdd9f5c773cf@linaro.org>
Date: Fri, 7 Feb 2025 10:17:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH RFC v2] dt-bindings: mmc: mmc-slot: make compatible
 property optional
To: Dharma.B@microchip.com, ulf.hansson@linaro.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250205-mmc-slot-v2-1-da3c5f30e2d9@microchip.com>
 <f6d7ffa0-6c08-45fb-9153-5e4aad1ca86a@linaro.org>
 <003ffa44-c88a-4234-a54a-50cd1140982a@microchip.com>
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
In-Reply-To: <003ffa44-c88a-4234-a54a-50cd1140982a@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_011732_495569_B5A04A70 
X-CRM114-Status: GOOD (  14.77  )
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

T24gMDcvMDIvMjAyNSAxMDowMiwgRGhhcm1hLkJAbWljcm9jaGlwLmNvbSB3cm90ZToKPiBPbiAw
Ny8wMi8yNSAyOjI1IHBtLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4gRVhURVJOQUwgRU1BSUw6
IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdwo+
PiB0aGUgY29udGVudCBpcyBzYWZlCj4+Cj4+IE9uIDA1LzAyLzIwMjUgMDQ6NDgsIERoYXJtYSBC
YWxhc3ViaXJhbWFuaSB3cm90ZToKPj4+IFJlbW92ZSB0aGUgY29tcGF0aWJsZSBwcm9wZXJ0eSBm
cm9tIHRoZSBsaXN0IG9mIHJlcXVpcmVkIHByb3BlcnRpZXMgYW5kCj4+PiBtYXJrIGl0IGFzIG9w
dGlvbmFsLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IERoYXJtYSBCYWxhc3ViaXJhbWFuaSA8ZGhh
cm1hLmJAbWljcm9jaGlwLmNvbT4KPj4+IC0tLQo+Pj4gQ2hhbmdlcyBpbiB2MjoKPj4+IC0gSW5z
dGVhZCBvZiBtb3ZpbmcgdGhlIGNvbXBhdGlibGUgc3RyaW5nIHRvIHRoZSBvdGhlciBiaW5kaW5n
LCBqdXN0Cj4+PiBtYWtlIGl0Cj4+PiAgwqDCoCBvcHRpb25hbCAocmVtb3ZlIGZyb20gcmVxdWly
ZWQgbGlzdCkuCj4+PiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAy
NDEyMTktbW1jLXNsb3QtdjEtMS0KPj4+IGRmYzc0N2EzZDNmYkBtaWNyb2NoaXAuY29tCj4+PiAt
LS0KPj4+ICDCoCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL21tYy1zbG90
LnlhbWwgfCAxIC0KPj4+ICDCoCAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+Pj4KPj4+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL21tYy1z
bG90LnlhbWwgYi8KPj4+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvbW1j
LXNsb3QueWFtbAo+Pj4gaW5kZXggMWYwNjY3ODI4MDYzLi5jYTNkMDExNGJmYzYgMTAwNjQ0Cj4+
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL21tYy1zbG90Lnlh
bWwKPj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvbW1jLXNs
b3QueWFtbAo+Pj4gQEAgLTI5LDcgKzI5LDYgQEAgcHJvcGVydGllczoKPj4+ICDCoMKgwqDCoMKg
IG1heEl0ZW1zOiAxCj4+Pgo+Pj4gIMKgIHJlcXVpcmVkOgo+Pj4gLcKgIC0gY29tcGF0aWJsZQo+
Pj4gIMKgwqDCoCAtIHJlZwo+Pgo+PiBJZiB5b3UgcmVtb3ZlIGl0IGZyb20gaGVyZSB0aGVuIGl0
J3Mgc3RpbGwgcmVxdWlyZWQgaW4gRG9jdW1lbnRhdGlvbi8KPj4gZGV2aWNldHJlZS9iaW5kaW5n
cy9tbWMvYW1sb2dpYyxtZXNvbi1teC1zZGlvLnlhbWwKPj4gc28gcGxlYXNlIGFkZCBpdC4KPiAK
PiBJZiBtb3ZpbmcgdGhlIGNvbXBhdGlibGUgdG8gaXRzIHNwZWNpZmljIGJpbmRpbmcgaXNuJ3Qg
YXBwcm9wcmlhdGUgKGFzCj4gcGVyIENvbm9yKSwKPiBhbmQgaWYgcmVtb3ZpbmcgaXQgZnJvbSB0
aGUgcmVxdWlyZWQgbGlzdCBoZXJlIGRvZXNu4oCZdCBzZWVtIHJlYXNvbmFibGUKPiB0byB5b3Us
Cj4gdGhlbiBhZGRpbmcgYW4gdW5uZWNlc3NhcnkgY29tcGF0aWJsZSBzdHJpbmcgaW4gb3VyIERU
UyBmaWxlcyBkb2VzbuKAmXQKPiBtYWtlIHNlbnNlIHRvIG1lLgo+IAo+IFdoYXQgY291bGQgYmUg
dGhlIHNvbHV0aW9uIHRoZW4/CgpUaGUgc29sdXRpb24gaXMgcmlnaHQgYnV0IHlvdSBtb2RpZnkg
dGhlIG1lc29uLW14LXNkaW8gYmluZGluZ3MsIHNvCnNpbXBseSBhZGQgY29tcGF0aWJsZSBpbiBh
IHJlcXVpcmVkIGxpc3QgZm9yIHRoZSBzbG90IG5vZGUuCgpTb21ldGhpbmcgbGlrZToKPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bW1jL2FtbG9naWMsbWVzb24tbXgtc2Rpby55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21tYy9hbWxvZ2ljLG1lc29uLW14LXNkaW8ueWFtbAppbmRleCAwMjI2ODJhOTc3
YzYuLjBkNGQ5Y2E2YThkOSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21tYy9hbWxvZ2ljLG1lc29uLW14LXNkaW8ueWFtbAorKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbW1jL2FtbG9naWMsbWVzb24tbXgtc2Rpby55YW1sCkBAIC02
MCw2ICs2MCw5IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgogICAgICAgIGJ1cy13aWR0aDoKICAgICAg
ICAgIGVudW06IFsxLCA0XQoKKyAgICByZXF1aXJlZDoKKyAgICAgIC0gY29tcGF0aWJsZQorCiAg
ICAgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKCj09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQoKQ29ub3Is
IElzIGl0IHJpZ2h0ID8KCk5laWwKCj4+Cj4+IFRoYW5rcywKPj4gTmVpbAo+Pgo+Pj4KPj4+ICDC
oCB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCj4+Pgo+Pj4gLS0tCj4+PiBiYXNlLWNvbW1p
dDogNDBiOGU5M2UxN2JmZjRhNGUwY2MxMjllMDRmOWZkZjVkYWE1Mzk3ZQo+Pj4gY2hhbmdlLWlk
OiAyMDI0MTIxOS1tbWMtc2xvdC0wNTc0ODg5ZGFlYTMKPj4+Cj4+PiBCZXN0IHJlZ2FyZHMsCj4+
Cj4gCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
