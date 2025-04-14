Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7559C3601E
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Apr 2025 07:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iyTX3iB/rr+AG4t89iiWcT+Go2JaP/mTCUIytJARuto=; b=yaibwglWgqqwRrEk5Uc1ucOlxz
	5gZdDQQ237LPQgRrjp0+HtdARpqLiJftnvgaUuUUKzwteIu8dXs5p6aY6CdnMlWN8s5dV/HV8tIBW
	Whc5JjvyhDfcH2dYRj+8EHR7M0okp93R9HzToFbDGANAr8cxLlPSOhjdesyxA1+8+op8l+hgPFo4P
	rMClMEM0/tjlCNfVKwwzQNawnn/pmUk3S9BVskZSgvi7478QcDCwBm5YnhLdWQYW/b7BwR6LXvtOl
	2axM738H6PIbvXm7dsFotBlwOLP3hQJ8ruRjNwFYwNvTCqbuHY5rV1zXHqZj9aEVg7NvRKf4ztH1T
	DJDmnjyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4E3D-00000000u6R-1mmL;
	Mon, 14 Apr 2025 07:16:15 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4E3A-00000000u5g-3tra
	for linux-amlogic@lists.infradead.org;
	Mon, 14 Apr 2025 07:16:14 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3995ff6b066so2043486f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 14 Apr 2025 00:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744614971; x=1745219771; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A4BBxO2Q/J6IMxfz+uEtm4Q1azghcdwE0iVwsVnnKvk=;
        b=FzPZaujOFPIqR/IDGIW3TWixzRk80Ja4OFd6KHDGS+wCY6jvyXed8qSOLF9oKTROuS
         JdkDbEP1bp7730Pd6ChrCf4uOEmrR894HWTkKNXP1TsyOcU/9lxWXucG0P81S4ejwxJf
         1jzQ36bC+LShNCNVs0wUZiO3ltn6vlSHgA69QGnMJH4gfqyLFiFPJfEMyLysWXTP9ljq
         5cRKNmb17XauI93F0pOYH02wE5ta3iTRHUHyHLUvx5inCQMTzqEVbhqxyj7Sdz1tpYCS
         BuezD/iHf5P+cyeLAHkKFiMJWHi58fS0jt+R9AJrKWjg14jzBINSibrmpWGJ2Sb1W/ot
         mgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744614971; x=1745219771;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A4BBxO2Q/J6IMxfz+uEtm4Q1azghcdwE0iVwsVnnKvk=;
        b=AqylPwmiAF9/YG39Qz8SyxpKIrhTdYMndwdBPrPe0LmApzAs7bgP5c3W7UwzZcd9ez
         hdeZFECQH88Ue2pH8eNzLCm7E7OzK1e/wyKhrFaX7wZFkKpiNkwIEU44b6CQ5Gyh9iX4
         fz6oJ1xAoeIznhHA2pIX/GgrDtFHCTxFpympQTJi4me/1L3PMx1pj3qTriQTflJ3yJgr
         s/RWfKoLb/cjIVEkpX1iTNqV6c4Dqm178046GtmmD+VEoojb4S7rFZAdsRUf1wSElVZ+
         FWa/5dX/ojeT2NBIWOxxrNNQSiYW+kLf00dwzsrNf+xXBbMw9/+wEA8puZV8piDgIsUm
         hVKw==
X-Forwarded-Encrypted: i=1; AJvYcCVd7uCj74SSXqobp2SDu8gsgM09+cyoY19JtkHWU+VYJaOsLrdawCuVNxbb/FRHZuxTV1nR6RJqQKUgmeyZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyDOC4ims62zzFKckbgbc0NpioheFFp/95/18uNa6VJdK7sNZDR
	5D4bts0hKHNg9TuGRwJ2hDI8C0OAf7Ex4yRmNpNW12x3H4CUvAsqWLO1bxT2Lm4=
X-Gm-Gg: ASbGncuZY+px54e/jNuLiyOPIsXzqofWtL2YDiNgZAkfVgdV9yQyj0khGMTQg66y9fN
	lEqVuG85v4w6Ii8nEyTSJe/r+KDXvjx0tJhWL/GGww0Bxf2xJ29Ffkbe2c48kUuZhhikz/Ks1Fz
	xdZ3upiQb/u4mrGCeQy8O8DB3dBPvP8RH3A6NSwvy6rBJmgndXJc/rcWHItkTZ/ui1YRKQOUlPP
	ZeLQmYu5n7vNjeT/bjVM/E0bs/H1etyKiLCFspiszvOIJ/feVhQqcGHnimJ8bPImnFwTDep4mHN
	UgE6IkZJzNAgCVZGpLn4gFQZMfG3tXjJxP4YCnXX18G3on14mJ56wXXFnj+5aBaINxIeBvw7E85
	lNJFwfF0A7B7AxW7DEA==
