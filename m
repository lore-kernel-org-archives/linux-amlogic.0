Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0236C4345F
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2024 21:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FGqoD3GFOpfzthTBACOoe+L9R24eKFntDfIQdT8Z0XU=; b=luu+44wlVbIsdYGe961PUV59Hv
	5MKhmuzmEzcdHXgwOjA9NdwF22AeUZJVzInqnpVq6LYKN0lpitMVW8Ss6jrr9QxdUjc3x2FqD3y/p
	PSjAGzZZcmVHZeoX/ea6LdA7WFqc9+u9Dk7tKF0vWqWxv7YUUmlUo4MtoXh0STx0zyflPq+Lw1sUQ
	VCYtvf6q673+3FM+JABeAaHMRNEz9Lx2uqImTGvcuuNjgpXX0NyoZKL4dZjj62TpopdRAwB8Up3Wc
	JFS1J4ZRo2vUbyoAT03Ld54d0waiWiJ6XgKYNEnkDC9Xq5hl577NzxDk4ZE95Zx1bbh8Sm7XhCbJj
	tOcifPNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxYuU-00000003i0L-15qM;
	Thu, 18 Apr 2024 21:03:10 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxYuP-00000003hxt-2hdI
	for linux-amlogic@lists.infradead.org;
	Thu, 18 Apr 2024 21:03:07 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1e3c9300c65so13047835ad.0
        for <linux-amlogic@lists.infradead.org>; Thu, 18 Apr 2024 14:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713474184; x=1714078984; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ECYyys6aoTgaptV/LoyO8VNanlxEG+pc2oeOwPKfVIc=;
        b=yj+W94Abx7OIAWtv9Wu3UDIbIqzx/1JOuU0+0F1RaLUpLWkrpvmAU2wJ5JZbRtZkG0
         WQemRFJ+DXaPTRvWtpPOl42Gm6050WVW5A3lDkYKeGF58S0W9kD+G92jq+869TxbCNiA
         IeU/LtR7lQxuPp9XYugQsZPVtWgy/t12CjPaNWCrfz9nLV3b6zwqlszNkXEGQLEwCyjK
         x82/s5Vwmx99/Obt4aRE5yxWWzLeQPZZgSyWf69j6s/HqpIgPO9D7d4f2sczOtKEswdt
         OW/fYTfNalMB3985sfpp87t42jiTCCOHG3w+k4PgGF7tfhWKbUGrAEt+R6S0RY6SgxCV
         i5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713474184; x=1714078984;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ECYyys6aoTgaptV/LoyO8VNanlxEG+pc2oeOwPKfVIc=;
        b=dZtKYzG4CdC1aNGpiGeY8ehiCwUZ89U5fqPOw0AMJ1NhWPWkm/VfXevtpjM62r/kfx
         QQ2AdMyVvnT+Ilp01j+chyf41iNztOMVTeFyZAhdWHw0NW+U3zAHUNbdjHRBcNQdf49c
         to27zL+//p3dEMpZ9V//+A3n3TlO3G7HKjTJ2f/6rwqtel/lPJxzEktVhj8Gv70W5V4j
         aIr4k7BlhpBAKuJGR21PRpffbeSpQ8ggkjqVXuBRybC8h1bxGp0BwlesYU/Jfo+XsNi8
         +G1HDaOvg0/TNUpUpu2CFF8dkdM7yl0qqXoWGlDGPtwXD6coZwKJ2q6+56uEiMBWL7ts
         57lg==
X-Forwarded-Encrypted: i=1; AJvYcCWD1NLjnv0Upeh2/DlYOQx60ZOE/zExWgDh1B15VRzEt4Zf8kjushNgZ9UUKDn8Odx2OfbL9GOr2nTGiTTCG7ocOXqup29nGIsmPezr4Uuvmnk=
X-Gm-Message-State: AOJu0Yx8yYsJ9F2XR6gmtweErm+263IR6MTjz1QYP/JgdRFal04qG/iL
	YGbQP2ju53EpPCwD0HrCX1CUcJ2efY0OnPSFHDNXsEGvmMXvsM3JTh6voaNctaA=
