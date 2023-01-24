Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA33C25B4E
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 09:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9p9t0uLMzV3vOMdsSpiBichxybVNZwC0LEXpll75Ezc=; b=3nieJm+SToZicS
	FtfuGoIJV5+NPzFrL2jZT2oZhbK77n38d4hr723iAYXSxgUa+sS3fKEuZxRaLtX5k/EJgmHWNJRdZ
	lB4mqHXoowJ/XI1PZJZMlhg7bHSADI6asXfGsjAGyIZud4doCokcykqlZXChJaSd4THpH0sDdxJeY
	KdLJkhV+fHXe5QBoJZ/uDggiz2vgF89s1MLDLutFthApkIIalFr3Yu0QKAMqkBIkhNs6r3PeJp4YO
	0N9DrD7xCmzazN2TQVUI9L7I5XFG9WJZ/HKxTBAHN/5FfdxU0YJdhZLpopGdRp0u5oSZ/mRFSTpZd
	HcB1+nltn5PpD3ek7/2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFaU-002v2J-VW; Tue, 24 Jan 2023 09:27:31 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFTy-002rnO-Lo; Tue, 24 Jan 2023 09:20:48 +0000
Received: by mail-ed1-x535.google.com with SMTP id x36so17509505ede.13;
        Tue, 24 Jan 2023 01:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qkyt3V/sGweMqPRz5YiwT95Clx97EReN+Djf9uI4HAw=;
        b=CKS18NNmVewXIFwgT4uvAQ+zfKsoibcxbtwGO6YuqZocKNY43OyK9PYdP2W+JL/xxk
         wtNWFUW5u3OqrBJUrSVCREMTgw2FzydUKc4onoIgf4Q07dp6q/lAC1NzgdortFOGYY16
         aDsIbBOBTPUDRLOA5J0v6CHBXwiZHMz/QehV2KnPiEnysy7HSpw0G0Q3wlI4SBxWmNk6
         XVxqGcFOur1LtFCChRTTFBi2HJismqk640xhKSDxtukTradXSC1RUA4acA2C0fhDOpPk
         Peca/5Fnlfr2oOxOVPD6OfS9Oaa/rv/w3nbm1ItEMe0Fsm95bSvwz8pp4sqPR8R6eAxH
         iZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qkyt3V/sGweMqPRz5YiwT95Clx97EReN+Djf9uI4HAw=;
        b=F4eIbCflZZDFqFsevUyTQthJeqLH4GWWaf0RWvUQ4o/LZwtdvV94DTuCYr5ns/QfQr
         h3ZWmZBtRT1WYZ81FZkXaM70XMbHv1sYQOJYgzy0ZNueFQmWx+brduZh5oR39Trpaye6
         NPt8uW5CsTI+Bw7qp27+EaOnJLD1m65tt1P3qyqUy3rHhBS74210mtxLLGMfZhvyPyId
         Sdeo3wnB2Ia95oOFIJuowNwBiNqTjRaqjoOHDTA3KUYs0l0p+vlguvGadYqcAA+2j+7F
         bPvWPQ4K5mst8wQTxk+yaqe73TACLyGZBfkimTFhmInaN2eD7RKohviKUEDpKCroMV1B
         rpVg==
X-Gm-Message-State: AFqh2krGQKdtNk/u5Pr6EQquwp5f3mXfZndL9KJTx0I4MV/gj5OgSz5M
	wc2+QdXpWMgFAz3rnqCkM+U=
X-Google-Smtp-Source: AMrXdXtRWxW1mAbiUmC4SLcOOmddV2ys9A8B0EHmTeVmBqDkSv7OFCZ0WGK0Gn+dVGSenvg/hDCV5Q==
X-Received: by 2002:a05:6402:3220:b0:49e:1d59:794f with SMTP id g32-20020a056402322000b0049e1d59794fmr35522994eda.22.1674552042732;
        Tue, 24 Jan 2023 01:20:42 -0800 (PST)
Received: from ?IPV6:2a01:c23:c139:7c00:ccbf:89a4:c6b8:c0f5? (dynamic-2a01-0c23-c139-7c00-ccbf-89a4-c6b8-c0f5.c23.pool.telefonica.de. [2a01:c23:c139:7c00:ccbf:89a4:c6b8:c0f5])
        by smtp.googlemail.com with ESMTPSA id b8-20020aa7c908000000b00482e0c55e2bsm396134edt.93.2023.01.24.01.20.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 01:20:42 -0800 (PST)
Message-ID: <2aaa347b-da29-67e8-56e9-959de708e426@gmail.com>
Date: Tue, 24 Jan 2023 10:20:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 0/8] soc: amlogic: switch bindings to yaml and adjust some
 dtbs's
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
 <0e48405a-d4e7-92a8-339f-4be2f4ec1378@linaro.org>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <0e48405a-d4e7-92a8-339f-4be2f4ec1378@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_012046_771590_44F827BF 
