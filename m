Return-Path: <SRS0=+WvW=DG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE4C0C4346E
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 08:33:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61A3A20759
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 08:33:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CHGvtO3o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FeWdKp0c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61A3A20759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O9ippQKUtu00jpEWuaWGTp4AC9+6SGsm48NZxeOpi+8=; b=CHGvtO3oxz30SXDLO9+vCy2A1
	+6JY7D0uWRyhx9Be/of3wIqb9pqYj+r6Cw/5L9mJhbb68ISHGaKEIePmdlcOrbrGIXfn23X4i03aC
	3iumcwvmr/STd+BVV9jopILeDzfthZD99DElGwxh1uPWLXlBNShMMlrTi/piuhoHntoxMllD55igR
	mYiHVmYkyl34igScFLd6p4dNIH/366X6DjuFmikdqPu0w/IfGRsy3OuPU25QlzwT2zwSmprtCZMTP
	VoLSpbe6qsL9ebft1evm3TmprxRNmWYp7izGusHdE6r41v64h1SO6YvB3W43IFEk6eXMI3+3YIjgg
	n5VPJeWMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNB4c-0003ZO-Go; Tue, 29 Sep 2020 08:33:22 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNB3p-0003A3-Pr; Tue, 29 Sep 2020 08:32:34 +0000
Received: by mail-pg1-x544.google.com with SMTP id t14so3247674pgl.10;
 Tue, 29 Sep 2020 01:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=DYjZtwFq2L9ODgZVruIDHZD1toUiu3MKxRUMakYMWRU=;
 b=FeWdKp0cQSjJN/b3lNofZspZaUqJ1xmZBCJeFWNVxJK5m1jFEWKLosAu+xzSYXaXls
 KsAyM70BbFfxL/t8kG4vNnfIcVTBJcT8H1yXoWaNWSry/ANWA1tDgGX6Qv9tOO/NnWIb
 AftK/Br/DTPtTMgcNJGwERcEQU1JAj+Us3f3JNg6hCYauFca444Er8KnADs6e58ppwBv
 +n1eBdHmo+IZY7/XqbNPahtqvImr5u5d9f4iwWd2arv4Bi11HaMUzrjQUXaAhPMbaVTc
 PZOrjholSfG83IPmUP+ve7USkuxIrQE3ccqNkvu1OmrWH+xnzO9++NvaM+G1JPLiTktc
 eV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=DYjZtwFq2L9ODgZVruIDHZD1toUiu3MKxRUMakYMWRU=;
 b=nRKvpNnK/UAUwASygJatDTYn3FVmJfc1ZKIl6FaryPPH+y29lEliwvqLzTILzg6Bbl
 niNRwxToYH9C7P63aXgmIEfOHSN5nw2cL+3uLKvlpvLHUYstcRJIqJPSZ3cBIpkRtpXT
 6x6imeHtDAjtgm7AyvDWQf7hxSZz+fdUvpxmXOE3usZ56c/Z0f/l5hSjVzhrWtOquijT
 mI9ufjLJLAGKtmFhZ4VP1hDy23ZuNO5OBIlj6qBZZ5EG7kw0WYQNok+7X/XhNCIZ4bDa
 5V8WZoxRk9oNLyOVP0n2698cigy6rDjSsd64F2jjKCTskJNHQEx1CtExfT6zgrVJiM6H
 Mtbw==
X-Gm-Message-State: AOAM531y9Iz+wkCh0NAWf2OTz3dUAaXdX9czeXG//EG6JoHEcTxDqHLa
 9SOa2V1WrDVzEcRDnF5e3Zk=
X-Google-Smtp-Source: ABdhPJw2nceW5g+34FtHTjROn02MB3Gw+F0Nr3MztE6s2E9M+UpdsMe5B99y7mflzmBMfmU4S8/COA==
X-Received: by 2002:a65:410c:: with SMTP id w12mr2390169pgp.411.1601368350179; 
 Tue, 29 Sep 2020 01:32:30 -0700 (PDT)
Received: from ?IPv6:2402:b801:2840:8200:cc15:dbc:89f1:a9a5?
 ([2402:b801:2840:8200:cc15:dbc:89f1:a9a5])
 by smtp.gmail.com with ESMTPSA id 22sm4425686pfw.17.2020.09.29.01.32.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2020 01:32:29 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] mmc: host: meson-gx-mmc: fix possible deadlock
 condition for preempt_rt
To: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-mmc@vger.kernel.org
References: <20200927025418.12382-1-bjharper@gmail.com>
 <20200927025418.12382-2-bjharper@gmail.com> <7hwo0dmnbt.fsf@baylibre.com>
