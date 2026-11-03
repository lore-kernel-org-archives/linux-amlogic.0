Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D706B606A324
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2026 08:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LMykqu+q;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iiW0RAEc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3csQXx6mUkSPwXH+Df61bOzQlnZ1PBWP8g49u5g4ZhU=; b=LMykqu+qDQr1nplAo//HcFONpj
	ajQdpxdn/nv2b16qfFRq4jPhmNBA0t2d9vFZ4Xw75R0E+5eXPaCJFs1qgEuzEXxV1cAES4OVfu3sb
	BLHx7uNo1zPL2IrxyGlbRPbPpOJmKETALS1oeA81V5UoPheVWbWUK7UApbjFH+AgRgcO/C9Q5A7eg
	pCA9i8zMEp2A1HWKsNWNJjDyIAJnuW0JZPQjIwuUi3buyQGTOPIYmBTTr4NHlRJKdb/TqNVpWVNR0
	wyk38aMw7eqqwkOPsn+mcfPDkquoRP5HADqyGBbxQ7kd2YArF4sOH8Q1oUVD+Kj11QWSfMgRtKmJQ
	IqKHhS2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAJR-00000001eYt-2l1L;
	Tue, 03 Nov 2026 08:56:13 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAJN-00000001eWV-1PpA
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Nov 2026 08:56:12 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so3067882f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2026 00:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793696167; x=1794300967; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0jyamYHXzSg2ziaLDwiS5/5BeZM4xaO8pbQEHrQdYGE=;
        b=iiW0RAEcZYPw0AdhAvbSNZrNPaoNqlMbzmstN3Gry7ZxzWlr8g11kZp5SbCXdnXGsi
         2EIAkAFCMvCylk6LhrgLtM5LYXkoEt4hdYCPaWnqE2hAAuu2jejWGmbSkn+Ww+3AQZaU
         HThPrcK1Hjl4FkDxQuHhPyEFiG2ldOoULi7vgiORh0ciYDRuF01Ea9jcT1vj6dfT/Yke
         z26vt+txSJFh1tWWFk6TKfS6y08Kqgml52HkcutH9CK6M89pK2gIvgQOSA5ibKKyclwA
         m5zfTUeg9R5bztcBWs+O0QbVAyMPBstNFqHkX+Tzrl0ZcjAQRpBppERo4YBEhkEl+vOa
         75Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696167; x=1794300967;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0jyamYHXzSg2ziaLDwiS5/5BeZM4xaO8pbQEHrQdYGE=;
        b=QqViEoaoWVRgNyAWdaUbpReKzETJQ+J7IHEte4UVMrbC61KhxyjfCwvsnaqXDwpqVE
         AtoFf/jzHYU0TmHNuiIBEVWKb66ceM9qbPW/PMVLzHlTQP/iptqi7JROCkClcnWp6Ph8
         JMSOgNXNAu59Yb+uMu36frY9ZQUiQlWDCxaeDDOxuG/5T9BSbWjLouYu1DMUSDD2ueYo
         WUHO5vMc+ooz1SFQQkh8/Fv2fSWXqpGYyy4bRQTXhCe8xkQNy5c2UHSwC/Xa/LDh1eIg
         EYwLtzYrbiPTDh0GUqT2xlMGq1kcAjBjmsX6SyinwyIz7OcdB4CjTHAsWWx1xWaqsbBX
         AUSA==
X-Forwarded-Encrypted: i=1; AKwUvByW0EejOaGKMfDZAi2IZ73zdUewPO5t4a9V7QNnnTHodhRmyNyQRW0X69QQkAI1Y5S2E2Se0zhqdl2yaS9h@lists.infradead.org
X-Gm-Message-State: APuU4Z93Ng3aAPv79h4I/KhKmYXFz0IvlHcPcZz8H8dgGGpxmANmPdce
	4zYsJrC0Xyy3LVBgnj8lpDfU23amhRSY2+PZGqYOVi91darWmajIbXpmwHqEZ9q2h2w=
