Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582F9C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Mar 2022 08:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kCYajPtsEt3Cb0pcuARSRLDiTyVS9z4inVtmOgqVrVM=; b=lTwZNc9eHWP27c
	8gIClxCh0DQZU8KOJJoLx8UNlvIiSq+5C/A1pOZKgDj6wmL0GtDstsDNtM89dtAwNL/fGylI2cpma
	pSjH6kyVB/WAtDCmNLBcrCrURNBTDGwnWPAyXdLhFsehYKgPZFpowqzHkjd45t6ZuINUgMYvVPcO0
	qe8xZXvJYLiqHCGI1GynxRvhRnWrnAkTokrjMFLR++COlUjWxt9W/DHDof1dSN1h8Y6EgswoT83aF
	yHEqEJjtLvrgtUf2KdEdF3GtppiAv8XzTgHf7BUZRUGnD9eaRQoLFzXTesD7jiGFNgCTL90kJ2O4H
	N3E7zlgmdw9GokZenMjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOyAk-00Ffxw-Un; Tue, 01 Mar 2022 08:47:54 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOyAY-00Ffvx-Mu; Tue, 01 Mar 2022 08:47:44 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 1 Mar
 2022 16:47:39 +0800
Message-ID: <7c4c3272-4ebb-f84b-5436-f1ddc80686ff@amlogic.com>
Date: Tue, 1 Mar 2022 16:47:39 +0800
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
 <154c3e60-f111-6760-aa08-b9851d66b034@amlogic.com>
 <5f7d9d73-d74c-1eb6-1711-ac3de67e6203@baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <5f7d9d73-d74c-1eb6-1711-ac3de67e6203@baylibre.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_004742_772627_B51BAD83 
X-CRM114-Status: GOOD (  18.03  )
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

