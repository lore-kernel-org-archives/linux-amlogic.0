Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A2DC77B60
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Apr 2023 16:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Brt8b/iqYzZKFQDFZGtJx+8p6MkimrAlbhRQFgeftYY=; b=Fel99qH45F890B
	oEMZV0hiinvhNomo86q6ibrlb3H5a6TC50wjr33Nes8bKGXf48n8iUTUKWTiOqE8aOly1+6fHYRHZ
	9/7XPTxrgaRjSpuPTusSMdH0mzZnlqaRJI7uUBTHPgG4gczbQT7PEq889SASLPm3ricLZEMhcl9MM
	4QCYK13KyXJy2BFwtxLGEWSL7636ETEtiD/lFiYFNMqcmSNgQTl8SRD40VRUL3Qwv29kLBjmUB2Nt
	vnCJMPSG4IDg5log0ZX806/GUPwjzEWTYOIctbSLkJdHvIsXFN3Sj53Xpbbbgs/hHuJPL+VYsoyWD
	Qln0fnroO2/ktSIBVnNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjDc-0029fa-2a;
	Tue, 04 Apr 2023 16:09:12 +0000
Received: from smtp2-g21.free.fr ([2a01:e0c:1:1599::11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjDa-0029eW-1m
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Apr 2023 16:09:11 +0000
Received: from [192.168.108.81] (unknown [213.36.7.13])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 50FA12003B4;
	Tue,  4 Apr 2023 18:09:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1680624548;
	bh=m4kLlVdfx4CPshc3rsvvK75Jls1tGv0nt9joXO6qw+0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WtFGeqKJRt410YiomYnRep3xygMlOdQLzsmxsRiOfYEYEanEvkvQiCrPDtR9mJVV+
	 Bxf5573yX/Tar0WRz87MotbJdGFOpT2ZXQfGIkmiZPlp8LswiRRtD25X81vvE2ZNLM
	 lVEb5vhxlJut/rmBcMufp4OCRdWhGq2phrQDYueyNyOw8N+KhNm+Guh7pOQ+xxDZU/
	 U5U2To6IYgcetbe4q53zxjST+f6bnfnbtYu4k3AGUxURvuERHtV101QzOiSVmsVP/S
	 0cQM8idCEmwLgcS6CdoA3CisrCxmfhoZqBv4zpliW6dWOqt/kyKmtA59Iv0iQ20TK5
	 0EBJT4Iu7FAGQ==
Message-ID: <0bb1e3b3-6823-ddb5-001b-72ee1b63779c@free.fr>
Date: Tue, 4 Apr 2023 18:09:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Performance regression] BCM4359/9 on S905X2
Content-Language: en-US
To: Christian Hewitt <christian@hewittfamily.org.uk>
Cc: Linux Wireless <linux-wireless@vger.kernel.org>,
 MMC <linux-mmc@vger.kernel.org>, AML <linux-amlogic@lists.infradead.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Pierre-Hugues Husson <phh@phh.me>
References: <b9bd16cb-f1fa-34b7-d599-8637cbe5032b@free.fr>
 <1jh6ue74x9.fsf@starbuckisacylon.baylibre.com>
 <EEE9FD80-C106-4A9B-AA8D-5C151E540CFD@hewittfamily.org.uk>
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
In-Reply-To: <EEE9FD80-C106-4A9B-AA8D-5C151E540CFD@hewittfamily.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_090910_749317_57920320 
X-CRM114-Status: GOOD (  10.04  )
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

WyBUcmltbWluZyByZWNpcGllbnRzIGxpc3QgXQoKT24gMjEvMDMvMjAyMyAxMzoyNiwgQ2hyaXN0
aWFuIEhld2l0dCB3cm90ZToKCj4gVG8gSmVyw7RtZSdzIHBvaW50OyB1bmxlc3MgeW91J3ZlIHR3
ZWFrZWQgaXQgdXBzdHJlYW0gd2lsbCBiZSBydW5uaW5nCj4gYXQgMTAwTUh6IGFuZCB0aGUgdmVu
ZG9yIGtlcm5lbCB3aWxsIGJlIDIwME1IeiwgYW5kIG1heWJlIHdpdGggb3RoZXIKPiBoaWdoLXNw
ZWVkIG1vZGVzIGFjdGl2YXRlZC4KCkFzIGZhciBhcyBJIGNvdWxkIHRlbGw6CgpGb3IgbWFpbmxp
bmUsIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJhLXNlaTUxMC5kdHMKCgli
dXMtd2lkdGggPSA8ND47CgljYXAtc2QtaGlnaHNwZWVkOwoJc2QtdWhzLXNkcjUwOwoJbWF4LWZy
ZXF1ZW5jeSA9IDwxMDAwMDAwMDA+OwoKRm9yIHZlbmRvciwgY29tbW9uL2FyY2gvYXJtNjQvYm9v
dC9kdHMvYW1sb2dpYy9tZXNvbmcxMmFfc2VpLmR0c2kKCgkJYnVzLXdpZHRoID0gPDQ+OwoJCWNh
cC1zZC1oaWdoc3BlZWQ7CgkJY2FwLW1tYy1oaWdoc3BlZWQ7CgkJbWF4LWZyZXF1ZW5jeSA9IDwx
MDAwMDAwMDA+OwoKdmVuZG9yIERUUyBoYXMgdGhlIGZvbGxvd2luZyBjaGlsZCBub2RlOgoKCQlz
ZGlvIHsKCQkJcGlubmFtZSA9ICJzZGlvIjsKCQkJb2NyX2F2YWlsID0gPDB4MjAwMDgwPjsgLyoq
VkREIHZvbHRhZ2UgMy4zIH4gMy40ICovCgkJCS8qIG1heF9yZXFfc2l6ZSA9IDwweDIwMDAwPjsg
Ki8gLyoqMTI4S0IqLwoJCQltYXhfcmVxX3NpemUgPSA8MHg0MDA+OwoJCQljYXJkX3R5cGUgPSA8
Mz47CgkJCS8qIDM6c2RpbyBkZXZpY2UoaWU6c2Rpby13aWZpKSwKCQkJICogNDpTRCBjb21ibyAo
SU8rbWVtKSBjYXJkCgkJCSAqLwoJCQlkbW9kZSA9ICJwaW8iOwoJCX07CgpNYXliZSB0aGUgdmVu
ZG9yIGtlcm5lbCB1c2VzIHRoZSBhYm92ZSBpbmZvcm1hdGlvbiB0byAiYm9vc3QiCnRoZSBwZXJm
b3JtYW5jZSBvZiB0aGUgU0RJTy1iYXNlZCBXaUZpIGFkYXB0ZXI/Cgo+IE1vc3QgdXBzdHJlYW0g
ZGV2aWNlLXRyZWVzIGFyZSBydW5uaW5nIGEKPiBjb25zZXJ2YXRpdmUvc2FmZSBjb25maWd1cmF0
aW9uIGF0IDUwTUh6IHRvIGF2b2lkIHBhc3Qgc3BlZWQtcmVsYXRlZAo+IGlzc3Vlcy4gQXMgc3Rh
YmlsaXR5IGhhcyBpbXByb3ZlZCBvdmVyIHRpbWUgbW9zdCBib2FyZHMgY291bGQgYmUgcnVuCj4g
YXQgZmFzdGVyIHNwZWVkcywgYnV0ICdwZXJmb3JtYW5jZScgaXMgc3VjaCBzdWJqZWN0aXZlIHRv
cGljIHRoYXQgaXQKPiB3b3VsZCBwcm9iYWJseSBuZWVkIGEgbGFyZ2UgYW1vdW50IG9mIHRlc3Rp
bmcgdG8gY29udmluY2UgcGVvcGxlIHRvCj4gY2hhbmdlIHRoZSBjdXJyZW50IGRlZmF1bHRzLiBU
aGF0IHNhaWQgKEZXSVcpIEkndmUgYnVtcGVkIGFsbCBib2FyZHMKPiBpbiBteSB0cmVlIHRoYXQg
Y29uc3VtZSB0aGUgZ3gtcDJ4eC1xMnh4IGR0c2kgdG8gMTAwTUh6IHdpdGhvdXQgYW55Cj4gYXR0
cmlidXRhYmxlIGlzc3VlcyBiZWluZyBmbGFnZ2VkIGJ5IHVzZXJzLgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
