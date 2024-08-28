Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BF3C54E62
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2024 10:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xi+lneOzekulAK83k0T+oxLV4rgfQxIx6dslnwqblVI=; b=kLPbVC6kCmcDzh
	++/kqloA8ghU2W+hrZj5zX75WUNWX7MwhKTtS6ke8lK9DX8raBYXd5r44Id+1uWM5ri1ukT5PwfiS
	F4FJZOU8ZfmJETBMShKYKAVIm+lhr9h77pmTpVsYS1wzfzC8HAr9AsYo1Dpj6pRmvmuE+1s6rE/wo
	GkcxPGzx0ovLAiUmVwtgES0B9zzNfJ7bOoOo+vjqyLXDXq+5iyjxhshruCtnpQSFS1mOrxYUWtyyG
	2QJ/pNmXKzVa3aZAc5D0hTtOALSAj56OFUbbKHBO/JBFUSaHhgGvke7U/UUDr2OM0THP05bbX9p6/
	epW8/bX+pMRo2h7Owqyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjFTq-0000000EpiS-01GZ;
	Wed, 28 Aug 2024 10:00:46 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjFTm-0000000Epgl-30wg
	for linux-amlogic@lists.infradead.org;
	Wed, 28 Aug 2024 10:00:44 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4281ca54fd3so56043035e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 28 Aug 2024 03:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724839241; x=1725444041; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEVI7HiqxVqMEgse2bbT6Cv/tYXN4/gyPqY1R8cSp3k=;
        b=FIJM9+pMOVoj2NI5CxMgoVvQZB/zxTAo/REPkzYl+8Y2eQ5fdG7BA9eTKST85ZZkVR
         PI9PJ0xc021ZmgixjvBpkcjaBTIcMPLpA55toKs5Yq6HUaxVRcC5CsfdfUZpK0Bpz2Cs
         ROuMN5wOj4UwESxLTjLqCvC4ADe0nzbHqaEf8XV4M0anusQXLcd1ikPIsx5o+fGkWbTg
         t9fLexVpfm6z7QvoWQS4MV4czg6E7jL9Zkn3p7G52JVmRCrfjMjZxE9b5fbEJhRy+foH
         9mAZ7qwprbds8jkzvHQfp+5gs8hRpJ6mq2GbUTEqblGWVx6dat7w25D+jZfpfV61RD5v
         NXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724839241; x=1725444041;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vEVI7HiqxVqMEgse2bbT6Cv/tYXN4/gyPqY1R8cSp3k=;
        b=JgFZuFff4UVsRf+W7uRcn25gLpLaC0Xnajgny+MXQfnOQ8dZx8OfSGzj+xgIgo5XnX
         pzPbxNQuCUacojBthTMaNrTQvWlDrEpUQMV/c9K0pzxYhK8yiFUIpzxKcLLPbyHd3kc1
         8B0eGzzEHCwUzZ27tn7v3/hhqnHBY0JQDZUmSZ29wqKqPLAR5LRoaa+nQN6MZ6hyBi9q
         xi396O2iMs2iDA4FnhzZMcwYuI9x1PewkoeMSeEswfo1+zL9N93/OBjbIhBNBmfqBIjV
         MwJgfA1KJeAGDOTiGXaq5+fvAvfxOPnSELCFBVdb+WyK6jGoDGoF3n3fbuf4AwtVJfUN
         th6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWqIbONK5QXkD5OAv6zgQWd8RbwevlI4oCGiSWRSvwvavWePEFMSfPkBa3uEx+q7R2wFTrevmzybVCh4zzO@lists.infradead.org
X-Gm-Message-State: AOJu0YxIMTel+H1QPU/f6OrwfyMeIdeplzAPlWeIyCGMsDrAUitaW6jr
	+c+/JNNHvvRfFuJ5CYBNUCHULTrZtFfq0CWSVZhU26LZBvagjDMkIAdhFQ2Av/0=
X-Google-Smtp-Source: AGHT+IFup8wrx+EQX+pO/u3azKm1K3r4Amq/I6Xq2GHqK+ixDuYFRCvzBfzFkPPVu1dEJNOdw1Atiw==
X-Received: by 2002:a05:600c:348f:b0:427:ff3b:7a20 with SMTP id 5b1f17b1804b1-42ba66b3592mr9894205e9.27.1724839240003;
        Wed, 28 Aug 2024 03:00:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:765d:64ff:5f38:550? ([2a01:e0a:982:cbb0:765d:64ff:5f38:550])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba6397de5sm16534505e9.8.2024.08.28.03.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 03:00:39 -0700 (PDT)
