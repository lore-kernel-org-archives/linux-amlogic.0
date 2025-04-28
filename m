Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FF1C369D3
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Apr 2025 09:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Od0eJX4SXZ8PMxGy83pYOOe0hKhFU4biIYc64a3hTjM=; b=VBtnW/5ZkEvS5eS6zixQE6Dpdl
	wUn+rL5h2/Ur9WThkPw2JZLyJwMSlkwTtwObtuNL6AUYw5wFBjWZa+zDMEaZpnvxzv5xeJtsOuZkF
	XVCNT3vkoud3UtFUbmsfxKPsSFba+ReHlgf4R3OMWaijSn4pFog9RSJzSUeQ8cZWik0IDxtT/gycn
	hIblCwynnpoQGe+yK39jnn7lxyISU3CnY/kmE06kchyL6DLMoyVJPwecEaml1OHNOMJx3b0Kp3ImT
	CsJhM5C9SIX7XSB1fGrCpxof6IbloBizVv2wn3T9KH+EVhv1xmlodlvB7ELlb4ogo51SxXSup8lcE
	UsdByAsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9KpI-00000005dFV-15mi;
	Mon, 28 Apr 2025 09:31:00 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Jbt-00000005N2P-130S
	for linux-amlogic@lists.infradead.org;
	Mon, 28 Apr 2025 08:13:07 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39ac9aea656so5283003f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Apr 2025 01:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745827983; x=1746432783; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2BE4IFNraf2nwb+gMN6BrLPdvxjK4GMRcC/zeJ//7Y=;
        b=dIhRSR176g03jzVNRI+iOGeVgGYZBJQDURVonyJIGqtjtxle/4BYKAqN4WCjSpHorq
         p3Ty6Si1z6O0hQR3c5CXSDWHw9EoaKvx2aDQM3AjPX5YW1sNsQ2t/8q69LuEwoT8QNBU
         l7mcEvCri/iYiilLcesINvEnatAoX5CHembKmtLXQjZp+378NzghUZ3Y4XGzrREjut1v
         ErjUSLwc6JfBPDiZkjgK6ogwG3sdIWuex57xofuNT/QvYjVQWL0+h9gW41Pxcplo06so
         SaLwWcekpEFmUbnnW1UxYDpr7+GqPyy6OEa5ejv6bT2ZyexcWzuzaOlzixnEPkGWN+S2
         85hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745827983; x=1746432783;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A2BE4IFNraf2nwb+gMN6BrLPdvxjK4GMRcC/zeJ//7Y=;
        b=RnNKJtIzjZ8YPACZu3tLZ/D9XkcfE2ebt1Q9cnw5K7AvzV3VgOBg9Ecb5CQHlKHsL8
         tcrxaKRUZz6pItCgbyfvoXCdccqCd066uy9+R2w3lWYwPX/Cg4IlnOrPsqumq7qrWA7n
         QG+ZxVbJSFPkQdNdujeVlSiynut/AEzZuQ09TQdOi5XwP+mlWTKn+ic9W6lIOWoE5stM
         wA4uu9tvicoASb3VyFNUs45UPnDqpWY9+7rx7WDNSKNCwqE/MLtcvrZTq1/3vj2PkkgQ
         313cFEznRe5DpZL2WZksGpl1mc/JxBmrVWbli6Ecd/Yb8RCqC+NC+UcHTQhHyOgyn6KB
         jj6A==
X-Forwarded-Encrypted: i=1; AJvYcCXIRbQYjBD60Mexaz0KVzgeq6mjuoa81kLbVRTwf/pnh0974FLp5mOdl5VboAS6yluVPapShQARsYkuL+dB@lists.infradead.org
X-Gm-Message-State: AOJu0YywMUJ3eGUh8cMNPJbf0OJX42t17W7SPJEOSYZYITi44WgqUBp3
	rcI919aEXvGVejaWw57LvKQGMV8wapJl3eDWplXAoCbgwR+bwsBDEb1buU7ywHg=
