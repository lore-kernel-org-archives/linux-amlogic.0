Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F849C02183
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2025 15:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XlfnaWkQuIP2ECqxkclqLp0XvOWDcojiBnE+Js2UGDY=; b=3WjIN7QmZ0cm3c
	uVlpAdUZDNYP9jJw51YKfRqe/GtDbTPXR6zMddpOxhFQ2iH5HCR9NP+Cex04e47VnW11hcEJPaAYm
	lk7tddlfv3O02zvyU5kDnaFl9XjCc7VCrVbyZCcW4ADMeKOm1SIige4VSGOZEtF+5ho7k2o7hVT40
	zKGacF3LwuP3q5XtN/mmt5PKll+/5SwnYm4u09o2Pe57a4ggpCgW7pviUyM9kya7h7aO9HKLGX7p9
	ZXpPD1JZgMrCEk6yud0EPEj2/ErEHw2eIVA7cFhtxBrM61c6QxilSLVvEVHUWK5lPevCYSVLxIh4z
	v0A+aS7a3BYl3tjT6zuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYRjm-0000000FJzt-0OBT;
	Thu, 16 Jan 2025 15:24:50 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYRiV-0000000FJtZ-21vB
	for linux-amlogic@lists.infradead.org;
	Thu, 16 Jan 2025 15:23:32 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so609910f8f.0
        for <linux-amlogic@lists.infradead.org>; Thu, 16 Jan 2025 07:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737041009; x=1737645809; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mlroyb/jMU2zXy9fkhNJx0reIXqOwAkc96UjIWcJbcc=;
        b=K7YcNxEqd1cK5EEbf7YzbRPxPrGMC0HhPCyRYmD2SdaN9mUpEsROZh707kp1eoIcU1
         Tpqqz+QHDE6Q0CDGRE0+FixJYsZ9U9l7j8n/qLweX5jpjpCZcDYlWLgqL3yM6ahjoKgm
         LJ98YxUjGc/QtnDPynj+0pGZgS9xqzfH8S1cP8q00LxafZuUiUEPA6da/swN4SpCf9HT
         W76wkeGMmBBeW0DoMEPPUYAjSINv/GJYLzMQpKwcJ2Mw9ndluBXqQCo+q5sv7Hgd37ev
         zpPJpnAQmyxw9ZKbbsfku4hWksBKv+wOQbiTTkKaLlH6ehnJ3RrQ2yWaAEharvtVIlWP
         MXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737041009; x=1737645809;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mlroyb/jMU2zXy9fkhNJx0reIXqOwAkc96UjIWcJbcc=;
        b=wXWw1lcGHUiNddKegJRVh5YUihRUrl99KFjRZoIq85Xi8jy592ENT75pHJ2rB+OYRR
         j1nSKRzCcI2USKzD2oV7vODIzDTvmUdtMiyFTXFzHMRDv4zs57Y7fUFhdAbMPd0VnRzL
         j4pDxxFVEJPzUkYR8Z7Bg1q4HwFmUUf42OHSq8TB8A6X9EKNyjCIMRSgjoYvYeVp/TVW
         UVy2dlJl9c4cK9q5CcmKMVV+GXOqZB8v6QRtTdGDeFv1gDb/geMINfds35+JhC/NUw41
         dXDzttUkSL0KBAs3UVxVlwoJiQUp4Ded/PyitqYF2VgQEZnrEQP5GkMjcn7y9wQtjIjZ
         tVtQ==
X-Gm-Message-State: AOJu0YwoteMBkx848owEt1XX4wgjlYywYc3eV95qGbrauA4p/lXbgzLu
	RyCdE202UQY4ehEINBJuSUbNx1bOYHwu+cVnLxdHRx0jbO8u3tJNkTwO/pJv2ic=
X-Gm-Gg: ASbGncsd6wq4b7yMWsTFNVyFchRPOG/ayZEvadfNNBwmuaJbHRPJn0tD7nCD+WGFaCm
	HXX2fJZAPVDJag53Lb4znEDhxKoQLsE7I7qbvEb/2m1KlAuhsSSfo8UGcYDJZA8eSDiBH5cuFhi
	Cqmx+kDA8m5Xpc41nQCRDaZT3mmxk/YDg3TecL05z6A9kirhFJdJo+ubExjV2IbkpnKZI1KSoGn
	xOtgylmcMOrmIHfNDMvWRaV4o5SVbWqxCZO6V360Kl2Rwl6xqJudI9NqfPfcJNN7al50mnb6NbR
	4r3a/Kr6ukMjNsMZ1gd/clrJ/UgaX2UNAg==
