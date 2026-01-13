Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A24C9EC83
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jan 2026 10:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ezzl/tulRcvMw+yoUi5+gns0f1lVupSDzYPdFGb9/Uo=; b=Zs7L/Y29gHbtJBf2OUewS9U7/k
	x0dcuvJFo4HGeWgU1IGJ3CWsB1+bCH+L1QP+Auk3rA1rupaqkjNdrgHzB/QQkGZrcY9PRYprq/qDm
	PVtYx42+ED4zoBUVujftG7S5pzQxSyZYcxehCpC0jcjd8Ub8s1B/yY5YjF5hDziNUUUNmUrZL1Qv6
	cCa1SaWqFL6uRnNH7Pfgy1r7+mS1cWwMNtTEjM9+iLpVcEDwI2e6n1AQJdLpQY7Y/46GOf9jQV3tz
	HMDsZAD9fKIAmlAB0/qgCLcJM0Ga1WgWV724xBLTWDoqm3Dt4p6gDGaM+FaLuV5eyT/O+jCpZLtuZ
	scdLZu+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbDJ-00000006rwa-1h0h;
	Tue, 13 Jan 2026 10:01:25 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbDG-00000006rvv-23fk
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Jan 2026 10:01:23 +0000
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-42fb03c3cf2so3916724f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Jan 2026 02:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768298480; x=1768903280; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SxiGIDObJlq7aXCI7xV3vqh5HtX1MZl5+b/eMs8JrbQ=;
        b=RcX9wQctje3/ca6IqnDSvfbGUkH10oeF0ow28QNF8bTQR+4RwHIxQCHdA42RMHs+87
         pEWK5s9JV78Hz5TWWkE7cZTNlPZz6k+gLvkX83a8ufr/l0ed9KIUcaBYe3bgBP5UPdJK
         VZ6M8bKqHE7mRgXHpKOLkdXD/Tu9NqyIdWORy2Th698EeMAZmxHmERL9T/P0jAlEBYjM
         VJvxklPZVGsh6tOIUzSnWVWy+cLYZ5/dAliRTdFwuFslBaVF18J2VQHwEWz6mlPk9+k5
         XQPL0vuttt/RndHLm17MEk4IwFRefy3+dkIGixlL2tabed4doTD+kVgfW5AT+O0VgkLi
         HaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768298480; x=1768903280;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxiGIDObJlq7aXCI7xV3vqh5HtX1MZl5+b/eMs8JrbQ=;
        b=QM+NFfXAuN5HxWhff6UuFd4JMdijTPTGBhOcGQ6c+hMLEZQyNA2gmBV5RiZjeI+1Su
         AZmIYUdfSiSzY9alTaoS2fcdTidw1Un5Ex+iM1ZszSCZqGEPr5WNUkJNV64G3EN/bgU0
         7gNPUWEQkHh9aNYXbqJEewHBvw1rzu9fQ7RgDDgqZcTj5KWfwObwTSFnQ+DtdsjhjKYP
         XNyEekB48ZK/Me84q3Sqt3jYbMGWgXFGM9/j5Uk9LNR90gm8ZePDdYA9E7dRszpRgenl
         9b1+uzORminH5MpA0OF23JUWnsiMx5aNnU86iblFg+0alpK7ggpdc8H7x0wS1kxP9nGZ
         4EHw==
X-Forwarded-Encrypted: i=1; AJvYcCWT1NcAZ08DnP1RLgpxR6c5NTgcRlAEBzA1GfJgPtGKmpKAtmg78ihWr5sINpYZj5ciYN71hHBXWqMLR5d5@lists.infradead.org
X-Gm-Message-State: AOJu0YznL/berqmn7PEpkKLVziwZ6ulT3LcZgjOdb8xzIGCvztWYfKSL
	k8AamC5TAasEi3Kk2qpMx2ovTqW4t63eVciLKgL5bvsdYuE70SeSnjdqQiIfktFwP/s=
