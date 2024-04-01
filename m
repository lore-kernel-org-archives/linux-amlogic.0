Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A759CD1288
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2024 17:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VikoSpFNBihe90l6rJREt1TC2ABDAEtPFU1SzezbWr0=; b=mMKOsXY8wb7G8Y
	Ux9YaUxt+ayE/qEoTlrzT+zMmMDQhnE5xxwjuf4rs3aAdJSwv0TbzfV0+LIXKx2h3XEizX2VSj4xg
	2PJgN+4bjlSWRsLRJIVS/9vKT+MJBPocSfBH7tO2wtTm4bB7Bfa8kDXSDaSa6r6DxxqX9W2l4MHBn
	QIvsWxsySXIiVgZfZjINx3JRiAduR0kn/g4CPtxjjsNA4f5XfxhFInVrtfpxJZujhw4I/NSRrDqkN
	Haa4DiZUH+8ciVt1WjggEg0c1LHRy6Vfzf5OK/mu6bYvh91e5AMdOcZzcuMNC5G81+4OjTngWbysk
	JP8CKEyM7fx2t+yTZYYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrLDK-00000008QhA-3959;
	Mon, 01 Apr 2024 17:12:55 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrLDE-00000008QgE-4Are;
	Mon, 01 Apr 2024 17:12:52 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 0FDA2120003;
	Mon,  1 Apr 2024 20:12:38 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 0FDA2120003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1711991558;
	bh=tnV8DGhNxoxzX801UIgTUfBlu7sQv3A5VcnesxjPL9Y=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=m0lMe8sEnZlEGvDay+PxIIf/+Fp5YlR6YcY6FU18RLaDLcT4t9bpZukzKSIN0I9gX
	 EC1at4j0jfb5muT9AZbmhNFeiep++Efy9T67jgAlASn3gPHWwjK+G7Ds561EiNLXIu
	 kQv1yDB8I68uX4j5Z+zJFH+k2m5omOd2tPn62c5cGARyE1VG874sEZhDfyXAs1JtMq
	 Ebbbq9dOx26d+Tiii208BfDl3C9sTK50W3UJHRTghYKRbPKCH6cl9C4meLSRfnaOgT
	 EipK+d1wAnQpREsd+r683GN9byPNe4PyHN65WMYegm8xeJBzxoZmRnif+crgvF7ic0
	 JueEdsEU77NKg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  1 Apr 2024 20:12:37 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m02.sberdevices.ru
 (172.16.192.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 1 Apr
 2024 20:12:37 +0300
Date: Mon, 1 Apr 2024 20:12:37 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<kernel@salutedevices.com>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 6/6] clk: meson: a1: add Amlogic A1 CPU clock
 controller driver
