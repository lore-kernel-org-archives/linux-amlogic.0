Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814FFCC6B33
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Oct 2026 18:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tLd8fjSvBwAQqu6vkX2dzacxKNf8Ymprv7esQbXHr6s=; b=ZlRR3BH5T4lUVf
	UGrMTZ/P/Ih8jvu/1sL4E3pXZVixNCthy9UhA2RwE9oRrbd+uHbi0tDr4Rn1zauiRYI2v63cQHAgq
	3hXVZckzn2kWIYyjtQeiaviJb5u01klIUYewGRWj+GOSkcJeZjJsHDdRVBMaW8Wr96QfBCgsKthGZ
	Fg1jRFqpX6OQbHB/dGwejF8K7LauzEeUEo0MnzPWAbRBokAjWUSV84blShAqeUp3jRPiYqYyxD/KS
	wYrg7/HAn8uMJzr7FiwEaEZgPfs9v4rudvmAGOqqgIlNvOMmyvUd7od1F/f3hO68z1aWAlS598Lm8
	Ltg/xYgS3B59k97My7Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPz2-000000017Sr-0IBh;
	Thu, 15 Oct 2026 18:15:16 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPyz-000000017RN-0ZPT
	for linux-amlogic@lists.infradead.org;
	Thu, 15 Oct 2026 18:15:15 +0000
Message-ID: <3fe84e1c-8670-4d1b-88ac-37574af4f4f6@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1792088104;
	bh=B3xf2pbuUdxK9OYP4Fw1N/bpiOzq0M4mNmoXGKy7lZI=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=HC+TrUo7l9D0xogwvPslevQxUhA/R02+d5U9GBkjFjoBxoYcrGgZ+BApnRwBNxUtp
	 BDSYtZJ+r2nw4khkwz39hWVkmO+6r2ztA3T1C1HLZ8fudqfiwdDEOgW0KG/AcHG1f9
	 MxIaYUDxvjeT2qsIJTjzUFwL0lzNJkebVOJ1jo+0=
Date: Thu, 15 Oct 2026 20:12:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v6 3/4] arm64: dts: amlogic: t7: Add thermal zones
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
References: <20261015-add-thermal-t7-vim4-v6-0-37d1c954390c@aliel.fr>
 <20261015-add-thermal-t7-vim4-v6-3-37d1c954390c@aliel.fr>
 <sashiko-outbox-173272@kernel.org>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-173272@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_111513_754400_4E3E87D6 
X-CRM114-Status: GOOD (  13.27  )
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

