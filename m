Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0B5CA9ED5
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Oct 2026 07:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4UtOwuLGYzDJEKUPK/q/B2xRVAlcNnsZ4MgI2af7wE=; b=meta2qDfflf4GV
	1MAxXKSfa44COXeDC5JGZv5v5EMbQ61CeBAUVOMDmLWq3rXVAOpcSUgD4oCKpPGO4CQ3pq7sUR6Nk
	P6py24FkgX3kbzmQfIH6rdnqDfis8alCjtOj0AP43pS64dtG9TeVMNPfRQ+Qodmha8lzl8zjmfhOf
	wO7v5ZWN0bkDSjlM0Ima+Ub7s5CXiaAv/Nt8x2vAH8+BXkaZIUWjiHfsxarbV21LVpYZriQbs6RUE
	fXLfk3Kutl6MkrOa8j78a6ANov5sY3dC1gpDu0wOiJ3g3YyE+2m15abd3mA2LHRsFY723wIgWJzpu
	bYgvo+xX8JVMUXe/zPTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGAE1-00000009p3v-1X9z;
	Mon, 12 Oct 2026 07:13:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGADz-00000009p3l-3bxN
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Oct 2026 07:13:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F226860AB5;
	Mon, 12 Oct 2026 07:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42DAE1F0089B;
	Mon, 12 Oct 2026 07:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791789210;
	bh=Wk1YgX+JwCRBoXgwopV5P61jFYBRUySBF7WBFxlgVew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZM13eROdScVRAzK9s0LSvEzS8nRPGqWXeWc8V9GqGDPhz7ABL02viU1joahrwLBkq
	 Jrdg3Hoi13q3GiYGmorTpiGgXB7fj07MGqTArICuYc6DxvmLFua0j/jhrFVTeqg/jO
	 V8ZBF769k3rq160QKg3ZVqtgfxmvCWfRMVmIi0M8dzv9OkmwKS23b3yjsq9SRA8CY9
	 IzkdFafUDCmNOUSFWnhRd61eYhafkkiI4rlhf2uwGwebEMH4j6iLQS1gexkjyP8yI9
	 HcDwt3lqB4sXmZ/rBlinm755/Y3KdBnmVhvSZqn3ugj654CQDFb2gLHko+okoUzGqe
	 5+2EOjlg0FAwQ==
Message-ID: <sashiko-outbox-167782@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 3/6] media: dt-bindings: Add Amlogic V4L2 video
 decoder
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261012-b4-s4-vdec-upstream-v11-3-25939f85ada5@amlogic.com>
References: <20261012-b4-s4-vdec-upstream-v11-0-25939f85ada5@amlogic.com>
 <20261012-b4-s4-vdec-upstream-v11-3-25939f85ada5@amlogic.com>
