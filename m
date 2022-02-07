Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13133C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Feb 2022 13:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HdplLHrhpHSUdUO1lHuwvWt5Fx3Iz+cx240f456NXpU=; b=BwoI/Cv005cPnv
	5JJJABHWJg4n0MRg+G8+dw8yIzyGvwaYssVxK2y/UTaRJLp18Fzj1J557T9ZyotjA6rsyzPO3RW3F
	GGR6nUzRNl5g2OayQm7Q7ULyJAKCJ6VyDORTIB2ZeYUKDtDVJHKs552LIryBLIrtv0H9QmoWENrqV
	DP8qvteSBAuPfJC+dXkpm60OWfk3c8ymIgS27v7owanRwB63nljDnusnS0U1HLzh3OUFcaE3cWIsK
	iP26uEPPOYEHwGJ7LpGqNi5lOz1UBg/WI54y7gQ6F/BWYqe+nfA+Xy9JGuBzvHFEPlRes4zY6pVwx
	NAAcLTzjR/dqz9hhxPrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH3wY-00AFWV-96; Mon, 07 Feb 2022 13:20:34 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH3wU-00AFVG-E4; Mon, 07 Feb 2022 13:20:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73CC511D4;
 Mon,  7 Feb 2022 05:20:28 -0800 (PST)
Received: from [10.57.70.156] (unknown [10.57.70.156])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 223483F70D;
 Mon,  7 Feb 2022 05:20:25 -0800 (PST)
Message-ID: <65cde84a-8f8b-ac57-9b66-2b8d6378dbfa@arm.com>
Date: Mon, 7 Feb 2022 13:20:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2] add pmu to amlogic meson sm1
Content-Language: en-GB
To: Neil Armstrong <narmstrong@baylibre.com>,
 Benjamin Mordaunt <crawford.benjamin15@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220205234554.4403-1-crawford.benjamin15@gmail.com>
 <20220206144343.2194-1-crawford.benjamin15@gmail.com>
 <42c51f9d-d122-2d09-cdcd-f733cbc60d5b@baylibre.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <42c51f9d-d122-2d09-cdcd-f733cbc60d5b@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_052030_541133_A10B4524 
X-CRM114-Status: GOOD (  11.63  )
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

T24gMjAyMi0wMi0wNyAwODoxNCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gSGksCj4gCj4gT24g
MDYvMDIvMjAyMiAxNTo0MywgQmVuamFtaW4gTW9yZGF1bnQgd3JvdGU6Cj4+IC0tLQo+PiBUaGUg
ZHRzIGZvciBtZXNvbiBzbTEgYXBwZWFycyB0byBvbWl0IHRoZSBTb0MncyBQTVUsCj4+IHdoaWNo
IGlzIGVzc2VudGlhbCBmb3IgYWNjZXNzaW5nIHBlcmYgZXZlbnRzIHJlZ2FyZGluZwo+PiBlLmcu
IGNhY2hlIG9uIGUuZy4gdGhlIE9kcm9pZCBDNCBwbGF0Zm9ybS4gQWRkIGl0Lgo+Pgo+PiDCoCBh
cmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tc20xLmR0c2kgfCAxMyArKysrKysrKysr
KystCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tc20x
LmR0c2kgCj4+IGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXNtMS5kdHNpCj4+
IGluZGV4IDNkOGIxZjRmMi4uNDE0N2VlY2QyIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvbWVzb24tc20xLmR0c2kKPj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0
cy9hbWxvZ2ljL21lc29uLXNtMS5kdHNpCj4+IEBAIC02LDYgKzYsOCBAQAo+PiDCoCAjaW5jbHVk
ZSAibWVzb24tZzEyLWNvbW1vbi5kdHNpIgo+PiDCoCAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xv
Y2svYXhnLWF1ZGlvLWNsa2MuaD4KPj4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQt
Y29udHJvbGxlci9pcnEuaD4KPj4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29u
dHJvbGxlci9hcm0tZ2ljLmg+Cj4+IMKgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9wb3dlci9tZXNv
bi1zbTEtcG93ZXIuaD4KPj4gwqAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Jlc2V0L2FtbG9naWMs
bWVzb24tYXhnLWF1ZGlvLWFyYi5oPgo+PiDCoCAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcmVzZXQv
YW1sb2dpYyxtZXNvbi1nMTJhLWF1ZGlvLXJlc2V0Lmg+Cj4+IEBAIC05MCw3ICs5MiwxNiBAQCBs
MjogbDItY2FjaGUwIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9
ICJjYWNoZSI7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+PiDCoMKgwqDCoMKgIH07Cj4+IC0K
Pj4gKwo+PiArwqDCoMKgIGFybS1wbXUgewo+PiArwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9
ICJhcm0sY29ydGV4LWE1NS1wbXUiOwo+PiArwqDCoMKgwqDCoMKgwqAgaW50ZXJydXB0cyA9IDxH
SUNfU1BJIDEzNyBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIDxHSUNfU1BJIDEzOCBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxHSUNfU1BJIDE1MyBJUlFfVFlQRV9MRVZFTF9I
SUdIPiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxHSUNfU1BJIDE1NCBJ
UlFfVFlQRV9MRVZFTF9ISUdIPjsKPj4gK8KgwqDCoMKgwqDCoMKgIGludGVycnVwdC1hZmZpbml0
eSA9IDwmY3B1MD4sIDwmY3B1MT4sIDwmY3B1Mj4sIDwmY3B1Mz47Cj4+ICvCoMKgwqAgfTsKPj4g
Kwo+PiDCoMKgwqDCoMKgIGNwdV9vcHBfdGFibGU6IG9wcC10YWJsZSB7Cj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBjb21wYXRpYmxlID0gIm9wZXJhdGluZy1wb2ludHMtdjIiOwo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgb3BwLXNoYXJlZDsKPiAKPiBQbGVhc2Ugc2VlIE1hcmMncyBjb21tZW50cyBhYm91
dCBQTVUgc3VwcG9ydDoKPiBodHRwOi8vbG9yZS5rZXJuZWwub3JnL3IvODczNXBjcTYzby53bC1t
YXpAa2VybmVsLm9yZwoKSWYgU00xIGFjdHVhbGx5IGhhcyBkaXN0aW5jdCBwZXItY29yZSBpbnRl
cnJ1cHRzIGFzIHRoZSBwYXRjaCBpbXBsaWVzIAp0aGVuIGl0J3MgZmluZSAtIGl0J3Mgb25seSBH
MTJCIGFuZCBhbnl0aGluZyBlbHNlIHRoYXQgY29tYmluZXMgbXVsdGlwbGUgClBNVSBJUlFzIGlu
dG8gYSBzaW5nbGUgU1BJIHdoaWNoIGFyZSB1bnN1cHBvcnRhYmxlLgoKUm9iaW4uCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