T24gMTAvMTUvMjYgODowMCBQTSwgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToKPiBUaGFu
ayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAxIHBv
dGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoKPiAtIFtNZWRpdW1dIGR0czogdGhlcm1hbCB0
cmlwIHBvaW50cyBsYWJlbGVkIGFzICdob3QnIGFyZSBpbmNvcnJlY3RseSB0eXBlZCBhcyAncGFz
c2l2ZScKPiAtLQo+IAo+IGNvbW1pdCBmMjIxMjllZmVkN2M2NDM5NzE0YzFjMjUwMTgzNGE2YzAx
YmU5ZTllCj4gQXV0aG9yOiBSb25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5m
cj4KPiAKPiBhcm02NDogZHRzOiBhbWxvZ2ljOiB0NzogQWRkIHRoZXJtYWwgem9uZXMKPiAKPiBU
aGlzIGNvbW1pdCBhZGRzIHRoZXJtYWwgem9uZXMgZm9yIGFsbCBzaXggc2Vuc29ycyAoYTUzLCBh
NzMsIGdwdSwgbm5hLAo+IHZwdSwgYW5kIGhldmMpIHRvIHRoZSBhbWxvZ2ljIHQ3IGRldmljZSB0
cmVlIGNvbmZpZ3VyYXRpb24uCj4gCj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRz
L2FtbG9naWMvYW1sb2dpYy10Ny5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2Ft
bG9naWMtdDcuZHRzaQo+PiBpbmRleCBjODE2MzJkMzk4NGU4Li40NTRhMDQyODY1YTVhIDEwMDY0
NAo+PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny5kdHNpCj4+
ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LmR0c2kKPiAKPiBb
IC4uLiBdCj4gCj4+ICsJCWdwdV90aGVybWFsOiBncHUtdGhlcm1hbCB7Cj4+ICsJCQlwb2xsaW5n
LWRlbGF5ID0gPDEwMDA+Owo+PiArCQkJcG9sbGluZy1kZWxheS1wYXNzaXZlID0gPDEwMD47Cj4+
ICsJCQl0aGVybWFsLXNlbnNvcnMgPSA8JmdwdV90c2Vuc29yPjsKPj4gKwo+PiArCQkJdHJpcHMg
ewo+PiArCQkJCWdwdV9wYXNzaXZlOiBncHUtcGFzc2l2ZSB7Cj4+ICsJCQkJCXRlbXBlcmF0dXJl
ID0gPDk1MDAwPjsKPj4gKwkJCQkJaHlzdGVyZXNpcyA9IDw1MDAwPjsKPj4gKwkJCQkJdHlwZSA9
ICJwYXNzaXZlIjsKPj4gKwkJCQl9Owo+PiArCj4+ICsJCQkJZ3B1X2hvdDogZ3B1LWhvdCB7Cj4+
ICsJCQkJCXRlbXBlcmF0dXJlID0gPDEwNTAwMD47Cj4+ICsJCQkJCWh5c3RlcmVzaXMgPSA8NTAw
MD47Cj4+ICsJCQkJCXR5cGUgPSAicGFzc2l2ZSI7Cj4gCj4gW1NldmVyaXR5OiBNZWRpdW1dCj4g
RG9lcyB0aGlzIGluY29ycmVjdGx5IHNldCB0aGUgdHJpcCB0eXBlIGZvciBncHUtaG90IHRvICJw
YXNzaXZlIiBpbnN0ZWFkCj4gb2YgImhvdCI/IFRoZSB0aGVybWFsIHN1YnN5c3RlbSB3aWxsIHRy
ZWF0IHRoaXMgYXMgYSBwYXNzaXZlIHRyaXAgcG9pbnQsCj4gbWVhbmluZyB0aGUgc3RhbmRhcmQg
aG90IHRoZXJtYWwgZXZlbnRzIHdvbid0IHRyaWdnZXIgYXQgdGhlIDEwNcKwQwo+IHRocmVzaG9s
ZC4KPiAKPj4gKwkJCQl9Owo+IAo+IFsgLi4uIF0KPiAKPj4gKwkJaGV2Y190aGVybWFsOiBoZXZj
LXRoZXJtYWwgewo+PiArCQkJcG9sbGluZy1kZWxheSA9IDwxMDAwPjsKPj4gKwkJCXBvbGxpbmct
ZGVsYXktcGFzc2l2ZSA9IDwxMDA+Owo+PiArCQkJdGhlcm1hbC1zZW5zb3JzID0gPCZoZXZjX3Rz
ZW5zb3I+Owo+PiArCj4+ICsJCQl0cmlwcyB7Cj4+ICsJCQkJaGV2Y19wYXNzaXZlOiBoZXZjLXBh
c3NpdmUgewo+PiArCQkJCQl0ZW1wZXJhdHVyZSA9IDw5NTAwMD47Cj4+ICsJCQkJCWh5c3RlcmVz
aXMgPSA8NTAwMD47Cj4+ICsJCQkJCXR5cGUgPSAicGFzc2l2ZSI7Cj4+ICsJCQkJfTsKPj4gKwo+
PiArCQkJCWhldmNfaG90OiBoZXZjLWhvdCB7Cj4+ICsJCQkJCXRlbXBlcmF0dXJlID0gPDEwNTAw
MD47Cj4+ICsJCQkJCWh5c3RlcmVzaXMgPSA8NTAwMD47Cj4+ICsJCQkJCXR5cGUgPSAicGFzc2l2
ZSI7Cj4gCj4gW1NldmVyaXR5OiBNZWRpdW1dCj4gU2ltaWxhcmx5LCBzaG91bGQgdGhlIHR5cGUg
Zm9yIGhldmMtaG90IGJlICJob3QiIHJhdGhlciB0aGFuICJwYXNzaXZlIj8KPiAKPj4gKwkJCQl9
Owo+IAo+IFsgLi4uIF0KPiAKPj4gKwkJbm5hX3RoZXJtYWw6IG5uYS10aGVybWFsIHsKPj4gKwkJ
CXBvbGxpbmctZGVsYXkgPSA8MTAwMD47Cj4+ICsJCQlwb2xsaW5nLWRlbGF5LXBhc3NpdmUgPSA8
MTAwPjsKPj4gKwkJCXRoZXJtYWwtc2Vuc29ycyA9IDwmbm5hX3RzZW5zb3I+Owo+PiArCj4+ICsJ
CQl0cmlwcyB7Cj4+ICsJCQkJbm5hX3Bhc3NpdmU6IG5uYS1wYXNzaXZlIHsKPj4gKwkJCQkJdGVt
cGVyYXR1cmUgPSA8OTUwMDA+Owo+PiArCQkJCQloeXN0ZXJlc2lzID0gPDUwMDA+Owo+PiArCQkJ
CQl0eXBlID0gInBhc3NpdmUiOwo+PiArCQkJCX07Cj4+ICsKPj4gKwkJCQlubmFfaG90OiBubmEt
aG90IHsKPj4gKwkJCQkJdGVtcGVyYXR1cmUgPSA8MTA1MDAwPjsKPj4gKwkJCQkJaHlzdGVyZXNp
cyA9IDw1MDAwPjsKPj4gKwkJCQkJdHlwZSA9ICJwYXNzaXZlIjsKPiAKPiBbU2V2ZXJpdHk6IE1l
ZGl1bV0KPiBEb2VzIHRoaXMgbm5hLWhvdCB0cmlwIHBvaW50IGFsc28gbmVlZCBpdHMgdHlwZSB1
cGRhdGVkIHRvICJob3QiIHNvIHRoYXQKPiBpdCBiZWhhdmVzIGRpc3RpbmN0bHkgZnJvbSB0aGUg
cGFzc2l2ZSB0cmlwIHBvaW50Pwo+IAo+PiArCQkJCX07Cj4gCj4gWyAuLi4gXQo+IAo+PiArCQl2
cHVfdGhlcm1hbDogdnB1LXRoZXJtYWwgewo+PiArCQkJcG9sbGluZy1kZWxheSA9IDwxMDAwPjsK
Pj4gKwkJCXBvbGxpbmctZGVsYXktcGFzc2l2ZSA9IDwxMDA+Owo+PiArCQkJdGhlcm1hbC1zZW5z
b3JzID0gPCZ2cHVfdHNlbnNvcj47Cj4+ICsKPj4gKwkJCXRyaXBzIHsKPj4gKwkJCQl2cHVfcGFz
c2l2ZTogdnB1LXBhc3NpdmUgewo+PiArCQkJCQl0ZW1wZXJhdHVyZSA9IDw5NTAwMD47Cj4+ICsJ
CQkJCWh5c3RlcmVzaXMgPSA8NTAwMD47Cj4+ICsJCQkJCXR5cGUgPSAicGFzc2l2ZSI7Cj4+ICsJ
CQkJfTsKPj4gKwo+PiArCQkJCXZwdV9ob3Q6IHZwdS1ob3Qgewo+PiArCQkJCQl0ZW1wZXJhdHVy
ZSA9IDwxMDUwMDA+Owo+PiArCQkJCQloeXN0ZXJlc2lzID0gPDUwMDA+Owo+PiArCQkJCQl0eXBl
ID0gInBhc3NpdmUiOwo+IAo+IFtTZXZlcml0eTogTWVkaXVtXQo+IElzIHRoaXMgYW5vdGhlciBp
bnN0YW5jZSB3aGVyZSB0aGUgdnB1LWhvdCB0eXBlIHdhcyBpbnRlbmRlZCB0byBiZQo+ICJob3Qi
IHJhdGhlciB0aGFuICJwYXNzaXZlIj8KPiAKPj4gKwkJCQl9Owo+IAoKWW91IHJpZ2h0LCBJIHdp
bGwgY2hhbmdlIHRoZW0gb24gbmV4dCB2ZXJzaW9uLgoKLS0gCkJlc3QgcmVnYXJkcywKUm9uYWxk
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
