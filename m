Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2103C83F11
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Aug 2023 07:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0STyB0tVOQJJwyO1+yub9CQXcs8qJjpgduM/xH08fkU=; b=V545dBBYeReisZum8Bv4wZvJ9e
	H3lbqe5vR3PmXq01y8Lz+7bjjWrKiI7TOULevfZ+uBtz/mUt08w/Esilpc9wo0xksf41pX6KrxxWy
	HA5d7wF+e93Rkyc0xHtOEZ8TPxGEI58iLIYL96IqeJ9dA2IRetxZsi83mPq9oJIaK5gfQUbp/cQbu
	ejlntkzVZfAyVHGGCt1VGUhvPl01G/ySY5UWLraviCyc+FvpjAfS1nTieFXt9vpTzEt4Eek8hluE7
	tBD98cGsxAzlQOLIIpuLKakpnTirERK75agjcGkqmi9tf+SdLY8a3yh/Drogzei8C7WBTqNuFefma
	Fa5x5rEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaX9C-00962j-1d;
	Mon, 28 Aug 2023 07:58:54 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaX98-00961e-1r
	for linux-amlogic@lists.infradead.org;
	Mon, 28 Aug 2023 07:58:52 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4018af103bcso17807305e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Aug 2023 00:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693209528; x=1693814328;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnJy2MC1m3VyQ+PZVnNt0Ji7E/eIh10thAxNUSP+Kok=;
        b=Ce9wdNHkWUYQs3oR6OfQapbpRFf9rYd28Vbz22+0qPPrRzUaUU1n4i11vygGUNdWi/
         7jbZs5JzNg3Fj4f4bmgibO2eACwVMy1K/yBuk2FPQ0apVAjET6H3GNv8oCEJ4XbvI1LA
         cNVZFNmTbURcUz6h+dY+enAiY0s63+sMPMaom1AV97bLBJPLbHsXzUN14uhF0CFhMBq3
         tXMmaxjaMrJs6DQjRMYUWM3pqlf3DFcnQirSB1zFFgJO7luIFHlOJbeO7Mzx1rQjDSA3
         /uXYhl1ZxLhkWvPXPWzlJFgpyU1DcC5s9QGRDgpm5g7g2o07qp7xlerYOCYEd2Jk6FkQ
         xiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693209529; x=1693814329;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gnJy2MC1m3VyQ+PZVnNt0Ji7E/eIh10thAxNUSP+Kok=;
        b=hTe5G3KBxvJ5mphcoS9hJh8XOiHbApXM6b5JRR/ZqPabqw6aTYH+Vx9G/j9g0LEZfS
         eJhX8v13Wk9vtB6P7cV6dhAjDW+DPW6oZStJCklU0pt5SkMyII9ARGW+0J+s2SFab06o
         RFuxshUAV3MjtwWuy/cbZEM0eN5RQoHFi+lJ9F4tYVC+JniplItRpDA5wlxzkKluwSPt
         Oqe1togQEEyY/E21VyW6OlndUKsIlvhXoNG6w+wNBs2OsM9G86IoA9b4l8u/SFzzTWmA
         aXsvBB6YpYcXX/6EQm8JjjJxSou4//AIcd8yX5KIdXr5bJnwr5Tm8rYzbPFcNuTamWDM
         vlNg==
X-Gm-Message-State: AOJu0Yykjh2H52Y4LrmrwPrYC5wdRUlDBthwWi+qQzBj9pTdOy7c7PAc
	6q3LP/VD+5J5LJrurvuhW0aE5w==
X-Google-Smtp-Source: AGHT+IH2GQG5DFXYdaa5Ci+BuEU0p4RM7o5b3apJaGc9NS6UnYeANzW0JqXFZQVyLxMCa4ZToswdQQ==
X-Received: by 2002:a1c:7c10:0:b0:401:c1e2:f74f with SMTP id x16-20020a1c7c10000000b00401c1e2f74fmr3995807wmc.15.1693209528649;
        Mon, 28 Aug 2023 00:58:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5e59:c27b:747a:3f52? ([2a01:e0a:982:cbb0:5e59:c27b:747a:3f52])
        by smtp.gmail.com with ESMTPSA id a9-20020a05600c224900b003fef5402d2dsm13238123wmm.8.2023.08.28.00.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 00:58:47 -0700 (PDT)
