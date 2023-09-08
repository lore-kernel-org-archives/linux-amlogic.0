Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCE5EE7FED
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Sep 2023 12:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QztFPEWn5FZraiRaCbK+3G0nhN5Cs+OVnkiw/94fo68=; b=bAggRfKeuPqOAv
	8NbHccHCBZyjMX54h3orArlFSpkoC4X3JP29D3EefuMU1uDLFxWYGcTnSQ1boXTSa8SVHh1U3Q0hE
	0tXNjfzxOuYeGmFkI5amhJBp4uRxEPs9dtO3BhmNO1th+givN3xDZ9izk4Sx7UUfjgrN7bkXAvCwH
	Lb0OSJZo+1AcL5rfLHn5BVE5Oqi/iV3ztWNEM7+xUs+p85qwDafcvMyz/zyNZUNHwCgU2eH0VKFEw
	9pQNVhvYv/O28SzOxwnBbtZrMIAzu2HgcFTDsYeoHntRPnQ7/4XV8bTfHKQ/uqYHkdM18GEgMy1bg
	6SDhX/qyc1PrIWai6PlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeas4-00DnGW-29;
	Fri, 08 Sep 2023 12:46:00 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeas2-00DnFO-0O
	for linux-amlogic@lists.infradead.org;
	Fri, 08 Sep 2023 12:45:59 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-401d2e11dacso20805215e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 08 Sep 2023 05:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694177154; x=1694781954; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:from:content-language:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qYX11k0FRo9C71kWAlZsFSHlpklxSuOAfDFjS017gR4=;
        b=SrwSRFhdK2VdDWvZmC01SJVMn9XUtIV0DlcqgkKbszuX4Sld3EhV5lwcupRiMZGtDZ
         C46kSxQdzFR8IAE1w/JPQwXZ8Kr/Rx4HMnPy845BbpPx0LBGshRtfJ373WXS0IUlXHfA
         +zHFfQZyJlj50z3w8URmvTV78fTuDnxqE96lGA+gjAFTkCpnFtx/aJwm3I58ATHzvJAj
         u/T3G1yYdPcOAePCnllnUgfdRjAajTJIDFan1bQO/JoIm1B+9FkTaMIzujCyA+VHTOo3
         SwbesJH0Wz05dhsi5zTJR63WZ8V2OBI4r+A7UfFT7SOvAeekUqHwGuAe+gWEZKQ5av7j
         wUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694177154; x=1694781954;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:from:content-language:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qYX11k0FRo9C71kWAlZsFSHlpklxSuOAfDFjS017gR4=;
        b=mXzr2QK60UYVeL6KKzDDgEfpCpzF8aKMGvOIsTK+EK5BL/3hxhocb2J0oxONKeE94k
         M8zP+GuIwAiUZTYVzJ5yOo4KzjKX2AflpmcN/5VavyxOEvodwg5OBwju56oadkssHCKH
         8I4kxcmcr32gUTjbtAaHOD8DVNxfmZFffWT2y98j78dmjxbOUo9t0So4ka2YGlPirfGP
         LIpvBrXI3e1NOmNYH28BJ22dyBUf/3oKTILAeOvCnyTBKRGdCPcO3si1q9ouidFm0vgR
         TEy8XMSPZrncCrEUC2dmP2Bo2PEq9GaEjbmohJH+Q3ZzbrEyfc0H3fv8xW6M3qbfE4+l
         oJcQ==
X-Gm-Message-State: AOJu0Yz69q3DqCIomy5ll0rsT7ngJwWiwCBqTWmV0ditybr8n6UKUJJG
	hyE1e6qbUl95p6fhoAZXaJfGGg==
X-Google-Smtp-Source: AGHT+IGHePJhFFJiEaa1GGpoPTB7/fI52CufaQApdzeN8l1+CLj6k0KAU+tqTR8boxgF7HkxVuJzpQ==
X-Received: by 2002:a05:600c:a386:b0:400:5962:6aa9 with SMTP id hn6-20020a05600ca38600b0040059626aa9mr4360296wmb.11.1694177154279;
        Fri, 08 Sep 2023 05:45:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5f1a:ed04:d131:cda4? ([2a01:e0a:982:cbb0:5f1a:ed04:d131:cda4])
        by smtp.gmail.com with ESMTPSA id t15-20020a7bc3cf000000b00402be2666bcsm5188357wmj.6.2023.09.08.05.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Sep 2023 05:45:53 -0700 (PDT)
Message-ID: <4303c141-30df-4a2b-aba7-f11a98db9941@linaro.org>
Date: Fri, 8 Sep 2023 14:45:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 0/6] Power: T7: add power domain driver
Content-Language: en-US, fr
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-pm@vger.kernel.org
References: <20230829020404.4058677-1-xianwei.zhao@amlogic.com>
 <82001107-3e72-4cc7-b7d4-8ca1a840b508@linaro.org>
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
In-Reply-To: <82001107-3e72-4cc7-b7d4-8ca1a840b508@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_054558_156484_F14FEC05 
X-CRM114-Status: GOOD (  12.40  )
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

