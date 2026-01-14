Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B291AD31A38
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jan 2026 10:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5s6b5OnzXc4CHDa3Hc2aka50SFXUY+UUQnGB+jJ1X+M=; b=yKRowzLKKB1llyF2G0+eT0Vndc
	at2UOM440D3dprdqPaf5R7Nyfb5SjQ4MGwvwu4B3PAx8BURLRlph6KN3ah/DULXgS/abFhK/EkoTc
	3lNuZPTUJK/3GoH4W3VkGdFSNiTW7j+6/1vB1xAuNnypqpi6cKH7oIrniuEqK7pRGIq4/pedLQlwg
	K2+To/HYuMB5LDieiaVdTuBdgJ4a4nVErwqqMq/I+1UXbxLX+Im5DNOADA+MrCfOY8HJozAPGie2H
	ztzMjtgp0205O9LUQAtqKctVvGBfV8cP1ZadKBzzekXMmteMZuedgcnW7Q373r90OU9/4ZuAzo6jv
	hWtdrc0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxsr-00000008jPn-18jR;
	Wed, 14 Jan 2026 10:13:49 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxso-00000008jNT-21fZ
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jan 2026 10:13:47 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-42fb5810d39so4429170f8f.2
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Jan 2026 02:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768385624; x=1768990424; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3rWsPZP9GypSrCbApSvZEqf+XkVVNq8YSJJcRm2PJVg=;
        b=A7K7mKYz1/bYcIuaA/217EGQwkOjVtZ3RuE+3ND8ognOAslo8kzhbdBU20wbyBhmlq
         I03OgNFVeV1QzgmFeaM36a8INjYeJmiljom+feniKIy70hfUhXBjaKPd+DVVDPKblgP6
         4OR/sMyBMXNJlvCyNB8xbWnP6m2e7GCZdFyfE8GdQLWOjeZ1umnWl6rzrpiK02A56LCO
         60mFbuzYG+Jg9S0GDZns06xokQniPssNTm8szwHkr3f6qUxYODlLpgffNVlYvIy8pcVp
         QA3MP0I+/OXvbkQscIjA7BYMmDbwFkxHP4qa1zBtdwPmErBFUsuVmYVU4vak6qi+px8w
         ldSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768385624; x=1768990424;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3rWsPZP9GypSrCbApSvZEqf+XkVVNq8YSJJcRm2PJVg=;
        b=GiPVGy38Dcm6a2+OReXK6r35/ufnRwTiFL7NFAE8ZO3k7RTMGmfAAAHpU1y190kYks
         R+6fbakCdVs4fXv9OsUY/S3eKtRSERQKbrfTk0jaQvm/WmpAMMenENmbIlJPdS4ieVXz
         ZrqdUDPEvd30p9OCD+TUChXxS3kfXgguUEwlfnm2qID3ywq4zVbacOkrNDoNgk3zOOx9
         2QyPyx6DbUaS72ATMBl2XT67nWk51s7v5oGn+wFHFEXEu8UURZTDjum51RTc03YpNZcs
         XsrldqJlx0IvOHYTXdBXZw83ZmpoBjNz3b+R1OL5hE2vdUhPMR2u2t+kqOtpb3ZV+PSr
         FYOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpWvdnUBjq99UIdTRPqkH44fFgsz7WTjXIpdBVBqUpsWETJZq6ycEFWnjYt9RcMQyMP4zfpAMVQk/KpSMC@lists.infradead.org
X-Gm-Message-State: AOJu0YyiM6SHITGS4V+OZrOXQC1AqL94z2VJ0Wg1efxm8zPSFeQY1vr4
	SEplakPXLg7eK1WGWoyTjH97c2CuGC/9k3xnOtM8OA3oCuGOXdr/iDyRZGhp5dUTpe8=
X-Gm-Gg: AY/fxX5BYNHcGGglcgMUWE+uBh7JKKhQcCNFfWrP+F4QeUifTyWhD1bOLCyM7o2CGHC
	9cetXZ749MwmeTjhp8btxlHgHBPc5286TZMHVgA251cNRgQElqCdEpTixY6lQds/ca36OcoJINh
	c1CyJrbkq1sP4eG78Y7WmJOds/2GstGtWLSVgTu3cbG8Xwri0YKkiUipuQHzfyyKBnCpOXKK2Wu
	PVilu1zetaTYP4KhYg0Z0DKwOGbhsasO1cbBcpob/ECDZHbT3ge7fgi2iCZh+SPhdQujPFQ2rVG
	gJOcdO6hvGI+2EOAJZKPbnAPqFnoWImDNybK89EtL2VXI+j7NaAZPSJU1jrkYM+tgHHvVZYdmYz
	PIMZVihbUIuKBmX2Wv9A4jTqtp+R1IjABx0s/JO3R8qRRAdmc+le8OgTMU0ATOMQX7eToMK3i3A
	iF+VGVEtvMrtAJiiYwMmhvNvcQPbyWix5paLP5N0Uvq4HmojSALMjieM/oggPVg+I=
X-Received: by 2002:a5d:64e5:0:b0:432:c37c:d840 with SMTP id ffacd0b85a97d-4342c4fc9afmr2140894f8f.20.1768385623587;
        Wed, 14 Jan 2026 02:13:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:b357:7e03:65d5:1450? ([2a01:e0a:3d9:2080:b357:7e03:65d5:1450])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e199bsm48795733f8f.16.2026.01.14.02.13.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 02:13:42 -0800 (PST)