X-Google-Smtp-Source: AGHT+IFk/4b/d6EUYjjExv4IiKLoJZUz+hd9IYDUnYI9Yd0PRlZMBINesye58HTjAx7nVixJNpR1PA==
X-Received: by 2002:a05:6000:144e:b0:39c:1f11:ead with SMTP id ffacd0b85a97d-39ea5213077mr9016322f8f.26.1744614970477;
        Mon, 14 Apr 2025 00:16:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bf8a:3473:5c13:9743? ([2a01:e0a:3d9:2080:bf8a:3473:5c13:9743])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c614sm10221879f8f.27.2025.04.14.00.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 00:16:10 -0700 (PDT)
Message-ID: <576f0726-d238-4c37-8dc2-481df67f8fec@linaro.org>
Date: Mon, 14 Apr 2025 09:16:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] spi: meson-spicc: add DMA support
To: Da Xue <da@lessconfused.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Mark Brown <broonie@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sunny Luo <sunny.luo@amlogic.com>
References: <20250408-spi-dma-v1-1-3c38be62c09c@amlogic.com>
 <c29a8c28-996c-4e94-b0a1-0e4a37f0bebb@linaro.org>
 <aebccc51-14a2-40be-8d9e-20a55ce94459@amlogic.com>
 <d9d81cb4-12b4-4db3-becb-4578548986b2@linaro.org>
 <c9f0ca5f-17c4-474f-8370-fc0c83ac9093@amlogic.com>
 <CACdvmAg5px00er9TUd6_Nhr1GoSf=6LK6vSWOB-YcC1Ve0NRQQ@mail.gmail.com>
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
In-Reply-To: <CACdvmAg5px00er9TUd6_Nhr1GoSf=6LK6vSWOB-YcC1Ve0NRQQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_001612_989275_1697C142 
X-CRM114-Status: GOOD (  19.00  )
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

