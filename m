Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C877BC48297
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Feb 2024 15:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OwfnwC4AVnNwHUEP0hQa+9ZNoWg4g6jgsi1uhvHj4J0=; b=jWmD4OXxtKFlXWf2SFQfdSxkxM
	qkbP8xo8SMSCiluzkgKST3AhLhNDYIDrmKCjO9tyIrxwIbgcb9lSLHJXy1KpbuXG9JKxEICaU1bV+
	j1yOM7UcqnDuYDNcbKLfrLA7c93Z08NxgpfxVgCj4Xu4hn+MoQzpP1JtEyMrVH9HyvugMYU78v3c7
	Vs6sWblWeuV5W2MeK5wwlsyfT+IrA8yF5iAPCWYCmkLzlZVUJalniZMiBD9lxeWJCqWmYxECaE8gP
	g4UHRS/qkroEDKnd7CeFllTWtE5+Vxj47Fx/QcDbholCThxjkPgx4j9qitPaIeGgXsZc4sHHMlc+E
	mZhCT8Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXMxY-00000007ypA-1Tuh;
	Tue, 06 Feb 2024 15:02:04 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXMxV-00000007ymv-06Ky
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Feb 2024 15:02:02 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40fe32fcbdaso5562965e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Feb 2024 07:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707231710; x=1707836510; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H5VTIWx1HaIAdr3e5cTrSgnK2i49qOmVvjnmS+SpRKA=;
        b=lV6t86ozNN6tvGx6nBf8Mc7hcC6CED5uKGk3QLGuowrzXSfSsdWfiAl6wbqE4UgCzY
         wuSng+fOx1tWCi4Uk+8tGFnaCgzBhHYEU9Hlu6RDWpEQ28IsqTSEd/kFzTMQMTmawdAs
         sgt2D6P0ZGxxMTGvHNdPaE0oRi5w9/7K/m56GFtYyqcda0iJ9Mhy6DJUNpOfnpKGSMYj
         BU4CQiX7pLLfJECWsgtXpYfvatfuZD67M+IAu1Pjd5qOiFF3vkvLD5mk3dhC9ng9gmFX
         wwI4KdID8MXa7+JvLzzkuYqbhR69lfVlodisExC5SJCXk/8qclyp+G4n2nLHE1F/TAoh
         wKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707231710; x=1707836510;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H5VTIWx1HaIAdr3e5cTrSgnK2i49qOmVvjnmS+SpRKA=;
        b=Kmoqn767eaAhniL5+pvla31Cfj3JtiE1PWQRwoJrDHONwBw6j5UetQwuoIvuEpMUTn
         mJuRosfm+yfrOpu5PHOUBS87ZDAgVEP/lGWsOtnNKdFwWRCmTrdJTW/PziVAPqK1YGGs
         We6XqChtOiHFHxcaWhXb4kIKpXisx42dytf7I5IaNZtVbCRculu2B2FPUCYree4K8tW8
         aFCg3+0ePEN8fuj3pY8VDuzTfFTkePor5i2zUYeg8YLBJ3+s46hnPPD6Q2ihLlcOcoS1
         s3e8bdkkn5PI4Qp6vOJUpe76mU8Pqjx/LDBAF/S7vA/W2uITlsQQZwEVOp8hpPFGbCEP
         +I+A==
X-Gm-Message-State: AOJu0YwZ4+P3miSg3jkSRfcrMVd4NWq2TniQ8EhxYLK5pUXYpcn3UrTz
	sfe9ReqQG5ywwd0O4nWnJU8mOyDKjYp+MQYFX1DIZtbn8l/tIHqpqXILANXkUyc=
