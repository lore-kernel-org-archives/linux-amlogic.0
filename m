Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2526BC48BF6
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Feb 2024 21:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TzuioMvczgDuAW1BIPi1ZOrkzoBQM+/RPUFydHBIB3E=; b=XzqjFQ8Phkitol
	NaL8BtkOn4EcTGBDnMu+2Uc88PoB6vwF8gAM6BCxLf1t5Kt5j07IRB791LEebqIPeI0nfIB0MG4Cw
	K5ylSNuB48vRzTRp7/3LwkOiO1bp0ncCQRhQp3V7cpG2yKTWbJ35V1ffug1GVf2eJS/JqXZbLwMbn
	Efo8DrrkeHblmsGsvPOCyHXPjSK67fe+Dda/v0cuJ3n6REOLHk9DqzCY24yTtokYHZe3re6kRoKwO
	fPzxCYuIdP6NUZMJutlH7Q33gPRZ6Q4dMGVkWuUSVhRpr2EY/+W0S1MAqZJT7DvwWTuxay5kerAvZ
	VxhPJjUJ7W81/9R2ntRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdzzT-0000000DjqY-2D4w;
	Sat, 24 Feb 2024 21:55:27 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdzzP-0000000Djpg-1qBE
	for linux-amlogic@lists.infradead.org;
	Sat, 24 Feb 2024 21:55:25 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-33d9d43a1eeso1298956f8f.2
        for <linux-amlogic@lists.infradead.org>; Sat, 24 Feb 2024 13:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708811720; x=1709416520; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bd2JtNYc/fS6VEPoOsOlftg5Z5gU6WPtxS+klhiNHEw=;
        b=VoHlSV3wgsAUb3tizFIMdkawrL8G9UBMUiaQeyjARpv1+wpS2HeXipRZNRGhWEixOw
         Rug1QcyWN08M6D7XcnnJg4d9WsfTP6c7Z/oRSXG3UNBUHz4HBIhV2AWo+z8kkSeloujJ
         mUmcNjpse2cfCEUS8vt69DpD0sF2PMj349cCO5zevaMl6qHiURUtFHQd0/KFNoj0R+iS
         r0RK4k/Bm+PbtM1AebSByUKGnlo0YZmzGtlcjbDFLs6brIJ6OnP+hmRKkv8M4vWHAaM1
         4MtjJGOdoFYoSFXTaykPXTpM1KOV+3FKoZybh2/xIof/PIOeVKV0zjsjqMjUC42ewSDu
         eQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708811720; x=1709416520;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bd2JtNYc/fS6VEPoOsOlftg5Z5gU6WPtxS+klhiNHEw=;
        b=MNC+8xRGw2UyTc5cmsBoHpeyWrL+eimFH+W6ERFVHimPTxQlHmfamil+KDno3mK6Io
         HL9mEzC/d4RlO/udpETM7wYudNtIafdx510r4p+YuBbQ+tJIGKMHqgenUbRQislX1WDh
         wqZ+URBIg9Fk+4engGuSr6bRB+NQrPNKwCG3n9W2an1RAUyM9b9KjAVSCXmG6X+ucYTS
         0HPm8/USSDc6q3EDAXI/iBDtKu9MZcR60hfgnPhTSNgZC/r7ALLc6g0D9LyjfSY9Qq4p
         wGxTpkbnXH5iG3Jio2IKHHv21lskXexyUPuglFqxhUyViMfkentx7xDiblcqb+6ysN2R
         2QDg==
X-Forwarded-Encrypted: i=1; AJvYcCVbm7zE5Pc95IBHTu+GKmL33/ZSWRogASIvTnjzEJIaLD1mCdaSPVm/oUFX/fqOmCdTuJRR2kn7lpuqFZGlGlIteiZEDgPDe4HjS4ejSit00jo=
X-Gm-Message-State: AOJu0Yze9UXCz7tnQWRS4+rhtYm2LKTl8Mu9aQKKFtZv/TYSsATAz0K7
	psy9pNti8Vfz/b2lBxzgEwupBQqUIpBuRCxhz4stqW5cfqYtt484AEzYurDZwYU=
X-Google-Smtp-Source: AGHT+IEQesKvwvPyYrDHhaQrQinfGdYTRf53gquwRuzpj1wTyg+bHWWNSxJR6XF73jpVrIp14V6Osw==
X-Received: by 2002:adf:e485:0:b0:33d:4c06:8614 with SMTP id i5-20020adfe485000000b0033d4c068614mr2012742wrm.37.1708811720486;
        Sat, 24 Feb 2024 13:55:20 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id bn9-20020a056000060900b0033da66e7bedsm3381205wrb.66.2024.02.24.13.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Feb 2024 13:55:20 -0800 (PST)
