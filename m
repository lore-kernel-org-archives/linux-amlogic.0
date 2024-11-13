Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF39D41C19
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Nov 2024 08:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+/BTOFwcr1CpC5XHkbjkPRuzg+/PH/PV4AtuFnjvb4k=; b=RQbV1Cx7IWpOne
	qO420Fn++B9yLszhuvzKhBGNZ0ZewswFpXgZnmZUjURjfIUXsP1t4Yg+czqT/qOSnlx5N5JwoiCNE
	spjEt7NXQalnaIhUwbuEGr7Gv+AgrU6U2HBdR5QlVeQ59zSRw8It/C36BcvSH9Y86FzLuqimUT8UI
	mgOmvas6TxzzU+/XH4Y6gLGwsx/FjcAhnz2Jv8TNrz+29E6/AP9Y2VAc/JmLG1uRN83IMYlxvlG53
	GF55lXrhHwJf/3C8nFy2kTaaFdue+QdTEOZHjG6zFb15yVPfoEIad9jQQVC1x8IAv3GJ91NjpIrgc
	yvZUgpnmHW/kC5kVV1Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB8u8-000000067vu-3J9L;
	Wed, 13 Nov 2024 08:39:12 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB8rL-000000067NB-4BKB
	for linux-amlogic@lists.infradead.org;
	Wed, 13 Nov 2024 08:36:22 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-539e63c8678so7634832e87.0
        for <linux-amlogic@lists.infradead.org>; Wed, 13 Nov 2024 00:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731486978; x=1732091778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYPA6nWxJUsYUlpjbB6I1lZwViDm6ZxacBmzJ+ckWi0=;
        b=XaQJQdr5vdkTYaAFhdqH4TkrlMoaF3fWE5oSyrctDb+4+tkfsumSw/EhS1kePJ6Ey+
         KGwTkFO7tqAEnWALwgcza0QFdtfV3iSpQGh92CzhSyeIaJQku+e8B0KVD1GmaDiqjiTN
         CVrA1pt6+d2Duhl+P+2oU7ZS2coXkYK43D1IUUz+u+wYbyhfh4WMdS1HWzlNrgcZHRjw
         QWwlqIxFGBYEwjTFW04/kleUCKgZUKxW5DfwgDYkChAaZiP2l3klDKQwgXNH4lfrGbIM
         VJduf8c6VxY5k3s54kFtV7v+B1KGTFzUB6bqUZF+lJbcsYr3nNgtaiw91HSdDYdKSiY/
         0zEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731486978; x=1732091778;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYPA6nWxJUsYUlpjbB6I1lZwViDm6ZxacBmzJ+ckWi0=;
        b=RwSZqRyPQ/b5f9Uie+e++FL1HryDWPd1lLOO3KZoa4pwk0SM9On00UHqn8ACCJ4ttI
         j5SBZgOy06HtcDmTW4Apjbxju8lKE5T9VPrshBFKg9btFGAQQPP9sk57cPPQmszDPnEP
         E4flvh/G8JWfhPcY+MoRSsIoZAlWCT8fEh8GBqXGSr4cWuNSt86tA7JlHy/4/JLwXHsq
         yRSJahdIzuJxnu5lRcp4cRdRUUvoZWpcucFzBL610b4VpKRpLf9Ikd2FNNfbrDOag7yc
         aSOwsvPMi40lWAXFkHTuizK9tJpSM8KrZCRPMuROMRxr3b8uAibzJiUhJh2rkJgBC3rf
         DP3g==
X-Forwarded-Encrypted: i=1; AJvYcCWelPmy0cD9VHDkuCRBeb6TzJC7rIS9unbas+gyBi0fXX+yv4/tvuyKsHSdXICATEhTq7xeN2LcNeby4PLe@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4qy249Q14cb3tohCcBaJ58uCQb8bWf6i8Pn+eThNu3e5J5Yrj
	pBalSnz3SF76oclmM5+WmRtJZyVNGgIltYrrAn01MgGRB9oYOxcUkv4KT/ezvJE=
X-Google-Smtp-Source: AGHT+IGWfeeUXb1J7tNUbkIyXcKwhdZi8cijjSk5i0m1HIdGPU3q+vOzGiu/Ie/Rwn7qF3wDur68cQ==
X-Received: by 2002:a05:6512:3b12:b0:53d:a321:db74 with SMTP id 2adb3069b0e04-53da321dc7cmr28537e87.50.1731486977586;
        Wed, 13 Nov 2024 00:36:17 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:1230:8bee:11e5:5035])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d478511dsm18535635e9.0.2024.11.13.00.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 00:36:17 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: neil.armstrong@linaro.org,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman <khilman@baylibre.com>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,  Jian Hu
 <jian.hu@amlogic.com>,  Dmitry Rokosov <ddrokosov@sberdevices.ru>,  Yu Tu
 <yu.tu@amlogic.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: meson: Fix the determine rate error in
 clk_regmap_divider_ro_ops
In-Reply-To: <da391fec-738a-4044-a598-fee1137dfa5c@amlogic.com> (Chuan Liu's
	message of "Wed, 13 Nov 2024 14:55:50 +0800")
