Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D731C4829A
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 08:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOX0svRwVS+UCYrOPL3sE5UR08PNs4NqXCZK23pTRLI=; b=f9sKOW0hiwhh0MLhXQhwjP24PA
	/2TaKz526nXOc1mGK4/L3Hyr6dAyxv3ZQhAoEfOh8/kiE5Ta9KFk8Aj+lfKOVoRjRzLjP+2apjYwY
	/Tk6jRZoVmEGnvu/LTZhVOktV0Ugu4H7b1gNf7sMDQs4vBIlrD+5wmXZxrA/zOY9ajFBmveSkY3yE
	gif8E1OOaXY42qk+FFEpPcrLCaCgTse3tyfsvaa/ZkGbq+vk8Wykxsyaj1oLt5P2byAn59IPqAds3
	cDx9oKF4V6u+FEPkdbAK8ng/LAUbWsQ9zrQhSXb/mX5CxhTa1+5bYAZaZITdGSWtMD323x7DvoOvA
	v4pUk03g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZoPF-00000008THe-0GFX;
	Tue, 13 Feb 2024 08:44:45 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZoP7-00000008TE4-1041
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 08:44:42 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-33adec41b55so413448f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 00:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707813875; x=1708418675; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rMCxHZt+OW+R7teelRvBTuyGlS2wgoQLLpCjKszsBeY=;
        b=DOhJIuyz5djlADAun/Cia3iMEbJ0uq15w3ChqqulrArGwGIGCw8Uxt0A+QdalF1Atv
         EPUSFYUH0othpzwZZuv7XdviEEXNvtlTIvZEBVnPDNcAM3gcZLwc6vqx18lGaZ5d30Sr
         HuVp9iV+JNeP74sS4Dp+pTW3r2RSg3TvHym2H35Ow5v2vg9Oq+PZX4LTnPvBvEWUSdx+
         aBijNuYeuLlF6H3XTeQbxTddKLfrLd4CZXYt9RnSVefL1SJcc74KK8lRdeAdr3E01vCX
         h53oiclPiZtoQPe8oM99Wvp/L61ILWClcHQKW7Kw8EZ9HyWp9Q5wcoQSq+IrzSbyI/sn
         2ILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707813875; x=1708418675;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rMCxHZt+OW+R7teelRvBTuyGlS2wgoQLLpCjKszsBeY=;
        b=Mp2kjoMK6UDe9tUFklbj6y/2FlnfTGAMmNvQ+M7zAUnEBIPKO1m4jRhjpSLQLjqMat
         zD1oLfhRdtgNtZLgTSMYywcwQx68HrEoFWgk1GpQjR/e7Et3oGXYlQztPDRossZNuMQ8
         Dft3oCtabFE9eXkBkn4Woy86R5hgsLRBQe6ci+IENNwDlSnd+oBy/su4+qWYFgkCrOkk
         wdLA62vQGemKfXU1gQGxBmb2BVW/0CNNFxxCmUKAUwIuxhvLgd5gPwmewpXvcyO/uuRh
         UTZgm1Tmmxjf7G5PH5vlMgT1Qxetlq4zulB74xFtRieW5fIVxG9hdzLHzHrtwdB86D9+
         0JGw==
X-Forwarded-Encrypted: i=1; AJvYcCUEUWy7jwi1GHoAdDKfTmpz/S/fo0LWB6XOaXnRKbVEdVc6h2qQCpMOiWwukzphIDftZxZmcGFYnD9wCkUbeva8iKKuxYIzCquLC87DEkiwjYQ=
X-Gm-Message-State: AOJu0Yx9TvZORIZBD6q7SKM7lfVhttC6gpM6Au4K7zY4KdtvANyR56Ta
	aMHrWU0krFANhw5V67WX6FmiYDWGLT78CBTQ3doz/vgGXMoXVvNR2eVyp1FNEgWHYTzV6SFoQDX
	ohhPTKA==