Message-ID: <eb54b791-05d7-4eee-825d-373cc78df689@linaro.org>
Date: Sat, 24 Feb 2024 22:55:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clocksource/drivers/arm_global_timer: Simplify
 prescaler register access
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 tglx@linutronix.de
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 patrice.chotard@foss.st.com, linux-amlogic@lists.infradead.org
References: <20240224213529.2601333-1-martin.blumenstingl@googlemail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240224213529.2601333-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240224_135523_588497_7EF25B67 
X-CRM114-Status: GOOD (  17.71  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjQvMDIvMjAyNCAyMjozNSwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBVc2UgR0VO
TUFTSygpIHRvIGRlZmluZSB0aGUgcHJlc2NhbGVyIG1hc2sgYW5kIG1ha2UgdGhlIHdob2xlIGRy
aXZlciB1c2UKPiB0aGUgbWFzayAodG9nZXRoZXIgd2l0aCBoZWxwZXJzIHN1Y2ggYXMgRklFTERf
e0dFVCxQUkVQLEZJVH0pIGluc3RlYWQgb2YKPiBuZWVkaW5nIGFuIGFkZGl0aW9uYWwgc2hpZnQg
YW5kIG1heCB2YWx1ZSBjb25zdGFudC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gQmx1bWVu
c3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgo+IC0tLQo+IENoYW5n
ZXMgZnJvbSB2MSBhdCBbMF06Cj4gLSB1c2UgRklFTERfRklUKCkgdG8gY2hlY2sgd2hldGhlciBw
c3Ygb3ZlcmZsb3dzIHRoZSByZWdpc3Rlcgo+IC0gdXBkYXRlIHRoZSBkZXNjcmlwdGlvbiBhY2Nv
cmRpbmdseQo+IAo+IAo+IFswXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjQwMjIx
MjE0MzQ4LjIyOTk2MzYtMS1tYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tLwo+IAo+
IAo+ICAgZHJpdmVycy9jbG9ja3NvdXJjZS9hcm1fZ2xvYmFsX3RpbWVyLmMgfCAxOSArKysrKysr
Ky0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxMSBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbG9ja3NvdXJjZS9hcm1fZ2xvYmFs
X3RpbWVyLmMgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL2FybV9nbG9iYWxfdGltZXIuYwo+IGluZGV4
IDhkZDFlNDZiNzE3Ni4uNDliMDk0YTIwNzE3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xvY2tz
b3VyY2UvYXJtX2dsb2JhbF90aW1lci5jCj4gKysrIGIvZHJpdmVycy9jbG9ja3NvdXJjZS9hcm1f
Z2xvYmFsX3RpbWVyLmMKPiBAQCAtOSw2ICs5LDcgQEAKPiAgIAo+ICAgI2luY2x1ZGUgPGxpbnV4
L2luaXQuaD4KPiAgICNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4KPiArI2luY2x1ZGUgPGxp
bnV4L2JpdGZpZWxkLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvY2xvY2tzb3VyY2UuaD4KPiAgICNp
bmNsdWRlIDxsaW51eC9jbG9ja2NoaXBzLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvY3B1Lmg+Cj4g
QEAgLTMxLDEwICszMiw3IEBACj4gICAjZGVmaW5lIEdUX0NPTlRST0xfQ09NUF9FTkFCTEUJCUJJ
VCgxKQkvKiBiYW5rZWQgKi8KPiAgICNkZWZpbmUgR1RfQ09OVFJPTF9JUlFfRU5BQkxFCQlCSVQo
MikJLyogYmFua2VkICovCj4gICAjZGVmaW5lIEdUX0NPTlRST0xfQVVUT19JTkMJCUJJVCgzKQkv
KiBiYW5rZWQgKi8KPiAtI2RlZmluZSBHVF9DT05UUk9MX1BSRVNDQUxFUl9TSElGVCAgICAgIDgK
PiAtI2RlZmluZSBHVF9DT05UUk9MX1BSRVNDQUxFUl9NQVggICAgICAgIDB4RkYKPiAtI2RlZmlu
ZSBHVF9DT05UUk9MX1BSRVNDQUxFUl9NQVNLICAgICAgIChHVF9DT05UUk9MX1BSRVNDQUxFUl9N
QVggPDwgXAo+IC0JCQkJCSBHVF9DT05UUk9MX1BSRVNDQUxFUl9TSElGVCkKPiArI2RlZmluZSBH
VF9DT05UUk9MX1BSRVNDQUxFUl9NQVNLCUdFTk1BU0soMTUsIDgpCj4gICAKPiAgICNkZWZpbmUg
R1RfSU5UX1NUQVRVUwkweDBjCj4gICAjZGVmaW5lIEdUX0lOVF9TVEFUVVNfRVZFTlRfRkxBRwlC
SVQoMCkKPiBAQCAtMjQ3LDcgKzI0NSw3IEBAIHN0YXRpYyB2b2lkIGd0X3dyaXRlX3ByZXNjKHUz
MiBwc3YpCj4gICAKPiAgIAlyZWcgPSByZWFkbChndF9iYXNlICsgR1RfQ09OVFJPTCk7Cj4gICAJ
cmVnICY9IH5HVF9DT05UUk9MX1BSRVNDQUxFUl9NQVNLOwo+IC0JcmVnIHw9IHBzdiA8PCBHVF9D
T05UUk9MX1BSRVNDQUxFUl9TSElGVDsKPiArCXJlZyB8PSBGSUVMRF9QUkVQKEdUX0NPTlRST0xf
UFJFU0NBTEVSX01BU0ssIHBzdik7Cj4gICAJd3JpdGVsKHJlZywgZ3RfYmFzZSArIEdUX0NPTlRS
T0wpOwo+ICAgfQo+ICAgCj4gQEAgLTI1Niw4ICsyNTQsNyBAQCBzdGF0aWMgdTMyIGd0X3JlYWRf
cHJlc2Modm9pZCkKPiAgIAl1MzIgcmVnOwo+ICAgCj4gICAJcmVnID0gcmVhZGwoZ3RfYmFzZSAr
IEdUX0NPTlRST0wpOwo+IC0JcmVnICY9IEdUX0NPTlRST0xfUFJFU0NBTEVSX01BU0s7Cj4gLQly
ZXR1cm4gcmVnID4+IEdUX0NPTlRST0xfUFJFU0NBTEVSX1NISUZUOwo+ICsJcmV0dXJuIEZJRUxE
X0dFVChHVF9DT05UUk9MX1BSRVNDQUxFUl9NQVNLLCByZWcpOwo+ICAgfQo+ICAgCj4gICBzdGF0
aWMgdm9pZCBfX2luaXQgZ3RfZGVsYXlfdGltZXJfaW5pdCh2b2lkKQo+IEBAIC0yNzIsOSArMjY5
LDkgQEAgc3RhdGljIGludCBfX2luaXQgZ3RfY2xvY2tzb3VyY2VfaW5pdCh2b2lkKQo+ICAgCXdy
aXRlbCgwLCBndF9iYXNlICsgR1RfQ09VTlRFUjApOwo+ICAgCXdyaXRlbCgwLCBndF9iYXNlICsg
R1RfQ09VTlRFUjEpOwo+ICAgCS8qIHNldCBwcmVzY2FsZXIgYW5kIGVuYWJsZSB0aW1lciBvbiBh
bGwgdGhlIGNvcmVzICovCj4gLQl3cml0ZWwoKChDT05GSUdfQVJNX0dUX0lOSVRJQUxfUFJFU0NB
TEVSX1ZBTCAtIDEpIDw8Cj4gLQkJR1RfQ09OVFJPTF9QUkVTQ0FMRVJfU0hJRlQpCj4gLQkgICAg
ICAgfCBHVF9DT05UUk9MX1RJTUVSX0VOQUJMRSwgZ3RfYmFzZSArIEdUX0NPTlRST0wpOwo+ICsJ
d3JpdGVsKEZJRUxEX1BSRVAoR1RfQ09OVFJPTF9QUkVTQ0FMRVJfTUFTSywKPiArCQkJICBDT05G
SUdfQVJNX0dUX0lOSVRJQUxfUFJFU0NBTEVSX1ZBTCAtIDEpIHwKPiArCSAgICAgICBHVF9DT05U
Uk9MX1RJTUVSX0VOQUJMRSwgZ3RfYmFzZSArIEdUX0NPTlRST0wpOwo+ICAgCj4gICAjaWZkZWYg
Q09ORklHX0NMS1NSQ19BUk1fR0xPQkFMX1RJTUVSX1NDSEVEX0NMT0NLCj4gICAJc2NoZWRfY2xv
Y2tfcmVnaXN0ZXIoZ3Rfc2NoZWRfY2xvY2tfcmVhZCwgNjQsIGd0X3RhcmdldF9yYXRlKTsKPiBA
QCAtMzAxLDcgKzI5OCw3IEBAIHN0YXRpYyBpbnQgZ3RfY2xrX3JhdGVfY2hhbmdlX2NiKHN0cnVj
dCBub3RpZmllcl9ibG9jayAqbmIsCj4gICAJCXBzdi0tOwo+ICAgCj4gICAJCS8qIHByZXNjYWxl
ciB3aXRoaW4gbGVnYWwgcmFuZ2U/ICovCj4gLQkJaWYgKHBzdiA8IDAgfHwgcHN2ID4gR1RfQ09O
VFJPTF9QUkVTQ0FMRVJfTUFYKQo+ICsJCWlmIChwc3YgPCAwIHx8ICFGSUVMRF9GSVQoR1RfQ09O
VFJPTF9QUkVTQ0FMRVJfTUFTSywgcHN2KSkKPiAgIAkJCXJldHVybiBOT1RJRllfQkFEOwoKV29u
J3QgRklFTERfRklUIGNvdmVyIHBzdiA8IDAgYWxzbyA/CgoKLS0gCjxodHRwOi8vd3d3LmxpbmFy
by5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MK
CkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBG
YWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0
dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
