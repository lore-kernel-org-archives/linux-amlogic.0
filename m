Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C24EC25B7C
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 May 2024 09:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMCzff1DdfCYDZ0YwwzdEPqYLc3V3hebF1mrFAoGWpA=; b=2IQDcTyvXWeWvRuKBRjydZwn7i
	XUtOQlZx5XesC9GoSV5XKCjsQB0hAL/6H0VPtjXh85hq6fpqMHjbMnXxId2SqtjwAbHct4yimtmmT
	+lwR6KoCJIlwPgJIECg3vVphNr9tYtcvE3SOUvZkVBXmU37p2C9as5UIKEhv6QQJUKK+IP8EkVptH
	VQouiuCaGt9Kno4UC+QDTeUqFm5e6zojIVseL6Xbs3vmTgYNL1Hy9/220tUtoinLbgBbyEqwP0bJT
	FyL9iSlIH5jcX2fBM8UXOVL0csWqHJcUf7QHu74exHJCRwNWC24UbWgYbQNeH/TJK3iDUGPYoLu4T
	0Zu49R8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBsoW-000000000Ob-3WBk;
	Tue, 28 May 2024 09:08:12 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBsoS-000000000NH-15nF
	for linux-amlogic@lists.infradead.org;
	Tue, 28 May 2024 09:08:11 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4211e42e362so3774385e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 28 May 2024 02:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716887284; x=1717492084; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a3SQwXIIXHjRM5uNeBKtEGihfqD66qoKItzKJ4EdXAo=;
        b=Kw72uVDpv1C+k6Ieow6YdtRisSjO53gJqO5lzSHhYHj6A+A1UoiFpIBJ4MMOwj/l3o
         KJXN+jpxSrz1QZGKxt3MpbhKpOpROQPlKnx+V1RZAJI+9s4I+Oh4Tme1zn6SvYabVZnz
         DYc8FKtsNyFb1Tm+QQpBE/v7EgYy1/G2tRU5kgD1FsJM+SzrlgpPYxBzWgZzU9QCVbU0
         yZMkaxg5PKs+EP9lsZhDCRnp6Xs6GwHSZx49viy7XsalTPEi636qv4+I9Vuftr/W1qwH
         SZW5M1F1m4XrqMvkj+RcpDrmyZXp6rvPeOvjzoKQ3UPzf7Y50Wa6ibLh2akVHBQXwUBm
         ZFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716887284; x=1717492084;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a3SQwXIIXHjRM5uNeBKtEGihfqD66qoKItzKJ4EdXAo=;
        b=BCOnbtk/Mjdfch8jco3TarJ3m1z2rDQVKPKI9Jiv2Gr+IRGLkL9Q4chKzkHVdgcaCv
         Mtvb185ymryaIXexgUXfVMEUd7chY7qgykvPm8eMMxFooo6HFizpB35zUCg2794KTLM3
         aagNw6HmPwnciZk4UCKDNHtqyEw81dBlMhuZScmx7GWJ+HoKTd0aK6nqzfokIMelbnj5
         plyKJ/u6x+ko7YrTWiAS7COIBU3UjnfBE5yJIh3I58Fg8SHCiMMtFGfL3RmleJ19B5ZV
         fHdIEpOv/CySflr6TX9WloYxGDAXTR9pZc9TWqoaun2GiAR1CH4sm3A6N9CbHi+88lvE
         0H9A==
X-Forwarded-Encrypted: i=1; AJvYcCWszt4LSJP9DcPhCK3NvRyvWuWKcPxNN36Er7Wlw0rg6bmRhA+TQO7lH4diN5cVLmqN5DLro8tPBa/MdppOdX5Dw3k2v5wPONBiZq0kdq4QtEo=
X-Gm-Message-State: AOJu0Yy3xHloGoyHgyF/KSyM2soz4xIGVgq1ekXth79bHOxpHU3rUKQv
	aqN7pK+SFA8ikOOTYQxu65qQ9CinH4nmsyoESWIfdO3N2kuRdoqBYWpn5BYanoo=
X-Google-Smtp-Source: AGHT+IEe5BlH9PQdZyM3Yr+PHsNxwDNOOPiWSviwZgKb7/NFJzJaatF7rZUzlXn8gDyUKiEed9NoCA==
X-Received: by 2002:a05:600c:4f03:b0:41b:a8e8:3ff6 with SMTP id 5b1f17b1804b1-42108a59341mr95487685e9.11.1716887283658;
        Tue, 28 May 2024 02:08:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8f19:f965:3f93:6385? ([2a01:e0a:982:cbb0:8f19:f965:3f93:6385])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421089ae96bsm135209155e9.35.2024.05.28.02.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 02:08:03 -0700 (PDT)
Message-ID: <fbafc16d-d6fa-4c57-8fc8-a1db09d03e05@linaro.org>
Date: Tue, 28 May 2024 11:08:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: a4: add power domain controller
 node
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20240528-a4_secpowerdomain-v1-0-2a9d7df9b128@amlogic.com>
 <20240528-a4_secpowerdomain-v1-3-2a9d7df9b128@amlogic.com>
 <c97b12bb-8b56-4129-a292-588226a0ec42@linaro.org>
 <70083d10-483e-4daf-a408-020f0147c5cf@amlogic.com>
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
In-Reply-To: <70083d10-483e-4daf-a408-020f0147c5cf@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_020808_307266_E1E91C83 
X-CRM114-Status: GOOD (  13.76  )
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

