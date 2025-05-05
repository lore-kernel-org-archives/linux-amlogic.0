Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE6BC3ABB0
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 May 2025 12:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XjkZFZ8moZxItgymynOz5/Uc5dr+7Cu6DOCG+b7A6D8=; b=z1W4UC6Nav2/gqzpJ2T5Bvde3q
	sVBqUgoh4dYZsEuRzmLdKFqZ8LfrXajU3TkBfwjT+kDm9jmOLKeaQM/Y6twdI7s81EdpEIef3Njxc
	MxZPuxn2HrDq2pamcDrtQn6dI7IeOmEa2KEkvUyiFTo+NOCsnn1YL7PHuGxqZo94Q9aux5pl3xMrG
	hYwyj60NHvP/sqWui6RKY5YprQDFaB3TGpAFbz1uyDeKloFB/qdDflOME8YBa35wvZxQT8Ezp3EKO
	pVAkcUQSW6/wDpt4BvpSPsZFecmXr207RcuLO5hwE7gBd0BNt7cDZmVkfWG/AHOtbN4KYuuHdRVrk
	Fu5PHkfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBuz4-00000007K9u-2rfU;
	Mon, 05 May 2025 12:31:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBuue-00000007JFq-1fKe
	for linux-amlogic@lists.infradead.org;
	Mon, 05 May 2025 12:27:13 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cf257158fso23350525e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 05 May 2025 05:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746448030; x=1747052830; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arGOTRxxQGxdufIP7mOjGnR0k9BV+lEtA30jWrv6jWI=;
        b=NsEa1LMAzu71gR/fd4PKHngqbvIdZB+fhs7grR2bv79Ba2fAwvGXfA8RFpH17Xpfbx
         IkosAzAq6ADS9saQIGDFrbR228iOICLz1gPHUNQ0tKkk57QGb3MvQHvVI9tmK3/qbMWh
         oEjJtrBzsPlcjvRurtWeIRMG/OQSack52IzWbb6We2GD4iwMYhuxVUK7y4kkL03w32Eq
         1htOYEMy16IQpIjTww8dm/FJ//UXSYcNvTU5+iQOLYkl+CXKQBe0Bg2IsJK4qS9A4DsJ
         zBLYyJvrAX7B+vkI/sbkW9xUBn30RN1d05JRmuwm8vW74M2T5dMOoyaHVoztVoTEbHy5
         xKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448030; x=1747052830;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=arGOTRxxQGxdufIP7mOjGnR0k9BV+lEtA30jWrv6jWI=;
        b=cmHN9FvijO7aESk5XSMvtibg5NWgxHHRh0VH1oRmfHBYksTdXNfqNknyOzFhK6/DfM
         qLqKifgON3vTcMqa2nlZYxSvWsjn6YcSG58yIL3ePE88eY+jPxR1pUgrlhYp/U9ufmig
         wMiz17BaeX4r1yuoW3WmLRbRsb72a03miOU4btnCJlDDgfEXHvjRqk3i+nF5oHEQJhLV
         mCvlcasM6AtbRQs5W2pOmx2Jtye1JruCcA7FMrW8uSWviH2prcXM0X4uwdlgpGI5kZX6
         86rIDzeCzFJAMfF/nfLt0u09wKsqFI9MhIWT8O74MjjrrsnAjBWDvc+J34iEq6JKMFV8
         XVlg==
X-Forwarded-Encrypted: i=1; AJvYcCX3ik8Bor09KTmEb++qqOWFi74DGp1Pf9UbCKqFMG4XQor+opGfOlIPxJ+rj8H0cM2Vj5WrhKDmHiqx3cU5@lists.infradead.org
X-Gm-Message-State: AOJu0YyLJ6Lm0mK0pkNyF6kZaWnHesHDw0r6Zp3n+eXL0Qc8uO1HDqp/
	2B7/zAU0lxYVxymELG4oOjKarhLEqR7Ah+mijDi+ZuNya7AI05qRV8OOb1Os0gI=
