Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1FFD29FEF
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jan 2026 12:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvy5K8GqGDb4aHYPi1KNOlNRQ7EzKgipFiJ7LXyQzcw=; b=T8qre0yD6GKZA2qkZKbjpwSqmb
	S6AZlpbjnj70SjXF5Rbo6WYIjCBJSNOjy2CLyJdr3w3keuqIdJisJWchO7RRhL10EDhQROh/Krg0d
	kyqbjoAQGrNVpn4LGyxcX24Txs9j5JKeU1LTuA2DMrMWPwmTTj6YfFiNFhyFNfeIdafgebbfs2fPV
	6Ua68Gb9AW7vjtg0iPOS04RVvcJqecQ6KIVx3IfB6nnT+0nzDgyKR40SHJfxP1r6r8cljx4QmkAv7
	tNRs+LKCgayDFY6Sj+lNRtRMIETODa8t6wDwnrySe2nh1Kikjoe3MKIkJEkVBmKnjxh+H1cGuw8d4
	GqdT6qGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzet-000000095yy-0y3m;
	Wed, 14 Jan 2026 12:07:31 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzer-000000095xT-0lSD
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jan 2026 12:07:30 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so86651615e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Jan 2026 04:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768392447; x=1768997247; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4dooFeIUOZ2AYn0yuxNU1dgV5MLYuRIoZtKgKCQ/5bI=;
        b=oCGZieGihsXlJ/WXytHaSrI97kWZ93/BmqjIDYprJEVuzSTbB0/x+1EI/oyeUc0ME8
         FqtqXf8fo5XHP9Rn7F23h7Tg9tkf98FLAvLvYBfhFhaZsb26XqteeYOXHk+8vMJa7LFF
         mSjRSyrx6SCoknPRVAEHz4AhWgFkI+DKNUEsHtZepOvMGKvrmh7eu/B7rXWBoV9BfdoP
         BRdyzf62m+LIF7FlwkYf+Maen35fYSviKwuoQB5FwGEYxE7muRIOKeJhsz8jx/9UyfCl
         pPeHZUHC4gT4uGr4BtIRBXXV+Q3ogqlSIH6BuizYurub92Ujzk4zIQqwQ8KElVhjmVX4
         Umbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768392447; x=1768997247;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dooFeIUOZ2AYn0yuxNU1dgV5MLYuRIoZtKgKCQ/5bI=;
        b=d6y3PUBMFkuejEmxPLaFq+qwfcMFs21NMAJtvPhbyp4QfWcjrUR2p7/D4JNlquVwjP
         1PUcyUKOaaVJhOEotsjm6hahGzhq+Rcfrxxd7IJ0vykIwl26Jtss7COdi/THBg3PqhqS
         yAapFynEEde0sxEyqweInRuPjZMbpEjJZVdAMxNmPCSfz5T7EITRjt0V8lbq71l3NWgJ
         ihQkAsbvOBT2zWKzxbZmqoiLyiFdRyJ31DxB15gOYVxhWCSyKG1SNZu3dEhVyA6ZHnnU
         mACOAlRIfksTFtmJW+FrKYChhD2mQOdLfhpOI/dCB4DJV6aqgDlezHli5ntvfOwdlTkH
         G1hA==
X-Forwarded-Encrypted: i=1; AJvYcCWxJrDM7vqpbGreTBsTNxYzHGnE+S14e1kvBLebF8Pl5xk2L7nHwTa+9olLkcNdA/eBbuuB90riO9Pq8BkU@lists.infradead.org
X-Gm-Message-State: AOJu0YwvyBi30QghN1qMnyfEurrp7cU9xy8sPg/N+ShxdrWJ5WFqvkvo
	9GTXDCLV7Cwj6Y818Ag8G5hDtd9NwWxIWe09KcJ3i+xuV2JCO+cKhFFTNsw9jluiBq0=
