Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B89C531C9
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Jul 2026 18:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cBfvGETZCShGKJDLUmNxj+4JVmNPCMMkqw28BJHncjo=; b=oWJ9uu+HiRuef4
	cIIAzxs4nL8mveCZ43jpGrBHF0l7xvgfpCaeXUZliJKFfe6HAAw+iDRzIbO29oOJloIDUq81h+4sh
	WWZ6PaS8hKkSO6Mf/G9yt9XU0Y+MUhRIZBIfFnfGzm0zTQ21n7lienzK14osgDhwv8fPKNf+MD6y4
	yq/MTZ0/JGUuP8PC1jl3syKRdl5SfpS5nUIIr+NhYPCrS3Y3sPBPA7wv862hmlqyDoaygRwwuddF+
	A/mf7k2odHDWhrP+/e1i0ercAcdjwnyfRXB8zTd4PCHQb85jrEmSru302pbUcU6oDpcwOHrlBUs5+
	U/JH4MktpTw+DUDrRxbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo3Ws-00000001URX-218D;
	Sun, 26 Jul 2026 18:24:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo3Wq-00000001URA-3nzj
	for linux-amlogic@lists.infradead.org;
	Sun, 26 Jul 2026 18:24:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B7B340B47;
	Sun, 26 Jul 2026 18:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E24501F000E9;
	Sun, 26 Jul 2026 18:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785090287;
	bh=2HJI88wepsFswpz9sYN6tQwWj+T+30jUsY/vwyXj3Lo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FtfpMxFsPmvC6nchrrG/SiczRg0chrpWvMG7y1hJQwPUACYEw055mXAgLff+dsp+A
	 TVqQlfe77qvm6ArClAg0iPlllzDSLf3RYiWxvubPARpzhS4a2F326ScMl5BLNkqNPI
	 diYU2UYYKOvwc8ooWJx96cdwmFGr5DEWapKpE6huZRZSbn0e/XFUWrPMw3wt1SXhgb
	 HicB3uS4BQhpCOgs2go/l3PpBDno9OxDfMtSl5FRz1dTVtVq7MBp39ufGyHNkEX2nf
	 Tkd3asbMXNQFMgxPX+ZCIauE5FqwSqVH+Qzt1k6EdYUDVMLLpPEvc5zq5y3nlu96IF
	 5x4/998PNbVQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: add Orbbec
To: "Alberto Robazza" <robazzalberto@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260726182158.249449-2-robazzalberto@gmail.com>
References: <20260726182158.249449-1-robazzalberto@gmail.com>
 <20260726182158.249449-2-robazzalberto@gmail.com>
Date: Sun, 26 Jul 2026 18:24:46 +0000
Message-Id: <20260726182446.E24501F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gVGhlIG5ldyB2ZW5kb3Ig
cHJlZml4ICdvcmJiZWMnIGlzIGluc2VydGVkIG91dCBvZiBhbHBoYWJldGljYWwgb3JkZXIuCi0t
CgotLS0gUGF0Y2ggWzFdOiBbUEFUQ0ggMS8zXSBkdC1iaW5kaW5nczogdmVuZG9yLXByZWZpeGVz
OiBhZGQgT3JiYmVjIC0tLQpjb21taXQgNTUwMjQxOTBkNWE5MjI1YzQxYjUyYjAzNzI3MjBkNDRj
YzZhNDM3OApBdXRob3I6IEFsYmVydG8gUm9iYXp6YSA8cm9iYXp6YS5hbGJlcnRvQHByb3Rvbi5t
ZT4KCmR0LWJpbmRpbmdzOiB2ZW5kb3ItcHJlZml4ZXM6IGFkZCBPcmJiZWMKClRoaXMgY29tbWl0
IGFkZHMgdGhlICJvcmJiZWMiIHZlbmRvciBwcmVmaXggZm9yIE9yYmJlYyBJbmMuLCB3aGljaCBp
cwpuZWVkZWQgdG8gc3VwcG9ydCBhbiB1cGNvbWluZyBib2FyZCBjb21wYXRpYmxlIHN0cmluZy4K
Ckxpbms6IGh0dHBzOi8vd3d3Lm9yYmJlYy5jb20vCgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKPiBpbmRleCAzOTYw
NDRmMzY4ZTdjLi5mMjA1ZGY2NGEwYTg5IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbAo+IEBAIC0xMjEzLDYg
KzEyMTMsOCBAQCBwYXR0ZXJuUHJvcGVydGllczoKPiAgICAgIGRlc2NyaXB0aW9uOiBPcmllbnQg
Q2hpcCBUZWNobm9sb2d5IENvLiwgTHRkLgo+ICAgICJeb2N0LC4qIjoKPiAgICAgIGRlc2NyaXB0
aW9uOiBPY3Rhdm8gU3lzdGVtcyBMTEMKPiArICAiXm9yYmJlYywuKiI6Cj4gKyAgICBkZXNjcmlw
dGlvbjogT3JiYmVjIEluYy4KCltTZXZlcml0eTogTG93XQpUaGlzIGlzbid0IGEgYnVnLCBidXQg
aXQgYXBwZWFycyB0aGUgbmV3IHZlbmRvciBwcmVmaXggd2FzIGluc2VydGVkIG91dCBvZgphbHBo
YWJldGljYWwgb3JkZXIgYmVmb3JlIG9rYXlhLiBTaG91bGQgb3JiYmVjIGJlIG1vdmVkIGZ1cnRo
ZXIgZG93biB0aGUKbGlzdCB0byBtYWludGFpbiB0aGUgZmlsZSdzIHNvcnRpbmcgY29udmVudGlv
bj8KCj4gICAgIl5va2F5YSwuKiI6Cj4gICAgICBkZXNjcmlwdGlvbjogT2theWEgRWxlY3RyaWMg
QW1lcmljYSwgSW5jLgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5k
ZXYvIy9wYXRjaHNldC8yMDI2MDcyNjE4MjE1OC4yNDk0NDktMS1yb2JhenphbGJlcnRvQGdtYWls
LmNvbT9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