X-Gm-Gg: ASbGncuBQhb4H5WgWBBe6Q+dU1AgR+6zLMXOIHC1R0V7baW6mZTtNEB/DX8XwqD+/7P
	tWdgyhNpXMxS73DUqHYXCWaYyO+vSmIIiyBF8+rikLHQVS2zf8Ug1s8qVrNPMvZVhc/Sy6pMNTG
	3uhyeGlMsUORMXyrlLQ0omgnxfznoSb9JF0DFfoBTYUc9sX7IUax6XkM7/dSk5h8I5k9M3eg1DB
	0w4F/TIEn8Q0UR6/ifr5650/HWiJ2kTPufRhGhHvpQ95XlziW/zSVUDXTg80HkPcU3+gDddPVyX
	mq6SJPNC1NceOgPmhm+FIjYPsk+Xc+be9nd5yqFNcXN8dS/OAeB+NSkFEbBIo1iTOrVof6EQMTv
	1sAzptZwp3LiY9nhBhA==
X-Google-Smtp-Source: AGHT+IFm2SyHRklCMik4gXiE1LX4P+NZ/5+Q1oS9l11EEYCjGjJr25WUs1UtRqMbm9RVF5FQ86htag==
X-Received: by 2002:a05:600c:a0e:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-441c48dbf8emr63030125e9.15.1746448030489;
        Mon, 05 May 2025 05:27:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:88d3:1ad7:3ae1:56e3? ([2a01:e0a:3d9:2080:88d3:1ad7:3ae1:56e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a31695sm133485665e9.40.2025.05.05.05.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 05:27:10 -0700 (PDT)
Message-ID: <75104e42-282d-4a63-be0e-07a5c6fdf276@linaro.org>
Date: Mon, 5 May 2025 14:27:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: amlogic: gxl: set i2c bias to pull-up
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250425203118.1444481-1-da@libre.computer>
 <20523c9e-f7de-4355-82ed-380ee03083f0@linaro.org>
 <CAFBinCBiVQqeYTmR3sj++E8CqQXSMsOzhafAV0JNgDVR9OU7ZA@mail.gmail.com>
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
In-Reply-To: <CAFBinCBiVQqeYTmR3sj++E8CqQXSMsOzhafAV0JNgDVR9OU7ZA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_052712_432693_C1F8EBC6 
X-CRM114-Status: GOOD (  20.66  )
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

T24gMDQvMDUvMjAyNSAyMzowMywgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBPbiBNb24s
IEFwciAyOCwgMjAyNSBhdCA5OjMy4oCvQU0gTmVpbCBBcm1zdHJvbmcKPiA8bmVpbC5hcm1zdHJv
bmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIDI1LzA0LzIwMjUgMjI6MzEsIERhIFh1ZSB3
cm90ZToKPj4+IEdYTCBJMkMgcGlucyBuZWVkIGludGVybmFsIHB1bGwtdXAgZW5hYmxlZCB0byBv
cGVyYXRlIGlmIHRoZXJlCj4+PiBpcyBubyBleHRlcm5hbCByZXNpc3Rvci4gVGhlIHB1bGwtdXAg
aXMgNjBrb2htcyBwZXIgdGhlIGRhdGFzaGVldC4KPj4+Cj4+PiBXZSBzaG91bGQgc2V0IHRoZSBi
aWFzIHdoZW4gaTJjIHBpbm11eCBpcyBlbmFibGVkLgo+Pgo+PiBTbywgeWVzIGluIHNvbWUgY2Fz
ZXMgd2hlbiB0aGUgb24tYm9hcmQgcHVsbC11cCBpcyBtaXNzaW5nLCB0aGUgb24tcGFkCj4+IHB1
bGwtdXAgaXMgcmVxdWlyZWQsIGJ1dCB0aGUgd2hvbGUgaWRlYSB3YXMgdG8gb25seSBhZGQgdGhl
IHB1bGwtdXAgcHJvcGVydHkKPj4gd2hlbiBuZWVkZWQuCj4+Cj4+IFNvIEkga25vdyB0aGUgcmVh
bCBtb3RpdmF0aW9uIGlzIGFnYWluIGFib3V0IHRoZSA0MHBpbiBoZWFkZXJzLCB3aGVyZQo+PiBz
b21lIGFwcGxpY2F0aW9ucyBkb24ndCBhZGQgYSBwdWxsLXVwIGFuZCBzdGlsbCB3YW50IHRvIGhh
dmUgaTJjIHdvcmtpbmcuCj4gRm9yIFNEL2VNTUMsIFNQSSBhbmQgVUFSVCB3ZSBoYXZlIHB1bGwg
dXAvZG93biBlbmFibGVkIGluIG1lc29uLWd4bC5kdHNpLgo+IEkgY2FuJ3QgcmVjYWxsIGlmIEkg
aGF2ZSBhc2tlZCB0aGlzIGJlZm9yZTogd2hhdCdzIHRoZSBydWxlIChvZiB0aHVtYikKPiBmb3Ig
aGF2aW5nIGJpYXMtcHVsbC11cC9kb3duIHZzLiBiaWFzLWRpc2FibGUgaW4gLmR0c2kgZmlsZXM/
Cj4gCj4gSW4gdGhlIHBhc3QgSSBoYWQgdG8gdHJhY2sgZG93biBpbmNvcnJlY3QgYmlhcy4KPiBJ
dCBnZXRzIGVzcGVjaWFsbHkgdHJpY2t5IHdoZW4gd2UgZG9uJ3QgaGF2ZSBzY2hlbWF0aWNzIGFu
ZCB0aGVyZSdzIG5vCj4gdS1ib290IHNvdXJjZXMgYXZhaWxhYmxlIGZyb20gdGhlIHZlbmRvciAo
SSBrbm93LCB0aGUgbGF0dGVyIHNob3VsZG4ndAo+IGJlIHBvc3NpYmxlIC0gYnV0IHRoYXQncyB0
aGUgd29ybGQgd2UgbGl2ZSBpbiB1bmZvcnR1bmF0ZWx5KS4KPiBJdCBtZWFucyB0aGF0IHdlIGNh
biBlbmQgdXAgd2l0aCBvbmUgb2YgZm91ciBjYXNlcyBmb3IgdGhlIGJpYXMgc2V0dGluZ3M6Cj4g
LSB0aGVyZSdzIGFuIGFjdHVhbCByZXNpc3RvciBvbiB0aGUgUENCIChwdWxsaW5nIHRoZSBwaW4g
dXAvZG93bikKPiAtIGhhcmR3YXJlIChTb0MpIGRlZmF1bHQgZm9yIHRoZSBwaW4KPiAtIHZlbmRv
ciB1LWJvb3QgY29uZmlndXJlcyBiaWFzIGZvciB0aGUgcGluIChidXQgd2UgZG9uJ3Qga25vdyBi
ZWNhdXNlCj4gd2UgZG9uJ3QgaGF2ZSB0aGUgc291cmNlcykKPiAtIHZlbmRvciBMaW51eCBjb25m
aWd1cmVzIGJpYXMgZm9yIHRoZSBwaW4gKGF0IGxlYXN0IHdlIGNhbiBkdW1wIHRoZQo+IC5kdGIg
YW5kIGhvcGUgdGhhdCB0aGUgYmlhcyBzZXR0aW5nIGlzIGluIHRoZXJlKQo+IAo+IFRoYXQncyB3
aHkgSSBsZWFuIHRvd2FyZHMgaGF2aW5nIHNhbmUgZGVmYXVsdHMgaW4gdGhlIFNvQy5kdHNpIChp
dAo+IHNlZW1zIHRoYXQgcm9ja2NoaXAgZG9lcyB0aGUgc2FtZT8pLgoKUmlnaHQsIGJ1dCBpbiB0
aGlzIGNhc2UgdGhlIGJpYXNlcyBuZWVkZWQgZm9yIGkyYyBpcyByYXRoZXIgZWFzeSB0byBmaWd1
cmUgb3V0LAphbmQgdGhlIHZlcnkgd2VhayA2MGtvaG1zIG9uIHRoZSBwYWQgd29uJ3QgYWZmZWN0
IGkyYyBpZiBhIHByb3BlciBQVSBpcyBvbgp0aGUgUENCLiBTbyBJJ2xsIHBpY2sgdGhpcyBvbmUs
IGFuZCB5ZWFoIGEgc2ltaWxhciBvbmUgc2hvdWxkIGJlIG5lZWRlZApmb3IgRzEyL1NNMSBhbmQg
bmV3ZXIgU29Dcy4KClJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdA
bGluYXJvLm9yZz4KCk5laWwKCj4gCj4gCj4gQmVzdCByZWdhcmRzLAo+IE1hcnRpbgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
