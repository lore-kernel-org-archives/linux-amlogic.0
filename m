Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4E1C88E50
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Sep 2026 08:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=19ILu2xyXZbq6DtSBNeocw0kDsKk0QTJyDS9DHnrkKY=; b=l5Pl0OQCHK37R1
	axyTjVzKVJkA8XIzYbUhLk+deBIw5taci1uZb5bafFXyl6aOubaFHQdi1AKOy0mReiLO49y+dCshy
	WYaB0jDR+6zbP7HeZQCko9dsISIrhJ1eIsPQBjpbV1lfynGA/hCw4TMWLLqH2zCV6faFVoGv1Wop1
	TCV9KjsgjpjX7Kb/h3Z+QvrwUAR2rzIBMUNmQCQncMGobdsjY3h6gP4Ey0EQVx1znVAvUHox9xwBJ
	SJB0K2yqwTzuKqqto7y0RotaQGeZiobSYDBxuUcZBQhoNoKKBidP05Zz5M8AD/dAMIGErgUTkA/lV
	G60eNXuQWSKJN4BQJ47w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61x5-00000002iO2-2oia;
	Mon, 14 Sep 2026 08:22:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61x4-00000002iNf-10ww
	for linux-amlogic@lists.infradead.org;
	Mon, 14 Sep 2026 08:22:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A923E601E4;
	Mon, 14 Sep 2026 08:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07391F000FF;
	Mon, 14 Sep 2026 08:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789374129;
	bh=Ya+mF+antM4J5XtVgltbSZyyhQ3bptqwoug1LCd7lmo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bQcnj0XcWZeTCGBHe3S7ThRlAMvb7lUN7L+/Ml0K79AmxuPEva3uDOZDx4KoKEsjL
	 KB2R6E92wE4TEq7d8ZZEkPOOd7zIp4/91NSanJ7uljZxVzqKlxHejCtilbNZFxnB1u
	 lHULhghYsV10s7GviT1+DmAwTPj97wmZdTdfWRM0afO8naQSlrT5IFBIHEo2nUGSAM
	 7MD5BgovOwVMUv3i36Rbc0UYC3O90Iyfar+ZHfQkP/mQ3PTccVAvzlT0rVczKJpsY9
	 G7rDCCr8KyvChcND3hmSvP17R4P1pZYHSS0cwjjvo5KKENTHrtrS/TbELilkSF79+7
	 qfYRD93EvmIIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/6] firmware: meson: sm: Add video firmware loading
 SMC call
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: media-ci@linuxtv.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260914-b4-s4-vdec-upstream-v9-2-72fdb0d71b02@amlogic.com>
References: <20260914-b4-s4-vdec-upstream-v9-0-72fdb0d71b02@amlogic.com>
 <20260914-b4-s4-vdec-upstream-v9-2-72fdb0d71b02@amlogic.com>
