Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471F5C4345F
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Apr 2024 23:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WY5469qtKPw1iiwmW7TqFWfr9Yw6Q7Mc7P/1RTXUebc=; b=bosbMUDOgDB+i3cYpjrL/zDpOs
	rVNHsCBUPBq6/GgMO9EgqZEDi1i5ur7NIA7D5GomOAjDN8fGbda8RY+5gFl1pzDPmnExDjgw/MctC
	L4wjfIpbtE3e3j1PjrV1/XoA0jgV0QstnBZhgx/NEgQiuvuWfNQZ9DrfbVskQw4whmyRNn55j3tkJ
	tfB4EjmTiDXnulwhjR6nB5nN4SausZJY2IVIUGd1KLdWZ2AL4tWIzQpPfJY41WxZcdfeSapKwKGb4
	/k7G0X0T3NP4v35eA5VnALT8n9mTGHTF9ckX4K9/Zk3KF/MljprtKGkXjgFFGy0z99e1ykqQdfUrr
	87zMFlHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwVmw-0000000ABLU-2BoD;
	Mon, 15 Apr 2024 23:31:02 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwVms-0000000ABKY-2Yug
	for linux-amlogic@lists.infradead.org;
	Mon, 15 Apr 2024 23:31:00 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-41550858cabso23855185e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 15 Apr 2024 16:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713223856; x=1713828656; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sbgOogGrd7KneMj6zTYHK/GfLd8TwApJl8NSTb8SGlA=;
        b=DYiD1k4ulxVu4HLInQ7XAmDI87CJRtqo2sXE29EMP1Y3OfgRpiwCCcs4E6w6kCeMMJ
         SLNX0VacZJSrChDUWKB7wJ5CL1aKo9i/w2gbaEY2aipTsVPHp32Pw79s2F2GYoHNUPp/
         RLjot5jtJFkeEy6hu0CZuhVKxckpp8vVTcrTcRIMytOjHedtIuFD+PwGzx/LDbR81drU
         706c5NjYNyGslLrUgfe6H83ngYWnjty/iOZrvigwY9uTLh2CjAPd/CVhma7ytMWxqPHx
         639gr9/aSlXJM54XncgTEqFseouHT6Zr8jR4hMz2X4ZN5Zf1rSxMbmZtM08TtkzoB7fJ
         LVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713223856; x=1713828656;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sbgOogGrd7KneMj6zTYHK/GfLd8TwApJl8NSTb8SGlA=;
        b=WUdd5pC2dISGi6t7AsQn4l4KT/Ycb1AQQm8x8gwvZoKTeeqWTWHwlCBnI4j9/Ef0jK
         KhoNKVIcPXS5uwIgxjNya79sDq7fYTjA5asDQesR8eJbkjAAGB68TYYQQBx0WqBUxd46
         GFqa3baXYpN8aBt/ShgQzKzhKnML6TVnpKwUVz4sbMbAqrPAlgHjb8ZXrQqn1I51iVtj
         Q21rBHqw0rKgbev93vhpLhLc+9YYU59xnBSfF/PwAQVFl+YEBfqjtUYDpwFzoIyPxKm8
         XTqQeNj1IpfywRBR72rQzpd9jd82IdvlOPBd92i5Dis8vYR/kA0+pJKjrkpAINQHDOEY
         2zKw==
X-Forwarded-Encrypted: i=1; AJvYcCWpxiMVS7YLLwbGoYwHHZmLBo0rKPt/D3MuxXBxlymBeFAJURMLhhRaMjfTZa/TkNpMl6Mg8usKp92S6NQLeKHTygbCkM+mj6W9vEwORmU78bI=
X-Gm-Message-State: AOJu0Yz9AashuNzV4Ib6WGBC5UoynKIxtgcqKuUkXUXc0uzL8ah78akT
	+ngiqV14bR3S8ENwGkw4X3ZPnydFgk9wHZ5xr3qNn0fG53hgc33RU3PGTu/suxY=
X-Google-Smtp-Source: AGHT+IHg/fk42jw6rlYve+PtuNCjcIGhx+aS7sngMv/JYvGAT/GBkMZPb0po+xBYLkmZmcqsfyAR5Q==
X-Received: by 2002:a05:600c:5128:b0:416:3de5:133d with SMTP id o40-20020a05600c512800b004163de5133dmr8063687wms.7.1713223855973;
        Mon, 15 Apr 2024 16:30:55 -0700 (PDT)