Message-ID: <f1d9d4c4-8fe0-4593-8c8f-1fa30cc6ee49@linaro.org>
Date: Wed, 14 Jan 2026 11:13:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add Khadas VIM1S
 binding
To: Nick Xie <xieqinick@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260114062549.68954-1-nick@khadas.com>
 <20260114062549.68954-2-nick@khadas.com>
 <20260114-slick-passionate-mink-216a3a@quoll>
 <CAP4nuTXeC1-6ktwLpDt_1ZRHxPSiNAoDKTxLzqEYJUfcnVogcQ@mail.gmail.com>
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
In-Reply-To: <CAP4nuTXeC1-6ktwLpDt_1ZRHxPSiNAoDKTxLzqEYJUfcnVogcQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_021346_553339_0F263566 
X-CRM114-Status: GOOD (  13.22  )
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

T24gMS8xNC8yNiAxMTowNywgTmljayBYaWUgd3JvdGU6Cj4gS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6a0BrZXJuZWwub3JnPiDkuo4yMDI25bm0MeaciDE05pel5ZGo5LiJIDE2OjUx5YaZ6YGT77ya
Cj4+Cj4+IE9uIFdlZCwgSmFuIDE0LCAyMDI2IGF0IDAyOjI1OjQ4UE0gKzA4MDAsIE5pY2sgWGll
IHdyb3RlOgo+Pj4gQWRkIGRldmljZXRyZWUgYmluZGluZyBmb3IgS2hhZGFzIFZJTTFTIGJvYXJk
IGJhc2VkIG9uCj4+PiBBbWxvZ2ljIFM0IFM5MDVZNCBTb0MuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1i
eTogTmljayBYaWUgPG5pY2tAa2hhZGFzLmNvbT4KPj4KPj4gWW91IHN0aWxsIGhhdmUgdGhlIHNh
bWUgRnJvbS9Tb0IgbWlzbWF0Y2guCj4gCj4gT0ssICBJIHdpbGwgZml4IGl0IGluIG5leHQgdmVy
c2lvbi4KPiAKPj4KPj4+IC0tLQo+Pj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvYXJtL2FtbG9naWMueWFtbCB8IDYgKysrKysrCj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvYXJtL2FtbG9naWMueWFtbAo+Pj4gaW5kZXggMDhkOTk2M2ZlOTI1OS4uNTU2NjNlMGY3
ZjkxNSAxMDA2NDQKPj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9h
cm0vYW1sb2dpYy55YW1sCj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvYXJtL2FtbG9naWMueWFtbAo+Pj4gQEAgLTI0Nyw2ICsyNDcsMTIgQEAgcHJvcGVydGllczoK
Pj4+ICAgICAgICAgICAgICAgICAtIGFtbG9naWMsYXEyMjIKPj4+ICAgICAgICAgICAgIC0gY29u
c3Q6IGFtbG9naWMsczQKPj4+Cj4+PiArICAgICAgLSBkZXNjcmlwdGlvbjogQm9hcmRzIHdpdGgg
dGhlIEFtbG9naWMgTWVzb24gUzQgUzkwNVk0IFNvQwo+Pj4gKyAgICAgICAgaXRlbXM6Cj4+PiAr
ICAgICAgICAgIC0gZW51bToKPj4KPj4gWW9wdSBhbHJlYWR5IGhhdmUgZXhhY3RseSBzdWNoIGVu
dW0gd2l0aCBzdWNoIGRlc2NyaXB0aW9uLCBzbyB5b3VyCj4+IGNvbXBhdGlibGUgZ29lcyB0aGVy
ZS4gTG9vayAtIGl0IGlzIGNhbGxlZCAiQm9hcmRzIiAtIHBsdXJhbC4KPiAKPiBUaGUgZXhpc3Qg
Ym9hcmQgYXEyMjIgaXMgYmFzZWQgb24gU29DIFM5MDVYMiwgYnV0IHRoZSBuZXcgYm9hcmQgdmlt
MXMKPiBpcyBiYWVkIG9uIFM5MDVZNCwKPiB0aGV5IGFyZSBkaWZmZXJlbnQgU29DLCBzbyB3ZSBu
ZWVkIHRvIHB1dCBTOTA1WTQgdW5kZXIgUzgwNVgyID8KCkl0IGRlcGVuZHMsIGlmIHRoZSBTODA1
WDIgYW5kIHRoZSBTOTA1WTQgYXJlIG5vdCBjb21wYXRpYmxlIChkaWZmZXJlbnQgZGllcykKYW5k
IG5vdCB0aGUgc2FtZSBkaWUgaW4gMiBkaWZmZXJlbnQgYnV0IGNvbXBhdGlibGUgcGFja2FnZXMs
IHRoZW4gYSBzZWNvbmRhcnkKY29tcGF0aWJsZSBzaG91bGQgYmUgYWRkZWQgbGlrZSB3ZSBkaWQg
Zm9yIGFtbG9naWMsZzEyYiBvciBhbWxvZ2ljLG1lc29uLWd4bC4KCk5laWwKCj4gCj4+Cj4+PiAr
ICAgICAgICAgICAgICAtIGtoYWRhcyx2aW0xcwo+Pj4gKyAgICAgICAgICAtIGNvbnN0OiBhbWxv
Z2ljLHM0Cj4+Cj4+IEJlc3QgcmVnYXJkcywKPj4gS3J6eXN6dG9mCj4+CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
