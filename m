Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE28D29FF5
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jan 2026 12:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKd966aHieL/3VqvOEnsvSY0pg/tQj1DvsHRD4TTsfs=; b=Uf6BZenN7zHJsWVjFl0f8CK825
	4er1jY1R9ydP6LapRoQSX1mRhaAslMFn62Fwicr1d61mCXOYxwmOiXVYKENWFqW+bfk1y6OMS4/aj
	cCkXnBFS0mapYQw2SIhspIxylDHP901TpT8FRnetOzP8Fhz+j4xxSg999NO3Xx172Si8egsBUWhTg
	V6+i0gejrc2gZm05vtECCrKvvlHOQgfchcBDsvRj6zr0U0T3YEZjn0hB4AdxsnWltnN+hEd4Ga6Zn
	hB4Jenc6XJEUttz0xPadZImhmuEbqZFHGjzOy0B7U56C+BlYGlFy5FGptthj11jGt8zQ1AeOhrTu4
	Dyy44Aog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzeR-000000095nS-3Ydh;
	Wed, 14 Jan 2026 12:07:03 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzeN-000000095kU-2O1i
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jan 2026 12:07:02 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-430f5ecaa08so4139455f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Jan 2026 04:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768392418; x=1768997218; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3pnFDZOJMe91m1QVq4sRpcpQyhtr0ZmwRl1v6B3xoYE=;
        b=qVoK9FFkWGgclKXIZhELw5dd9xLv4ACW6XS0x3wKOxfkBSjOL1YPFLvqzJmyOnL0h4
         oz5erYRovxSHOwwzkBLoRPP0CTBm9h+uHieY0GuWS4r2xkt8fhQQ481Ya3qMmoDWVwzO
         +lAJ667KgKWFZBZyY9/ceg0BOtp4gNK/D5JugWbB07lAEOUpafCOqlbPOndPvFeT+JHb
         scQJWPtiaTXkSvs14B8wm3AkexAacDB4pQlfrkLdWGmXzCxY+2zr3MVnTJts002bSCD9
         YhcJUxQ4STeermL+qQyebgpNTlro+cVEhcaHw5GavmTiyulpj51e+K82oDsRmSoCmU4t
         R2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768392418; x=1768997218;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3pnFDZOJMe91m1QVq4sRpcpQyhtr0ZmwRl1v6B3xoYE=;
        b=RgqDaMVx8L14lXdy66lYWQ7tiKeLePhpsv5fd3m2eCp6joVmyLVCjSz98ByoqVKm1P
         TF4AaDD55Z520TNkoeefTDZYW0R7gZETY/0VVT+ZzZK9HPm70gHBoNuMYX1VslcBgssV
         4aUCHmub4+ze5Z4OoxM6iKiinDPb79jtgvKlO+t+R2sTALlzTWkkuIl8Cs2Xey38L7IC
         XSwyBwshO6vSEHPxY7/qTjkfd/KEmdqVEWLkdroQftmqOn00flDA0W0JH+k6Jqpzy/AQ
         SoY3cMGFeDuXiN6gXH93Ro7Ju880p37aZHoytev3GHsmhEcqO5mNJ6Gxjn2fFkdzryX+
         316g==
X-Forwarded-Encrypted: i=1; AJvYcCWt2NYsHvfjETXMDoO/i0Z1qzTjSND33yE6Tf0y84Tg6+BWKASL68iXycnE0XSvJW2q3TjIb1DOvxmny48B@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3pwvovBxT8DEjhaP/i7uAPZrT/aWNsGjnhb8y4mcoNHfBSLI6
	iuO050tQtKa9QwwNqgwCYPvWrucRL6IxTtsqRCmMv+N2IGSr5i/xnsfsRlBl6LGQ6y0=