Received: from [172.20.10.2] ([37.169.26.183])
        by smtp.gmail.com with ESMTPSA id s11-20020a5d69cb000000b00346bf37c97bsm12811551wrw.63.2024.04.15.16.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 16:30:55 -0700 (PDT)
Message-ID: <64c765e4-698f-49d6-8d17-4b512c3dc8ec@linaro.org>
Date: Tue, 16 Apr 2024 01:30:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/3] dt-bindings: reset: Add Amlogic T7 Reset Controller
To: Kelvin Zhang <kelvin.zhang@amlogic.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zelong Dong <zelong.dong@amlogic.com>
References: <20240329-t7-reset-v1-0-4c6e2e68359e@amlogic.com>
 <20240329-t7-reset-v1-1-4c6e2e68359e@amlogic.com>
 <927ad2cb-3b41-4eda-b930-856be64ae9ba@linaro.org>
 <10650c59-96f2-4234-b5fd-aa8efec90e5b@linaro.org>
 <579a1569-7bba-491f-ba5e-7cfcb34ccc1f@linaro.org>
 <c7e243e3-3f61-4d63-8727-3837838bdfcc@linaro.org>
 <48005005-54ad-473b-826d-23b0b3f3a52c@amlogic.com>
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
In-Reply-To: <48005005-54ad-473b-826d-23b0b3f3a52c@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_163058_733346_71F7181F 
X-CRM114-Status: GOOD (  28.08  )
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