Message-ID: <3e7bdc54-294a-467f-a437-2cabe640f624@linaro.org>
Date: Wed, 28 Aug 2024 12:00:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add support for Amlogic T7 reset controller
From: Neil Armstrong <neil.armstrong@linaro.org>
To: kelvin.zhang@amlogic.com, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zelong Dong <zelong.dong@amlogic.com>
References: <20240422-t7-reset-v2-0-cb82271d3296@amlogic.com>
 <c11bfe7e-e917-4ecd-ab2c-548332a4d22d@linaro.org>
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
In-Reply-To: <c11bfe7e-e917-4ecd-ab2c-548332a4d22d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_030042_785753_11ED9558 
X-CRM114-Status: GOOD (  13.61  )
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

SGksCgpPbiAwNS8wNi8yMDI0IDE0OjUxLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPiBIaSBQaGls
aXBwLAo+IAo+IE9uIDIyLzA0LzIwMjQgMTM6MTEsIEtlbHZpbiBaaGFuZyB2aWEgQjQgUmVsYXkg
d3JvdGU6Cj4+IEFkZCBhIG5ldyBjb21wYXRpYmxlIGFuZCBkZXZpY2Ugbm9kZSBmb3IgQW1sb2dp
YyBUNyByZXNldCBjb250cm9sbGVyLgo+PiBBbmQgbW9kaWZ5IHRoZSBkcml2ZXIgYWNjb3JkaW5n
bHkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFplbG9uZyBEb25nIDx6ZWxvbmcuZG9uZ0BhbWxvZ2lj
LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogS2VsdmluIFpoYW5nIDxrZWx2aW4uemhhbmdAYW1sb2dp
Yy5jb20+Cj4+IC0tLQo+PiBDaGFuZ2VzIGluIHYyOgo+PiAtIERyb3AgdGhlIGNvbXBhdGlibGUg
Y29tbWVudCBpbiBkdC1iaW5kaW5nLgo+PiAtIE1vdmUgdDctcmVzZXQuaCB0byBhcmNoL2FybTY0
L2Jvb3QvZHRzL2FtbG9naWMuCj4+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDI0MDMyOS10Ny1yZXNldC12MS0wLTRjNmUyZTY4MzU5ZUBhbWxvZ2ljLmNvbQo+Pgo+
PiAtLS0KPj4gWmVsb25nIERvbmcgKDMpOgo+PiDCoMKgwqDCoMKgwqAgZHQtYmluZGluZ3M6IHJl
c2V0OiBBZGQgQW1sb2dpYyBUNyByZXNldCBjb250cm9sbGVyCj4+IMKgwqDCoMKgwqDCoCByZXNl
dDogcmVzZXQtbWVzb246IEFkZCBzdXBwb3J0IGZvciBBbWxvZ2ljIFQ3IFNvQyByZXNldCBjb250
cm9sbGVyCj4+IMKgwqDCoMKgwqDCoCBhcm02NDogZHRzOiBhbWxvZ2ljOiBBZGQgQW1sb2dpYyBU
NyByZXNldCBjb250cm9sbGVyCj4+Cj4+IMKgIC4uLi9iaW5kaW5ncy9yZXNldC9hbWxvZ2ljLG1l
c29uLXJlc2V0LnlhbWzCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsKPj4gwqAgYXJjaC9hcm02NC9i
b290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDctcmVzZXQuaMKgwqDCoMKgIHwgMTk3ICsrKysrKysr
KysrKysrKysrKysrKwo+PiDCoCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10
Ny5kdHNpwqDCoMKgwqDCoMKgwqAgfMKgwqAgNyArCj4gCj4gSSBhcHBsaWVkIHRoZSBEVCBjaGFu
Z2UsIGNvdWxkIHlvdSBwaWNrIHRoZSBiaW5kaW5ncyAmIGRyaXZlciBjaGFuZ2UgPwoKR2VudGxl
IHBpbmcsIGNvdWxkIHlvdSBhcHBseSB0aGUgYmluZGluZ3MgJiBkcml2ZXIgY2hhbmdlcyA/Cklm
IHlvdSBsYWNrIHRpbWUsIHBsZWFzZSB0ZWxsIG1lIGlmIGl0J3Mgb2sgZm9yIHlvdSBmb3IgbWUg
dG8gYXBwbHkgdGhlIGJpbmRpbmdzIHZpYSB0aGUgYW1sb2dpYyB0cmVlID8KCk5laWwKCj4gCj4g
VGhhbmtzLAo+IE5laWwKPiAKPj4gwqAgZHJpdmVycy9yZXNldC9yZXNldC1tZXNvbi5jwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA2ICsKPj4gwqAg
NCBmaWxlcyBjaGFuZ2VkLCAyMTEgaW5zZXJ0aW9ucygrKQo+PiAtLS0KPj4gYmFzZS1jb21taXQ6
IGY1MjlhNmQyNzRiM2I4Yzc1ODk5ZTk0OTY0OWQyMzEyOThmMzBhMzIKPj4gY2hhbmdlLWlkOiAy
MDI0MDMyOS10Ny1yZXNldC1mODdlODM0NmZhZGIKPj4KPj4gQmVzdCByZWdhcmRzLAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
