Return-Path: <SRS0=d+9B=GS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MALFORMED_FREEMAIL,
	MISSING_HEADERS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84482C433E0
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Jan 2021 15:28:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C83B22473
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Jan 2021 15:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C83B22473
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:Reply-To:
	To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fz1doKRwObIovjpVCmOSdnleZBwW2NOh1O9p9PsU0uI=; b=1o/L7xtazHtqyp0gCzpyCC482S
	LNnKRaY44RPpSJwoHOSD+EloNc2gyNXAEPV2tiOElO8VwpHRu+nBQMtEq/4H1eLDFYFOWU063UHHb
	MmwENfx9tEZKcl1JpOKZxvNNGsvO6AbPz9MhBkvKoySa2uQm8f+dKom0s/lCVv5R+z9GI2JbOxg+v
	HjxKMl10stMX7F0p6r7lrQYvNcC/e37TZGccQM7m3N5f2N7rgPlnVhW8h0xLFf4JPijh2RGM7s7rG
	LtJaSeAc0x6emX60Npjt25m7E53+VDslPyizv7XjQxNjWVQLr8E+v8vy45A40tQgbuv2EsyXZN/C7
	KyrENBjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0R0z-0003pT-P8; Fri, 15 Jan 2021 15:27:53 +0000
Received: from mout.gmx.net ([212.227.15.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0R0v-0003ow-AO; Fri, 15 Jan 2021 15:27:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1610724467;
 bh=/pVfX1fGWY011gKcI3ubh88MLdFtJSlJjAeijXAU+Q0=;
 h=X-UI-Sender-Class:Cc:From:Subject:Date;
 b=CzN92dYC1Gp/+b71wMxnbUx6yTSimpoyuGGJ7XuKoH0POAKe19nNL6aniaJ0+U2Ur
 3tamsVsuGOPIvw0kqqtxtFbIpMgo4B1Qls/UTCM9hK+mjYSjPx+0sukq2JZG7prP3u
 63SX5tXdXuuc3azV5ejiYd+oVqI/SSaby0AeBf4A=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.137.199] ([185.189.23.73]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MowKi-1lqV0X0J1q-00qVU9; Fri, 15
 Jan 2021 16:27:47 +0100
From: thilo <thibau@gmx.de>
Subject: Delay recognizing USB-Drive with Kernel 5.9.12
Message-ID: <3b5d2496-9be6-fdef-5e12-27def85aeb5b@gmx.de>
Date: Fri, 15 Jan 2021 15:27:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:suqbCjLZ0TkunV+T0eKQI/KNLPSdquGGMG8ZgcIxJU04bxnwXrk
 B4+ddzC6rEKGamOdPKBigcIrHYCXez8E+fFMasTpYWjSVB2O5l9F1ub8gI/Q1UK/DWg4BGf
 xCLg1I9FWrX5Myzoyy5YnA3yG1i5y3mFG00fLliV4xUlhGV+ViUmttSrHSDCrFcDYA3TYKU
 G4vXmsu6kiC6Ki0DNnj4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XzKfOYqsO0s=:mKpaEVxobP+fEDaPyhUr5Z
 CZXc9w4Bisz5Wqo7NrbRhpkxsq3WxB8mA3oD5uEu5XC55RICCSsVk61UXl57s/Wgjz8tqJIbr
 2HjAYiyxX8/X80WHQAo+dy88uOl11kyLj7Se4uPMlSo+mHjZEHKnGvnWprOwxi2Zc710YA6nO
 nmqD3LBwcEfFM13RC7taROzhe5jbURjx6h43WmOga3t1ZCfF9prHer53beAUnZnKDdv4bBl3k
 pKlB6PGZSTDhnQACE2lBfLGfuaTE7n03Orkz09rwjjvG2mCqZWB046RjY3VeiAWMDx5unOPwI
 LOME9gXuZU35Gn8xzs+whvIGVhyb4EQZF+lxgtxJ9z8y8k6kI1i5NyazOEZTjjObogybolTKS
 VLIFS0Xdo3PlwRQ0w/fHhdkXFMvai4EZQ5SIWWKNlwJZ/SsdUU/4PaPSMp4D6hs+PLqDqlsqg
 HZ089GIkU8wwPpb9R+Yj8kexaVA/14zVpz3qgsyGoXhkJg0BrFH2yAWGKMi3aUa3/d10qvuE3
 Vo2S0a9WtL76F5WrqGjtTSMja/6hJjXhg6aaSQcWKwW9g5T/8JlQppPI052fwahiABsloFTNh
 4KW6/c1tIJBE4sBKoM1RoRMUYU4ceFvjk9DEMki1NSYcYppEb6pPUF/B1hC0UgU8BWVue5qbk
 PYUcRbjoEE1yRHL3Iw7O77KrncRmcVDSfuWUbnOkGMYG6R94OoJTRqBd9vrbwOGDiRrMmxCUP
 fM22EOyCAqAz2B3AQhxRekAFLjLcxxgFrxq+/muiEeMQqE6i1MQB7hiFzOVOsyTZfXSVnz0fa
 RL1sEczOZg4LYi1Ej3ug1sS5stpdQOg1UAGOOzBKh+oCNHaWkONXFxA9p65pXNH5tDQ9RIaYs
 qR5s2f7HQbh1IEjbsEig==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_102749_573958_65F7C4DE 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGVsbG8hCkkgYW0gbmV3IHRvIGxpbnV4LCBwbGVhc2UgZXhjdXNlIGZhbHNlIHN0YXRlbWVudHMg
Oi0pKS4KSSB0aGluayB0aGVyZSBpcyBhIFVTQl9QV1JfRU4tcHJvYmxlbSBpbiB0aGUga2VybmVs
IChVQVMtZHJpdmVyPz8/KQpOT8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVsYXkgcmVjb2duaXpp
bmcgVVNCLWRyaXZlIHdpdGgga2VybmVsIDQuOS4yNDcKID4yMCBzZWPCoMKgwqAgZGVsYXkgcmVj
b2duaXppbmcgVVNCLWRyaXZlIHdpdGgga2VybmVsIDUuOS4xMgoKSW5zdGFsbGVkIEFybWJpYW4g
b24gU0Qgb24gYW4gT2Ryb2lkIG4yKy4KV2FudGVkIHRvIG1vdmUgc3lzdGVtIHRvIFVTQi1TU0Qs
IHVzZWQgbmFuZC1zYXRhLWluc3RhbGwuCkFmdGVyIHRoYXQsIGRpZG4ndCBib290LgpOZXcgaW5z
dGFsbCBvbiBTRC4KUmVhbGl6ZWQgdGhhdCBtb3N0IG9mIHRoZSB0aW1lIGl0IHRvb2sgPjIwIHNl
YyB0byByZWNvZ25pemUgVVNCLVNTRC4KSSBmZWx0LCBmYWlsaW5nIGJvb3Qgd2FzIGR1ZSB0byBz
bG93IFVTQi1kcml2ZSByZWNvZ25pdGlvbiAoc3lzdGVtIGRyaXZlCm5vdCBhdmFpbGFibGUgYXQg
Ym9vdCkuCgppbiBrZXJuLmxvZzoKLi4uIGxvY2FsaG9zdCBrZXJuZWw6IFvCoMKgIDMzLjc2MDAz
OF0gVVNCX1BXUl9FTjogZGlzYWJsaW5nCi4uLgouLi4gbG9jYWxob3N0IGtlcm5lbDogW8KgIDU4
Ny44MzYyNjhdIHVzYiAxLTEuMzogbmV3IGZ1bGwtc3BlZWQgVVNCCmRldmljZSBudW1iZXIgNiB1
c2luZyB4aGNpLWhjZAoKRGlkIHNvbWUgcmVzZWFyY2gsIGZvdW5kOgpodHRwczovL2ZvcnVtLmFy
bWJpYW4uY29tL3RvcGljLzEzNTgwLW9kcm9pZC1uMi1rZXJuZWw0OS1uby1ib290LW9uLXVzYi1z
YXRhLXNzZC8Kd2l0aDoKJ0JUVyB3aGF0IGlzIFVTQl9QV1JfRU4sIGFyZSB3ZSBsb29raW5nIGF0
IHNvbWV0aGluZyBpbnRlcmVzdGluZyBoZXJlPycKYW5kIGEgbGluayB0bzoKaHR0cHM6Ly9mb3J1
bS5hcm1iaWFuLmNvbS90b3BpYy8xMTc0MS1ib290LWZyb20tc3NkLXdpdGgtbjIvcGFnZS8zLwp3
aXRoOgonTm9uZSAuLi4gZGVsYXkgd2FzIG5lY2Vzc2FyeSB3aGVuIHVzaW5nIGtlcm5lbCA0Ljku
eCBzbyAuLi4gc2VlbXMgLi4uCnByb2JsZW0gd2l0aCB0aGUgNS54IGtlcm5lbCBzZXJpZXMsIHBy
ZXN1bWFibHkgYXJvdW5kIHRoZSBVQVMgZHJpdmVyIC4uLicKCldpdGggQXJtYmlhbi1jb25maWcs
IGNoYW5nZWQKS2VybmVsIDUuOS4xMiB0byA0LjkuMjQ3IChnbGFkbHkgdmVyeSBlYXN5IHdpdGgg
dGhhdCEpCkFmdGVyIHRoYXQgcmVjb2duaXRpb24gb2YgVVNCLVNTRCB3YXMgZmFzdC4KQW5vdGhl
ciBuYW5kLXNhdGEtaW5zdGFsbC4KTmV3IGJvb3QsIHdvcmtlZDogcm9vdCBwYXJ0IGlzIG9uIFVT
Qi1TU0QhISEKClNvOiBwcm9ibGVtIHdpdGggNS54IGtlcm5lbCwgc2VlIHRvcCBvZiBtYWlsLgoK
V291bGQgYmUgZ2xhZCB0byBnZXQgZmVlZGJhY2suCgpUaGlsbwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
