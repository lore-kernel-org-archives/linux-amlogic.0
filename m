Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00125C369CB
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Apr 2025 07:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S333+bwkessNJnJWcigXuRdr+1rov3+4GW2TObmQrUA=; b=ddBAZHCUhAWlra9Rd23y0AP/rC
	eQFNRpRzQAvrJC75FRlY2Xp88w3N4MMgztO/v03479ZABHcb60jaAPBaPRtgOBnOfrqnnFjfWVbzU
	/+M8KlF5PW2K/KjkN3k7tBZDTDgc3KgjiZdsbuMQ9IbUQ5sW/sqt3xGRVqX2lUVeErZ01awGfc7hT
	9QbfpSY72ACJTV69CAWF14AjEXOytNaWSiq/Wrq1hn7WP7UnX9qeUG+u/dv//+2VRrl5oZZqa4JkW
	E0gL6bQCiKYO0AGPI+1tUS1fHnBq7gsitVEf8hY6S/ZThNIDfw9tP3Q5ySRgGV27U5EjrgVUfm8/d
	oTF78C1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Unv-00000009YzU-22aE;
	Wed, 23 Apr 2025 07:45:59 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7URv-00000009V8b-3sDU
	for linux-amlogic@lists.infradead.org;
	Wed, 23 Apr 2025 07:23:17 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso38098035e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 23 Apr 2025 00:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745392994; x=1745997794; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WB0RCfrpm6KO0azBMBNT3gQRNEul5d5cuD4mn3Ij+n8=;
        b=i4w9ywsr18Czy1D8oOmVTNEkxLjMWtWiU2cUqduQaM8QcD04tuaDNPgJ5W4EM+EHCG
         z+XBmgKAlafXThFeVdyVSk56CmaHSEB0C2c+9kMTK+5j12gRJL0OoHDoN+y9bK71Kdwl
         xydffFxEFqDkhZ1LPtcb/BeFTFiwPwjB8b5RpmW7GRNNqH7gxHvIuCid16KeVJpXp2xH
         eOsrepFe2/81XsZ6HOyj8dA4u2AA2TGttYXm9ddRTnH/TiyR4S2gqC9GKx1RjeJq8xFW
         oiediR+9oi1RrF9a4OzUqrZr9jfkefyYI3cXOTGe8VgsqZ0EdzdYyEJW4QZwklh10oV2
         3WJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392994; x=1745997794;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WB0RCfrpm6KO0azBMBNT3gQRNEul5d5cuD4mn3Ij+n8=;
        b=GxFVdLKB2bVxXqKqNWuaI+ZX9zIHyh8h4aO3Tkj4uYeWEHL25xEgW2eybn3Jiew5SA
         qFdMGz92ieNxIrdatddUeEhihAEJw8HvgdYqtrr50SnVMRiyxVfnsntdBs3VfG/37Y/+
         O9y+RTffCFUvRfSbNp4OQYL09XF7CEf1UV5C03NmkvNeo0k/z4JycCvQtnqYXLMvY9uH
         ADS7yKNFFxAk4SeVP/+70sBoeXPdp3HNjc5athjhzInmv3DqOWpQ6vaclZ2U7mCSZd8t
         SaPYx60jkGCagYEFplBEBdlKLwK39hs7UENr9KXibsDEyChAcRs2xUGcSYEUDJcbGptM
         ZPOg==
X-Forwarded-Encrypted: i=1; AJvYcCWxfe9aSWjuspM/kXRirI1Fn5j3AszyZk4L1HOMxsgdABzTRb689cDxMNMmGYqDkKLKHyWYOJeVqtv+b9wO@lists.infradead.org
X-Gm-Message-State: AOJu0YyRDmpbnSPH0lNhdU7TYpBfnCm4Tu+F3u9QFeZTt/y+3qpDw+ty
	h33AtpjeIc0D9xYksyMm1728p2KeHjWJq6gMdkW+fvrE9pXvZAQ1OLLoNmTc9vc=