X-Google-Smtp-Source: AGHT+IEmlWnzKJ+yxoUoGbwMK1UjDJK+Qf1UAbW+JpoFoXwJN9oBbQp+3Aq/Uh3IlEtzIf/tZlzqgQ==
X-Received: by 2002:a5d:60d0:0:b0:33b:8260:ecbf with SMTP id x16-20020a5d60d0000000b0033b8260ecbfmr3523747wrt.14.1707813875446;
        Tue, 13 Feb 2024 00:44:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVnzpUCkVtT4CZJSNIhrw6763LItTjdEaTSyWVPrBlNAzul/X8PhQG52V5MCSDiEt0jZR4Md7O1gNRakXOBih7GqsLBGJf1Z9T5+sAk0iZptH7PCDNuYMErRECM+NCS/i4s5udwEtf+HPAlLa2HmuBFXkOG26bhh78CeOdBmO9nma8k8WReHT5xvUb25Q59/FOmdvK4YGRjHt3smY/Fezet6RJpRmCw1Q+bfzIPhmCFH9+fxc46dI9kzS1T/TTCtQ3m8wA9bWVWPOUAWt+8xkeT4rhe29NBpEITeNbp3HOKMS9RqCb9tTSwKmadEFc11z9aXi0SDeZfJHNgcQ==
Received: from ?IPV6:2a01:e0a:982:cbb0:6dfb:5e62:c51f:304b? ([2a01:e0a:982:cbb0:6dfb:5e62:c51f:304b])
        by smtp.gmail.com with ESMTPSA id n16-20020a5d67d0000000b0033af26545c8sm8899462wrw.50.2024.02.13.00.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 00:44:35 -0800 (PST)
Message-ID: <fb26c6cc-53d8-40c3-9248-d41f7598e2e8@linaro.org>
Date: Tue, 13 Feb 2024 09:44:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 0/4] Add support for Freebox fbx8am boards
Content-Language: en-US, fr
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Marc Gonzalez <mgonzalez@freebox.fr>, AML
 <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <77edaf7e-aeb5-4fc0-8b69-85dcddfd5a58@freebox.fr>
 <64f65168-c7b0-4365-8d0a-e57b47797d95@linaro.org>
 <6274df9e-bda6-44b8-aa7e-e4bba5c7c96a@linaro.org>
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
In-Reply-To: <6274df9e-bda6-44b8-aa7e-e4bba5c7c96a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_004438_358943_E4774247 
X-CRM114-Status: GOOD (  11.05  )
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

T24gMTMvMDIvMjAyNCAwOTo0MSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAxMy8w
Mi8yMDI0IDA5OjM4LCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4gSGkgTWFyYywKPj4KPj4gT24g
MTIvMDIvMjAyNCAxODo0NywgTWFyYyBHb256YWxleiB3cm90ZToKPj4+IEFkZCBzdXBwb3J0IGZv
ciBGcmVlYm94IGZieDhhbSBib2FyZHMKPj4+Cj4+PiBNYXJjIEdvbnphbGV6ICg0KToKPj4+ICAg
wqAgZHQtYmluZGluZ3M6IHZlbmRvci1wcmVmaXhlczogYWRkIGZyZWVib3gKPj4+ICAgwqAgZHQt
YmluZGluZ3M6IGFybTogYW1sb2dpYzogYWRkIGZieDhhbSBiaW5kaW5nCj4+PiAgIMKgIGFybTY0
OiBkdHM6IGFtbG9naWM6IGFkZCBmYng4YW0gYm9hcmQKPj4+ICAgwqAgYXJtNjQ6IGR0czogYW1s
b2dpYzogYWRkIGZieDhhbSBEVCBvdmVybGF5cwo+Pj4KPj4+ICAgwqBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAg
MSArCj4+PiAgIMKgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVm
aXhlcy55YW1swqDCoMKgwqAgfMKgwqAgMiArCj4+Cj4+IFRoaXMgY2hhbmdlIGRvZXNuJ3QgYXBw
bHkgb24gdG9wIG9mIGVpdGhlciB2Ni44LXJjMSBvciBsaW51eC1uZXh0LCBjb3VsZCB5b3UgcmVi
YXNlIG9uIHY2LjgtcmMxID8KPiAKPiBQbGVhc2UgZG9uJ3QgYXBwbHksIEkgaGF2ZSBkb3VidHMg
YmluZGluZ3Mgd2VyZSBldmVyIHRlc3RlZC4KCkkgbmVlZCB0aGUgcGF0Y2hlcyB0byBhcHBseSB0
byBiZSBhYmxlIHRvIGNoZWNrIHRoZW0hCgpOZWlsCgo+IAo+IEJlc3QgcmVnYXJkcywKPiBLcnp5
c3p0b2YKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
