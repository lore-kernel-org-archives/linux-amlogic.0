Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC319C38142
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Feb 2023 17:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ODffSN0b0ZQjZyUjCgq+ngm3jEQj5p8RN74PEqM/UE=; b=sqL8iwR71zrdFf
	gdITc6iM9fu5pvuXfjBXjg0cWddMDzMGgajXsKSnlboGAa7XPStQ8q6UWzjoT3gPYzAhPYcQyJUC1
	LjFG70727590EFBgeSb1SuV76gHu6rpxSpyKIskOEOOiXBR1PBxXOXni80Hn/Ta4OY2/NqqxyI1by
	cU5khRcqScEjAwpOxjIbGl5vAsva+75o6dSUx1lTTvrU5M5PWPzKsjIrqVBTC17ZazgmHHPynNEoX
	4OCqMT2UVOBAJ0Na3pQgtKWsfdvXTpEwiD0KlBXgiFmzhmAZVzzFNa6jOn+1e9N0TnNzkQPw1ygmT
	lY8jIGCyRR9Izwi1rsgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNHML-00D62E-LS; Wed, 01 Feb 2023 17:57:25 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNHMB-00D60M-Fx; Wed, 01 Feb 2023 17:57:16 +0000
Received: by mail-ej1-x633.google.com with SMTP id qw12so37862161ejc.2;
        Wed, 01 Feb 2023 09:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TOFsxXHlxqXlA48qiMJeRgdKOO85/Un+y+0ovI7eg9s=;
        b=SNUcBIWjdhnSifyDAOpYUNmlHlyBwOo9WpeUSlITBB1jweyACIgKX/hE4+PbBJY9BQ
         RH9JLG17cSJHCTxph+W0jg/1kjSwadyrEsR24WUz69HNOIr0zTFVrjC9xszm1jDCoB3V
         uXaxoan0q7fr0FaDPgBmDkM6uZByZPtVyWVZXfQ9H3AME8WQebRHWBfmp3zCj92vfruy
         720/4go2C3Yp0ybgFm/leBflp9MmjBes5CUeFl2wdFR09gE+3XNIx3etQbiQ4ckQQYFF
         c3ODKR7xf2sd55cvVBvm0xKh2oMGIcgVHM8Hj9t5Szqbqlwn2MgwniEfz6DZhD1LlQRf
         jwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TOFsxXHlxqXlA48qiMJeRgdKOO85/Un+y+0ovI7eg9s=;
        b=NgcnsHrg0eODCkBkx8CkEVw4p2n4/uaYutVwLSD9W/CkPgCqty7Al4nU7y+qKO5jLS
         XOh7qKuQ8bwieZMsP3OiVtaxJjCbaeb9SY6k7lNyJp28bnzCQyNigQYSCLVDpAZTJ1+h
         80jgSF4rRngfpdQQmZDWa9NL2eMZaqEs/GHY5TNdHwrCQFP16RSfo1iEKwDVio746wNi
         1gJMBlFT6GRl7nBi0hV+3EibjBn5XptrhlaJtSxlV0+z+OxOVCGe8q8tnosyz3CHYyaQ
         ojG0BE4fCaMe0eHg/WD5arCuTrN0TslK8ndIHHkjWLJbGRnVAOBiyOjyABoMbDUwX//V
         lWaw==
X-Gm-Message-State: AO0yUKU8oh2x7diPLl7PtHcDsySxAWs0hQibshj9/jSzft6HbhaAEsxY
	ZJul2nOnyE6G8XIAHfNeqxs=
X-Google-Smtp-Source: AK7set8u9NBpkH3sd96Za/IN2WsP6wrucWFFBzodpos6r0bO8ltj/mKpzcWPQltTninqrv7bhS4dVQ==
X-Received: by 2002:a17:906:5450:b0:87b:daca:aa1a with SMTP id d16-20020a170906545000b0087bdacaaa1amr2614878ejp.45.1675274233842;
        Wed, 01 Feb 2023 09:57:13 -0800 (PST)
Received: from ?IPV6:2a01:c23:b912:d400:3963:7bc4:12b:ddb3? (dynamic-2a01-0c23-b912-d400-3963-7bc4-012b-ddb3.c23.pool.telefonica.de. [2a01:c23:b912:d400:3963:7bc4:12b:ddb3])
        by smtp.googlemail.com with ESMTPSA id p7-20020a170906b20700b0088478517830sm6755950ejz.83.2023.02.01.09.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 09:57:13 -0800 (PST)
Message-ID: <618af59e-2e0f-7192-6411-620f49fcdcaf@gmail.com>
Date: Wed, 1 Feb 2023 18:57:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] arm(64): dts: meson: adjust order of some compatibles
Content-Language: en-US
To: neil.armstrong@linaro.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <e7b3fd1e-69eb-e66e-8abc-72b7c5fa975d@gmail.com>
 <b5a29098-53b2-c940-0b1f-4dff40d97e44@linaro.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <b5a29098-53b2-c940-0b1f-4dff40d97e44@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_095715_566729_27D8D755 
X-CRM114-Status: GOOD (  15.66  )
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

