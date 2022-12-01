Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CE2C43217
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Dec 2022 08:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nSsdS/JbOXT6yCUR5rWHi1OCS1uOzx2XLgNwqkS4PGE=; b=1B2ybhJT69G0QdoudMNsP7UcEf
	6nHRXigPKVao1HHvzlKMKGiZV30RDb14lJfS1ST3g5TR/gLJP9C9DcjlvMbsKWc/wjGgBTFkSHJek
	YBWxSzO3NQTV8LQtdypHstBxrB2/L7eeKQnaVS8ZsJhGAlejSIQYJGrD79YRPK0tpFq/iFvCRODSY
	1H9p/5dALb/tAhv9InEXzeKZHczjsQL7WYVmcDONiSfWBJGsfhUexqhporbMy8EBLvN6sIwv/uAro
	WLbpL13MI+oqNHF+ZzA72F/6eZCWqELgQoHN7U0GPEDhDr0d2+ZuNGd5FUkdcwLtpnlCpVUJEprsr
	UpoxQvOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0f3z-005vQi-FB; Thu, 01 Dec 2022 08:36:59 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0f3l-005vJ9-8L
	for linux-amlogic@lists.infradead.org; Thu, 01 Dec 2022 08:36:47 +0000
Received: by mail-wr1-x42f.google.com with SMTP id m14so1482608wrh.7
        for <linux-amlogic@lists.infradead.org>; Thu, 01 Dec 2022 00:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Oe1Bt00SWfWmsnndQyeMXHNrSaSoX25OpopVJE/Lc9A=;
        b=OUSIo1Z9bjA/LEqX2ib7YZAjnxawUT0Ps+MJgPB83SwRoQlrUz7B6KRXYiMKlIzXu2
         ayaWvgZj6bB4ftam8Q8r13tFDJgqeWbipn8rRN60tQ6W7xLBS0s1yL1TR13CRGJ8J7Bo
         p9W95XtBJs4yydI5UFjy6bgqlxhiPzyowbFlIW8IWGdhdryd7OAhqrKMAaYlkxDiWNT8
         YKO09Dn/wdHHI9UMLLCPOFz8jpQP5DtOBWBUl9QjPETBWogHdSrBqWVJ3b5Y9QK85F/7
         heM2uEH07z0cIC9AG7u847zmr/7keZSJAcWZhszEr4x1L2oRn4rd0AbAdchaYtl1CBZF
         58KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oe1Bt00SWfWmsnndQyeMXHNrSaSoX25OpopVJE/Lc9A=;
        b=qCqojhF++en55mtiEZC+/qx+eJytrJQ6vkjqFo1YwUkaLlQXXE9I7GmvkOPenRx9rz
         5czuR8hTbpjprOLvJHIwjGbqhdW4RDvIcxN2u7EOZJyV4BWH2/YoJyPUdIEwTH4Aal/k
         bXugzGHMTDHuNXsGqNDtam9uBS1ajwHJaqCGcIuV5Mcx91F54h9c7FhzOy/nYff0f2HT
         sXzAW/36DULwFJ2pSHARJBiwn58KjQXX2OLi7qv+xzrxj2qAaMpPM0cXYeGfLI+uIkq7
         He9pUQTk7nnU5AKPOBsaCJGtq9yx1tqQZtVrzz8X072WqLGfz8RE0zx/SdQ5W8Qq9P+Q
         FLBA==
X-Gm-Message-State: ANoB5pnYZzPfsmDsqcg+JYnHfTrmeCaCkCo55FayXht2Scw7GKgGkKeL
	qUDmSdSKWFXJVLDbX9sj95Ev7NCSsOqNk5po
X-Google-Smtp-Source: AA0mqf5mmeh5ZFnMWkb3HXAwM+p4TLFW/xcDaquaExg0QjuHkTof1pA4eToIeh/1AVNSGzM+/WMw3A==
X-Received: by 2002:a05:6000:83:b0:242:4a6:5baa with SMTP id m3-20020a056000008300b0024204a65baamr18636338wrx.102.1669883803159;
        Thu, 01 Dec 2022 00:36:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bec0:73a:70e1:228f? ([2a01:e0a:982:cbb0:bec0:73a:70e1:228f])
        by smtp.gmail.com with ESMTPSA id a13-20020adfed0d000000b0024219b1cb1bsm3751749wro.60.2022.12.01.00.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 00:36:42 -0800 (PST)
