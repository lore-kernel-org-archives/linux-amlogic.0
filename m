Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1C1C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Nov 2022 13:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aCqZVFA0yQSzCPeOaoJnKvyffvV7OrbVdOMb7KRQXNk=; b=4s5y/ifHmGTyd/tQ5CtP+t73/R
	XWC7xgdITWTMoDo6jGhlXcsx4M8VTCOhqHP/2ZW7ZFOmVAi6ZXC9k4h9iso6S5YK1is8zMHaNm2wb
	SNeZC+YfXwS/1zeVxgWBdi/UOLGIa1Wcx8ELDC7548ccum/S323W0bTkWDEqHK2dvk4+qGBh0phCV
	3HKb7iBfNOAVfXEU6SgigiESs9qC78T5WRsnR3PEZ1BetLsqkF3VHD41mu4RsNelQq8oHFvvIsgP2
	uNYN2smLPBKk4T3oIYqcH0E+OzrBSoaYPFOf3Zq5EPVI6Vcgn9xouUm5NUNseD4fcTDP4zAAmEsu8
	kboVh1mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqFW-00HQoG-Lt; Wed, 23 Nov 2022 13:57:14 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqFS-00HQlN-Vm
	for linux-amlogic@lists.infradead.org; Wed, 23 Nov 2022 13:57:13 +0000
Received: by mail-wm1-x330.google.com with SMTP id j5-20020a05600c410500b003cfa9c0ea76so1340472wmi.3
        for <linux-amlogic@lists.infradead.org>; Wed, 23 Nov 2022 05:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dL/ms0BVBV2/oY4UScUHED3NO3FKIUaK6/18RYZuPxA=;
        b=ivgk3JNhdWzsOpo+GIpVt6LMMA7Ek5v17Dohgj/LffEcXYE5YqxhXMF2yNkL1XYbPa
         BJvQO07IqnRZf4Pp2ea7fEopixJnXeOmxbuAz4uuk6+nUkCAY8xa3rKj1PE/AtJMQNXr
         iSoC502J0s2U5ebAc7PFn5yr828ybdgyU+7ZylT/UrFxV3WKqArqA+eA0FnSuHo+02hx
         EXwDCXz8rj8CAm0ob0oM5SlhdbXKCtDDRPG4tv3pJ1zqPuhWrflK4CpSGQPQLcIEHD0J
         XiQ0XpMAdNiz/3fwbU5sOLIvsCARAOQ9/0ZxAzzpGMfQjSRLHud/32OZhGuUInh8uE0c
         jBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dL/ms0BVBV2/oY4UScUHED3NO3FKIUaK6/18RYZuPxA=;
        b=O0WHN9l135/1YgxKjlAqphlJRJyURyYVp+vVtzF3pz/82xyAsX5rbNAvPfZFjb0Dou
         iwJ4cDQjb2A86BNyuM84nWlNqmawhvDj08GfTmQMhKPOcPRUJrx0o3WHPWEKBSFKtczT
         80VU8xs2OeBat4GFMGPIUDtugRRvJDr0HvbaBL10cUBpFn1ajilXd0F6a6MUnvuFuuhb
         nIib3MeYw8vMHniJpbV0D+X5CVDdAUgrY4sW9PLpp34evjlh8fD7s3+GHdqZOvE7fR3P
         PsLQWK5VX1ex/5ze30/aPfb4BEw5JxABekeIJGs0rwYkoh5UESJufCq5JRp1r4EqkfsN
         Ff1g==
X-Gm-Message-State: ANoB5pl99ipjudw+SyNltPdi1G04c7/qqMkeTGMNvkab883DhvPRI4nB
	1cQIgvpOZoAWOTI3Mi414gu6Hw==
X-Google-Smtp-Source: AA0mqf4Zeq+CBUw9DBFNc5fPW9o18lGsw48Qe4aNbIyv85wr3wsW4SN5jRqHDgSwBj8zT9AvZ+0+Qg==
X-Received: by 2002:a05:600c:2e51:b0:3cf:9f01:620e with SMTP id q17-20020a05600c2e5100b003cf9f01620emr6467998wmf.15.1669211829360;
        Wed, 23 Nov 2022 05:57:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:e551:24c3:152c:7c05? ([2a01:e0a:982:cbb0:e551:24c3:152c:7c05])
        by smtp.gmail.com with ESMTPSA id n8-20020a05600c4f8800b003cfd64b6be1sm2811870wmq.27.2022.11.23.05.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 05:57:08 -0800 (PST)
