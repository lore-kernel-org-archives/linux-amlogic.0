Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE56DCCFA00
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Oct 2025 08:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mojU0wO7kmivFcy3M9w+WDn8oblIgx6g+Th6d1qxaog=; b=ThyVJbFLxvFNbK3dw5/HVSAw5d
	7jbvx0Mn/QCa4Lgp3qiAQbUPdSC9Xg5mRVGH7TbHFoA4JFoy8zNlqNG244oNhlyW//L139XDzcobO
	fbQLG6ehs1HkSsmNmnFgXcfDuiZhDKA/ku6BSaBChFpXz4Yxs76mS3lf0NCkWz3Yqj6XTcEsbNHRg
	L2M392IACiFmAuMvjBrVdUjh4eJDu4KOEhPmER/sRAZ7INNDdpWF7kVj3OtufP/LfSQu/Fqr1cFvE
	obkrQ8srsnt75YIAXt3UPNFNJvWil6cKHAoed9+Od7qeaB7ea3qmnyO/BoRsht4XzZ4rwsLH/3ZxZ
	cgIlSJSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkqi-00000005hGo-2cxb;
	Fri, 31 Oct 2025 08:51:08 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkqd-00000005hGB-2lz0
	for linux-amlogic@lists.infradead.org;
	Fri, 31 Oct 2025 08:51:07 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4770e7062b5so14174935e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 31 Oct 2025 01:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761900661; x=1762505461; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VdthYQx3fPupz9VTuX9fs9tD+q8rhp/J+8kdTaSyYGI=;
        b=tLNO0iLKS75do6tkI0PYLka7VV+0XAbqIdokKScfoYsMUa2V5a/tnD1DeYUUGjspLI
         9tWBc377desODEqPTZGMbZq0jjL5QRIeXimgO4MsEAoueRNuaNHQWZ732By2v+MohNP/
         mSHFz7MwWUl4Ex2SSNC2FyEpl072rhbU4h5nkNAgb1+6x1iFHx8gMqXFnf+66g8aaUmy
         TtuAgJCWsLzknWPA8khp5QoOl0kNAV1yy+imDIiXd//XsBO/hFiPjhzIGSNuJO5Gl5dS
         tgBs0NdFmuR3pKicaSLDN+B6g0RiAN8y7s31R8iVx6j584oCckA2JmJWmMHrbxpJJCqL
         Aobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761900661; x=1762505461;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VdthYQx3fPupz9VTuX9fs9tD+q8rhp/J+8kdTaSyYGI=;
        b=V3gRiOsYUlw4J2PJ86qVTKW+jXsHb2WROgVAeG8GFEx65YTZAsr73yH2oA02zMzSxi
         bnULfqllfDmJGM9MXUVG4k+vRh9MXwd6NL5+Dy4byJfi7tRHI5QYLNZOduh/dB3DUsjY
         fkixbQm5sXyLEwSvoqzdd5tST/EAHK9naj/4QMYjW7lwLyBRQHKBtJJZkSrIdVnEwxMm
         AnaouWZXMIQRQi9jRw2frenVWf8qhE1IClRC4+/FhLNP3hCnxxx9bwbgVS1uJYypkwwJ
         je4vzgkieR5nXdPZTW4w+6awwQCyLNdGMsS5sTT0TbKO5aCcvAIv/CEFhE6ei6zzUugE
         NZZg==
X-Forwarded-Encrypted: i=1; AJvYcCV5S6VsVr9jq1fDXD5aplE1kcZDGVAJfM70+NZOzCGM3huckrKXU813/hQxwF1umEEoegquaeTq7D8+zF/6@lists.infradead.org
X-Gm-Message-State: AOJu0YwF4h472U//JUKnb4dN60gtk5XV9hu+zrhZMRxGkbKrXFel3Pdn
	sXp0LqAAEYCNiwXLsxjFukLOBMATKZd5YHx6As3TyKRsFTcOWSJiJIcGfNzFPv6eQW4=
