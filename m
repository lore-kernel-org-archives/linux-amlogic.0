Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1FBC636D3
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Feb 2023 11:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+Aw5Hy6nlqh6KJt03bIMqp3UpJxiFTze1HHxPwfT9Y=; b=t7s3s9dphD9v7A
	4SvS/8EEvv64A4ce05K1kzRC4FMXyudamnUWtA4zWvTSqEs5igaefe33dVYhGky4UODfZXo5UVG7E
	fkojlKoCTbUUv5nMEYS83/G9ENQBCipaI8czWUoW+SykJO1+MY3x55A2L0hlUxQlrmJA7wMmQYd6e
	Pebht1wDMoN71aG7Hszw56Aq4yIkk5yis5nro4PqoaJ6eejbBo8oyPBfubGGPgITRB4e18i2Y8RSH
	Mg6ODyrCZ0C9Wqb3ZiYCfRTFyUsQLqW6qUQHdC7DNMyEMWXcmWyXymZauBL/fn/0QbSYbMHTdvFnP
	EGr/j5gOb3ad0bA/MWNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRAxJ-00BOir-52; Sun, 12 Feb 2023 11:55:41 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRAx7-00BOgb-9V
	for linux-amlogic@lists.infradead.org; Sun, 12 Feb 2023 11:55:30 +0000
Received: by mail-ed1-x533.google.com with SMTP id fj20so9526581edb.1
        for <linux-amlogic@lists.infradead.org>; Sun, 12 Feb 2023 03:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P2sjPxnKUguKOun3q9jhzdncQBzJCU5mglu0L33DNGM=;
        b=YD/Yqny3L0aDK8SPR0APVRcGfEEpa/8X0IZMT8YW30mN/BXA/aam9IS4uRaDF9E6II
         VG16cIDN2zX9Z8X5v4yACbtqsGZgG+c7TFkBA70Oz11NCCI/55sWG6erl7QiFzB7UucC
         mH89tdXKurbXyPNsdN4U/QUyhl8MWDJC7/ZltHr0KV+xqanIpdzCh5tb6W+03mk6E7us
         DNlKvhf5X37jo3IjOyjRUY4iOJh9D1Q9nzn/5mZrl0xdJA/V00ND3UZcLFOP4gVSO4uD
         ldphAtFgRn582zS5/KHniuvPFJdvxLZ782SL5D2guXGurhcBTAocen7at0VY7HOjsQfn
         biTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P2sjPxnKUguKOun3q9jhzdncQBzJCU5mglu0L33DNGM=;
        b=fi0CFTgezI+72Kdzf/k+6Vh8dY5GHnNsoHuGFL8qZCk8S68mEQmWS69/PPCOTI0Sgp
         UQA/Sfu59fELQwjwNChue5NKWy07X9ZrefNoCeRyXoY09Hil4zxR6pLEUAUSGpXmtryP
         0T8Mb29iNVU9D7KGTeKPmUi5S5dX9L8Yzgxnwp4sVeaSzz7CWmqSggAUw7diHSy1JWhO
         HMZA0KGtUChJEe9ImRaTdKrxzjB/kl91wfYfSp7aFdA9GBbZFPEWpRFsMBKvIru3pjhK
         lDFgOwhihqYzB3S0WMYBv7r8d3oJ5bJjRpGxtxu2eAJgKezTg9xHVu+dgmy+I8aDT48g
         9Uqg==
X-Gm-Message-State: AO0yUKWSilRnYAQHih1/wsGH0Q61N63AdiepIF0GFgswHSJ+beVkVo40
	q/J9qiW55N32B/51zHBUmow=
X-Google-Smtp-Source: AK7set+H9Kszxg/m5rBvuzO5uIJRJJ7JbJigPvFuXwLxP8QOWoA6TIRi8Q91gRpNBAQW9RbuxkAUOg==
X-Received: by 2002:a50:ba8e:0:b0:4a2:358e:e734 with SMTP id x14-20020a50ba8e000000b004a2358ee734mr21609670ede.7.1676202927072;
        Sun, 12 Feb 2023 03:55:27 -0800 (PST)
