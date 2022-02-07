Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC0FC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Feb 2022 14:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CgVdeLYRq5p9FLr+2Tvod1n7LSbIgSD9W7fYWjMS0PU=; b=BjkO7sucw3u56i
	dXKpiaw4PwBSbTXKe95hUXTsrlihNvJYrBawCyNJTlaLGD8h3Pwjtj5zmIcloVhj7UIO6zITf2QiL
	f2vj3NYOr2q/KR3o5yg2glC6LQvO/KMVPpXpgZmrXRXP6ttOHdwuIHeKdJ3qN+G7AQVZJqcY+O23/
	mdqjuGXoXvlRzx5XrcEpiZfZZwjSIFc7/tY1ESuzKddFq/7ZvH6I9UJPGW+qwwPTKGHLGxf8g6iuC
	rJDFzx4NdV3NIGaPMnTjfKw6nSs01BPhXYfMvc1tXlRHqjsaS0ZIKFGCCJngA3Xcujo/VVq/8y9lz
	CFw8oCk744Xt9LgGFkTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH4s0-00AREa-Qh; Mon, 07 Feb 2022 14:19:56 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH4rp-00ARDp-3V; Mon, 07 Feb 2022 14:19:46 +0000
Received: from [192.168.0.105] (101.228.68.195) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 7 Feb
 2022 22:19:33 +0800
Message-ID: <ad0493ac-af20-f207-9333-561042d7fc49@amlogic.com>
Date: Mon, 7 Feb 2022 22:19:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V6 0/5] Use CCF to describe the UART baud rate clock
Content-Language: en-US
To: Kevin Hilman <khilman@baylibre.com>, <linux-serial@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
References: <20220118030911.12815-1-yu.tu@amlogic.com>
 <7hfspjqrn7.fsf@baylibre.com>
 <cc3b971f-c630-4ce2-e6dd-c13bcba89d22@amlogic.com>
 <7hbl00ykhf.fsf@baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <7hbl00ykhf.fsf@baylibre.com>
X-Originating-IP: [101.228.68.195]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_061945_191435_1F778A82 
X-CRM114-Status: GOOD (  20.95  )
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