Message-ID: <b0eb409f-a437-4054-9072-a6ed093e88b7@linaro.org>
Date: Mon, 28 Aug 2023 09:58:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] Revert "tty: serial: meson: Add a earlycon for the T7
 SoC"
Content-Language: en-US, fr
To: Lucas Tanure <tanure@linux.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20230827082944.5100-1-tanure@linux.com>
 <7bf9e716-0ff2-56d5-07ab-db027901454e@linaro.org>
 <09735262-1bc0-40cf-b139-22cccf70bcab@linux.com>
 <e73260c9-04f8-eb1e-bb5b-c3bd2219625e@linaro.org>
 <8d2ba0d3-55eb-45cf-b88a-bafef35e96b9@linux.com>
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
In-Reply-To: <8d2ba0d3-55eb-45cf-b88a-bafef35e96b9@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_005850_615350_C7DAC3EE 
X-CRM114-Status: GOOD (  17.49  )
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

T24gMjcvMDgvMjAyMyAxMjozMSwgTHVjYXMgVGFudXJlIHdyb3RlOgo+IE9uIDI3LTA4LTIwMjMg
MTE6MjMsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+PiBIaSBMdWNhcywKPj4KPj4gTGUgMjcvMDgv
MjAyMyDDoCAxMjowNCwgTHVjYXMgVGFudXJlIGEgw6ljcml0wqA6Cj4+PiBPbiAyNy0wOC0yMDIz
IDEwOjQ4LCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4+PiBIaSBMdWNhcywKPj4+Pgo+Pj4+IExl
IDI3LzA4LzIwMjMgw6AgMTA6MjksIEx1Y2FzIFRhbnVyZSBhIMOpY3JpdMKgOgo+Pj4+PiBUaGlz
IHJldmVydHMgY29tbWl0IDZhNDE5N2Y5NzYzMzI1MDQzYWJmNzY5MGEyMTEyNGE5ZmFjYmY1MmUu
Cj4+Pj4+IE5ldyBTb0Mgd2lsbCB1c2UgdHR5UzAgaW5zdGVhZCBvZiB0dHlBTUwsIHNvIFQ3IFNv
QyBkb2Vzbid0IG5lZWQgYSBPRl9FQVJMWUNPTl9ERUNMQVJFLgo+Pj4+Pgo+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBMdWNhcyBUYW51cmUgPHRhbnVyZUBsaW51eC5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiBT
aW5jZSBWMToKPj4+Pj4gLSBhZGQgU2lnbmVkLW9mZi1ieToKPj4+Pj4KPj4+Pj4gwqAgZHJpdmVy
cy90dHkvc2VyaWFsL21lc29uX3VhcnQuYyB8IDIgLS0KPj4+Pj4gwqAgMSBmaWxlIGNoYW5nZWQs
IDIgZGVsZXRpb25zKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJp
YWwvbWVzb25fdWFydC5jIGIvZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYwo+Pj4+PiBp
bmRleCBjNGY2MWQ4MmZiNzI3Li43OTBkOTEwZGFmYTVkIDEwMDY0NAo+Pj4+PiAtLS0gYS9kcml2
ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jCj4+Pj4+ICsrKyBiL2RyaXZlcnMvdHR5L3Nlcmlh
bC9tZXNvbl91YXJ0LmMKPj4+Pj4gQEAgLTY0OCw4ICs2NDgsNiBAQCBtZXNvbl9zZXJpYWxfZWFy
bHlfY29uc29sZV9zZXR1cChzdHJ1Y3QgZWFybHljb25fZGV2aWNlICpkZXZpY2UsIGNvbnN0IGNo
YXIgKm9wdAo+Pj4+PiDCoCBPRl9FQVJMWUNPTl9ERUNMQVJFKG1lc29uLCAiYW1sb2dpYyxtZXNv
bi1hby11YXJ0IiwKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWVzb25fc2VyaWFs
X2Vhcmx5X2NvbnNvbGVfc2V0dXApOwo+Pj4+PiAtT0ZfRUFSTFlDT05fREVDTEFSRShtZXNvbiwg
ImFtbG9naWMsdDctdWFydCIsCj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1lc29uX3Nl
cmlhbF9lYXJseV9jb25zb2xlX3NldHVwKTsKPj4+Pj4gwqAgI2RlZmluZSBNRVNPTl9TRVJJQUxf
Q09OU09MRV9QVFIoX2Rldm5hbWUpICgmbWVzb25fc2VyaWFsX2NvbnNvbGVfIyNfZGV2bmFtZSkK
Pj4+Pj4gwqAgI2Vsc2UKPj4+Pgo+Pj4+IEhvdyBkbyB5b3UgdXNlIGVhcmx5Y29uIHdpdGggdGhp
cyByZW1vdmVkID8KPj4+Pgo+Pj4+IE5laWwKPj4+IFRoaXMgaXMgbXkga2VybmVsIGNtZGxpbmU6
Cj4+PiBjb25zb2xlPXR0eVMwLDkyMTYwMCBub19jb25zb2xlX3N1c3BlbmQgZWFybHljb249dHR5
UzAsMHhmZTA3ODAwMAo+Pj4KPj4+IEFuZCBJIGNhbiBzZWUgbXkgbG9nOgo+Pj4gYm9vdCA2NGJp
dCBrZXJuZWwKPj4+IFvCoMKgwqAgMC4wMDAwMDBdIEJvb3RpbmcgTGludXggb24gcGh5c2ljYWwg
Q1BVIDB4MDAwMDAwMDAwMCBbMHg0MTBmZDA5Ml0KPj4+IFvCoMKgwqAgMC4wMDAwMDBdIExpbnV4
IHZlcnNpb24gNi41LjAtcmM3LW5leHQtMjAyMzA4MjUrICh0YW51cmVhbEByeXplbikgKGFhcmNo
NjQtbm9uZS1saW51eC1nbnUtZ2NjIChHTlUgVG9vbGNoYWluIGZvciB0aGUgQS1wcm9maWxlIEFy
Y2hpdGVjdHVyZSAxMC4zLTIwMjEuMDcgKGFybS0xMC4yOSkpIDEwLjMuMSAyMDIxMDYyMSwgR05V
IGxkIChHTlUgVG9vbGNoYWluIGZvMwo+Pj4gW8KgwqDCoCAwLjAwMDAwMF0gS0FTTFIgZGlzYWJs
ZWQgZHVlIHRvIGxhY2sgb2Ygc2VlZAo+Pj4gW8KgwqDCoCAwLjAwMDAwMF0gTWFjaGluZSBtb2Rl
bDogS2hhZGFzIHZpbTQKPj4+IFvCoMKgwqAgMC4wMDAwMDBdIE9GOiByZXNlcnZlZCBtZW06IDB4
MDAwMDAwMDAwNTAwMDAwMC4uMHgwMDAwMDAwMDA1MmZmZmZmICgzMDcyIEtpQikgbm9tYXAgbm9u
LXJldXNhYmxlIHNlY21vbkA1MDAwMDAwCj4+PiBbwqDCoMKgIDAuMDAwMDAwXSBPRjogcmVzZXJ2
ZWQgbWVtOiAweDAwMDAwMDAwMDUzMDAwMDAuLjB4MDAwMDAwMDAwNzJmZmZmZiAoMzI3NjggS2lC
KSBub21hcCBub24tcmV1c2FibGUgc2VjbW9uQDUzMDAwMDAKPj4+IC4uLgo+Pj4gW8KgwqDCoCAw
LjA3OTM2OF0gaW8gc2NoZWR1bGVyIG1xLWRlYWRsaW5lIHJlZ2lzdGVyZWQKPj4+IFvCoMKgwqAg
MC4wNzkzNzRdIGlvIHNjaGVkdWxlciBreWJlciByZWdpc3RlcmVkCj4+PiBbwqDCoMKgIDAuMDc5
NTQ5XSBpbyBzY2hlZHVsZXIgYmZxIHJlZ2lzdGVyZWQKPj4+IFvCoMKgwqAgMC4wODMzNzNdIGZl
MDc4MDAwLnNlcmlhbDogdHR5UzAgYXQgTU1JTyAweGZlMDc4MDAwIChpcnEgPSAxNCwgYmFzZV9i
YXVkID0gMTUwMDAwMCkgaXMgYSBtZXNvbl91YXJ0Cj4+PiBbwqDCoMKgIDAuMDgzNDAzXSBwcmlu
dGs6IGNvbnNvbGUgW3R0eVMwXSBlbmFibGVkCj4+Pgo+Pj4gQXMgdGhlIGxvZyBpcyBPSywgYW5k
IFQ3IGZvciBub3cgaXMgYmluZGluZyBhZ2FpbnN0IFM0IGNvZGUgd2Ugc2hvdWxkIGRyb3AgdGhp
cyBwYXRjaCBhbmQgYWRkIGEgUzQgb25lIGlmIG5lZWRlZC4KPj4+Cj4+PiBCdXQganVzdCBoYXZp
bmcgdGhpcyBsb2cgaXMgbm90IGVub3VnaCBmb3IgdGVzdGluZyBlYXJseWNvbj8KPj4+IEkgYW0g
YXNzdW1pbmcgdGhhdCBieSBqdXN0IGhhdmluZyB0aGUgbG9nIHNpbmNlIDAuMDAwMCBpcyBhIGdv
b2Qgc2lnbiB0aGF0IGVhcmx5Y29uIGlzIHdvcmtpbmcuCj4+PiBDb3VsZCB5b3UgZ2l2ZSBmdXJ0
aGVyIGd1aWRhbmNlPwo+Pgo+PiBGaXJzdCB0aGUga2VybmVsIGFyZ3VtZW50IGlzIHNpbXBseSAi
ZWFybHljb24iIHdpdGggbm8gb3RoZXIgb3B0aW9ucywKPj4gdGhlIGVhcmx5Y29uIGNvZGUgd2ls
bCBmZXRjaCB0aGUgZmlyc3QgdWFydCB1c2luZyB0aGUgRFQgL2Nob3Nlbi9zdGRvdXQtcGF0aCBw
cm9wZXJ0eS4KPj4KPj4gVGhlbiB5b3Ugc2hvdWxkIHNlZSBzb21ldGhpbmcgbGlrZSByaWdodCBh
ZnRlciAiTWFjaGluZSBtb2RlbCI6Cj4+IFvCoMKgwqAgMC4wMDAwMDBdIGVhcmx5Y29uOiBtZXNv
bjAgYXQgTU1JTyAweDAwMDAwMDAwZmY4MDMwMDAgKG9wdGlvbnMgJzExNTIwMG44JykKPj4KPj4g
VGhlIGJvb3QgbG9nIHlvdSBzaGFyZSBkb2Vzbid0IHVzZSBlYXJseWNvbiwgaXQgd2FpdHMgdW50
aWwgYWxsIGRlcGVkZW5jeSBvZiB0aGUgVUFSVAo+PiBoYXMgYmVlbiBwcm9iZWQgYmVmb3JlIHBy
b2JpbmcgdGhlIFVBUlQgZHJpdmVyIGFuZCBwcmludHMgdGhlIHdob2xlIGJvb3QgbG9nLgo+Pgo+
PiBFYXJseWNvbiBpcyBhIG1lY2hhbmlzbSB0byB1c2UgdGhlIFVBUlQgSFcgYXMgY29uZmlndXJl
ZCBieSB0aGUgYm9vdGxvYWRlciBpbgo+PiBhIG1pbmltYWwgd2F5IHZlcnkgZWFybHkgaW4gdGhl
IGJvb3QgaW4gb3JkZXIgdG8gZGV0ZWN0IHZlcnkgZWFybHkgbG9ja3Vwcy4KPj4KPj4gS2VlcGlu
ZyBPRl9FQVJMWUNPTl9ERUNMQVJFIGZvciB0NyB3b3VsZCBlbmFibGUgdGhpcy4KPj4KPj4gTmVp
bAo+Pgo+Pj4KPj4+IEx1Y2FzIFRhbnVyZQo+Pj4KPj4KPiBCdXQgdGhlbiB3ZSB3b3VsZCBuZWVk
IHRvIGFkZCBFYXJseWNvbiBmb3IgUzQgdG9vLgo+IEhvdyBjYW4gd2UgYWRkIG9uZSBFYXJseWNv
biBmb3IgYWxsIGZ1dHVyZSBTb0NzLCBsaWtlIFM0IGFuZCBUNz8KPiAKCkFzIG9mIHRvZGF5LCBT
NCBoYXMgYW4gVUFSVCB3aXRoIGFtbG9naWMsbWVzb24tYW8tdWFydCBhcyBmYWxsYmFjayBjb21w
YXRpYmwsCmJ1dCBpZiB0aGVyZSdzIG5vIEFPIFVBUlQgb24gUzQsIHRoZW4gdGhpcyBpcyB3cm9u
ZyBhbmQgeWVzIGEgbmV3IE9GX0VBUkxZQ09OX0RFQ0xBUkUKd2l0aCBhbWxvZ2ljLG1lc29uLXM0
LXVhcnQgc2hvdWxkIGJlIGFkZGVkLgoKTmVpbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