X-Gm-Gg: AY/fxX5vwQ/jza6ZKVsSz2oEXzV1Wg0sSXtrnDPJlORHnkN9dvHNxOMZrx/+1CjDGuq
	Jcr51NSTtFwNKXHII+eAOenRJUkCBOZCaU4MwOT/bR15rFJyOQMee8eqkzlFpKZVA7AXMBkUD+j
	bRctpmeRsrPgC6q2wsSvK6SK9305Ycv2/o7KmUVtnFrwRT2zwqrZ8G8cw/Z8ysl5zUHK65eoSIs
	s6yrCYStr6n+hcJBiXcIHt6gzRValycXZVE1kqXDKEkUekO1+e/HofUa9GHxX6fYlQhX11BcbQw
	couDSoA4DOD8mOdOk/e2pGxtq8RjY+sJxjY/tpYQyoQ8CSAIDuD/zvP4DsNLwYXnrml8rar8V7L
	ZWR5CP9pZsAfXhsCFVVuaYOuXbukzvxJpks0g/3qUBQ26l6avx3hUHMoOHD5F4QgvGFPTx/kcI7
	gkL0ygBIOS81K94HwzSuqWzB4dmPbZEw8qlK34PYs=
X-Google-Smtp-Source: AGHT+IFtEGp5Rx9oO08Dn4BpMJA+C/+ExWnZVveHe5szu0IIx2qhT1DHX8lPqBYm1TAwPRYOdBfKYQ==
X-Received: by 2002:adf:ea46:0:b0:432:dfa8:e1b6 with SMTP id ffacd0b85a97d-432dfa8e228mr10548599f8f.39.1768298479725;
        Tue, 13 Jan 2026 02:01:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080::fa42:7768? ([2a01:e0a:3d9:2080::fa42:7768])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0860f5sm43045980f8f.0.2026.01.13.02.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 02:01:18 -0800 (PST)
Message-ID: <5e3ee829-9c9b-4494-878c-09fa58cad63b@linaro.org>
Date: Tue, 13 Jan 2026 11:01:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: amlogic: S4: fix SD card initialization
 failure
