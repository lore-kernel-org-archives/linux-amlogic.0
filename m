Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9BBFE51FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Apr 2026 09:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1HX/X/vZlhv5OpFR/CGMGPXyiYWk7wsGRtSpiM4uFIc=; b=ju6cYT8a7nkTdICGqvi8KyVlJY
	sQ8ShXkY8iP5OqZIipOc9MZtYTCTlZ73Qbs4C1Tcn4Pz3Nov63lTemldSObR2gvYMDjPaa0BUYQeW
	2XtUeaujru35vlI2+agWMdNVwGrkHlB0B1cEEGhxJRX4CaGpypJG+1Vd3BkYbHBYsKmRoKcR0DNHt
	wn7ZSICvj3BZ6KipC3ihn4A6wBb9DSWOYC5NnCsPXuRKr7HcwYxmHCpw1Ym0uzEkMbKU3zqfR9aU1
	B0rGJWWzGfq3UkdijJPTxPKm+NMFaUgHfbAn0F/SssjeWTVkFHhVzT/RFZqUav9eHXp/SDJc1Swhq
	Q7RpZpQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDG3-0000000CyQZ-1Byk;
	Fri, 24 Apr 2026 09:55:35 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDFx-0000000CyOK-0pvk
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Apr 2026 09:55:33 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-488b150559bso60867275e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Apr 2026 02:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777024527; x=1777629327; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OrfueS0M3ksdEe4kTwzYyRrLHN8xQEsX3ULqrEC+KDU=;
        b=HJ+OHtQi6iadCr14XNlkrtbaSGtIZlA8p89kvjKU6WiIqTmzOPWLiGPlLONsTN6rkd
         fKwedQxuVmakF5eNO6eZvBekhdcjw56nkQB3fGECFC5FSIempzwJeFetVY/zQeKwKZMb
         MUmT2lbg5kqr+zJnrKUR+Rlxk40Kzf8HMnfYyb3TzTr1pZoUQ/MHCNliaJL5j2rVnAG5
         MqM1CPuUhHMjmzGqojGb+wTY2y8pE0x1XuYBaLdfF0VfWcza9jq9wvYG4XPTir6Eg+kd
         vdQeITIio2RkayTI5icMWIAEsdgGdXfOEbArsimqJOMu5EUHkPauHTZh9YhwX0WNxmBO
         b/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024527; x=1777629327;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OrfueS0M3ksdEe4kTwzYyRrLHN8xQEsX3ULqrEC+KDU=;
        b=Br6dKwUvk60576U2GclNIhADrkN4cirKOr1GNC9+ADIt5/46WdXMc+5ogrStrMSkzx
         cCsVwdDdLX833bm1Pn9FPR7SVVMPrlejWX6y/UBCJTvMoSVdpk3E7e36S9AmmEKApH/h
         0zwgFssUZOasRTVRWUvMOKEz8fjLXYpsP+SfSrc2wQkmW0D2VIrLBpik0fzaJcC4jW72
         DLk4fFh6cEvooUYaxNEj8VUHq2rIb3xSiA9s9qojS/eNxwPfePHZ1yLJAHwmzCtOcH9s
         gzuB+UBhHV8Nx9dMFvknPdM4gIJyzPM7Al5IpvyS344ChOVZ4jm+IQZVhEfRhww433yE
         UEGg==
X-Gm-Message-State: AOJu0YxRdhJjtXMCHNrRmflc+oc+2LNQ4dn1ZxNIrels/9kggO/h5i4Y
	3AODE6LDcZ5slLhGbcOC8Zfqn8KAN1El8/4VnwSmwPN4Tst8Xjg600XrIwGnm7bn+Kg=
X-Gm-Gg: AeBDieuwJ/BAuAgTriJEW+4ouAROP1vJGBBlNU6sDB8Q8fuNX+2cyrpbfo/DZHIQ212
	t3W340f6iH5KFkXZgetMjaDeatR3W/wQVTct1EEEs8bDGNNz3xLKEvWsA23J8aXwmuOhxb2kSZK
	CDfpJoZieaP2jUm7EqFnC10/KFuwIBUKOmEUfXeNV8FWc9j5SAtrgdL39WEp+5apgrGKi2irY8U
	/ipkwQrpT61iVkRCYuRrcWLgIu+ZNDdjdOcPzIWHiuxEx6OcPuG/j8UqtIlDmvFbNeQ6MzC/vFg
	2LjY5OI5OJlPfl6cYZLJ0xKxM9DZTYH/pfko+92dSttSw6mM5DmXh1feWUryfpdwap+XmFk51fb
	6NnBldSVtxGB+Yq+Dyre0fqd3lLfcdh8ZexaATMv/cZBq4bOVsQsPOZ8qsBQa4zgSOdaaFUNTca
	Vrxjlm6nHTY0j1RB0L8QPtLZzL9rGiOUK8ef4wB0bSlMUKCKUAUhTeXAQPbIVDLNvE9RB6V79Hz
	5Ahj9M4UxiilAOLZw==