X-Google-Smtp-Source: AGHT+IETvRFjRnjFOO4bDtGypgquP7hdk6Jo9QAd2g9J8IXkg01MrNN5rH2llh9JQnyDKGXtLdZ2/Q==
X-Received: by 2002:a05:6000:81:b0:33b:4ac8:b99c with SMTP id m1-20020a056000008100b0033b4ac8b99cmr411104wrx.1.1707231708961;
        Tue, 06 Feb 2024 07:01:48 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVUkdMHZCCNuOykxelokr3qQYi4y0Ie66lNO1Ifb0g92zYIagZRERVeeum+2FedcVbW56Gd56106bwKOu1EJj+DAOSdHYWn1cRiDXzshHmgqOYgLEP+euBmc05nxD/jUAJHC2kvJMIWwRnT1EgW99LSySBmDhxF/gzyYj6sqDloFr9LhzEXHMxcPbUVqU8vmBKJWKP6OhpkKTUuzSdRT6PARSpshprzzK/cysYJOVyclrPsNKZF1Idpcz79I7TDEDRuFxX5+SBw9laKDi1xnG7x1b9X4B58Aqyct/qOcVsc0iBItWBsB8BFU3tQSus0W6Lo2ATEuzvX+1HTQwnNCuQblBKAVQJRMAqnrQ6wZjA38R/4xCOhOt/gNTL1SUP+yz547X7fQUJsLkY9j0wNR1UBdOx13km3A4tZ
Received: from ?IPV6:2a01:e0a:982:cbb0:ba23:8574:fa8:28dd? ([2a01:e0a:982:cbb0:ba23:8574:fa8:28dd])
        by smtp.gmail.com with ESMTPSA id t6-20020a5d5346000000b0033b15fdad42sm2319994wrv.34.2024.02.06.07.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 07:01:48 -0800 (PST)
Message-ID: <f87069a4-042c-467a-94fb-0b65bfa4758d@linaro.org>
Date: Tue, 6 Feb 2024 16:01:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCHv1 4/5] arm64: dts: amlogic: Add cache information to the
 Amlogic S922X SoC
Content-Language: en-US, fr
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240205171930.968-1-linux.amoon@gmail.com>
 <20240205171930.968-5-linux.amoon@gmail.com>
 <cf47b82c-6307-475b-af3a-eab7f09715f0@linaro.org>
 <CANAwSgTOpDmZGR33veBWrzr75=xEZ-28iu=GeCzqa0ZPXxDchw@mail.gmail.com>
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
In-Reply-To: <CANAwSgTOpDmZGR33veBWrzr75=xEZ-28iu=GeCzqa0ZPXxDchw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_070201_100134_EB95B7C9 
X-CRM114-Status: GOOD (  18.73  )
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