T24gMTUvMDQvMjAyNCAxMjozMSwgS2VsdmluIFpoYW5nIHdyb3RlOgo+IAo+IE9uIDIwMjQvNC8x
MyAwMjowMywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gWyBFWFRFUk5BTCBFTUFJTCBd
Cj4+Cj4+IE9uIDEyLzA0LzIwMjQgMTk6NTcsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+
PiBPbiAxMi8wNC8yMDI0IDE1OjEyLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4+PiBIaSwKPj4+
Pgo+Pj4+IE9uIDI5LzAzLzIwMjQgMjA6MzksIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+
Pj4+IE9uIDI5LzAzLzIwMjQgMTA6MTcsIEtlbHZpbiBaaGFuZyB2aWEgQjQgUmVsYXkgd3JvdGU6
Cj4+Pj4+PiBGcm9tOiBaZWxvbmcgRG9uZyA8emVsb25nLmRvbmdAYW1sb2dpYy5jb20+Cj4+Pj4+
Pgo+Pj4+Pj4gQWRkIGEgbmV3IGNvbXBhdGlibGUgYW5kIHRoZSByZWxhdGVkIGhlYWRlciBmaWxl
Cj4+Pj4+PiBmb3IgQW1sb2dpYyBUNyBSZXNldCBDb250cm9sbGVyLgo+Pj4+Pj4KPj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IFplbG9uZyBEb25nIDx6ZWxvbmcuZG9uZ0BhbWxvZ2ljLmNvbT4KPj4+Pj4+
IFNpZ25lZC1vZmYtYnk6IEtlbHZpbiBaaGFuZyA8a2VsdmluLnpoYW5nQGFtbG9naWMuY29tPgo+
Pj4+Pj4gLS0tCj4+Pj4+PiDCoMKgIC4uLi9iaW5kaW5ncy9yZXNldC9hbWxvZ2ljLG1lc29uLXJl
c2V0LnlhbWzCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsKPj4+Pj4+IMKgwqAgaW5jbHVkZS9kdC1i
aW5kaW5ncy9yZXNldC9hbWxvZ2ljLHQ3LXJlc2V0LmjCoMKgwqDCoMKgwqAgfCAxOTcgKysrKysr
KysrKysrKysrKysrKysrCj4+Pj4+PiDCoMKgIDIgZmlsZXMgY2hhbmdlZCwgMTk4IGluc2VydGlv
bnMoKykKPj4+Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3Jlc2V0L2FtbG9naWMsbWVzb24tcmVzZXQueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yZXNldC9hbWxvZ2ljLG1lc29uLXJlc2V0LnlhbWwKPj4+Pj4+
IGluZGV4IGYwYzZjMGRmMGNlMy4uZmVmZTM0M2U1YWZlIDEwMDY0NAo+Pj4+Pj4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2V0L2FtbG9naWMsbWVzb24tcmVzZXQu
eWFtbAo+Pj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2V0
L2FtbG9naWMsbWVzb24tcmVzZXQueWFtbAo+Pj4+Pj4gQEAgLTE5LDYgKzE5LDcgQEAgcHJvcGVy
dGllczoKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgLSBhbWxvZ2ljLG1lc29uLWExLXJlc2V0ICMg
UmVzZXQgQ29udHJvbGxlciBvbiBBMSBhbmQgY29tcGF0aWJsZSBTb0NzCj4+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgIC0gYW1sb2dpYyxtZXNvbi1zNC1yZXNldCAjIFJlc2V0IENvbnRyb2xsZXIgb24g
UzQgYW5kIGNvbXBhdGlibGUgU29Dcwo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCAtIGFtbG9naWMs
YzMtcmVzZXQgIyBSZXNldCBDb250cm9sbGVyIG9uIEMzIGFuZCBjb21wYXRpYmxlIFNvQ3MKPj4+
Pj4+ICvCoMKgwqDCoMKgIC0gYW1sb2dpYyx0Ny1yZXNldCAjIFJlc2V0IENvbnRyb2xsZXIgb24g
VDcgYW5kIGNvbXBhdGlibGUgU29Dcwo+Pj4+Pj4KPj4+Pj4KPj4+Pj4gSWYgdGhlcmUgaXMgZ29p
bmcgdG8gYmUgYW55IHJlc2VuZCwgcGxlYXNlIGRyb3AgdGhlIGNvbW1lbnQuIEl0J3Mgbm90Cj4+
Pj4+IHJlYWxseSBoZWxwZnVsIGFuZCBtYWtlcyBpdCB0cmlja2llciB0byByZWFkLgo+Pj4+Pgo+
Pj4+Pj4gwqDCoMKgwqAgcmVnOgo+Pj4+Pj4gwqDCoMKgwqDCoMKgIG1heEl0ZW1zOiAxCj4+Pj4+
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9hbWxvZ2ljLHQ3LXJlc2V0
LmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L2FtbG9naWMsdDctcmVzZXQuaAo+Pj4+Pj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uY2E0YTgzMmVl
ZWVjCj4+Pj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4+PiArKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdz
L3Jlc2V0L2FtbG9naWMsdDctcmVzZXQuaAo+Pj4+Pj4gQEAgLTAsMCArMSwxOTcgQEAKPj4+Pj4+
ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBNSVQpICovCj4+
Pj4+PiArLyoKPj4+Pj4+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjQgQW1sb2dpYywgSW5jLiBBbGwg
cmlnaHRzIHJlc2VydmVkLgo+Pj4+Pj4gKyAqLwo+Pj4+Pj4gKwo+Pj4+Pj4gKyNpZm5kZWYgX0RU
X0JJTkRJTkdTX0FNTE9HSUNfVDdfUkVTRVRfSAo+Pj4+Pj4gKyNkZWZpbmUgX0RUX0JJTkRJTkdT
X0FNTE9HSUNfVDdfUkVTRVRfSAo+Pj4+Pj4gKwo+Pj4+Pj4gKy8qIFJFU0VUMCAqLwo+Pj4+Pj4g
Ky8qwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDAtM8KgwqDCoMKgICovCj4+Pj4+Cj4+Pj4+IEkgYXNz
dW1lIHRoaXMgbWF0Y2hlcyBleGlzdGluZyBkcml2ZXJzIHdoaWNoIGRvIG5vdCB1c2UgSURzIGJ1
dCBtYXAgdGhlCj4+Pj4+IGJpbmRpbmcgdG8gaGFyZHdhcmUgdmFsdWU/IEkgcmVtZW1iZXIgd2Ug
dGFsa2VkIGFib3V0IGNoYW5naW5nIGl0LCBzbyBpZgo+Pj4+PiBzb21ldGhpbmcgaGFwcGVuZWQg
YWJvdXQgdGhpcyBhbmQgaXQgY291bGQgYmUgY2hhbmdlZDogcGxlYXNlIGNoYW5nZS4KPj4+Pgo+
Pj4+IEknbSBub3QgYXdhcmUgb2Ygc3VjaCBkaXNjdXNzaW9uLCBhbmQgSSBkb24ndCByZWFsbHkg
c2VlIHRoZSBpc3N1ZS4uLgo+Pj4+IHRob3NlcyBhcmUgSURzLCBhbmQgeWVzIHRoZXkgbWF0Y2gg
dGhlIEhhcmR3YXJlIG9mZnNldHMsIGFuZCA/Cj4+Pgo+Pj4gQmluZGluZ3MgYXJlIG5vdCBmb3Ig
aGFyZHdhcmUgb2Zmc2V0cy92YWx1ZXMvYWRkcmVzc2VzLiBJdCdzIGp1c3Qgbm90IGEKPj4+IGJp
bmRpbmcuCj4+Pgo+Pj4gSSBxdWlja2x5IGxvb2tlZCBhdCB5b3VyIGRyaXZlciBwYXRjaCBhbmQg
aXQgY29uZmlybXM6IG5vdCBhIGJpbmRpbmcuCj4+PiBCaW5kaW5nIGNvbnN0YW50IGlzIHVzZWQg
YnkgdGhlIGRyaXZlciBhbmQgRFRTIGNvbnN1bWVyLgo+Pj4KPj4+IEkgYW0gcmVhbGx5IHN1cmUg
d2UgaGFkIHRoaXMgdGFsayBpbiB0aGUgcGFzdCwgYnV0IGNvdWxkIGJlIEkgdGhpbmsKPj4+IGFi
b3V0IGRpZmZlcmVudCBwbGF0Zm9ybS4gU2luY2UgdGhpcyBpcyBub3QgYSBiaW5kaW5nLCBJIGRv
IG5vdCB0aGluawo+Pj4gY2xhaW1pbmcgdGhlcmUgaXMgYW55IEFCSSBoZXJlIGlzIHJlYXNvbmFi
bGUuIEZlZWwgZnJlZSB0byBzdG9yZSB0aGVtCj4+PiB3aXRoIG90aGVyIGhhcmR3YXJlIHZhbHVl
cywgbGlrZSBpbiBEVFMgaGVhZGVycyBldGMuIFdlIGFscmVhZHkgbW92ZWQgdG8KPj4+IERUUyBo
ZWFkZXJzIHNldmVyYWwgc3VjaCAibm9uLWJpbmRpbmciIGNvbnN0YW50cy4KPj4KPj4gVW4tYWNr
ZWQuCj4+Cj4+IEkgbG9va2VkIGF0IG15IGFyY2hpdmVzIGFuZCB3ZSBkaWQgdGFsayBhYm91dCBp
dCBhbmQgeW91IHdlcmUgQ0NlZDoKPj4KPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
ZGV2aWNldHJlZS9jMDg4ZTAxYy0wNzE0LTgyYmUtODM0Ny02MTQwZGFmNTY2NDBAbGluYXJvLm9y
Zy8KPj4gc2ltcGxlLXJlc2V0IGlzIGFuIGV4Y2VwdGlvbi4KPj4KPj4gU28gdG8gcmVjYXA6Cj4+
IFRoYXQncyBub3QgYSBiaW5kaW5nLiBEb24ndCBhZGQgc29tZSByZWFsIHZhbHVlcyB0byBiaW5k
aW5nIGhlYWRlcnMKPj4gYmVjYXVzZSBpdCBpcyBub3QgYSBiaW5kaW5nIHRoZW4uCgpTbyB3aGF0
J3MgZXhhY3RseSBhIGJpbmRpbmcgdGhlbj8gcmFuZG9tIGxpbmVhciBudW1iZXJzIHRoYXQgbWVh
bnMgbm90aGluZyBjYW4gYmUgYSBiaW5kaW5nCmJ1dCByZWdpc3RlcnMgbnVtYmVycyBjYW4ndCBi
ZSA/IHdoeSA/IEkgc3RpbGwgZG9uJ3QgdW5kZXJzdGFuZCwgd2h5IHRoaXMgc3VkZGVubHkgZ2V0
cyBwcm9ibGVtYXRpYyA/Cgo+Pgo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1kZXZp
Y2V0cmVlL0NBSzhQM2ExQVB6czc0WVRjWj1tNDNHM3pybXdKWktjWVNUdlY1ZUREUVgtMzdVWTdU
d0BtYWlsLmdtYWlsLmNvbS8KPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZGV2aWNl
dHJlZS9DQUs4UDNhMGZESlF2R0xFdEcwZnhMa0cwOEZoOVY3TEVNUHN4NEFhUysyTGRvX3hXeHdA
bWFpbC5nbWFpbC5jb20vCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWRldmljZXRy
ZWUvYjYwZjVmZDItZGM0OC05Mzc1LWRhMWMtZmZjZmU4MjkyNjgzQGxpbmFyby5vcmcvCj4+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWRldmljZXRyZWUvNDE4YzVmMGMtNTI3OS00MWY1
LTM3MDUtMzQ1ZWM5YTk3ZWEyQGxpbmFyby5vcmcvCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDE0MDExMTE0MTUuMjkzOTUuYXJuZEBhcm5kYi5kZS8KPj4KPiBHb3QgaXQuIFdpbGwg
ZGVsZXRlIGFtbG9naWMsdDctcmVzZXQuaCBhbmQgdXNlIHRoZSBoYXJkd2FyZSBudW1iZXJzCj4g
ZGlyZWN0bHkgaW4gdGhlIERULiA+Cj4gSGkgTmVpbCwKPiBBcyB5b3Uga25vdywgQW1sb2dpYyBy
ZXNldCBjb250cm9sbGVyIGlzIGRpdmlkZWQgaW50byBzZXZlcmFsIGdyb3VwczogcmVzZXQwLCBy
ZXNldDEsIC4uLiwgcmVzZXROLiBJJ2QgbGlrZSB0byBkaXNjdXNzIHRoZSByYXRpb25hbGl0eSBv
ZiBzcGxpdHRpbmcgdGhlIG9uZSBkZXZpY2Ugbm9kZSBvZiByZXNldCBjb250cm9sbGVyIGludG8g
ZGV2aWNlIG5vZGVzIGFjY29yZGluZyB0byB0aGUgZ3JvdXBzLiBUaGVuIHdlIGNhbiB1c2UgdGhl
IGJpdCBudW1iZXIgd2l0aGluIHRoZSAncmVzZXRzJyBwcm9wZXJ0eS4KPiByZXNldDA6IHJlc2V0
LWNvbnRyb2xsZXJAMjAwMCB7Cj4gLi4uCj4gfTsKPiAKPiByZXNldDE6IHJlc2V0LWNvbnRyb2xs
ZXJAMjAwNCB7Cj4gLi4uCj4gfTsKPiAuLi4KPiAKPiBXaGF0IGRvIHlvdSB0aGluaz8KCk5vIHNp
bmNlIHlvdSdsbCBiYXNpY2FsbHkgYWRkIGEgbm9kZSBwZXIgcmVnaXN0ZXIsIHlvdSBuZWVkIHRv
IGFkZCBhIG5vZGUgZm9yIHRoZSB3aGlsZSByZXNldCBIVyBmdW5jdGlvbiwgYW5vdGhlcgpzb2x1
dGlvbiB3b3VsZCBiZSB0byBzcGxpdCB0aGUgcGhhbmRsZSBhcmd1bWVudHMgaW4gMiwgdGhlIGZp
cnN0IGZpcnN0IHdvdWxkIGJlIHRoZSByZXNldCBiYW5rLCBhbmQgdGhlIHNlY29uZCBvbmUKdGhl
IHJlc2V0IGxpbmUgZm9yIHRoZSBiYW5rLgoKQnV0IHN0aWxsIGl0J3MgYSByZWdyZXNzaW9uIGlu
IHJlYWRhYmlsaXR5IHRvIGRyb3AgdGhlIG1hY3JvcywgdW50aWwgZ3Bpb3Mgb3IgcGlucyB0aGUg
cmVzZXQgbnVtYmVyIGRvZXNuJ3QgbWVhbiBhbnl0aGluZyBwZXIgc2UuCgpOZWlsCgoKTmVpbAoK
PiBUaGFua3MhCj4+Cj4+IEJlc3QgcmVnYXJkcywKPj4gS3J6eXN6dG9mCj4+CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
