Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4D1C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Mar 2022 07:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qkOnmPD30QACovFO4PMUDw8Ak7QS+2QJmy2CN+Noet4=; b=mT5HMy+vDdkQSH
	tNv5uBmeTWug0mW++cOiji4THxIcT5Lk4aHjP74ebZBlJ+284o5Hz4QSy3/KBpjcuJ4guNhnzTft8
	nHt4FreMEGDEatYi9gwDm37L268fUQQdnwdIdVoa1ZwRhyW1w+ECFjQEHPeSBDTrybsQBt+A2WW/v
	MtwBsYr/HWuTor9dXb/D5x/Xtdeg6iSaa0wFQ/MIuo90mH1+NhL5XqSjpFjmAACFE4ISUa4d4iGPl
	tmVLhaMyFgDlxxPnZ3uv+iyifajunS1dM2nUVT+vS2HpzBk+bKMjdM4rfQmucsAU6fEHjKf2xUa2i
	QIsjJTEngrwguyEARzTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOxOh-00FReu-6g; Tue, 01 Mar 2022 07:58:15 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOxOT-00FRaz-47; Tue, 01 Mar 2022 07:58:02 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 1 Mar
 2022 15:57:57 +0800
Message-ID: <154c3e60-f111-6760-aa08-b9851d66b034@amlogic.com>
Date: Tue, 1 Mar 2022 15:57:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V7 0/6] Use CCF to describe the UART baud rate clock
Content-Language: en-US
To: Neil Armstrong <narmstrong@baylibre.com>, <linux-serial@vger.kernel.org>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
References: <20220225073922.3947-1-yu.tu@amlogic.com>
 <849a95fd-ae81-9a3b-0c06-dd7826af9eb2@baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <849a95fd-ae81-9a3b-0c06-dd7826af9eb2@baylibre.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_235801_193578_E50CDDD7 
X-CRM114-Status: GOOD (  14.93  )
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