X-Gm-Gg: ASbGncvaBnIm8abSu7jTbsOaNDpOc3pkiHdyPeLrTb0p06i8g6VT6FWGVHlhDj9pwI9
	jqdouE4FyG7L99hVTEEcABrOHqafyfeywJa3K5LHfuhwJHWRO/6CGLIFWqDAsQHWqsHAdPAe2n4
	LuVYMC5J3vn66zx/7INfHaq3nIcN3VWg8d1bKUtyHbU49Z5TATIRkJXEoQeu4EsLsOhz8n7m2ya
	KWsW3u/Ja707PB16f5b6M4errZKeUn1eP2OvZsqxutQzFHFVLowDrtRxsC6XCjEEXX9AhTXKPtR
	Lk7cgBkqa3h6KlXqmhJzZER9XNQqynw8zGT4mHZjKfQGKB8ellCuhhfpy5NQnFddog8TvzboGEN
	PWYICpiI2yY4EB7xaVTyVVN3GQDB93TG+MjO0HvkMkfPcfTaCBSelZj6/vaFtKkgGvoXjfCPq8P
	g892c1pwwC3mvAe5yIYDbzR4cw/KiuLGkZN881Z8Gvs595MHx/9fPKxIHoE1fKviI=
X-Google-Smtp-Source: AGHT+IHgzS/nF5S0MzMHbXjLp8vWzcH8CRZAK3FVflgVJ4Dnpp781CewdMABTPZNC2jy/zYIIniiPg==
X-Received: by 2002:a05:600c:524f:b0:471:c72:c7f8 with SMTP id 5b1f17b1804b1-477308b6117mr24385315e9.21.1761900660929;
        Fri, 31 Oct 2025 01:51:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:d967:2bcf:d2d0:b324? ([2a01:e0a:cad:2140:d967:2bcf:d2d0:b324])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477289adc18sm86749505e9.6.2025.10.31.01.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 01:51:00 -0700 (PDT)
Message-ID: <59baecc0-bc28-4411-bf83-37ff9e7dd193@linaro.org>
Date: Fri, 31 Oct 2025 09:50:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: PCIe probe failure on AmLogic A311D after 6.18-rc1
To: Linnaea Lavia <linnaea-von-lavia@live.com>,
 Bjorn Helgaas <helgaas@kernel.org>
Cc: FUKAUMI Naoki <naoki@radxa.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 regressions@lists.linux.dev, Yue Wang <yue.wang@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
References: <20251029171542.GA1566240@bhelgaas>
 <DM4PR05MB10270506AAC1FCE53C4915CC2C7F8A@DM4PR05MB10270.namprd05.prod.outlook.com>
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
In-Reply-To: <DM4PR05MB10270506AAC1FCE53C4915CC2C7F8A@DM4PR05MB10270.namprd05.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_015103_763191_58790005 
X-CRM114-Status: GOOD (  13.15  )
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