X-Gm-Gg: AY/fxX4vLVYJBx5rnOrAhypptCWDOHoFFCio8XcAzj/cInH8wvPN7/+FJ5uWQPd+d4f
	bmMRsNcOwPZ8aaOEVgyj5GCzoYSeVKZq1IPao4Cw+vCU62F/QMLyVBNGwiJfEDP+DCQPeoFigGA
	st8g5hSdmKpa1pjKSkzyfDCfW6BbXatsPitC4HL4hOO7sNDuWkUtXYRJJ2zB1eiUXXtk1I4NN0B
	UIbSryAg9gcCiClsEhNwMnRhgAJKXtHpU/SOK1iEKy2YhO39HGW0eURTjC8ZHZHSmFp7qY3Yd8j
	zCdAELwEk71GzEZxNLvwpG4bCqZuSF4n4qE79EZKZQyDf9bO0PO/qot2Z9XgtNsJk/OZobrZ0k0
	B/yhvah+MRX+iqYNmR2ICcTSxlQqq79oNPB/ERzHNAq2SSy0BCYhjetOS+HW9bWwfsvHETrtSPf
	yqFfihynpl1xskMs21e0sZUS8i+dAdBG5Mrdw9j+Y5VCAj/kkkR1yiLAoRz8lbcf0=
X-Received: by 2002:a05:6000:2911:b0:430:f58d:40da with SMTP id ffacd0b85a97d-4342c4ef0a9mr2625034f8f.10.1768392417548;
        Wed, 14 Jan 2026 04:06:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:b357:7e03:65d5:1450? ([2a01:e0a:3d9:2080:b357:7e03:65d5:1450])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0860f5sm49164912f8f.0.2026.01.14.04.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 04:06:57 -0800 (PST)
