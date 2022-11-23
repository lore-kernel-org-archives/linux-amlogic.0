Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD024C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Nov 2022 13:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tIhAb59hTeCj1qb3BrNx6VIJLnEBx956pRdRcln2A54=; b=4AGK9zOLGOuy7u
	yYaCAJl/uRNZKe2He9bK/N2XRXKJubl45CB1uZV6wOyhHgq0AxQW3XWN8dIMZJiGMInmyHk/pTi1x
	NraSAb7bqhAT1GXVXGAapUR7sqonwpAPLUTzU0IVmbFf/CvNjD5z1m+hdg9W06ZkSyxkMNcA4/SPm
	jlzG8y5LwlJ5nN3xFGKfp/OvQiJkwheA7iAHM5R7DoUl7H7WykXlFD67oWx57HeVqImuTILnnz0H+
	1w5oju8HDbunIctikWJcjVFZD9XlHxO8+Ruc71+H+D0RhYKzGi9o5U8Vvf6MPEdR0kPyy+gScTdns
	lvWuADaXWke9S5rkIexg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqCC-00HOmt-3d; Wed, 23 Nov 2022 13:53:48 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqBq-00HOZq-6F
	for linux-amlogic@lists.infradead.org; Wed, 23 Nov 2022 13:53:28 +0000
Received: by mail-lj1-x230.google.com with SMTP id s24so21415790ljs.11
        for <linux-amlogic@lists.infradead.org>; Wed, 23 Nov 2022 05:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5VykN1snra/zat50du/sylTDkAQWFbkUpGcISFnpSrU=;
        b=hm+OicoABUCzeGO4J90aIWK3PrBVZi1AR1xQVX+WFNj9MBQgBA/Yu7+KiL7nuQ0JFb
         3/wyfmSxIxGXg2vewYYQbCBQziJzWmPjWaqKvI1GqZTpye+xEDYJ41m09R4c8Zz2ly1o
         +hKCr9XK2ksI+I0QgaMFDrm6Q2jnYLvMFSUPlh+zbjRb48P4vGqNsAU4avjYlptZNfpF
         /Pn0MfQqDNa0rRPTuO9lqixL05eYwpvcwZ/enKe2oSpothxorIHnWjP4qzGuIK2A69Wo
         QB6VtT5AtwWlAkkbizibYXc1an1xtBMkO5GEFFdQ7E3KDdScD4YFaFVJZG1Hcd8DhSwf
         tXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5VykN1snra/zat50du/sylTDkAQWFbkUpGcISFnpSrU=;
        b=bAT1h96LCqFcq0xs9EL2a7f7eEIz0/8JIz/6iTCAJRLbCtbJkWjkgRQpTACkYXQpWy
         oIFiYKFkUrZJhsg+7oDTCSaMMpNKzWI8LHI0G02pl3J8lykc4tBUsDS3vZPBCpx9ipri
         oLFI2IF8rB7sxvIoa1wr3O1OHvO9LmhWCvlsWavqPv5fOsMcGN7zEHh8M7/PdSoAXD/b
         H2dr/CRSdux3jPOOYzZEbpCWuvuCxw7yswnjign1HZMoswgUFY6WQqf0QQUEny3hKOpz
         1PrsVIRArKtUncn0swMHHhQkpbRAYIwXOyqh1E8VG3GoDac3K1f9aD1JcER58Sd8ZvYS
         rudg==
X-Gm-Message-State: ANoB5pkUJE42vYAeB4VifruJ5LjOtPkHiCSurh3mfKs4lICelJIKuGPp
	tdeyeIFqjEwZffJ2dL50Jo1Jzg==
X-Google-Smtp-Source: AA0mqf42fVDI2ExqDatFsEhnBlEbgKZEiziqkEdy1zQzU5b7c/G49NbrIU/GTUeInCPlx+AsTZTnMw==
X-Received: by 2002:a05:651c:1603:b0:26d:d603:8df2 with SMTP id f3-20020a05651c160300b0026dd6038df2mr8342363ljq.189.1669211603831;
        Wed, 23 Nov 2022 05:53:23 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i5-20020a0565123e0500b004978e51b691sm2917378lfv.266.2022.11.23.05.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 05:53:23 -0800 (PST)
Message-ID: <5b7176b4-d7a2-c67f-31c6-e842e0870836@linaro.org>
Date: Wed, 23 Nov 2022 14:53:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH V5 1/4] clk: meson: S4: add support for Amlogic S4 SoC PLL
 clock driver and bindings
Content-Language: en-US
To: neil.armstrong@linaro.org, Yu Tu <yu.tu@amlogic.com>,
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <eb56ed39-cfaa-3368-a2c0-0a4e89440e40@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_055326_371514_0796484D 
X-CRM114-Status: GOOD (  25.13  )
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