References: <20241112-fix_childclk_of_roclk_has_been_tampered_with-v2-1-64f8009cdf2a@amlogic.com>
	<35307d7a-a110-430d-9ba5-808a05450adb@linaro.org>
	<da391fec-738a-4044-a598-fee1137dfa5c@amlogic.com>
Date: Wed, 13 Nov 2024 09:36:16 +0100
Message-ID: <1j7c97v8cf.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_003620_468310_9F3325B5 
X-CRM114-Status: GOOD (  12.56  )
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

T24gV2VkIDEzIE5vdiAyMDI0IGF0IDE0OjU1LCBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2lj
LmNvbT4gd3JvdGU6CgogZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlv
bnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvbWVzb24vY2xrLXJlZ21hcC5j
Cj4+PiBiL2RyaXZlcnMvY2xrL21lc29uL2Nsay1yZWdtYXAuYwo+Pj4gaW5kZXggMDdmN2U0NDFi
OTE2Li5lZGY2NWNhOTJjN2EgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2Nsay9tZXNvbi9jbGst
cmVnbWFwLmMKPj4+ICsrKyBiL2RyaXZlcnMvY2xrL21lc29uL2Nsay1yZWdtYXAuYwo+Pj4gQEAg
LTgwLDIxICs4MCw2IEBAIHN0YXRpYyBpbnQgY2xrX3JlZ21hcF9kaXZfZGV0ZXJtaW5lX3JhdGUo
c3RydWN0Cj4+PiBjbGtfaHcgKmh3LAo+Pj4gwqAgewo+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgY2xr
X3JlZ21hcCAqY2xrID0gdG9fY2xrX3JlZ21hcChodyk7Cj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBj
bGtfcmVnbWFwX2Rpdl9kYXRhICpkaXYgPSBjbGtfZ2V0X3JlZ21hcF9kaXZfZGF0YShjbGspOwo+
Pj4gLcKgwqDCoMKgIHVuc2lnbmVkIGludCB2YWw7Cj4+PiAtwqDCoMKgwqAgaW50IHJldDsKPj4+
IC0KPj4+IC3CoMKgwqDCoCAvKiBpZiByZWFkIG9ubHksIGp1c3QgcmV0dXJuIGN1cnJlbnQgdmFs
dWUgKi8KPj4+IC3CoMKgwqDCoCBpZiAoZGl2LT5mbGFncyAmIENMS19ESVZJREVSX1JFQURfT05M
WSkgewo+Pgo+PiBZb3UncmUgYnJlYWtpbmcgY3VycmVudCBjb2RlIGJ5IG5vIG1vcmUgY2hlY2tp
bmcgdGhpcyBmbGFnLAo+PiB0aGUgbmV3IGNsa19yZWdtYXBfZGl2X3JvX2RldGVybWluZV9yYXRl
KCkgaXMgZmluZSwgYnV0IHlvdSBzaG91bGQgY2FsbAo+PiBpdCBmcm9tIGhlcmUgaWYgQ0xLX0RJ
VklERVJfUkVBRF9PTkxZIGlzIHNldC4KPgo+IE15IGlkZWEgaXMgdGhhdCB0aGUgbmV3bHkgYWRk
ZWQgY2xrX3JlZ21hcF9kaXZfcm9fZGV0ZXJtaW5lX3JhdGUoKQoKV2hhdGV2ZXIgeW91ciBpZGVh
IGlzLCB3aGF0IGhhcyBiZWVuIHN1Ym1pdHRlZCBpcyBicm9rZW4sIGFzIE5laWwKcG9pbnRlZCBv
dXQKCj4gaW1wbGVtZW50cyB0aGUgZnVuY3Rpb25hbGl0eSBvZiBoYW5kbGluZyBDTEtfRElWSURF
Ul9SRUFEX09OTFkgaW4KPiBjbGtfcmVnbWFwX2Rpdl9kZXRlcm1pbmVfcmF0ZSgpLiBJZiB3ZSBz
dGlsbCBrZWVwIHRoZSBsb2dpYyBmb3IKPiBoYW5kbGluZyBDTEtfRElWSURFUl9SRUFEX09OTFkg
aGVyZSwgaXQgd2lsbCBtYWtlCj4gY2xrX3JlZ21hcF9kaXZfZGV0ZXJtaW5lX3JhdGUoKSBhbWJp
Z3VvdXMgYW5kIGVhc2lseSBjb25mdXNlZC4KClRoYXQgd291bGQganVzdCBzaGlmdCB0aGUgcHJv
YmxlbSBmcm9tIG9uZSBmdW5jdGlvbiB0byBvdGhlci4KUGxlYXNlIGFwcGx5IE5laWwncyBzdWdn
ZXN0aW9uLgoKPgo+Pgo+PiBOZWlsCj4+Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dCA9IHJlZ21hcF9yZWFkKGNsay0+bWFwLCBkaXYtPm9mZnNldCwgJnZhbCk7Cj4+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+Pj4gLQo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB2YWwgPj49IGRpdi0+c2hpZnQ7Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHZhbCAmPSBjbGtfZGl2X21hc2soZGl2LT53aWR0aCk7Cj4+PiAtCj4+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiBkaXZpZGVyX3JvX2RldGVybWluZV9yYXRlKGh3LCByZXEsIGRp
di0+dGFibGUsCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRpdi0+d2lk
dGgsIGRpdi0+ZmxhZ3MsCj4+PiB2YWwpOwo+Pj4gLcKgwqDCoMKgIH0KPj4+Cj4+PiDCoMKgwqDC
oMKgIHJldHVybiBkaXZpZGVyX2RldGVybWluZV9yYXRlKGh3LCByZXEsIGRpdi0+dGFibGUsIGRp
di0+d2lkdGgsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRpdi0+ZmxhZ3MpOwo+Pj4gQEAgLTEyNyw5ICsx
MTIsMjggQEAgY29uc3Qgc3RydWN0IGNsa19vcHMgY2xrX3JlZ21hcF9kaXZpZGVyX29wcyA9IHsK
Pj4+IMKgIH07Cj4+PiDCoCBFWFBPUlRfU1lNQk9MX05TX0dQTChjbGtfcmVnbWFwX2RpdmlkZXJf
b3BzLCBDTEtfTUVTT04pOwo+Pj4KPj4+ICtzdGF0aWMgaW50IGNsa19yZWdtYXBfZGl2X3JvX2Rl
dGVybWluZV9yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHN0cnVjdCBjbGtfcmF0ZV9yZXF1ZXN0ICpyZXEpCj4+PiArewo+Pj4gK8KgwqDCoMKgIHN0
cnVjdCBjbGtfcmVnbWFwICpjbGsgPSB0b19jbGtfcmVnbWFwKGh3KTsKPj4+ICvCoMKgwqDCoCBz
dHJ1Y3QgY2xrX3JlZ21hcF9kaXZfZGF0YSAqZGl2ID0gY2xrX2dldF9yZWdtYXBfZGl2X2RhdGEo
Y2xrKTsKPj4+ICvCoMKgwqDCoCB1bnNpZ25lZCBpbnQgdmFsOwo+Pj4gK8KgwqDCoMKgIGludCBy
ZXQ7Cj4+PiArCj4+PiArwqDCoMKgwqAgcmV0ID0gcmVnbWFwX3JlYWQoY2xrLT5tYXAsIGRpdi0+
b2Zmc2V0LCAmdmFsKTsKPj4+ICvCoMKgwqDCoCBpZiAocmV0KQo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+Pj4gKwo+Pj4gK8KgwqDCoMKgIHZhbCA+Pj0gZGl2LT5z
aGlmdDsKPj4+ICvCoMKgwqDCoCB2YWwgJj0gY2xrX2Rpdl9tYXNrKGRpdi0+d2lkdGgpOwo+Pj4g
Kwo+Pj4gK8KgwqDCoMKgIHJldHVybiBkaXZpZGVyX3JvX2RldGVybWluZV9yYXRlKGh3LCByZXEs
IGRpdi0+dGFibGUsIGRpdi0+d2lkdGgsCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGl2LT5mbGFn
cywgdmFsKTsKPj4+ICt9Cj4+PiArCj4+PiDCoCBjb25zdCBzdHJ1Y3QgY2xrX29wcyBjbGtfcmVn
bWFwX2RpdmlkZXJfcm9fb3BzID0gewo+Pj4gwqDCoMKgwqDCoCAucmVjYWxjX3JhdGUgPSBjbGtf
cmVnbWFwX2Rpdl9yZWNhbGNfcmF0ZSwKPj4+IC3CoMKgwqDCoCAuZGV0ZXJtaW5lX3JhdGUgPSBj
bGtfcmVnbWFwX2Rpdl9kZXRlcm1pbmVfcmF0ZSwKPj4+ICvCoMKgwqDCoCAuZGV0ZXJtaW5lX3Jh
dGUgPSBjbGtfcmVnbWFwX2Rpdl9yb19kZXRlcm1pbmVfcmF0ZSwKPj4+IMKgIH07Cj4+PiDCoCBF
WFBPUlRfU1lNQk9MX05TX0dQTChjbGtfcmVnbWFwX2RpdmlkZXJfcm9fb3BzLCBDTEtfTUVTT04p
Owo+Pj4KPj4+Cj4+PiAtLS0KPj4+IGJhc2UtY29tbWl0OiA2NjQ5ODhlYjQ3ZGQyZDZhZTFkOWU0
MTg4ZWM5MTgzMjU2MmY4ZjI2Cj4+PiBjaGFuZ2UtaWQ6Cj4+PiAyMDI0MTExMS1maXhfY2hpbGRj
bGtfb2Zfcm9jbGtfaGFzX2JlZW5fdGFtcGVyZWRfd2l0aC02MWRiY2M2MjM3NDYKPj4+Cj4+PiBC
ZXN0IHJlZ2FyZHMsCj4+CgotLSAKSmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
