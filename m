Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41849C77B6E
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Apr 2023 07:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eS0WD5QO+r89PM3ZtY6wd3Q9CleqLTqXPEf5ekSUx4o=; b=dz/e0z9vwspyRE
	EyUAkN+21atWc3SZFaM5q24dGoP0gZjJ5mTgOYQBAGmoCB6sVUlwhiiRoFTqZz5PhZp5euN8GOQ55
	+yeunBOUEk4uQk1xXh67vgPOJDkH2/DefGZK59sikbp4sbii50SA6IeN/0aqdBO9qpmHDiSp2f5CJ
	3Muvh3qBeXumfsV0SHkhmAa2MadBHT5sOdaUnh8qwVwIu2h835hLT/2/UDdRkFVn/kbmGwtK/nC+/
	o8EED39ZHcgMXDfvf9vJl2XvU8hwupXTrcgj4Oyso6qoBjKnPuWR7VhOmwjxgHN0Y3a5WdCohx90Z
	3722ZINIJC60IWDHKlQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmVAn-0028bR-1V;
	Wed, 12 Apr 2023 07:45:45 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmVAk-0028aU-1i;
	Wed, 12 Apr 2023 07:45:43 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1ED3A100014;
	Wed, 12 Apr 2023 07:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681285540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FFYr9F865jNKlij7bhqU6NcO52rv9OFiF5JjtJfQn8M=;
	b=P7q6H8wpRwdAM4/cqiQP+t3EFYZp9l3cPj7yJQLf+pkXNirWvSdgFTLSKgyIMIHgbQeL3I
	0CAXJh6o1Pf7fqUPVhrMIytVo5cPRzdA1BsUF+e++P85Nok14z0NBBbHxuH/fhsUAHPnFE
	WpOCqjXyW9NhVb1u4PDx12Ksg6xB+p0FjebBJSmmtYcMgqixX8pdRWNWP38w9To795NTZr
	xIiAojQzpYQotrV5b2uSSZzPlUlrTHD1pvUJN9gkTItUpayJ0yx4W/aMX3SSGX6fLRGkSS
	TiyDJDr3EMq9keOL2tmMJXR9jInTZ5yJMhERnz56cbF1HXtwGd1Qa6F365BV/A==
Date: Wed, 12 Apr 2023 09:45:33 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
 <linux-amlogic@lists.infradead.org>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jianxin Pan
 <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
 <oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 0/5] refactoring and fix for Meson NAND
Message-ID: <20230412094533.10d4a2a9@xps-13>
In-Reply-To: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_004542_703069_EEADF45F 
X-CRM114-Status: GOOD (  12.52  )
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

SGkgQXJzZW5peSwKCkFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBXZWQsIDEyIEFw
ciAyMDIzIDA5OjE2OjU0ICswMzAwOgoKPiBIZWxsbywKPiAKPiB0aGlzIHBhdGNoc2V0IGFkZHMg
b25lIGZpeCBhbmQgc2V2ZXJhbCByZWZhY3RvcmluZyBwYXRjaGVzLiBGaXJzdCBwYXRjaAo+IGlz
IHRoZSBtb3N0IGltcG9ydGFudCAtIGl0IGZpeGVzIHVuc3RhYmxlIGJlaGF2aW91ciBvZiBNZXNv
biBkcml2ZXIsIGZvcgo+IGV4YW1wbGUgcmFuZG9tIEVDQyBlcnJvcnMgZHVyaW5nIHJlYWRzLiBJ
J3ZlIHRlc3RlZCB0aGlzIHdpdGggbW91bnQvCj4gdW5tb3VudC9yZWFkL3dyaXRlIGNhc2VzIGZv
ciBKRkZTMiBhbmQgbmFuZGR1bXAvbmFuZHdyaXRlIHV0bGl0aWVzIG9uCj4gQVhHIGZhbWlseSAo
QTExM1ggU29DKS4gU291cmNlIG9mIHRoaXMgdXBkYXRlIGlzIG9sZCB2ZW5kb3IncyBkcml2ZXIu
Cj4gCj4gT3RoZXIgcGF0Y2hlcyBhcmUgcmVmYWN0b3JpbmcgYW5kIGV4dHJhIGNoZWNrcywgbm90
IGNyaXRpY2FsIGZvciB0aGlzCj4gZHJpdmVyJ3MgcmVsaWFiaWxpdHkuCgpUaGFua3MgZm9yIHRo
ZSBzZXJpZXMsIG1pbm9yIGNvbW1lbnRzIGluc2lkZSwgaWYgeW91IHJlc3BpbiBiZWZvcmUgdGhl
CmVuZCBvZiB0aGUgd2VlayBJJ2xsIHRha2UgdGhpcyBmb3IgdGhlIG5leHQgbWVyZ2Ugd2luZG93
LgoKPiAKPiBBcnNlbml5IEtyYXNub3YgKDUpOgo+ICAgbXRkOiByYXduYW5kOiBtZXNvbjogZml4
IE5BTkQgYWNjZXNzIGZvciByZWFkL3dyaXRlCj4gICBtdGQ6IHJhd25hbmQ6IG1lc29uOiByZXBs
YWNlIEdFTk1BU0soKSBtYWNybyB3aXRoIGRlZmluZQo+ICAgbXRkOiByYXduYW5kOiBtZXNvbjog
Y2hlY2sgYnVmZmVyIGxlbmd0aAo+ICAgbXRkOiByYXduYW5kOiBtZXNvbjogY2xlYXIgT09CIGJ1
ZmZlciBiZWZvcmUgcmVhZAo+ICAgbXRkOiByYXduYW5kOiBtZXNvbjogcmVtb3ZlIHVubmVlZGVk
IGJpdHdpc2UgT1Igd2l0aCB6ZXJvZXMKPiAKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25f
bmFuZC5jIHwgMTQ3ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMTI3IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+IAoKClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
