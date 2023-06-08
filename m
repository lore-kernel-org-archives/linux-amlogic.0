Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5179EC7EE29
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Jun 2023 20:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:CC:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5VXfl3/qPwsPWVdzMt7WuCRv+ykv6VE4KVNAbXSUH64=; b=xeuS3hLhL3LTQOEWuFdV3IE5/L
	bCn4gmXVSvWxkf+i1Vdn7/1eqiGSR/vu9K175Tec6b3GWKq7kCxInqSzA/izboaPLjsUrSbxm3Rea
	PZi+AgcUjGcFWwzeR8FnhPJgKU2g+gWcYMiqp8bWym+kH58vDszlOsGBV19WXFKMxAOfK5tW2/w+a
	CWP26fNkVTpYI3iP6otLTzfuEnCVZ/IIDuFpVbOxHR21RphYng8A2rYHE27ZhKN2FNbgYgRnBo7Ok
	bzlSHEMaUcRQi2m1NvSeZvMuHZj1Zu907qnk6S4wtSRajjJaFpQYoEX2iSMF/Mez0KyNnco3Wg8kA
	I1DKvGZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7LvF-00AUjd-0z;
	Thu, 08 Jun 2023 20:07:53 +0000
Received: from mx01.omp.ru ([90.154.21.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7LvB-00AUgA-11;
	Thu, 08 Jun 2023 20:07:51 +0000
Received: from [192.168.1.103] (31.173.86.116) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Thu, 8 Jun 2023
 23:07:39 +0300
Subject: Re: [PATCH RFC 02/13] mmc: meson-gx: fix deferred probing
From: Sergey Shtylyov <s.shtylyov@omp.ru>
To: Christian Hewitt <christianshewitt@gmail.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>, MMC <linux-mmc@vger.kernel.org>,
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, AML
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
References: <20211223171202.8224-1-s.shtylyov@omp.ru>
 <20211223171202.8224-3-s.shtylyov@omp.ru>
 <2E930ABF-DA2A-4BB0-A2A2-56495305118D@gmail.com>
 <cc2f4e45-497b-7c2c-3fdd-1591903813cf@omp.ru>
Organization: Open Mobile Platform
Message-ID: <16b74882-d65b-93c9-f72b-1d53bfefa22f@omp.ru>
Date: Thu, 8 Jun 2023 23:07:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <cc2f4e45-497b-7c2c-3fdd-1591903813cf@omp.ru>
Content-Language: en-US
X-Originating-IP: [31.173.86.116]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.59, Database issued on: 06/08/2023 19:38:57
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 177946 [Jun 08 2023]
X-KSE-AntiSpam-Info: Version: 5.9.59.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 516 516 efd4d74ff4b68f90ca62ae34a19f27bf46d81db5
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_no_received}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.86.116 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.86.116 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info: omp.ru:7.1.1;lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;31.173.86.116:7.1.2;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.86.116
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 06/08/2023 19:47:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 6/8/2023 5:02:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_130749_357962_7E517EEE 
X-CRM114-Status: GOOD (  24.98  )
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

SGVsbG8hCgpPbiA0LzIvMjMgODo1OCBQTSwgU2VyZ2V5IFNodHlseW92IHdyb3RlOgoKWy4uLl0K
IAo+Pj4gVGhlIGRyaXZlciBvdmVycmlkZXMgdGhlIGVycm9yIGNvZGVzIGFuZCBJUlEwIHJldHVy
bmVkIGJ5IHBsYXRmb3JtX2dldF9pcnEoKQo+Pj4gdG8gLUVJTlZBTCwgc28gaWYgaXQgcmV0dXJu
cyAtRVBST0JFX0RFRkVSLCB0aGUgZHJpdmVyIHdpbGwgZmFpbCB0aGUgcHJvYmUKPj4+IHBlcm1h
bmVudGx5IGluc3RlYWQgb2YgdGhlIGRlZmVycmVkIHByb2JpbmcuIFN3aXRjaCB0byBwcm9wYWdh
dGluZyB0aGUgZXJyb3IKPj4+IGNvZGVzIHVwc3RyZWFtLiBJUlEwIGlzIG5vIGxvbmdlciByZXR1
cm5lZCBieSBwbGF0Zm9ybV9nZXRfaXJxKCksIHNvIHdlIG5vdwo+Pj4gY2FuIHNhZmVseSBpZ25v
cmUgaXQuLi4KPj4+Cj4+PiBGaXhlczogY2JjYWFjNmQ3ZGQyICgibW1jOiBtZXNvbi1neC1tbWM6
IEZpeCBwbGF0Zm9ybV9nZXRfaXJxJ3MgZXJyb3IgY2hlY2tpbmcKPj4+ICIpCj4+PiBTaWduZWQt
b2ZmLWJ5OiBTZXJnZXkgU2h0eWx5b3YgPHMuc2h0eWx5b3ZAb21wLnJ1Pgo+Pj4gUmV2aWV3ZWQt
Ynk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5j
b20+Cj4+PiAtLS0KPj4+IGRyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMgfCA0ICsrLS0K
Pj4+IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pgo+
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMgYi9kcml2ZXJz
L21tYy9ob3N0L21lc29uLWd4LW1tYy5jCj4+PiBpbmRleCA4ZjM2NTM2Y2IxYjYuLmM3NjU2NTNl
ZTRkMCAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMKPj4+
ICsrKyBiL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMKPj4+IEBAIC0xMTgyLDggKzEx
ODIsOCBAQCBzdGF0aWMgaW50IG1lc29uX21tY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQo+Pj4gCX0KPj4+Cj4+PiAJaG9zdC0+aXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2
LCAwKTsKPj4+IC0JaWYgKGhvc3QtPmlycSA8PSAwKSB7Cj4+PiAtCQlyZXQgPSAtRUlOVkFMOwo+
Pj4gKwlpZiAoaG9zdC0+aXJxIDwgMCkgewo+Pj4gKwkJcmV0ID0gaG9zdC0+aXJxOwo+Pj4gCQln
b3RvIGZyZWVfaG9zdDsKPj4+IAl9Cj4+Cj4+IENhbiBJIGFzayBpZiB0aGlzIHBhdGNoL3Nlcmll
cyBbMF0gaGFzIGJlZW4gc3VwZXJzZWRlZCBvciBmb3Jnb3R0ZW4gb3IgPz8KPiAKPiAgICBJJ20g
c29ycnksIEkgYWN0dWFsbHkgZGlkIGZvcmdldCB0byByZS1wb3N0IHRoaXMgc2VyaWVzLCBhcyBh
c2tlZCBieSBVbGYuCj4gUGFydGx5IGJlY2F1c2UgdGhlIHBhdGNoIHRoYXQgdGhpcyBzZXJpZXMg
ZGVwZW5kZWQgb24gdG9vayBhYm91dCA0IG1vbnRocyB0bwo+IGhpdCB0aGUga2VybmVsIGFuZCBw
YXJ0bHkgYmVjYXVzZSBJIHN1c3BlbmRlZCBteSBwbGF0Zm9ybV9nZXRfaXJxKCkgcmVsYXRlZAo+
IHdvcmsgYXMgSSBnb3QgaW50byBQQVRBIGRldmVsb3BtZW50IGFuZCBzdHJ1Z2dsaW5nIHdpdGgg
YSBzdGF0aWMgYW5hbHl6ZXIncwo+IHJlcG9ydHMuLi4KPiAgICBBbHNvLCB0aGUgc2VyaWVzIGRv
ZXNuJ3Qgc2VlbSBzdXBlcnNlZGVkIGFzIGFsbCB0aGUgcGF0Y2hlcyBzdGlsbCBhcHBseSwKPiBz
b21ldGltZXMgd2l0aCBzbWFsbCBvZmZzZXRzLi4uCj4gCj4+IFRoZSBzZXJpZXMgaXQgZGVwZW5k
ZWQgdXBvbiBbMV0KPiAKPiAgICBUaGF0IHdhcyBhIHNpbmdsZSBwYXRjaC4gOi0pCj4gCj4+IGFw
cGVhcnMgdG8gaGF2ZSBiZWVuIG1lcmdlZCBhIHllYXIgYWdvIGFzIEkKPj4gY2FuIHNlZSBjZTc1
M2FkMTU0OWMgKCJwbGF0Zm9ybTogZmluYWxseSBkaXNhbGxvdyBJUlEwIGluIHBsYXRmb3JtX2dl
dF9pcnEoKQo+PiBhbmQgaXRzIGlsa+KAnSkgaW4gdXBzdHJlYW0gY29kZS4KPiAKPiAgICBOb3Qg
YSB3aG9sZSB5ZWFyIHlldCBidXQgMTEgbW9udGhzIHN1cmVseS4uLiA6LS8KPiAKPj4gSeKAmXZl
IGhhZCB0aGlzIHBhdGNoIGluIG15IHRlc3Rpbmcga2VybmVsIGZvcgo+PiAxMisgbW9udGhzIG5v
dyB3aXRoIG5vIG9ic2VydmFibGUgbmVnYXRpdmUgaW1wYWN0cyBzbyBhbSB3b25kZXJpbmcgaWYg
aXQgY2FuCj4+IGJlIHJlc2VudCBhbmQgbWVyZ2VkIG9yIEkgc2hvdWxkIGRyb3AgdGhlIHBhdGNo
IGZyb20gbXkgdHJlZT8KPiAKPiAgICBJdD8gWW91IG1lYW4gbXkgZml4IHBhdGNoZXMsIHN1cmVs
eT8gT3IgeW91IG1lYW4geW91IGNhcmUgYWJvdXQgcGF0Y2ggIzIKPiBvbmx5PyBBbnl3YXksIEkg
bmVlZCB0byBmaW5kIHRoZSB0aW1lIHRvIHJlZnJlc2gvcmVwb3N0IGl0Li4uCgogIE5vdyB0aGF0
IEknbSBvbiB2YWNhdGlvbiwgSSBoYXZlIGZvdW5kIHRoZSB0aW1lIC0tIHNlZSB0aGUgdjIgc2Vy
aWVzIGhlcmU6CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA2MDgxOTQ1MTkuMTA2
NjUtMS1zLnNodHlseW92QG9tcC5ydS8KClsuLi5dCgpNQlIsIFNlcmdleQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
