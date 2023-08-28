Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B0EC83F12
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Aug 2023 08:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hvj8mRM0e+RbWHh5DweE+l4avlxV34pfafJpAClul9I=; b=ujthBrwdtYiOqXxu0CTY0XQI3l
	3bty2drZgwAwq3J90dGjp6qxK+K1IY/mD3h5YZjWQe3uVBAifIA5qAM61aFzggmrZdhioVOKodwSe
	BKcef/w6VoNFIi5IbCfA0sKp78fOBKHwUTd9/siVBIwLVmzsfnLARf1J/HUQmnFYsgAVU04Th/dEa
	ruAeOZMgC96dhD8iuhqOhpaflQ28eFM04erQS/Md466M2ccEzLU5OTYhvCSosIlikWBgo+BKVEwTh
	+pla+EciYlxdc1t7oTKHblwc6Vd21FzH/M1pSQtksOdMlkeOhglgLw7B/plrIeM8DqGoQw7Ob5ESj
	UXatIdNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaXxI-009Ac4-0J;
	Mon, 28 Aug 2023 08:50:40 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaXxE-009AbE-1C
	for linux-amlogic@lists.infradead.org;
	Mon, 28 Aug 2023 08:50:38 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40078c4855fso27660595e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Aug 2023 01:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693212635; x=1693817435;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WGPoX5APlzIB9ylI10o7qd7oHlAS1PpIgI7APqFVRWM=;
        b=R8nZQvaGr8ltLMH+5JimkWXJDodtmVdSfxM6UsvA7X53PFEX23tGdCQ8c2CtFYvRie
         i/VLzausU9IZagdCO4tAlEaanvbx+cXmD9DRytsKqLPBu64DJGteHqdeeTQcTv6orFyF
         Pd43XUSJbl8dQ4l7uKOt7VhG8Tz8FeuXQQhgNq/m6JpqtZadTRtFAb/LlblBGD0dhOdQ
         rUOSRtEYX0/phCZ4MAypfdWy32up+hdUgyo9NoDJ3hzvBB8I2OJ8qJyycYF70SyVbILQ
         E1sUXGQG0d+9CGvpXMo0E5J573QOVegntR+EGCIbN7ZwczsbFURfP43efjiiDV3+Ej4R
         9DPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693212635; x=1693817435;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WGPoX5APlzIB9ylI10o7qd7oHlAS1PpIgI7APqFVRWM=;
        b=NEGudfcoRPbqC+kllSq177oozUpySwF1AQFBvveQ6pvxSA1NcePNSHb5hYneYXARMf
         zt4YkXIm4sxGbAK8xa4jEGQMq3rhJZ4ZSHc0WcX6X98ZyA+x9clFs10+WRbnChxWk9Hf
         h52D1UsyR52Jc65eb2PW2+Z1YbCJX/dNCmpgGWm22c9CcG3TfYjo7ZjM5UiPYlTred1K
         f68LOOBRckn4GW9DVsvcK2yLZ70mETZ5MKwKbWYUeorgzM9+jD07/LHcOSvZgpDafQHj
         x+EYTI8Jl5ahiwTLLSAP3CA7N43fYNNVJdISzLJW/txRd7JaLh8wzjhuffiFpEEARQtw
         oI9Q==
X-Gm-Message-State: AOJu0YyoukU3/2rllkL4XLn891tcmd1Nff10J6yJ08vdBmviOtMrK9Nw
	DnQwd+9VWYRtoK9M77F3c5WI91spi47tKpDpI7k6w+mF
X-Google-Smtp-Source: AGHT+IEJwUe/1R7M1K8G0Ek/Vcp84qIH6fHSeKsCRwrJZEWTCru0Ra1VTzcLbEJWVaKkh08Zny6uHQ==
X-Received: by 2002:a7b:ce91:0:b0:400:6b36:ee2a with SMTP id q17-20020a7bce91000000b004006b36ee2amr9951462wmj.26.1693212634766;
        Mon, 28 Aug 2023 01:50:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5e59:c27b:747a:3f52? ([2a01:e0a:982:cbb0:5e59:c27b:747a:3f52])
        by smtp.gmail.com with ESMTPSA id x16-20020a5d6510000000b003143c9beeaesm9877481wru.44.2023.08.28.01.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 01:50:34 -0700 (PDT)