T24gMTQvMDQvMjAyNSAwNTo1NiwgRGEgWHVlIHdyb3RlOgo+IE9uIFN1biwgQXByIDEzLCAyMDI1
IGF0IDExOjE04oCvUE0gWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+IHdy
b3RlOgo+Pgo+PiBIaSBOZWlsLAo+PiAgICAgIFRoYW5rcyBmb3IgeW91ciByZXBseS4KPj4KPj4g
T24gMjAyNS80LzkgMjA6MzUsIG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmcgd3JvdGU6Cj4+Pgo+
Pj4gSGksCj4+Pgo+Pj4gT24gMDkvMDQvMjAyNSAwMzo0OSwgWGlhbndlaSBaaGFvIHdyb3RlOgo+
Pj4+IEhpIE5laWwsCj4+Pj4gICAgICBUaGFua3MgZm9yIHlvdXIgcmVwbHkuCj4+Pj4KPj4+PiBP
biAyMDI1LzQvOCAxNTo0MSwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+Pj4+IFsgRVhURVJOQUwg
RU1BSUwgXQo+Pj4+Pgo+Pj4+PiBIaSwKPj4+Pj4KPj4+Pj4gT24gMDgvMDQvMjAyNSAwOTowNCwg
WGlhbndlaSBaaGFvIHZpYSBCNCBSZWxheSB3cm90ZToKPj4+Pj4+IEZyb206IFhpYW53ZWkgWmhh
byA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+Pj4+Pj4KPj4+Pj4+IEFkZCBETUEgc3VwcG9y
dCBmb3Igc3BpY2MgZHJpdmVyLgo+Pj4+Pj4KPj4+Pj4+IERNQSB3b3JrcyBpZiB0aGUgdHJhbnNm
ZXIgbWVldHMgdGhlIGZvbGxvd2luZyBjb25kaXRpb25zOgo+Pj4+Pj4gMS4gNjQgYml0cyBwZXIg
d29yZDsKPj4+Pj4+IDIuIFRoZSB0cmFuc2ZlciBsZW5ndGggbXVzdCBiZSBtdWx0aXBsZXMgb2Yg
dGhlIGRtYV9idXJzdF9sZW4sCj4+Pj4+PiAgICAgIGFuZCB0aGUgZG1hX2J1cnN0X2xlbiBzaG91
bGQgYmUgb25lIG9mIDgsNy4uLjIsCj4+Pj4+PiAgICAgIG90aGVyd2lzZSwgaXQgd2lsbCBiZSBz
cGxpdCBpbnRvIHNldmVyYWwgU1BJIGJ1cnN0cy4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5
OiBTdW5ueSBMdW8gPHN1bm55Lmx1b0BhbWxvZ2ljLmNvbT4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+Pj4+Pj4gLS0tCj4+Pj4+
PiAgICBkcml2ZXJzL3NwaS9zcGktbWVzb24tc3BpY2MuYyB8IDI0Mwo+Pj4+Pj4gKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCj4+Pj4+PiAgICAxIGZpbGUgY2hhbmdl
ZCwgMjMyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3NwaS9zcGktbWVzb24tc3BpY2MuYwo+Pj4+Pj4gYi9kcml2ZXJzL3Nw
aS9zcGktbWVzb24tc3BpY2MuYwo+Pj4+Pj4gaW5kZXggZGY3NGFkNTA2MGY4Li44MWUyNjNiY2Vi
YTkgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9kcml2ZXJzL3NwaS9zcGktbWVzb24tc3BpY2MuYwo+Pj4+
Pj4gKysrIGIvZHJpdmVycy9zcGkvc3BpLW1lc29uLXNwaWNjLmMKPj4+Pj4+IEBAIC0yMSw2ICsy
MSw3IEBACj4+Pj4+PiAgICAjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+Cj4+Pj4+PiAgICAj
aW5jbHVkZSA8bGludXgvcmVzZXQuaD4KPj4+Pj4+ICAgICNpbmNsdWRlIDxsaW51eC9waW5jdHJs
L2NvbnN1bWVyLmg+Cj4+Pj4+PiArI2luY2x1ZGUgPGxpbnV4L2RtYS1tYXBwaW5nLmg+Cj4+Pj4+
Pgo+Pj4+Pj4gICAgLyoKPj4+Pj4+ICAgICAqIFRoZSBNZXNvbiBTUElDQyBjb250cm9sbGVyIGNv
dWxkIHN1cHBvcnQgRE1BIGJhc2VkIHRyYW5zZmVycywKPj4+Pj4+IGJ1dCBpcyBub3QKPj4+Pj4+
IEBAIC0zMyw2ICszNCwyMCBAQAo+Pj4+Pj4gICAgICogLSBDUyBtYW5hZ2VtZW50IGlzIGR1bWIs
IGFuZCBnb2VzIFVQIGJldHdlZW4gZXZlcnkgYnVyc3QsIHNvIGlzCj4+Pj4+PiByZWFsbHkgYQo+
Pj4+Pj4gICAgICogICAiRGF0YSBWYWxpZCIgc2lnbmFsIHRoYW4gYSBDaGlwIFNlbGVjdCwgR1BJ
TyBsaW5rIHNob3VsZCBiZQo+Pj4+Pj4gdXNlZCBpbnN0ZWFkCj4+Pj4+PiAgICAgKiAgIHRvIGhh
dmUgYSBDUyBnbyBkb3duIG92ZXIgdGhlIGZ1bGwgdHJhbnNmZXIKPj4+Pj4+ICsgKgo+Pj4+Pj4g
KyAqIERNQSBhY2hpZXZlcyBhIHRyYW5zZmVyIHdpdGggb25lIG9yIG1vcmUgU1BJIGJ1cnN0cywg
ZWFjaCBTUEkKPj4+Pj4+IGJ1cnN0IGlzIG1hZGUKPj4+Pj4+ICsgKiB1cCBvZiBvbmUgb3IgbW9y
ZSBETUEgYnVyc3RzLiBUaGUgRE1BIGJ1cnN0IGltcGxlbWVudGF0aW9uCj4+Pj4+PiBtZWNoYW5p
c20gaXMsCj4+Pj4+PiArICogRm9yIFRYLCB3aGVuIHRoZSBudW1iZXIgb2Ygd29yZHMgaW4gVFhG
SUZPIGlzIGxlc3MgdGhhbiB0aGUgcHJlc2V0Cj4+Pj4+PiArICogcmVhZGluZyB0aHJlc2hvbGQs
IFNQSUNDIHN0YXJ0cyBhIHJlYWRpbmcgRE1BIGJ1cnN0LCB3aGljaCByZWFkcwo+Pj4+Pj4gdGhl
IHByZXNldAo+Pj4+Pj4gKyAqIG51bWJlciBvZiB3b3JkcyBmcm9tIFRYIGJ1ZmZlciwgdGhlbiB3
cml0ZXMgdGhlbSBpbnRvIFRYRklGTy4KPj4+Pj4+ICsgKiBGb3IgUlgsIHdoZW4gdGhlIG51bWJl
ciBvZiB3b3JkcyBpbiBSWEZJRk8gaXMgZ3JlYXRlciB0aGFuIHRoZQo+Pj4+Pj4gcHJlc2V0Cj4+
Pj4+PiArICogd3JpdGluZyB0aHJlc2hvbGQsIFNQSUNDIHN0YXJ0cyBhIHdyaXRpbmcgcmVxdWVz
dCBidXJzdCwgd2hpY2gKPj4+Pj4+IHJlYWRzIHRoZQo+Pj4+Pj4gKyAqIHByZXNldCBudW1iZXIg
b2Ygd29yZHMgZnJvbSBSWEZJRk8sIHRoZW4gd3JpdGUgdGhlbSBpbnRvIFJYIGJ1ZmZlci4KPj4+
Pj4+ICsgKiBETUEgd29ya3MgaWYgdGhlIHRyYW5zZmVyIG1lZXRzIHRoZSBmb2xsb3dpbmcgY29u
ZGl0aW9ucywKPj4+Pj4+ICsgKiAtIDY0IGJpdHMgcGVyIHdvcmQKPj4+Pj4+ICsgKiAtIFRoZSB0
cmFuc2ZlciBsZW5ndGggaW4gd29yZCBtdXN0IGJlIG11bHRpcGxlcyBvZiB0aGUKPj4+Pj4+IGRt
YV9idXJzdF9sZW4sIGFuZAo+Pj4+Pj4gKyAqICAgdGhlIGRtYV9idXJzdF9sZW4gc2hvdWxkIGJl
IG9uZSBvZiA4LDcuLi4yLCBvdGhlcndpc2UsIGl0IHdpbGwKPj4+Pj4+IGJlIHNwbGl0Cj4+Pj4+
PiArICogICBpbnRvIHNldmVyYWwgU1BJIGJ1cnN0cyBieSB0aGlzIGRyaXZlcgo+Pj4+Pgo+Pj4+
PiBGaW5lLCBidXQgdGhlbiBhbHNvIHJlcGhyYXNlIHRoZSBwcmV2aW91cyBwYXJhZ3JhcGggc2lu
Y2UgeW91J3JlCj4+Pj4+IGFkZGluZyBETUEuCj4+Pj4+Cj4+Pj4gV2lsbCBkby4KPj4+Pgo+Pj4+
PiBDb3VsZCB5b3UgcHJlY2lzZSBvbiB3aGljaCBwbGF0Zm9ybSB5b3UgdGVzdGVkIHRoZSBETUEg
Pwo+Pj4+Pgo+Pj4+Cj4+Pj4gYXEyMjIoUzQpCj4+Pgo+Pj4gV2lsbCB5b3UgYmUgYWJsZSB0byB0
ZXN0IG9uIG90aGVyIHBsYXRmb3JtcyA/Cj4+Pgo+Pgo+PiBJIHRlc3RlZCBpdCBvbiBvdGhlciBw
bGF0Zm9ybXMgb3ZlciB0aGUgbGFzdCBmZXcgZGF5cy4gRzEyQSBhbmQgQzMgYW5kCj4+IFQ3KFQ3
IENMT0NLIHVzZSBsb2NhbCBzb3VyY2UpLgo+Pgo+PiBNeSBib2FyZCBTUEkgZG9lcyBub3QgY29u
bmVjdCBwZXJpcGhlcmFscyBhbmQgaXMgdGVzdGVkIHRocm91Z2ggYQo+PiBoYXJkd2FyZSBsb29w
Lgo+IAo+IEkgY2FuIHRlc3QgaXQgb24gR1hMIGFuZCBTTTEgaW4gdGhlIG5leHQgdHdvIHdlZWtz
IGFnYWluc3QgYSBTUEkKPiBkaXNwbGF5IGFuZCBzb21lIFdTMjgxMkIgTENEcy4KCldvdWxkIGJl
IGdyZWF0LCB0aHggIQoKTmVpbAoKPiAKPj4gY21kOgo+PiBzcGlfdGVzdCAtRCAvZGV2L3NwaWRl
djAuMCAtdiAtcyA1MDAwMDAwIC1iIDY0IC1sCj4+Cj4+Pj4KPj4+Pj4+ICAgICAqLwo+Pj4+Pj4K
PHNuaXA+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