T24gMjgvMDUvMjAyNCAxMTowMCwgWGlhbndlaSBaaGFvIHdyb3RlOgo+IEhpIE5laWwsCj4gIMKg
wqAgVGhhbmtzIGZvciB5b3VyIHF1aWNrbHkgcmVwbHkuCj4gCj4gT24gMjAyNC81LzI4IDE2OjQ2
LCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Cj4+IE9uIDI4
LzA1LzIwMjQgMTA6MzksIFhpYW53ZWkgWmhhbyB2aWEgQjQgUmVsYXkgd3JvdGU6Cj4+PiBGcm9t
OiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPj4+Cj4+PiBBZGQgcG93
ZXIgZG9tYWluIGNvbnRyb2xsZXIgbm9kZSBmb3IgQW1sb2dpYyBBNCBTb0MKPj4+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPj4+IC0t
LQo+Pj4gwqAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtYTQtY29tbW9uLmR0
c2kgfCA0ICsrKysKPj4+IMKgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLWE0
LmR0c2nCoMKgwqDCoMKgwqDCoCB8IDUgKysrKysKPj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1s
b2dpYy9hbWxvZ2ljLWE0LWNvbW1vbi5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2lj
L2FtbG9naWMtYTQtY29tbW9uLmR0c2kKPj4+IGluZGV4IGI2MTA2YWQ0YTA3Mi4uZWViZGU3N2Fl
NWI0IDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMt
YTQtY29tbW9uLmR0c2kKPj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxv
Z2ljLWE0LWNvbW1vbi5kdHNpCj4+PiBAQCAtMjcsNiArMjcsMTAgQEAgeHRhbDogeHRhbC1jbGsg
ewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgI2Nsb2NrLWNlbGxzID0gPDA+Owo+Pj4g
wqDCoMKgwqDCoCB9Owo+Pj4KPj4+ICvCoMKgwqDCoCBzbTogc2VjdXJlLW1vbml0b3Igewo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tZ3hi
Yi1zbSI7Cj4+PiArwqDCoMKgwqAgfTsKPj4+ICsKPj4+IMKgwqDCoMKgwqAgc29jIHsKPj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAic2ltcGxlLWJ1cyI7Cj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjYWRkcmVzcy1jZWxscyA9IDwyPjsKPj4+IGRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy1hNC5kdHNpIGIvYXJj
aC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtYTQuZHRzaQo+Pj4gaW5kZXggNzNjYTFk
N2VlZDgxLi45MTdjMDUyMTliOWMgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRz
L2FtbG9naWMvYW1sb2dpYy1hNC5kdHNpCj4+PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2Ft
bG9naWMvYW1sb2dpYy1hNC5kdHNpCj4+PiBAQCAtMzcsNCArMzcsOSBAQCBjcHUzOiBjcHVAMyB7
Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW5hYmxlLW1l
dGhvZCA9ICJwc2NpIjsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+PiDCoMKg
wqDCoMKgIH07Cj4+PiArCj4+PiArwqDCoMKgwqAgcHdyYzogcG93ZXItY29udHJvbGxlciB7Cj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxhNC1wd3Jj
IjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgI3Bvd2VyLWRvbWFpbi1jZWxscyA9IDwx
PjsKPj4+ICvCoMKgwqDCoCB9Owo+Pgo+PiBwd3JjIGlzIHN1cHBvc2VkIHRvIGJlIGEgY2hpbGQg
b2Ygc2VjdXJlLW1vbml0b3IuCj4+Cj4gQ29uc2lkZXJlZCB3cml0aW5nIGl0IGxpa2UgdGhpcyB3
aGVuIEkgd3JvdGUgdGhpcy4KPiAKPiBIZXJlIGFyZSB0d28gYXBwcm9hY2hlczogb25lIGlzIHRv
IGluY2x1ZGUgc2VjdXJlLW1vbml0b3IgaW4gdGhlIGNvbW0gZHRzaSBhbmQgZmlsbCBwb3dlci1j
b250cm9sbGVyIGJ5IGFsaWFzZXMgaW4gZHRzaSBvZiBlYWNoIGNoaXAsIHdoaWxlIHRoZSBvdGhl
ciBpcyB0byBkaXJlY3RseSBpbmNsdWRlIHNlY3VyZS1tb25pdG9yIGluIHRoZSBkdHNpIG9mIGVh
Y2ggY2hpcC4gV2hpY2ggb25lIGRvIHlvdSBzdWdnZXN0PwoKVGhlIGJpbmRpbmdzIG1hbmRhdGVz
IGl0IHRvIGJlIGEgY2hpbGQgb2YgdGhlIHNlY3VyZSBtb25pdG9yLgoKTmVpbAoKPiAKPj4gTmVp
bAo+Pgo+Pj4gwqAgfTsKPj4+Cj4+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