X-Google-Smtp-Source: AGHT+IGHor8csSxZDagYgaB6/ojvhxlu7Uteia1vXUisFp7SM+Grb6p8+pI0a41Y1E/Pv/SYi01gZA==
X-Received: by 2002:a17:902:d2cf:b0:1e3:cfc5:589e with SMTP id n15-20020a170902d2cf00b001e3cfc5589emr308126plc.64.1713474183819;
        Thu, 18 Apr 2024 14:03:03 -0700 (PDT)
Received: from [10.36.52.145] ([24.75.208.148])
        by smtp.gmail.com with ESMTPSA id b15-20020a170903228f00b001e4928c8026sm1973926plh.13.2024.04.18.14.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 14:03:03 -0700 (PDT)
Message-ID: <4736ba70-a42a-473f-8724-8e664bbfe4eb@linaro.org>
Date: Thu, 18 Apr 2024 23:03:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/3] dt-bindings: reset: Add Amlogic T7 Reset Controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kelvin Zhang <kelvin.zhang@amlogic.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zelong Dong <zelong.dong@amlogic.com>
References: <20240329-t7-reset-v1-0-4c6e2e68359e@amlogic.com>
 <20240329-t7-reset-v1-1-4c6e2e68359e@amlogic.com>
 <927ad2cb-3b41-4eda-b930-856be64ae9ba@linaro.org>
 <10650c59-96f2-4234-b5fd-aa8efec90e5b@linaro.org>
 <579a1569-7bba-491f-ba5e-7cfcb34ccc1f@linaro.org>
 <c7e243e3-3f61-4d63-8727-3837838bdfcc@linaro.org>
 <48005005-54ad-473b-826d-23b0b3f3a52c@amlogic.com>
 <64c765e4-698f-49d6-8d17-4b512c3dc8ec@linaro.org>
 <f845db57-64dc-4127-ab8d-9a038fd8d35b@linaro.org>
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
In-Reply-To: <f845db57-64dc-4127-ab8d-9a038fd8d35b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_140305_797761_348DF5C5 
X-CRM114-Status: GOOD (  30.91  )
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