To: Nick Xie <xieqinick@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
Cc: khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 xianwei.zhao@amlogic.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 robh@kernel.org, nick@khadas.com
References: <20260113011931.40424-1-nick@khadas.com>
 <1jsec9ritd.fsf@starbuckisacylon.baylibre.com>
 <CAP4nuTXUd23e6k6iqRVJw6Rcsc46+RrLGR9ZCu=o28g3u2FKSQ@mail.gmail.com>
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
In-Reply-To: <CAP4nuTXUd23e6k6iqRVJw6Rcsc46+RrLGR9ZCu=o28g3u2FKSQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_020122_572041_918FDDAE 
X-CRM114-Status: GOOD (  19.15  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMS8xMy8yNiAxMDozOCwgTmljayBYaWUgd3JvdGU6Cj4gSmVyb21lIEJydW5ldCA8amJydW5l
dEBiYXlsaWJyZS5jb20+IOS6jjIwMjblubQx5pyIMTPml6XlkajkuowgMTY6NTflhpnpgZPvvJoK
Pj4KPj4gT24gbWFyLiAxMyBqYW52LiAyMDI2IGF0IDA5OjE5LCBOaWNrIFhpZSA8eGllcWluaWNr
QGdtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+PiBUaGUgU0QgY29udHJvbGxlciAoc2RAZmUwOGEwMDAp
IHJlcXVpcmVzIGEgY2xvY2sgc291cmNlIGNhcGFibGUgb2YKPj4+IGdlbmVyYXRpbmcgYSA0MDBr
SHogZnJlcXVlbmN5IGZvciB0aGUgaWRlbnRpZmljYXRpb24gcGhhc2UuCj4+Pgo+Pj4gQ3VycmVu
dGx5LCB0aGUgc2Qgbm9kZSB1c2VzIENMS0lEX1NEX0VNTUNfQiBhcyBjbGtpbjAgYW5kIENMS0lE
X0ZDTEtfRElWMgo+Pj4gYXMgY2xraW4xLiBCb3RoIG9mIHRoZXNlIGFyZSBoaWdoLWZyZXF1ZW5j
eSBjbG9ja3MgKGUuZy4sIH4xR0h6KS4KPj4KPj4gVGhlIHJlYXNvbiB5b3UgYXJlIGhhdmluZyB0
aGlzIHByb2JsZW0gaXMgYmVjYXVzZSBDTEtJRF9TRF9FTU1DX0IgZG9lcwo+PiBub3QgcHJvdmlk
ZSA0MDBrSHogYnkgZGVmYXVsdCBvbiB0aGlzIHBsYXRmb3JtLiBXZSBoYXZlIGJlZW4gb3BlcmF0
aW5nCj4+IHdpdGggdGhpcyAod2VhaykgYXNzdW1wdGlvbiBzbyBmYXIgLi4uIGFuZCBpdCB3YXMg
T0sgdW50aWwgbm93Lgo+Pgo+Pj4gVGhlIGludGVybmFsIGRpdmlkZXIgb2YgdGhlIFNEIGNvbnRy
b2xsZXIgaXMgbGltaXRlZCB0byBhIG1heGltdW0gdmFsdWUKPj4+IG9mIDY0ICgyXjYpLiBXaXRo
IGlucHV0IGZyZXF1ZW5jaWVzIHNpZ25pZmljYW50bHkgaGlnaGVyIHRoYW4gMjUuNk1Iego+Pj4g
KDQwMGtIeiAqIDY0KSwgdGhlIGRyaXZlciBpcyB1bmFibGUgdG8gZ2VuZXJhdGUgdGhlIHJlcXVp
cmVkIDQwMGtIego+Pj4gY2xvY2ssIGNhdXNpbmcgdGhlIHByb2JlIHRvIGZhaWwgd2l0aCAtRUlO
VkFMLgo+Pj4KPj4+IEZpeCB0aGlzIGJ5IHJlcGFyZW50aW5nIGNsa2luMCB0byB0aGUgMjRNSHog
WFRBTCBjbG9jaywgY29uc2lzdGVudCB3aXRoCj4+PiB0aGUgY29uZmlndXJhdGlvbiBvZiB0aGUg
c2RpbyBhbmQgZW1tYyBub2Rlcy4gVGhpcyBhbGxvd3MgdGhlIGRpdmlkZXIKPj4+IHRvIHN1Y2Nl
c3NmdWxseSBnZW5lcmF0ZSA0MDBrSHogKDI0TUh6IC8gNjApLgo+Pj4KPj4KPj4gRFQgZ2VuZXJh
bGx5IGRlc2NyaWJlIHdoYXQgdGhlIEhXIGlzLCBub3QgaG93IHlvdSB3aXNoIHRvIGNvbmZpZ3Vy
ZSBpdC4KPj4KPj4gV2hhdCB5b3UgYXJlIGRvaW5nIGhlcmUgZG9lcyBub3QgcmVwYXJlbnQgYW55
dGhpbmcuIFlvdSBhcmUgYWN0dWFsbHkKPj4gbWlzLXJlcHJlc2VudGluZyB0aGUgY2xvY2sgdHJl
ZSwgbWFraW5nIHRoZSBNTUMgZGV2aWNlIGJlbGlldmUgaXQgaGFzCj4+IDI0TUh6IG9uIGl0cyBj
bGtpbjAsIGV2ZW4tdGhvdWdoIHdoYXQgaXQgaXMgcmVhbGx5IGhhcyBzdGlsbCBpcwo+PiBDTEtJ
RF9TRF9FTU1DX0IgKHByZXN1bWFibHkgcnVubmluZyBhIDFHSHopCj4+Cj4+IFNvIGlmIG15IHVu
ZGVyc3RhbmRpbmcgaXMgY29ycmVjdCwgeW91IGFyZSBpbmRlZWQgc2V0dGluZyB0aGUgZGl2aWRl
ciB0bwo+PiA2MCBpbnN0ZWFkIG9mIDY0LCBidXQgeW91IGFyZSBzdGlsbCBkaXZpZGluZyAxR0h6
IHNvIHdoYXQgeW91IGFjdHVhbGx5Cj4+IGdldCBpdCAxNiw2TUh6Cj4+Cj4+IElmIHlvdSB3YW50
IHRvIGdldCAyNE1IeiB0aGUgY2xraW4wLCB3ZSBuZWVkIHRvIGFzc2lnbiB0aGUgcmF0ZSwKPj4g
c29tZXRoaW5nIHdlIHByb2JhYmx5IHNob3VsZCBoYXZlIGRvbmUgYmVmb3JlLgo+Pgo+PiBJJ2xs
IHNlbmQgc29tZXRoaW5nIGZvciB0aGlzCj4+Cj4+PiBWZXJpZmllZCBvbiBLaGFkYXMgVklNMVMg
d2l0aCBTb0MgUzQgUzkwNVk0Lgo+Pj4KPj4+IEZpeGVzOiAzYWI5ZDU0YjVkODQ3ICgiYXJtNjQ6
IGR0czogYW1sb2dpYzogZW5hYmxlIHNvbWUgZGV2aWNlIG5vZGVzIGZvciBTNCIpCj4+Pgo+Pj4g
U2lnbmVkLW9mZi1ieTogTmljayBYaWUgPG5pY2tAa2hhZGFzLmNvbT4KPj4+IC0tLQo+Pj4gICBh
cmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaSB8IDIgKy0KPj4+ICAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpIGIvYXJjaC9h
cm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kKPj4+IGluZGV4IDlkOTllZDI5OTRk
ZmEuLmI4N2JjODNiNWE5YmIgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2Ft
bG9naWMvbWVzb24tczQuZHRzaQo+Pj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2lj
L21lc29uLXM0LmR0c2kKPj4+IEBAIC04MzMsNyArODMzLDcgQEAgc2Q6IG1tY0BmZTA4YTAwMCB7
Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHhmZTA4YTAwMCAweDAgMHg4
MDA+Owo+Pj4gICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTc3
IElSUV9UWVBFX0VER0VfUklTSU5HPjsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tz
ID0gPCZjbGtjX3BlcmlwaHMgQ0xLSURfU0RFTU1DX0I+LAo+Pj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDwmY2xrY19wZXJpcGhzIENMS0lEX1NEX0VNTUNfQj4sCj4+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgPCZ4dGFsPiwKPj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgPCZjbGtjX3BsbCBDTEtJRF9GQ0xLX0RJVjI+Owo+Pj4gICAgICAgICAgICAg
ICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJjb3JlIiwgImNsa2luMCIsICJjbGtpbjEiOwo+Pj4g
ICAgICAgICAgICAgICAgICAgICAgICByZXNldHMgPSA8JnJlc2V0IFJFU0VUX1NEX0VNTUNfQj47
Cj4+Cj4+IC0tCj4+IEplcm9tZQo+IAo+IEhlbGxvIEplcm9tZSwKPiAKPiBUaGFua3MgZm9yIHlv
dXIgcmV2aWV3Lgo+IAo+IEkgYWxzbyBjaGVja2VkIHRoZSBBbWxvZ2ljIDUuMTUgdmVuZG9yIGtl
cm5lbCBbMV0sIGl0IGFsc28gdXNlIHh0YWwgYXMgY2xraW4wLgo+IAo+IFsxXSAtIGh0dHBzOi8v
Z2l0aHViLmNvbS9raGFkYXMvY29tbW9uX2RyaXZlcnMvYmxvYi9raGFkYXMtdmltcy01LjE1Lnkv
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kjTDEzNTgKCk9LIGxvb2tp
bmcgYXQgdGhlIGRyaXZlciwgdGhleSByZWZlcmVuY2UgbXV4MCAoQ0xLSURfU0RfRU1NQ19CX0NM
S19NVVgpICYgbXV4MSAoQ0xLSURfU0RfRU1NQ19CX0NMSykgYW5kIHRoZXkgc2V0IHBhcmVudCBv
ZiBtdXgwLCBjbGtpbjAgKHh0YWwpIHdoaWNoIGlzIGV4YWN0bHkgd2hhdCBKZXJvbWUgc2FpZDoK
aHR0cHM6Ly9naXRodWIuY29tL2toYWRhcy9jb21tb25fZHJpdmVycy9ibG9iL2U5Y2VjMzBiOTQ4
NjRmNGYzNTE4Y2M0OTI5NDA2OTA3MDlhNTA3NWIvZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1neC1t
bWMuYyNMNzUxCgpXZSBuZWVkIHRvIGFzc2lnbiB0aGUgcmF0ZSBvZiBjbGtpbjAgdG8gYSBsb3cg
ZW5vdWdoIHJhdGUgZm9yIHRoZSBpbnRlcm5hbCBkaXZpZGVyIG9mIHRoZSBTRCBjb250cm9sbGVy
CnRvIGFjaGlldmUgNDAwS0h6LgoKTmVpbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