ICBIaSBLZXZpbiwKCUZpcnN0IG9mIGFsbCx0aGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIHJl
cGx5LkR1ZSB0byB0aGUgQ2hpbmVzZSAKU3ByaW5nIEZlc3RpdmFsIGhvbGlkYXkgcmVjZW50bHks
IHNvIGkganVzdCByZXBseSB0byB5b3Ugbm9344CCCgpPbiAyMDIyLzEvMjUgMzo1OCwgS2V2aW4g
SGlsbWFuIHdyb3RlOgo+IFsgRVhURVJOQUwgRU1BSUwgXQo+IAo+IFl1IFR1IDx5dS50dUBhbWxv
Z2ljLmNvbT4gd3JpdGVzOgo+IAo+PiBIaSBLZXZpbiwKPj4gCVRoYW5rIHlvdSB2ZXJ5IG11Y2gg
Zm9yIHlvdXIgcmVwbHkuCj4+Cj4+IE9uIDIwMjIvMS8yMCA2OjM3LCBLZXZpbiBIaWxtYW4gd3Jv
dGU6Cj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+Cj4+PiBIZWxsbywKPj4+Cj4+PiBZdSBUdSA8
eXUudHVAYW1sb2dpYy5jb20+IHdyaXRlczoKPj4+Cj4+Pj4gVXNpbmcgdGhlIGNvbW1vbiBDbG9j
ayBjb2RlIHRvIGRlc2NyaWJlIHRoZSBVQVJUIGJhdWQgcmF0ZQo+Pj4+IGNsb2NrIG1ha2VzIGl0
IGVhc2llciBmb3IgdGhlIFVBUlQgZHJpdmVyIHRvIGJlIGNvbXBhdGlibGUKPj4+PiB3aXRoIHRo
ZSBiYXVkIHJhdGUgcmVxdWlyZW1lbnRzIG9mIHRoZSBVQVJUIElQIG9uIGRpZmZlcmVudAo+Pj4+
IG1lc29uIGNoaXBzLiBBZGQgTWVzb24gUzQgU29DIGNvbXBhdGlibGUuCj4+Pgo+Pj4gQ291bGQg
eW91IGRlc2NyaWJlIGhvdyB0aGlzIHdhcyB0ZXN0ZWQgYW5kIG9uIHdoaWNoIFNvQ3M/ICBUaGVy
ZSBzZWVtIHRvCj4+PiBiZSBzb21lIGNoYW5nZXMgaW4gdGhpcyBzZXJpZXMgdGhhdCBtaWdodCBh
ZmZlY3QgcHJldmlvdXMgU29Dcy4KPj4+Cj4+IEZvciBtZSwgdGhlIGJvYXJkIHN0YXJ0cyBub3Jt
YWxseSBhbmQgcHJpbnRzLiBNeSBpbnRlbnRpb24gd2FzIHRvIGFkZAo+PiB0aGUgUzQgU09DIFVB
UlQgY29tcGF0aWJsZSwgYnV0IGZvciB0aGUgUzQgb3VyIGJhdWQgcmF0ZSBjbG9jayBpcwo+PiBj
YWxjdWxhdGVkIGF0IDEyTUh6IGJ5IGRlZmF1bHQuU28gYSBzZXJpZXMgb2YgY2hhbmdlcyB3ZXJl
IG1hZGUgYXQgeW91cgo+PiBzdWdnZXN0aW9uLgo+Pgo+PiBTaW5jZSBtb3N0IFNvQ3MgYXJlIHRv
byBvbGQsIEkgd2FzIGFibGUgdG8gZmluZCBhbGwgdGhlIHBsYXRmb3JtcyBteXNlbGYKPj4gc3Vj
aCBhcyBNZXNvbjYsIE1lc29uOCwgTWVzb244YiwgR1hMIGFuZCBzbyBvbi4gSSBvbmx5IHRlc3Rl
ZCBpdCB3aXRoCj4+IEcxMkEgYW5kIFM0LkJ1dCB3aGVuIEkgdGFsa2VkIHRvIE1hcnRpbiBlYXJs
aWVyIGhlIHRyaWVkIG1lc29uOGIncyBsb2cuCj4+IFRoZSB0ZXN0IHBhdGNoIGlzIGluIHRoZSBh
dHRhY2htZW50Lgo+Pgo+PiBJIGhhdmUgZm91bmQgdGhhdCBvbiBzb21lIGJvYXJkcyB3aXRoIHRo
aXMgY2hhbmdlLCB0aGUgaW5pdGNhbGxfZGVidWcKPj4gVWFydCBkcml2ZXIgdGFrZXMgbG9uZ2Vy
IHRvIGluaXRpYWxpemUuIFJ1bm5pbmcgdGhlIHN0dHkgY29tbWFuZCB0bwo+PiBjaGFuZ2UgdGhl
IGJhdWQgcmF0ZSBhdCB0aGUgc2FtZSB0aW1lIG1heSBjYXVzZSBhIGphbS4KPiAKPiBUaGlzIGtp
bmQgb2YgZGV0YWlsIGlzIGltcG9ydGFudCB0byBkb2N1bWVudCBpbiB0aGUgY292ZXIgbGV0dGVy
LAo+IGluY2x1ZGluZyBhIGJpdCBtb3JlIGRldGFpbCBvbiBob3cgdG8gcmVwcm9kdWNlIHNvIHRo
YXQgb3RoZXIgY2FuIGhlbHAKPiB0ZXN0IG9yIG1heSBoYXZlIGlkZWFzIGZvciBob3cgdG8gc29s
dmUuCj4gClRoZSBwcm9ibGVtIHJlY3VycmVuY2UgbWV0aG9kIGlzIGRlc2NyaWJlZCBiZWxvdzoK
Rmlyc3QsIGFkZCB0aGUgcGF0Y2ggSSBjaGFuZ2VkLiBJdCB0aGVuIGxhdW5jaGVzIG5vcm1hbGx5
IHRvIHRoZSBjb25zb2xlIApjb21tYW5kIGxpbmUuICBGaW5hbGx5LCBydW4gdGhlIHN0dHkgY29t
bWFuZCB0byBjaGFuZ2UgYnVhZCByYXRlLiBUaGUgCmRldGFpbGVkIGNvbW1hbmRzIGFyZSBhcyBm
b2xsb3dzOgpzdHR5IC1GIC9kZXYvdHR5QU1MMCAxMTUyMDAgYW5kIHN0dHkgLUYgL2Rldi90dHlB
TUwwIDkyMTYwMCAuQWx0ZXJuYXRlIApleGVjdXRpb24gY2FuIHJlcHJvZHVjZS4KCj4+IEknZCBs
b3ZlIHRvIGtub3cgd2hhdCBlbHNlIHlvdSBzdWdnZXN0Lgo+IAo+IEkgZG9uJ3QgZXhwZWN0IHlv
dSB0byBiZSBhYmxlIHRvIHRlc3Qgb24gYWxsIFNvQ3MsIGJ1dCBqdXN0IHRvIGxpc3Qgd2hhdAo+
IFNvQ3MgYW5kIHdoaWNoIGJvYXJkcyB5b3UgdGVzdGVkIG9uLiAgVGhpcyB3YXksIHRob3NlIHdo
byBoYXZlIG90aGVyCj4gYm9hcmRzIGNhbiBoZWxwIHRlc3QgYW5kIHdlIGNhbiBoYXZlIGEgYmV0
dGVyIGlkZWEgb2YgaG93IHRoaXMgd2FzCj4gdGVzdGVkIGJlZm9yZSBtZXJnaW5nLgo+IApJIG9u
bHkgaGF2ZSBTNCBhbmQgRzEyQSBzbyBmYXIsIHNvIEkndmUgb25seSB0ZXN0ZWQgb24gdGhvc2Ug
dHdvIHBsYXRmb3Jtcy4KCj4gVGhhbmtzLAo+IAo+IEtldmluCj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
