Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C948D43FEF
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Nov 2024 08:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4XBVQ1AcyH0cai0ct39BHer22sXOzHkJ6RTNOVSEnxo=; b=cMx/NREHcvcMfvy8qh9TitL2yb
	lrAT7PUcgvJaUWeWOO0Zzrq9dlizbIZHJItH+3BefsWRpHyPqiPL9B1KD0rTD5L7ZEDBIPzeGI3gN
	UA+zOpD5V8XiQxSnypmOgbJm5nB8QMgW9TVUvlmhbj4zeHVerUjj2CT800/+n6oNy23IMo0N9dhOW
	j9iFQ0Ne9bl0qOplFbDPAzk2AapxTffI/YUfsyQv3WCS1DgYudiIjegsnnaXwH8DwQbOtvj85hN1q
	d/n9rH1WP9XLlzwmeCl6+8sqFD1Yxv8WOmtgCTN6unHRj6HWkRyCI8wxP0Axt3mMTyf9lNtktU6om
	ZhuoRfpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCxLC-00000008oUp-1gEE;
	Mon, 18 Nov 2024 08:42:38 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCxKF-00000008oGJ-21nh
	for linux-amlogic@lists.infradead.org;
	Mon, 18 Nov 2024 08:41:41 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-38232c6311fso1276975f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 18 Nov 2024 00:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731919297; x=1732524097; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j8Tvpsfrzk7SMjxhB5HQe3fZdEwkv0xuam5EYzzOBvc=;
        b=d1E2SVQu2rz//3EWuItag92u7OZmeKhgHyUMyM+MGeWzTx/I7UFTjnXa9CleMBkUTf
         hl7RMih4Z7owAqwfJWSZu5Xt+QjoVbjBWCpgN1eq/HGpXH8xGBnimyeC1HJZ8pYZ5Mdb
         Sdt8d/72Xo5+i9C7H1zqzz0JotCpRranAHn2RHTYBx+VnfpwVz2KnTRaKZc13eRfq6Fz
         ajT3U0nIbs/MhhMzrNKYUxowgXXwIC+Tyrdb0wj6rXqNTju93dH01x6a60Pn0y/bG+EU
         14aRfgjTmwynfZXgRXMnbnDmNP+4j8aBGw/N5BSbqKXtmxXDBSqcLJ8xKO4iw1xav00U
         5Vcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731919297; x=1732524097;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j8Tvpsfrzk7SMjxhB5HQe3fZdEwkv0xuam5EYzzOBvc=;
        b=SH5xgS0As5OYKlv/SzAD83imvdNoDSft+wyZUFVYoQ5zZGO6+iyhXxhNJjUNhXXVnM
         oKI3wPzmER1zHyWIiXYorNjTaLV+MTHFXLkrKuOJOwdN+G5vOmXuQmXzxX7idX+ZZb6X
         Q+7CHHvoc7pSkl0yfvGUxQ35Og44ybaeFnepWxEtdKy0IPSD9JKmydhRD0OicpVAVyoH
         kx9Gq3LOipCV7obyHoqTUE8Dnz1RTmsCx2yRpIR5cU8PxBMbU+CyEnHFfiRs7Zp7Syfd
         xiNSgrwVMyJY9V5vSRcy1lKzzQ4Ob7ImIqk531kxR85z380xIuMMMQK67IQ39ALFuRZB
         MOtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwJPj10HJc6nBPHWnmgXI2f+bXLQ9f+3rPYWHxO2/ukXjCtdI+Q9kcIAflM5yen7rMeUvO4bUOsvOOJYKV@lists.infradead.org
X-Gm-Message-State: AOJu0YyP2sFSDw63tzUW692Ysv1+TPH6HalqP4Ci2bwjnueT9NfNyRXo
	+8v+lTR7ni4I1etLykGq/QxyDIihmaYpBNDLjKrYpxxRECKv8nNHKmW7Ekq5zcM=