T24gMjMvMTEvMjAyMiAxNDoyMywgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gSGksCj4gCj4gT24g
MjMvMTEvMjAyMiAxMjoxNiwgWXUgVHUgd3JvdGU6Cj4+IEhpIEtyenlzenRvZiwKPj4gIMKgwqDC
oMKgVGhhbmsgeW91IGZvciB5b3VyIHJlcGx5Lgo+Pgo+PiBPbiAyMDIyLzExLzIzIDE4OjA4LCBL
cnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Pgo+Pj4g
T24gMjMvMTEvMjAyMiAwMzoxMywgWXUgVHUgd3JvdGU6Cj4+Pj4gQWRkIHRoZSBTNCBQTEwgY2xv
Y2sgY29udHJvbGxlciBmb3VuZCBhbmQgYmluZGluZ3MgaW4gdGhlIHM0IFNvQyBmYW1pbHkuCj4+
Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBZdSBUdSA8eXUudHVAYW1sb2dpYy5jb20+Cj4+Pj4gLS0t
Cj4+Pj4gwqAgLi4uL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsczQtcGxsLWNsa2MueWFtbMKgwqAg
fMKgIDUxICsKPj4+Cj4+PiBUaGlzIGlzIHY1IGFuZCBzdGlsbCBiaW5kaW5ncyBhcmUgaGVyZT8g
QmluZGluZ3MgYXJlIGFsd2F5cyBzZXBhcmF0ZQo+Pj4gcGF0Y2hlcy4gVXNlIHN1YmplY3QgcHJl
Zml4ZXMgbWF0Y2hpbmcgdGhlIHN1YnN5c3RlbSAoZ2l0IGxvZyAtLW9uZWxpbmUKPj4+IC0tIC4u
LikuCj4+Pgo+Pj4gQW5kIHRoaXMgd2FzIHNwbGl0LCB3YXNuJ3QgaXQ/IFdoYXQgaGFwcGVuZWQg
aGVyZT8hPwo+Pgo+PiBQdXQgYmluZGluZ3MgYW5kIGNsb2NrIGRyaXZlciBwYXRjaCB0b2dldGhl
ciBmcm9tIEplcm9tZS4gTWF5YmUgeW91IGNhbiByZWFkIHRoaXMgY2hhdCBoaXN0b3J5Lgo+PiBo
dHRwczovL2xvcmUua2VybmVsLm9yL2FsbC8xankxdjZ6MTRuLmZzZkBzdGFyYnVja2lzYWN5bG9u
LmJheWxpYnJlLmNvbS8KPiAKPiBKZXJvbWUgd2FzIGFza2luZyB5b3UgdG8gc2VuZCAyIHBhdGNo
c2V0cywgb25lIHdpdGggOgo+IC0gYmluZGluZ3MgaW4gc2VwYXJhdGUgcGF0Y2hlcwo+IC0gZHJp
dmVycyBpbiBzZXBhcmF0ZSBwYXRjaGVzCj4gYW5kIGEgc2Vjb25kIHdpdGggRFQgY2hhbmdlcy4K
PiAKPiBUaGVuIHdoZW4gdGhlIGJpbmRpbmdzICsgY2xvY2tzIHBhdGNoZXMgYXJlIG1lcmdlZCwg
YSBwdWxsIHJlcXVlc3Qgb2YgdGhlIGJpbmRpbmdzCj4gY2FuIGJlIGRvbmUgdG8gbWUgc28gSSBj
YW4gbWVyZ2UgaXQgd2l0aCBEVC4KPiAKPj4KPj4+Cj4+Pgo+Pj4+IMKgIE1BSU5UQUlORVJTwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgwqAgMSArCj4+Pj4gwqAgZHJpdmVycy9jbGsvbWVzb24vS2NvbmZpZ8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEzICsKPj4+PiDCoCBkcml2
ZXJzL2Nsay9tZXNvbi9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoMKgIDEgKwo+Pj4+IMKgIGRyaXZlcnMvY2xrL21lc29uL3M0LXBsbC5jwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA4NzUgKysrKysrKysrKysrKysrKysrCj4+
Pj4gwqAgZHJpdmVycy9jbGsvbWVzb24vczQtcGxsLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqAgODggKysKPj4+PiDCoCAuLi4vZHQtYmluZGluZ3MvY2xvY2svYW1s
b2dpYyxzNC1wbGwtY2xrYy5owqDCoCB8wqAgMzAgKwo+Pj4+IMKgIDcgZmlsZXMgY2hhbmdlZCwg
MTA1OSBpbnNlcnRpb25zKCspCj4+Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHM0LXBsbC1jbGtjLnlhbWwKPj4+
PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvbWVzb24vczQtcGxsLmMKPj4+PiDC
oCBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvbWVzb24vczQtcGxsLmgKPj4+PiDCoCBj
cmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHM0LXBs
bC1jbGtjLmgKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvY2xvY2svYW1sb2dpYyxzNC1wbGwtY2xrYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsczQtcGxsLWNsa2MueWFtbAo+Pj4+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi5mZDUxN2U4ZWYxNGYK
Pj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Nsb2NrL2FtbG9naWMsczQtcGxsLWNsa2MueWFtbAo+Pj4+IEBAIC0wLDAgKzEsNTEg
QEAKPj4+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0Qt
Mi1DbGF1c2UpCj4+Pj4gKyVZQU1MIDEuMgo+Pj4+ICstLS0KPj4+PiArJGlkOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9jbG9jay9hbWxvZ2ljLHM0LXBsbC1jbGtjLnlhbWwjCj4+Pj4g
KyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+
Pj4+ICsKPj4+PiArdGl0bGU6IEFtbG9naWMgTWVzb24gUyBzZXJpYWxzIFBMTCBDbG9jayBDb250
cm9sbGVyCj4+Pj4gKwo+Pj4+ICttYWludGFpbmVyczoKPj4+PiArwqAgLSBOZWlsIEFybXN0cm9u
ZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4+Pj4gK8KgIC0gSmVyb21lIEJydW5ldCA8amJy
dW5ldEBiYXlsaWJyZS5jb20+Cj4+Pj4gK8KgIC0gWXUgVHUgPHl1Lmh1QGFtbG9naWMuY29tPgo+
Pj4+ICsKPj4+IE9uZSBibGFuayBsaW5lLgo+Pgo+PiAgwqBJIHdpbGwgZGVsZXRlIHRoaXMsIG9u
IG5leHQgdmVyc2lvbiBwYXRjaC4KPj4KPj4+Cj4+Pj4gKwo+Pj4+ICtwcm9wZXJ0aWVzOgo+Pj4+
ICvCoCBjb21wYXRpYmxlOgo+Pj4+ICvCoMKgwqAgY29uc3Q6IGFtbG9naWMsczQtcGxsLWNsa2MK
Pj4+PiArCj4+Pj4gK8KgIHJlZzoKPj4+PiArwqDCoMKgIG1heEl0ZW1zOiAxCj4+Pj4gKwo+Pj4+
ICvCoCBjbG9ja3M6Cj4+Pj4gK8KgwqDCoCBtYXhJdGVtczogMQo+Pj4+ICsKPj4+PiArwqAgY2xv
Y2stbmFtZXM6Cj4+Pj4gK8KgwqDCoCBpdGVtczoKPj4+PiArwqDCoMKgwqDCoCAtIGNvbnN0OiB4
dGFsCj4+Pj4gKwo+Pj4+ICvCoCAiI2Nsb2NrLWNlbGxzIjoKPj4+PiArwqDCoMKgIGNvbnN0OiAx
Cj4+Pj4gKwo+Pj4+ICtyZXF1aXJlZDoKPj4+PiArwqAgLSBjb21wYXRpYmxlCj4+Pj4gK8KgIC0g
cmVnCj4+Pj4gK8KgIC0gY2xvY2tzCj4+Pj4gK8KgIC0gY2xvY2stbmFtZXMKPj4+PiArwqAgLSAi
I2Nsb2NrLWNlbGxzIgo+Pj4+ICsKPj4+PiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4+
Pj4gKwo+Pj4+ICtleGFtcGxlczoKPj4+PiArwqAgLSB8Cj4+Pj4gK8KgwqDCoCBjbGtjX3BsbDog
Y2xvY2stY29udHJvbGxlckBmZTAwODAwMCB7Cj4+Pj4gK8KgwqDCoMKgwqAgY29tcGF0aWJsZSA9
ICJhbWxvZ2ljLHM0LXBsbC1jbGtjIjsKPj4+PiArwqDCoMKgwqDCoCByZWcgPSA8MHhmZTAwODAw
MCAweDFlOD47Cj4+Pj4gK8KgwqDCoMKgwqAgY2xvY2tzID0gPCZ4dGFsPjsKPj4+PiArwqDCoMKg
wqDCoCBjbG9jay1uYW1lcyA9ICJ4dGFsIjsKPj4+PiArwqDCoMKgwqDCoCAjY2xvY2stY2VsbHMg
PSA8MT47Cj4+Pj4gK8KgwqDCoCB9Owo+Pj4KPj4+Cj4+Pj4gKyNlbmRpZiAvKiBfX01FU09OX1M0
X1BMTF9IX18gKi8KPj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9h
bWxvZ2ljLHM0LXBsbC1jbGtjLmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2FtbG9naWMs
czQtcGxsLWNsa2MuaAo+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+Pj4gaW5kZXggMDAwMDAw
MDAwMDAwLi4zNDVmODcwMjM4ODYKPj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4gKysrIGIvaW5jbHVk
ZS9kdC1iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHM0LXBsbC1jbGtjLmgKPj4+Cj4+PiBUaGlzIGJl
bG9uZ3MgdG8gYmluZGluZ3MgcGF0Y2gsIG5vdCBkcml2ZXIuCj4+Pgo+Pj4+IEBAIC0wLDAgKzEs
MzAgQEAKPj4+PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wKyBPUiBNSVQp
ICovCj4+Pj4gKy8qCj4+Pj4gKyAqIENvcHlyaWdodCAoYykgMjAyMSBBbWxvZ2ljLCBJbmMuIEFs
bCByaWdodHMgcmVzZXJ2ZWQuCj4+Pj4gKyAqIEF1dGhvcjogWXUgVHUgPHl1LnR1QGFtbG9naWMu
Y29tPgo+Pj4+ICsgKi8KPj4+PiArCj4+Pj4gKyNpZm5kZWYgX0RUX0JJTkRJTkdTX0NMT0NLX0FN
TE9HSUNfUzRfUExMX0NMS0NfSAo+Pj4+ICsjZGVmaW5lIF9EVF9CSU5ESU5HU19DTE9DS19BTUxP
R0lDX1M0X1BMTF9DTEtDX0gKPj4+PiArCj4+Pj4gKy8qCj4+Pj4gKyAqIENMS0lEIGluZGV4IHZh
bHVlcwo+Pj4+ICsgKi8KPj4+PiArCj4+Pj4gKyNkZWZpbmUgQ0xLSURfRklYRURfUExMwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAxCj4+Pj4gKyNkZWZpbmUgQ0xLSURfRkNMS19ESVYywqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAzCj4+Pgo+Pj4gSW5kZXhlcyBzdGFydCBmcm9tIDAgYW5kIGFyZSBpbmNy
ZW1lbnRlZCBieSAxLiBOb3QgYnkgMi4KPj4+Cj4+PiBOQUsuCj4+Cj4+IEkgcmVtZW1iZXIgSmVy
b21lIGRpc2N1c3NpbmcgdGhpcyB3aXRoIHlvdS5Zb3UgY2FuIGxvb2sgYXQgdGhpcyBzdWJtaXNz
aW9uIGhpc3RvcnkuCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9jMDg4ZTAxYy0wNzE0
LTgyYmUtODM0Ny02MTQwZGFmNTY2NDBAbGluYXJvLm9yZy8KPiAKPiBIaXN0b3JpY2FsbHkgd2Ug
ZGlkIHRoYXQgYnkgb25seSBleHBvc2luZyBwYXJ0IG9mIHRoZSBudW1iZXJzLCBjb250cm9sbGlu
ZyB3aGljaAo+IGNsb2NrcyB3ZXJlIHBhcnQgb2YgdGhlIGJpbmRpbmdzLgo+IAo+IEJ1dCBpdCBz
ZWVtcyB0aGlzIGRvZXNuJ3QgbWFrZSBzZW5zIGFueW1vcmUsIG1heWJlIGl0IHdvdWxkIGJlIHRp
bWUgdG8gcHV0IGFsbCB0aGUKPiBjbG9jayBpZHMgaW4gdGhlIGJpbmRpbmdzIGZvciB0aGlzIG5l
dyBTb0MgYW5kIGJyZWFrIHdpdGggdGhlIHByZXZpb3VzIHN0cmF0ZWd5LgoKU28gdGhlIG91dGNv
bWUgb2YgdGhlIHByZXZpb3VzIGRpc2N1c3Npb24gd2FzIHNvbWV3aGVyZSBsYXRlciBpbiB0aGF0
CnRocmVhZDoKCj4gSXQgaXMganVzdCBhIGNob2ljZSB0byBub3QgZXhwb3NlIHNvbWUgSURzLgo+
IEl0IGlzIG5vdCB0aWVkIHRvIHRoZSBpbXBsZW1lbnRhdGlvbiBhdCBhbGwuCj4gSSB0aGluayB3
ZSBhY3R1YWxseSBmb2xsb3cgdGhlIHJ1bGVzIGFuZCB0aGUgaWRlYSBiZWhpbmQgaXQuCgoKQmVz
dCByZWdhcmRzLApLcnp5c3p0b2YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