X-Gm-Gg: ASbGnct/qiQ2NDc0tdfs666ce9KBJlA019GgqcZvpc7AlUg+UMZUZOnG3H5urubhGvZ
	lLblGdynKSQw1X4BQQzqtH7PYgJH6R1XVNVGytNKampE2Vni37G2oGFJlFMZU8mbjZpm2FpnuVK
	Q0Ik1wQojx1ix4Mynmt3PAHZ1AiywF692Zx1tiVEXdY2aG7kw92MqJ7OqHLAem/1yFHOeOf2rhB
	Mu+sW8zmmMXTc25Con6ljweRz+m97OUGSe/exTTMrSNTz8Xa7bJYAGoz/fCEsk/0s7JSy8fh/2i
	BER/50FyxlxIlnEey6rxPXCFY5cb+IWxJDwGvZ5icvn3NLeN/5IuZ55BI3ThSXkj97HLV/AYfbj
	5v+BOCmh8ba+PIIiEUg==
X-Google-Smtp-Source: AGHT+IFirYO+R6cxa4E/PxDKxv2Eoalg7DNOh3n5z36BXYljdt+Ef5dXthwTwXbfPkkn6KEjfC0prQ==
X-Received: by 2002:a05:6000:1ac5:b0:390:f0ff:2c11 with SMTP id ffacd0b85a97d-3a074e146c6mr6922171f8f.2.1745827983497;
        Mon, 28 Apr 2025 01:13:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:e2bb:d0cc:c4c9:4442? ([2a01:e0a:3d9:2080:e2bb:d0cc:c4c9:4442])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5d264sm10609868f8f.95.2025.04.28.01.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 01:13:03 -0700 (PDT)
Message-ID: <449cc46e-fab8-401a-b887-51d621695a1c@linaro.org>
Date: Mon, 28 Apr 2025 10:13:02 +0200
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
 <eb1c3442-6b86-42e9-a672-eaba7de8b375@linaro.org>
 <32473413-b2fb-471b-b2d5-b4fd7914b57f@amlogic.com>
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
In-Reply-To: <32473413-b2fb-471b-b2d5-b4fd7914b57f@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_011305_308163_29318E59 
X-CRM114-Status: GOOD (  14.85  )
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

