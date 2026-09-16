Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F8AC982CC
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2026 15:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MI0LJvpVXolWACHbs+lJyf+XvvR6HTl7ZLEmIyL8PrM=; b=zG7CfId9A7AFll
	KoVWpD8vxiIdx7tPFJ0GMJ7yXqWxYuP3XcIXhe1qfXoxgjI40TV9yBcUsEs8RA0y90ZgD31cN5TxM
	6YddL3E6pYyp5vI81UZTkrqmv8Y1JLyzgh5IEA823ZPdQZ4Q5muqEliwTjwOPyAsVztHnUPWWcj6A
	+g0ijTAhRNChoAeAPMip8qXtDoXWPbuqy3jAOO8HYRfKi8owvIwSrDK4dg0Ojgkiny7lcnoxjSJK5
	3gaB/vJTsjxt7ldWYFhjppQyZNjAdYpULO0QDoTpCX3p6IdClp9B6qPFtjTx2pvVNbzkuqVn3+OWr
	ucE0SXnJPNcHNQLV5Cbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rvF-00000009dwp-3Gok;
	Wed, 16 Sep 2026 15:51:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rvE-00000009dwb-2WZe
	for linux-amlogic@lists.infradead.org;
	Wed, 16 Sep 2026 15:51:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B938F6020C;
	Wed, 16 Sep 2026 15:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E31B1F000FF;
	Wed, 16 Sep 2026 15:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789573903;
	bh=b4FyhyhfUaP4sm+2kO3ESyfPhYqENbC0gRUrFsvBwDw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cyc8dCCjdSa7wYQIO9oGvuHuzVkvuIFljExONEsG5S7HHwgMh/Gjafi0EjiGDe627
	 63eAvnd/D0j67wKhf9Y+PbTSRa9qetnGH6W1bFR+XiH5+tZYiC/BVuJGODT/9Ek3Ke
	 8F37pQO5bLVIzEom9ps9rbcmJDoQGQrINpNxmMG+WBR0J1RdkjSObPVgVKVjTdZIxc
	 MU/vT3PTeHZxbBEu/H27wUAklNu8GnlL1QOp309SQLL8JPrCnaeQP9UGqprumaRYs8
	 dlFizNV39CVljBRNmeDEc3j7Vmh+PAHsZOK+QCLqtWKq4yeX8GKdZyaC4TSmcYoMNb
	 d+SuU2nQcjqEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/3] PCI: Configure Root Port MPS during host probing
To: "Hans Zhang" <18255117159@163.com>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, linux-pci@vger.kernel.org
In-Reply-To: <20260916153907.60344-3-18255117159@163.com>
References: <20260916153907.60344-1-18255117159@163.com>
 <20260916153907.60344-3-18255117159@163.com>