T24gMDgvMDkvMjAyMyAxNDo0MCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gSGksCj4gCj4gT24g
MjkvMDgvMjAyMyAwNDowMywgWGlhbndlaSBaaGFvIHdyb3RlOgo+PiBGaXJzdCBwYXRjaCBpcyB0
aGF0IHJlbW92ZSBDMyBzb21lIHBvd2VyIGRvbWFpbiBBTFdBWVNfT04gcHJvcGVydHkuCj4+IFNl
Y29uZCBwYXRjaCBpcyB0aGF0IGFkZCBkcml2ZXIgdG8gc3VwcG9ydCBwb3dlciBwYXJlbnQgbm9k
ZS4KPj4gVGhpcmQgcGF0Y2ggaXMgdGhhdCB0dXJuIG9uIHBvd2VyIGlmIGluaXRpYWwgcG93ZXIg
ZG9tYWluIHdpdGgKPj4gIkFXQVlfT04iIHByb3BlcnR5IHN0YXRlIGlzIG9mZi4KPj4KPj4gT3Ro
ZXIgcGF0Y2hzIGFkZHMgcG93ZXIgY29udHJvbGxlciBkcml2ZXIgc3VwcG9ydCBmb3IgQW1sb2dp
YyBUNyBTb0MuCj4gCj4gUGxlYXNlIHJlLXNlbmQgdG8gVWxmIEhhbnNzb24gPHVsZi5oYW5zc29u
QGxpbmFyby5vcmc+IGFuZAo+IGxpbnV4LXBtQHZnZXIua2VybmVsLm9yZyBzaW5jZSB0aGlzIGRy
aXZlciBoYXMgbW92ZWQgdG8gdGhlCj4gR0VORVJJQyBQTSBET01BSU4gUFJPVklERVJTIHN1YnN5
c3RlbS4KPiAKPiBJJ2xsIHRha2UgdGhlIERUIHBhdGNoIHNpbmNlIGJpbmRpbmdzIHBhdGNoIHdh
cyByZXZpZXdlZC4KCkluIGZhY3QgSSdsbCBuZWVkIFVsZiB0byBwcm92aWRlIG1lIGFuIGltbXV0
YWJsZSBicmFuY2ggb3IgdGFnIHdpdGgKdGhlIGJpbmRpbmdzIGluIG9yZGVyIGZvciBtZSB0byBh
cHBseSB0aGUgRFQgcGF0Y2guCgpOZWlsCgo+IAo+IFRoYW5rcywKPiBOZWlsCj4gCj4+Cj4+IENo
YW5nZXMgU2luY2UgdjI6Cj4+IMKgIC1Nb2RpZnkgc3ViamVjdC4KPj4gwqAgLURlZmluZSBQV1JD
X05PX1BBUkVOVCBVSU5UX01BWAo+PiDCoCAtUmVtb3ZlIG1vZGlmaWNhdGlvbiB0aGF0IHRyYW5z
Zm9ybSBpc19vZmYgaW50byAxIG9yIDAgdXNpbmcgISEKPj4KPj4gQ2hhbmdlcyBTaW5jZSB2MToK
Pj4gwqAgLUZpeCBsaWNlbnNlIGZyb20gIkdQTC0yLjAtb25seSBPUiAuKiIgdG8gIkdQTC0yLjAt
b25seSBPUiBNSVQiLgo+PiDCoCAtTW9kaWZ5IFQ3X05JQyBmbGFnwqAgIkFMV0FZU19PTiIKPj4K
Pj4geGlhbndlaS56aGFvICg2KToKPj4gwqDCoCBnZW5wZDogYW1sb2dpYzogbW9kaWZ5IHNvbWUg
cG93ZXIgZG9tYWlucyBwcm9wZXJ0eQo+PiDCoMKgIGdlbnBkOiBhbWxvZ2ljOiBhZGQgZHJpdmVy
IHRvIHN1cHBvcnQgcG93ZXIgcGFyZW50IG5vZGUKPj4gwqDCoCBnZW5wZDogYW1sb2dpYzogaW5p
dCBwb3dlciBkb21haW4gc3RhdGUKPj4gwqDCoCBkdC1iaW5kaW5nczogcG93ZXI6IGFkZCBBbWxv
Z2ljIFQ3IHBvd2VyIGRvbWFpbnMKPj4gwqDCoCBnZW5wZDogYW1sb2dpYzogQWRkIHN1cHBvcnQg
Zm9yIFQ3IHBvd2VyIGRvbWFpbnMgY29udHJvbGxlcgo+PiDCoMKgIGFybTY0OiBkdHM6IGFtbG9n
aWM6IHQ3OiBhZGQgcG93ZXIgZG9tYWluIGNvbnRyb2xsZXIgbm9kZQo+Pgo+PiDCoCAuLi4vcG93
ZXIvYW1sb2dpYyxtZXNvbi1zZWMtcHdyYy55YW1swqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAzICst
Cj4+IMKgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LmR0c2nCoMKgIHzC
oMKgIDYgKwo+PiDCoCBkcml2ZXJzL2dlbnBkL2FtbG9naWMvbWVzb24tc2VjdXJlLXB3cmMuY8Kg
wqDCoMKgIHwgMTI3ICsrKysrKysrKysrKysrKystLQo+PiDCoCBpbmNsdWRlL2R0LWJpbmRpbmdz
L3Bvd2VyL2FtbG9naWMsdDctcHdyYy5owqDCoCB8wqAgNjMgKysrKysrKysrCj4+IMKgIDQgZmls
ZXMgY2hhbmdlZCwgMTg1IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+PiDCoCBjcmVh
dGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9wb3dlci9hbWxvZ2ljLHQ3LXB3cmMu
aAo+Pgo+Pgo+PiBiYXNlLWNvbW1pdDogNDEzZjVjMDI5MjliYjMzMDQyYmJjNGVlMjMzMTY2NTUw
YTVmY2E3MAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