Date: Mon, 12 Oct 2026 07:13:29 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gZHQtYmluZGluZ3M6IG1l
ZGlhOiBhbWxvZ2ljLHM0LXZkZWM6IGluY29tcGxldGUgdmFsaWRhdGlvbiBmb3IgaW50ZXJydXB0
cyBhcnJheSBhbmQgbmFtZXMKLS0KCmNvbW1pdCAwYzgxMDllNjVhYjE2NGRmODJiMGM4MDBjYTYy
MWJiZTk4ZWQxNWY3CkF1dGhvcjogWmhlbnRhbyBHdW8gPHpoZW50YW8uZ3VvQGFtbG9naWMuY29t
PgoKbWVkaWE6IGR0LWJpbmRpbmdzOiBBZGQgQW1sb2dpYyBWNEwyIHZpZGVvIGRlY29kZXIKClRo
aXMgcGF0Y2ggYWRkcyB0aGUgZGV2aWNlIHRyZWUgYmluZGluZyBzY2hlbWEgZm9yIHRoZSBBbWxv
Z2ljIGhhcmR3YXJlCmRlY29kZXIgYWNjZWxlcmF0b3IuIFRoZSBkZXZpY2Ugc3VwcG9ydHMgc3Rh
dGVsZXNzIEguMjY0IGRlY29kaW5nIG9uCkFtbG9naWMgU29Dcy4KCj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9hbWxvZ2ljLHM0LXZkZWMueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9hbWxvZ2ljLHM0LXZk
ZWMueWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwMC4uNzVi
OWJhM2NiMDhkMgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWVkaWEvYW1sb2dpYyxzNC12ZGVjLnlhbWwKPiBAQCAtMCwwICsxLDExNCBA
QApbIC4uLiBdCj4gKyAgaW50ZXJydXB0czoKPiArICAgIG1heEl0ZW1zOiAyCj4gKwo+ICsgIGlu
dGVycnVwdC1uYW1lczoKPiArICAgIGl0ZW1zOgo+ICsgICAgICAtIGNvbnN0OiBodmRlYwo+ICsg
ICAgICAtIGNvbnN0OiB2ZGVjCgpbU2V2ZXJpdHk6IExvd10KRG9lcyB0aGUgc2NoZW1hIG5lZWQg
bWluSXRlbXM6IDIgaGVyZSBmb3IgdGhlIGludGVycnVwdHMgYXJyYXk/IFdpdGhvdXQgaXQsCmFu
IGluY29tcGxldGUgbm9kZSB3aXRoIG9ubHkgMSBpbnRlcnJ1cHQgd2lsbCBwYXNzIHNjaGVtYSBj
aGVja3Mgd2hpbGUgc3RpbGwKZmFpbGluZyBhdCB0aGUgZHJpdmVyIGxldmVsIHdoZW4gaW5kZXgg
MSBpcyByZXF1ZXN0ZWQuCgpbIC4uLiBdCj4gK3JlcXVpcmVkOgo+ICsgIC0gY29tcGF0aWJsZQo+
ICsgIC0gcmVnCj4gKyAgLSByZWctbmFtZXMKPiArICAtIGludGVycnVwdHMKPiArICAtIGNsb2Nr
cwo+ICsgIC0gY2xvY2stbmFtZXMKPiArICAtIHBvd2VyLWRvbWFpbnMKPiArICAtIHBvd2VyLWRv
bWFpbi1uYW1lcwo+ICsgIC0gcmVzZXRzCj4gKyAgLSBhbWxvZ2ljLGNhbnZhcwo+ICsgIC0gYW1s
b2dpYyxzZWN1cmUtbW9uaXRvcgoKW1NldmVyaXR5OiBMb3ddCklzIGludGVycnVwdC1uYW1lcyBt
aXNzaW5nIGZyb20gdGhpcyByZXF1aXJlZCBsaXN0PwoKTGVhdmluZyBpdCBvdXQgcGVybWl0cyBp
bmNvbXBsZXRlIGNvbmZpZ3VyYXRpb25zIHRvIHNpbGVudGx5IHBhc3Mgc2NoZW1hCnZhbGlkYXRp
b24gKGR0X2JpbmRpbmdfY2hlY2spLiBJZiB0aGUgZHJpdmVyIGZldGNoZXMgdGhlIGludGVycnVw
dCBwdXJlbHkKYnkgaW5kZXggKGUuZy4gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCBJUlFfVkRFQykg
d2hlcmUgSVJRX1ZERUMgaXMgZW51bSAxKSwKb21pdHRpbmcgaW50ZXJydXB0LW5hbWVzIGZyb20g
dGhlIHJlcXVpcmVtZW50cyBhbGxvd3MgZGV2aWNlIHRyZWUgYXV0aG9ycwp0byBlYXNpbHkgbWlz
cyB0aGUgY29ycmVjdCBvcmRlcmluZyBvciBwcm92aWRlIG9ubHkgb25lIGludGVycnVwdCwgbGVh
ZGluZwpkaXJlY3RseSB0byBkcml2ZXIgcHJvYmUgZmFpbHVyZXMgb3IgaW5jb3JyZWN0IGludGVy
cnVwdCByb3V0aW5nIGF0IHJ1bnRpbWUuCgpbIC4uLiBdCj4gKyAgICAgIHJlZy1uYW1lcyA9ICJk
b3MiLAo+ICsgICAgICAgICAgICAgICAgICAiZG1jIjsKPiArICAgICAgaW50ZXJydXB0cyA9IDxH
SUNfU1BJIDkxIElSUV9UWVBFX0VER0VfUklTSU5HPiwKPiArICAgICAgICAgICAgICAgICAgIDxH
SUNfU1BJIDkyIElSUV9UWVBFX0VER0VfUklTSU5HPjsKPiArICAgICAgY2xvY2tzID0gPCZjbGtj
X3BlcmlwaHMgQ0xLSURfRE9TPiwKCltTZXZlcml0eTogTG93XQpTaG91bGQgaW50ZXJydXB0LW5h
bWVzIGJlIGluY2x1ZGVkIGluIHRoaXMgZXhhbXBsZT8KClRoZSBleGFtcGxlIGN1cnJlbnRseSBv
bWl0cyBpbnRlcnJ1cHQtbmFtZXMgY29tcGxldGVseSwgZGVtb25zdHJhdGluZyBob3cgYQpmdW5j
dGlvbmFsbHkgaW5jb21wbGV0ZSBub2RlIGlzIHBlcm1pdHRlZCBieSB0aGUgc2NoZW1hLgoKLS0g
ClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2
MTAxMi1iNC1zNC12ZGVjLXVwc3RyZWFtLXYxMS0wLTI1OTM5Zjg1YWRhNUBhbWxvZ2ljLmNvbT9w
YXJ0PTMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