X-Gm-Gg: AYBFou1R5LbgrhRVDgBrpbMdcsF/7UiZP94rXtAJqqCwkgvbv06OpjtYgX4jrS+C7oC
	MoM3NOTnOKeY3h4O2nudRqKlg/xETX95uqNNNFCXIPgm1bWRuIVbrPjRU5coVryEqBW3is97414
	wIASOuhBR2uIXdVYtzyrJ6AWGurhib3hr7wn+GQBrWywNq2VGHhUCy/t7etujmYDqUPKAKHT6D7
	nskUR5rPjH0PYxLAS/5X+E3tVY4cn9SpTyR6I5VGoqKX4yKGcBBtMgSvrcQNajJwStrhiytPUOH
	ZGUIdQHCcj/QSBCqQ+7zQzn8sEV8QOtGp6QVSZIRwh/dPxVlxcRfpvU6UWlS05mVZ7pA9Uavsng
	G8s2TykJgq6PN1Qt8Wr0cN8KteZhFkm486hH2jmiUbjKIqd58Bh2CTv9dX5jucGTrMzoD3YpHJK
	gLtL9Q05GzVae/Wwjea/n4D0BxQcm0cksNl7xziRpUSJgeOuUsq2wXjuul5clAyuSG6GeDIpFOX
	JXtk3PdLcmhuFNHw4qNl1+vQsR67vycPFSFrFlVUQ2MwWEbYvLyq8XjvO/knbB3ApHtw4YUZUAE
	44w+s1bdoucQmItKRH2PkVE8zZWLSJ+FBvFyCsQEVDc+m/z2DlxF1QeEGyGir4/hF8glT/egIlv
	6TDgcRYd9