T24gMjgvMDQvMjAyNSAwOTo1NywgWGlhbndlaSBaaGFvIHdyb3RlOgo+IEhpIE5laWwsCj4gIMKg
wqAgVGhhbmtzIGZvciB5b3VyIHJlcGx5Lgo+IAo+IE9uIDIwMjUvNC8yMyAxNToyMywgbmVpbC5h
cm1zdHJvbmdAbGluYXJvLm9yZyB3cm90ZToKPj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Cj4+IEhp
LAo+Pgo+PiBPbiAyMy8wNC8yMDI1IDA4OjE1LCBYaWFud2VpIFpoYW8gd3JvdGU6Cj4+PiBIaSBO
ZWlsLAo+Pj4gwqDCoMKgIFRoYW5rcyBmb3IgeW91ciByZXBseS4KPj4+Cj4+PiBPbiAyMDI1LzQv
MjIgMjE6NDksIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+Pj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+
Pj4+Cj4+Pj4gSGksCj4+Pj4KPj4+PiBPbiAyMi8wNC8yMDI1IDEzOjQ1LCBYaWFud2VpIFpoYW8g
d3JvdGU6Cj4+Pj4+IEhpIE5laWwsCj4+Pj4+IMKgwqDCoCBBIGdlbnRsZSBwaW5nLCB0aGFua3Mu
Cj4+Pj4KPj4+PiBJJ2xsIGFwcGx5IHRoZW0gdGhpcyB3ZWVrIGV4Y2VwdCBwYXRjaCA0LAo+Pj4+
Cj4+Pj4gc28gY2FuIHlvdSBzZW5kIHBhdGNoIDQgc2VwYXJhdGVseSBzaW5jZSBpdCBnb2VzIHZp
YSB0aGUgdHR5IHRyZWUgPwo+Pj4+Cj4+Pgo+Pj4gSSB3aWxsIHNlbmQgcGF0Y2ggNCBzZXBhcmF0
ZWx5Lgo+Pj4gVGhlIGZvbGxvd2luZyBwYXRjaGVzKDUgNiA3KSBjYW4gYmUgbm90IGluY2x1ZGVk
IGZvciBub3cuIFdpdGhvdXQgdGhlIHBhdGNoIDQsIHRoZSBjb21tYW5kICJtYWtlIEFSQ0g9YXJt
NjQgZHRic19jaGVjayBXPTEiIHdpbGwgZmFpbCB0byBleGVjdXRlLgo+Pgo+PiBJIGtub3csIGJ1
dCBzaW5jZSBpdCdzIHJldmlld2VkLCBHcmVnIEtIIHdpbGwgcGljayBpdCBmb3IgdGhlIG5leHQg
cmVsZWFzZSBzbyBpdCdzIGZpbmUuCj4+Cj4gCj4gSSBoYXZlIGFscmVhZHkgc2VudCBwYXRjaCA0
IHNlcGFyYXRlbHkuIEZyb20gUm9iJ3MgcmVwbHksIGRvIHlvdSB0aGluayBpdCBjYW4gYmUgcGlj
a2VkIHVwIHRvZ2V0aGVyPwo+IAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9DQUxfSnNx
S0Q9eWVzcGQwV005MFZCcl9YV2RwcGltekR6ZWNtd05mR01WK2hOU0h1UkFAbWFpbC5nbWFpbC5j
b20vCgoKR3JlZyBLSCBwaWNrZWQgaXQgYWxyZWFkeS4KCk5laWwKCj4gCj4+IE5laWwKPj4KPj4+
Cj4+Pj4gVGhhbmtzLAo+Pj4+IE5laWwKPj4+Pgo+Pj4+Pgo+Pj4+PiBPbiAyMDI1LzMvMTcgMTU6
MTYsIFhpYW53ZWkgWmhhbyB2aWEgQjQgUmVsYXkgd3JvdGU6Cj4+Pj4+PiBbIEVYVEVSTkFMIEVN
QUlMIF0KPj4+Pj4+Cj4+Pj4+PiBBbWxvZ2ljIFM2IFM3IGFuZCBTN0QgYXJlIGFwcGxpY2F0aW9u
IHByb2Nlc3NvcnMgZGVzaWduZWQgZm9yCj4+Pj4+PiBoeWJyaWQgT1RUL0lQIFNldCBUb3AgQm94
IGFuZCBoaWdoLWVuZCBtZWRpYSBib3ggYXBwbGljYXRpb25zLgo+Pj4+Pj4KPj4+Pj4+IEFkZCB0
aGUgbmV3IFM2IFNvQy9ib2FyZCBkZXZpY2UgdHJlZSBiaW5kaW5ncy4KPj4+Pj4+IEFkZCB0aGUg
bmV3IFM3IFNvQy9ib2FyZCBkZXZpY2UgdHJlZSBiaW5kaW5ncy4KPj4+Pj4+IEFkZCB0aGUgbmV3
IFM3RCBTb0MvYm9hcmQgZGV2aWNlIHRyZWUgYmluZGluZ3MuCj4+Pj4+Pgo+Pj4+Pj4gQWRkIGJh
c2ljIHN1cHBvcnQgZm9yIHRoZSBTNiBiYXNlZCBBbWxvZ2ljIEJMMjA5IGJvYXJkLCB3aGljaCBk
ZXNjcmliZXMKPj4+Pj4+IHRoZSBmb2xsb3dpbmcgY29tcG9uZW50czogQ1BVLCBHSUMsIElSUSwg
VGltZXIgYW5kIFVBUlQuIFRoZXNlIGFyZSBjYXBhYmxlIG9mCj4+Pj4+PiBib290aW5nIHVwIGlu
dG8gdGhlIHNlcmlhbCBjb25zb2xlLgo+Pj4+Pj4KPj4+Pj4+IEFkZCBiYXNpYyBzdXBwb3J0IGZv
ciB0aGUgUzcgYmFzZWQgQW1sb2dpYyBCUDIwMSBib2FyZCwgd2hpY2ggZGVzY3JpYmVzCj4+Pj4+
PiB0aGUgZm9sbG93aW5nIGNvbXBvbmVudHM6IENQVSwgR0lDLCBJUlEsIFRpbWVyIGFuZCBVQVJU
LiBUaGVzZSBhcmUgY2FwYWJsZSBvZgo+Pj4+Pj4gYm9vdGluZyB1cCBpbnRvIHRoZSBzZXJpYWwg
Y29uc29sZS4KPj4+Pj4+Cj4+Pj4+PiBBZGQgYmFzaWMgc3VwcG9ydCBmb3IgdGhlIFM3RCBiYXNl
ZCBBbWxvZ2ljIEJNMjAyIGJvYXJkLCB3aGljaCBkZXNjcmliZXMKPj4+Pj4+IHRoZSBmb2xsb3dp
bmcgY29tcG9uZW50czogQ1BVLCBHSUMsIElSUSwgVGltZXIgYW5kIFVBUlQuIFRoZXNlIGFyZSBj
YXBhYmxlIG9mCj4+Pj4+PiBib290aW5nIHVwIGludG8gdGhlIHNlcmlhbCBjb25zb2xlLgo+Pj4+
Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9n
aWMuY29tPgo+Pj4+Pj4gLS0tCj4+Pj4+PiBYaWFud2VpIFpoYW8gKDcpOgo+Pj4+Pj4gwqDCoMKg
wqDCoMKgIGR0LWJpbmRpbmdzOiBhcm06IGFtbG9naWM6IGFkZCBTNiBzdXBwb3J0Cj4+Pj4+PiDC
oMKgwqDCoMKgwqAgZHQtYmluZGluZ3M6IGFybTogYW1sb2dpYzogYWRkIFM3IHN1cHBvcnQKPj4+
Pj4+IMKgwqDCoMKgwqDCoCBkdC1iaW5kaW5nczogYXJtOiBhbWxvZ2ljOiBhZGQgUzdEIHN1cHBv
cnQKPj4+Pj4+IMKgwqDCoMKgwqDCoCBkdC1iaW5kaW5nczogc2VyaWFsOiBhbWxvZ2ljLG1lc29u
LXVhcnQ6IEFkZCBjb21wYXRpYmxlIHN0cmluZyBmb3IgUzYvUzcvUzdECj4+Pj4+PiDCoMKgwqDC
oMKgwqAgYXJtNjQ6IGR0czogYWRkIHN1cHBvcnQgZm9yIFM2IGJhc2VkIEFtbG9naWMgQkwyMDkK
Pj4+Pj4+IMKgwqDCoMKgwqDCoCBhcm02NDogZHRzOiBhZGQgc3VwcG9ydCBmb3IgUzcgYmFzZWQg
QW1sb2dpYyBCUDIwMQo+Pj4+Pj4gwqDCoMKgwqDCoMKgIGFybTY0OiBkdHM6IGFkZCBzdXBwb3J0
IGZvciBTN0QgYmFzZWQgQW1sb2dpYyBCTTIwMgo+Pj4+Pj4KPj4+Pj4+IMKgIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy55YW1sIHwgMTggKysrKwo+Pj4+Pj4g
wqAgLi4uL2JpbmRpbmdzL3NlcmlhbC9hbWxvZ2ljLG1lc29uLXVhcnQueWFtbMKgwqDCoMKgwqDC
oMKgIHzCoCAzICsKPj4+Pj4+IMKgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtlZmls
ZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDMgKwo+Pj4+Pj4gwqAgLi4uL2Jvb3Qv
ZHRzL2FtbG9naWMvYW1sb2dpYy1zNi1zOTA1eDUtYmwyMDkuZHRzwqDCoCB8IDQyICsrKysrKysr
Kwo+Pj4+Pj4gwqAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtczYuZHRzacKg
wqDCoMKgwqDCoMKgIHwgOTcgKysrKysrKysrKysrKysrKysrKysrCj4+Pj4+PiDCoCAuLi4vYm9v
dC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXM3LXM4MDV4My1icDIwMS5kdHPCoMKgIHwgNDEgKysrKysr
KysrCj4+Pj4+PiDCoCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy1zNy5kdHNp
wqDCoMKgwqDCoMKgwqAgfCA5OSArKysrKysrKysrKysrKysrKysrKysrCj4+Pj4+PiDCoCAuLi4v
Ym9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXM3ZC1zOTA1eDVtLWJtMjAyLmR0cyB8IDQxICsrKysr
KysrKwo+Pj4+Pj4gwqAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtczdkLmR0
c2nCoMKgwqDCoMKgwqAgfCA5OSArKysrKysrKysrKysrKysrKysrKysrCj4+Pj4+PiDCoCA5IGZp
bGVzIGNoYW5nZWQsIDQ0MyBpbnNlcnRpb25zKCspCj4+Pj4+PiAtLS0KPj4+Pj4+IGJhc2UtY29t
bWl0OiA3M2U0ZmZiMjdiYjhhMDkzZDU1N2JiMmRhYzFhMjcxNDc0Y2NhOTljCj4+Pj4+PiBjaGFu
Z2UtaWQ6IDIwMjUwMjIxLXM2LXM3LWJhc2ljLWYzMDBjMzA4NzdlNgo+Pj4+Pj4KPj4+Pj4+IEJl
c3QgcmVnYXJkcywKPj4+Pj4+IC0tIAo+Pj4+Pj4gWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9A
YW1sb2dpYy5jb20+Cj4+Pj4+Pgo+Pj4+Pj4KPj4+Pgo+PgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