Message-ID: <4c0e0a34-7612-4bd6-9e9d-5599cbeb8fd0@linaro.org>
Date: Wed, 14 Jan 2026 13:06:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add Khadas VIM1S
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>, Nick Xie <xieqinick@gmail.com>
References: <20260114062549.68954-1-nick@khadas.com>
 <20260114062549.68954-2-nick@khadas.com>
 <20260114-slick-passionate-mink-216a3a@quoll>
 <CAP4nuTXeC1-6ktwLpDt_1ZRHxPSiNAoDKTxLzqEYJUfcnVogcQ@mail.gmail.com>
 <39bb1820-6e4d-4f50-87e0-93844d779f6c@kernel.org>
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
In-Reply-To: <39bb1820-6e4d-4f50-87e0-93844d779f6c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_040700_526972_915FD633 
X-CRM114-Status: GOOD (  16.81  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, martin.blumenstingl@googlemail.com, khilman@baylibre.com, linux-kernel@vger.kernel.org, xianwei.zhao@amlogic.com, nick@khadas.com, linux-amlogic@lists.infradead.org, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMS8xNC8yNiAxMTozMywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAxNC8wMS8y
MDI2IDExOjA3LCBOaWNrIFhpZSB3cm90ZToKPj4gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0Br
ZXJuZWwub3JnPiDkuo4yMDI25bm0MeaciDE05pel5ZGo5LiJIDE2OjUx5YaZ6YGT77yaCj4+Pgo+
Pj4gT24gV2VkLCBKYW4gMTQsIDIwMjYgYXQgMDI6MjU6NDhQTSArMDgwMCwgTmljayBYaWUgd3Jv
dGU6Cj4+Pj4gQWRkIGRldmljZXRyZWUgYmluZGluZyBmb3IgS2hhZGFzIFZJTTFTIGJvYXJkIGJh
c2VkIG9uCj4+Pj4gQW1sb2dpYyBTNCBTOTA1WTQgU29DLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1i
eTogTmljayBYaWUgPG5pY2tAa2hhZGFzLmNvbT4KPj4+Cj4+PiBZb3Ugc3RpbGwgaGF2ZSB0aGUg
c2FtZSBGcm9tL1NvQiBtaXNtYXRjaC4KPj4KPj4gT0ssICBJIHdpbGwgZml4IGl0IGluIG5leHQg
dmVyc2lvbi4KPj4KPj4+Cj4+Pj4gLS0tCj4+Pj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvYXJtL2FtbG9naWMueWFtbCB8IDYgKysrKysrCj4+Pj4gICAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbAo+Pj4+IGluZGV4IDA4ZDk5NjNmZTkyNTku
LjU1NjYzZTBmN2Y5MTUgMTAwNjQ0Cj4+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwKPj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbAo+Pj4+IEBAIC0yNDcsNiArMjQ3LDEyIEBA
IHByb3BlcnRpZXM6Cj4+Pj4gICAgICAgICAgICAgICAgIC0gYW1sb2dpYyxhcTIyMgo+Pj4+ICAg
ICAgICAgICAgIC0gY29uc3Q6IGFtbG9naWMsczQKPiAKPiBMb29rIGhlcmUKPiAKPj4+Pgo+Pj4+
ICsgICAgICAtIGRlc2NyaXB0aW9uOiBCb2FyZHMgd2l0aCB0aGUgQW1sb2dpYyBNZXNvbiBTNCBT
OTA1WTQgU29DCj4+Pj4gKyAgICAgICAgaXRlbXM6Cj4+Pj4gKyAgICAgICAgICAtIGVudW06Cj4+
Pgo+Pj4gWW9wdSBhbHJlYWR5IGhhdmUgZXhhY3RseSBzdWNoIGVudW0gd2l0aCBzdWNoIGRlc2Ny
aXB0aW9uLCBzbyB5b3VyCj4+PiBjb21wYXRpYmxlIGdvZXMgdGhlcmUuIExvb2sgLSBpdCBpcyBj
YWxsZWQgIkJvYXJkcyIgLSBwbHVyYWwuCj4+Cj4+IFRoZSBleGlzdCBib2FyZCBhcTIyMiBpcyBi
YXNlZCBvbiBTb0MgUzkwNVgyLCBidXQgdGhlIG5ldyBib2FyZCB2aW0xcwo+PiBpcyBiYWVkIG9u
IFM5MDVZNCwKPj4gdGhleSBhcmUgZGlmZmVyZW50IFNvQywgc28gd2UgbmVlZCB0byBwdXQgUzkw
NVk0IHVuZGVyIFM4MDVYMiA/Cj4gCj4gV2hhdCBpcyB0aGUgcG9pbnQgb2YgaGF2aW5nIHR3byBz
ZXBhcmF0ZSBsaXN0cyB3aXRoIGVudW1zIGVuZGluZyB0aGUKPiBzYW1lIFNvQyBjb21wYXRpYmxl
PwoKSXQncyB2ZXJ5IHVzdWFsIGZvciBTb0MgdmVuZG9ycyB0byByZXVzZSB0aGUgc2FtZSBTb0Mg
ZGVzaWduIChoZXJlIEFtbG9naWMgUzQpCmludG8gbXVsdGlwbGUgZGlmZmVyZW50IHBhY2thZ2Vz
LCB3aXRoIHNvbWUgZGlmZmVyZW50IGZlYXR1cmVzIGVuYWJsZWQgJiBzbyBvbiwKYW5kIGV2ZW4g
bmV3IHZlcnNpb24gb2YgdGhlIGRpZSB3aXRoIHNvbWUgYnVnZml4ZXMuCgpXZSBkaWQgdGhpcyBp
biB0aGUgcGFzdCBmb3IgZ29vcCByZWFzb25zLCBhbmQgaGVyZSBpdCBhbHNvIGFwcGxpZXMuCklu
IGZhY3QgdGhlIGN1cnJlbnRseSBzdXBwb3J0ZWQgU29DIChTODA1WDIpIGlzIGEgc3RyaXBwZWQg
ZG93bgp2ZXJzaW9uIG9mIHRoZSBTNCBTb0MgbGlrZSBpdCB3YXMgZG9uZSBmb3IgdGhlIFM4MDVY
IHdoaWNoIHdhcyBhYWxzbyBhIHN0cmlwcGVkCmRvd24gdmVyc2lvbiBvZiB0aGUgUzkwNVgsIHdp
dGggYSBkaWZmZXJlbnQgSU8gbGF5b3V0IGFuZCBkaWZmZXJlbnQgaW50ZXJuYWwKY2hhcmFjdGVy
aXN0aWNzIGV2ZW4gaWYgdGhlIGRpZSBsb2dpYyB3YXMgdGhlIHNhbWUuCgpOZWlsCgo+IAo+Pgo+
Pj4KPj4+PiArICAgICAgICAgICAgICAtIGtoYWRhcyx2aW0xcwo+Pj4+ICsgICAgICAgICAgLSBj
b25zdDogYW1sb2dpYyxzNAo+IAo+IEFuZCBoZXJlLgo+IAo+Pj4KPj4+IEJlc3QgcmVnYXJkcywK
Pj4+IEtyenlzenRvZgo+Pj4KPiAKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
