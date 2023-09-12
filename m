Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53699CA0ECA
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Sep 2023 08:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rfOVV/k9CbWGcqr0uhoHwVh0BntNNGjgp8bHBOJFs4=; b=wJmU7cVfBlTSoCAIsLn6cmCCfc
	v62TnmdI3RLKX80lRFn4WY4XeV/IPhz0rYCZ0MhxdpwbMZ2bJgSSvyLa99M5y6T+n16UXVgl2UVOy
	IqXC2ea1D6cbIQIoUHssAXjaa9AWneu6bYHnSPDy0yaeLWJfhCPfLWy+TyDkUO6dU6+PnEMeLR4tG
	+Z0iKXH2dVu+K0hOphKeXAL3kXLWnNIxhBOxta9kXczPIYGATdCKhBrGyNDT0PKQIROEnENuFSw/u
	Vv5+zHyLUVSnxrWRJclNsHoM+Da/U4UsImA4agRWUC9SrEVGRqdeITwm9jeWwI+loVl7a15qQ4vwR
	0mcAFuLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfyt6-002bAO-2o;
	Tue, 12 Sep 2023 08:36:48 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfyt4-002b8n-15
	for linux-amlogic@lists.infradead.org;
	Tue, 12 Sep 2023 08:36:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-401bdff4cb4so57207345e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 12 Sep 2023 01:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694507802; x=1695112602; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YDYOCa6xctYXF6LIcPiJ4hYpbG9p0QfDxLuxAJn4eSc=;
        b=so0xYA/6BrB6CJKSM/CXl/YmFVnL0dOOitJa6A35IgzsmIga/1Iu/BBIF+fqLDeOjr
         ZqycOdTNJMIh+PBI5puMCgcVONZqqxHNLKYbOU4wxE6wqo3sX0Ax0odXjsO2dyokyvF5
         k3arS8yt7ikR6m66QhdsSaILlXymA6BwqwWPJeTWSmKF7uUFKQWDMKjAWl+nx9l+CDXm
         zYmeSfakp9JqE9rLBjYonTtWNHKrwvxcURptYANADpHabQgCtt6jVR8GCdmxuWlfgWqe
         otoP9SbCILbKBzEI4eHuk+Zj/oNbEx7hC5K6V1qP3NWRF66vBe5OwWJ2RgRg69xA6eDT
         XHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694507802; x=1695112602;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YDYOCa6xctYXF6LIcPiJ4hYpbG9p0QfDxLuxAJn4eSc=;
        b=u5+vyv7E2AmELelMA5tVX7mx+ivGrHicKpPupu6gj8gQbrBszK400nu8pAqRuZdw+Z
         9PqcwGD0OOgwj6o2MxEJw1X/vPr713gYu+foEE9+y7btJ8f8+L8fn+CCJqVLZImcBwi4
         b5KFOa/pEGQ4zAUKJ/gfkjqMb+btlksD1VXHF6JLbEtoFHzG42jIbSK5iJREd+yEU2C+
         UvFfsKxEMoBfA2zlzg0p+QipU/8eStE9+mfwFWRu79PdpiDZDSUmhtmSdR1j7AnL/s1b
         RT2Jp0YCbks1iUOsLDSIH9lQ+9/vjQ4jdDUAUnX5zUnicZexL3hTfdr0jkHSdGf9V1eT
         tj7A==
X-Gm-Message-State: AOJu0YxqfmaFNsPNVOAbHsbPqb5MHK041MJyyqo7nXbrFZHfW13+ZidY
	CEPsb8GVWefjqUzZXoGDFlIDQw==
X-Google-Smtp-Source: AGHT+IHFuzosoThYKD/AZNkdK3+DmtTy0iulfjfbmAF8jtEnRCTfTfP3MynNUGectudSMe3tSUQfmQ==
X-Received: by 2002:a05:600c:4a11:b0:402:bcac:5773 with SMTP id c17-20020a05600c4a1100b00402bcac5773mr10099570wmp.38.1694507802214;
        Tue, 12 Sep 2023 01:36:42 -0700 (PDT)