Message-ID: <23bfd7bc-98ea-42c4-b2d4-6060df5e7080@linaro.org>
Date: Mon, 28 Aug 2023 10:50:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] Revert "tty: serial: meson: Add a earlycon for the T7
 SoC"
Content-Language: en-US, fr
To: tanure@linux.com, Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20230827082944.5100-1-tanure@linux.com>
 <7bf9e716-0ff2-56d5-07ab-db027901454e@linaro.org>
 <09735262-1bc0-40cf-b139-22cccf70bcab@linux.com>
 <e73260c9-04f8-eb1e-bb5b-c3bd2219625e@linaro.org>
 <8d2ba0d3-55eb-45cf-b88a-bafef35e96b9@linux.com>
 <20230828082009.kehgwi4fxtj3bfze@CAB-WSD-L081021>
 <e070f432-28bd-465f-ad66-53add8b61907@linaro.org>
 <20230828084632.sp73jppcrfvc7nv3@CAB-WSD-L081021>
 <CAJX_Q+3x0XtARZwf0_Dh-skAF9Qj3S3uUmLv2mFJO3ZWR2+3og@mail.gmail.com>
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
In-Reply-To: <CAJX_Q+3x0XtARZwf0_Dh-skAF9Qj3S3uUmLv2mFJO3ZWR2+3og@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_015036_412929_5C434009 
X-CRM114-Status: GOOD (  19.50  )
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