T24gMTAvMzEvMjUgMDY6MzQsIExpbm5hZWEgTGF2aWEgd3JvdGU6Cj4gT24gMTAvMzAvMjAyNSAx
OjE1IEFNLCBCam9ybiBIZWxnYWFzIHdyb3RlOgo+PiBPbiBXZWQsIE9jdCAyOSwgMjAyNSBhdCAw
Njo1MDo0NlBNICswODAwLCBMaW5uYWVhIExhdmlhIHdyb3RlOgo+Pj4gT24gMTAvMjkvMjAyNSA2
OjE2IEFNLCBCam9ybiBIZWxnYWFzIHdyb3RlOgo+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3BjaS9xdWlya3MuYyBiL2RyaXZlcnMvcGNpL3F1aXJrcy5jCj4+Pj4gaW5kZXggMjE0ZWQwNjBj
YTFiLi45Y2QxMjkyNGI1Y2IgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9wY2kvcXVpcmtzLmMK
Pj4+PiArKysgYi9kcml2ZXJzL3BjaS9xdWlya3MuYwo+Pj4+IEBAIC0yNTI0LDYgKzI1MjQsNyBA
QCBzdGF0aWMgdm9pZCBxdWlya19kaXNhYmxlX2FzcG1fbDBzX2wxKHN0cnVjdCBwY2lfZGV2ICpk
ZXYpCj4+Pj4gwqDCoMKgICogZGlzYWJsZSBib3RoIEwwcyBhbmQgTDEgZm9yIG5vdyB0byBiZSBz
YWZlLgo+Pj4+IMKgwqDCoCAqLwo+Pj4+IMKgwqAgREVDTEFSRV9QQ0lfRklYVVBfRklOQUwoUENJ
X1ZFTkRPUl9JRF9BU01FRElBLCAweDEwODAsIHF1aXJrX2Rpc2FibGVfYXNwbV9sMHNfbDEpOwo+
Pj4+ICtERUNMQVJFX1BDSV9GSVhVUF9GSU5BTChQQ0lfVkVORE9SX0lEX1NZTk9QU1lTLCAweGFi
Y2QsIHF1aXJrX2Rpc2FibGVfYXNwbV9sMHNfbDEpOwo+Pj4+IMKgwqAgLyoKPj4+PiDCoMKgwqAg
KiBTb21lIFBlcmljb20gUENJZS10by1QQ0kgYnJpZGdlcyBpbiByZXZlcnNlIG1vZGUgbmVlZCB0
aGUgUENJZSBSZXRyYWluCj4+Pgo+Pj4gSSBoYXZlIGFwcGxpZWQgdGhlIHBhdGNoIG9uIDYuMTgt
cmMzIGJ1dCBpdCdzIHN0aWxsIHRyeWluZyB0byBlbmFibGUgQVNQTSBmb3Igc29tZSByZWFzb25z
Lgo+Pgo+PiBTb3JyeSwgbXkgZmF1bHQsIEkgc2hvdWxkIGhhdmUgbWFkZSB0aGF0IGZpeHVwIHJ1
biBlYXJsaWVyLCBzbyB0aGUKPj4gcGF0Y2ggc2hvdWxkIGJlIHRoaXMgaW5zdGVhZDoKPj4KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL3F1aXJrcy5jIGIvZHJpdmVycy9wY2kvcXVpcmtzLmMK
Pj4gaW5kZXggMjE0ZWQwNjBjYTFiLi40ZmMwNDAxNWNhMGMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZl
cnMvcGNpL3F1aXJrcy5jCj4+ICsrKyBiL2RyaXZlcnMvcGNpL3F1aXJrcy5jCj4+IEBAIC0yNTI0
LDYgKzI1MjQsNyBAQCBzdGF0aWMgdm9pZCBxdWlya19kaXNhYmxlX2FzcG1fbDBzX2wxKHN0cnVj
dCBwY2lfZGV2ICpkZXYpCj4+IMKgwqAgKiBkaXNhYmxlIGJvdGggTDBzIGFuZCBMMSBmb3Igbm93
IHRvIGJlIHNhZmUuCj4+IMKgwqAgKi8KPj4gwqAgREVDTEFSRV9QQ0lfRklYVVBfRklOQUwoUENJ
X1ZFTkRPUl9JRF9BU01FRElBLCAweDEwODAsIHF1aXJrX2Rpc2FibGVfYXNwbV9sMHNfbDEpOwo+
PiArREVDTEFSRV9QQ0lfRklYVVBfSEVBREVSKFBDSV9WRU5ET1JfSURfU1lOT1BTWVMsIDB4YWJj
ZCwgcXVpcmtfZGlzYWJsZV9hc3BtX2wwc19sMSk7Cj4gCj4gTDEgc3RpbGwgZ290IGVuYWJsZWQK
CjxzbmlwPgoKPiAKPiBUaGUgY2FyZCB3b3JrcyBqdXN0IGZpbmUuIEknbSB0aGlua2luZyB0aGUg
QVNQTSBpc3N1ZSBpcyBwcm9iYWJseSBmcm9tIHRoZSBnbHVlIGRyaXZlciByZXBvcnRpbmcgdGhl
IGxpbmsgdG8gYmUgZG93biB3aGVuIGl0J3MgcmVhbGx5IGp1c3QgaW4gbG93IHBvd2VyIHN0YXRl
LgoKWW91J3JlIHByb2JiYWx5IHJpZ2h0LCB0aGUgbWVzb25fcGNpZV9saW5rX3VwKCkgbm90IG9u
bHkgY2hlY2tzIHRoZSBMVFNTTSBidXQgYWxzbyB0aGUgc3BlZWQsIHdoaWNoIGlzIHByb2JhYmx5
IHdyb25nLgoKQ2FuIHlvdSB0cnkgcmVtb3ZpbmcgdGhlIHRlc3QgZm9yIHNwZWVkID8KCi0gICAg
ICAgICAgICAgICAgIGlmIChzbWxoX3VwICYmIHJkbGhfdXAgJiYgbHRzc21fdXAgJiYgc3BlZWRf
b2theSkKKyAgICAgICAgICAgICAgICAgaWYgKHNtbGhfdXAgJiYgcmRsaF91cCAmJiBsdHNzbV91
cCkKClRoZSBvdGhlciBkcml2ZXJzIGp1c3QgY2hlY2tzIHRoZSBsaW5rLCBhbmQgc29tZSBvbmx5
IHRoZSBzbWxoX3VwICYmIHJkbGhfdXAuIFNvIHlvdSBjYW4gYWxzbyBwcm9iYWJseSBkcm9wIGx0
c3NtX3VwIGFzd2VsbC4KCk5laWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