SGkgTmVpbCwKCk9uIDIwMjIvMy8xIDE1OjI1LCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPiBbIEVY
VEVSTkFMIEVNQUlMIF0KPiAKPiBIaSwKPiAKPiBMZSAyNS8wMi8yMDIyIMOgIDA4OjM5LCBZdSBU
dSBhIMOpY3JpdMKgOgo+PiBVc2luZyB0aGUgY29tbW9uIENsb2NrIGNvZGUgdG8gZGVzY3JpYmUg
dGhlIFVBUlQgYmF1ZCByYXRlCj4+IGNsb2NrIG1ha2VzIGl0IGVhc2llciBmb3IgdGhlIFVBUlQg
ZHJpdmVyIHRvIGJlIGNvbXBhdGlibGUKPj4gd2l0aCB0aGUgYmF1ZCByYXRlIHJlcXVpcmVtZW50
cyBvZiB0aGUgVUFSVCBJUCBvbiBkaWZmZXJlbnQKPj4gbWVzb24gY2hpcHMuIEFkZCBNZXNvbiBT
NCBTb0MgY29tcGF0aWJsZS4KPj4KPj4gVGhlIHRlc3QgbWV0aG9kOgo+PiBTdGFydCB0aGUgY29u
c29sZSBhbmQgcnVuIHRoZSBmb2xsb3dpbmcgY29tbWFuZHMgaW4gdHVybjoKPj4gc3R0eSAtRiAv
ZGV2L3R0eUFNTDAgMTE1MjAwIGFuZCBzdHR5IC1GIC9kZXYvdHR5QU1MMCA5MjE2MDAuCj4+Cj4+
IFNpbmNlIG1vc3QgU29DcyBhcmUgdG9vIG9sZCwgSSB3YXMgYWJsZSB0byBmaW5kIGFsbCB0aGUg
cGxhdGZvcm1zIG15c2VsZgo+PiBzdWNoIGFzIE1lc29uNiwgTWVzb244LCBNZXNvbjhiLCBHWEwg
YW5kIHNvIG9uLiBJIG9ubHkgdGVzdGVkIGl0IHdpdGgKPj4gRzEyQSBhbmQgUzQuCj4+Cj4+IFl1
IFR1ICg2KToKPj4gwqDCoCB0dHk6IHNlcmlhbDogbWVzb246IE1vdmUgcmVxdWVzdCB0aGUgcmVn
aXN0ZXIgcmVnaW9uIHRvIHByb2JlCj4+IMKgwqAgdHR5OiBzZXJpYWw6IG1lc29uOiBVc2UgZGV2
bV9pb3JlbWFwX3Jlc291cmNlIHRvIGdldCByZWdpc3RlciBtYXBwZWQKPj4gwqDCoMKgwqAgbWVt
b3J5Cj4+IMKgwqAgdHR5OiBzZXJpYWw6IG1lc29uOiBEZXNjcmliZXMgdGhlIGNhbGN1bGF0aW9u
IG9mIHRoZSBVQVJUIGJhdWQgcmF0ZQo+PiDCoMKgwqDCoCBjbG9jayB1c2luZyBhIGNsb2NrIGZy
YW1lCj4+IMKgwqAgdHR5OiBzZXJpYWw6IG1lc29uOiBNYWtlIHNvbWUgYml0IG9mIHRoZSBSRUc1
IHJlZ2lzdGVyIHdyaXRhYmxlCj4+IMKgwqAgdHR5OiBzZXJpYWw6IG1lc29uOiBUaGUgc3lzdGVt
IHN0dWNrIHdoZW4geW91IHJ1biB0aGUgc3R0eSBjb21tYW5kIG9uCj4+IMKgwqDCoMKgIHRoZSBj
b25zb2xlIHRvIGNoYW5nZSB0aGUgYmF1ZCByYXRlCj4+IMKgwqAgdHR5OiBzZXJpYWw6IG1lc29u
OiBBZGRlZCBTNCBTT0MgY29tcGF0aWJpbGl0eQo+Pgo+PiBWNiAtPiBWNzogVG8gc29sdmUgdGhl
IHN5c3RlbSBzdHVjayB3aGVuIHlvdSBydW4gdGhlIHN0dHkgY29tbWFuZCBvbgo+PiB0aGUgY29u
c29sZSB0byBjaGFuZ2UgdGhlIGJhdWQgcmF0ZS4KPj4gVjUgLT4gVjY6IENoYW5nZSBlcnJvciBm
b3JtYXQgYXMgZGlzY3Vzc2VkIGluIHRoZSBlbWFpbC4KPj4gVjQgLT4gVjU6IENoYW5nZSBlcnJv
ciBmb3JtYXQuCj4+IFYzIC0+IFY0OiBDaGFuZ2UgQ0NGIHRvIGRlc2NyaWJlIHRoZSBVQVJUIGJh
dWQgcmF0ZSBjbG9jayBhcyBkaXNjdXNzZWQKPj4gaW4gdGhlIGVtYWlsLgo+PiBWMiAtPiBWMzog
YWRkIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1neC11YXJ0Ii4gQmVjYXVzZSBpdCBtdXN0
IAo+PiBjaGFuZ2UKPj4gdGhlIERUUyBiZWZvcmUgaXQgY2FuIGJlIGRlbGV0ZWQKPj4gVjEgLT4g
VjI6IFVzZSBDQ0YgdG8gZGVzY3JpYmUgdGhlIFVBUlQgYmF1ZCByYXRlIGNsb2NrLk1ha2Ugc29t
ZSAKPj4gY2hhbmdlcyBhcwo+PiBkaXNjdXNzZWQgaW4gdGhlIGVtYWlsCj4+Cj4+IExpbms6aHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYW1sb2dpYy8yMDIyMDExODAzMDkxMS4xMjgxNS00
LXl1LnR1QGFtbG9naWMuY29tLyAKPj4KPj4KPj4gwqAgZHJpdmVycy90dHkvc2VyaWFsL21lc29u
X3VhcnQuYyB8IDIyMSArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQo+PiDCoCAxIGZp
bGUgY2hhbmdlZCwgMTU0IGluc2VydGlvbnMoKyksIDY3IGRlbGV0aW9ucygtKQo+Pgo+Pgo+PiBi
YXNlLWNvbW1pdDogYTYwM2NhNjBjZWJmZjg1ODk4ODI0MjdhNjdmODcwZWQ5NDZiM2ZjOAo+IAo+
IENvdWxkIHlvdSBzZW5kIHRoZSBlbWFpbHMgVG8gS2V2aW4sIEplcm9tZSwgTWFydGluICYgbWUs
IGFuZCBwdXQgdGhlIAo+IHZhcmlvdXMgbGlzdHMgaW4gQ0MgaW5zdGVhZCA/IG90aGVyd2lzZSB3
ZSBhcmUgbm90IG5vdGlmaWVkIHdoZW4gdGhlIAo+IHBhdGNoIGlzIGFjY2VwdGVkIGJ5IHRoZSB0
dHkgbWFpbnRhaW5lci4KVGhlIGZhY3QgaXMgdGhhdCBzZW5kaW5nIGlzIGFkZGluZyB5b3UgdXAs
IHlvdSBzZWUKTGluazogCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFtbG9naWMvMjAy
MjAyMjUwNzM5MjIuMzk0Ny0xLXl1LnR1QGFtbG9naWMuY29tLwo+IAo+IFRoYW5rcywKPiBOZWls
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