Received: from ?IPV6:2a01:c23:bdd2:4300:1932:303f:b63a:5a0e? (dynamic-2a01-0c23-bdd2-4300-1932-303f-b63a-5a0e.c23.pool.telefonica.de. [2a01:c23:bdd2:4300:1932:303f:b63a:5a0e])
        by smtp.googlemail.com with ESMTPSA id n16-20020a509350000000b004acb38eea1csm2852773eda.28.2023.02.12.03.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Feb 2023 03:55:26 -0800 (PST)
Message-ID: <ccc7ca41-8874-74ca-d647-4eb84cb0f207@gmail.com>
Date: Sun, 12 Feb 2023 12:55:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Linux Amlogic <linux-amlogic@lists.infradead.org>
References: <Y+fU96RVq4GwKaDH@geday>
 <bd2dc69d-f7b0-bc60-782f-34ac497d9507@gmail.com> <Y+g114kasLS6/x12@geday>
 <2CB0C2EC-B084-4185-843D-3DEADAC5864B@gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: Regression caused by 066ecde6d826b443 ("mmc: meson-gx: add SDIO
 interrupt support")
In-Reply-To: <2CB0C2EC-B084-4185-843D-3DEADAC5864B@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_035529_497278_3F5F5EAA 
X-CRM114-Status: GOOD (  22.27  )
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

T24gMTIuMDIuMjAyMyAwMzozOCwgQ2hyaXN0aWFuIEhld2l0dCB3cm90ZToKPiAKPj4gT24gMTIg
RmViIDIwMjMsIGF0IDQ6NDEgYW0sIEdlcmFsZG8gTmFzY2ltZW50byA8Z2VyYWxkb2dhYnJpZWxA
Z21haWwuY29tPiB3cm90ZToKPj4KPj4gT24gU2F0LCBGZWIgMTEsIDIwMjMgYXQgMTE6NDQ6MjVQ
TSArMDEwMCwgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+Pj4gT24gMTEuMDIuMjAyMyAxODo0OCwg
R2VyYWxkbyBOYXNjaW1lbnRvIHdyb3RlOgo+Pj4+IEhpIEhlaW5lciBhbmQgVWxmLAo+Pj4+Cj4+
Pj4gQWZ0ZXIgdXBkYXRpbmcgdG8ga2VybmVsIDYuMi4wLXJjNyBmcm9tIDUuMTkuMSBteSBIOTYg
UHJvKyBUViBCb3gKPj4+PiAoQW1sb2dpYyBTOTEyKSBmYWlsZWQgdG8gcHJvdmlkZSB3aWZpLiBU
aGUgbW9kdWxlIGluIHF1ZXN0aW9uIGlzIGEKPj4+PiBRQ0E5Mzc3IFNESU8gZHJpdmVuIGJ5IGF0
aDEway4KPj4+Pgo+Pj4+IFJldmVydGluZyAwNjZlY2RlNmQ4MjZiNDQzZjQ5MjU3MGUwODBjYmEz
ZjIyMTIyODBkCj4+Pj4gKCJtbWM6IG1lc29uLWd4OiBhZGQgU0RJTyBpbnRlcnJ1cHQgc3VwcG9y
dCIpCj4+Pj4gc29sdmVzIHRoZSBwcm9ibGVtIGFuZCBJIGhhdmUgd2lmaSBhZ2Fpbi4KPj4+Pgo+
Pj4+IFRoYW5rcywKPj4+PiBHZXJhbGRvIE5hc2NpbWVudG8KPj4+Cj4+PiBTdXBwb3NlZGx5IHRo
aXMgcGF0Y2ggcmV2ZWFsZWQgYW4gaXNzdWUgd2l0aCBpbmNvcnJlY3QgaW50ZXJydXB0Cj4+PiB0
cmlnZ2VyIHR5cGVzLiBBIGZpeCBpcyBjdXJyZW50bHkgaW4gdGVzdGluZzoKPj4+IDg3ZWY2Mzhk
NjU1NyAoIlRFU1Q6IGFybTY0OiBkdHM6IGFtbG9naWM6IE1ha2UgbW1jIGhvc3QgY29udHJvbGxl
ciBpbnRlcnJ1cHRzIGxldmVsLXNlbnNpdGl2ZSIpCj4+Pgo+Pgo+PiBIaSBIZWluZXIsIGFuZCB0
aGFua3MgZm9yIHRoZSBxdWljayByZXBseS4KPj4KPj4gSSByZXZlcnRlZCBteSByZXZlcnQgYW5k
IGFkZGVkIHRoZSBURVNUIHBhdGNoIGFib3V0IGludGVycnVwdHMgaW4gdGhlIERUCj4+IGJ1dCBz
dGlsbCBoYWQgbm8gbHVjay4KPj4KPj4gV2hhdCBzb2x2ZWQgbXkgcHJvYmxlbSB3YXMgYWRkaW5n
ICJjYXAtc2Rpby1pcnEiIHRvICJzZF9lbW1jX2EiIERUIG5vZGUuCj4+IE5vdyBhbGwgaXMgd2Vs
bC4KPiAKPiBDb25maXJtaW5nIHRoYXQgc2V0dGluZyBjYXAtc2Rpby1pcnEgcmVzb2x2ZWQgdGhl
IGNvbnRpbnVpbmcgaXNzdWVzIEnigJl2ZSBzZWVuIHdpdGggYW4KPiBRQ0E5MzM3IG1vZHVsZSBh
ZnRlciByZXN0b3JpbmcgdGhlIFNESU8gaXJxIGNoYW5nZXMgYW5kIHBpY2tpbmcgcmVjZW50IGZp
eGVzIHRvIG15Cj4gYnJhbmNoLiBUaGFua3MgR2VyYWxkbyEKPiAKPiBJ4oCZdmUgbm90IG9ic2Vy
dmVkIGlzc3VlcyB3aXRoIEJyb2FkY29tIG1vZHVsZXMsIG9ubHkgUUNBOTM3NywgYnV0IGlzIHRo
aXMgc29tZXRoaW5nCj4gdGhhdCBzaG91bGQgYmUgZGVmaW5lZCBmb3IgYWxsIHNkX2VtbWNfYSBu
b2Rlcz8KPiAKPiBDaHJpc3RpYW4KCkNvdWxkIHlvdSBwbGVhc2UgdGVzdCB3aGV0aGVyIHRoZSBm
b2xsb3dpbmcgZml4ZXMgdGhlIGlzc3VlIGZvciB5b3UKaWYgY2FwLXNkaW8taXJxIGlzbid0IHNl
dD8KCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1neC1tbWMuYyBiL2RyaXZl
cnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMKaW5kZXggNmU1ZWEwMjEzLi4zNGYyYThkZjggMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMKKysrIGIvZHJpdmVycy9t
bWMvaG9zdC9tZXNvbi1neC1tbWMuYwpAQCAtNDM1LDcgKzQzNSw4IEBAIHN0YXRpYyBpbnQgbWVz
b25fbW1jX2Nsa19pbml0KHN0cnVjdCBtZXNvbl9ob3N0ICpob3N0KQogCWNsa19yZWcgfD0gRklF
TERfUFJFUChDTEtfQ09SRV9QSEFTRV9NQVNLLCBDTEtfUEhBU0VfMTgwKTsKIAljbGtfcmVnIHw9
IEZJRUxEX1BSRVAoQ0xLX1RYX1BIQVNFX01BU0ssIENMS19QSEFTRV8wKTsKIAljbGtfcmVnIHw9
IEZJRUxEX1BSRVAoQ0xLX1JYX1BIQVNFX01BU0ssIENMS19QSEFTRV8wKTsKLQljbGtfcmVnIHw9
IENMS19JUlFfU0RJT19TTEVFUChob3N0KTsKKwlpZiAoaG9zdC0+bW1jLT5jYXBzICYgTU1DX0NB
UF9TRElPX0lSUSkKKwkJY2xrX3JlZyB8PSBDTEtfSVJRX1NESU9fU0xFRVAoaG9zdCk7CiAJd3Jp
dGVsKGNsa19yZWcsIGhvc3QtPnJlZ3MgKyBTRF9FTU1DX0NMT0NLKTsKIAogCS8qIGdldCB0aGUg
bXV4IHBhcmVudHMgKi8KQEAgLTk0OCwxMSArOTQ5LDEzIEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBt
ZXNvbl9tbWNfaXJxKGludCBpcnEsIHZvaWQgKmRldl9pZCkKIHsKIAlzdHJ1Y3QgbWVzb25faG9z
dCAqaG9zdCA9IGRldl9pZDsKIAlzdHJ1Y3QgbW1jX2NvbW1hbmQgKmNtZDsKLQl1MzIgc3RhdHVz
LCByYXdfc3RhdHVzOworCXUzMiBzdGF0dXMsIHJhd19zdGF0dXMsIGlycV9tYXNrID0gSVJRX0VO
X01BU0s7CiAJaXJxcmV0dXJuX3QgcmV0ID0gSVJRX05PTkU7CiAKKwlpZiAoaG9zdC0+bW1jLT5j
YXBzICYgTU1DX0NBUF9TRElPX0lSUSkKKwkJaXJxX21hc2sgfD0gSVJRX1NESU87CiAJcmF3X3N0
YXR1cyA9IHJlYWRsKGhvc3QtPnJlZ3MgKyBTRF9FTU1DX1NUQVRVUyk7Ci0Jc3RhdHVzID0gcmF3
X3N0YXR1cyAmIChJUlFfRU5fTUFTSyB8IElSUV9TRElPKTsKKwlzdGF0dXMgPSByYXdfc3RhdHVz
ICYgaXJxX21hc2s7CiAKIAlpZiAoIXN0YXR1cykgewogCQlkZXZfZGJnKGhvc3QtPmRldiwKQEAg
LTEyMDQsNiArMTIwNywxMSBAQCBzdGF0aWMgaW50IG1lc29uX21tY19wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogCQlnb3RvIGZyZWVfaG9zdDsKIAl9CiAKKwltbWMtPmNhcHMg
fD0gTU1DX0NBUF9DTUQyMzsKKworCWlmIChtbWMtPmNhcHMgJiBNTUNfQ0FQX1NESU9fSVJRKQor
CQltbWMtPmNhcHMyIHw9IE1NQ19DQVAyX1NESU9fSVJRX05PVEhSRUFEOworCiAJaG9zdC0+ZGF0
YSA9IChzdHJ1Y3QgbWVzb25fbW1jX2RhdGEgKikKIAkJb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRh
KCZwZGV2LT5kZXYpOwogCWlmICghaG9zdC0+ZGF0YSkgewpAQCAtMTI3NywxMSArMTI4NSw2IEBA
IHN0YXRpYyBpbnQgbWVzb25fbW1jX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
CiAKIAlzcGluX2xvY2tfaW5pdCgmaG9zdC0+bG9jayk7CiAKLQltbWMtPmNhcHMgfD0gTU1DX0NB
UF9DTUQyMzsKLQotCWlmIChtbWMtPmNhcHMgJiBNTUNfQ0FQX1NESU9fSVJRKQotCQltbWMtPmNh
cHMyIHw9IE1NQ19DQVAyX1NESU9fSVJRX05PVEhSRUFEOwotCiAJaWYgKGhvc3QtPmRyYW1fYWNj
ZXNzX3F1aXJrKSB7CiAJCS8qIExpbWl0IHNlZ21lbnRzIHRvIDEgZHVlIHRvIGxvdyBhdmFpbGFi
bGUgc3JhbSBtZW1vcnkgKi8KIAkJbW1jLT5tYXhfc2VncyA9IDE7Ci0tIAoyLjM5LjEKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
