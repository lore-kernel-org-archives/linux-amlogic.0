Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92588C61DB9
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2026 08:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zYmMrQr6B0WWuI6Wd4DRt+Zu/TDaZZfcUqh88hS/mWY=; b=nIeScS0HRXW8oxZRNKzc69kc+c
	o68//vN9hqdLxdjx3nJxG4EO0j2a+azg/le1CJCAf0nouL2zJsVE8/XT8CeJt6gRH8F+2pmABGyig
	qB7jICAim9RA6zL+Vxi9et1RfRiLOJzUgZ6c2budiOWmY3X9SW1jXaILbgvFyTlN2uGcuDz31/xh5
	GQROWvpyvHdidMoYXyI6hPbl8INVXMRLh0KnVGKBBphPA1FNw4r0TwHpqaEaXo/1NPrgc3kvYWxui
	l+Q3O7FQPvYOcDdatHD/hjdgbvfIvB94jMV3oVXSoPwC3FpHjko6b7KNBc+A/2p+A0GFJp0gp6Mta
	it1FrKDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVlj-00000003g8p-3gHN;
	Thu, 27 Aug 2026 08:47:31 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVlg-00000003g7p-3oW1
	for linux-amlogic@lists.infradead.org;
	Thu, 27 Aug 2026 08:47:31 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-482ddbc11aaso1500700f8f.3
        for <linux-amlogic@lists.infradead.org>; Thu, 27 Aug 2026 01:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787820447; x=1788425247; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lJ8X5HHLYHRd3Rsk9popednopgUL8bXt5+/MmAQMSNo=;
        b=k7nnYkWPfRHx0UwVGvmQtP6qfFpgZJYeVVct3W5NimZWpAsUBMbQ+MPVCTJMNqGZEW
         Ajy4nk9jEM1avHV+uMyFYYHoZYQPi6CrtaRREN5sqhKYboLbspXc6uFRgESZeABmGIz4
         TGqrWS6kJv9dfLX1TBTqIwHn0rbhRpXp0HEePHNqjAmQDtAuIgu6GojqGEu5iyYbNV1q
         YgQLrMDY5PDEqz11hwitXo7qFSJv4kwLLCqiDETpKAXNhCxXLbz+7c8ZgKktBQhsEXzM
         QtOE/x1WeUl3xb2912MYRPlmu6h1JUQWksJTj2cO19kWbL4hyh6xzh1QJnWLr3ELv2tU
         Nhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787820447; x=1788425247;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lJ8X5HHLYHRd3Rsk9popednopgUL8bXt5+/MmAQMSNo=;
        b=C6vpBnxxanak/W5XwBZdT8KRYT2XpnWcJB2Fd0wE7vH8b6yGnG9457WbsnTskjgYZS
         i3zlNWmpne2ua82MhuLDE7wzQhwApQxmwUJd0a3cf43ctTArUKEXt72iGQigfagTHFGH
         ZXTXo73EhhUOsXs07tqJG9S/iTliNhBbnv1R7BEgqujuB9nKkjgSdKIwRmmnKChh4QM2
         U6AkLRt9ZdUOozt3AT/MS9JIByaDJGlucEWVJEhhUtVQppm4cAHwShA2j8IzSJGk1fjI
         030NPikgFvtNkvTb27uC5deXPeupSy99TO+2MOf8RIdFI0jYh5Wbc1Rgxp7pWNpq+Ine
         OU9g==
X-Forwarded-Encrypted: i=1; AHgh+RoQCB1AsU0Pus0YrwwUbfKt0bVsS0RSzK4XmGz6fUa37S0F5KKF6CZjRc+k01AmWcwk7qg8qB12C32HAAYf@lists.infradead.org
X-Gm-Message-State: AFuF++mRdGx1bba/aX/5KRqY42BnMTrKt0HDNYFiiP+rLxeKijCgFyq2
	f+zRFVyDz0nD7mNuGabK5VK3FheyNP/kxaMxAVnHT5FxGknL8YAJPopW5883jyeLgkM=