X-Gm-Gg: AY/fxX6aaCKwXCxm/rLsn2+eX50LF91kG6kjvO5vW99MQjYP4v5j+MVFHQG2idxxmyj
	EtO9iMS3TuuAs9VdL04HBfm1TVF4Ke+dH8T6zEfq3AIAbv4KsoVp6CBLaIt/NNA1ikYLIOaxpLC
	x+g4EN+tDRPmyn/nJN7pTP8nHOAPIgvg7XKA2JZWHslbBuT+jUJrP+yEr0djzgxns+KW/E9xBGD
	v+gFsVoNmJmWuJWGwmBCXkfrWwRr52pGJP20mE+31mQygdnAZfHLQFnLwKn43MG7jqheyEv4nM1
	xcAe0XzJTCd/gO+Ryh3SqTizasg1eulWvvVHxUVPfsYTsxIzaljAdV5ez90qaOL8URlSfCesNOg
	cBFgdN7YPJL9jQWNUrH4qvqyZTiQ/odz3GE/tQTLnOVXOXtzn4dfqyRSdJU4TvhYI4k+PeBYKCy
	hDwBzRhIN+EaLcGaBt7b/mxUWP2HReQjB1PCgNJm2vw5Z+BbJqkyHFEvyfbuCLS/E=
X-Received: by 2002:a05:600c:5285:b0:47a:935f:61a0 with SMTP id 5b1f17b1804b1-47ee30709e8mr30476765e9.0.1768392446880;
        Wed, 14 Jan 2026 04:07:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:b357:7e03:65d5:1450? ([2a01:e0a:3d9:2080:b357:7e03:65d5:1450])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee281dde4sm19667005e9.4.2026.01.14.04.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 04:07:26 -0800 (PST)
Message-ID: <b017db65-54c2-473c-8263-4fecfbf9a330@linaro.org>
Date: Wed, 14 Jan 2026 13:07:25 +0100
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
 <39bb1820-6e4d-4f50-87e0-93844d779f6c@kernel.org>
 <CAP4nuTX556F6a+aMndYayu-29u-SsYi0g0ie8ONz8b5GStgv-g@mail.gmail.com>
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
In-Reply-To: <CAP4nuTX556F6a+aMndYayu-29u-SsYi0g0ie8ONz8b5GStgv-g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_040729_287078_C82BFA4B 
X-CRM114-Status: GOOD (  13.72  )
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