X-Google-Smtp-Source: AGHT+IHLztPJBVIbOkJ8ko5/mWh3cnmCv//JSLg3JlabTV27WX4ibS11rR1jLnjQujt+qU40R+nrNw==
X-Received: by 2002:a05:6000:4814:b0:382:4a1b:16de with SMTP id ffacd0b85a97d-3824a1b19e2mr842207f8f.21.1731919297285;
        Mon, 18 Nov 2024 00:41:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:ed47:520d:3d5c:3acf? ([2a01:e0a:982:cbb0:ed47:520d:3d5c:3acf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3824a64d4ddsm765881f8f.34.2024.11.18.00.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 00:41:36 -0800 (PST)
Message-ID: <f4c33946-125b-459c-aa95-f34e7fb11185@linaro.org>
Date: Mon, 18 Nov 2024 09:41:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v6 4/5] pinctrl: meson: Add driver support for Amlogic A4
 SoCs
To: Rob Herring <robh@kernel.org>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com>
 <20241113-a4_pinctrl-v6-4-35ba2401ee35@amlogic.com>
 <20241113180405.GA653353-robh@kernel.org>
 <1764b1b4-336d-4ca5-ab21-8213691a9622@linaro.org>
 <CAL_Jsq+2v7=egxakPKZ90j9wro+prn5FOjuCGwwsYB8M1GP+mQ@mail.gmail.com>
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
In-Reply-To: <CAL_Jsq+2v7=egxakPKZ90j9wro+prn5FOjuCGwwsYB8M1GP+mQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_004139_529259_DE7CFC0F 
X-CRM114-Status: GOOD (  30.30  )
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

SGkgUm9iLAoKT24gMTUvMTEvMjAyNCAxODoxNCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gVGh1
LCBOb3YgMTQsIDIwMjQgYXQgMzoyMeKAr0FNIE5laWwgQXJtc3Ryb25nCj4gPG5laWwuYXJtc3Ry
b25nQGxpbmFyby5vcmc+IHdyb3RlOgo+Pgo+PiBPbiAxMy8xMS8yMDI0IDE5OjA0LCBSb2IgSGVy
cmluZyB3cm90ZToKPj4+IE9uIFdlZCwgTm92IDEzLCAyMDI0IGF0IDAzOjI5OjQyUE0gKzA4MDAs
IFhpYW53ZWkgWmhhbyB3cm90ZToKPj4+PiBBZGQgYSBuZXcgcGluY3RybCBkcml2ZXIgZm9yIEFt
bG9naWMgQTQgU29DcyB3aGljaCBzaGFyZQo+Pj4+IHRoZSBzYW1lIHJlZ2lzdGVyIGxheW91dCBh
cyB0aGUgcHJldmlvdXMgQW1sb2dpYyBTNC4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFhpYW53
ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+Pj4+IC0tLQo+Pj4+ICAgIGRyaXZl
cnMvcGluY3RybC9tZXNvbi9LY29uZmlnICAgICAgICAgICAgICB8ICAgIDYgKwo+Pj4+ICAgIGRy
aXZlcnMvcGluY3RybC9tZXNvbi9NYWtlZmlsZSAgICAgICAgICAgICB8ICAgIDEgKwo+Pj4+ICAg
IGRyaXZlcnMvcGluY3RybC9tZXNvbi9waW5jdHJsLWFtbG9naWMtYTQuYyB8IDEzMjQgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwo+Pj4+ICAgIDMgZmlsZXMgY2hhbmdlZCwgMTMzMSBpbnNl
cnRpb25zKCspCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL21lc29uL0tj
b25maWcgYi9kcml2ZXJzL3BpbmN0cmwvbWVzb24vS2NvbmZpZwo+Pj4+IGluZGV4IGNjMzk3ODk2
NzYyYy4uM2U5MGJiNWVjNDQyIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9tZXNv
bi9LY29uZmlnCj4+Pj4gKysrIGIvZHJpdmVycy9waW5jdHJsL21lc29uL0tjb25maWcKPj4+PiBA
QCAtNjcsNiArNjcsMTIgQEAgY29uZmlnIFBJTkNUUkxfTUVTT05fUzQKPj4+PiAgICAgICBzZWxl
Y3QgUElOQ1RSTF9NRVNPTl9BWEdfUE1YCj4+Pj4gICAgICAgZGVmYXVsdCB5Cj4+Pj4KPj4+PiAr
Y29uZmlnIFBJTkNUUkxfQU1MT0dJQ19BNAo+Pj4+ICsgICAgdHJpc3RhdGUgIkFtbG9naWMgQTQg
U29DIHBpbmN0cmwgZHJpdmVyIgo+Pj4+ICsgICAgZGVwZW5kcyBvbiBBUk02NAo+Pj4+ICsgICAg
c2VsZWN0IFBJTkNUUkxfTUVTT05fQVhHX1BNWAo+Pj4+ICsgICAgZGVmYXVsdCB5Cj4+Pj4gKwo+
Pj4+ICAgIGNvbmZpZyBQSU5DVFJMX0FNTE9HSUNfQzMKPj4+PiAgICAgICB0cmlzdGF0ZSAiQW1s
b2dpYyBDMyBTb0MgcGluY3RybCBkcml2ZXIiCj4+Pj4gICAgICAgZGVwZW5kcyBvbiBBUk02NAo+
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVzb24vTWFrZWZpbGUgYi9kcml2ZXJz
L3BpbmN0cmwvbWVzb24vTWFrZWZpbGUKPj4+PiBpbmRleCA5ZTUzOGI5ZmZiOWIuLmM5MmE2NWE4
MzM0NCAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvbWVzb24vTWFrZWZpbGUKPj4+
PiArKysgYi9kcml2ZXJzL3BpbmN0cmwvbWVzb24vTWFrZWZpbGUKPj4+PiBAQCAtMTAsNSArMTAs
NiBAQCBvYmotJChDT05GSUdfUElOQ1RSTF9NRVNPTl9BWEcpICs9IHBpbmN0cmwtbWVzb24tYXhn
Lm8KPj4+PiAgICBvYmotJChDT05GSUdfUElOQ1RSTF9NRVNPTl9HMTJBKSArPSBwaW5jdHJsLW1l
c29uLWcxMmEubwo+Pj4+ICAgIG9iai0kKENPTkZJR19QSU5DVFJMX01FU09OX0ExKSArPSBwaW5j
dHJsLW1lc29uLWExLm8KPj4+PiAgICBvYmotJChDT05GSUdfUElOQ1RSTF9NRVNPTl9TNCkgKz0g
cGluY3RybC1tZXNvbi1zNC5vCj4+Pj4gK29iai0kKENPTkZJR19QSU5DVFJMX0FNTE9HSUNfQTQp
ICs9IHBpbmN0cmwtYW1sb2dpYy1hNC5vCj4+Pj4gICAgb2JqLSQoQ09ORklHX1BJTkNUUkxfQU1M
T0dJQ19DMykgKz0gcGluY3RybC1hbWxvZ2ljLWMzLm8KPj4+PiAgICBvYmotJChDT05GSUdfUElO
Q1RSTF9BTUxPR0lDX1Q3KSArPSBwaW5jdHJsLWFtbG9naWMtdDcubwo+Pj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3BpbmN0cmwvbWVzb24vcGluY3RybC1hbWxvZ2ljLWE0LmMgYi9kcml2ZXJzL3Bp
bmN0cmwvbWVzb24vcGluY3RybC1hbWxvZ2ljLWE0LmMKPj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uZWRjNWYyYmEyYzhhCj4+Pj4gLS0tIC9kZXYvbnVs
bAo+Pj4+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9tZXNvbi9waW5jdHJsLWFtbG9naWMtYTQuYwo+
Pj4+IEBAIC0wLDAgKzEsMTMyNCBAQAo+Pj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
KEdQTC0yLjAtb25seSBPUiBNSVQpCj4+Pj4gKy8qCj4+Pj4gKyAqIFBpbiBjb250cm9sbGVyIGFu
ZCBHUElPIGRyaXZlciBmb3IgQW1sb2dpYyBBNCBTb0MuCj4+Pj4gKyAqCj4+Pj4gKyAqIENvcHly
aWdodCAoYykgMjAyNCBBbWxvZ2ljLCBJbmMuIEFsbCByaWdodHMgcmVzZXJ2ZWQuCj4+Pj4gKyAq
IEF1dGhvcjogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+Cj4+Pj4gKyAq
ICAgICAgICAgSHVxaWFuZyBRaW4gPGh1cWlhbmcucWluQGFtbG9naWMuY29tPgo+Pj4+ICsgKi8K
Pj4+PiArCj4+Pj4gKyNpbmNsdWRlICJwaW5jdHJsLW1lc29uLmgiCj4+Pj4gKyNpbmNsdWRlICJw
aW5jdHJsLW1lc29uLWF4Zy1wbXguaCIKPj4+PiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8v
YW1sb2dpYy1ncGlvLmg+Cj4+Pj4gKwo+Pj4+ICsvKiBTdGFuZGFyZCBwb3J0ICovCj4+Pj4gKwo+
Pj4+ICsjZGVmaW5lIEdQSU9FXzAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAKPj4+PiAr
I2RlZmluZSBHUElPRV8xICAgICAgICAgICAgICAgICAgICAgICAgICAgICAxCj4+Pj4gKwo+Pj4+
ICsjZGVmaW5lIEdQSU9EXzAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDIKPj4+PiArI2Rl
ZmluZSBHUElPRF8xICAgICAgICAgICAgICAgICAgICAgICAgICAgICAzCj4+Pj4gKyNkZWZpbmUg
R1BJT0RfMiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgNAo+Pj4+ICsjZGVmaW5lIEdQSU9E
XzMgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDUKPj4+PiArI2RlZmluZSBHUElPRF80ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICA2Cj4+Pj4gKyNkZWZpbmUgR1BJT0RfNSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgNwo+Pj4+ICsjZGVmaW5lIEdQSU9EXzYgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDgKPj4+PiArI2RlZmluZSBHUElPRF83ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICA5Cj4+Pj4gKyNkZWZpbmUgR1BJT0RfOCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgMTAKPj4+PiArI2RlZmluZSBHUElPRF85ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAxMQo+Pj4+ICsjZGVmaW5lIEdQSU9EXzEwICAgICAgICAgICAgICAgICAgICAxMgo+Pj4+ICsj
ZGVmaW5lIEdQSU9EXzExICAgICAgICAgICAgICAgICAgICAxMwo+Pj4+ICsjZGVmaW5lIEdQSU9E
XzEyICAgICAgICAgICAgICAgICAgICAxNAo+Pj4+ICsjZGVmaW5lIEdQSU9EXzEzICAgICAgICAg
ICAgICAgICAgICAxNQo+Pj4+ICsjZGVmaW5lIEdQSU9EXzE0ICAgICAgICAgICAgICAgICAgICAx
Ngo+Pj4+ICsjZGVmaW5lIEdQSU9EXzE1ICAgICAgICAgICAgICAgICAgICAxNwo+Pj4KPj4+IFRo
ZSBjb252ZXJzaW9uIGZyb20gYmFuaytpbmRleCB0byBhIHNpbmdsZSBpbmRleCBzcGFjZSBzZWVt
cyBsZXNzIHRoYW4KPj4+IGlkZWFsLCBhbmQgbG9va3MgbGlrZSBhIHdvcmstYXJvdW5kIHRvIGZp
dCBpbnRvIHRoZSBleGlzdGluZyBkcml2ZXIgZnJvbQo+Pj4gYSBicmllZiBsb29rIGF0IGl0Lgo+
Pgo+PiBOb3QgcmVhbGx5LCBpdCBzaW1wbHkgYWRkcyBhIGN1c3RvbSB4bGF0ZSBwZXIgU29DLCBu
b3RoaW5nIHBhcnRpY3VsYXJ5IGhhY2t5Lgo+Pgo+PiBJIHdhcyByZWx1bmN0YW50IGF0IGZpcnN0
LCBidXQgc2luY2UgWGlhbndlaSBhZGRlZCB0aGUgcGx1bWJpbmcgZm9yIGEgcGVyLVNvQwo+PiB4
bGF0ZSwgdGhlbiBpdCB3YXMgZWFzeSB0byBhZGQgMy1jZWxscyBzdXBwb3J0Lgo+Pgo+Pj4KPj4+
IElmIHRoZXJlJ3Mgbm90IHJlYWxseSBiYW5rcyBvZiBHUElPcyBoZXJlLCB0aGVuIERUIHNob3Vs
ZG4ndCBoYXZlIHRoZW0KPj4+IGVpdGhlci4gVGhlIHF1ZXN0aW9uIGlzIGRvZXMgYW55dGhpbmcg
bmVlZCB0byBrbm93IHRoZSBiYW5rIG51bWJlcgo+Pj4gYW5kL29yIGluZGV4PyBJZiBpdCdzIG9u
bHkgZm9yIGh1bWFuIHJlYWRhYmlsaXR5IChhbmQgbWF0Y2hpbmcgdG8KPj4+IGRhdGFzaGVldCks
IHRoZW4ganVzdCBzb21ldGhpbmcgbGlrZSB0aGlzIGNhbiBiZSBkb25lOgo+Pj4KPj4+ICNkZWZp
bmUgR1BJT0QobikgKDIgKyAobikpCj4+Cj4+IFRoZXJlJ3Mgbm8gbGluZWFyIG1hcHBpbmcgcG9z
c2libGUsIGVhY2ggc2V0IG9mIGdwaW9zIGlzIGdyb3VwZWQgaW50byBsb2dpY2FsCj4+ICJiYW5r
cyIgcGVyIGdyb3VwIG9mIGZ1bmN0aW9ucywgYW5kIHRoaXMgZ3JvdXBpbmcgaXMgYWxzbyBpbiB0
aGUgZ3BpbyBjb250cm9sbGVyCj4+IHJlZ2lzdGVyIHNwYWNlLgo+IAo+IHYxIGhhZCBqdXN0IHRo
YXQuIFNvIGl0IGlzIHBvc3NpYmxlLiAKCkV4YWN0LCBpdCBoYWQganVzdCB0aGF0IGxpa2UgYWxs
IHRoZSBvdGhlciBhbWxvZ2ljIHBpbmN0cmwgZHJpdmVycyBzaW5jZSAyMDE3LApTbyBJIHdhaXRl
ZCBmb3IgdGhlIGJpbmRpbmdzIHRvIGJlIHJldmlld2VkIGFzIHVzdWFsLCBidXQgdGhlbiB0aGUg
YmluZGluZ3MKd2VyZSByZWplY3RlZC4KClNvIGhlcmUgd2UgYXJlIG5vdywgdHJ5aW5nIHRvIG5v
dCAidXNpbmcgZGVmaW5lcyBmb3IgR1BJT3MiIGFzIHJlcXVlc3RlZCwKYW5kIFhpYW53ZWkgdHJp
ZWQgaGlzIGJlc3QgYW5kIHdlIGFncmVlZCBvbiB0aGlzIDMtY2VsbHMgc29sdXRpb24gd2hpY2gK
aXMgbXVjaCBiZXR0ZXIgZGVzaWduZWQgb24gdGhlIGJpbmRpbmdzIHNpZGUgYW5kIHdvbid0IG5l
ZWQgYW55bW9yZQpoZWFkZXIgZmlsZSBmb3IgZnV0dXJlIFNvQ3MgYmluZGluZ3Mgd2hpY2ggaXMg
YSBodWdlIHdpbi4KClRoZSBzbWFsbCBkb3duc2lkZSBpcyBhIGN1c3RvbSB4bGF0ZSBmdW5jdGlv
biwgYnV0IGFzIEkgcG9pbnRlZCwgdGhlcmUncwpubyBsaW5lYXIgbWFwcGluZyBwb3NzaWJsZSBi
ZXR3ZWVuIGJhbmtzLCB0aGUgY3VycmVudCBiaW5kaW5ncyB3aXRoIGEKc2V0IG9mIGRlZmluZXMg
Zm9yIGVhY2ggZ3BpbyBzdGlsbCByZXF1aXJlcyBhIGNhbGN1bGF0aW9uIHRvIGdldCB0aGUKcmVn
aXN0ZXIvb2Zmc2V0IHZhbHVlLCBzbyB0aGlzIHNvbHV0aW9uIGRvZXNuJ3QgY2hhbmdlIG11Y2gg
aGVyZS4KClJlcXVlc3RpbmcgYSBncGlvIGlzIGEgc2xvdyBwYXRoLCBhZGRpbmcgMiBjb21wYXJp
c29ucyBhbmQgYW4gYWRkaXRpb24KaXMgYW4gYWNjZXB0YWJsZSBjb3N0IHRvIG5vdCBhZGQgbW9y
ZSBoZWFkZXIgZmlsZXMgaW4gdGhlIGZ1dHVyZS4KCk5laWwKCiA+IE5vIG9uZSByZXZpZXdlZCB0
aGUgZHJpdmVyIHRoZW4sPiBzbyBJIGRvbid0IGtub3cgaWYgdGhhdCB3YXMgbGVzcyB0aGFuIGlk
ZWFsIG9uIHRoZSBkcml2ZXIgc2lkZS4gQnV0IGl0Cj4gbG9va3MgbGlrZSB0aGF0IGxpbmVhciBt
YXAgd2FzIGp1c3QgbW92ZWQgZnJvbSBEVCBpbnRvIHRoZSBkcml2ZXIuIFdoeQo+IGFyZSB0aGVy
ZSBhIGJ1bmNoIG9mIGRlZmluZXMgY3JlYXRpbmcgYSBsaW5lYXIgbWFwcGluZz8gVGhlIHhsYXRl
KCkKPiBmdW5jdGlvbiBqdXN0IGNvbnZlcnRzIGJhbmsraW5kZXggaW50byBhIGxpbmVhciBudW1i
ZXIuIEF0IHNvbWUgcG9pbnQKPiB5b3UgbmVlZCBhcnJheXMgb2Ygc2V0dGluZ3MgSSBzdXBwb3Nl
LCBidXQgd2h5IGRvIHlvdSBuZWVkIGEgI2RlZmluZQo+IGZvciBldmVyeSBpbmRleD8gV2h5IG5v
dCBhbiBhcnJheSBwZXIgYmFuaz8gSSBzdXBwb3NlIHlvdSBjb3VsZCB1c2UKPiB0aGUgYWJvdmUg
ZGVmaW5lIHdpdGhpbiB0aGUgZHJpdmVyIHRvIGF0IGxlYXN0IG5vdCBoYXZlIGEgYnVuY2ggb2YK
PiBkZWZpbmVzLgo+IAo+IFJvYgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