Date: Mon, 14 Sep 2026 08:22:08 +0000
Message-Id: <20260914082208.F07391F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtDcml0aWNhbF0gTWlzc2luZyBzeW5jaHJvbml6YXRpb24gYXJvdW5kIHNoYXJlZCBtZW1vcnkg
YWNjZXNzZXMgZm9yIFNNQyBjYWxscy4KLS0KCmNvbW1pdCBlM2MwNjJlNjk3NTJkZGE1Yzc4MmNi
YjE5NDRjMGFjYzBkMDg2NmMyCkF1dGhvcjogWmhlbnRhbyBHdW8gPHpoZW50YW8uZ3VvQGFtbG9n
aWMuY29tPgoKZmlybXdhcmU6IG1lc29uOiBzbTogQWRkIHZpZGVvIGZpcm13YXJlIGxvYWRpbmcg
U01DIGNhbGwKCkFkZCBTTV9MT0FEX1ZJREVPX0ZXIGF0IFNNQyBJRCAweGIyMDAwMDBmIGluIHRo
ZSBjb21tYW5kCnRhYmxlIHRvIGxvYWQgdmlkZW8gZmlybXdhcmUuCgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2Zpcm13YXJlL21lc29uL21lc29uX3NtLmMgYi9kcml2ZXJzL2Zpcm13YXJlL21lc29u
L21lc29uX3NtLmMKPiBpbmRleCBhYjk3NTFhNTliNTUyLi44ODdjYWE1YzYyNWRiIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZmlybXdhcmUvbWVzb24vbWVzb25fc20uYwo+ICsrKyBiL2RyaXZlcnMv
ZmlybXdhcmUvbWVzb24vbWVzb25fc20uYwo+IEBAIC00OCw2ICs0OCw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgbWVzb25fc21fY2hpcCBneGJiX2NoaXAgPSB7Cj4gIAkJQ01EKFNNX1RIRVJNQUxf
Q0FMSUJfUkVBRCwJMHg4MjAwMDA0NyksCj4gIAkJQ01EKFNNX0ExX1BXUkNfU0VULAkJMHg4MjAw
MDA5MyksCj4gIAkJQ01EKFNNX0ExX1BXUkNfR0VULAkJMHg4MjAwMDA5NSksCj4gKwkJQ01EKFNN
X0xPQURfVklERU9fRlcsCQkweGIyMDAwMDBmKSwKCltTZXZlcml0eTogQ3JpdGljYWxdClRoaXMg
aXMgYSBwcmUtZXhpc3RpbmcgaXNzdWUsIGJ1dCBpcyB0aGVyZSBtaXNzaW5nIHN5bmNocm9uaXph
dGlvbiBhcm91bmQKc2hhcmVkIG1lbW9yeSBhY2Nlc3NlcyBmb3IgU01DIGNhbGxzIHdoZW4gaGFu
ZGxpbmcgdGhlc2UgY29tbWFuZHM/CgpMb29raW5nIGF0IG1lc29uX3NtX2NhbGxfd3JpdGUoKSBh
bmQgbWVzb25fc21fY2FsbF9yZWFkKCksIGRhdGEgaXMgY29waWVkIHRvCmFuZCBmcm9tIHNoYXJl
ZCwgdW5wcm90ZWN0ZWQgbWVtb3J5IHJlZ2lvbnMgKHNtX3NobWVtX2luX2Jhc2UgYW5kCnNtX3No
bWVtX291dF9iYXNlKSBkdXJpbmcgdGhlIFNNQyBjYWxsczoKCm1lc29uX3NtX2NhbGxfd3JpdGUo
KSB7CgkuLi4KCW1lbWNweShmdy0+c21fc2htZW1faW5fYmFzZSwgYnVmZmVyLCBzaXplKTsKCglp
ZiAobWVzb25fc21fY2FsbChmdywgY21kX2luZGV4LCAmd3JpdHRlbiwgYXJnMCwgYXJnMSwgYXJn
MiwgYXJnMywgYXJnNCkgPCAwKQoJCXJldHVybiAtRUlOVkFMOwoJLi4uCn0KCm1lc29uX3NtX2Nh
bGxfcmVhZCgpIHsKCS4uLgoJaWYgKG1lc29uX3NtX2NhbGwoZncsIGNtZF9pbmRleCwgJnNpemUs
IGFyZzAsIGFyZzEsIGFyZzIsIGFyZzMsIGFyZzQpIDwgMCkKCQlyZXR1cm4gLUVJTlZBTDsKCglp
ZiAoYnVmZmVyKQoJCW1lbWNweShidWZmZXIsIGZ3LT5zbV9zaG1lbV9vdXRfYmFzZSwgc2l6ZSk7
CgkuLi4KfQoKU2luY2UgdGhlcmUgYXJlIG5vIG11dGV4ZXMgaW4gbWVzb25fc20uYyBvciB0aGUg
dXBzdHJlYW0gbnZtZW0gY29yZSdzCnJlYWQvd3JpdGUgaGFuZGxlcnMgKG52bWVtX3JlZ19yZWFk
L252bWVtX3JlZ193cml0ZSksIGNvbmN1cnJlbnQgYWNjZXNzIHRvCnRoZSBTTUMgZnVuY3Rpb25z
IGlzIHVuc3luY2hyb25pemVkLiAKCkZvciBleGFtcGxlLCB0d28gcm9vdCBwcm9jZXNzZXMgY291
bGQgY29uY3VycmVudGx5IHdyaXRlIHRvIG52bWVtLCBvcgpjb25jdXJyZW50bHkgcmVhZCB0aGUg
d29ybGQtcmVhZGFibGUgc3lzZnMgZmlsZXMuCgpPbmUgdGhyZWFkIGNvdWxkIG92ZXJ3cml0ZSBz
bV9zaG1lbV9pbl9iYXNlIHdoaWxlIGFub3RoZXIgdGhyZWFkIGlzCm1pZC1zZXF1ZW5jZSAoYWZ0
ZXIgaXRzIG1lbWNweSBidXQgYmVmb3JlIGl0cyBTTUMgY2FsbCBleGVjdXRlcyksIGxlYWRpbmcg
dG8KdGhlIFNNIHJlY2VpdmluZyBjb3JydXB0ZWQgZGF0YS4gCgpTaW1pbGFybHksIFNNQyBleGVj
dXRpb24gYW5kIHRoZSBzdWJzZXF1ZW50IHJlYWQgZnJvbSBzbV9zaG1lbV9vdXRfYmFzZSBjYW4K
YmUgaW50ZXJsZWF2ZWQgYnkgYW5vdGhlciB0aHJlYWQncyBTTUMgY2FsbCwgY2F1c2luZyBhIHRo
cmVhZCB0byByZWFkIHRoZQpvdGhlciB0aHJlYWQncyByZXR1cm5lZCBkYXRhLgoKQ291bGQgdGhp
cyBjb25jdXJyZW50IGFjY2VzcyBjYXVzZSBkYXRhIGNvcnJ1cHRpb24gZHVyaW5nIG9uZS10aW1l
IGhhcmR3YXJlCm9wZXJhdGlvbnMgbGlrZSBFRlVTRSB3cml0ZXMsIG9yIGNvcnJ1cHQgdGhlcm1h
bCBjYWxpYnJhdGlvbiBkYXRhIHJlYWRzIGFuZApsZWFkIHRvIHN5c3RlbSBpbnN0YWJpbGl0eT8K
Cj4gIAkJeyAvKiBzZW50aW5lbCAqLyB9LAo+ICAJfSwKPiAgfTsKCi0tIApTYXNoaWtvIEFJIHJl
dmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MTQtYjQtczQtdmRl
Yy11cHN0cmVhbS12OS0wLTcyZmRiMGQ3MWIwMkBhbWxvZ2ljLmNvbT9wYXJ0PTIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
