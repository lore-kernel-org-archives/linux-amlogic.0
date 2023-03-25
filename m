Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42204C6FD1C
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Mar 2023 09:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kIUJcVxjbW4ovYlCSAHQ1Xhfiw2fIberNdNjtsKiyB0=; b=kFoAg14nyBg21F
	ta5ataa/oqMG41M4exknMyCxQljZDGyQ9J87xVuHVeEa3cwAQ2Hnwr1b0coQ18F71NzoWxiS0MMda
	J3yZQKEaZwxeGmaMS9tJuUFp6OSBs4eTmpEw7r+dIC0Plnkgd0Ar9OZKHdjpR4re+nAeOhiM3iqT5
	pVCj2+Fy7t8faRCdNDOT61ZWIgdYsPxU5frUIS9YeqdURIUlLJB4QCCgpc0Xrx3cLViOBc81VO/mV
	XiSTHmT69nN+feN9501D8kzrUEDpCYgwcaXogatvrTNwJZHBp7ADyGKeKj1FeG6CA3LJEEUTyhYrN
	pSP937KDWWrYEmzP1eeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pg0Qs-006VEh-1q;
	Sat, 25 Mar 2023 09:43:30 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pg0Qo-006VE5-1K;
	Sat, 25 Mar 2023 09:43:28 +0000
Received: by mail-ed1-x52a.google.com with SMTP id i5so17094902eda.0;
        Sat, 25 Mar 2023 02:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679737404;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=irY3kauuEAWHlPP7SIvURQ+4Z1X6TILKILmsrBeQtRc=;
        b=JubLcFHunBB9x9eRX9pAJjgb7sokIxKieUa++sesvjeX6NBav5M/UGU0LNrhzRvUMs
         WKXnnU8nAnIGWAjiQUZbdeH6RUBkt4R1pmaD4KKRzPABDQOLII1gw1V/wS1PGMKXh9DT
         t2o3nUaG1gBPW0wd+/tDw7Thx9xZNu42URMwbPvVjY0Dl4/B0W9P4feTrKXLNaff4Roo
         8Q1CtprroVK44pxSlg51O21OR/N0vZwxPrmSblKTRfrkQjRvHavm4m6QwgbpxlIJeUFe
         9+PlJ9FewNj7yFOaXojJSGpCJvAgp2Ib1ZVfo6jA34hExFNIiisDZ1XJZ01oZTg9N/Qe
         n7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679737404;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=irY3kauuEAWHlPP7SIvURQ+4Z1X6TILKILmsrBeQtRc=;
        b=XS8CXz/iRGz3v3hleRoFqRC0QO+3JmoD36Gbtz6ZWLcuiiQkQmsbgrz6ypg3Wp6a4S
         usN986yZIHqTIaQmde13lJguIZeU7DjJNIO1d6LJh/lU6S5WM6SNswctp3T/hjEvxc3t
         j4b7mWFT5njStsnsKghFShjuyrZkkmwHHP+Thonji+XPWV7NKQ5hfteeDkkvQ+K/pNAV
         lpZwi6NeDVS5uHGK+1BgYy3L/4OUsNYRzEtGu0LgHkU/ocIJWsY6eUYqSrr17Kf/TMMr
         cWT+2r3V3MWZF+b4XiyXOtfj2JfRoFHR80snbtkkysfLns7rjfNMYN5GKT0LmZJM/7vz
         yuxg==
X-Gm-Message-State: AAQBX9d1x9832s08ox5NJOq26vsDg+qQxrbd/5zQYQi3vUY5wCGZKBie
	FV/To1y81KIbjYZQt0i1OzHstjcHRlg=
X-Google-Smtp-Source: AKy350a2XB9kr+MdUkofF+MNfzTczpHuYrOsjmLaI+LACAhF58Qz4bGuhm2/FGETRSAEMlkm/d8VAw==
X-Received: by 2002:a17:906:9b89:b0:8b2:b711:5e62 with SMTP id dd9-20020a1709069b8900b008b2b7115e62mr7131516ejc.52.1679737403997;
        Sat, 25 Mar 2023 02:43:23 -0700 (PDT)