T24gMS8xNC8yNiAxMjoyNSwgTmljayBYaWUgd3JvdGU6Cj4gS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6a0BrZXJuZWwub3JnPiDkuo4yMDI25bm0MeaciDE05pel5ZGo5LiJIDE4OjMz5YaZ6YGT77ya
Cj4+Cj4+IE9uIDE0LzAxLzIwMjYgMTE6MDcsIE5pY2sgWGllIHdyb3RlOgo+Pj4gS3J6eXN6dG9m
IEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiDkuo4yMDI25bm0MeaciDE05pel5ZGo5LiJIDE2
OjUx5YaZ6YGT77yaCj4+Pj4KPj4+PiBPbiBXZWQsIEphbiAxNCwgMjAyNiBhdCAwMjoyNTo0OFBN
ICswODAwLCBOaWNrIFhpZSB3cm90ZToKPj4+Pj4gQWRkIGRldmljZXRyZWUgYmluZGluZyBmb3Ig
S2hhZGFzIFZJTTFTIGJvYXJkIGJhc2VkIG9uCj4+Pj4+IEFtbG9naWMgUzQgUzkwNVk0IFNvQy4K
Pj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogTmljayBYaWUgPG5pY2tAa2hhZGFzLmNvbT4KPj4+
Pgo+Pj4+IFlvdSBzdGlsbCBoYXZlIHRoZSBzYW1lIEZyb20vU29CIG1pc21hdGNoLgo+Pj4KPj4+
IE9LLCAgSSB3aWxsIGZpeCBpdCBpbiBuZXh0IHZlcnNpb24uCj4+Pgo+Pj4+Cj4+Pj4+IC0tLQo+
Pj4+PiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy55YW1s
IHwgNiArKysrKysKPj4+Pj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4+Pj4+
Cj4+Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJt
L2FtbG9naWMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1s
b2dpYy55YW1sCj4+Pj4+IGluZGV4IDA4ZDk5NjNmZTkyNTkuLjU1NjYzZTBmN2Y5MTUgMTAwNjQ0
Cj4+Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dp
Yy55YW1sCj4+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0v
YW1sb2dpYy55YW1sCj4+Pj4+IEBAIC0yNDcsNiArMjQ3LDEyIEBAIHByb3BlcnRpZXM6Cj4+Pj4+
ICAgICAgICAgICAgICAgICAtIGFtbG9naWMsYXEyMjIKPj4+Pj4gICAgICAgICAgICAgLSBjb25z
dDogYW1sb2dpYyxzNAo+Pgo+PiBMb29rIGhlcmUKPj4KPj4+Pj4KPj4+Pj4gKyAgICAgIC0gZGVz
Y3JpcHRpb246IEJvYXJkcyB3aXRoIHRoZSBBbWxvZ2ljIE1lc29uIFM0IFM5MDVZNCBTb0MKPj4+
Pj4gKyAgICAgICAgaXRlbXM6Cj4+Pj4+ICsgICAgICAgICAgLSBlbnVtOgo+Pj4+Cj4+Pj4gWW9w
dSBhbHJlYWR5IGhhdmUgZXhhY3RseSBzdWNoIGVudW0gd2l0aCBzdWNoIGRlc2NyaXB0aW9uLCBz
byB5b3VyCj4+Pj4gY29tcGF0aWJsZSBnb2VzIHRoZXJlLiBMb29rIC0gaXQgaXMgY2FsbGVkICJC
b2FyZHMiIC0gcGx1cmFsLgo+Pj4KPj4+IFRoZSBleGlzdCBib2FyZCBhcTIyMiBpcyBiYXNlZCBv
biBTb0MgUzkwNVgyLCBidXQgdGhlIG5ldyBib2FyZCB2aW0xcwo+Pj4gaXMgYmFlZCBvbiBTOTA1
WTQsCj4+PiB0aGV5IGFyZSBkaWZmZXJlbnQgU29DLCBzbyB3ZSBuZWVkIHRvIHB1dCBTOTA1WTQg
dW5kZXIgUzgwNVgyID8KPj4KPj4gV2hhdCBpcyB0aGUgcG9pbnQgb2YgaGF2aW5nIHR3byBzZXBh
cmF0ZSBsaXN0cyB3aXRoIGVudW1zIGVuZGluZyB0aGUKPj4gc2FtZSBTb0MgY29tcGF0aWJsZT8K
PiAKPiBBY3R1YWxseSBTODA1WDIgYW5kIFM5MDVZNCBhcmUgZGlmZmVyZW50IFNvQy4gU28gbWF5
YmUgbGlrZSB0aGlzID8KPiAKPiBTODA1WDI6Cj4gLSBkZXNjcmlwdGlvbjogQm9hcmRzIHdpdGgg
dGhlIEFtbG9naWMgTWVzb24gUzQgUzgwNVgyIFNvQwo+ICAgIGl0ZW1zOgo+ICAgICAgLSBlbnVt
Ogo+ICAgICAgICAgIC0gYW1sb2dpYyxhcTIyMgo+ICAgICAgLSBjb25zdDogYW1sb2dpYyxzODA1
eDIKPiAgICAgIC0gY29uc3Q6IGFtbG9naWMsczQKPiAKPiBTOTA1WTQ6Cj4gLSBkZXNjcmlwdGlv
bjogQm9hcmRzIHdpdGggdGhlIEFtbG9naWMgTWVzb24gUzQgUzkwNVk0IFNvQwo+ICAgIGl0ZW1z
Ogo+ICAgICAgLSBlbnVtOgo+ICAgICAgICAgIC0ga2hhZGFzLHZpbTFzCj4gICAgICAtIGNvbnN0
OiBhbWxvZ2ljLHM5MDV5NAo+ICAgICAgLSBjb25zdDogYW1sb2dpYyxzNAoKSXQncyBvayBmb3Ig
bWUsIGJ1dCB5b3UnbGwgbmVlZCB0byB1cGRhdGUgdGhlIGFxMjIyIERUIGFzd2VsbC4KCj4gCj4g
U2FtZSBhcyBBbWxvZ2ljIEEzMTFEICYgUzkyMlgKPiAKPiBTOTIyWDoKPiAtIGNvbnN0OiBhbWxv
Z2ljLHM5MjJ4Cj4gLSBjb25zdDogYW1sb2dpYyxnMTJiCj4gCj4gQTMxMUQ6Cj4gLSBjb25zdDog
YW1sb2dpYyxhMzExZAo+IC0gY29uc3Q6IGFtbG9naWMsZzEyYgo+IAo+Pgo+Pj4KPj4+Pgo+Pj4+
PiArICAgICAgICAgICAgICAtIGtoYWRhcyx2aW0xcwo+Pj4+PiArICAgICAgICAgIC0gY29uc3Q6
IGFtbG9naWMsczQKPj4KPj4gQW5kIGhlcmUuCj4+Cj4+Pj4KPj4+PiBCZXN0IHJlZ2FyZHMsCj4+
Pj4gS3J6eXN6dG9mCj4+Pj4KPj4KPj4KPj4gQmVzdCByZWdhcmRzLAo+PiBLcnp5c3p0b2YKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