X-Received: by 2002:a05:600c:34c7:b0:489:1c32:210d with SMTP id 5b1f17b1804b1-4891c32266amr308527675e9.15.1777024526813;
        Fri, 24 Apr 2026 02:55:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891bb3d121sm583739045e9.14.2026.04.24.02.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:55:26 -0700 (PDT)
Message-ID: <4ba28eee-db47-436a-9008-605cae805f81@linaro.org>
Date: Fri, 24 Apr 2026 11:55:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 4/8] mfd: khadas-mcu: Add support for VIM4 MCU variant
To: linux-kernel-dev@aliel.fr, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
References: <20260421-add-mcu-fan-khadas-vim4-v4-0-447114a28f2d@aliel.fr>
 <20260421-add-mcu-fan-khadas-vim4-v4-4-447114a28f2d@aliel.fr>
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
In-Reply-To: <20260421-add-mcu-fan-khadas-vim4-v4-4-447114a28f2d@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_025532_385188_BC95B3DC 
X-CRM114-Status: GOOD (  20.62  )
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

T24gNC8yMS8yNiAxMzo0OSwgUm9uYWxkIENsYXZlYXUgdmlhIEI0IFJlbGF5IHdyb3RlOgo+IEZy
b206IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVsLmZyPgo+IAo+IFJlZmFj
dG9yIHByb2JlKCkgdG8gdXNlIHBlci12YXJpYW50IGtoYWRhc19tY3VfZGF0YQo+IGluc3RlYWQg
b2YgaGFyZGNvZGVkIGdsb2JhbHMuCj4gCj4gQWRkIGRlZGljYXRlZCByZWdtYXAgY29uZmlndXJh
dGlvbiBhbmQgZGV2aWNlIGRhdGEgZm9yIHRoZSBWSU00IE1DVSwKPiB3aXRoIGl0cyBvd24gdm9s
YXRpbGUvd3JpdGVhYmxlIHJlZ2lzdGVycy4KPiAKPiBBZGQgdGhlIGZhbiBjb250cm9sIHJlZ2lz
dGVyCj4gKDDigJMxMDAgbGV2ZWxzIHZzIDDigJMzIGZvciBwcmV2aW91cyBzdXBwb3J0ZWQgYm9h
cmRzKS4KPiAKPiBBZGQgYSBuZXcgY29tcGF0aWJsZSBzdHJpbmcgImtoYWRhcyx2aW00LW1jdSIu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZAYWxp
ZWwuZnI+Cj4gLS0tCj4gICBkcml2ZXJzL21mZC9raGFkYXMtbWN1LmMgfCAxMDYgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCA5NSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tZmQva2hhZGFzLW1jdS5jIGIvZHJpdmVycy9tZmQva2hhZGFzLW1jdS5jCj4gaW5kZXgg
YmE5ODFhNzg4NjkyMS4uYjM2YjNiM2FiNzNjMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21mZC9r
aGFkYXMtbWN1LmMKPiArKysgYi9kcml2ZXJzL21mZC9raGFkYXMtbWN1LmMKPiBAQCAtNzUsMTUg
Kzc1LDkxIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVnbWFwX2NvbmZpZyBraGFkYXNfbWN1X3Jl
Z21hcF9jb25maWcgPSB7Cj4gICAJLmNhY2hlX3R5cGUJPSBSRUdDQUNIRV9NQVBMRSwKPiAgIH07
Cj4gICAKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBraGFkYXNfbWN1X2Zhbl9wZGF0YSBraGFkYXNf
bWN1X2Zhbl9wZGF0YSA9IHsKPiArCS5mYW5fcmVnCT0gS0hBREFTX01DVV9DTURfRkFOX1NUQVRV
U19DVFJMX1JFRywKPiArCS5tYXhfbGV2ZWwJPSAzLAo+ICt9Owo+ICsKPiAgIHN0YXRpYyBzdHJ1
Y3QgbWZkX2NlbGwga2hhZGFzX21jdV9mYW5fY2VsbHNbXSA9IHsKPiAgIAkvKiBWSU0xLzIgUmV2
MTMrIGFuZCBWSU0zIG9ubHkgKi8KPiAtCXsgLm5hbWUgPSAia2hhZGFzLW1jdS1mYW4tY3RybCIs
IH0sCj4gKwl7Cj4gKwkJLm5hbWUgPSAia2hhZGFzLW1jdS1mYW4tY3RybCIsCj4gKwkJLnBsYXRm
b3JtX2RhdGEgPSAma2hhZGFzX21jdV9mYW5fcGRhdGEsCj4gKwkJLnBkYXRhX3NpemUgICAgPSBz
aXplb2Yoa2hhZGFzX21jdV9mYW5fcGRhdGEpLAo+ICsJfSwKPiAgIH07Cj4gICAKPiAgIHN0YXRp
YyBzdHJ1Y3QgbWZkX2NlbGwga2hhZGFzX21jdV9jZWxsc1tdID0gewo+ICAgCXsgLm5hbWUgPSAi
a2hhZGFzLW1jdS11c2VyLW1lbSIsIH0sCj4gICB9Owo+ICAgCj4gK3N0YXRpYyBjb25zdCBzdHJ1
Y3Qga2hhZGFzX21jdV9kYXRhIGtoYWRhc19tY3VfZGF0YSA9IHsKPiArCS5yZWdtYXBfY29uZmln
CT0gJmtoYWRhc19tY3VfcmVnbWFwX2NvbmZpZywKPiArCS5jZWxscwkJPSBraGFkYXNfbWN1X2Nl
bGxzLAo+ICsJLm5jZWxscwkJPSBBUlJBWV9TSVpFKGtoYWRhc19tY3VfY2VsbHMpLAo+ICsJLmZh
bl9jZWxscwk9IGtoYWRhc19tY3VfZmFuX2NlbGxzLAo+ICsJLm5mYW5fY2VsbHMJPSBBUlJBWV9T
SVpFKGtoYWRhc19tY3VfZmFuX2NlbGxzKSwKPiArfTsKPiArCj4gK3N0YXRpYyBib29sIGtoYWRh
c19tY3VfdmltNF9yZWdfdm9sYXRpbGUoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQg
cmVnKQo+ICt7Cj4gKwlzd2l0Y2ggKHJlZykgewo+ICsJY2FzZSBLSEFEQVNfTUNVX1BXUl9PRkZf
Q01EX1JFRzoKPiArCWNhc2UgS0hBREFTX01DVV9WSU00X1JFU1RfQ09ORl9SRUc6Cj4gKwljYXNl
IEtIQURBU19NQ1VfV09MX0lOSVRfU1RBUlRfUkVHOgo+ICsJY2FzZSBLSEFEQVNfTUNVX1ZJTTRf
TEVEX09OX1JBTV9SRUc6Cj4gKwljYXNlIEtIQURBU19NQ1VfVklNNF9GQU5fQ1RSTF9SRUc6Cj4g
KwljYXNlIEtIQURBU19NQ1VfVklNNF9XRFRfRU5fUkVHOgo+ICsJY2FzZSBLSEFEQVNfTUNVX1ZJ
TTRfU1lTX1JTVF9SRUc6Cj4gKwkJcmV0dXJuIHRydWU7Cj4gKwlkZWZhdWx0Ogo+ICsJCXJldHVy
biBmYWxzZTsKPiArCX0KPiArfQo+ICsKPiArc3RhdGljIGJvb2wga2hhZGFzX21jdV92aW00X3Jl
Z193cml0ZWFibGUoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgcmVnKQo+ICt7Cj4g
Kwlzd2l0Y2ggKHJlZykgewo+ICsJY2FzZSBLSEFEQVNfTUNVX1ZFUlNJT05fMF9SRUc6Cj4gKwlj
YXNlIEtIQURBU19NQ1VfVkVSU0lPTl8xX1JFRzoKPiArCWNhc2UgS0hBREFTX01DVV9TSFVURE9X
Tl9OT1JNQUxfU1RBVFVTX1JFRzoKPiArCQlyZXR1cm4gZmFsc2U7Cj4gKwlkZWZhdWx0Ogo+ICsJ
CXJldHVybiB0cnVlOwo+ICsJfQo+ICt9Cj4gKwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ21h
cF9jb25maWcga2hhZGFzX21jdV92aW00X3JlZ21hcF9jb25maWcgPSB7Cj4gKwkucmVnX2JpdHMJ
PSA4LAo+ICsJLnJlZ19zdHJpZGUJPSAxLAo+ICsJLnZhbF9iaXRzCT0gOCwKPiArCS5tYXhfcmVn
aXN0ZXIJPSBLSEFEQVNfTUNVX1ZJTTRfU1lTX1JTVF9SRUcsCj4gKwkudm9sYXRpbGVfcmVnCT0g
a2hhZGFzX21jdV92aW00X3JlZ192b2xhdGlsZSwKPiArCS53cml0ZWFibGVfcmVnCT0ga2hhZGFz
X21jdV92aW00X3JlZ193cml0ZWFibGUsCj4gKwkuY2FjaGVfdHlwZQk9IFJFR0NBQ0hFX01BUExF
LAo+ICt9Owo+ICsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBraGFkYXNfbWN1X2Zhbl9wZGF0YSBr
aGFkYXNfdmltNF9mYW5fcGRhdGEgPSB7Cj4gKwkuZmFuX3JlZwk9IEtIQURBU19NQ1VfVklNNF9G
QU5fQ1RSTF9SRUcsCj4gKwkubWF4X2xldmVsCT0gMHg2NCwKPiArfTsKPiArCj4gK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgbWZkX2NlbGwga2hhZGFzX21jdV92aW00X2NlbGxzW10gPSB7Cj4gKwl7Cj4g
KwkJLm5hbWUJCT0gImtoYWRhcy1tY3UtZmFuLWN0cmwiLAo+ICsJCS5wbGF0Zm9ybV9kYXRhCT0g
JmtoYWRhc192aW00X2Zhbl9wZGF0YSwKPiArCQkucGRhdGFfc2l6ZQk9IHNpemVvZihraGFkYXNf
dmltNF9mYW5fcGRhdGEpLAo+ICsJfSwKPiArfTsKPiArCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
a2hhZGFzX21jdV9kYXRhIGtoYWRhc192aW00X21jdV9kYXRhID0gewo+ICsJLnJlZ21hcF9jb25m
aWcJPSAma2hhZGFzX21jdV92aW00X3JlZ21hcF9jb25maWcsCj4gKwkuY2VsbHMJCT0gTlVMTCwK
PiArCS5uY2VsbHMJCT0gMCwKPiArCS5mYW5fY2VsbHMJPSBraGFkYXNfbWN1X3ZpbTRfY2VsbHMs
Cj4gKwkubmZhbl9jZWxscwk9IEFSUkFZX1NJWkUoa2hhZGFzX21jdV92aW00X2NlbGxzKSwKPiAr
fTsKPiArCj4gICBzdGF0aWMgaW50IGtoYWRhc19tY3VfcHJvYmUoc3RydWN0IGkyY19jbGllbnQg
KmNsaWVudCkKPiAgIHsKPiAgIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmY2xpZW50LT5kZXY7Cj4g
QEAgLTk0LDI4ICsxNzAsMzUgQEAgc3RhdGljIGludCBraGFkYXNfbWN1X3Byb2JlKHN0cnVjdCBp
MmNfY2xpZW50ICpjbGllbnQpCj4gICAJaWYgKCFkZGF0YSkKPiAgIAkJcmV0dXJuIC1FTk9NRU07
Cj4gICAKPiArCWRkYXRhLT5kYXRhID0gaTJjX2dldF9tYXRjaF9kYXRhKGNsaWVudCk7Cj4gKwlp
ZiAoIWRkYXRhLT5kYXRhKQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsKPiAgIAlpMmNfc2V0X2Ns
aWVudGRhdGEoY2xpZW50LCBkZGF0YSk7Cj4gICAKPiAgIAlkZGF0YS0+ZGV2ID0gZGV2Owo+ICAg
Cj4gLQlkZGF0YS0+cmVnbWFwID0gZGV2bV9yZWdtYXBfaW5pdF9pMmMoY2xpZW50LCAma2hhZGFz
X21jdV9yZWdtYXBfY29uZmlnKTsKPiArCWRkYXRhLT5yZWdtYXAgPSBkZXZtX3JlZ21hcF9pbml0
X2kyYyhjbGllbnQsCj4gKwkJCQkJICAgICBkZGF0YS0+ZGF0YS0+cmVnbWFwX2NvbmZpZyk7Cj4g
ICAJaWYgKElTX0VSUihkZGF0YS0+cmVnbWFwKSkgewo+ICAgCQlyZXQgPSBQVFJfRVJSKGRkYXRh
LT5yZWdtYXApOwo+ICAgCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBhbGxvY2F0ZSByZWdpc3Rl
ciBtYXA6ICVkXG4iLCByZXQpOwo+ICAgCQlyZXR1cm4gcmV0Owo+ICAgCX0KPiAgIAo+IC0JcmV0
ID0gZGV2bV9tZmRfYWRkX2RldmljZXMoZGV2LCBQTEFURk9STV9ERVZJRF9OT05FLAo+IC0JCQkJ
ICAga2hhZGFzX21jdV9jZWxscywKPiAtCQkJCSAgIEFSUkFZX1NJWkUoa2hhZGFzX21jdV9jZWxs
cyksCj4gLQkJCQkgICBOVUxMLCAwLCBOVUxMKTsKPiAtCWlmIChyZXQpCj4gLQkJcmV0dXJuIHJl
dDsKPiArCWlmIChkZGF0YS0+ZGF0YS0+Y2VsbHMgJiYgZGRhdGEtPmRhdGEtPm5jZWxscykgewo+
ICsJCXJldCA9IGRldm1fbWZkX2FkZF9kZXZpY2VzKGRldiwgUExBVEZPUk1fREVWSURfTk9ORSwK
PiArCQkJCQkgICBkZGF0YS0+ZGF0YS0+Y2VsbHMsCj4gKwkJCQkJICAgZGRhdGEtPmRhdGEtPm5j
ZWxscywKPiArCQkJCQkgICBOVUxMLCAwLCBOVUxMKTsKPiArCQlpZiAocmV0KQo+ICsJCQlyZXR1
cm4gcmV0Owo+ICsJfQo+ICAgCj4gICAJaWYgKG9mX3Byb3BlcnR5X3ByZXNlbnQoZGV2LT5vZl9u
b2RlLCAiI2Nvb2xpbmctY2VsbHMiKSkKPiAgIAkJcmV0dXJuIGRldm1fbWZkX2FkZF9kZXZpY2Vz
KGRldiwgUExBVEZPUk1fREVWSURfTk9ORSwKPiAtCQkJCQkgICAga2hhZGFzX21jdV9mYW5fY2Vs
bHMsCj4gLQkJCQkJICAgIEFSUkFZX1NJWkUoa2hhZGFzX21jdV9mYW5fY2VsbHMpLAo+ICsJCQkJ
CSAgICBkZGF0YS0+ZGF0YS0+ZmFuX2NlbGxzLAo+ICsJCQkJCSAgICBkZGF0YS0+ZGF0YS0+bmZh
bl9jZWxscywKPiAgIAkJCQkJICAgIE5VTEwsIDAsIE5VTEwpOwo+ICAgCj4gICAJcmV0dXJuIDA7
Cj4gQEAgLTEyMyw3ICsyMDYsOCBAQCBzdGF0aWMgaW50IGtoYWRhc19tY3VfcHJvYmUoc3RydWN0
IGkyY19jbGllbnQgKmNsaWVudCkKPiAgIAo+ICAgI2lmZGVmIENPTkZJR19PRgo+ICAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQga2hhZGFzX21jdV9vZl9tYXRjaFtdID0gewo+IC0J
eyAuY29tcGF0aWJsZSA9ICJraGFkYXMsbWN1IiwgfSwKPiArCXsgLmNvbXBhdGlibGUgPSAia2hh
ZGFzLG1jdSIsIC5kYXRhID0gJmtoYWRhc19tY3VfZGF0YSB9LAo+ICsJeyAuY29tcGF0aWJsZSA9
ICJraGFkYXMsdmltNC1tY3UiLCAuZGF0YSA9ICZraGFkYXNfdmltNF9tY3VfZGF0YSB9LAo+ICAg
CXt9LAo+ICAgfTsKPiAgIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIGtoYWRhc19tY3Vfb2ZfbWF0
Y2gpOwo+IAoKUmV2aWV3ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5h
cm8ub3JnPgoKVGhhbmtzLApOZWlsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