T24gMDEuMDIuMjAyMyAxODozMiwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gSGkgSGVpbmVyLAo+
IAo+IE9uIDAxLzAyLzIwMjMgMTg6MzAsIEhlaW5lciBLYWxsd2VpdCB3cm90ZToKPj4gRHVyaW5n
IHJldmlldyBvZiBhIG5ldyB5YW1sIGJpbmRpbmcsIGFmZmVjdGluZyB0aGVzZSBkdHMsIGl0IHR1
cm5lZCBvdXQKPj4gdGhhdCBzb21lIGNvbXBhdGlibGVzIGFyZW4ndCBvcmRlcmVkIGFzIHRoZXkg
c2hvdWxkIGJlLiBPcmRlciBzaG91bGQgYmUKPj4gbW9zdCBzcGVjaWZpYyB0byBsZWFzdCBzcGVj
aWZpYy4KPj4KPj4gU3VnZ2VzdGVkLWJ5OiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3Jn
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29t
Pgo+PiAtLS0KPj4gwqAgYXJjaC9hcm0vYm9vdC9kdHMvbWVzb244Yi5kdHNpwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfCA0ICsrLS0KPj4gwqAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2lj
L21lc29uLWd4YmIuZHRzaSB8IDQgKystLQo+PiDCoCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9n
aWMvbWVzb24tZ3hsLmR0c2nCoCB8IDQgKystLQo+PiDCoCAzIGZpbGVzIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jv
b3QvZHRzL21lc29uOGIuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL21lc29uOGIuZHRzaQo+PiBp
bmRleCBkNWEzZmUyMWUuLjU5NzkyMDlmZSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9k
dHMvbWVzb244Yi5kdHNpCj4+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL21lc29uOGIuZHRzaQo+
PiBAQCAtNTgwLDggKzU4MCw4IEBAICZldGhtYWMgewo+PiDCoCB9Owo+PiDCoCDCoCAmZ3Bpb19p
bnRjIHsKPj4gLcKgwqDCoCBjb21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tZ3Bpby1pbnRjIiwK
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiYW1sb2dpYyxtZXNvbjhiLWdwaW8taW50YyI7
Cj4+ICvCoMKgwqAgY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uOGItZ3Bpby1pbnRjIiwKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiYW1sb2dpYyxtZXNvbi1ncGlvLWludGMiOwo+PiDC
oMKgwqDCoMKgIHN0YXR1cyA9ICJva2F5IjsKPj4gwqAgfTsKPj4gwqAgZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neGJiLmR0c2kgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvbWVzb24tZ3hiYi5kdHNpCj4+IGluZGV4IDkyM2QyZDhiYi4uMTJlZjZl
ODFjIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3hi
Yi5kdHNpCj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neGJiLmR0
c2kKPj4gQEAgLTMwMCw4ICszMDAsOCBAQCAmZXRobWFjIHsKPj4gwqAgfTsKPj4gwqAgwqAgJmdw
aW9faW50YyB7Cj4+IC3CoMKgwqAgY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uLWdwaW8taW50
YyIsCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImFtbG9naWMsbWVzb24tZ3hiYi1ncGlv
LWludGMiOwo+PiArwqDCoMKgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1neGJiLWdwaW8t
aW50YyIsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImFtbG9naWMsbWVzb24tZ3Bpby1p
bnRjIjsKPj4gwqDCoMKgwqDCoCBzdGF0dXMgPSAib2theSI7Cj4+IMKgIH07Cj4+IMKgIGRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3hsLmR0c2kgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3hsLmR0c2kKPj4gaW5kZXggMDRlOWQwZjFi
Li5hZjkxMmY2OTggMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9t
ZXNvbi1neGwuZHRzaQo+PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24t
Z3hsLmR0c2kKPj4gQEAgLTMxMiw4ICszMTIsOCBAQCAmY2xrY19BTyB7Cj4+IMKgIH07Cj4+IMKg
IMKgICZncGlvX2ludGMgewo+PiAtwqDCoMKgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1n
cGlvLWludGMiLAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJhbWxvZ2ljLG1lc29uLWd4
bC1ncGlvLWludGMiOwo+PiArwqDCoMKgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1neGwt
Z3Bpby1pbnRjIiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiYW1sb2dpYyxtZXNvbi1n
cGlvLWludGMiOwo+PiDCoMKgwqDCoMKgIHN0YXR1cyA9ICJva2F5IjsKPj4gwqAgfTsKPj4gwqAg
Cj4gCj4gUGxlYXNlIHNlbmQgYSBuZXcgY2xlYW4gcGF0Y2hzZXQgd2l0aCB0aGUgYXNzb2NpYXRl
ZCBiaW5kaW5ncyBjaGFuZ2VzIHRoZW4gdGhpcyBwYXRjaCwKPiBhbmQgc3BsaXQgQVJNIGFuZCBh
cm02NCBpbiAyIHBhdGNoZXMuCj4gClNob3VsZG4ndCB0aGlzIHBhdGNoIGJlIGZpcnN0PyBFbHNl
IG1ha2UgZHRic19jaGVjayB3aWxsIGNvbXBsYWluLgoKPiBOZWlsCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