From: Brad Harper <bjharper@gmail.com>
Message-ID: <aaf796cc-7e6e-2831-5b13-9654f8e6fc77@gmail.com>
Date: Tue, 29 Sep 2020 18:32:24 +1000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <7hwo0dmnbt.fsf@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_043233_886629_38617B1F 
X-CRM114-Status: GOOD (  22.36  )
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
Cc: bigeasy@linutronix.de, linux-rt-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgS2V2aW4sCgogwqDCoMKgIEkgdGhpbmsgeW91IGFyZSByaWdodCzCoCBJIGRvbid0IGhhdmUg
YSBnb29kIGVub3VnaCB1bmRlcnN0YW5kaW5nIHRvIAptYWtlIHRoaXMgd29yayBzbyBwbGVhc2Ug
ZGlzcmVnYXJkIHRoZSBwYXRjaC7CoCBJIHdpbGwgdGFrZSBvbiAKU2ViYXN0aWFuJ3MgYWR2aWNl
IGFuZCBkbyBzb21lIHRlc3Rpbmcgd2l0aCAndGhyZWFkaXJxcycgcGFyYW1ldGVyIAplbmFibGVk
IGluIHN0YW5kYXJkIGtlcm5lbCB0byBzZWUgaWYgSSBjYW4gcmVwcm9kdWNlIG15IG9yaWdpbmFs
IGlzc3VlIAp0aGVyZS7CoCBJJ20gaG9waW5nIEplcm9tZSBtaWdodCBhbHNvIGJlIGFibGUgdG8g
aGVscCB3aXRoIHNvbWUgdGltZSB0byAKZmluZCBwcm9wZXIgc29sdXRpb24uCgpNYW55IFRoYW5r
cywKCkJyYWQuCgpPbiAyOS8wOS8yMDIwIDEwOjM1IGFtLCBLZXZpbiBIaWxtYW4gd3JvdGU6Cj4g
QnJhZCBIYXJwZXIgPGJqaGFycGVyQGdtYWlsLmNvbT4gd3JpdGVzOgo+Cj4+IC0tLQo+PiAgIGRy
aXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMgfCA0ICsrKy0KPj4gICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBUaGlzIHBhdGNoIHN0aWxsIG5l
ZWRzIGNoYW5nZWxvZyBzdW1tYXJpemluZyB0aGUgcHJvYmxlbSBhbmQgd2hhdCBpcwo+IGJlaW5n
IGZpeGVkIGJ5IHRoZSBwYXRjaC4gIE1vc3Qgb2Ygd2hhdCdzIGluIHRoZSBjb3ZlciBsZXR0ZXIg
YmVsb25ncwo+IGhlcmUuCj4KPiBUaGUgY292ZXIgbGV0dGVyIGNhbiBiZSB1c2VkIHRvIGRlc2Ny
aWJlIHRoZSBoaXN0b3J5L2JhY2tncm91bmQgdGhhdCB5b3UKPiBkb24ndCB3YW50IGluIHRoZSBw
YXRjaCBpdHNlbGYuICBBbHRlcm5hdHZpZWx5LCB5b3UgY291bGQgaW5jbHVkZSB0aGF0Cj4gaW5m
b3JtYXRpb24gaW4gdGhlIGEgc2luZ2xlIHBhdGNoIGVtYWlsIGFsc28gYmVjYXVzZSBldmVyeXRo
aW5nIGFmdGVyCj4gdGhlICItLS0iIGxpbmUgZG9lcyBub3QgZW5kIHVwIGluIGdpdCBoaXN0b3J5
Lgo+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5jIGIvZHJp
dmVycy9tbWMvaG9zdC9tZXNvbi1neC1tbWMuYwo+PiBpbmRleCAwOGEzYjFjMDUuLjNiYThmOTg4
ZCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1neC1tbWMuYwo+PiArKysg
Yi9kcml2ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5jCj4+IEBAIC0xNDYsNiArMTQ2LDcgQEAg
c3RydWN0IHNkX2VtbWNfZGVzYyB7Cj4+ICAgfTsKPj4gICAKPj4gICBzdHJ1Y3QgbWVzb25faG9z
dCB7Cj4+ICsJc3BpbmxvY2tfdAkJbG9jazsKPj4gICAJc3RydWN0CWRldmljZQkJKmRldjsKPj4g
ICAJc3RydWN0CW1lc29uX21tY19kYXRhICpkYXRhOwo+PiAgIAlzdHJ1Y3QJbW1jX2hvc3QJKm1t
YzsKPj4gQEAgLTEwNTEsNiArMTA1Miw3IEBAIHN0YXRpYyBpbnQgbWVzb25fbW1jX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ICAgCWhvc3QtPm1tYyA9IG1tYzsKPj4gICAJ
aG9zdC0+ZGV2ID0gJnBkZXYtPmRldjsKPj4gICAJZGV2X3NldF9kcnZkYXRhKCZwZGV2LT5kZXYs
IGhvc3QpOwo+PiArCXNwaW5fbG9ja19pbml0KCZob3N0LT5sb2NrKTsKPiBJJ20gY29uZnVzZWQg
YWJvdXQgd2hhdCB0aGlzIGxvY2sgaXMgaW50ZW5kZWQgdG8gZG8uICBZb3UgaW5pdCBpdCBoZXJl
LAo+IGJ1dCBpdCdzIG5ldmVyIHVzZWQgYW55d2hlcmUuCj4KPj4gICAJLyogVGhlIEcxMkEgU0RJ
TyBDb250cm9sbGVyIG5lZWRzIGFuIFNSQU0gYm91bmNlIGJ1ZmZlciAqLwo+PiAgIAlob3N0LT5k
cmFtX2FjY2Vzc19xdWlyayA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woJnBkZXYtPmRldiwK
Pj4gQEAgLTExMzksNyArMTE0MSw3IEBAIHN0YXRpYyBpbnQgbWVzb25fbW1jX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ICAgCSAgICAgICBob3N0LT5yZWdzICsgU0RfRU1N
Q19JUlFfRU4pOwo+PiAgIAo+PiAgIAlyZXQgPSByZXF1ZXN0X3RocmVhZGVkX2lycShob3N0LT5p
cnEsIG1lc29uX21tY19pcnEsCj4+IC0JCQkJICAgbWVzb25fbW1jX2lycV90aHJlYWQsIElSUUZf
T05FU0hPVCwKPj4gKwkJCQkgICBtZXNvbl9tbWNfaXJxX3RocmVhZCwgMCwKPj4gICAJCQkJICAg
ZGV2X25hbWUoJnBkZXYtPmRldiksIGhvc3QpOwo+PiAgIAlpZiAocmV0KQo+PiAgIAkJZ290byBl
cnJfaW5pdF9jbGs7Cj4gS2V2aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