X-Received: by 2002:a05:6000:2504:b0:48e:5df9:1ec9 with SMTP id ffacd0b85a97d-48e6e500979mr30641989f8f.24.1793696167199;
        Tue, 03 Nov 2026 00:56:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:95a2:4869:9f46:45f0? ([2a01:e0a:106d:1080:95a2:4869:9f46:45f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e88876946sm4998576f8f.5.2026.11.03.00.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 00:56:06 -0800 (PST)
Message-ID: <c1c38ee8-5a7c-4b08-89c1-e1e27a2043d1@linaro.org>
Date: Tue, 3 Nov 2026 09:56:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/2] phy: amlogic: meson-g12a-usb2: add S4 support
To: christian.koever-draxl@student.uibk.ac.at, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, vkoul@kernel.org,
 mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261025192202.209045-1-christian.koever-draxl@student.uibk.ac.at>
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
In-Reply-To: <20261025192202.209045-1-christian.koever-draxl@student.uibk.ac.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_005609_688160_78A14414 
X-CRM114-Status: GOOD (  14.96  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTAvMjUvMjYgMjA6MjIsIGNocmlzdGlhbi5rb2V2ZXItZHJheGxAc3R1ZGVudC51aWJrLmFj
LmF0IHdyb3RlOgo+IEZyb206IENocmlzdGlhbiBTdGVmYW4gS8O2dsOpci1EcmF4bCA8Y2tvZXZl
ckBvdXRsb29rLmRlPgo+IAo+IFRoZSBTNCBVU0IyIFBIWSBpcyB0aGUgQTEgZGVzaWduIHdpdGgg
ZGlmZmVyZW50IGFuYWxvZyB0cmltcyBhbmQgYW4KPiBleHRyYSBkaXNjb25uZWN0IHRocmVzaG9s
ZDsgd2l0aG91dCBpdHMgUE1BIHVwZGF0ZSBiaXQgdGhlIGhvc3Qgc2VlcyBubwo+IHJvb3QgcG9y
dHMuIEFkZCBhIGNvbXBhdGlibGUgYW5kIHRoZSBTNCBzZXR0aW5ncyBmcm9tIHRoZSB2ZW5kb3Ig
ZHJpdmVyLgo+IAo+IFRlc3RlZDogYm90aCBob3N0IHBvcnRzIGVudW1lcmF0ZSBrZXlib2FyZHMs
IG1pY2UsIGh1YnMgYW5kIHN0b3JhZ2UuCj4gCj4gVG9vbCB1c2UgKERvY3VtZW50YXRpb24vcHJv
Y2Vzcy9nZW5lcmF0ZWQtY29udGVudC5yc3QpOgo+IFRoaXMgd29yayB3YXMgZG9uZSB3aXRoIHRo
ZSBoZWxwIG9mIGFuIEFJIGNvZGluZyBhc3Npc3RhbnQsIENsYXVkZQo+IChBbnRocm9waWMpLCB1
c2VkIHRocm91Z2ggQ2xhdWRlIENvZGUgb3ZlciBtYW55IHNlc3Npb25zLiBJdCBkaWQgYSBsYXJn
ZQo+IHBhcnQgb2YgdGhlIGhhbmRzLW9uIHdvcms6IGl0IHJlYWQgdGhlIHZlbmRvciBrZXJuZWwg
YW5kIHRoZSBmaXJtd2FyZQo+IGludGVyZmFjZXMsIHByb2JlZCByZWdpc3RlcnMgb24gdGhlIGJv
YXJkLCBkcmFmdGVkIHRoZSBjb2RlIGFuZCB0aGUKPiBjaGFuZ2Vsb2dzLCBhbmQgcmFuIHRoZSBi
dWlsZHMsIGNoZWNrcGF0Y2gsIGR0X2JpbmRpbmdfY2hlY2sgYW5kIHRoZQo+IHRlc3RzIG9uIHRo
ZSBoYXJkd2FyZS4gSSBkaXJlY3RlZCB0aGUgd29yaywgcmV2aWV3ZWQgZXZlcnkgY2hhbmdlIGFu
ZAo+IHRoZSBmaW5hbCBwYXRjaGVzLCBhbmQgdGFrZSByZXNwb25zaWJpbGl0eSBmb3IgdGhlbS4g
VGhlcmUgaXMgbm8gc2luZ2xlCj4gcHJvbXB0IHRvIHF1b3RlOyB0aGUgc2Vzc2lvbnMgd2VyZSBv
ZiB0aGUgZm9ybSAiZmluZCBvdXQgd2h5IFggZmFpbHMgb24KPiB0aGlzIGJvYXJkLCBmaXggaXQs
IHRlc3QgaXQgb24gdGhlIGJveCIuCj4gCj4gVGVzdGVkIG9uIGFuIEFtZWRpYXRlY2ggWDk4USBU
ViBib3ggKEFtbG9naWMgUzkwNVcyLCBTNCBmYW1pbHksIDIgR2lCKSwKPiB2ZW5kb3IgVS1Cb290
IGFuZCBCTDMxL09QLVRFRSwgTGludXggNy4zIHBsdXMgdGhpcyB3b3JrLgo+IAo+IENocmlzdGlh
biBTdGVmYW4gS8O2dsOpci1EcmF4bCAoMik6Cj4gICAgZHQtYmluZGluZ3M6IHBoeTogYW1sb2dp
YyxnMTJhLXVzYjItcGh5OiBhZGQgUzQgY29tcGF0aWJsZQo+ICAgIHBoeTogYW1sb2dpYzogbWVz
b24tZzEyYS11c2IyOiBhZGQgUzQgc3VwcG9ydAo+IAo+ICAgLi4uL2JpbmRpbmdzL3BoeS9hbWxv
Z2ljLGcxMmEtdXNiMi1waHkueWFtbCAgIHwgIDEgKwo+ICAgZHJpdmVycy9waHkvYW1sb2dpYy9w
aHktbWVzb24tZzEyYS11c2IyLmMgICAgIHwgNjUgKysrKysrKysrKysrKystLS0tLQo+ICAgMiBm
aWxlcyBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKPiAKPiAKPiBi
YXNlLWNvbW1pdDogN2JlNGJjNTJmZDllMGU1NWRjOWEyZTAyMzJiODk0MjdkMmM0YjYxNAoKQWNr
ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgoKVGhhbmtz
LApOZWlsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