Message-ID: <20240401171237.qoewp2pgcdrqvc3e@CAB-WSD-L081021>
References: <20240329205904.25002-1-ddrokosov@salutedevices.com>
 <20240329205904.25002-7-ddrokosov@salutedevices.com>
 <CAFBinCCC5KK-4_w41B-+ZJ3zdZckq_EDuAW+Kak2C0Ow8uuD6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCCC5KK-4_w41B-+ZJ3zdZckq_EDuAW+Kak2C0Ow8uuD6Q@mail.gmail.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184515 [Apr 01 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 14 0.3.14 5a0c43d8a1c3c0e5b0916cc02a90d4b950c01f96, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;salutedevices.com:7.1.1;100.64.160.123:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/01 15:13:00 #24563578
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_101250_258770_62B4781E 
X-CRM114-Status: GOOD (  30.07  )
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

SGVsbG8gTWFydGluLAoKVGhhbmsgeW91IGZvciBxdWljayByZXNwb25zZS4gUGxlYXNlIGZpbmQg
bXkgdGhvdWdodHMgYmVsb3cuCgpPbiBTdW4sIE1hciAzMSwgMjAyNCBhdCAxMTo0MDoxM1BNICsw
MjAwLCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdyb3RlOgo+IEhpIERtaXRyeSwKPiAKPiBPbiBGcmks
IE1hciAyOSwgMjAyNCBhdCA5OjU54oCvUE0gRG1pdHJ5IFJva29zb3YKPiA8ZGRyb2tvc292QHNh
bHV0ZWRldmljZXMuY29tPiB3cm90ZToKPiBbLi4uXQo+ID4gK3N0YXRpYyBzdHJ1Y3QgY2xrX3Jl
Z21hcCBjcHVfZmNsayA9IHsKPiA+ICsgICAgICAgLmRhdGEgPSAmKHN0cnVjdCBjbGtfcmVnbWFw
X211eF9kYXRhKSB7Cj4gPiArICAgICAgICAgICAgICAgLm9mZnNldCA9IENQVUNUUkxfQ0xLX0NU
UkwwLAo+ID4gKyAgICAgICAgICAgICAgIC5tYXNrID0gMHgxLAo+ID4gKyAgICAgICAgICAgICAg
IC5zaGlmdCA9IDEwLAo+ID4gKyAgICAgICB9LAo+ID4gKyAgICAgICAuaHcuaW5pdCA9ICYoc3Ry
dWN0IGNsa19pbml0X2RhdGEpIHsKPiA+ICsgICAgICAgICAgICAgICAubmFtZSA9ICJjcHVfZmNs
ayIsCj4gPiArICAgICAgICAgICAgICAgLm9wcyA9ICZjbGtfcmVnbWFwX211eF9vcHMsCj4gPiAr
ICAgICAgICAgICAgICAgLnBhcmVudF9od3MgPSAoY29uc3Qgc3RydWN0IGNsa19odyAqW10pIHsK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICZjcHVfZnNlbDAuaHcsCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAmY3B1X2ZzZWwxLmh3LAo+IEhhdmUgeW91IGNvbnNpZGVyZWQgdGhlIENM
S19TRVRfUkFURV9HQVRFIGZsYWcgZm9yICZjcHVfZnNlbDAuaHcgYW5kCj4gJmNwdV9mc2VsMS5o
dyBhbmQgdGhlbiBkcm9wcGluZyB0aGUgY2xvY2sgbm90aWZpZXIgYmVsb3c/Cj4gV2UgdXNlIHRo
YXQgYXBwcm9hY2ggd2l0aCB0aGUgTWFsaSBHUFUgY2xvY2sgb24gb3RoZXIgU29Dcywgc2VlIGZv
cgo+IGV4YW1wbGUgY29tbWl0IDhkYWVhZWE5OWNhYSAoImNsazogbWVzb246IG1lc29uOGI6IG1h
a2UgdGhlIENDRiB1c2UKPiB0aGUgZ2xpdGNoLWZyZWUgbWFsaSBtdXgiKS4KPiBJdCBtYXkgZGlm
ZmVyIGZyb20gd2hhdCBBbWxvZ2ljIGRvZXMgaW4gdGhlaXIgQlNQLAoKQW1sb2dpYyBpbiB0aGVp
ciBCU1AgdGFrZXMgYSBkaWZmZXJlbnQgYXBwcm9hY2gsIHdoaWNoIGlzIHNsaWdodGx5CmRpZmZl
cmVudCBmcm9tIG1pbmUuIFRoZXkgY2xldmVybHkgY2hhbmdlIHRoZSBwYXJlbnQgb2YgY3B1X2Ns
ayBkaXJlY3RseQpieSBmb3JraW5nIHRoZSBjcHVmcmVxIGRyaXZlciB0byBhIGN1c3RvbSB2ZXJz
aW9uLiBJIG11c3QgYWRtaXQsIGl0J3MKcXVpdGUgYW4gImludGVyZXN0aW5nIGFuZCBhbWF6aW5n
IiBpZGVhIDopIGJ1dCBpdCdzIG5vdCBhcmNoaXRlY3R1cmFsbHkKY29ycmVjdCB0b3RhbGx5LgoK
PiBidXQgSSBkb24ndCB0aGluawo+IHRoYXQgdGhlcmUncyBhbnkgaGFybSAoaWYgaXQgd29ya3Mg
aW4gZ2VuZXJhbCkgYmVjYXVzZSBDQ0YgKGNvbW1vbgo+IGNsb2NrIGZyYW1ld29yaykgd2lsbCBz
ZXQgYWxsIGNsb2NrcyBpbiB0aGUgImluYWN0aXZlIiB0cmVlIGFuZCB0aGVuCj4gYXMgYSBsYXN0
IHN0ZXAganVzdCBjaGFuZ2UgdGhlIG11eCAoJmNwdV9mY2xrLmh3KS4gU28gYXQgbm8gcG9pbnQg
aW4KPiB0aW1lIHdpbGwgd2UgZ2V0IGFueSBvdGhlciByYXRlIHRoYW4gYSkgdGhlIG9yaWdpbmFs
IENQVSBjbG9jayByYXRlCj4gYmVmb3JlIHRoZSByYXRlIGNoYW5nZSBiKSB0aGUgbmV3IGRlc2ly
ZWQgQ1BVIGNsb2NrIHJhdGUuIFRoaXMgaXMKPiBiZWNhdXNlIHdlIGhhdmUgdHdvIHN5bW1ldHJp
YyBjbG9jayB0cmVlcy4KCk5vdywgbGV0J3MgZGl2ZSBpbnRvIHRoZSBzcGVjaWZpY3Mgb2YgdGhl
IGlzc3VlIHdlJ3JlIGZhY2luZy4gSSd2ZQpleGFtaW5lZCB0aGUgQ0xLX1NFVF9SQVRFX0dBVEUg
ZmxhZywgd2hpY2gsIHRvIG15IHVuZGVyc3RhbmRpbmcsIGJsb2NrcwpyYXRlIGNoYW5nZXMgZm9y
IHRoZSBlbnRpcmUgY2xvY2sgY2hhaW4uIEhvd2V2ZXIsIGluIHRoaXMgcGFydGljdWxhcgpzaXR1
YXRpb24sIGl0IGRvZXNuJ3QgcHJvdmlkZSB0aGUgc29sdXRpb24gd2UgbmVlZC4KCkhlcmUncyB0
aGUgcHJvYmxlbSB3ZSdyZSBkZWFsaW5nIHdpdGg6CgoxKSBUaGUgQ1BVIGNsb2NrIGNhbiBoYXZl
IHRoZSBmb2xsb3dpbmcgZnJlcXVlbmN5IHBvaW50czoKCiAgYXZhaWxhYmxlIGZyZXF1ZW5jeSBz
dGVwczogIDEyOCBNSHosIDI1NiBNSHosIDUxMiBNSHosIDc2OCBNSHosIDEuMDEgR0h6LCAxLjIw
IEdIegoKV2hlbiB3ZSBydW4gdGhlIGNwdXBvd2VyLCB3ZSBnZXQgdGhlIGZvbGxvd2luZyBpbmZv
cm1hdGlvbjoKIyBjcHVwb3dlciAtYyAwLDEgZnJlcXVlbmN5LWluZm8KYW5hbHl6aW5nIENQVSAw
OgogIGRyaXZlcjogY3B1ZnJlcS1kdAogIENQVXMgd2hpY2ggcnVuIGF0IHRoZSBzYW1lIGhhcmR3
YXJlIGZyZXF1ZW5jeTogMCAxCiAgQ1BVcyB3aGljaCBuZWVkIHRvIGhhdmUgdGhlaXIgZnJlcXVl
bmN5IGNvb3JkaW5hdGVkIGJ5IHNvZnR3YXJlOiAwIDEKICBtYXhpbXVtIHRyYW5zaXRpb24gbGF0
ZW5jeTogNTAuMCB1cwogIGhhcmR3YXJlIGxpbWl0czogMTI4IE1IeiAtIDEuMjAgR0h6CiAgYXZh
aWxhYmxlIGZyZXF1ZW5jeSBzdGVwczogIDEyOCBNSHosIDI1NiBNSHosIDUxMiBNSHosIDc2OCBN
SHosIDEuMDEgR0h6LCAxLjIwIEdIegogIGF2YWlsYWJsZSBjcHVmcmVxIGdvdmVybm9yczogY29u
c2VydmF0aXZlIG9uZGVtYW5kIHVzZXJzcGFjZSBwZXJmb3JtYW5jZSBzY2hlZHV0aWwKICBjdXJy
ZW50IHBvbGljeTogZnJlcXVlbmN5IHNob3VsZCBiZSB3aXRoaW4gMTI4IE1IeiBhbmQgMTI4IE1I
ei4KICAgICAgICAgICAgICAgICAgVGhlIGdvdmVybm9yICJzY2hlZHV0aWwiIG1heSBkZWNpZGUg
d2hpY2ggc3BlZWQgdG8gdXNlCiAgICAgICAgICAgICAgICAgIHdpdGhpbiB0aGlzIHJhbmdlLgog
IGN1cnJlbnQgQ1BVIGZyZXF1ZW5jeTogMTI4IE1IeiAoYXNzZXJ0ZWQgYnkgY2FsbCB0byBoYXJk
d2FyZSkKYW5hbHl6aW5nIENQVSAxOgogIGRyaXZlcjogY3B1ZnJlcS1kdAogIENQVXMgd2hpY2gg
cnVuIGF0IHRoZSBzYW1lIGhhcmR3YXJlIGZyZXF1ZW5jeTogMCAxCiAgQ1BVcyB3aGljaCBuZWVk
IHRvIGhhdmUgdGhlaXIgZnJlcXVlbmN5IGNvb3JkaW5hdGVkIGJ5IHNvZnR3YXJlOiAwIDEKICBt
YXhpbXVtIHRyYW5zaXRpb24gbGF0ZW5jeTogNTAuMCB1cwogIGhhcmR3YXJlIGxpbWl0czogMTI4
IE1IeiAtIDEuMjAgR0h6CiAgYXZhaWxhYmxlIGZyZXF1ZW5jeSBzdGVwczogIDEyOCBNSHosIDI1
NiBNSHosIDUxMiBNSHosIDc2OCBNSHosIDEuMDEgR0h6LCAxLjIwIEdIegogIGF2YWlsYWJsZSBj
cHVmcmVxIGdvdmVybm9yczogY29uc2VydmF0aXZlIG9uZGVtYW5kIHVzZXJzcGFjZSBwZXJmb3Jt
YW5jZSBzY2hlZHV0aWwKICBjdXJyZW50IHBvbGljeTogZnJlcXVlbmN5IHNob3VsZCBiZSB3aXRo
aW4gMTI4IE1IeiBhbmQgMTI4IE1Iei4KICAgICAgICAgICAgICAgICAgVGhlIGdvdmVybm9yICJz
Y2hlZHV0aWwiIG1heSBkZWNpZGUgd2hpY2ggc3BlZWQgdG8gdXNlCiAgICAgICAgICAgICAgICAg
IHdpdGhpbiB0aGlzIHJhbmdlLgogIGN1cnJlbnQgQ1BVIGZyZXF1ZW5jeTogMTI4IE1IeiAoYXNz
ZXJ0ZWQgYnkgY2FsbCB0byBoYXJkd2FyZSkKCjIpIEZvciB0aGUgZnJlcXVlbmN5IHBvaW50cyAx
MjggTUh6LCAyNTYgTUh6LCBhbmQgNTEyIE1IeiwgdGhlIENQVSBmaXhlZApjbG9jayBzaG91bGQg
YmUgdXNlZC4gRm9ydHVuYXRlbHksIHdlIGRvbid0IGVuY291bnRlciBhbnkgZnJlZXplCnByb2Js
ZW1zIHdoZW4gd2UgYXR0ZW1wdCB0byBjaGFuZ2UgaXRzIHJhdGUgYXQgdGhlc2UgZnJlcXVlbmNp
ZXMuCgozKSBIb3dldmVyLCBmb3IgdGhlIGZyZXF1ZW5jeSBwb2ludHMgNzY4IE1IeiwgMS4wMSBH
SHosIGFuZCAxLjIwIEdIeiwKdGhlIHN5c19wbGwgaXMgdXNlZCBhcyB0aGUgY2xvY2sgc291cmNl
IGJlY2F1c2UgaXQncyBhIGZhc3RlciBvcHRpb24uCk5vdywgbGV0J3MgaW1hZ2luZSB0aGF0IHdl
IHdhbnQgdG8gY2hhbmdlIHRoZSBDUFUgY2xvY2sgZnJvbSA3NjggTUh6IHRvCjEuMDEgR0h6LiBV
bmZvcnR1bmF0ZWx5LCBpdCdzIG5vdCBwb3NzaWJsZSBkdWUgdG8gdGhlIGJyb2tlbiBzeXNfcGxs
LAphbmQgYW55IGV4ZWN1dGlvbiBhdHRlbXB0cyB3aWxsIHJlc3VsdCBpbiBhIGhhbmcuCgo0KSBB
cyB5b3UgY2FuIG9ic2VydmUsIGluIHRoaXMgY2FzZSwgd2UgYWN0dWFsbHkgZG9uJ3QgbmVlZCB0
byBsb2NrIHRoZQpyYXRlIGZvciB0aGUgc3lzX3BsbCBjaGFpbi4gV2Ugd2FudCB0byBjaGFuZ2Ug
dGhlIHJhdGUgaW5zdGVhZC4gSGVuY2UsCkknbSBub3QgYXdhcmUgb2YgYW55IG90aGVyIG1ldGhv
ZCB0byBhY2hpZXZlIHRoaXMgZXhjZXB0IGJ5IHN3aXRjaGluZwp0aGUgY3B1X2NsayBwYXJlbnQg
dG8gYSBzdGFibGUgY2xvY2sgdXNpbmcgY2xvY2sgbm90aWZpZXIgYmxvY2suCkludGVyZXN0aW5n
bHksIEkndmUgbm90aWNlZCBhIHNpbWlsYXIgYXBwcm9hY2ggaW4gdGhlIENQVSBjbG9jayBkcml2
ZXJzCm9mIFJvY2tjaGlwLCBRdWFsY29tbSwgYW5kIE1lZGlhdGVrLgoKLS0gClRoYW5rIHlvdSwK
RG1pdHJ5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