X-CRM114-Status: GOOD (  18.18  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjQuMDEuMjAyMyAwODoxNiwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gSGkgSGVpbmVyLAo+
IAo+IExlIDIzLzAxLzIwMjMgw6AgMjI6MjIsIEhlaW5lciBLYWxsd2VpdCBhIMOpY3JpdMKgOgo+
PiBBdCBmaXJzdCBhZGp1c3Qgc29tZSBleGlzdGluZyBkdGJzJ3Mgc28gdGhhdCB0aGV5IHBhc3Mg
ZHRic19jaGVjawo+PiBhZnRlciBzd2l0Y2hpbmcgYmluZGluZ3MgdG8geWFtbC4KPiAKPiBUaGFu
a3MgZm9yIHRoaXMgcGF0Y2hzZXQsIGJ1dCBwbGVhc2UgZHJvcCBwYXRjaGVzIDEsIDMgJiA0LCBh
bmQgdGFrZQo+IGluIGFjY291bnQgdGhlIGV4aXN0aW5nIGNvbXBhdGlibGUgdXNhZ2UgaW4geW91
ciBuZXcgYmluZGluZ3MgbGlrZQo+IEkgZGlkIGluIG15IGNvbnZlcnNpb24gcGF0Y2hzZXQuCj4g
Cj4gV2hpbGUgd2UgZGlkIHJlbW92ZSBzb21lIGJhZCBjb21wYXRpYmxlcyB3ZSBpbnRyb2R1Y2Vk
IGEgZmV3IHllYXJzIGFnbywKPiBub3cgdGhlIEdYQkIsIEdYTCAmIEdYTSBhcmUgbm93IHN0YWJs
ZSBhIGFldyBMVFMgcmVsZWFzZXMgbm93IGFuZAo+IGEgZmV3IG90aGVyIHByb2plY3RzIHVzZXMg
dGhlbSBhcy1pcyAoVS1Cb290LCBCU0RzLCAuLi4pIHNvIGNoYW5naW5nCj4gdGhlIGNvbXBhdGli
bGVzIGlzbid0IGFuIG9wdGlvbiBhbnltb3JlLi4uIGFuZCB3ZSBjYW4ndCBrbm93IHdoaWNoCj4g
b25lIHRoZXkgdXNlIGFuZCBob3cgdGhlIGltcGxlbWVudGF0aW9uIGJlaGF2ZXMgd2UgbXVzdCBk
b2N1bWVudAo+IHRoZSBleGlzdGluZyB1c2FnZSB3aXRob3V0IGJyZWFraW5nIGFueSBwb3RlbnRp
YWwgdXNlcnMgKGluY2x1ZGluZyBsaW51eCkuCj4gCkkgd2Fzbid0IGF3YXJlIG9mIHRoaXMuIFRo
YW5rcyBmb3IgdGhlIGhpbnQuClNvIEknbGwgcmV3b3JrIHRoZSBzY2hlbWFzIHRvIGNvdmVyIGN1
cnJlbnQgdXNhZ2Ugb2YgY29tcGF0aWJsZSBzdHJpbmdzLgoKPiBUaGFua3MsCj4gTmVpbAo+IApI
ZWluZXIKPiAKPiAKPj4KPj4gVGhlbiBzd2l0Y2ggZnVydGhlciBBbWxvZ2ljIE1lc29uIGJpbmRp
bmdzIHRvIHlhbWwuCj4+IFRlc3RlZCB3aXRoIG1ha2UgdGFyZ2V0cyBkdF9iaW5kaW5nX2NoZWNr
IGFuZCBkdGJzX2NoZWNrLgo+Pgo+PiBIZWluZXIgS2FsbHdlaXQgKDgpOgo+PiDCoMKgIGFybTY0
OiBkdHM6IG1lc29uLWd4OiBSZW1vdmUgaW52YWxpZCBwd20gY29tcGF0aWJsZQo+PiDCoMKgIGFy
bTY0OiBkdHM6IGFtbG9naWM6IEZpeCBub24tY29tcGxpYW50IFNEL1NESU8gbm9kZSBuYW1lcwo+
PiDCoMKgIGFybTY0OiBkdHM6IG1lc29uLWd4OiBTZXQgb25seSBvbmUgY29tcGF0aWJsZSBzdHJp
bmcgZm9yIG1tYwo+PiDCoMKgIGFybTY0OiBkdHM6IGFtbG9naWM6IFJlbW92ZSBpbnZhbGlkIGNv
bXBhdGlibGUgc3RyaW5nCj4+IMKgwqDCoMKgIGFtbG9naWMsbWVzb24tZ3Bpby1pbnRjCj4+IMKg
wqAgZHQtYmluZGluZ3M6IHJ0YzogQWRkIEFtbG9naWMgTWVzb24gdnJ0YyBjb250cm9sbGVyIGJp
bmRpbmcKPj4gwqDCoCBkdC1iaW5kaW5nczogcHdtOiBBZGQgQW1sb2dpYyBNZXNvbiBQV00gYmlu
ZGluZwo+PiDCoMKgIGR0LWJpbmRpbmdzOiBpbnRlcnJ1cHQtY29udHJvbGxlcjogQWRkIEFtbG9n
aWMgTWVzb24gR1BJTyBpbnRlcnJ1cHQKPj4gwqDCoMKgwqAgY29udHJvbGxlciBiaW5kaW5nCj4+
IMKgwqAgZHQtYmluZGluZ3M6IHBpbmN0cmw6IEFkZCBBbWxvZ2ljIE1lc29uIHBpbmN0cmwgYmlu
ZGluZwo+Pgo+PiDCoCAuLi4vYW1sb2dpYyxtZXNvbi1ncGlvLWludGMudHh0wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqAgMzggLS0tLS0tCj4+IMKgIC4uLi9hbWxvZ2ljLG1lc29uLWdw
aW8taW50Yy55YW1swqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDcyICsrKysrKysrKysr
Cj4+IMKgIC4uLi9waW5jdHJsL2FtbG9naWMsbWVzb24tcGluY3RybC55YW1swqDCoMKgwqDCoMKg
wqAgfCAxMjEgKysrKysrKysrKysrKysrKysrCj4+IMKgIC4uLi9iaW5kaW5ncy9waW5jdHJsL21l
c29uLHBpbmN0cmwudHh0wqDCoMKgwqDCoMKgwqAgfMKgIDk0IC0tLS0tLS0tLS0tLS0tCj4+IMKg
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9wd20tYW1sb2dpYy55YW1swqAgfMKgIDYxICsr
KysrKysrKwo+PiDCoCAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vcHdtLW1lc29uLnR4dMKg
wqDCoMKgIHzCoCAyOSAtLS0tLQo+PiDCoCAuLi4vYmluZGluZ3MvcnRjL2FtbG9naWMsbWVzb24t
dnJ0Yy55YW1swqDCoMKgwqDCoCB8wqAgNTAgKysrKysrKysKPj4gwqAgLi4uL2JpbmRpbmdzL3J0
Yy9ydGMtbWVzb24tdnJ0Yy50eHTCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMjIgLS0tLQo+PiDC
oCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tYXhnLmR0c2nCoMKgwqAgfMKgwqAg
NSArLQo+PiDCoCAuLi4vYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTItY29tbW9uLmR0c2nCoMKg
wqAgfMKgwqAgNyArLQo+PiDCoCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3gu
ZHRzacKgwqDCoMKgIHzCoCAxNSArLS0KPj4gwqAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2lj
L21lc29uLWd4YmIuZHRzacKgwqAgfMKgwqAgMyArLQo+PiDCoCBhcmNoL2FybTY0L2Jvb3QvZHRz
L2FtbG9naWMvbWVzb24tZ3hsLmR0c2nCoMKgwqAgfMKgwqAgMyArLQo+PiDCoCBhcmNoL2FybTY0
L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzacKgwqDCoMKgIHzCoMKgIDMgKy0KPj4gwqAg
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXNtMS5kdHNpwqDCoMKgIHzCoMKgIDMg
Ky0KPj4gwqAgMTUgZmlsZXMgY2hhbmdlZCwgMzIwIGluc2VydGlvbnMoKyksIDIwNiBkZWxldGlv
bnMoLSkKPj4gwqAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hbWxvZ2ljLG1lc29uLWdwaW8taW50Yy50eHQK
Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9pbnRlcnJ1cHQtY29udHJvbGxlci9hbWxvZ2ljLG1lc29uLWdwaW8taW50Yy55YW1sCj4+IMKg
IGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGlu
Y3RybC9hbWxvZ2ljLG1lc29uLXBpbmN0cmwueWFtbAo+PiDCoCBkZWxldGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvbWVzb24scGluY3RybC50
eHQKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9wd20vcHdtLWFtbG9naWMueWFtbAo+PiDCoCBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9wd20tbWVzb24udHh0Cj4+IMKgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcnRjL2FtbG9n
aWMsbWVzb24tdnJ0Yy55YW1sCj4+IMKgIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcnRjL3J0Yy1tZXNvbi12cnRjLnR4dAo+Pgo+IAo+IAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