Received: from ?IPV6:2a01:c22:73a5:2800:e59a:ffcb:c722:70cf? (dynamic-2a01-0c22-73a5-2800-e59a-ffcb-c722-70cf.c22.pool.telefonica.de. [2a01:c22:73a5:2800:e59a:ffcb:c722:70cf])
        by smtp.googlemail.com with ESMTPSA id d13-20020a170906344d00b009318ad4a583sm11565655ejb.210.2023.03.25.02.43.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Mar 2023 02:43:23 -0700 (PDT)
Message-ID: <654c8fff-9ea7-8f6e-e2ea-5525b175cc1b@gmail.com>
Date: Sat, 25 Mar 2023 10:43:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-pwm@vger.kernel.org,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <fad131e9-265f-6c4d-3223-932f69c9a927@gmail.com>
 <20230325082004.q7suqrt2udzgq4mb@pengutronix.de>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] pwm: meson: add support for S4 chip family
In-Reply-To: <20230325082004.q7suqrt2udzgq4mb@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230325_024326_468133_F8326CB6 
X-CRM114-Status: GOOD (  33.52  )
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

T24gMjUuMDMuMjAyMyAwOToyMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8sCj4g
Cj4gT24gRnJpLCBNYXIgMjQsIDIwMjMgYXQgMTE6MjM6MDlQTSArMDEwMCwgSGVpbmVyIEthbGx3
ZWl0IHdyb3RlOgo+PiBUaGlzIGFkZHMgcHdtIHN1cHBvcnQgZm9yIChhdCBsZWFzdCkgdGhlIHM0
IGNoaXAgZmFtaWx5LiBUaGUgZXh0ZW5zaW9uCj4+IGlzIGJhc2VkIG9uIHRoZSB2ZW5kb3IgZHJp
dmVyIHRoYXQgY2FuIGJlIGZvdW5kIGF0IFswXS4gVGhlcmUgdGhlCj4+IHZlcnNpb24gd2l0aCB0
aGUgbmV3IGNsb2NrIGhhbmRsaW5nIGlzIGNhbGxlZCBtZXNvbi12Mi1wd20uCj4+IENlbnRyYWwg
Y2hhbmdlIGlzIHRoYXQgdGhlIGNsb2NrIGlzIG5vdyBmdWxseSBwcm92aWRlZCBieSB0aGUgU29D
IGNsb2NrCj4+IGNvcmUuIFRoZSBtdWx0aXBsZXhlciBpc24ndCBhbnkgbG9uZ2VyIHBhcnQgb2Yg
dGhlIHB3bSBibG9jay4KPj4KPj4gVGhpcyB3YXMgdGVzdGVkIG9uIGEgc2MyLWJhc2VkIHN5c3Rl
bSB0aGF0IHVzZXMgdGhlIHNhbWUgcHdtIGJsb2NrLgo+Pgo+PiBbMF0gaHR0cHM6Ly9naXRodWIu
Y29tL2toYWRhcy9saW51eC9ibG9iL2toYWRhcy12aW1zLTUuNC55L2RyaXZlcnMvcHdtL3B3bS1t
ZXNvbi5jCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBn
bWFpbC5jb20+Cj4+IC0tLQo+PiBBZGRpbmcgdGhlIGFtbG9naWMsbWVzb24tczQtcHdtIGNvbXBh
dGlibGUgdG8gdGhlIGRvY3VtZW50YXRpb24gd2FzIHBhcnQKPj4gb2YgdGhlIHlhbWwgY29udmVy
c2lvbiBhbHJlYWR5Lgo+IAo+IFRoaXMgcmVmZXJzIHRvCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtcHdtLzNlZGM1YmE2LWJmM2QtZTQ1Yi0zNzdhLTllN2VjZTc2NDJhN0BnbWFpbC5j
b20KPiAKUmlnaHQKCj4gRG9lcyB0aGUgZXh0ZXJuYWwgbXV4IGNsayBiZWhhdmUgaW4gdGhlIHNh
bWUgd2F5IGFzIHRoZSBpbnRlcm5hbCBvbmVzCj4gYmVmb3JlPyAoSS5lLiBpdCBjYW4gc2VsZWN0
IG9uZSBvZiBhIGZldyBwYXJlbnRzIGFuZCBoYXMgYSBzaW5nbGUKPiBkaXZpZGVyPykKPiAKWWVz
LCBpdCdzIGEgc3RhbmRhcmQgY2xvY2sgd2l0aCBmZXcgcGFyZW50cywgYSBtdXgsIGFuZCBhIGRp
dmlkZXIuCgo+PiAtLS0KPj4gIGRyaXZlcnMvcHdtL3B3bS1tZXNvbi5jIHwgMzggKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20v
cHdtLW1lc29uLmMgYi9kcml2ZXJzL3B3bS9wd20tbWVzb24uYwo+PiBpbmRleCAxNmQ3OWNhNWQu
LjdhOTNmZGFkYSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKPj4gKysr
IGIvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKPj4gQEAgLTk4LDYgKzk4LDcgQEAgc3RydWN0IG1l
c29uX3B3bV9jaGFubmVsIHsKPj4gIHN0cnVjdCBtZXNvbl9wd21fZGF0YSB7Cj4+ICAJY29uc3Qg
Y2hhciAqIGNvbnN0ICpwYXJlbnRfbmFtZXM7Cj4+ICAJdW5zaWduZWQgaW50IG51bV9wYXJlbnRz
Owo+PiArCXVuc2lnbmVkIGludCBleHRfY2xrOjE7Cj4+ICB9Owo+PiAgCj4+ICBzdHJ1Y3QgbWVz
b25fcHdtIHsKPj4gQEAgLTE1OCw2ICsxNTksNyBAQCBzdGF0aWMgaW50IG1lc29uX3B3bV9jYWxj
KHN0cnVjdCBtZXNvbl9wd20gKm1lc29uLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAo+PiAgCXN0
cnVjdCBtZXNvbl9wd21fY2hhbm5lbCAqY2hhbm5lbCA9ICZtZXNvbi0+Y2hhbm5lbHNbcHdtLT5o
d3B3bV07Cj4+ICAJdW5zaWduZWQgaW50IGR1dHksIHBlcmlvZCwgcHJlX2RpdiwgY250LCBkdXR5
X2NudDsKPj4gIAl1bnNpZ25lZCBsb25nIGZpbl9mcmVxOwo+PiArCWludCBlcnI7Cj4+ICAKPj4g
IAlkdXR5ID0gc3RhdGUtPmR1dHlfY3ljbGU7Cj4+ICAJcGVyaW9kID0gc3RhdGUtPnBlcmlvZDsK
Pj4gQEAgLTE2NSw2ICsxNjcsMTQgQEAgc3RhdGljIGludCBtZXNvbl9wd21fY2FsYyhzdHJ1Y3Qg
bWVzb25fcHdtICptZXNvbiwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKPj4gIAlpZiAoc3RhdGUt
PnBvbGFyaXR5ID09IFBXTV9QT0xBUklUWV9JTlZFUlNFRCkKPj4gIAkJZHV0eSA9IHBlcmlvZCAt
IGR1dHk7Cj4+ICAKPj4gKwlpZiAobWVzb24tPmRhdGEtPmV4dF9jbGspIHsKPiAKPiBlcnIgY291
bGQgYmUgbG9jYWwgdG8gdGhpcyBibG9jay4KPiAKT0sKCj4+ICsJCWVyciA9IGNsa19zZXRfcmF0
ZShjaGFubmVsLT5jbGssIDB4ZmZmZlVMICogTlNFQ19QRVJfU0VDIC8gcGVyaW9kKTsKPj4gKwkJ
aWYgKGVycikgewo+PiArCQkJZGV2X2VycihtZXNvbi0+Y2hpcC5kZXYsICJmYWlsZWQgdG8gc2V0
IHB3bSBjbG9jayByYXRlXG4iKTsKPj4gKwkJCXJldHVybiBlcnI7Cj4+ICsJCX0KPj4gKwl9Cj4+
ICsKPj4gIAlmaW5fZnJlcSA9IGNsa19nZXRfcmF0ZShjaGFubmVsLT5jbGspOwo+PiAgCWlmIChm
aW5fZnJlcSA9PSAwKSB7Cj4+ICAJCWRldl9lcnIobWVzb24tPmNoaXAuZGV2LCAiaW52YWxpZCBz
b3VyY2UgY2xvY2sgZnJlcXVlbmN5XG4iKTsKPj4gQEAgLTE3MywxMCArMTgzLDE0IEBAIHN0YXRp
YyBpbnQgbWVzb25fcHdtX2NhbGMoc3RydWN0IG1lc29uX3B3bSAqbWVzb24sIHN0cnVjdCBwd21f
ZGV2aWNlICpwd20sCj4+ICAKPj4gIAlkZXZfZGJnKG1lc29uLT5jaGlwLmRldiwgImZpbl9mcmVx
OiAlbHUgSHpcbiIsIGZpbl9mcmVxKTsKPj4gIAo+PiAtCXByZV9kaXYgPSBkaXY2NF91NjQoZmlu
X2ZyZXEgKiAodTY0KXBlcmlvZCwgTlNFQ19QRVJfU0VDICogMHhmZmZmTEwpOwo+PiAtCWlmIChw
cmVfZGl2ID4gTUlTQ19DTEtfRElWX01BU0spIHsKPj4gLQkJZGV2X2VycihtZXNvbi0+Y2hpcC5k
ZXYsICJ1bmFibGUgdG8gZ2V0IHBlcmlvZCBwcmVfZGl2XG4iKTsKPj4gLQkJcmV0dXJuIC1FSU5W
QUw7Cj4+ICsJaWYgKG1lc29uLT5kYXRhLT5leHRfY2xrKSB7Cj4+ICsJCXByZV9kaXYgPSAwOwo+
PiArCX0gZWxzZSB7Cj4+ICsJCXByZV9kaXYgPSBkaXY2NF91NjQoZmluX2ZyZXEgKiAodTY0KXBl
cmlvZCwgTlNFQ19QRVJfU0VDICogMHhmZmZmTEwpOwo+PiArCQlpZiAocHJlX2RpdiA+IE1JU0Nf
Q0xLX0RJVl9NQVNLKSB7Cj4+ICsJCQlkZXZfZXJyKG1lc29uLT5jaGlwLmRldiwgInVuYWJsZSB0
byBnZXQgcGVyaW9kIHByZV9kaXZcbiIpOwo+PiArCQkJcmV0dXJuIC1FSU5WQUw7Cj4+ICsJCX0K
Pj4gIAl9Cj4+ICAKPj4gIAljbnQgPSBkaXY2NF91NjQoZmluX2ZyZXEgKiAodTY0KXBlcmlvZCwg
TlNFQ19QRVJfU0VDICogKHByZV9kaXYgKyAxKSk7Cj4+IEBAIC00NDUsNiArNDU5LDEwIEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgbWVzb25fcHdtX2RhdGEgcHdtX2cxMmFfZWVfZGF0YSA9IHsKPj4g
IAkubnVtX3BhcmVudHMgPSBBUlJBWV9TSVpFKHB3bV9nMTJhX2VlX3BhcmVudF9uYW1lcyksCj4+
ICB9Owo+PiAgCj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG1lc29uX3B3bV9kYXRhIHB3bV9zNF9k
YXRhID0gewo+PiArCS5leHRfY2xrID0gMSwKPj4gK307Cj4+ICsKPj4gIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qgb2ZfZGV2aWNlX2lkIG1lc29uX3B3bV9tYXRjaGVzW10gPSB7Cj4+ICAJewo+PiAgCQku
Y29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uOGItcHdtIiwKPj4gQEAgLTQ3OCw2ICs0OTYsMTAg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbWVzb25fcHdtX21hdGNoZXNbXSA9
IHsKPj4gIAkJLmNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1nMTJhLWFvLXB3bS1jZCIsCj4+
ICAJCS5kYXRhID0gJnB3bV9nMTJhX2FvX2NkX2RhdGEKPj4gIAl9LAo+PiArCXsKPj4gKwkJLmNv
bXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1zNC1wd20iLAo+PiArCQkuZGF0YSA9ICZwd21fczRf
ZGF0YQo+PiArCX0sCj4+ICAJe30sCj4+ICB9Owo+PiAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwg
bWVzb25fcHdtX21hdGNoZXMpOwo+PiBAQCAtNDkzLDYgKzUxNSwxNCBAQCBzdGF0aWMgaW50IG1l
c29uX3B3bV9pbml0X2NoYW5uZWxzKHN0cnVjdCBtZXNvbl9wd20gKm1lc29uKQo+PiAgCWZvciAo
aSA9IDA7IGkgPCBtZXNvbi0+Y2hpcC5ucHdtOyBpKyspIHsKPj4gIAkJc3RydWN0IG1lc29uX3B3
bV9jaGFubmVsICpjaGFubmVsID0gJm1lc29uLT5jaGFubmVsc1tpXTsKPj4gIAo+PiArCQlpZiAo
bWVzb24tPmRhdGEtPmV4dF9jbGspIHsKPj4gKwkJCXNucHJpbnRmKG5hbWUsIHNpemVvZihuYW1l
KSwgImNsa2luJXUiLCBpKTsKPj4gKwkJCWNoYW5uZWwtPmNsayA9IGRldm1fY2xrX2dldChkZXYs
IG5hbWUpOwo+PiArCQkJaWYgKElTX0VSUihjaGFubmVsLT5jbGspKQo+PiArCQkJCXJldHVybiBQ
VFJfRVJSKGNoYW5uZWwtPmNsayk7Cj4+ICsJCQljb250aW51ZTsKPj4gKwkJfQo+PiArCj4gCj4g
VGhpcyByZXF1aXJlcyBhIGJpbmRpbmcgY2hhbmdlLCByaWdodD8gV291bGQgaXQgbWFrZSBzZW5z
ZSB0byBkcm9wIHRoZQo+IGV4dF9jbGsgZmxhZyBhbmQgZGV0ZXJtaW5lIHRoYXQgYnkgdHJ5aW5n
IHRvIGdldCB0aGUgY2xrIGFuZCBpZiBpdCdzCj4gdGhlcmUsIGFzc3VtZSBleHRfY2xrIHdvdWxk
IGhhdmUgYmVlbiBzZXQ/Cj4gCkNsb2NrcyBjbGtpbjAgYW5kIGNsa2luMSBhcmUgdXNlZCBhbHJl
YWR5LCB0aGVyZWZvcmUgdGhlIGJpbmRpbmcgZG9lc24ndCBjaGFuZ2UuCkp1c3QgdGhlIHR5cGUg
b2YgY2xvY2sgdXNhZ2UgaXMgZGlmZmVyZW50LiBTbyBmYXIgdGhlIGNsb2NrcyBhcmUgdGhlIHBh
cmVudHMKZm9yIHRoZSBpbnRlcm5hbCBtdXgvZGl2LCBub3cgaXQncyB0aGUgImZpbmFsIiBjbG9j
a3MuCgo+IEFsc28gSSB3b25kZXIgaWYgaXQgd291bGQgbWFrZSBzZW5zZSB0byB1c2UgdGhlIHNh
bWUgbmFtZSBhcyB1c2VkIHdoZW4KPiB0aGUgbXV4IGNsayBpcyBpbnRlcm5hbCwgaS5lLiByZXVz
ZSBuYW1lIGZyb20gdGhlIGxpbmUgYmVsb3cuCj4gCklNTyB0aGlzIG5hbWUgaXMgb2sgd2hlbiB1
c2VkIGludGVybmFsbHksIGJ1dCB3b3VsZG4ndCBiZSBuaWNlIGlmIHVzZWQgaW4KdGhlIGJpbmRp
bmcsIGUuZy4gYmVjYXVzZSBwYXJ0IG9mIGl0IGlzIGRldl9uYW1lKGRldikuIFRoZXJlZm9yZSBJ
J2QgcHJlZmVyCnRvIHN0aWNrIHdpdGggdGhlIGNsa2luMC9jbGtpbjEgbmFtZXMuCgo+PiAgCQlz
bnByaW50ZihuYW1lLCBzaXplb2YobmFtZSksICIlcyNtdXgldSIsIGRldl9uYW1lKGRldiksIGkp
Owo+IAo+IEJlc3QgcmVnYXJkcwo+IFV3ZQo+IApIZWluZXIKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