Message-ID: <31bdbe7b-b78a-8fc0-602b-fa11004294a7@linaro.org>
Date: Wed, 23 Nov 2022 14:57:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: neil.armstrong@linaro.org
Subject: Re: [PATCH V5 1/4] clk: meson: S4: add support for Amlogic S4 SoC PLL
 clock driver and bindings
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: kelvin.zhang@amlogic.com
References: <20221123021346.18136-1-yu.tu@amlogic.com>
 <20221123021346.18136-2-yu.tu@amlogic.com>
 <f03f331a-5666-298e-a1a2-bdb9bab11a48@linaro.org>
 <92b570ea-3ddc-8e91-5a7a-ed601bb7c02c@amlogic.com>
 <eb56ed39-cfaa-3368-a2c0-0a4e89440e40@linaro.org>
 <322262b1-d3db-f190-ef69-f42d5d0522c0@amlogic.com>
Organization: Linaro Developer Services
In-Reply-To: <322262b1-d3db-f190-ef69-f42d5d0522c0@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_055711_089841_7D139FD4 
X-CRM114-Status: GOOD (  21.77  )
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

T24gMjMvMTEvMjAyMiAxNDo1NCwgWXUgVHUgd3JvdGU6Cj4gSGkgTmVpbCwKPiAKPiBPbiAyMDIy
LzExLzIzIDIxOjIzLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4gWyBFWFRFUk5BTCBFTUFJTCBd
Cj4+Cj4+IEhpLAo+Pgo+PiBPbiAyMy8xMS8yMDIyIDEyOjE2LCBZdSBUdSB3cm90ZToKPj4+IEhp
IEtyenlzenRvZiwKPj4+IMKgwqDCoMKgwqBUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuCj4+Pgo+
Pj4gT24gMjAyMi8xMS8yMyAxODowOCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4+PiBb
IEVYVEVSTkFMIEVNQUlMIF0KPj4+Pgo+Pj4+IE9uIDIzLzExLzIwMjIgMDM6MTMsIFl1IFR1IHdy
b3RlOgo+Pj4+PiBBZGQgdGhlIFM0IFBMTCBjbG9jayBjb250cm9sbGVyIGZvdW5kIGFuZCBiaW5k
aW5ncyBpbiB0aGUgczQgU29DIGZhbWlseS4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogWXUg
VHUgPHl1LnR1QGFtbG9naWMuY29tPgo+Pj4+PiAtLS0KPj4+Pj4gwqAgLi4uL2JpbmRpbmdzL2Ns
b2NrL2FtbG9naWMsczQtcGxsLWNsa2MueWFtbMKgwqAgfMKgIDUxICsKPj4+Pgo+Pj4+IFRoaXMg
aXMgdjUgYW5kIHN0aWxsIGJpbmRpbmdzIGFyZSBoZXJlPyBCaW5kaW5ncyBhcmUgYWx3YXlzIHNl
cGFyYXRlCj4+Pj4gcGF0Y2hlcy4gVXNlIHN1YmplY3QgcHJlZml4ZXMgbWF0Y2hpbmcgdGhlIHN1
YnN5c3RlbSAoZ2l0IGxvZyAtLW9uZWxpbmUKPj4+PiAtLSAuLi4pLgo+Pj4+Cj4+Pj4gQW5kIHRo
aXMgd2FzIHNwbGl0LCB3YXNuJ3QgaXQ/IFdoYXQgaGFwcGVuZWQgaGVyZT8hPwo+Pj4KPj4+IFB1
dCBiaW5kaW5ncyBhbmQgY2xvY2sgZHJpdmVyIHBhdGNoIHRvZ2V0aGVyIGZyb20gSmVyb21lLiBN
YXliZSB5b3UgY2FuIHJlYWQgdGhpcyBjaGF0IGhpc3RvcnkuCj4+PiBodHRwczovL2xvcmUua2Vy
bmVsLm9yL2FsbC8xankxdjZ6MTRuLmZzZkBzdGFyYnVja2lzYWN5bG9uLmJheWxpYnJlLmNvbS8K
Pj4KPj4gSmVyb21lIHdhcyBhc2tpbmcgeW91IHRvIHNlbmQgMiBwYXRjaHNldHMsIG9uZSB3aXRo
IDoKPj4gLSBiaW5kaW5ncyBpbiBzZXBhcmF0ZSBwYXRjaGVzCj4+IC0gZHJpdmVycyBpbiBzZXBh
cmF0ZSBwYXRjaGVzCj4+IGFuZCBhIHNlY29uZCB3aXRoIERUIGNoYW5nZXMuCj4+Cj4+IFRoZW4g
d2hlbiB0aGUgYmluZGluZ3MgKyBjbG9ja3MgcGF0Y2hlcyBhcmUgbWVyZ2VkLCBhIHB1bGwgcmVx
dWVzdCBvZiB0aGUgYmluZGluZ3MKPj4gY2FuIGJlIGRvbmUgdG8gbWUgc28gSSBjYW4gbWVyZ2Ug
aXQgd2l0aCBEVC4KPj4KPiAKPiBJIG1heSBoYXZlIG1pc3VuZGVyc3Rvb2QgSmVyb21lJ3MgYWR2
aWNlLlNvIHNob3VsZCBJIGZvbGxvdyB0aGUgVjQgcGF0Y2ggZm9ybWF0IGFuZCBjaGFuZ2UgYXMg
SmVyb21lIHN1Z2dlc3RlZCBmcm9tIFYzPwoKTGV0J3Mgd2FpdCBmb3IgaGlzIGlucHV0IG9uIHRo
aXMgdG8gc2VlIGlmIGEgdjQgaXMgbmVlZGVkIG5vdyBvciBsYXRlci4KCj4gCj4+Pgo+Pj4+Cj4+
Pj4KPj4+Pj4gwqAgTUFJTlRBSU5FUlPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsKPj4+Pj4gwqAgZHJp
dmVycy9jbGsvbWVzb24vS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgIDEzICsKPj4+Pj4gwqAgZHJpdmVycy9jbGsvbWVzb24vTWFrZWZpbGXCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsKPj4+Pj4gwqAgZHJpdmVy
cy9jbGsvbWVzb24vczQtcGxsLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8IDg3NSArKysrKysrKysrKysrKysrKysKPj4+Pj4gwqAgZHJpdmVycy9jbGsvbWVzb24vczQt
cGxsLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgODggKysKPj4+
Pj4gwqAgLi4uL2R0LWJpbmRpbmdzL2Nsb2NrL2FtbG9naWMsczQtcGxsLWNsa2MuaMKgwqAgfMKg
IDMwICsKPj4+Pj4gwqAgNyBmaWxlcyBjaGFuZ2VkLCAxMDU5IGluc2VydGlvbnMoKykKPj4+Pj4g
wqAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9j
bG9jay9hbWxvZ2ljLHM0LXBsbC1jbGtjLnlhbWwKPj4+Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvY2xrL21lc29uL3M0LXBsbC5jCj4+Pj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2Nsay9tZXNvbi9zNC1wbGwuaAo+Pj4+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgaW5j
bHVkZS9kdC1iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHM0LXBsbC1jbGtjLmgKPj4+Pj4KPj4+Pj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9hbWxv
Z2ljLHM0LXBsbC1jbGtjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
Y2xvY2svYW1sb2dpYyxzNC1wbGwtY2xrYy55YW1sCj4+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uZmQ1MTdlOGVmMTRmCj4+Pj4+IC0tLSAvZGV2L251
bGwKPj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2Ft
bG9naWMsczQtcGxsLWNsa2MueWFtbAo+Pj4+PiBAQCAtMCwwICsxLDUxIEBACj4+Pj4+ICsjIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPj4+
Pj4gKyVZQU1MIDEuMgo+Pj4+PiArLS0tCj4+Pj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9zY2hlbWFzL2Nsb2NrL2FtbG9naWMsczQtcGxsLWNsa2MueWFtbCMKPj4+Pj4gKyRzY2hlbWE6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+Pj4+PiArCj4+
Pj4+ICt0aXRsZTogQW1sb2dpYyBNZXNvbiBTIHNlcmlhbHMgUExMIENsb2NrIENvbnRyb2xsZXIK
Pj4+Pj4gKwo+Pj4+PiArbWFpbnRhaW5lcnM6Cj4+Pj4+ICvCoCAtIE5laWwgQXJtc3Ryb25nIDxu
YXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KPj4+Pj4gK8KgIC0gSmVyb21lIEJydW5ldCA8amJydW5l
dEBiYXlsaWJyZS5jb20+Cj4+Pj4+ICvCoCAtIFl1IFR1IDx5dS5odUBhbWxvZ2ljLmNvbT4KPj4+
Pj4gKwo+Pj4+IE9uZSBibGFuayBsaW5lLgo+Pj4KPj4+IMKgwqBJIHdpbGwgZGVsZXRlIHRoaXMs
IG9uIG5leHQgdmVyc2lvbiBwYXRjaC4KPj4+Cj4+Pj4KPj4+Pj4gKwo+Pj4+PiArcHJvcGVydGll
czoKPj4+Pj4gK8KgIGNvbXBhdGlibGU6Cj4+Pj4+ICvCoMKgwqAgY29uc3Q6IGFtbG9naWMsczQt
cGxsLWNsa2MKPj4+Pj4gKwo+Pj4+PiArwqAgcmVnOgo+Pj4+PiArwqDCoMKgIG1heEl0ZW1zOiAx
Cj4+Pj4+ICsKPj4+Pj4gK8KgIGNsb2NrczoKPj4+Pj4gK8KgwqDCoCBtYXhJdGVtczogMQo+Pj4+
PiArCj4+Pj4+ICvCoCBjbG9jay1uYW1lczoKPj4+Pj4gK8KgwqDCoCBpdGVtczoKPj4+Pj4gK8Kg
wqDCoMKgwqAgLSBjb25zdDogeHRhbAo+Pj4+PiArCj4+Pj4+ICvCoCAiI2Nsb2NrLWNlbGxzIjoK
Pj4+Pj4gK8KgwqDCoCBjb25zdDogMQo+Pj4+PiArCj4+Pj4+ICtyZXF1aXJlZDoKPj4+Pj4gK8Kg
IC0gY29tcGF0aWJsZQo+Pj4+PiArwqAgLSByZWcKPj4+Pj4gK8KgIC0gY2xvY2tzCj4+Pj4+ICvC
oCAtIGNsb2NrLW5hbWVzCj4+Pj4+ICvCoCAtICIjY2xvY2stY2VsbHMiCj4+Pj4+ICsKPj4+Pj4g
K2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+Pj4+PiArCj4+Pj4+ICtleGFtcGxlczoKPj4+
Pj4gK8KgIC0gfAo+Pj4+PiArwqDCoMKgIGNsa2NfcGxsOiBjbG9jay1jb250cm9sbGVyQGZlMDA4
MDAwIHsKPj4+Pj4gK8KgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJhbWxvZ2ljLHM0LXBsbC1jbGtj
IjsKPj4+Pj4gK8KgwqDCoMKgwqAgcmVnID0gPDB4ZmUwMDgwMDAgMHgxZTg+Owo+Pj4+PiArwqDC
oMKgwqDCoCBjbG9ja3MgPSA8Jnh0YWw+Owo+Pj4+PiArwqDCoMKgwqDCoCBjbG9jay1uYW1lcyA9
ICJ4dGFsIjsKPj4+Pj4gK8KgwqDCoMKgwqAgI2Nsb2NrLWNlbGxzID0gPDE+Owo+Pj4+PiArwqDC
oMKgIH07Cj4+Pj4KPj4+Pgo+Pj4+PiArI2VuZGlmIC8qIF9fTUVTT05fUzRfUExMX0hfXyAqLwo+
Pj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHM0LXBs
bC1jbGtjLmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2FtbG9naWMsczQtcGxsLWNsa2Mu
aAo+Pj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjM0
NWY4NzAyMzg4Ngo+Pj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4+ICsrKyBiL2luY2x1ZGUvZHQtYmlu
ZGluZ3MvY2xvY2svYW1sb2dpYyxzNC1wbGwtY2xrYy5oCj4+Pj4KPj4+PiBUaGlzIGJlbG9uZ3Mg
dG8gYmluZGluZ3MgcGF0Y2gsIG5vdCBkcml2ZXIuCj4+Pj4KPj4+Pj4gQEAgLTAsMCArMSwzMCBA
QAo+Pj4+PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wKyBPUiBNSVQpICov
Cj4+Pj4+ICsvKgo+Pj4+PiArICogQ29weXJpZ2h0IChjKSAyMDIxIEFtbG9naWMsIEluYy4gQWxs
IHJpZ2h0cyByZXNlcnZlZC4KPj4+Pj4gKyAqIEF1dGhvcjogWXUgVHUgPHl1LnR1QGFtbG9naWMu
Y29tPgo+Pj4+PiArICovCj4+Pj4+ICsKPj4+Pj4gKyNpZm5kZWYgX0RUX0JJTkRJTkdTX0NMT0NL
X0FNTE9HSUNfUzRfUExMX0NMS0NfSAo+Pj4+PiArI2RlZmluZSBfRFRfQklORElOR1NfQ0xPQ0tf
QU1MT0dJQ19TNF9QTExfQ0xLQ19ICj4+Pj4+ICsKPj4+Pj4gKy8qCj4+Pj4+ICsgKiBDTEtJRCBp
bmRleCB2YWx1ZXMKPj4+Pj4gKyAqLwo+Pj4+PiArCj4+Pj4+ICsjZGVmaW5lIENMS0lEX0ZJWEVE
X1BMTMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMQo+Pj4+PiArI2RlZmluZSBDTEtJRF9GQ0xLX0RJ
VjLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDMKPj4+Pgo+Pj4+IEluZGV4ZXMgc3RhcnQgZnJvbSAw
IGFuZCBhcmUgaW5jcmVtZW50ZWQgYnkgMS4gTm90IGJ5IDIuCj4+Pj4KPj4+PiBOQUsuCj4+Pgo+
Pj4gSSByZW1lbWJlciBKZXJvbWUgZGlzY3Vzc2luZyB0aGlzIHdpdGggeW91LllvdSBjYW4gbG9v
ayBhdCB0aGlzIHN1Ym1pc3Npb24gaGlzdG9yeS4KPj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC9jMDg4ZTAxYy0wNzE0LTgyYmUtODM0Ny02MTQwZGFmNTY2NDBAbGluYXJvLm9yZy8KPj4K
Pj4gSGlzdG9yaWNhbGx5IHdlIGRpZCB0aGF0IGJ5IG9ubHkgZXhwb3NpbmcgcGFydCBvZiB0aGUg
bnVtYmVycywgY29udHJvbGxpbmcgd2hpY2gKPj4gY2xvY2tzIHdlcmUgcGFydCBvZiB0aGUgYmlu
ZGluZ3MuCj4+Cj4+IEJ1dCBpdCBzZWVtcyB0aGlzIGRvZXNuJ3QgbWFrZSBzZW5zIGFueW1vcmUs
IG1heWJlIGl0IHdvdWxkIGJlIHRpbWUgdG8gcHV0IGFsbCB0aGUKPj4gY2xvY2sgaWRzIGluIHRo
ZSBiaW5kaW5ncyBmb3IgdGhpcyBuZXcgU29DIGFuZCBicmVhayB3aXRoIHRoZSBwcmV2aW91cyBz
dHJhdGVneS4KPiAKPiBUaGF0J3MgT0sgd2l0aCBtZS4gQnV0IEkgZG9uJ3Qga25vdyBpZiBKZXJv
bWUgdGhpbmtzIGl0J3Mgb2s/CgpMZXQncyB3YWl0IGZvciBoaXMgaW5wdXQgb24gdGhhdCBhc3dl
bGwuCgpOZWlsCgo+IAo+Pgo+PiBOZWlsCj4+Cj4+Pgo+Pj4+Cj4+Pj4gQmVzdCByZWdhcmRzLAo+
Pj4+IEtyenlzenRvZgo+Pj4+Cj4+Pj4gLgo+Pgo+PiAuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