X-Gm-Gg: AR+sD11VcohJ7RF4IQQEJNe6mI10z8NXNLM9K+7Ud4z7IR7AW3jsGNr9TQrKa5BhiTU
	MnJVOHX8qRG6bqr5EiVj6WhSJL0XhvfLJgI3BV4GdvIYTnzEPOaMQJ5rts3qLBEHZ9iNeuTPTCj
	US93ncrehOeRxtu6CDKgaibRcTqvj7Z645GwDs23z8aEARLuxoutdTO0uSMwtRBph6YV54RS/BW
	Z9In+Ce2ucm3AzbiboYqXzGbBbh65AWGF2Bm/obpKURgN48aZ9v36vGt2Wn+4FPptcX3y6+PVR4
	4GO4wCuohRedL1t5yL5M/TCm1zAnZzsSpedeBHO/Ew08moxzxQn4cuPo9AEF443RHE4zZ10s1LP
	4iz98zIqwf7Bq/3MAOJ8rIFitJ3mWRG32fGeY2KepBJU18OHDZD5Nt7Mah164oV6AvkDhoqDQ2u
	D9fIhC/umvgQRubnfdmlIgPWS5jXtixV6TWao+dlo4VYGYHVLGC3V5DxsHRk5eLAN9/V1m
X-Received: by 2002:adf:e002:0:10b0:482:e1ce:d45c with SMTP id ffacd0b85a97d-482e26fbe90mr13212969f8f.21.1787820446621;
        Thu, 27 Aug 2026 01:47:26 -0700 (PDT)
