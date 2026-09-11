Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0905C88E4D
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2026 16:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wIw5BjLt13kErkafAYkNQA0rP8+Ttrmahhiv2tUT1V8=; b=XNivCd1BaIcXOS
	l7eCiBwQ5zagxhlTKRCESsbmjyz1Y4N4SmaBrUcD/7hJFJmYn12X/kSNTiIyNgoKH0afM5VH9wXJo
	M6qVALra7U5qYZSn1uZHL3s1IW2i3ozOvFs5R+RUdnakueqbLtkrGfydCegAAybnCqhkviFy2CtDQ
	B1qPde6RCHIuUnpAx82Tj5gku9RrTiRjyYOrsx6HExPuWr0sPwBHpCD9aNUHbN9n5t87RSAkjuVfj
	qVrwHxIAFdgxk4FlHkiMxitDbfMVysvo5xVvcDbh06Gcd8RLfS4Ve4P8UkwLaSnuoADC0w79NYSdC
	+HUHu06hsh/S6MRziaCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54D2-0000000HER3-3g7V;
	Fri, 11 Sep 2026 16:34:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54D1-0000000HEQs-2UlR
	for linux-amlogic@lists.infradead.org;
	Fri, 11 Sep 2026 16:34:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EDB3C4145D;
	Fri, 11 Sep 2026 16:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A6F61F000FF;
	Fri, 11 Sep 2026 16:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789144478;
	bh=Rgv9cCAPKQi+o94ruQ3UgbZvP+R/yNu1xWy+HX0bHxQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bTwcaguJZ7WJSpNTzxKeBbDXgy0lVX4+lHfgdjT7ZV+knI/iQxahMoJl7NX+V5JLK
	 KUJvOU9NxLk+j2eCEKflal2CiCqsF+B5xhfQGQDFki62wrSAGZ1XWc02/v5BnPljRd
	 SwVGOx6IjkXd0PMF56YJHmglpvyHOtXac/JmaFfvqHhhFnNSmEGHzun7Wins+jFRUI
	 VsKMCGfHoL3gphdMXP+o/I/9vee3INyMLgLFjvULT+gbltaM/iCpmCJyVhzkAnp2Z9
	 RkJWbw4EYuDRDZkG8Viuqkn+Fs+vZBarkXsXaMg/n9fK+0iXhqczHXBjEGtjepjGjb
	 +B1+6i652zVOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] PCI: dwc: Align register macros with Synopsys
 documentation
To: "Hans Zhang" <18255117159@163.com>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, linux-pci@vger.kernel.org
In-Reply-To: <20260911162537.469018-2-18255117159@163.com>
References: <20260911162537.469018-1-18255117159@163.com>
 <20260911162537.469018-2-18255117159@163.com>
Date: Fri, 11 Sep 2026 16:34:38 +0000
Message-Id: <20260911163438.9A6F61F000FF@smtp.kernel.org>
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

PiBUaGUgRFdDIFBDSWUgcmVnaXN0ZXIgYW5kIGZpZWxkIG1hY3JvcyBhcmUgaW5jb25zaXN0ZW50
bHkgbmFtZWQgYW5kCj4gb2Z0ZW4gZG8gbm90IG1hdGNoIHRoZSBTeW5vcHN5cyBEZXNpZ25XYXJl
IFBDSWUgQ29udHJvbGxlciBSZWZlcmVuY2UKPiBNYW51YWwuICBUaGlzIG1ha2VzIGl0IGhhcmRl
ciB0byBjcm9zcy1yZWZlcmVuY2UgdGhlIGNvZGUgd2l0aCB0aGUKPiBkb2N1bWVudGF0aW9uIHdo
ZW4gZGVidWdnaW5nIG9yIG1haW50YWluaW5nIHRoZSBkcml2ZXIuCj4gCj4gQXMgc3VnZ2VzdGVk
IGR1cmluZyByZXZpZXcsIGRvIG5vdCBhZGQgYW4gIl9PRkYiIHN1ZmZpeCB0byB0aGUgUG9ydCBM
aW5rCj4gQ29udHJvbCByZWdpc3RlcjogdGhlIHN1ZmZpeCBpcyBhbWJpZ3VvdXMgKG9mZnNldCB2
cy4gb2ZmKSBhbmQKPiB1bm5lY2Vzc2FyeS4gIFVzZSBQT1JUX0xJTktfQ1RSTCwgYW5kIGluY2x1
ZGUgdGhlIHJlZ2lzdGVyIG5hbWUgaW4gaXRzCj4gZmllbGQgbWFjcm9zLCBlLmcuIFBPUlRfTElO
S19DVFJMX0RMRSwgUE9SVF9MSU5LX0NUUkxfRkxNLCBhbmQKPiBQT1JUX0xJTktfQ1RSTF9MQ18q
Lgo+IAo+IEFsaWduIG90aGVyIERXQyBQQ0llIGNvbnRyb2xsZXItaW50ZXJuYWwgcmVnaXN0ZXIg
bWFjcm9zIGluIHRoZSBzYW1lCj4gc3Bpcml0IGJ5IGRyb3BwaW5nIHRoZSByZWR1bmRhbnQgUENJ
RV8gcHJlZml4IGFuZCB1c2luZyB0aGUgZG9jdW1lbnRlZAo+IGJhc2UgbmFtZXMsIHN1Y2ggYXMg
UE9SVF9GT1JDRV9MSU5LLCBQT1JUX0FGQUMsIFBPUlRfTEFORV9TS0VXLAo+IFRJTUVSX0NUUkxf
TUFYX0ZVTkNfTlVNLCBQT1JUX0xJTktfREVCVUcwLzEsIExJTktfV0lEVEhfU1BFRURfQ1RSTCwK
PiBHRU4zX0NUUkwsIEdFTjNfRVFfQ1RSTCwgTVVMVElfTEFORV9DVFJMLCBNSVNDX0NPTlRST0xf
MSwKPiBNU0lYX0RPT1JCRUxMLCBhbmQgdGhlIEFUVV8qIHJlZ2lzdGVycy4gIEZpZWxkIG1hY3Jv
cyBhcmUgcmVuYW1lZAo+IGNvbnNpc3RlbnRseSBzbyB0aGVpciByZWdpc3RlciBhc3NvY2lhdGlv
biBpcyBjbGVhci4KPiAKPiBUaGlzIGltcHJvdmVzIGNvZGUgbWFpbnRhaW5hYmlsaXR5IGFuZCBl
YXNlcyBmdXR1cmUgcmVmZXJlbmNlIHRvIHRoZQo+IGNvbnRyb2xsZXIgbWFudWFsLgo+IAo+IE5v
IGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+IAo+IENvLWRldmVsb3BlZC1ieTogRmVpemhv
dSBZdSA8eXVmZWl6aG91MjAxQDE2My5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRmVpemhvdSBZdSA8
eXVmZWl6aG91MjAxQDE2My5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSGFucyBaaGFuZyA8MTgyNTUx
MTcxNTlAMTYzLmNvbT4KClNhc2hpa28gaGFzIHJldmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5k
IG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0
cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTExMTYyNTM3LjQ2OTAxOC0xLTE4MjU1
MTE3MTU5QDE2My5jb20/cGFydD0xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