T24gMDYvMDIvMjAyNCAxMToxNSwgQW5hbmQgTW9vbiB3cm90ZToKPiBIaSBOZWlsLAo+IAo+IE9u
IFR1ZSwgNiBGZWIgMjAyNCBhdCAxNDozMCwgTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25n
QGxpbmFyby5vcmc+IHdyb3RlOgo+Pgo+PiBPbiAwNS8wMi8yMDI0IDE4OjE5LCBBbmFuZCBNb29u
IHdyb3RlOgo+Pj4gQXMgcGVyIFM5MjJYIGRhdGFzaGVldCBhZGQgbWlzc2luZyBjYWNoZSBpbmZv
cm1hdGlvbiB0byB0aGUgQW1sb2dpYwo+Pj4gUzkyMlggU29DLgo+Pj4KPj4+IC0gRWFjaCBDb3J0
ZXgtQTUzIGNvcmUgaGFzIDMyIEtCIG9mIGluc3RydWN0aW9uIGNhY2hlIGFuZAo+Pj4gICAgICAg
IDMyIEtCIG9mIEwxIGRhdGEgY2FjaGUgYXZhaWxhYmxlLgo+Pj4gLSBFYWNoIENvcnRleC1BNzMg
Y29yZSBoYXMgNjQgS0Igb2YgTDEgaW5zdHJ1Y3Rpb24gY2FjaGUgYW5kCj4+PiAgICAgICAgNjQg
S0Igb2YgTDEgZGF0YSBjYWNoZSBhdmFpbGFibGUuCj4+PiAtIFRoZSBsaXR0bGUgKEE1MykgY2x1
c3RlciBoYXMgNTEyIEtCIG9mIHVuaWZpZWQgTDIgY2FjaGUgYXZhaWxhYmxlLgo+Pj4gLSBUaGUg
YmlnIChBNzMpIGNsdXN0ZXIgaGFzIDEgTUIgb2YgdW5pZmllZCBMMiBjYWNoZSBhdmFpbGFibGUu
Cj4+Cj4+IERhdGFzaGVldCBzYXlzOgo+PiBUaGUgcXVhZCBjb3JlIENvcnRleOKEoi1BNzMgcHJv
Y2Vzc29yIGlzIHBhaXJlZCB3aXRoIEE1MyBwcm9jZXNzb3IgaW4gYSBiaWcuTGl0dGxlIGNvbmZp
Z3VyYXRpb24sIHdpdGggZWFjaAo+PiBjb3JlIGhhcyBMMSBpbnN0cnVjdGlvbiBhbmQgZGF0YSBj
aGFjaGVzLCB0b2dldGhlciB3aXRoIGEgc2luZ2xlIHNoYXJlZCBMMiB1bmlmaWVkIGNhY2hlIHdp
dGggQTUzCj4+Cj4gT2ssCj4gCj4gU2luY2UgYWxsIHRoZSBDb3J0ZXjihKItQTczIGFuZCBDb3J0
ZXjihKItQTUzIHNoYXJlIHNvbWUgaW1wcm92ZW1lbnRzIGluCj4gdGhlIGFyY2hpdGVjdHVyZSB3
aXRoIHNvbWUgaW1wcm92ZW1lbnRzIGluIGNhY2hlIGZlYXR1cmVzCj4gaGVuY2UgSSB1cGRhdGUg
dGhlIGNoYW5nZXMgYWNjb3JkaW5nbHkuCj4gQWxzbywgSSBjaGVja2VkIHRoaXMgaW4gdGhlIEFS
TSBkb2N1bWVudGF0aW9uIGVhcmxpZXIgb24gdGhpcy4KCkkgZG9uJ3QgdW5kZXJzdGFuZCwgQW1s
b2dpYyBzdGF0ZXMgaXQncyBhIHNoYXJlZCBMMiBjYWNoZSwgYnV0IHlvdSB0cnVzdAp0aGUgQVJN
IGRvY3VtZW50YXRpb24gaW5zdGVhZCA/Pz8KCj4gCj4+IEFuZCB0aGVyZSdzIG5vIGluZGljYXRp
b24gb2YgdGhlIEwxIG9yIEwyIGNhY2hlIHNpemVzLgo+IAo+IFdoYXQgSSBmZWVsIGlzIGluIGdl
bmVyYWwgYWxsIHRoZSBDb3J0ZXjihKItQTczIGFuZCBDb3J0ZXjihKItQTUzIHN1cHBvcnRzCj4g
TDEgYW5kIEwyIGNhY2hlIHNpemUgc2luY2UgaXQgaXMgcGFydCBvZiB0aGUgY29yZSBmZWF0dXJl
cy4KPiBidXQgSSBvcHRlZCBmb3IgdGhlc2Ugc2l6ZSB2YWx1ZXMgZnJvbSBhIFdpa2lwZWRpYSBh
cnRpY2xlLgo+IAo+IE9uIG15IE9kcm9pZCBOMissIEkgb2JzZXJ2ZSB0aGUgZm9sbG93aW5nLgo+
IAo+IEkgaGF2ZSBhbHNvIGRvbmUgc29tZSB0ZXN0aW5nIG9uIHRoZSBzdHJlc3MtbmcgdG8gdmVy
aWZ5IHRoaXMuCgoKT2sgSSBkb24ndCBmZWVsIGNvbmZpZGVudCBhZGRpbmcgbnVtYmVycyB0aGF0
IGNvbWVzIG91dCBvZiB0aGluIGFpciwKYW5kIGV2ZW4gbW9yZSBzaW5jZSB0aGV5IGFyZSBvbmx5
IHNoYXJlZCB0byB1c2Vyc3BhY2UuCgpJIHRoaW5rIHdlIHNob3VsZCBvbmx5IGFkZCB0aGUgbnVt
YmVycyB3aGljaCBhcmUgMTAwJSBzdXJlCgo+IAo+IGFsYXJtQGFyY2hsLW9uMjp+JCBsc2NwdQo+
IEFyY2hpdGVjdHVyZTogICAgICAgICAgIGFhcmNoNjQKPiAgICBDUFUgb3AtbW9kZShzKTogICAg
ICAgMzItYml0LCA2NC1iaXQKPiAgICBCeXRlIE9yZGVyOiAgICAgICAgICAgTGl0dGxlIEVuZGlh
bgo+IENQVShzKTogICAgICAgICAgICAgICAgIDYKPiAgICBPbi1saW5lIENQVShzKSBsaXN0OiAg
MC01Cj4gVmVuZG9yIElEOiAgICAgICAgICAgICAgQVJNCj4gICAgTW9kZWwgbmFtZTogICAgICAg
ICAgIENvcnRleC1BNTMKPiAgICAgIE1vZGVsOiAgICAgICAgICAgICAgNAo+ICAgICAgVGhyZWFk
KHMpIHBlciBjb3JlOiAxCj4gICAgICBDb3JlKHMpIHBlciBzb2NrZXQ6IDIKPiAgICAgIFNvY2tl
dChzKTogICAgICAgICAgMQo+ICAgICAgU3RlcHBpbmc6ICAgICAgICAgICByMHA0Cj4gICAgICBD
UFUocykgc2NhbGluZyBNSHo6IDEwMCUKPiAgICAgIENQVSBtYXggTUh6OiAgICAgICAgMTgwMC4w
MDAwCj4gICAgICBDUFUgbWluIE1IejogICAgICAgIDEwMDAuMDAwMAo+ICAgICAgQm9nb01JUFM6
ICAgICAgICAgICA0OC4wMAo+ICAgICAgRmxhZ3M6ICAgICAgICAgICAgICBmcCBhc2ltZCBldnRz
dHJtIGFlcyBwbXVsbCBzaGExIHNoYTIgY3JjMzIgY3B1aWQKPiAgICBNb2RlbCBuYW1lOiAgICAg
ICAgICAgQ29ydGV4LUE3Mwo+ICAgICAgTW9kZWw6ICAgICAgICAgICAgICAyCj4gICAgICBUaHJl
YWQocykgcGVyIGNvcmU6IDEKPiAgICAgIENvcmUocykgcGVyIHNvY2tldDogNAo+ICAgICAgU29j
a2V0KHMpOiAgICAgICAgICAxCj4gICAgICBTdGVwcGluZzogICAgICAgICAgIHIwcDIKPiAgICAg
IENQVShzKSBzY2FsaW5nIE1IejogNjMlCj4gICAgICBDUFUgbWF4IE1IejogICAgICAgIDIyMDgu
MDAwMAo+ICAgICAgQ1BVIG1pbiBNSHo6ICAgICAgICAxMDAwLjAwMDAKPiAgICAgIEJvZ29NSVBT
OiAgICAgICAgICAgNDguMDAKPiAgICAgIEZsYWdzOiAgICAgICAgICAgICAgZnAgYXNpbWQgZXZ0
c3RybSBhZXMgcG11bGwgc2hhMSBzaGEyIGNyYzMyIGNwdWlkCj4gQ2FjaGVzIChzdW0gb2YgYWxs
KToKPiAgICBMMWQ6ICAgICAgICAgICAgICAgICAgMzIwIEtpQiAoNiBpbnN0YW5jZXMpCj4gICAg
TDFpOiAgICAgICAgICAgICAgICAgIDMyMCBLaUIgKDYgaW5zdGFuY2VzKQo+ICAgIEwyOiAgICAg
ICAgICAgICAgICAgICAxLjUgTWlCICgyIGluc3RhbmNlcykKPiBOVU1BOgo+ICAgIE5VTUEgbm9k
ZShzKTogICAgICAgICAxCj4gICAgTlVNQSBub2RlMCBDUFUocyk6ICAgIDAtNQo+IFZ1bG5lcmFi
aWxpdGllczoKPiAgICBHYXRoZXIgZGF0YSBzYW1wbGluZzogTm90IGFmZmVjdGVkCj4gICAgSXRs
YiBtdWx0aWhpdDogICAgICAgIE5vdCBhZmZlY3RlZAo+ICAgIEwxdGY6ICAgICAgICAgICAgICAg
ICBOb3QgYWZmZWN0ZWQKPiAgICBNZHM6ICAgICAgICAgICAgICAgICAgTm90IGFmZmVjdGVkCj4g
ICAgTWVsdGRvd246ICAgICAgICAgICAgIE5vdCBhZmZlY3RlZAo+ICAgIE1taW8gc3RhbGUgZGF0
YTogICAgICBOb3QgYWZmZWN0ZWQKPiAgICBSZXRibGVlZDogICAgICAgICAgICAgTm90IGFmZmVj
dGVkCj4gICAgU3BlYyByc3RhY2sgb3ZlcmZsb3c6IE5vdCBhZmZlY3RlZAo+ICAgIFNwZWMgc3Rv
cmUgYnlwYXNzOiAgICBWdWxuZXJhYmxlCj4gICAgU3BlY3RyZSB2MTogICAgICAgICAgIE1pdGln
YXRpb247IF9fdXNlciBwb2ludGVyIHNhbml0aXphdGlvbgo+ICAgIFNwZWN0cmUgdjI6ICAgICAg
ICAgICBWdWxuZXJhYmxlCj4gICAgU3JiZHM6ICAgICAgICAgICAgICAgIE5vdCBhZmZlY3RlZAo+
ICAgIFRzeCBhc3luYyBhYm9ydDogICAgICBOb3QgYWZmZWN0ZWQKPiBhbGFybUBhcmNobC1vbjI6
fiQKPiAKPiBhbGFybUBhcmNobC1vbjI6fiQgbHN0b3BvLW5vLWdyYXBoaWNzCj4gTWFjaGluZSAo
MzY1OU1CIHRvdGFsKQo+ICAgIFBhY2thZ2UgTCMwCj4gICAgICBOVU1BTm9kZSBMIzAgKFAjMCAz
NjU5TUIpCj4gICAgICBMMiBMIzAgKDUxMktCKQo+ICAgICAgICBMMWQgTCMwICgzMktCKSArIEwx
aSBMIzAgKDMyS0IpICsgQ29yZSBMIzAgKyBQVSBMIzAgKFAjMCkKPiAgICAgICAgTDFkIEwjMSAo
MzJLQikgKyBMMWkgTCMxICgzMktCKSArIENvcmUgTCMxICsgUFUgTCMxIChQIzEpCj4gICAgICBM
MiBMIzEgKDEwMjRLQikKPiAgICAgICAgTDFkIEwjMiAoNjRLQikgKyBMMWkgTCMyICg2NEtCKSAr
IENvcmUgTCMyICsgUFUgTCMyIChQIzIpCj4gICAgICAgIEwxZCBMIzMgKDY0S0IpICsgTDFpIEwj
MyAoNjRLQikgKyBDb3JlIEwjMyArIFBVIEwjMyAoUCMzKQo+ICAgICAgICBMMWQgTCM0ICg2NEtC
KSArIEwxaSBMIzQgKDY0S0IpICsgQ29yZSBMIzQgKyBQVSBMIzQgKFAjNCkKPiAgICAgICAgTDFk
IEwjNSAoNjRLQikgKyBMMWkgTCM1ICg2NEtCKSArIENvcmUgTCM1ICsgUFUgTCM1IChQIzUpCj4g
ICAgQmxvY2sgIm1tY2JsazFib290MCIKPiAgICBCbG9jayAibW1jYmxrMWJvb3QxIgo+ICAgIEJs
b2NrICJtbWNibGsxIgo+ICAgIE5ldCAiZXRoMCIKClRoaXMgbG9va3MgcHJldHR5LCBidXQgbGV0
J3Mga2VlcCBleHBvcnRpbmcgdmVyaWZpZWQgZGF0YS4KCj4gCj4gICA+Cj4+IE5laWwKPj4KPiAK
PiBUaGFua3MKPiAtQW5hbmQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
