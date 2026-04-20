Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C9AF557EE
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2026 08:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pj0ulQnbpc+w8QTma+j+yH7cTsNnXw/8m0Oi2u94+ls=; b=hIqCJ//rtYanKtCwaKB4j+Tho3
	A7IpGlQgyIpq5eXPn9j5xj2DncuMMwuRX9Y3G6tqfdsKMSK31BjwaZYYrdLKX+Q8hOE9eJxD9Feeo
	rnVMTFuC2ToBRqwDPHCHINDYjvzAE0/IPbE7I6NETDMb94E8oH1dKTcXBGfmZiCxAxJkZH8/jxVjL
	M+j7UTNihO+5xLXNuUzXYOCLWyG7MC7fN9molqkSRTRHW2YgkcOiltVZeNuy7GeQf3JF0myIyVBo8
	ZhcFQz3BoRQVdg1opVMtICN15Km2GR3YZe0lPlmrocEH8XUyeFSjj57KL0lH5B1QFwtrED61Gm/Vb
	Y/F3bwgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkMT-00000006dbh-2QLs;
	Mon, 20 Apr 2026 08:52:09 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkMR-00000006dak-1EVW
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Apr 2026 08:52:08 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso2970015e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 01:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776675125; x=1777279925; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2e/JkWh5NIRiOWxLUHpiAERqrkA0EPAqAxoaneAyAOY=;
        b=SHO8g7Dnio6vlVe9IxlZ3XfVLm5X8p2DHwhYK6OOUcSVcfM9QOL+y4YPFMs6NEs9r2
         8BrCEdnNMdEhs6w8mo9lx6fZ9wiiGyYDUqPF7s1/ps7dpHJ/XuhUTfRpqzAOEMBt52GB
         ZeiJKIi7vb4Lu5ibc1SXAvxpeb3id41kDt4bP98rqkJ6sAa9m2VHIG3+QZ++tx0p+FUJ
         HxPts0ng+qvmgoFaBcMM+eI5kytWxa2eDhxn/XOP+UbvoC5zWtRdE56uUXUkqfCcr73e
         5Uzipnafv16uKFPm2c/10XkeaQIaT1peUR4EGcBUNKxwmZ1CaHaYQsX/hFR7XHN9J5ij
         8FUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776675125; x=1777279925;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2e/JkWh5NIRiOWxLUHpiAERqrkA0EPAqAxoaneAyAOY=;
        b=WtfQIzMqvsAlDzOVdzvM6uZ3vq+kxv0DMVASYW+pQnAVQ3R7dySeWesK0aeBlLpRTk
         SLqlp4UUNr/9nAIGBcor856lynkyk0ZvFT7qnxSMBGG2dGgRfSBJxGYlypmb3gaCkYcg
         OQxTd9EjsQXlKssa9ldA9hb+54nGwnjB+mJrpWYf8krEINoPnTsvPVrpshAohToUdE0G
         phjOhQGyBpmeJO6waFge+pejayuCYs/S4oAOEBzaEtu25Slf8KRumNrQ36Vci7d10UPX
         RZqE4I+1/Wg+F8QNraqUnnxKfSJHXdgF1GOvyPaYysa1Y0NOpRFuYtYPDCM1KrOJ6+KV
         Wj9A==
X-Forwarded-Encrypted: i=1; AFNElJ+TfkEO8NlbIq1DSmrSuuCPvENMjT0JrKT6U/mcdWi+29veSwPOen/FkqWJJ94+DluekAa15L+SG1SRVnEC@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk2z5cILF1HFdCHvmc1f8XOFA4aoA4AQrU5VRu5YhyCPypLr29
	TmuOLIJ1dqpzr0ZEobsjXZ/+ea/Pd6xbdZ6Fag1lL4WFuYJAHzmI2fzn0e9rjPj46BE=
X-Gm-Gg: AeBDievD2B+NtKWmk40c8cOidGgIXWe0JTj3rMghRGpDe8WEfWsHneac9R08zFk41/i
	WBbj4ckog+Z1Bl/j2l8sUrvXiBB0rsuHfsBf/gEFzfkJoUPSvrDmW7UV6GPCLZpe/u0IVTZnGeM
	tv1owWC3mwUXecifbhJR/VeakdYLE3pBGHpzSWs/NZ1i6hdEY8DmQ6HeOvly+/n5/m23hPtJ/dB
	6rIxRBpuJ03MWVHgXJTgocsSy0G9/n6MR1iFdhgF9BHnuzTIEx2U+PtPbkYGJZrwmlS7J1Z2+gJ
	1up5RKBGL5PDTmV1ibZHo3V4AbrHmjqHYGcu26DTM1hVs/2uogJRxaYDvY1Imckh19ive3zVoVB
	dgkfBkU1rgNEJFxqeIP3Symop5bvZ8xMpTKjNSXo5X7cZk/3i9MH+VgLdKi4/1O41GxbRgZVE98
	yOgRCd968LMG1reSOWy4iPAIxqnZfBKUkUSs2fZaOp3p07aqiNy4abNZlaiOPrJGSiQU+OK/+G9
	WsFtaDZQ025/hx0TA==