Received: from [172.20.10.4] ([37.165.68.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28dc134sm7420726f8f.20.2026.08.27.01.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:47:26 -0700 (PDT)
Message-ID: <7c6b5334-c0ce-42d5-8548-c025acdc895b@linaro.org>
Date: Thu, 27 Aug 2026 10:45:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: t7: use the real UART pclk
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Lucas Tanure <tanure@linux.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20260818191159.11523-1-tanure@linux.com>
 <20260818191159.11523-2-tanure@linux.com>
 <c428305a-265c-4cc5-be01-be5b21dc22ca@amlogic.com>
 <6673edea-6822-4368-9374-29f92195fcf5@aliel.fr>
 <0969d872-faff-4b0f-81ad-972b7aa9bb7f@linux.com>
 <78721fe3-d9d0-4f85-a1ec-a01ebbf4f9a3@aliel.fr>
 <7c7f447d-8796-4f6e-b607-5251d9129665@linux.com>
 <5c8babac-0434-46fa-8919-a527d4179f7c@aliel.fr>
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
In-Reply-To: <5c8babac-0434-46fa-8919-a527d4179f7c@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_014729_010284_26A2C90C 
X-CRM114-Status: GOOD (  26.96  )
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

T24gOC8yNS8yNiAxMDo1NCwgUm9uYWxkIENsYXZlYXUgd3JvdGU6Cj4gT24gOC8yNC8yNiAxMToz
MiBBTSwgTHVjYXMgVGFudXJlIHdyb3RlOgo+PiBPbiAyNC8wOC8yMDI2IDEwOjE1LCBSb25hbGQg
Q2xhdmVhdSB3cm90ZToKPj4+IE9uIDgvMjMvMjYgMTozOSBQTSwgTHVjYXMgVGFudXJlIHdyb3Rl
Ogo+Pj4+IE9uIDE5LzA4LzIwMjYgMDg6MjUsIFJvbmFsZCBDbGF2ZWF1IHdyb3RlOgo+Pj4+PiBP
biA4LzE5LzI2IDQ6MzkgQU0sIFhpYW53ZWkgWmhhbyB3cm90ZToKPj4+Pj4+IEhpIEx1Y2FzLAo+
Pj4+Pj4KPj4+Pj4+IE9uIDIwMjYvOC8xOSAwMzoxMSwgTHVjYXMgVGFudXJlIHdyb3RlOgo+Pj4+
Pj4+IHVhcnRfYSBsaXN0cyB0aGUgMjRNSHogY3J5c3RhbCBmb3IgYWxsIHRocmVlIG9mIGl0cyBj
bG9ja3MsIGJlY2F1c2UKPj4+Pj4+PiB0aGUgVDcgY2xvY2sgY29udHJvbGxlciBkcml2ZXIgZGlk
IG5vdCBleGlzdCB3aGVuIHRoZXNlIGJvYXJkcyB3ZXJlCj4+Pj4+Pj4gYWRkZWQuCj4+Pj4+Pj4K
Pj4+Pj4+PiBUaGF0IGxlYXZlcyB0aGUgcmVhbCBVQVJUIGJ1cyBjbG9jayB3aXRob3V0IGEgdXNl
ciwgc28gdGhlIGtlcm5lbAo+Pj4+Pj4+IHR1cm5zIGl0IG9mZiB3aGVuIGl0IGRpc2FibGVzIHVu
dXNlZCBjbG9ja3MgYXQgdGhlIGVuZCBvZiBib290LCBhbmQKPj4+Pj4+PiB0aGUgYm9hcmQgaGFu
Z3MuCj4+Pj4+Pj4KPj4+Pj4+PiBQb2ludCB1YXJ0X2EgYXQgdGhlIHJlYWwgY2xvY2tzLCB0aGUg
d2F5IG1lc29uLXM0LmR0c2kgZG9lcywgYW5kIGRyb3AKPj4+Pj4+PiB0aGUgcGxhY2Vob2xkZXJz
IGZyb20gdGhlIHR3byBib2FyZCBmaWxlcy4KPj4+Pj4+Pgo+Pj4+Pj4+IEZpeGVzOiA0ZmVmMDU2
NTg4ZjUgKCJhcm02NDogZHRzOiBhbWxvZ2ljLXQ3LWEzMTFkMi1raGFkYXMtdmltNDogYWRkCj4+
Pj4+Pj4gaW5pdGlhbCBkZXZpY2UtdHJlZSIpCj4+Pj4+Pj4gRml4ZXM6IDZmMDQ4Y2M3YTYzNSAo
ImFybTY0OiBkdHM6IGFkZCBib2FyZCBBTjQwMCIpCj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogTHVj
YXMgVGFudXJlPHRhbnVyZUBsaW51eC5jb20+Cj4+Pj4+Pj4gQXNzaXN0ZWQtYnk6IENsYXVkZTpj
bGF1ZGUtZmFibGUtNQo+Pj4+Pj4+IC0tLQo+Pj4+Pj4+ICDCoMKgwqAgYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDctYTMxMWQyLWFuNDAwLmR0cwo+Pj4+Pj4+IHwgMiAtLQo+
Pj4+Pj4+ICDCoMKgwqAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDctYTMx
MWQyLWtoYWRhcy12aW00LmR0cwo+Pj4+Pj4+IHwgMiAtLQo+Pj4+Pj4+ICDCoMKgwqAgYXJjaC9h
cm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDcuZHRzacKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8IDQKPj4+Pj4+PiArKysrCj4+Pj4+Pj4gIMKgwqDCoCAzIGZpbGVz
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4+Pj4+Pgo+Pj4+Pj4+
IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1hMzEx
ZDItYW40MDAuZHRzCj4+Pj4+Pj4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dp
Yy10Ny1hMzExZDItYW40MDAuZHRzCj4+Pj4+Pj4gaW5kZXggY2FiMmVlOWVhMGQzLi5kY2JjZDA4
YTc4YjkgMTAwNjQ0Cj4+Pj4+Pj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2Ft
bG9naWMtdDctYTMxMWQyLWFuNDAwLmR0cwo+Pj4+Pj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1hbjQwMC5kdHMKPj4+Pj4+PiBAQCAtMzMsNyAr
MzMsNSBAQCB4dGFsOiB4dGFsLWNsayB7Cj4+Pj4+Pj4gIMKgwqDCoCB9Owo+Pj4+Pj4+Cj4+Pj4+
Pj4gIMKgwqDCoCAmdWFydF9hIHsKPj4+Pj4+PiAtwqDCoMKgwqDCoMKgIGNsb2NrcyA9IDwmeHRh
bD4sIDwmeHRhbD4sCj4+Pj4+Pj4gPCZ4dGFsPjsKPj4+Pj4+PiAtwqDCoMKgwqDCoMKgIGNsb2Nr
LW5hbWVzID0gInh0YWwiLCAicGNsayIsICJiYXVkIjsKPj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3RhdHVzID0gIm9rYXkiOwo+Pj4+Pj4+ICDCoMKgwqAgfTsKPj4+Pj4+PiBkaWZmIC0t
Z2l0Cj4+Pj4+Pj4gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1hMzEx
ZDIta2hhZGFzLXZpbTQuZHRzCj4+Pj4+Pj4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
YW1sb2dpYy10Ny1hMzExZDIta2hhZGFzLXZpbTQuZHRzCj4+Pj4+Pj4gaW5kZXggYzQxNTI1YTM0
YjcyLi42NzcwNjllNThmMzAgMTAwNjQ0Cj4+Pj4+Pj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0
cy9hbWxvZ2ljL2FtbG9naWMtdDctYTMxMWQyLWtoYWRhcy12aW00LmR0cwo+Pj4+Pj4+ICsrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1raGFkYXMtdmlt
NC5kdHMKPj4+Pj4+PiBAQCAtMjY2LDYgKzI2Niw0IEBAICZzZF9lbW1jX2Mgewo+Pj4+Pj4+Cj4+
Pj4+Pj4gIMKgwqDCoCAmdWFydF9hIHsKPj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Rh
dHVzID0gIm9rYXkiOwo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqAgY2xvY2tzID0gPCZ4dGFsPiwgPCZ4
dGFsPiwKPj4+Pj4+PiA8Jnh0YWw+Owo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqAgY2xvY2stbmFtZXMg
PSAieHRhbCIsICJwY2xrIiwgImJhdWQiOwo+Pj4+Pj4+ICDCoMKgwqAgfTsKPj4+Pj4+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDcuZHRzaQo+Pj4+
Pj4+IGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDcuZHRzaQo+Pj4+Pj4+
IGluZGV4IGNjMzcxZmNkMTg5Ni4uNzg0NzU4MmU3N2VkIDEwMDY0NAo+Pj4+Pj4+IC0tLSBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LmR0c2kKPj4+Pj4+PiArKysgYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny5kdHNpCj4+Pj4+Pj4gQEAgLTU4
Nyw2ICs1ODcsMTAgQEAgdWFydF9hOiBzZXJpYWxANzgwMDAgewo+Pj4+Pj4+ICDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjb21wYXRpYmxlID0gImFtbG9naWMsdDctdWFydCIsCj4+Pj4+Pj4gImFtbG9naWMsbWVzb24t
czQtdWFydCI7Cj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDAgMHg3ODAwMCAweDAgMHgx
OD47Cj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludGVycnVwdHMgPSA8R0lDX1NQSSAxNjgKPj4+Pj4+
PiBJUlFfVFlQRV9FREdFX1JJU0lORz47Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbG9ja3MgPSA8Jnh0YWw+LAo+
Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPCZjbGtjX3BlcmlwaHMKPj4+Pj4+PiBDTEtJ
RF9TWVNfVUFSVF9BPiwKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDwmeHRhbD47Cj4+
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBjbG9jay1uYW1lcyA9ICJ4dGFsIiwgInBjbGsiLCAiYmF1ZCI7Cj4+Pj4+Pj4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4+Pj4+Cj4+Pj4+PiBJ
IGFncmVlIHdpdGggbW92aW5nIHRoZSBVQVJUIGNsb2NrIGNvbmZpZ3VyYXRpb24gdG8gdGhlIERU
U0kgZmlsZS4KPj4+Pj4+IEhvd2V2ZXIsIGl0IHNlZW1zIGEgbGl0dGxlIG9kZCB0byBrZWVwIHRo
ZSBYVEFMIGNsb2NrIGRlZmluaXRpb24gaW4KPj4+Pj4+IHRoZQo+Pj4+Pj4gRFRTLCBhcyB0aGUg
YWxpYXMgbWF5IG5vdCBiZSBjb25zaXN0ZW50IGFjcm9zcyBkaWZmZXJlbnQgYm9hcmRzLCB3aGlj
aAo+Pj4+Pj4gY291bGQgcmVzdWx0IGluIGNvbXBpbGF0aW9uIGVycm9ycy4gQ291bGQgd2UgbW92
ZSB0aGUgWFRBTCBjbG9jawo+Pj4+Pj4gZGVmaW5pdGlvbiB0byB0aGUgRFRTSSBhcyB3ZWxsLCBz
aW1pbGFyIHRvIG90aGVyIEFtbG9naWMgU29Dcz8KPj4+Pj4KPj4+Pj4gSXQgc2VlbXMgc2ltaWxh
ciB0byBjaGFuZ2VzIGluIHRoaXMgc2VyaWVzIDoKPj4+Pj4KPj4+Pj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjYwNDIwLWFkZC1ibHVldG9vdGgtdDctdmltNC0KPj4+Pj4gdjQtMC05
NTA1ZGYwZTcwMTZAYWxpZWwuZnIvCj4+Pj4+Cj4+Pj4+IFdoYXQgZG8geW91IHRoaW5rID8KPj4+
Pj4KPj4+PiBUaGFua3MgZm9yIHBvaW50aW5nIG91dCB0aGF0IHNlcmllcywgdGhvdWdoIEkgd2Fz
bid0IGF3YXJlIG9mIGl0Lgo+Pj4+IEFuZCBhZnRlciByZWFkaW5nIEkgZG9uJ3QgYWdyZWUgd2l0
aCBpdC4gVGhlIGNsb2NrcyBhcmUgbm90IHJlZHVuZGFudCwKPj4+PiB0aGV5IGFyZSB0aGVyZSBi
ZWNhdXNlIHdlIGFncmVlZCBzb21ldGltZSBhZ28gdGhhdCB4dGFsIGJlbG9uZ3MgdG8gdGhlCj4+
Pj4gYm9hcmQgZmlsZXMuCj4+Pj4gU28gSSBzdGlsbCB2b3RlIGZvciBteSBjaGFuZ2UgaW4gdjIs
IHRoYXQgSSB3aWxsIHNlbmQgaW4gYSBmZXcgbWludXRlcy4KPj4+Cj4+PiBJIGRvbid0IGdldCB3
aHkgaXQgd291bGQgYmUgYmV0dGVyIHRvIGRlZmluZSB0aGUgZXhhY3Qgc2FtZSBjbG9ja3MgaW4K
Pj4+IGVhY2ggRFRTIGZpbGUuCj4+Pgo+Pj4gVGhlIHh0YWwgcmVjb21tZW5kZWQgY2hhcmFjdGVy
aXN0aWNzIHByb3ZpZGVkIGF0IHRoZSBTT0MgbGV2ZWwgY2FuIGJlCj4+PiBkZWZpbmVkIGluIHRo
ZSBEVFNJIGFuZCBvdmVycmlkZGVuLCBpZiByZWFsbHkgbmVjZXNzYXJ5LCBpbiB0aGUgRFRTLgo+
Pj4KPj4gSGkgUm9uYWxkLAo+Pgo+PiBUaGUgcHJlZmVyZW5jZSBmb3Iga2VlcGluZyB4dGFsIGlu
IGJvYXJkLXNwZWNpZmljIC5kdHMgZmlsZXMgcmF0aGVyIHRoYW4KPj4gdGhlIFNvQyAuZHRzaSBj
b21lcyBkb3duIHRvIERUIGhhcmR3YXJlIG1vZGVsaW5nIHByaW5jaXBsZXMgYW5kIHVwc3RyZWFt
Cj4+IG1haW50YWluZXIgZ3VpZGVsaW5lczoKPj4KPj4gSGFyZHdhcmUgVG9wb2xvZ3k6IFRoZSB4
dGFsIGlzIHBoeXNpY2FsbHkgbG9jYXRlZCBvbiB0aGUgYm9hcmQgUENCLCBub3QKPj4gaW5zaWRl
IHRoZSBTb0Mgc2lsaWNvbi4gVGhlIC5kdHNpIGZpbGUgbW9kZWxzIHRoZSBTb0Mgc2lsaWNvbiBp
bnRlcm5hbAo+PiBhcmNoaXRlY3R1cmUgKGNsb2NrIGNvbnRyb2xsZXJzLCBJUHMsIHJlZ2lzdGVy
cyksIHdoZXJlYXMgLmR0cyBmaWxlcwo+PiBkZXNjcmliZSB0aGUgcGh5c2ljYWwgYm9hcmQgbGF5
b3V0IHN1cnJvdW5kaW5nIGl0Lgo+Pgo+PiBBdm9pZGluZyBJbXBsaWNpdCBBc3N1bXB0aW9uczog
RGVmaW5pbmcgYSBkZWZhdWx0IDI0TUh6IHh0YWwgaW4gLmR0c2kKPj4gYXNzdW1lcyBldmVyeSBU
NyBib2FyZCB3aWxsIHVzZSB0aGUgc2FtZSBvc2NpbGxhdG9yIGNvbmZpZ3VyYXRpb24uIElmIGEK
Pj4gY3VzdG9tIGJvYXJkIGRlc2lnbiB1c2VzIGEgZGlmZmVyZW50IGNyeXN0YWwgZnJlcXVlbmN5
IG9yIGFuIGV4dGVybmFsCj4+IGNsb2NrIGdlbmVyYXRvci9UQ1hPLCBvdmVycmlkaW5nIGEgLmR0
c2ktbGV2ZWwgbm9kZSBjYW4gbGVhZCB0byBtZXNzeSBEVAo+PiBvdmVycmlkZXMgb3Igc2lsZW50
IGNsb2NrIHJhdGUgbWlzbWF0Y2hlcyBpZiBmb3Jnb3R0ZW4uCj4+Cj4+IFVwc3RyZWFtIERUIE1h
aW50YWluZXIgUG9saWN5OiBLZXJuZWwgRFQgbWFpbnRhaW5lcnMgY29uc2lzdGVudGx5IHB1c2gK
Pj4gdG8ga2VlcCBib2FyZC1sZXZlbCBoYXJkd2FyZSBleHBsaWNpdGx5IGRlY2xhcmVkIGluIHRo
ZSBib2FyZCAuZHRzIGZpbGVzCj4+IHRvIHJlZmxlY3QgYWN0dWFsIHBoeXNpY2FsIGJvYXJkIGNv
bXBvbmVudHMuCj4+Cj4+IFRoYXQgc2FpZCwgSSBhY2tub3dsZWRnZSB0aGUgdHJhZGUtb2ZmIGlz
IG1pbm9yIGJvaWxlcnBsYXRlIGR1cGxpY2F0aW9uCj4+IGFjcm9zcyBib2FyZCBEVFMgZmlsZXMu
IElmIHRoZSBBbWxvZ2ljIFNvQyBtYWludGFpbmVycyBwcmVmZXIgc2V0dGluZyBhCj4+IGRlZmF1
bHQgMjRNSHogeHRhbCBpbiBhbWxvZ2ljLXQ3LmR0c2kgdG8gbWF0Y2ggb2xkZXIgU29DIGdlbmVy
YXRpb25zLCBJCj4+IGFtIG9wZW4gdG8gdXBkYXRpbmcgaXTigJRwcm92aWRlZCB0aGUgbWFpbnRh
aW5lcnMgZXhwbGljaXRseSBwcmVmZXIgdGhhdAo+PiB0cmFkZW9mZiBvdmVyIHN0cmljdCBEVCB0
b3BvbG9neSBtb2RlbGluZy4KPj4KPiAKPiBIaSBMdWNhcywKPiAKPiBUaGFuayB5b3UgZm9yIHRo
aXMgZGV0YWlsZWQgZXhwbGFuYXRpb24uCj4gSSB3YXMgcmVmZXJyaW5nIHRvIHRoZSBsYXN0IHBh
cmFncmFwaCBvZiB0aGUgRFRTIGNvZGluZyBzdHlsZToKPiAKPiBIYXJkd2FyZSBjb21wb25lbnRz
IHRoYXQgYXJlIHByZXNlbnQgb24gdGhlIGJvYXJkIHNoYWxsIGJlIHBsYWNlZCBpbiB0aGUKPiBi
b2FyZCBEVFMsIG5vdCBpbiB0aGUgU29DIG9yIFNvTSBEVFNJLiBBIHBhcnRpYWwgZXhjZXB0aW9u
IGlzIGEgY29tbW9uCj4gZXh0ZXJuYWwgcmVmZXJlbmNlIFNvQyBpbnB1dCBjbG9jaywgd2hpY2gg
Y291bGQgYmUgY29kZWQgYXMgYQo+IGZpeGVkLWNsb2NrIGluIHRoZSBTb0MgRFRTSSB3aXRoIGl0
cyBmcmVxdWVuY3kgcHJvdmlkZWQgYnkgZWFjaCBib2FyZCBEVFMuCgpUaGlzIGlzIHdoYXQgd2Fz
IGRvbmUgZm9yIHF1YWxjb21tIFNvQ3MsIHdlIGNvdWxkIGRvIGl0IGZvciBBbWxvZ2ljIGFzd2Vs
bC4KCj4gCj4gSSB1bmRlcnN0YW5kIGdvaW5nIHRvIHN0cmljdCB0b3BvbG9neSBpcyBiZXR0ZXIs
IHRoYXQgbWVhbnMgd2UgbXVzdAo+IGFwcGx5IHRoZSBzYW1lIHJ1bGVzIHRvIG5ldyBBbWxvZ2lj
IFNPQ3MsIHJpZ2h0ID8KPiAKPiBEbyB3ZSBuZWVkIHRvIG1vdmUgb3RoZXIgY2xvY2tzIGFuZCBh
c3NpZ25lZC1jbG9ja3MgcHJvcGVydGllcyB3aGljaCB1c2UKPiB0aGUgeHRhbCB0byB0aGUgYm9h
cmQgRFRTIGFzIHdlbGwgKHN1Y2ggYXMgY2xrY19wZXJpcGhzIG9yIHNkX2VtbWMpPwo+IAoKTm8g
c2luY2UgaXQgZGVzY3JpYmVzIGEgU29DIGNvbmZpZ3VyYXRpb24gdXNpbmcgWFRBTCwgaXQgc2hv
dWxkIGJlIGluIHRoZSBkdHNpLgoKTmVpbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