SGkgTmVpbCwKCk9uIDIwMjIvMy8xIDE2OjM3LCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPiBbIEVY
VEVSTkFMIEVNQUlMIF0KPiAKPiBIaSwKPiAKPiBPbiAwMS8wMy8yMDIyIDA4OjU3LCBZdSBUdSB3
cm90ZToKPj4gSGkgTmVpbCwKPj4KPj4gT24gMjAyMi8zLzEgMTU6MjUsIE5laWwgQXJtc3Ryb25n
IHdyb3RlOgo+Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Pgo+Pj4gSGksCj4+Pgo+Pj4gTGUgMjUv
MDIvMjAyMiDDoCAwODozOSwgWXUgVHUgYSDDqWNyaXTCoDoKPj4+PiBVc2luZyB0aGUgY29tbW9u
IENsb2NrIGNvZGUgdG8gZGVzY3JpYmUgdGhlIFVBUlQgYmF1ZCByYXRlCj4+Pj4gY2xvY2sgbWFr
ZXMgaXQgZWFzaWVyIGZvciB0aGUgVUFSVCBkcml2ZXIgdG8gYmUgY29tcGF0aWJsZQo+Pj4+IHdp
dGggdGhlIGJhdWQgcmF0ZSByZXF1aXJlbWVudHMgb2YgdGhlIFVBUlQgSVAgb24gZGlmZmVyZW50
Cj4+Pj4gbWVzb24gY2hpcHMuIEFkZCBNZXNvbiBTNCBTb0MgY29tcGF0aWJsZS4KPj4+Pgo+Pj4+
IFRoZSB0ZXN0IG1ldGhvZDoKPj4+PiBTdGFydCB0aGUgY29uc29sZSBhbmQgcnVuIHRoZSBmb2xs
b3dpbmcgY29tbWFuZHMgaW4gdHVybjoKPj4+PiBzdHR5IC1GIC9kZXYvdHR5QU1MMCAxMTUyMDAg
YW5kIHN0dHkgLUYgL2Rldi90dHlBTUwwIDkyMTYwMC4KPj4+Pgo+Pj4+IFNpbmNlIG1vc3QgU29D
cyBhcmUgdG9vIG9sZCwgSSB3YXMgYWJsZSB0byBmaW5kIGFsbCB0aGUgcGxhdGZvcm1zIAo+Pj4+
IG15c2VsZgo+Pj4+IHN1Y2ggYXMgTWVzb242LCBNZXNvbjgsIE1lc29uOGIsIEdYTCBhbmQgc28g
b24uIEkgb25seSB0ZXN0ZWQgaXQgd2l0aAo+Pj4+IEcxMkEgYW5kIFM0Lgo+Pj4+Cj4+Pj4gWXUg
VHUgKDYpOgo+Pj4+IMKgwqAgdHR5OiBzZXJpYWw6IG1lc29uOiBNb3ZlIHJlcXVlc3QgdGhlIHJl
Z2lzdGVyIHJlZ2lvbiB0byBwcm9iZQo+Pj4+IMKgwqAgdHR5OiBzZXJpYWw6IG1lc29uOiBVc2Ug
ZGV2bV9pb3JlbWFwX3Jlc291cmNlIHRvIGdldCByZWdpc3RlciBtYXBwZWQKPj4+PiDCoMKgwqDC
oCBtZW1vcnkKPj4+PiDCoMKgIHR0eTogc2VyaWFsOiBtZXNvbjogRGVzY3JpYmVzIHRoZSBjYWxj
dWxhdGlvbiBvZiB0aGUgVUFSVCBiYXVkIHJhdGUKPj4+PiDCoMKgwqDCoCBjbG9jayB1c2luZyBh
IGNsb2NrIGZyYW1lCj4+Pj4gwqDCoCB0dHk6IHNlcmlhbDogbWVzb246IE1ha2Ugc29tZSBiaXQg
b2YgdGhlIFJFRzUgcmVnaXN0ZXIgd3JpdGFibGUKPj4+PiDCoMKgIHR0eTogc2VyaWFsOiBtZXNv
bjogVGhlIHN5c3RlbSBzdHVjayB3aGVuIHlvdSBydW4gdGhlIHN0dHkgCj4+Pj4gY29tbWFuZCBv
bgo+Pj4+IMKgwqDCoMKgIHRoZSBjb25zb2xlIHRvIGNoYW5nZSB0aGUgYmF1ZCByYXRlCj4+Pj4g
wqDCoCB0dHk6IHNlcmlhbDogbWVzb246IEFkZGVkIFM0IFNPQyBjb21wYXRpYmlsaXR5Cj4+Pj4K
Pj4+PiBWNiAtPiBWNzogVG8gc29sdmUgdGhlIHN5c3RlbSBzdHVjayB3aGVuIHlvdSBydW4gdGhl
IHN0dHkgY29tbWFuZCBvbgo+Pj4+IHRoZSBjb25zb2xlIHRvIGNoYW5nZSB0aGUgYmF1ZCByYXRl
Lgo+Pj4+IFY1IC0+IFY2OiBDaGFuZ2UgZXJyb3IgZm9ybWF0IGFzIGRpc2N1c3NlZCBpbiB0aGUg
ZW1haWwuCj4+Pj4gVjQgLT4gVjU6IENoYW5nZSBlcnJvciBmb3JtYXQuCj4+Pj4gVjMgLT4gVjQ6
IENoYW5nZSBDQ0YgdG8gZGVzY3JpYmUgdGhlIFVBUlQgYmF1ZCByYXRlIGNsb2NrIGFzIGRpc2N1
c3NlZAo+Pj4+IGluIHRoZSBlbWFpbC4KPj4+PiBWMiAtPiBWMzogYWRkIGNvbXBhdGlibGUgPSAi
YW1sb2dpYyxtZXNvbi1neC11YXJ0Ii4gQmVjYXVzZSBpdCBtdXN0IAo+Pj4+IGNoYW5nZQo+Pj4+
IHRoZSBEVFMgYmVmb3JlIGl0IGNhbiBiZSBkZWxldGVkCj4+Pj4gVjEgLT4gVjI6IFVzZSBDQ0Yg
dG8gZGVzY3JpYmUgdGhlIFVBUlQgYmF1ZCByYXRlIGNsb2NrLk1ha2Ugc29tZSAKPj4+PiBjaGFu
Z2VzIGFzCj4+Pj4gZGlzY3Vzc2VkIGluIHRoZSBlbWFpbAo+Pj4+Cj4+Pj4gTGluazpodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1hbWxvZ2ljLzIwMjIwMTE4MDMwOTExLjEyODE1LTQteXUu
dHVAYW1sb2dpYy5jb20vIAo+Pj4+Cj4+Pj4KPj4+PiDCoCBkcml2ZXJzL3R0eS9zZXJpYWwvbWVz
b25fdWFydC5jIHwgMjIxIAo+Pj4+ICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCj4+
Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDE1NCBpbnNlcnRpb25zKCspLCA2NyBkZWxldGlvbnMoLSkK
Pj4+Pgo+Pj4+Cj4+Pj4gYmFzZS1jb21taXQ6IGE2MDNjYTYwY2ViZmY4NTg5ODgyNDI3YTY3Zjg3
MGVkOTQ2YjNmYzgKPj4+Cj4+PiBDb3VsZCB5b3Ugc2VuZCB0aGUgZW1haWxzIFRvIEtldmluLCBK
ZXJvbWUsIE1hcnRpbiAmIG1lLCBhbmQgcHV0IHRoZSAKPj4+IHZhcmlvdXMgbGlzdHMgaW4gQ0Mg
aW5zdGVhZCA/IG90aGVyd2lzZSB3ZSBhcmUgbm90IG5vdGlmaWVkIHdoZW4gdGhlIAo+Pj4gcGF0
Y2ggaXMgYWNjZXB0ZWQgYnkgdGhlIHR0eSBtYWludGFpbmVyLgo+PiBUaGUgZmFjdCBpcyB0aGF0
IHNlbmRpbmcgaXMgYWRkaW5nIHlvdSB1cCwgeW91IHNlZQo+PiBMaW5rOiAKPj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtYW1sb2dpYy8yMDIyMDIyNTA3MzkyMi4zOTQ3LTEteXUudHVA
YW1sb2dpYy5jb20vIAo+Pgo+IAo+IEl0J3Mgbm90IHRoZSBwb2ludCwgdGhlIG9yZGVyIG9mIHJl
Y2lwaWVudCBpbiBDYyBhbmQgVG8gaXMgaW1wb3J0YW50IAo+IHNpbmNlIHRoZXkgYXJlIHVzZWQK
PiBieSBtYWludGFpbmVycyB0byB0cmFjayBwYXRjaCBmb3IgcmV2aWV3IGFuZCB0byBub3RpZnkg
d2hlbiBwYXRjaGVzIGFyZSAKPiB0YWtlbiBpbiB0aGVpciB0cmVlLgo+IAo+IFNvIHBsZWFzZSBt
YWtlIHN1cmUgdGhlIHJlY2lwaWVudHMgYXJlIGNvcnJlY3RseSBzZXQgYmVmb3JlIHNlbmRpbmcg
dGhlIAo+IHBhdGNoZXMuCj4gCkkgc2VlIHdoYXQgeW91IG1lYW4uIE1haWxpbmcgbGlzdHMgc2hv
dWxkIGFsbCB1c2UgVG8uCj4gTmVpbAo+IAo+Pj4KPj4+IFRoYW5rcywKPj4+IE5laWwKPj4+Cj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