X-Gm-Gg: ASbGncveS2EjZYGHHQ4Yi5ge0xVJ1aYMUWvC+ck8HSDZdrfGV5qEWs39MUesNj1VjOt
	Y5HXtBoMCeHaUOo+AyRZMJx/BqMS3JAfFbAdPreEzagi0eOLDOR8Vatd0qSyauvrKgmY+kpPm2u
	Nr1L1usfAf1QQMVDiM/aX0hZVvoKPqfpmBBwY+33ca5s4WXle+k/o1WTmLiUDB0uDNHVxL+LrNh
	kNCK57ofrEfMJNnyzxKfh+7SCkTcQmj3yAtpB/EYpfLFDOX1LvXMBDNo7Ybx+KKBsslWOb72aAQ
	Mgo5MhmOObz1MYHnfuNRAK2wz41eCl8TcR3K9mSgsa8j4sCEdnBYSttGZ0B76tzDJLUPnZ/0bSc
	Wv3hoU6VwTY6gbjRZSg==
X-Google-Smtp-Source: AGHT+IF7iRgKZdIR7ImIaoLwdAL0qVsjtbiBOb3c9EZ1TcpXaE3Utdm6WozDnJe6gph5La9PzewJlg==
X-Received: by 2002:a05:600c:350a:b0:440:66c5:26f4 with SMTP id 5b1f17b1804b1-4406ab703b8mr160055435e9.1.1745392993806;
        Wed, 23 Apr 2025 00:23:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:2835:c2f4:c226:77dd? ([2a01:e0a:3d9:2080:2835:c2f4:c226:77dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44092d1709esm15163115e9.7.2025.04.23.00.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 00:23:13 -0700 (PDT)
Message-ID: <eb1c3442-6b86-42e9-a672-eaba7de8b375@linaro.org>
Date: Wed, 23 Apr 2025 09:23:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/7] Baisc devicetree support for Amlogic S6 S7 and S7D
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20250317-s6-s7-basic-v1-0-d653384e41f3@amlogic.com>
 <a175ed1d-9e57-4150-af8f-7ca785203108@amlogic.com>
 <e3229c42-b322-447a-ad1e-86c6f20dd54e@linaro.org>
 <be8b7874-1251-4ba8-9243-a615517861ab@amlogic.com>
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
In-Reply-To: <be8b7874-1251-4ba8-9243-a615517861ab@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_002315_980369_CB7FC096 
X-CRM114-Status: GOOD (  13.48  )
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

SGksCgpPbiAyMy8wNC8yMDI1IDA4OjE1LCBYaWFud2VpIFpoYW8gd3JvdGU6Cj4gSGkgTmVpbCwK
PiAgwqDCoCBUaGFua3MgZm9yIHlvdXIgcmVwbHkuCj4gCj4gT24gMjAyNS80LzIyIDIxOjQ5LCBO
ZWlsIEFybXN0cm9uZyB3cm90ZToKPj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Cj4+IEhpLAo+Pgo+
PiBPbiAyMi8wNC8yMDI1IDEzOjQ1LCBYaWFud2VpIFpoYW8gd3JvdGU6Cj4+PiBIaSBOZWlsLAo+
Pj4gwqDCoMKgIEEgZ2VudGxlIHBpbmcsIHRoYW5rcy4KPj4KPj4gSSdsbCBhcHBseSB0aGVtIHRo
aXMgd2VlayBleGNlcHQgcGF0Y2ggNCwKPj4KPj4gc28gY2FuIHlvdSBzZW5kIHBhdGNoIDQgc2Vw
YXJhdGVseSBzaW5jZSBpdCBnb2VzIHZpYSB0aGUgdHR5IHRyZWUgPwo+Pgo+IAo+IEkgd2lsbCBz
ZW5kIHBhdGNoIDQgc2VwYXJhdGVseS4KPiBUaGUgZm9sbG93aW5nIHBhdGNoZXMoNSA2IDcpIGNh
biBiZSBub3QgaW5jbHVkZWQgZm9yIG5vdy4gV2l0aG91dCB0aGUgcGF0Y2ggNCwgdGhlIGNvbW1h
bmQgIm1ha2UgQVJDSD1hcm02NCBkdGJzX2NoZWNrIFc9MSIgd2lsbCBmYWlsIHRvIGV4ZWN1dGUu
CgpJIGtub3csIGJ1dCBzaW5jZSBpdCdzIHJldmlld2VkLCBHcmVnIEtIIHdpbGwgcGljayBpdCBm
b3IgdGhlIG5leHQgcmVsZWFzZSBzbyBpdCdzIGZpbmUuCgpOZWlsCgo+IAo+PiBUaGFua3MsCj4+
IE5laWwKPj4KPj4+Cj4+PiBPbiAyMDI1LzMvMTcgMTU6MTYsIFhpYW53ZWkgWmhhbyB2aWEgQjQg
UmVsYXkgd3JvdGU6Cj4+Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Pj4KPj4+PiBBbWxvZ2ljIFM2
IFM3IGFuZCBTN0QgYXJlIGFwcGxpY2F0aW9uIHByb2Nlc3NvcnMgZGVzaWduZWQgZm9yCj4+Pj4g
aHlicmlkIE9UVC9JUCBTZXQgVG9wIEJveCBhbmQgaGlnaC1lbmQgbWVkaWEgYm94IGFwcGxpY2F0
aW9ucy4KPj4+Pgo+Pj4+IEFkZCB0aGUgbmV3IFM2IFNvQy9ib2FyZCBkZXZpY2UgdHJlZSBiaW5k
aW5ncy4KPj4+PiBBZGQgdGhlIG5ldyBTNyBTb0MvYm9hcmQgZGV2aWNlIHRyZWUgYmluZGluZ3Mu
Cj4+Pj4gQWRkIHRoZSBuZXcgUzdEIFNvQy9ib2FyZCBkZXZpY2UgdHJlZSBiaW5kaW5ncy4KPj4+
Pgo+Pj4+IEFkZCBiYXNpYyBzdXBwb3J0IGZvciB0aGUgUzYgYmFzZWQgQW1sb2dpYyBCTDIwOSBi
b2FyZCwgd2hpY2ggZGVzY3JpYmVzCj4+Pj4gdGhlIGZvbGxvd2luZyBjb21wb25lbnRzOiBDUFUs
IEdJQywgSVJRLCBUaW1lciBhbmQgVUFSVC4gVGhlc2UgYXJlIGNhcGFibGUgb2YKPj4+PiBib290
aW5nIHVwIGludG8gdGhlIHNlcmlhbCBjb25zb2xlLgo+Pj4+Cj4+Pj4gQWRkIGJhc2ljIHN1cHBv
cnQgZm9yIHRoZSBTNyBiYXNlZCBBbWxvZ2ljIEJQMjAxIGJvYXJkLCB3aGljaCBkZXNjcmliZXMK
Pj4+PiB0aGUgZm9sbG93aW5nIGNvbXBvbmVudHM6IENQVSwgR0lDLCBJUlEsIFRpbWVyIGFuZCBV
QVJULiBUaGVzZSBhcmUgY2FwYWJsZSBvZgo+Pj4+IGJvb3RpbmcgdXAgaW50byB0aGUgc2VyaWFs
IGNvbnNvbGUuCj4+Pj4KPj4+PiBBZGQgYmFzaWMgc3VwcG9ydCBmb3IgdGhlIFM3RCBiYXNlZCBB
bWxvZ2ljIEJNMjAyIGJvYXJkLCB3aGljaCBkZXNjcmliZXMKPj4+PiB0aGUgZm9sbG93aW5nIGNv
bXBvbmVudHM6IENQVSwgR0lDLCBJUlEsIFRpbWVyIGFuZCBVQVJULiBUaGVzZSBhcmUgY2FwYWJs
ZSBvZgo+Pj4+IGJvb3RpbmcgdXAgaW50byB0aGUgc2VyaWFsIGNvbnNvbGUuCj4+Pj4KPj4+PiBT
aWduZWQtb2ZmLWJ5OiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPj4+
PiAtLS0KPj4+PiBYaWFud2VpIFpoYW8gKDcpOgo+Pj4+IMKgwqDCoMKgwqDCoCBkdC1iaW5kaW5n
czogYXJtOiBhbWxvZ2ljOiBhZGQgUzYgc3VwcG9ydAo+Pj4+IMKgwqDCoMKgwqDCoCBkdC1iaW5k
aW5nczogYXJtOiBhbWxvZ2ljOiBhZGQgUzcgc3VwcG9ydAo+Pj4+IMKgwqDCoMKgwqDCoCBkdC1i
aW5kaW5nczogYXJtOiBhbWxvZ2ljOiBhZGQgUzdEIHN1cHBvcnQKPj4+PiDCoMKgwqDCoMKgwqAg
ZHQtYmluZGluZ3M6IHNlcmlhbDogYW1sb2dpYyxtZXNvbi11YXJ0OiBBZGQgY29tcGF0aWJsZSBz
dHJpbmcgZm9yIFM2L1M3L1M3RAo+Pj4+IMKgwqDCoMKgwqDCoCBhcm02NDogZHRzOiBhZGQgc3Vw
cG9ydCBmb3IgUzYgYmFzZWQgQW1sb2dpYyBCTDIwOQo+Pj4+IMKgwqDCoMKgwqDCoCBhcm02NDog
ZHRzOiBhZGQgc3VwcG9ydCBmb3IgUzcgYmFzZWQgQW1sb2dpYyBCUDIwMQo+Pj4+IMKgwqDCoMKg
wqDCoCBhcm02NDogZHRzOiBhZGQgc3VwcG9ydCBmb3IgUzdEIGJhc2VkIEFtbG9naWMgQk0yMDIK
Pj4+Pgo+Pj4+IMKgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dp
Yy55YW1sIHwgMTggKysrKwo+Pj4+IMKgIC4uLi9iaW5kaW5ncy9zZXJpYWwvYW1sb2dpYyxtZXNv
bi11YXJ0LnlhbWzCoMKgwqDCoMKgwqDCoCB8wqAgMyArCj4+Pj4gwqAgYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMyAr
Cj4+Pj4gwqAgLi4uL2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy1zNi1zOTA1eDUtYmwyMDkuZHRz
wqDCoCB8IDQyICsrKysrKysrKwo+Pj4+IMKgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9h
bWxvZ2ljLXM2LmR0c2nCoMKgwqDCoMKgwqDCoCB8IDk3ICsrKysrKysrKysrKysrKysrKysrKwo+
Pj4+IMKgIC4uLi9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtczctczgwNXgzLWJwMjAxLmR0c8Kg
wqAgfCA0MSArKysrKysrKysKPj4+PiDCoCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1s
b2dpYy1zNy5kdHNpwqDCoMKgwqDCoMKgwqAgfCA5OSArKysrKysrKysrKysrKysrKysrKysrCj4+
Pj4gwqAgLi4uL2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy1zN2QtczkwNXg1bS1ibTIwMi5kdHMg
fCA0MSArKysrKysrKysKPj4+PiDCoCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dp
Yy1zN2QuZHRzacKgwqDCoMKgwqDCoCB8IDk5ICsrKysrKysrKysrKysrKysrKysrKysKPj4+PiDC
oCA5IGZpbGVzIGNoYW5nZWQsIDQ0MyBpbnNlcnRpb25zKCspCj4+Pj4gLS0tCj4+Pj4gYmFzZS1j
b21taXQ6IDczZTRmZmIyN2JiOGEwOTNkNTU3YmIyZGFjMWEyNzE0NzRjY2E5OWMKPj4+PiBjaGFu
Z2UtaWQ6IDIwMjUwMjIxLXM2LXM3LWJhc2ljLWYzMDBjMzA4NzdlNgo+Pj4+Cj4+Pj4gQmVzdCBy
ZWdhcmRzLAo+Pj4+IC0tIAo+Pj4+IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMu
Y29tPgo+Pj4+Cj4+Pj4KPj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