T24gMjgvMDgvMjAyMyAxMDo0NywgTHVjYXMgVGFudXJlIHdyb3RlOgo+IE9uIE1vbiwgQXVnIDI4
LCAyMDIzIGF0IDk6NDbigK9BTSBEbWl0cnkgUm9rb3NvdiA8ZGRyb2tvc292QHNiZXJkZXZpY2Vz
LnJ1PiB3cm90ZToKPj4KPj4gT24gTW9uLCBBdWcgMjgsIDIwMjMgYXQgMTA6MjM6NDVBTSArMDIw
MCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+PiBIaSwKPj4+Cj4+PiBPbiAyOC8wOC8yMDIzIDEw
OjIwLCBEbWl0cnkgUm9rb3NvdiB3cm90ZToKPj4+PiBPbiBTdW4sIEF1ZyAyNywgMjAyMyBhdCAx
MTozMTozNUFNICswMTAwLCBMdWNhcyBUYW51cmUgd3JvdGU6Cj4+Pj4+IE9uIDI3LTA4LTIwMjMg
MTE6MjMsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+Pj4+Pj4gSGkgTHVjYXMsCj4+Pj4+Pgo+Pj4+
Pj4gTGUgMjcvMDgvMjAyMyDDoCAxMjowNCwgTHVjYXMgVGFudXJlIGEgw6ljcml0IDoKPj4+Pj4+
PiBPbiAyNy0wOC0yMDIzIDEwOjQ4LCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4+Pj4+Pj4gSGkg
THVjYXMsCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IExlIDI3LzA4LzIwMjMgw6AgMTA6MjksIEx1Y2FzIFRh
bnVyZSBhIMOpY3JpdCA6Cj4+Pj4+Pj4+PiBUaGlzIHJldmVydHMgY29tbWl0IDZhNDE5N2Y5NzYz
MzI1MDQzYWJmNzY5MGEyMTEyNGE5ZmFjYmY1MmUuCj4+Pj4+Pj4+PiBOZXcgU29DIHdpbGwgdXNl
IHR0eVMwIGluc3RlYWQgb2YgdHR5QU1MLCBzbyBUNyBTb0MgZG9lc24ndAo+Pj4+Pj4+Pj4gbmVl
ZCBhIE9GX0VBUkxZQ09OX0RFQ0xBUkUuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1i
eTogTHVjYXMgVGFudXJlIDx0YW51cmVAbGludXguY29tPgo+Pj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4+
PiBTaW5jZSBWMToKPj4+Pj4+Pj4+IC0gYWRkIFNpZ25lZC1vZmYtYnk6Cj4+Pj4+Pj4+Pgo+Pj4+
Pj4+Pj4gICAgIGRyaXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMgfCAyIC0tCj4+Pj4+Pj4+
PiAgICAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMKPj4+Pj4+Pj4+IGIv
ZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYwo+Pj4+Pj4+Pj4gaW5kZXggYzRmNjFkODJm
YjcyNy4uNzkwZDkxMGRhZmE1ZCAxMDA2NDQKPj4+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvdHR5L3Nl
cmlhbC9tZXNvbl91YXJ0LmMKPj4+Pj4+Pj4+ICsrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9tZXNv
bl91YXJ0LmMKPj4+Pj4+Pj4+IEBAIC02NDgsOCArNjQ4LDYgQEAgbWVzb25fc2VyaWFsX2Vhcmx5
X2NvbnNvbGVfc2V0dXAoc3RydWN0Cj4+Pj4+Pj4+PiBlYXJseWNvbl9kZXZpY2UgKmRldmljZSwg
Y29uc3QgY2hhciAqb3B0Cj4+Pj4+Pj4+PiAgICAgT0ZfRUFSTFlDT05fREVDTEFSRShtZXNvbiwg
ImFtbG9naWMsbWVzb24tYW8tdWFydCIsCj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgbWVzb25f
c2VyaWFsX2Vhcmx5X2NvbnNvbGVfc2V0dXApOwo+Pj4+Pj4+Pj4gLU9GX0VBUkxZQ09OX0RFQ0xB
UkUobWVzb24sICJhbWxvZ2ljLHQ3LXVhcnQiLAo+Pj4+Pj4+Pj4gLSAgICAgICAgICAgIG1lc29u
X3NlcmlhbF9lYXJseV9jb25zb2xlX3NldHVwKTsKPj4+Pj4+Pj4+ICAgICAjZGVmaW5lIE1FU09O
X1NFUklBTF9DT05TT0xFX1BUUihfZGV2bmFtZSkKPj4+Pj4+Pj4+ICgmbWVzb25fc2VyaWFsX2Nv
bnNvbGVfIyNfZGV2bmFtZSkKPj4+Pj4+Pj4+ICAgICAjZWxzZQo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBI
b3cgZG8geW91IHVzZSBlYXJseWNvbiB3aXRoIHRoaXMgcmVtb3ZlZCA/Cj4+Pj4+Pj4+Cj4+Pj4+
Pj4+IE5laWwKPj4+Pj4+PiBUaGlzIGlzIG15IGtlcm5lbCBjbWRsaW5lOgo+Pj4+Pj4+IGNvbnNv
bGU9dHR5UzAsOTIxNjAwIG5vX2NvbnNvbGVfc3VzcGVuZCBlYXJseWNvbj10dHlTMCwweGZlMDc4
MDAwCj4+Pj4+Pj4KPj4+Pj4+PiBBbmQgSSBjYW4gc2VlIG15IGxvZzoKPj4+Pj4+PiBib290IDY0
Yml0IGtlcm5lbAo+Pj4+Pj4+IFsgICAgMC4wMDAwMDBdIEJvb3RpbmcgTGludXggb24gcGh5c2lj
YWwgQ1BVIDB4MDAwMDAwMDAwMCBbMHg0MTBmZDA5Ml0KPj4+Pj4+PiBbICAgIDAuMDAwMDAwXSBM
aW51eCB2ZXJzaW9uIDYuNS4wLXJjNy1uZXh0LTIwMjMwODI1Kwo+Pj4+Pj4+ICh0YW51cmVhbEBy
eXplbikgKGFhcmNoNjQtbm9uZS1saW51eC1nbnUtZ2NjIChHTlUgVG9vbGNoYWluIGZvciB0aGUK
Pj4+Pj4+PiBBLXByb2ZpbGUgQXJjaGl0ZWN0dXJlIDEwLjMtMjAyMS4wNyAoYXJtLTEwLjI5KSkg
MTAuMy4xIDIwMjEwNjIxLAo+Pj4+Pj4+IEdOVSBsZCAoR05VIFRvb2xjaGFpbiBmbzMKPj4+Pj4+
PiBbICAgIDAuMDAwMDAwXSBLQVNMUiBkaXNhYmxlZCBkdWUgdG8gbGFjayBvZiBzZWVkCj4+Pj4+
Pj4gWyAgICAwLjAwMDAwMF0gTWFjaGluZSBtb2RlbDogS2hhZGFzIHZpbTQKPj4+Pj4+PiBbICAg
IDAuMDAwMDAwXSBPRjogcmVzZXJ2ZWQgbWVtOgo+Pj4+Pj4+IDB4MDAwMDAwMDAwNTAwMDAwMC4u
MHgwMDAwMDAwMDA1MmZmZmZmICgzMDcyIEtpQikgbm9tYXAgbm9uLXJldXNhYmxlCj4+Pj4+Pj4g
c2VjbW9uQDUwMDAwMDAKPj4+Pj4+PiBbICAgIDAuMDAwMDAwXSBPRjogcmVzZXJ2ZWQgbWVtOgo+
Pj4+Pj4+IDB4MDAwMDAwMDAwNTMwMDAwMC4uMHgwMDAwMDAwMDA3MmZmZmZmICgzMjc2OCBLaUIp
IG5vbWFwCj4+Pj4+Pj4gbm9uLXJldXNhYmxlIHNlY21vbkA1MzAwMDAwCj4+Pj4+Pj4gLi4uCj4+
Pj4+Pj4gWyAgICAwLjA3OTM2OF0gaW8gc2NoZWR1bGVyIG1xLWRlYWRsaW5lIHJlZ2lzdGVyZWQK
Pj4+Pj4+PiBbICAgIDAuMDc5Mzc0XSBpbyBzY2hlZHVsZXIga3liZXIgcmVnaXN0ZXJlZAo+Pj4+
Pj4+IFsgICAgMC4wNzk1NDldIGlvIHNjaGVkdWxlciBiZnEgcmVnaXN0ZXJlZAo+Pj4+Pj4+IFsg
ICAgMC4wODMzNzNdIGZlMDc4MDAwLnNlcmlhbDogdHR5UzAgYXQgTU1JTyAweGZlMDc4MDAwIChp
cnEgPSAxNCwKPj4+Pj4+PiBiYXNlX2JhdWQgPSAxNTAwMDAwKSBpcyBhIG1lc29uX3VhcnQKPj4+
Pj4+PiBbICAgIDAuMDgzNDAzXSBwcmludGs6IGNvbnNvbGUgW3R0eVMwXSBlbmFibGVkCj4+Pj4+
Pj4KPj4+Pj4+PiBBcyB0aGUgbG9nIGlzIE9LLCBhbmQgVDcgZm9yIG5vdyBpcyBiaW5kaW5nIGFn
YWluc3QgUzQgY29kZSB3ZQo+Pj4+Pj4+IHNob3VsZCBkcm9wIHRoaXMgcGF0Y2ggYW5kIGFkZCBh
IFM0IG9uZSBpZiBuZWVkZWQuCj4+Pj4+Pj4KPj4+Pj4+PiBCdXQganVzdCBoYXZpbmcgdGhpcyBs
b2cgaXMgbm90IGVub3VnaCBmb3IgdGVzdGluZyBlYXJseWNvbj8KPj4+Pj4+PiBJIGFtIGFzc3Vt
aW5nIHRoYXQgYnkganVzdCBoYXZpbmcgdGhlIGxvZyBzaW5jZSAwLjAwMDAgaXMgYSBnb29kCj4+
Pj4+Pj4gc2lnbiB0aGF0IGVhcmx5Y29uIGlzIHdvcmtpbmcuCj4+Pj4+Pj4gQ291bGQgeW91IGdp
dmUgZnVydGhlciBndWlkYW5jZT8KPj4+Pj4+Cj4+Pj4+PiBGaXJzdCB0aGUga2VybmVsIGFyZ3Vt
ZW50IGlzIHNpbXBseSAiZWFybHljb24iIHdpdGggbm8gb3RoZXIgb3B0aW9ucywKPj4+Pj4+IHRo
ZSBlYXJseWNvbiBjb2RlIHdpbGwgZmV0Y2ggdGhlIGZpcnN0IHVhcnQgdXNpbmcgdGhlIERUCj4+
Pj4+PiAvY2hvc2VuL3N0ZG91dC1wYXRoIHByb3BlcnR5Lgo+Pj4+Pj4KPj4+Pj4+IFRoZW4geW91
IHNob3VsZCBzZWUgc29tZXRoaW5nIGxpa2UgcmlnaHQgYWZ0ZXIgIk1hY2hpbmUgbW9kZWwiOgo+
Pj4+Pj4gWyAgICAwLjAwMDAwMF0gZWFybHljb246IG1lc29uMCBhdCBNTUlPIDB4MDAwMDAwMDBm
ZjgwMzAwMCAob3B0aW9ucwo+Pj4+Pj4gJzExNTIwMG44JykKPj4+Pj4+Cj4+Pj4+PiBUaGUgYm9v
dCBsb2cgeW91IHNoYXJlIGRvZXNuJ3QgdXNlIGVhcmx5Y29uLCBpdCB3YWl0cyB1bnRpbCBhbGwK
Pj4+Pj4+IGRlcGVkZW5jeSBvZiB0aGUgVUFSVAo+Pj4+Pj4gaGFzIGJlZW4gcHJvYmVkIGJlZm9y
ZSBwcm9iaW5nIHRoZSBVQVJUIGRyaXZlciBhbmQgcHJpbnRzIHRoZSB3aG9sZSBib290Cj4+Pj4+
PiBsb2cuCj4+Pj4+Pgo+Pj4+Pj4gRWFybHljb24gaXMgYSBtZWNoYW5pc20gdG8gdXNlIHRoZSBV
QVJUIEhXIGFzIGNvbmZpZ3VyZWQgYnkgdGhlCj4+Pj4+PiBib290bG9hZGVyIGluCj4+Pj4+PiBh
IG1pbmltYWwgd2F5IHZlcnkgZWFybHkgaW4gdGhlIGJvb3QgaW4gb3JkZXIgdG8gZGV0ZWN0IHZl
cnkgZWFybHkgbG9ja3Vwcy4KPj4+Pj4+Cj4+Pj4+PiBLZWVwaW5nIE9GX0VBUkxZQ09OX0RFQ0xB
UkUgZm9yIHQ3IHdvdWxkIGVuYWJsZSB0aGlzLgo+Pj4+Pj4KPj4+Pj4+IE5laWwKPj4+Pj4+Cj4+
Pj4+Pj4KPj4+Pj4+PiBMdWNhcyBUYW51cmUKPj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4gQnV0IHRoZW4g
d2Ugd291bGQgbmVlZCB0byBhZGQgRWFybHljb24gZm9yIFM0IHRvby4KPj4+Pj4gSG93IGNhbiB3
ZSBhZGQgb25lIEVhcmx5Y29uIGZvciBhbGwgZnV0dXJlIFNvQ3MsIGxpa2UgUzQgYW5kIFQ3Pwo+
Pj4+Pgo+Pj4+Cj4+Pj4gUGVyIG15IHVuZGVyc3RhbmRpbmcsIHlvdSBqdXN0IG5lZWQgdG8gZGVj
bGFyZSBVQVJUIGR0cyBub2RlIHdpdGggdGhlCj4+Pj4gZm9sbG93aW5nIGNvbXBhdGlibGUgc3Ry
aW5nOiAiYW1sb2dpYyxtZXNvbi1hby11YXJ0Ii4gSXQgd2lsbCBlbmFibGVkCj4+Pj4gZWFybHlj
b24uIFRoZXJlIGlzIG5vIG5lY2Nlc3NhcnkgdG8gZGVjbGFyZSBzZXBhcmF0ZQo+Pj4+IE9GX0VB
UkxZQ09OX0RFQ0xBUkUoKS4gSXQncyB3b3JraW5nIG9rYXkgZm9yIEExIGR0czoKPj4+Cj4+PiBU
aGlzIHdvcmtzIG9uIEExIGJlY2F1c2UgdWFydF9BT19CIGlzIGFuIEFsd2F5cy1PbiBVQVJULCBh
bmQgdXNpbmcgYW1sb2dpYyxtZXNvbi1hby11YXJ0Cj4+PiBpcyBjb3JyZW50Lgo+Pj4gQnV0IGZv
ciBTNCAmIFQ3LCBBbWxvZ2ljIGRyb3BwZWQgdGhlIEFsd2F5cy1PbiBwb3dlciBkb21haW4sIHNv
IHRoZXJlJ3Mgbm8gbW9yZSBBTyB1YXJ0cywKPj4+IHNvIHVzaW5nIGFtbG9naWMsbWVzb24tYW8t
dWFydCBvbiB0aG9zZSBpcyBhYnVzaW5nIHRoZSBEVCB0byBlbmFibGUgYSBkcml2ZXIgZnVuY3Rp
b25hbGl0eS4KPj4+Cj4+PiBTbyB0aGUgc29sdXRpb24gaXMgdG8gYWRkIHRob3NlIE9GX0VBUkxZ
Q09OX0RFQ0xBUkUgYW5kIG9ubHkgdXNlIHRoZSBjb3JyZWN0Cj4+PiAvY2hvc2VuL3N0ZG91dC1w
YXRoIHByb3BlcnR5Lgo+Pgo+PiBPaCwgSSBkaWRuJ3Qga25vdyBhYm91dCBtaXNzaW5nIEFsd2F5
cy1PbiBVQVJUIEFPIHBvd2VyIGRvbWFpbi4gSW4gdGhpcwo+PiBzaXR1YXRpb24gSSdtIGZ1bGx5
IGFncmVlIHdpdGggc2VwYXJhdGUgT0ZfRUFSTFlDT05fREVDTEFSRSgpLiBUaGFuayB5b3UKPj4g
Zm9yIGV4cGxhbmF0aW9uIQo+Pgo+Pj4+Cj4+Pj4gbWVzb24tYTEuZHRzaSB1YXJ0IGRlY2xhcmF0
aW9uOgo+Pj4+ICAgICAgdWFydF9BT19COiBzZXJpYWxAMjAwMCB7Cj4+Pj4gICAgICAgICAgICAg
IGNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1hMS11YXJ0IiwKPj4+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICJhbWxvZ2ljLG1lc29uLWFvLXVhcnQiOwo+Pj4+ICAgICAgICAgICAgICBy
ZWcgPSA8MHgwIDB4MjAwMCAweDAgMHgxOD47Cj4+Pj4gICAgICAgICAgICAgIGludGVycnVwdHMg
PSA8R0lDX1NQSSAyNiBJUlFfVFlQRV9FREdFX1JJU0lORz47Cj4+Pj4gICAgICAgICAgICAgIGNs
b2NrcyA9IDwmeHRhbD4sIDwmeHRhbD4sIDwmeHRhbD47Cj4+Pj4gICAgICAgICAgICAgIGNsb2Nr
LW5hbWVzID0gInh0YWwiLCAicGNsayIsICJiYXVkIjsKPj4+PiAgICAgICAgICAgICAgc3RhdHVz
ID0gImRpc2FibGVkIjsKPj4+PiAgICAgIH07Cj4+Pj4KPj4+PiBlYXJseWNvbiBkZWNsYXJhdGlv
biBmcm9tIGR0czoKPj4+PiAgICAgIGFsaWFzZXMgewo+Pj4+ICAgICAgICAgICAgICBzZXJpYWww
ID0gJnVhcnRfQU9fQjsKPj4+PiAgICAgIH07Cj4+Pj4KPj4+PiAgICAgIGNob3NlbiB7Cj4+Pj4g
ICAgICAgICAgICAgIHN0ZG91dC1wYXRoID0gInNlcmlhbDA6MTE1MjAwbjgiOwo+Pj4+ICAgICAg
fTsKPj4+Pgo+Pj4+Pgo+Pj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+Pj4+PiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+Pj4+PiBsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4+Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCj4+Pj4KPj4+Cj4+Cj4+IC0tCj4+IFRo
YW5rIHlvdSwKPj4gRG1pdHJ5Cj4gU28gbGV0J3MgYWRkOgo+IAo+IE9GX0VBUkxZQ09OX0RFQ0xB
UkUobWVzb24sICJhbWxvZ2ljLG1lc29uLXM0LXVhcnQiLAo+IG1lc29uX3NlcmlhbF9lYXJseV9j
b25zb2xlX3NldHVwKTsKPiAKPiBvaz8KCgpZZXMKCk5laWwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