Message-ID: <60c8352f-81c6-72b2-6340-1d866c259937@linaro.org>
Date: Thu, 1 Dec 2022 09:36:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: neil.armstrong@linaro.org
Subject: Re: [PATCH V5 1/4] clk: meson: S4: add support for Amlogic S4 SoC PLL
 clock driver and bindings
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: kelvin.zhang@amlogic.com
References: <20221123021346.18136-1-yu.tu@amlogic.com>
 <20221123021346.18136-2-yu.tu@amlogic.com>
 <f03f331a-5666-298e-a1a2-bdb9bab11a48@linaro.org>
 <92b570ea-3ddc-8e91-5a7a-ed601bb7c02c@amlogic.com>
 <eb56ed39-cfaa-3368-a2c0-0a4e89440e40@linaro.org>
 <5b7176b4-d7a2-c67f-31c6-e842e0870836@linaro.org>
 <1jfse72wqk.fsf@starbuckisacylon.baylibre.com>
 <a6cf1b3f-259d-44b7-8a9a-2a0cd29c714b@amlogic.com>
 <1jedtnp7db.fsf@starbuckisacylon.baylibre.com>
 <29f06ea8-3795-46a4-fcd2-3f0d4c313ae7@amlogic.com>
Organization: Linaro Developer Services
In-Reply-To: <29f06ea8-3795-46a4-fcd2-3f0d4c313ae7@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_003645_333354_44D98111 
X-CRM114-Status: GOOD (  40.98  )
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