Date: Wed, 16 Sep 2026 15:51:42 +0000
Message-Id: <20260916155143.2E31B1F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHBjaTogZGFuZ2Vyb3Vz
IGR5bmFtaWMgTVBTIHJlZHVjdGlvbiB1bmRlciBQQ0lFX0JVU19ERUZBVUxUCi0tCgpjb21taXQg
MzI5NDUxNDNiMzJiOGI0MmYxZGQzZTFmNDE5NDE0YTViZjhmOWFjZgpBdXRob3I6IEhhbnMgWmhh
bmcgPDE4MjU1MTE3MTU5QDE2My5jb20+CgpQQ0k6IENvbmZpZ3VyZSBSb290IFBvcnQgTVBTIGR1
cmluZyBob3N0IHByb2JpbmcKClRoaXMgY29tbWl0IHVwZGF0ZXMgdGhlIFBDSWUgaW5pdGlhbGl6
YXRpb24gbG9naWMgdG8gc2V0IGEgUm9vdCBQb3J0J3MgTWF4aW11bQpQYXlsb2FkIFNpemUgKE1Q
UykgdG8gaXRzIG1heGltdW0gc3VwcG9ydGVkIHZhbHVlIGR1cmluZyBob3N0IGNvbnRyb2xsZXIK
cHJvYmluZy4gSXQgZG9lcyB0aGlzIGFzIGxvbmcgYXMgdGhlIE1QUyBzdHJhdGVneSBpcyBub3Qg
UENJRV9CVVNfVFVORV9PRkYgb3IKUENJRV9CVVNfUEVFUjJQRUVSLCBtZWFuaW5nIGl0IGFwcGxp
ZXMgdW5kZXIgdGhlIGRlZmF1bHQgUENJRV9CVVNfREVGQVVMVApzdHJhdGVneS4KCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcGNpL3Byb2JlLmMgYi9kcml2ZXJzL3BjaS9wcm9iZS5jCj4gaW5kZXgg
MjMyYmNlMjgxOWYwNi4uMDhhZjc1YWE3MzY2YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BjaS9w
cm9iZS5jCj4gKysrIGIvZHJpdmVycy9wY2kvcHJvYmUuYwo+IEBAIC0yMjQ4LDYgKzIyNDgsMjEg
QEAgc3RhdGljIHZvaWQgcGNpX2NvbmZpZ3VyZV9tcHMoc3RydWN0IHBjaV9kZXYgKmRldikKPiAg
CQlyZXR1cm47Cj4gIAl9Cj4gIAo+ICsJLyoKPiArCSAqIFVubGVzcyBNUFMgc3RyYXRlZ3kgaXMg
UENJRV9CVVNfVFVORV9PRkYgKGRvbid0IHRvdWNoIE1QUyBhdCBhbGwpIG9yCj4gKwkgKiBQQ0lF
X0JVU19QRUVSMlBFRVIgKHVzZSBtaW5pbXVtIE1QUyBmb3IgcGVlci10by1wZWVyKSwgc2V0IFJv
b3QgUG9ydHMnCj4gKwkgKiBNUFMgdG8gdGhlaXIgbWF4aW11bSBzdXBwb3J0ZWQgdmFsdWUuIERl
cGVuZGluZyBvbiB0aGUgTVBTIHN0cmF0ZWd5Cj4gKwkgKiBhbmQgTVBTUyBvZiBkb3duc3RyZWFt
IGRldmljZXMsIGEgUm9vdCBQb3J0J3MgTVBTIG1heSBiZSByZWR1Y2VkCj4gKwkgKiBsYXRlciBk
dXJpbmcgZGV2aWNlIGVudW1lcmF0aW9uLgo+ICsJICovCj4gKwlpZiAocGNpX3BjaWVfdHlwZShk
ZXYpID09IFBDSV9FWFBfVFlQRV9ST09UX1BPUlQgJiYKPiArCSAgICBwY2llX2J1c19jb25maWcg
IT0gUENJRV9CVVNfVFVORV9PRkYgJiYKPiArCSAgICBwY2llX2J1c19jb25maWcgIT0gUENJRV9C
VVNfUEVFUjJQRUVSKSB7Cj4gKwkJcmMgPSBwY2llX3NldF9tcHMoZGV2LCAxMjggPDwgZGV2LT5w
Y2llX21wc3MpOwoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIHRoaXMgY29kZSBpbnRyb2R1Y2UgYSBy
ZWdyZXNzaW9uIHdoZXJlIGFjdGl2ZSBkb3duc3RyZWFtIHRvcG9sb2dpZXMgYXJlCmV4cG9zZWQg
dG8gZGFuZ2Vyb3VzIGR5bmFtaWMgTVBTIHJlZHVjdGlvbnMgdW5kZXIgdGhlIGRlZmF1bHQgUENJ
RV9CVVNfREVGQVVMVApzdHJhdGVneT8KCkJ5IGZvcmNpbmcgdGhlIFJvb3QgUG9ydCBNUFMgdG8g
aXRzIG1heGltdW0gc3VwcG9ydGVkIHZhbHVlIGhlcmUsIGl0IG92ZXJyaWRlcwpzYWZlIGZpcm13
YXJlIHNldHRpbmdzLiBJZiBhIGRldmljZSB3aXRoIGEgc21hbGxlciBNUFNTIGlzIHN1YnNlcXVl
bnRseQplbnVtZXJhdGVkIG9yIGhvdHBsdWdnZWQsIHBjaV9jb25maWd1cmVfbXBzKCkgd2lsbCBk
ZXRlY3QgdGhhdCB0aGUgZG93bnN0cmVhbQpNUFNTIGlzIHNtYWxsZXIgdGhhbiB0aGUgUm9vdCBQ
b3J0J3MgTVBTLCB0cmlnZ2VyaW5nIHBjaWVfcmVkdWNlX21wcygpIG9uIHRoZQplbnRpcmUgaGll
cmFyY2h5LgoKQmVjYXVzZSBwY2llX3JlZHVjZV9tcHMoKSBtb2RpZmllcyB0aGUgUm9vdCBQb3J0
IGZpcnN0IGFuZCBzZXF1ZW50aWFsbHkgd2Fsa3MKZG93bnN0cmVhbSB3aXRob3V0IHF1aWVzY2lu
ZyBhY3RpdmUgZGV2aWNlcywgdGhpcyBjcmVhdGVzIGEgZGFuZ2Vyb3VzIHdpbmRvdy4KCklmIGFu
IGV4aXN0aW5nIGRvd25zdHJlYW0gZGV2aWNlIChzdWNoIGFzIGFuIGFjdGl2ZSBOSUMgb3IgZWFy
bHkKZmlybXdhcmUtZHJpdmVuIGRpc3BsYXkgY29udHJvbGxlcikgaXMgYWN0aXZlbHkgcGVyZm9y
bWluZyBETUEsIGNvdWxkIGl0CnRyYW5zbWl0IGEgcGF5bG9hZCBleGNlZWRpbmcgdGhlIG5ld2x5
IHJlZHVjZWQgTVBTIG9mIHRoZSBSb290IFBvcnQsCnBvdGVudGlhbGx5IGxlYWRpbmcgdG8gTWFs
Zm9ybWVkIFRMUCBGYXRhbCBFcnJvcnMgYW5kIGEgc3lzdGVtIGNyYXNoPwoKPiArCQlpZiAocmMp
Cj4gKwkJCWRldl93YXJuKCZkZXYtPmRldiwgImZhaWxlZCB0byBzZXQgcm9vdCBwb3J0IE1QU1xu
Iik7Cj4gKwl9Cj4gKwo+ICAJaWYgKCFicmlkZ2UgfHwgIXBjaV9pc19wY2llKGJyaWRnZSkpCj4g
IAkJcmV0dXJuOwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYv
Iy9wYXRjaHNldC8yMDI2MDkxNjE1MzkwNy42MDM0NC0xLTE4MjU1MTE3MTU5QDE2My5jb20/cGFy
dD0yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
