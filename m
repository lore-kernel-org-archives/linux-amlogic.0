Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E8AC7619A
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Apr 2023 17:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fQax7y+6uxFYMXrDIq2e8ZOVq5g+CpFBBTA5yepEbAg=; b=DL2It7sd4HS8JvkG5zQQtlWLJm
	CmCFdbrQop4/V2jCfONWnaFM9z7yccgezh4JvGsGKKxzZGKjCMXB4Wu4vMgYXKCNq+u1GUlIYNAg9
	N+GF3ggypBLaMKwHKBlWg128h7zHdyHdeSGH2R6Em2leReugrAMForEF6pCMABUoUGIlBaYEXjx1z
	GM6sWHyoQ4x9yYGm3tsdH81BltHnbGILirzl4/v2aF35dJstTPEXoem7ZPeS/rf4O6xorktzH/NFg
	uygo8Nc1fag2ECpkWRThGOJXqCN2vF6b0Zrv4gF4UCKofy9kibByboXyObtJOjvNXQYvhnZFV3rgn
	NKXYdeBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pj1yR-00CyyA-1C;
	Sun, 02 Apr 2023 17:58:39 +0000
Received: from mx01.omp.ru ([90.154.21.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pj1yN-00CyvT-0B;
	Sun, 02 Apr 2023 17:58:37 +0000
Received: from [192.168.1.103] (31.173.81.234) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Sun, 2 Apr 2023
 20:58:18 +0300
Subject: Re: [PATCH RFC 02/13] mmc: meson-gx: fix deferred probing
To: Christian Hewitt <christianshewitt@gmail.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>, MMC <linux-mmc@vger.kernel.org>,
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, AML
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
References: <20211223171202.8224-1-s.shtylyov@omp.ru>
 <20211223171202.8224-3-s.shtylyov@omp.ru>
 <2E930ABF-DA2A-4BB0-A2A2-56495305118D@gmail.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <cc2f4e45-497b-7c2c-3fdd-1591903813cf@omp.ru>
Date: Sun, 2 Apr 2023 20:58:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <2E930ABF-DA2A-4BB0-A2A2-56495305118D@gmail.com>
Content-Language: en-US
X-Originating-IP: [31.173.81.234]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.59, Database issued on: 04/02/2023 17:39:47
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 176439 [Apr 02 2023]
X-KSE-AntiSpam-Info: Version: 5.9.59.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 507 507 08d345461d9bcca7095738422a5279ab257bb65a
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.81.234 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.81.234 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info: 	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;marc.info:7.1.1;www.spinics.net:7.1.1;31.173.81.234:7.1.2,7.7.3,7.4.1;omp.ru:7.1.1
X-KSE-AntiSpam-Info: {iprep_blacklist}
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.81.234
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 04/02/2023 17:42:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 4/2/2023 2:00:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_105835_114786_8EA5348E 
X-CRM114-Status: GOOD (  23.51  )
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

SGVsbG8hCgpPbiA0LzEvMjMgOTozOCBBTSwgQ2hyaXN0aWFuIEhld2l0dCB3cm90ZToKWy4uLl0K
Cj4+IFRoZSBkcml2ZXIgb3ZlcnJpZGVzIHRoZSBlcnJvciBjb2RlcyBhbmQgSVJRMCByZXR1cm5l
ZCBieSBwbGF0Zm9ybV9nZXRfaXJxKCkKPj4gdG8gLUVJTlZBTCwgc28gaWYgaXQgcmV0dXJucyAt
RVBST0JFX0RFRkVSLCB0aGUgZHJpdmVyIHdpbGwgZmFpbCB0aGUgcHJvYmUKPj4gcGVybWFuZW50
bHkgaW5zdGVhZCBvZiB0aGUgZGVmZXJyZWQgcHJvYmluZy4gU3dpdGNoIHRvIHByb3BhZ2F0aW5n
IHRoZSBlcnJvcgo+PiBjb2RlcyB1cHN0cmVhbS4gSVJRMCBpcyBubyBsb25nZXIgcmV0dXJuZWQg
YnkgcGxhdGZvcm1fZ2V0X2lycSgpLCBzbyB3ZSBub3cKPj4gY2FuIHNhZmVseSBpZ25vcmUgaXQu
Li4KPj4KPj4gRml4ZXM6IGNiY2FhYzZkN2RkMiAoIm1tYzogbWVzb24tZ3gtbW1jOiBGaXggcGxh
dGZvcm1fZ2V0X2lycSdzIGVycm9yIGNoZWNraW5nCj4+ICIpCj4+IFNpZ25lZC1vZmYtYnk6IFNl
cmdleSBTaHR5bHlvdiA8cy5zaHR5bHlvdkBvbXAucnU+Cj4+IFJldmlld2VkLWJ5OiBNYXJ0aW4g
Qmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgo+PiAtLS0K
Pj4gZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1neC1tbWMuYyB8IDQgKystLQo+PiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1neC1tbWMuYyBiL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24t
Z3gtbW1jLmMKPj4gaW5kZXggOGYzNjUzNmNiMWI2Li5jNzY1NjUzZWU0ZDAgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMKPj4gKysrIGIvZHJpdmVycy9tbWMv
aG9zdC9tZXNvbi1neC1tbWMuYwo+PiBAQCAtMTE4Miw4ICsxMTgyLDggQEAgc3RhdGljIGludCBt
ZXNvbl9tbWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gCX0KPj4KPj4g
CWhvc3QtPmlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7Cj4+IC0JaWYgKGhvc3QtPmly
cSA8PSAwKSB7Cj4+IC0JCXJldCA9IC1FSU5WQUw7Cj4+ICsJaWYgKGhvc3QtPmlycSA8IDApIHsK
Pj4gKwkJcmV0ID0gaG9zdC0+aXJxOwo+PiAJCWdvdG8gZnJlZV9ob3N0Owo+PiAJfQo+IAo+IENh
biBJIGFzayBpZiB0aGlzIHBhdGNoL3NlcmllcyBbMF0gaGFzIGJlZW4gc3VwZXJzZWRlZCBvciBm
b3Jnb3R0ZW4gb3IgPz8KCiAgIEknbSBzb3JyeSwgSSBhY3R1YWxseSBkaWQgZm9yZ2V0IHRvIHJl
LXBvc3QgdGhpcyBzZXJpZXMsIGFzIGFza2VkIGJ5IFVsZi4KUGFydGx5IGJlY2F1c2UgdGhlIHBh
dGNoIHRoYXQgdGhpcyBzZXJpZXMgZGVwZW5kZWQgb24gdG9vayBhYm91dCA0IG1vbnRocyB0bwpo
aXQgdGhlIGtlcm5lbCBhbmQgcGFydGx5IGJlY2F1c2UgSSBzdXNwZW5kZWQgbXkgcGxhdGZvcm1f
Z2V0X2lycSgpIHJlbGF0ZWQKd29yayBhcyBJIGdvdCBpbnRvIFBBVEEgZGV2ZWxvcG1lbnQgYW5k
IHN0cnVnZ2xpbmcgd2l0aCBhIHN0YXRpYyBhbmFseXplcidzCnJlcG9ydHMuLi4KICAgQWxzbywg
dGhlIHNlcmllcyBkb2Vzbid0IHNlZW0gc3VwZXJzZWRlZCBhcyBhbGwgdGhlIHBhdGNoZXMgc3Rp
bGwgYXBwbHksCnNvbWV0aW1lcyB3aXRoIHNtYWxsIG9mZnNldHMuLi4KCj4gVGhlIHNlcmllcyBp
dCBkZXBlbmRlZCB1cG9uIFsxXQoKICAgVGhhdCB3YXMgYSBzaW5nbGUgcGF0Y2guIDotKQoKPiBh
cHBlYXJzIHRvIGhhdmUgYmVlbiBtZXJnZWQgYSB5ZWFyIGFnbyBhcyBJCj4gY2FuIHNlZSBjZTc1
M2FkMTU0OWMgKCJwbGF0Zm9ybTogZmluYWxseSBkaXNhbGxvdyBJUlEwIGluIHBsYXRmb3JtX2dl
dF9pcnEoKQo+IGFuZCBpdHMgaWxr4oCdKSBpbiB1cHN0cmVhbSBjb2RlLgoKICAgTm90IGEgd2hv
bGUgeWVhciB5ZXQgYnV0IDExIG1vbnRocyBzdXJlbHkuLi4gOi0vCgo+IEnigJl2ZSBoYWQgdGhp
cyBwYXRjaCBpbiBteSB0ZXN0aW5nIGtlcm5lbCBmb3IKPiAxMisgbW9udGhzIG5vdyB3aXRoIG5v
IG9ic2VydmFibGUgbmVnYXRpdmUgaW1wYWN0cyBzbyBhbSB3b25kZXJpbmcgaWYgaXQgY2FuCj4g
YmUgcmVzZW50IGFuZCBtZXJnZWQgb3IgSSBzaG91bGQgZHJvcCB0aGUgcGF0Y2ggZnJvbSBteSB0
cmVlPwoKICAgSXQ/IFlvdSBtZWFuIG15IGZpeCBwYXRjaGVzLCBzdXJlbHk/IE9yIHlvdSBtZWFu
IHlvdSBjYXJlIGFib3V0IHBhdGNoICMyCm9ubHk/IEFueXdheSwgSSBuZWVkIHRvIGZpbmQgdGhl
IHRpbWUgdG8gcmVmcmVzaC9yZXBvc3QgaXQuLi4KCj4gVGh4LiBDaHJpc3RpYW4KPiAKPiBbMF0g
aHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvbGludXgtbW1jL21zZzY4MTAyLmh0bWwKPiBb
MV0gaHR0cHM6Ly9tYXJjLmluZm8vP2w9bGludXgta2VybmVsJm09MTYzNjIzMDQxOTAyMjg1CgpN
QlIsIFNlcmdleQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