T24gMjgvMTEvMjAyMiAxNDozMCwgWXUgVHUgd3JvdGU6Cj4gSGkgSmVyb21lICwKPiAKPiBPbiAy
MDIyLzExLzI4IDIwOjMzLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+PiBbIEVYVEVSTkFMIEVNQUlM
IF0KPj4KPj4KPj4gT24gTW9uIDI4IE5vdiAyMDIyIGF0IDE1OjM5LCBZdSBUdSA8eXUudHVAYW1s
b2dpYy5jb20+IHdyb3RlOgo+Pgo+Pj4gSGkgSmVyb21lLAo+Pj4gwqDCoMKgwqBUaGFuayB5b3Ug
Zm9yIHlvdXIgcmVwbHkuCj4+Pgo+Pj4gT24gMjAyMi8xMS8yNSAxNzoyMywgSmVyb21lIEJydW5l
dCB3cm90ZToKPj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+PiBPbiBXZWQgMjMgTm92IDIwMjIg
YXQgMTQ6NTMsIEtyenlzenRvZiBLb3psb3dza2kKPj4+PiA8a3J6eXN6dG9mLmtvemxvd3NraUBs
aW5hcm8ub3JnPiB3cm90ZToKPj4+Pgo+Pj4+PiBPbiAyMy8xMS8yMDIyIDE0OjIzLCBOZWlsIEFy
bXN0cm9uZyB3cm90ZToKPj4+Pj4+IEhpLAo+Pj4+Pj4KPj4+Pj4+IE9uIDIzLzExLzIwMjIgMTI6
MTYsIFl1IFR1IHdyb3RlOgo+Pj4+Pj4+IEhpIEtyenlzenRvZiwKPj4+Pj4+PiDCoMKgIMKgwqDC
oMKgVGhhbmsgeW91IGZvciB5b3VyIHJlcGx5Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gT24gMjAyMi8xMS8y
MyAxODowOCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4+Pj4+Pj4gWyBFWFRFUk5BTCBF
TUFJTCBdCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IE9uIDIzLzExLzIwMjIgMDM6MTMsIFl1IFR1IHdyb3Rl
Ogo+Pj4+Pj4+Pj4gQWRkIHRoZSBTNCBQTEwgY2xvY2sgY29udHJvbGxlciBmb3VuZCBhbmQgYmlu
ZGluZ3MgaW4gdGhlIHM0IFNvQyBmYW1pbHkuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gU2lnbmVkLW9m
Zi1ieTogWXUgVHUgPHl1LnR1QGFtbG9naWMuY29tPgo+Pj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4+PiDC
oCDCoCAuLi4vYmluZGluZ3MvY2xvY2svYW1sb2dpYyxzNC1wbGwtY2xrYy55YW1swqDCoCB8wqAg
NTEgKwo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBUaGlzIGlzIHY1IGFuZCBzdGlsbCBiaW5kaW5ncyBhcmUg
aGVyZT8gQmluZGluZ3MgYXJlIGFsd2F5cyBzZXBhcmF0ZQo+Pj4+Pj4+PiBwYXRjaGVzLiBVc2Ug
c3ViamVjdCBwcmVmaXhlcyBtYXRjaGluZyB0aGUgc3Vic3lzdGVtIChnaXQgbG9nIC0tb25lbGlu
ZQo+Pj4+Pj4+PiAtLSAuLi4pLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBBbmQgdGhpcyB3YXMgc3BsaXQs
IHdhc24ndCBpdD8gV2hhdCBoYXBwZW5lZCBoZXJlPyE/Cj4+Pj4+Pj4KPj4+Pj4+PiBQdXQgYmlu
ZGluZ3MgYW5kIGNsb2NrIGRyaXZlciBwYXRjaCB0b2dldGhlciBmcm9tIEplcm9tZS4gTWF5YmUg
eW91IGNhbiByZWFkIHRoaXMgY2hhdCBoaXN0b3J5Lgo+Pj4+Pj4+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3IvYWxsLzFqeTF2NnoxNG4uZnNmQHN0YXJidWNraXNhY3lsb24uYmF5bGlicmUuY29tLwo+
Pj4+Pj4KPj4+Pj4+IEplcm9tZSB3YXMgYXNraW5nIHlvdSB0byBzZW5kIDIgcGF0Y2hzZXRzLCBv
bmUgd2l0aCA6Cj4+Pj4+PiAtIGJpbmRpbmdzIGluIHNlcGFyYXRlIHBhdGNoZXMKPj4+Pj4+IC0g
ZHJpdmVycyBpbiBzZXBhcmF0ZSBwYXRjaGVzCj4+Pj4+PiBhbmQgYSBzZWNvbmQgd2l0aCBEVCBj
aGFuZ2VzLgo+Pj4+IEluZGVlZCwgdGhpcyBpcyB3aGF0IHdhcyBhc2tlZC4gSXQgaXMgYWxpZ25l
ZCB3aXRoIEtyenlzenRvZidzIHJlcXVlc3QuCj4+Pgo+Pj4gQWNjb3JkaW5nIHRvIHlvdXIgZGlz
Y3Vzc2lvbiwgSSBzdGlsbCBzaG91bGQgc2VuZCBwYXRjaGVzIGluIHRoZSBwcmV2aW91cwo+Pj4g
d2F5IGluIHNlcmllcy4gQnV0IEknbSBnb2luZyB0byBjaGFuZ2UgaXQgbGlrZSB5b3Ugc3VnZ2Vz
dGVkLgo+Pj4gSSBkb24ndCBrbm93LCBhbSBJIGdldHRpbmcgaXQgcmlnaHQ/Cj4+Cj4+IDMgcGVv
cGxlIHRyaWVkIHRvIGV4cGxhaW4gdGhpcyBhbHJlYWR5IGFuZCB3ZSBhbGwgdG9sZCB5b3UgdGhl
IHNhbWUgdGhpbmcuCj4+Cj4+ICogMSBwYXRjaHNldCBwZXIgbWFpbnRhaW5lcjogY2xrIGFuZCBk
dAo+PiAqIGJpbmRpbmdzIG11c3QgYmUgZGVkaWNhdGVkIHBhdGNoZXMgLSBuZXZlciBtaXhlZCB3
aXRoIGRyaXZlciBjb2RlLgo+Pgo+PiBJIHN0cm9uZ2x5IHN1Z2dlc3QgdGhhdCB5b3UgdGFrZSBz
b21lIHRpbWUgdG8gKHJlKXJlYWQ6Cj4+ICogaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvcHJvY2Vz
cy9zdWJtaXR0aW5nLXBhdGNoZXMuaHRtbAo+PiAqIGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc3VibWl0dGluZy1wYXRjaGVzLmh0bWwKPj4KPj4gSWYgc3RpbGwg
dW5jbGVhciwgcGxlYXNlIHRha2Ugc29tZSB0aW1lIHRvIGxvb2sgYXQgdGhlIGtlcm5lbCBtYWls
aW5nCj4+IGxpc3QgYXJjaGl2ZSBhbmQgc2VlIGhvdyBvdGhlcnMgaGF2ZSBkb25lIHRoZSBzYW1l
IHRoaW5ncy4KPj4KPj4gVGh4Lgo+IAo+IEknbGwgY2hhbmdlIGl0IGFzIHlvdSBzdWdnZXN0LkJ1
dCBJIHN0aWxsIGRvbid0IHVuZGVyc3RhbmQgd2hhdCB5b3Ugc3VnZ2VzdGVkIGluIFYzLgo+IAo+
IEkgcmVtZW1iZXIgZGlzY3Vzc2luZyBpdCB3aXRoIHlvdSBhdCBWMy4KPiBodHRwczovL2xvcmUu
a2VybmVsLm9yL2FsbC8xankxdjZ6MTRuLmZzZkBzdGFyYnVja2lzYWN5bG9uLmJheWxpYnJlLmNv
bS8KPiAKPiAiPj4+PiBBbHNvIGl0IHdvdWxkIGJlIG5pY2UgdG8gc3BsaXQgdGhpcyBpbiB0d28g
c2VyaWVzLgo+ICA+Pj4+IEJpbmRpbmdzIGFuZCBkcml2ZXJzIGluIG9uZSwgYXJtNjQgZHQgaW4g
dGhlIG90aGVyLiBUaGVzZSBjaGFuZ2VzIGdvZXMKPiAgPj4+PiBpbiB0aHJvdWdoIGRpZmZlcmVu
dCB0cmVlcy4KPiAgPj4+IEF0IHByZXNlbnQsIEJpbmRpbmdzLCBEVFMgYW5kIGRyaXZlcnMgYXJl
IHRocmVlIHNlcmllcy4gRG8geW91IG1lYW4gdG8gcHV0Cj4gID4+PiBCaW5kaW5ncyBhbmQgZHJp
dmVycyB0b2dldGhlcj8gSWYgc28sIGNoZWNrcGF0Y2gucGwgd2lsbCByZXBvcnQgYSB3YXJuaW5n
Lgo+ICA+PiBZZXMgYmVjYXVzZSBwYXRjaGVzIGFyZSBub3QgaW4geWV0IHNvIHRoZXJlIGlzIGEg
Z29vZCByZWFzb24gdG8gaWdub3JlCj4gID4+IHRoZSB3YXJuaW5nLiBXYXJuaW5nIHdpbGwgbmV2
ZXIgc2hvdyB1cCBvbiB0aGUgYWN0dWFsIHRyZWUgaWYgdGhlCj4gID4+IHBhdGNoZXMgYXJlIGNv
cnJlY3RseSBvcmRlcmVkLgo+ICA+Cj4gID4gSSB0aGluayBCaW5kaW5nLCBEVFMgYW5kIGRyaXZl
cnMgdXNlIHRocmVlIHNlcmllcyBhbmQgeW91IHNhaWQgdHdvIHNlcmllcwo+ICA+IGlzIG5vdCBh
IGJpZyBwcm9ibGVtLiBUaHJlZSBzZXJpZXMgYXJlIHJlY29tbWVuZGVkIGZvciBjaGVja3BhdGNo
LnBsLCBJCj4gID4gdGhpbmsgaXQgc2hvdWxkIGJlIGVhc3kgZm9yIHRoYXQgdG8gc2VwYXJhdGUg
YW5kIG1lcmdl44CCCj4gCj4gTm8gLSBUaGVyZSBpcyBvbmx5IDIgc2VyaWVzLiAxIGZvciB0aGUg
YmluZGluZ3MgYW5kIGNsb2NrIGRyaXZlcnMgYW5kCj4gb25lIGZvciB0aGUgRFQgb25jZSB0aGlu
Z3MgYXJlIGluIgoKUGxlYXNlIHNlbmQgdGhlIGZvbGxvd2luZyBlbWFpbHM6CgoqIEZpcnN0IHBh
dGNoc2V0CgpbUEFUQ0ggVjYgMC8zXSBjbGs6IG1lc29uOiBBZGQgUzQgU29DIFBMTCBhbmQgUGVy
aXBoZXJhbCBjbG9jayBjb250cm9sbGVyCglbUEFUQ0ggdjYgMS8zXSBkdC1iaW5kaW5nczogY2xv
Y2s6IGRvY3VtZW50IEFtbG9naWMgUzQgU29DIFBMTCAmIHBlcmlwaGVyYWwgY2xvY2sgY29udHJv
bGxlcgoJW1BBVENIIHY2IDIvM10gY2xrOiBtZXNvbjogYWRkIHN1cHBvcnQgZm9yIEFtbG9naWMg
UzQgU29DIFBMTAoJW1BBVENIIHY2IDMvM10gY2xrOiBtZXNvbjogYWRkIHN1cHBvcnQgZm9yIEFt
bG9naWMgUzQgU29DIHBlcmlwaGVyYWwgY2xvY2sgY29udHJvbGxlcgoKMSkgd2lsbCBjb250YWlu
IG9ubHkgLnlhbWwgYW5kIGR0LWJpbmRpbmdzIGluY2x1ZGUKMikgd2lsbCBvbmx5IGhhdmUgZHJp
dmVycy9jbGsvbWVzb24gY2hhbmdlcwozKSB3aWxsIG9ubHkgaGF2ZSBkcml2ZXJzL2Nsay9tZXNv
biBjaGFuZ2VzCgoqIFNlY29uZCBwYXRjaHNldDoKCltQQVRDSCB2MSAwLzJdIGFybTY0OiBkdHM6
IG1lc29uOiBBZGQgUzQgU29DIFBMTCBhbmQgUGVyaXBoZXJhbCBjbG9jayBub2RlcwoJW1BBVENI
IHYxIDEvMl0gYXJtNjQ6IGR0czogbWVzb246IGFkZCBTNCBTb2MgUExMIGNsb2NrIGNvbnRyb2xs
ZXIgbm9kZQoJW1BBVENIIHYxIDIvMl0gYXJtNjQ6IGR0czogbWVzb246IGFkZCBTNCBTb2MgUGVy
aXBoZXJhbCBjbG9jayBjb250cm9sbGVyIG5vZGUKCjEpIGlzIHRoZSBwYXRjaCAzIG9mIHY1IHBh
dGNoc2V0CjIpIGlzIHRoZSBwYXRjaCA0IG9mIHY1IHBhdGNoc2V0CgpBbmQgaW4gdGhlIHNlY29u
ZCBjb3ZlciBsZXR0ZXIsIGV4cGxhaW4gdGhvc2UgcGF0Y2hlcyBjb21lcyBmcm9tIHRoZSBwcmV2
aW91cyBWNSBwYXRjaHNldAphbmQgYWRkIGEgbGluayB0byB0aGUgVjYgImRyaXZlcnMgKyBiaW5k
aW5ncyIgcGF0Y2hzZXQgYXMgYSBkZXBlbmRlbmN5LgoKTmVpbAo+IAo+Pgo+Pj4KPj4+Pgo+Pj4+
Pj4KPj4+Pj4+IFRoZW4gd2hlbiB0aGUgYmluZGluZ3MgKyBjbG9ja3MgcGF0Y2hlcyBhcmUgbWVy
Z2VkLCBhIHB1bGwgcmVxdWVzdCBvZiB0aGUgYmluZGluZ3MKPj4+Pj4+IGNhbiBiZSBkb25lIHRv
IG1lIHNvIEkgY2FuIG1lcmdlIGl0IHdpdGggRFQuCj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4+Cj4+
Pj4+Pj4+Cj4+Pj4+Pj4+PiDCoCDCoCBNQUlOVEFJTkVSU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKwo+
Pj4+Pj4+Pj4gwqAgwqAgZHJpdmVycy9jbGsvbWVzb24vS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEzICsKPj4+Pj4+Pj4+IMKgIMKgIGRyaXZlcnMv
Y2xrL21lc29uL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgwqAgMSArCj4+Pj4+Pj4+PiDCoCDCoCBkcml2ZXJzL2Nsay9tZXNvbi9zNC1wbGwuY8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgODc1ICsrKysrKysrKysrKysrKysr
Kwo+Pj4+Pj4+Pj4gwqAgwqAgZHJpdmVycy9jbGsvbWVzb24vczQtcGxsLmjCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgODggKysKPj4+Pj4+Pj4+IMKgIMKgIC4uLi9k
dC1iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHM0LXBsbC1jbGtjLmjCoMKgIHzCoCAzMCArCj4+Pj4+
Pj4+PiDCoCDCoCA3IGZpbGVzIGNoYW5nZWQsIDEwNTkgaW5zZXJ0aW9ucygrKQo+Pj4+Pj4+Pj4g
wqAgwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9jbG9jay9hbWxvZ2ljLHM0LXBsbC1jbGtjLnlhbWwKPj4+Pj4+Pj4+IMKgIMKgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9tZXNvbi9zNC1wbGwuYwo+Pj4+Pj4+Pj4gwqAgwqAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL21lc29uL3M0LXBsbC5oCj4+Pj4+Pj4+PiDCoCDC
oCBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHM0
LXBsbC1jbGtjLmgKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsczQtcGxsLWNsa2MueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHM0LXBsbC1jbGtj
LnlhbWwKPj4+Pj4+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+Pj4+Pj4+PiBpbmRleCAwMDAw
MDAwMDAwMDAuLmZkNTE3ZThlZjE0Zgo+Pj4+Pj4+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4+Pj4+Pj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsczQt
cGxsLWNsa2MueWFtbAo+Pj4+Pj4+Pj4gQEAgLTAsMCArMSw1MSBAQAo+Pj4+Pj4+Pj4gKyMgU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+Pj4+
Pj4+Pj4gKyVZQU1MIDEuMgo+Pj4+Pj4+Pj4gKy0tLQo+Pj4+Pj4+Pj4gKyRpZDogaHR0cDovL2Rl
dmljZXRyZWUub3JnL3NjaGVtYXMvY2xvY2svYW1sb2dpYyxzNC1wbGwtY2xrYy55YW1sIwo+Pj4+
Pj4+Pj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55
YW1sIwo+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4gK3RpdGxlOiBBbWxvZ2ljIE1lc29uIFMgc2VyaWFs
cyBQTEwgQ2xvY2sgQ29udHJvbGxlcgo+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4gK21haW50YWluZXJz
Ogo+Pj4+Pj4+Pj4gK8KgIC0gTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29t
Pgo+Pj4+Pj4+Pj4gK8KgIC0gSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+Cj4+
Pj4+Pj4+PiArwqAgLSBZdSBUdSA8eXUuaHVAYW1sb2dpYy5jb20+Cj4+Pj4+Pj4+PiArCj4+Pj4+
Pj4+IE9uZSBibGFuayBsaW5lLgo+Pj4+Pj4+Cj4+Pj4+Pj4gwqDCoCDCoEkgd2lsbCBkZWxldGUg
dGhpcywgb24gbmV4dCB2ZXJzaW9uIHBhdGNoLgo+Pj4+Pj4+Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiAr
Cj4+Pj4+Pj4+PiArcHJvcGVydGllczoKPj4+Pj4+Pj4+ICvCoCBjb21wYXRpYmxlOgo+Pj4+Pj4+
Pj4gK8KgwqDCoCBjb25zdDogYW1sb2dpYyxzNC1wbGwtY2xrYwo+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+
Pj4gK8KgIHJlZzoKPj4+Pj4+Pj4+ICvCoMKgwqAgbWF4SXRlbXM6IDEKPj4+Pj4+Pj4+ICsKPj4+
Pj4+Pj4+ICvCoCBjbG9ja3M6Cj4+Pj4+Pj4+PiArwqDCoMKgIG1heEl0ZW1zOiAxCj4+Pj4+Pj4+
PiArCj4+Pj4+Pj4+PiArwqAgY2xvY2stbmFtZXM6Cj4+Pj4+Pj4+PiArwqDCoMKgIGl0ZW1zOgo+
Pj4+Pj4+Pj4gK8KgwqDCoMKgwqAgLSBjb25zdDogeHRhbAo+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4g
K8KgICIjY2xvY2stY2VsbHMiOgo+Pj4+Pj4+Pj4gK8KgwqDCoCBjb25zdDogMQo+Pj4+Pj4+Pj4g
Kwo+Pj4+Pj4+Pj4gK3JlcXVpcmVkOgo+Pj4+Pj4+Pj4gK8KgIC0gY29tcGF0aWJsZQo+Pj4+Pj4+
Pj4gK8KgIC0gcmVnCj4+Pj4+Pj4+PiArwqAgLSBjbG9ja3MKPj4+Pj4+Pj4+ICvCoCAtIGNsb2Nr
LW5hbWVzCj4+Pj4+Pj4+PiArwqAgLSAiI2Nsb2NrLWNlbGxzIgo+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+
Pj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4gK2V4
YW1wbGVzOgo+Pj4+Pj4+Pj4gK8KgIC0gfAo+Pj4+Pj4+Pj4gK8KgwqDCoCBjbGtjX3BsbDogY2xv
Y2stY29udHJvbGxlckBmZTAwODAwMCB7Cj4+Pj4+Pj4+PiArwqDCoMKgwqDCoCBjb21wYXRpYmxl
ID0gImFtbG9naWMsczQtcGxsLWNsa2MiOwo+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqAgcmVnID0gPDB4
ZmUwMDgwMDAgMHgxZTg+Owo+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqAgY2xvY2tzID0gPCZ4dGFsPjsK
Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgIGNsb2NrLW5hbWVzID0gInh0YWwiOwo+Pj4+Pj4+Pj4gK8Kg
wqDCoMKgwqAgI2Nsb2NrLWNlbGxzID0gPDE+Owo+Pj4+Pj4+Pj4gK8KgwqDCoCB9Owo+Pj4+Pj4+
Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gKyNlbmRpZiAvKiBfX01FU09OX1M0X1BMTF9IX18gKi8KPj4+
Pj4+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2FtbG9naWMsczQt
cGxsLWNsa2MuaCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYW1sb2dpYyxzNC1wbGwtY2xr
Yy5oCj4+Pj4+Pj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4+Pj4+Pj4gaW5kZXggMDAwMDAw
MDAwMDAwLi4zNDVmODcwMjM4ODYKPj4+Pj4+Pj4+IC0tLSAvZGV2L251bGwKPj4+Pj4+Pj4+ICsr
KyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYW1sb2dpYyxzNC1wbGwtY2xrYy5oCj4+Pj4+
Pj4+Cj4+Pj4+Pj4+IFRoaXMgYmVsb25ncyB0byBiaW5kaW5ncyBwYXRjaCwgbm90IGRyaXZlci4K
Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEBAIC0wLDAgKzEsMzAgQEAKPj4+Pj4+Pj4+ICsvKiBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjArIE9SIE1JVCkgKi8KPj4+Pj4+Pj4+ICsvKgo+Pj4+
Pj4+Pj4gKyAqIENvcHlyaWdodCAoYykgMjAyMSBBbWxvZ2ljLCBJbmMuIEFsbCByaWdodHMgcmVz
ZXJ2ZWQuCj4+Pj4+Pj4+PiArICogQXV0aG9yOiBZdSBUdSA8eXUudHVAYW1sb2dpYy5jb20+Cj4+
Pj4+Pj4+PiArICovCj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+PiArI2lmbmRlZiBfRFRfQklORElOR1Nf
Q0xPQ0tfQU1MT0dJQ19TNF9QTExfQ0xLQ19ICj4+Pj4+Pj4+PiArI2RlZmluZSBfRFRfQklORElO
R1NfQ0xPQ0tfQU1MT0dJQ19TNF9QTExfQ0xLQ19ICj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+PiArLyoK
Pj4+Pj4+Pj4+ICsgKiBDTEtJRCBpbmRleCB2YWx1ZXMKPj4+Pj4+Pj4+ICsgKi8KPj4+Pj4+Pj4+
ICsKPj4+Pj4+Pj4+ICsjZGVmaW5lIENMS0lEX0ZJWEVEX1BMTMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgMQo+Pj4+Pj4+Pj4gKyNkZWZpbmUgQ0xLSURfRkNMS19ESVYywqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAzCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEluZGV4ZXMgc3RhcnQgZnJvbSAwIGFuZCBhcmUgaW5j
cmVtZW50ZWQgYnkgMS4gTm90IGJ5IDIuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IE5BSy4KPj4+Pj4+Pgo+
Pj4+Pj4+IEkgcmVtZW1iZXIgSmVyb21lIGRpc2N1c3NpbmcgdGhpcyB3aXRoIHlvdS5Zb3UgY2Fu
IGxvb2sgYXQgdGhpcyBzdWJtaXNzaW9uIGhpc3RvcnkuCj4+Pj4+Pj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsL2MwODhlMDFjLTA3MTQtODJiZS04MzQ3LTYxNDBkYWY1NjY0MEBsaW5hcm8u
b3JnLwo+Pj4+Pj4KPj4+Pj4+IEhpc3RvcmljYWxseSB3ZSBkaWQgdGhhdCBieSBvbmx5IGV4cG9z
aW5nIHBhcnQgb2YgdGhlIG51bWJlcnMsIGNvbnRyb2xsaW5nIHdoaWNoCj4+Pj4+PiBjbG9ja3Mg
d2VyZSBwYXJ0IG9mIHRoZSBiaW5kaW5ncy4KPj4+Pj4+Cj4+Pj4+PiBCdXQgaXQgc2VlbXMgdGhp
cyBkb2Vzbid0IG1ha2Ugc2VucyBhbnltb3JlLCBtYXliZSBpdCB3b3VsZCBiZSB0aW1lIHRvIHB1
dCBhbGwgdGhlCj4+Pj4+PiBjbG9jayBpZHMgaW4gdGhlIGJpbmRpbmdzIGZvciB0aGlzIG5ldyBT
b0MgYW5kIGJyZWFrIHdpdGggdGhlIHByZXZpb3VzIHN0cmF0ZWd5Lgo+Pj4+IEtyenlzenRvZiBh
bmQgSSBhZ3JlZWQgdGhlcmUgaXMgbm90aGluZyB3cm9uZyB3aXRoIHRoZSBjdXJyZW50Cj4+Pj4g
YXBwcm9hY2gsIEkgYmVsaWV2ZS4KPj4+PiBJdCBkb2VzIG5vdCBwcmV2ZW50IHNvbWVvbmUgZnJv
bSB1c2luZyBhbiB1bi1leHBvc2VkIGNsb2NrLCBzdXJlLCBvcgo+Pj4+IGV4cG9zaW5nIGl0IGlu
IHRoZSBmdXR1cmUgaWYgbmVjZXNzYXJ5Lgo+Pj4+IEhvd2V2ZXIsIEkgdGhpbmsgaXQgY2xlYXJs
eSBzaG93cyB0aGF0IGFuIHVuLWV4cG9zZWQgZWxlbWVudCBpcyBub3QKPj4+PiBleHBlY3RlZCB0
byBiZSB1c2VkIGJ5IGFuIGV4dGVybmFsIGNvbnN1bWVycy4gSXQgc2hvdWxkIGJlIGVub3VnaCB0
bwo+Pj4+IHRyaWdnZXIgYSBkaXNjdXNzaW9uIGlmIHRoaXMgZXhwZWN0YXRpb24gaXMgd3Jvbmcu
Cj4+Pj4KPj4+Pj4KPj4+Pj4gU28gdGhlIG91dGNvbWUgb2YgdGhlIHByZXZpb3VzIGRpc2N1c3Np
b24gd2FzIHNvbWV3aGVyZSBsYXRlciBpbiB0aGF0Cj4+Pj4+IHRocmVhZDoKPj4+Pj4KPj4+Pj4+
IEl0IGlzIGp1c3QgYSBjaG9pY2UgdG8gbm90IGV4cG9zZSBzb21lIElEcy4KPj4+Pj4+IEl0IGlz
IG5vdCB0aWVkIHRvIHRoZSBpbXBsZW1lbnRhdGlvbiBhdCBhbGwuCj4+Pj4+PiBJIHRoaW5rIHdl
IGFjdHVhbGx5IGZvbGxvdyB0aGUgcnVsZXMgYW5kIHRoZSBpZGVhIGJlaGluZCBpdC4KPj4+Pj4K
Pj4+Pj4KPj4+Pj4gQmVzdCByZWdhcmRzLAo+Pj4+PiBLcnp5c3p0b2YKPj4+PiAuCj4+Cj4+IC4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