X-Received: by 2002:a05:600c:1f94:b0:489:1c2d:211e with SMTP id 5b1f17b1804b1-4891c2d2213mr44057085e9.5.1776675124969;
        Mon, 20 Apr 2026 01:52:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8290:9fd8:8af0:67dc? ([2a01:e0a:106d:1080:8290:9fd8:8af0:67dc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc2cacsm27522967f8f.13.2026.04.20.01.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:52:04 -0700 (PDT)
Message-ID: <f2074119-7b4b-4481-8e39-c822dd67000e@linaro.org>
Date: Mon, 20 Apr 2026 10:52:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: amlogic: t7: Add clk measure support
To: Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20260415-clkmsr_a1_t7-v2-0-02b6314427e6@amlogic.com>
 <20260415-clkmsr_a1_t7-v2-4-02b6314427e6@amlogic.com>
 <ae61c52d-814c-40fa-b02a-833377d840a8@aliel.fr>
 <64cde9f6-4f28-4ba7-8362-aac28887ff22@amlogic.com>
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
In-Reply-To: <64cde9f6-4f28-4ba7-8362-aac28887ff22@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_015207_355176_8460EC9C 
X-CRM114-Status: GOOD (  17.01  )
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

T24gNC8yMC8yNiAwNToyNSwgSmlhbiBIdSB3cm90ZToKPiBIaSBSb25hbGQsCj4gCj4gCj4gVGhh
bmtzIGZvciB5b3VyIHJldmlldy4KPiAKPiBPbiA0LzE3LzIwMjYgNTo0OCBQTSwgUm9uYWxkIENs
YXZlYXUgd3JvdGU6Cj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pgo+PiBIZWxsbyBKaWFuLAo+Pgo+
PiBPbiA0LzE1LzI2IDEwOjMzIEFNLCBKaWFuIEh1IHZpYSBCNCBSZWxheSB3cm90ZToKPj4+IEZy
b206IEppYW4gSHUgPGppYW4uaHVAYW1sb2dpYy5jb20+Cj4+Pgo+Pj4gQWRkIHRoZSBjbG9jayBt
ZWFzdXJlIGRldmljZSB0byB0aGUgVDcgU29DIGZhbWlseS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBKaWFuIEh1IDxqaWFuLmh1QGFtbG9naWMuY29tPgo+Pj4gLS0tCj4+PiDCoCBhcmNoL2FybTY0
L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny5kdHNpIHwgNSArKysrKwo+Pj4gwqAgMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0
L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9h
bWxvZ2ljL2FtbG9naWMtdDcuZHRzaQo+Pj4gaW5kZXggN2ZlNzJjOTRlZDYyLi5jZWMyZWE3NDg1
MGQgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10
Ny5kdHNpCj4+PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny5k
dHNpCj4+PiBAQCAtNzAxLDYgKzcwMSwxMSBAQCBwd21fYW9fY2Q6IHB3bUA2MDAwMCB7Cj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc3RhdHVzID0gImRpc2FibGVkIjsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIH07Cj4+Pgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgY2xvY2stbWVhc3VyZXJANDgwMDAgewo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAiYW1s
b2dpYyx0Ny1jbGstbWVhc3VyZSI7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4MCAweDQ4MDAwIDB4MCAweDFjPjsK
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+PiArCj4+
IENhbiB5b3UgcGxlYXNlIG9yZGVyIGJ5IHJlZywgaXQgc2hvdWxkIGJlIGJldHdlZW4gcHdtX2Fv
X2doIGFuZCBwd21fYWIuCj4+IFRoYW5rIHlvdS4KPiAKPiAKPiBBY2NvcmRpbmcgdG8gdGhlICJP
cmRlciBvZiBOb2RlcyIgY2hhcHRlciBpbiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZHRzLWNvZGluZy1zdHlsZS5yc3QsCj4gCj4gbm9kZXMgb2YgdGhlIHNhbWUgdHlwZSBzaG91
bGQgYmUgZ3JvdXBlZCB0b2dldGhlciwgYW5kIHRoaXMgdGFrZXMgaGlnaGVyIHByaW9yaXR5Lgo+
IAo+IFNvIEkgaGF2ZSBwbGFjZWQgdGhlIGNsb2NrLW1lYXN1cmUgbm9kZSBhZnRlciBhbGwgUFdN
IG5vZGVzIHRvIGF2b2lkIHNwbGl0dGluZyB0aGUgUFdNIGdyb3VwLgoKVGhpcyBpcyBub3Qgc29t
ZXRoaW5nIHdlIGV2ZXIgZm9sbG93ZWQgaW4gdGhlIHBhc3QsIGFuZCBJIGRvbid0IHRoaW5rIGl0
IG1ha2VzIHNlbnMgaGVyZS4KCgoiIiIKQWx0ZXJuYXRpdmVseSBmb3Igc29tZSBzdWJhcmNoaXRl
Y3R1cmVzLCBub2RlcyBvZiB0aGUgc2FtZSB0eXBlIGNhbiBiZQpncm91cGVkIHRvZ2V0aGVyLCBl
LmcuIGFsbCBJMkMgY29udHJvbGxlcnMgb25lIGFmdGVyIGFub3RoZXIgZXZlbiBpZiB0aGlzCmJy
ZWFrcyB1bml0IGFkZHJlc3Mgb3JkZXJpbmcuCiIiIgoKVGhpcyBkb2Vzbid0IGFwcGx5IGhlcmUs
IHNvIG9yZGVyIHN0cmljdGx5IGJ5IGFkZHJlc3MuCgpOZWlsCgo+IAo+IAo+IEJlc3QgcmVnYXJk
cywKPiAKPiBKaWFuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