T24gMTcvMDQvMjAyNCAyMTowOCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAxNi8w
NC8yMDI0IDAxOjMwLCBuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnIHdyb3RlOgo+PiBPbiAxNS8w
NC8yMDI0IDEyOjMxLCBLZWx2aW4gWmhhbmcgd3JvdGU6Cj4+Pgo+Pj4gT24gMjAyNC80LzEzIDAy
OjAzLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+Pj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+
Pj4+Cj4+Pj4gT24gMTIvMDQvMjAyNCAxOTo1NywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToK
Pj4+Pj4gT24gMTIvMDQvMjAyNCAxNToxMiwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+Pj4+PiBI
aSwKPj4+Pj4+Cj4+Pj4+PiBPbiAyOS8wMy8yMDI0IDIwOjM5LCBLcnp5c3p0b2YgS296bG93c2tp
IHdyb3RlOgo+Pj4+Pj4+IE9uIDI5LzAzLzIwMjQgMTA6MTcsIEtlbHZpbiBaaGFuZyB2aWEgQjQg
UmVsYXkgd3JvdGU6Cj4+Pj4+Pj4+IEZyb206IFplbG9uZyBEb25nIDx6ZWxvbmcuZG9uZ0BhbWxv
Z2ljLmNvbT4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gQWRkIGEgbmV3IGNvbXBhdGlibGUgYW5kIHRoZSBy
ZWxhdGVkIGhlYWRlciBmaWxlCj4+Pj4+Pj4+IGZvciBBbWxvZ2ljIFQ3IFJlc2V0IENvbnRyb2xs
ZXIuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFplbG9uZyBEb25nIDx6ZWxvbmcu
ZG9uZ0BhbWxvZ2ljLmNvbT4KPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogS2VsdmluIFpoYW5nIDxr
ZWx2aW4uemhhbmdAYW1sb2dpYy5jb20+Cj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+PiAgwqDCoCAuLi4v
YmluZGluZ3MvcmVzZXQvYW1sb2dpYyxtZXNvbi1yZXNldC55YW1swqDCoMKgwqDCoMKgwqAgfMKg
wqAgMSArCj4+Pj4+Pj4+ICDCoMKgIGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvYW1sb2dpYyx0
Ny1yZXNldC5owqDCoMKgwqDCoMKgIHwgMTk3ICsrKysrKysrKysrKysrKysrKysrKwo+Pj4+Pj4+
PiAgwqDCoCAyIGZpbGVzIGNoYW5nZWQsIDE5OCBpbnNlcnRpb25zKCspCj4+Pj4+Pj4+Cj4+Pj4+
Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXQv
YW1sb2dpYyxtZXNvbi1yZXNldC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3Jlc2V0L2FtbG9naWMsbWVzb24tcmVzZXQueWFtbAo+Pj4+Pj4+PiBpbmRleCBmMGM2YzBk
ZjBjZTMuLmZlZmUzNDNlNWFmZSAxMDA2NDQKPj4+Pj4+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2V0L2FtbG9naWMsbWVzb24tcmVzZXQueWFtbAo+Pj4+Pj4+
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXQvYW1sb2dpYyxt
ZXNvbi1yZXNldC55YW1sCj4+Pj4+Pj4+IEBAIC0xOSw2ICsxOSw3IEBAIHByb3BlcnRpZXM6Cj4+
Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgIC0gYW1sb2dpYyxtZXNvbi1hMS1yZXNldCAjIFJlc2V0
IENvbnRyb2xsZXIgb24gQTEgYW5kIGNvbXBhdGlibGUgU29Dcwo+Pj4+Pj4+PiAgwqDCoMKgwqDC
oMKgwqDCoCAtIGFtbG9naWMsbWVzb24tczQtcmVzZXQgIyBSZXNldCBDb250cm9sbGVyIG9uIFM0
IGFuZCBjb21wYXRpYmxlIFNvQ3MKPj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgLSBhbWxvZ2lj
LGMzLXJlc2V0ICMgUmVzZXQgQ29udHJvbGxlciBvbiBDMyBhbmQgY29tcGF0aWJsZSBTb0NzCj4+
Pj4+Pj4+ICvCoMKgwqDCoMKgIC0gYW1sb2dpYyx0Ny1yZXNldCAjIFJlc2V0IENvbnRyb2xsZXIg
b24gVDcgYW5kIGNvbXBhdGlibGUgU29Dcwo+Pj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4gSWYgdGhl
cmUgaXMgZ29pbmcgdG8gYmUgYW55IHJlc2VuZCwgcGxlYXNlIGRyb3AgdGhlIGNvbW1lbnQuIEl0
J3Mgbm90Cj4+Pj4+Pj4gcmVhbGx5IGhlbHBmdWwgYW5kIG1ha2VzIGl0IHRyaWNraWVyIHRvIHJl
YWQuCj4+Pj4+Pj4KPj4+Pj4+Pj4gIMKgwqDCoMKgIHJlZzoKPj4+Pj4+Pj4gIMKgwqDCoMKgwqDC
oCBtYXhJdGVtczogMQo+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9y
ZXNldC9hbWxvZ2ljLHQ3LXJlc2V0LmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L2FtbG9n
aWMsdDctcmVzZXQuaAo+Pj4+Pj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4+Pj4+PiBpbmRl
eCAwMDAwMDAwMDAwMDAuLmNhNGE4MzJlZWVlYwo+Pj4+Pj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4+
Pj4+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvYW1sb2dpYyx0Ny1yZXNldC5oCj4+
Pj4+Pj4+IEBAIC0wLDAgKzEsMTk3IEBACj4+Pj4+Pj4+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogKEdQTC0yLjAtb25seSBPUiBNSVQpICovCj4+Pj4+Pj4+ICsvKgo+Pj4+Pj4+PiArICog
Q29weXJpZ2h0IChjKSAyMDI0IEFtbG9naWMsIEluYy4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KPj4+
Pj4+Pj4gKyAqLwo+Pj4+Pj4+PiArCj4+Pj4+Pj4+ICsjaWZuZGVmIF9EVF9CSU5ESU5HU19BTUxP
R0lDX1Q3X1JFU0VUX0gKPj4+Pj4+Pj4gKyNkZWZpbmUgX0RUX0JJTkRJTkdTX0FNTE9HSUNfVDdf
UkVTRVRfSAo+Pj4+Pj4+PiArCj4+Pj4+Pj4+ICsvKiBSRVNFVDAgKi8KPj4+Pj4+Pj4gKy8qwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDAtM8KgwqDCoMKgICovCj4+Pj4+Pj4KPj4+Pj4+PiBJIGFzc3Vt
ZSB0aGlzIG1hdGNoZXMgZXhpc3RpbmcgZHJpdmVycyB3aGljaCBkbyBub3QgdXNlIElEcyBidXQg
bWFwIHRoZQo+Pj4+Pj4+IGJpbmRpbmcgdG8gaGFyZHdhcmUgdmFsdWU/IEkgcmVtZW1iZXIgd2Ug
dGFsa2VkIGFib3V0IGNoYW5naW5nIGl0LCBzbyBpZgo+Pj4+Pj4+IHNvbWV0aGluZyBoYXBwZW5l
ZCBhYm91dCB0aGlzIGFuZCBpdCBjb3VsZCBiZSBjaGFuZ2VkOiBwbGVhc2UgY2hhbmdlLgo+Pj4+
Pj4KPj4+Pj4+IEknbSBub3QgYXdhcmUgb2Ygc3VjaCBkaXNjdXNzaW9uLCBhbmQgSSBkb24ndCBy
ZWFsbHkgc2VlIHRoZSBpc3N1ZS4uLgo+Pj4+Pj4gdGhvc2VzIGFyZSBJRHMsIGFuZCB5ZXMgdGhl
eSBtYXRjaCB0aGUgSGFyZHdhcmUgb2Zmc2V0cywgYW5kID8KPj4+Pj4KPj4+Pj4gQmluZGluZ3Mg
YXJlIG5vdCBmb3IgaGFyZHdhcmUgb2Zmc2V0cy92YWx1ZXMvYWRkcmVzc2VzLiBJdCdzIGp1c3Qg
bm90IGEKPj4+Pj4gYmluZGluZy4KPj4+Pj4KPj4+Pj4gSSBxdWlja2x5IGxvb2tlZCBhdCB5b3Vy
IGRyaXZlciBwYXRjaCBhbmQgaXQgY29uZmlybXM6IG5vdCBhIGJpbmRpbmcuCj4+Pj4+IEJpbmRp
bmcgY29uc3RhbnQgaXMgdXNlZCBieSB0aGUgZHJpdmVyIGFuZCBEVFMgY29uc3VtZXIuCj4+Pj4+
Cj4+Pj4+IEkgYW0gcmVhbGx5IHN1cmUgd2UgaGFkIHRoaXMgdGFsayBpbiB0aGUgcGFzdCwgYnV0
IGNvdWxkIGJlIEkgdGhpbmsKPj4+Pj4gYWJvdXQgZGlmZmVyZW50IHBsYXRmb3JtLiBTaW5jZSB0
aGlzIGlzIG5vdCBhIGJpbmRpbmcsIEkgZG8gbm90IHRoaW5rCj4+Pj4+IGNsYWltaW5nIHRoZXJl
IGlzIGFueSBBQkkgaGVyZSBpcyByZWFzb25hYmxlLiBGZWVsIGZyZWUgdG8gc3RvcmUgdGhlbQo+
Pj4+PiB3aXRoIG90aGVyIGhhcmR3YXJlIHZhbHVlcywgbGlrZSBpbiBEVFMgaGVhZGVycyBldGMu
IFdlIGFscmVhZHkgbW92ZWQgdG8KPj4+Pj4gRFRTIGhlYWRlcnMgc2V2ZXJhbCBzdWNoICJub24t
YmluZGluZyIgY29uc3RhbnRzLgo+Pj4+Cj4+Pj4gVW4tYWNrZWQuCj4+Pj4KPj4+PiBJIGxvb2tl
ZCBhdCBteSBhcmNoaXZlcyBhbmQgd2UgZGlkIHRhbGsgYWJvdXQgaXQgYW5kIHlvdSB3ZXJlIEND
ZWQ6Cj4+Pj4KPj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1kZXZpY2V0cmVlL2Mw
ODhlMDFjLTA3MTQtODJiZS04MzQ3LTYxNDBkYWY1NjY0MEBsaW5hcm8ub3JnLwo+Pj4+IHNpbXBs
ZS1yZXNldCBpcyBhbiBleGNlcHRpb24uCj4+Pj4KPj4+PiBTbyB0byByZWNhcDoKPj4+PiBUaGF0
J3Mgbm90IGEgYmluZGluZy4gRG9uJ3QgYWRkIHNvbWUgcmVhbCB2YWx1ZXMgdG8gYmluZGluZyBo
ZWFkZXJzCj4+Pj4gYmVjYXVzZSBpdCBpcyBub3QgYSBiaW5kaW5nIHRoZW4uCj4+Cj4+IFNvIHdo
YXQncyBleGFjdGx5IGEgYmluZGluZyB0aGVuPwo+IAo+IEJpbmRpbmcgaGVhZGVycyBpcyBpbnRl
cmZhY2UgbmVlZGVkIChuZWNlc3NhcnkpIGJldHdlZW4gaW1wbGVtZW50YXRpb24KPiAobGlrZSBM
aW51eCBkcml2ZXJzKSBhbmQgRFRTLgo+IAo+PiByYW5kb20gbGluZWFyIG51bWJlcnMgdGhhdCBt
ZWFucyBub3RoaW5nIGNhbiBiZSBhIGJpbmRpbmcKPj4gYnV0IHJlZ2lzdGVycyBudW1iZXJzIGNh
bid0IGJlID8gd2h5ID8gSSBzdGlsbCBkb24ndCB1bmRlcnN0YW5kLCB3aHkgdGhpcyBzdWRkZW5s
eSBnZXRzIHByb2JsZW1hdGljID8KPiAKPiBUaGVyZSBpcyBubyBpbnRlcmZhY2UgaGVyZS4gRHJp
dmVycyBkb24ndCB1c2UgdGhlbS4gSXQncyBub3QgInN1ZGRlbmx5Igo+IHByb2JsZW1hdGljLCBJ
IGNvbW1lbnRlZCBvbiB0aGlzIHllYXIgb3IgdHdvIHllYXJzIGFnbyBhbmQgd2UgYWxzbwo+IHN0
YXJ0ZWQgbW92aW5nIHN1Y2ggaGVhZGVyLWFidXNlcnMgb3V0IG9mIGJpbmRpbmdzLgo+IAo+Pgo+
Pj4+Cj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZGV2aWNldHJlZS9DQUs4UDNh
MUFQenM3NFlUY1o9bTQzRzN6cm13SlpLY1lTVHZWNWVERFFYLTM3VVk3VHdAbWFpbC5nbWFpbC5j
b20vCj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZGV2aWNldHJlZS9DQUs4UDNh
MGZESlF2R0xFdEcwZnhMa0cwOEZoOVY3TEVNUHN4NEFhUysyTGRvX3hXeHdAbWFpbC5nbWFpbC5j
b20vCj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZGV2aWNldHJlZS9iNjBmNWZk
Mi1kYzQ4LTkzNzUtZGExYy1mZmNmZTgyOTI2ODNAbGluYXJvLm9yZy8KPj4+PiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1kZXZpY2V0cmVlLzQxOGM1ZjBjLTUyNzktNDFmNS0zNzA1LTM0
NWVjOWE5N2VhMkBsaW5hcm8ub3JnLwo+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDE0MDExMTE0MTUuMjkzOTUuYXJuZEBhcm5kYi5kZS8KPj4+Pgo+Pj4gR290IGl0LiBXaWxsIGRl
bGV0ZSBhbWxvZ2ljLHQ3LXJlc2V0LmggYW5kIHVzZSB0aGUgaGFyZHdhcmUgbnVtYmVycwo+Pj4g
ZGlyZWN0bHkgaW4gdGhlIERULiA+Cj4+PiBIaSBOZWlsLAo+Pj4gQXMgeW91IGtub3csIEFtbG9n
aWMgcmVzZXQgY29udHJvbGxlciBpcyBkaXZpZGVkIGludG8gc2V2ZXJhbCBncm91cHM6IHJlc2V0
MCwgcmVzZXQxLCAuLi4sIHJlc2V0Ti4gSSdkIGxpa2UgdG8gZGlzY3VzcyB0aGUgcmF0aW9uYWxp
dHkgb2Ygc3BsaXR0aW5nIHRoZSBvbmUgZGV2aWNlIG5vZGUgb2YgcmVzZXQgY29udHJvbGxlciBp
bnRvIGRldmljZSBub2RlcyBhY2NvcmRpbmcgdG8gdGhlIGdyb3Vwcy4gVGhlbiB3ZSBjYW4gdXNl
IHRoZSBiaXQgbnVtYmVyIHdpdGhpbiB0aGUgJ3Jlc2V0cycgcHJvcGVydHkuCj4+PiByZXNldDA6
IHJlc2V0LWNvbnRyb2xsZXJAMjAwMCB7Cj4+PiAuLi4KPj4+IH07Cj4+Pgo+Pj4gcmVzZXQxOiBy
ZXNldC1jb250cm9sbGVyQDIwMDQgewo+Pj4gLi4uCj4+PiB9Owo+Pj4gLi4uCj4+Pgo+Pj4gV2hh
dCBkbyB5b3UgdGhpbms/Cj4+Cj4+IE5vIHNpbmNlIHlvdSdsbCBiYXNpY2FsbHkgYWRkIGEgbm9k
ZSBwZXIgcmVnaXN0ZXIsIHlvdSBuZWVkIHRvIGFkZCBhIG5vZGUgZm9yIHRoZSB3aGlsZSByZXNl
dCBIVyBmdW5jdGlvbiwgYW5vdGhlcgo+PiBzb2x1dGlvbiB3b3VsZCBiZSB0byBzcGxpdCB0aGUg
cGhhbmRsZSBhcmd1bWVudHMgaW4gMiwgdGhlIGZpcnN0IGZpcnN0IHdvdWxkIGJlIHRoZSByZXNl
dCBiYW5rLCBhbmQgdGhlIHNlY29uZCBvbmUKPj4gdGhlIHJlc2V0IGxpbmUgZm9yIHRoZSBiYW5r
Lgo+Pgo+PiBCdXQgc3RpbGwgaXQncyBhIHJlZ3Jlc3Npb24gaW4gcmVhZGFiaWxpdHkgdG8gZHJv
cCB0aGUgbWFjcm9zLCB1bnRpbCBncGlvcyBvciBwaW5zIHRoZSByZXNldCBudW1iZXIgZG9lc24n
dCBtZWFuIGFueXRoaW5nIHBlciBzZS4KPiAKPiAKPiBXaGF0IHN0b3BzIHlvdSBmcm9tIHB1dHRp
bmcgdGhlIGhlYWRlciBpbiB0aGUgRFRTPyBKdXN0IGxpa2Ugb3RoZXJzIGFyZQo+IGRvaW5nPwoK
T2sgc28gbm93IEkgdW5kZXJzdGFuZCwgS2VsdmluIGp1c3Qga2VlcCB0aGUgaGVhZGVyIGJ1dCBt
b3ZlIGl0IGluIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYyBhbG9uZyB0aGUgRFQgcGF0Y2gg
YW5kIGRyb3AgaXQgZnJvbSB0aGUgYmluZGluZ3MgcGF0Y2guCgpUaGFua3MsCk5laWwKCj4gCj4g
QmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