Received: from [192.168.7.189] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id n10-20020a05600c294a00b003fefaf299b6sm12171135wmd.38.2023.09.12.01.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 01:36:41 -0700 (PDT)
Message-ID: <5bb7dc93-66dd-4b7b-8c2f-89a9b249daae@linaro.org>
Date: Tue, 12 Sep 2023 10:36:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 1/3] dt-bindings: reset: Add compatible and DT bindings
 for Amlogic C3 Reset Controller
Content-Language: en-US, fr
To: Zelong Dong <Zelong.Dong@amlogic.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, kelvin.zhang@amlogic.com
References: <20230719060954.14864-1-zelong.dong@amlogic.com>
 <20230719060954.14864-2-zelong.dong@amlogic.com>
 <f7b72ee90009f6749700a7bd79a3a63786a82a32.camel@pengutronix.de>
 <55cbdbba-39c6-7415-37db-97d2c35412cb@linaro.org>
 <076b59c0-7585-ea98-014c-cd70f92df002@amlogic.com>
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
In-Reply-To: <076b59c0-7585-ea98-014c-cd70f92df002@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_013646_399050_6512CDE6 
X-CRM114-Status: GOOD (  14.89  )
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

SGksCgpPbiAxMi8wOS8yMDIzIDA4OjM3LCBaZWxvbmcgRG9uZyB3cm90ZToKPiDlnKggMjAyMy83
LzMxIDE3OjE3LCBOZWlsIEFybXN0cm9uZyDlhpnpgZM6Cj4+IE9uIDI4LzA3LzIwMjMgMTc6NDks
IFBoaWxpcHAgWmFiZWwgd3JvdGU6Cj4+PiBPbiBNaSwgMjAyMy0wNy0xOSBhdCAxNDowOSArMDgw
MCwgemVsb25nIGRvbmcgd3JvdGU6Cj4+Pj4gRnJvbTogWmVsb25nIERvbmcgPHplbG9uZy5kb25n
QGFtbG9naWMuY29tPgo+Pj4+Cj4+Pj4gQWRkIG5ldyBjb21wYXRpYmxlIGFuZCBEVCBiaW5kaW5n
cyBmb3IgQW1sb2dpYyBDMyBSZXNldCBDb250cm9sbGVyCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBaZWxvbmcgRG9uZyA8emVsb25nLmRvbmdAYW1sb2dpYy5jb20+Cj4+Pj4gLS0tCj4+Pj4gwqAg
Li4uL2JpbmRpbmdzL3Jlc2V0L2FtbG9naWMsbWVzb24tcmVzZXQueWFtbMKgwqAgfMKgwqAgMSAr
Cj4+Pj4gwqAgaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9hbWxvZ2ljLGMzLXJlc2V0LmjCoCB8
IDExOSArKysrKysrKysrKysrKysrKysKPj4+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDEyMCBpbnNl
cnRpb25zKCspCj4+Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3Mv
cmVzZXQvYW1sb2dpYyxjMy1yZXNldC5oCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2V0L2FtbG9naWMsbWVzb24tcmVzZXQueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZXNldC9hbWxvZ2ljLG1lc29uLXJl
c2V0LnlhbWwKPj4+PiBpbmRleCBkM2ZkZWU4OWQ0ZjguLmYwYzZjMGRmMGNlMyAxMDA2NDQKPj4+
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXQvYW1sb2dpYyxt
ZXNvbi1yZXNldC55YW1sCj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3Jlc2V0L2FtbG9naWMsbWVzb24tcmVzZXQueWFtbAo+Pj4+IEBAIC0xOCw2ICsxOCw3IEBA
IHByb3BlcnRpZXM6Cj4+Pj4gwqDCoMKgwqDCoMKgwqAgLSBhbWxvZ2ljLG1lc29uLWF4Zy1yZXNl
dCAjIFJlc2V0IENvbnRyb2xsZXIgb24gQVhHIGFuZCBjb21wYXRpYmxlIFNvQ3MKPj4+PiDCoMKg
wqDCoMKgwqDCoCAtIGFtbG9naWMsbWVzb24tYTEtcmVzZXQgIyBSZXNldCBDb250cm9sbGVyIG9u
IEExIGFuZCBjb21wYXRpYmxlIFNvQ3MKPj4+PiDCoMKgwqDCoMKgwqDCoCAtIGFtbG9naWMsbWVz
b24tczQtcmVzZXQgIyBSZXNldCBDb250cm9sbGVyIG9uIFM0IGFuZCBjb21wYXRpYmxlIFNvQ3MK
Pj4+PiArwqDCoMKgwqDCoCAtIGFtbG9naWMsYzMtcmVzZXQgIyBSZXNldCBDb250cm9sbGVyIG9u
IEMzIGFuZCBjb21wYXRpYmxlIFNvQ3MKPj4+Pgo+Pj4+IMKgwqDCoCByZWc6Cj4+Pj4gwqDCoMKg
wqDCoCBtYXhJdGVtczogMQo+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jl
c2V0L2FtbG9naWMsYzMtcmVzZXQuaCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvYW1sb2dp
YyxjMy1yZXNldC5oCj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+PiBpbmRleCAwMDAwMDAw
MDAwMDAuLmQ5MTI3ODYzZjYwMwo+Pj4+IC0tLSAvZGV2L251bGwKPj4+PiArKysgYi9pbmNsdWRl
L2R0LWJpbmRpbmdzL3Jlc2V0L2FtbG9naWMsYzMtcmVzZXQuaAo+Pj4KPj4+IEdpdmVuIHRoYXQg
dGhpcyBpcyBvbmx5IGluY2x1ZGVkIGJ5Cj4+PiBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
YW1sb2dpYy1jMy5kdHNpLCBzaG91bGQgdGhpcyBoZWFkZXIgYmUKPj4+IG1vdmVkIHRvIGFyY2gv
YXJtNjQvYm9vdC9kdHMvYW1sb2dpYyA/Cj4+Cj4+IE1heWJlIEkgbWlzc2VkIHNvbWV0aGluZywg
YnV0IHNpbmNlIHdoZW4gc2hvdWxkIHdlIG1vdmUgYmluZGluZ3MgaGVhZGVycyB0byBhcmNoL3h4
eC9ib290L2R0cy92ZW5kb3IgPwo+Pgo+PiBOZWlsCj4+Cj4+Pgo+Pj4gcmVnYXJkcwo+Pj4gUGhp
bGlwcAo+Pgo+IEhpLAo+IEl0J3MgYmVlbiBhIHdoaWxlLCBob3cgd2lsbCB3ZSBkZWFsIHdpdGgg
dGhpcyBwYXRjaCA/Cj4gU2hvdWxkIHdlIGxldCB0aGlzIHBhdGNoIGFwcGx5IGZpcnN0PyBJZiBB
bWxvZ2ljIHJlc2V0IGJpbmRpbmdzIGhlYWRlcnMgbmVlZCB0byBiZSBtb3ZlZCB0byBhcmNoL3h4
eC9ib290L2R0cy92ZW5kb3IsIGNvdWxkIHdlIGFwcGx5IGl0IGluIGEgc2VwYXJhdGUgY2hhbmdl
PwoKUGxlYXNlIHJlYmFzZSBvbiB2Ni42LXJjMSBhbmQgcmVzZW5kIHdpdGggYWxsIHJldmlldy9h
Y2sgdGFncyBjb2xsZWN0ZWQuCgpJIHN0aWxsIGRvbid0IHVuZGVyc3RhbmQgd2h5IHRoZSBiaW5k
aW5ncyBoZWFkZXIgc2hvdWxkIGdvIGludG8gYXJjaC94eHgvYm9vdC9kdHMvdmVuZG9yLgoKTmVp
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