X-Google-Smtp-Source: AGHT+IH3ev2Y3m0geQ3OUPWjCKlIaWRioGBD546DlWZImq11tIxFW9OCinJY3Zz6eI2GrZ4WeAHyFw==
X-Received: by 2002:a05:6000:1564:b0:38a:8d32:274e with SMTP id ffacd0b85a97d-38a8d322b18mr26448297f8f.5.1737041009433;
        Thu, 16 Jan 2025 07:23:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4adf:8d3f:1419:e65d? ([2a01:e0a:982:cbb0:4adf:8d3f:1419:e65d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c75298adsm63384035e9.30.2025.01.16.07.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 07:23:28 -0800 (PST)
Message-ID: <724c4e81-184a-489c-aaaa-85c21a19b64a@linaro.org>
Date: Thu, 16 Jan 2025 16:23:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Amlogic drivers updates for v6.14
From: Neil Armstrong <neil.armstrong@linaro.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <d22513cc-c326-443c-982b-78adf755d3dc@linaro.org>
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
In-Reply-To: <d22513cc-c326-443c-982b-78adf755d3dc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_072331_515311_E3BC04F8 
X-CRM114-Status: GOOD (  10.08  )
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

SGksCgpPbiAwNi8wMS8yMDI1IDE1OjI1LCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPiBIaSwKPiAK
PiBIZXJlJ3MgdGhlIGZpbmFsIERUIGJpbmRpbmdzIGNoYW5nZSB0aGF0IHdpbGwgZ2l2ZSAxMDAl
IHN1Y2Nlc3MgaW4gQW1sb2dpYwo+IEFSTTY0ICYgQVJNNjQgRFQgQmluZGluZ3MgY2hlY2tzLCB3
aXRoIHRoZSBtbWMtc2xvdCBiaW5kaW5ncyBjaGFuZ2Ugcm91dGVkCj4gdmlhIHRoZSBNTUMgdHJl
ZS4KCkdlbnRsZSBwaW5nLCBpdCBkb2Vzbid0IHNlZW0geW91IHB1bGxlZCB0aGlzIFBSLgoKVGhh
bmtzLApOZWlsCgo+IAo+IFRoYW5rcywKPiBOZWlsCj4gCj4gVGhlIGZvbGxvd2luZyBjaGFuZ2Vz
IHNpbmNlIGNvbW1pdCA0MDM4NGM4NDBlYTE5NDRkN2M1YTM5MmU4OTc1ZWQwODhlY2YwYjM3Ogo+
IAo+ICDCoCBMaW51eCA2LjEzLXJjMSAoMjAyNC0xMi0wMSAxNDoyODo1NiAtMDgwMCkKPiAKPiBh
cmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPiAKPiAgwqAgaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYW1sb2dpYy9saW51eC5naXQg
dGFncy9hbWxvZ2ljLWRyaXZlcnMtZm9yLXY2LjE0Cj4gCj4gZm9yIHlvdSB0byBmZXRjaCBjaGFu
Z2VzIHVwIHRvIDk2MGE0MTQwYWRlOGY2YmE0NGU3OGRjNDBiODBiYmYyNzIwMjc4MDU6Cj4gCj4g
IMKgIGR0LWJpbmRpbmdzOiBzb2M6IGFtbG9naWMsbWVzb24tZ3gtaGhpLXN5c2N0cmw6IERvY3Vt
ZW50IHRoZSBTeXN0ZW0gQ29udHJvbCByZWdpc3RlcnMgZm91bmQgb24gZWFybHkgTWVzb24gU29D
ICgyMDI0LTEyLTExIDA5OjQ5OjQ5ICswMTAwKQo+IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBBbWxvZ2ljIGRyaXZl
cnMgY2hhbmdlcyBmb3IgdjYuMTQ6Cj4gLSBEb2N1bWVudCB0aGUgU3lzdGVtIENvbnRyb2wgcmVn
aXN0ZXJzIGZvdW5kIG9uIGVhcmx5IE1lc29uIFNvQwo+IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBOZWlsIEFybXN0
cm9uZyAoMSk6Cj4gIMKgwqDCoMKgwqAgZHQtYmluZGluZ3M6IHNvYzogYW1sb2dpYyxtZXNvbi1n
eC1oaGktc3lzY3RybDogRG9jdW1lbnQgdGhlIFN5c3RlbSBDb250cm9sIHJlZ2lzdGVycyBmb3Vu
ZCBvbiBlYXJseSBNZXNvbiBTb0MKPiAKPiAgwqAuLi4vYmluZGluZ3Mvc29jL2FtbG9naWMvYW1s
b2dpYyxtZXNvbi1neC1oaGktc3lzY3RybC55YW1sIHwgMTQgKysrKysrKysrKysrKysKPiAgwqAx
IGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQo+IAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
