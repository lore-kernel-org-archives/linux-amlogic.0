Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138E2C0218A
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Feb 2025 19:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UC3QDWgKStLnNxK064CN7vqNRfD9kiyiIG0/OGpvlhI=; b=2bIjtXgmpJoxXo
	XL+hBoOOjeuf9eiKg01n7uYLbPsrxo6sT5GDK36LtCyu13XdrnGxN7K9qFe/g4ymqfj13qwVQIUCo
	MGUKdNCKy07w+NuKs1KiorrXLOodXezHNd71rXeq2pSNgJ8RZm8alRv6OCPbItVMSONhTi9KUKAQw
	X24TqvIuaY6ybgO/VDpVfQHnB60rwVfupG8y0nTa3JSuGibntGVoGXQ99kRC9efCLjC3fve2aWFi3
	qKLvnhOYSTZUIE7tjqKf2L5nV3RBssUspWvJxgmJkKv60BpbEwRGlxIPYDFlOuHDhNbT5oJZaRHXB
	oWql4NtD8AkELozXjlMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teJG9-0000000D3m3-2SnH;
	Sat, 01 Feb 2025 19:34:29 +0000
Received: from out-176.mta0.migadu.com ([2001:41d0:1004:224b::b0])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teJDd-0000000D3XT-1IQj
	for linux-amlogic@lists.infradead.org;
	Sat, 01 Feb 2025 19:31:54 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738438297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cAxBGxxajUiVZRBP6T0mE6Os5RyWlNWFqjL6ZgqSOfM=;
	b=dtbzPnOzKIZdrHJ92mUPenoHQIDCXCvVtBwv0JF+ackg3KR2kKdbNDcTbq2Uh0he8evs3h
	kjnyPV3xJT1urgtfrekagsjgxXvxqa1rvAmTKCHQeVNQsFMk6Wu9KFB0vBAPlxF4sjWTfn
	7S2VxwA6akQfTENzdmCqxIjsKZHuLLPic7DVKDu2KlTfpI4bs8yzrmz8solCTywr4k4iJj
	TXwwiatUD3O3LtQCdNKSdKjLY4v33hdtz+0jKsofIlpwAI8F9Z683YfFFn/Omi69ltBQAC
	yBhUJeFlBs21qP4Y0Oy9hoYx6V7yU6vulBjF1VlrLi/HIL2wEz2voNv4tEjXhw==
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 0/2] Add support for Xiaomi Mi TV Stick
Date: Sat,  1 Feb 2025 19:30:42 +0000
Message-ID: <20250201193044.28856-1-funderscore@postmarketos.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_113153_481484_DABAC314 
X-CRM114-Status: GOOD (  14.46  )
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
Cc: devicetree@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>, Karl Chan <exxxxkc@getgoogleoff.me>, linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, funderscore@postmarketos.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhpcyBwYXRjaCBzZXJpZXMgYWltcyB0byBhZGQgaW5pdGlhbCBzdXBwb3J0IGZvciB0aGUgWGlh
b21pIE1pIFRWClN0aWNrLgoKWGlhb21pIE1pIFRWIFN0aWNrIGlzIGEgc21hbGwgQW1sb2dpYy1i
YXNlZCBBbmRyb2lkIFRWIHN0aWNrIHJlbGVhc2VkIGluIAoyMDIwLCBhbmQga25vd24gYXMgYHhp
YW9taS1hcXVhbWFuYCBpbnRlcm5hbGx5IChpbiB0aGUgZG93bnN0cmVhbSBrZXJuZWwsCnUtYm9v
dCwgLi4uKQpJdHMgc3BlY2lmaWNhdGlvbnMgYXJlIGFzIGZvbGxvd3M6CiAqIEFtbG9naWMgUzgw
NVkgU29DIChiZWxpZXZlZCB0byBiZSBtb3N0bHkgaWRlbnRpY2FsIHRvIFM4MDVYKQogKiA4IEdC
IGVNTUMKICogMSBHQiBvZiBSQU0KICogQW5kcm9pZCBUViA5LCB1cGdyYWRhYmxlIHRvIEFuZHJv
aWQgVFYgMTAKClRoZXJlIGFyZSBtdWx0aXBsZSB2YXJpYW50czoKICogMS4gR3JlZW4gUENCLCBt
YW51ZmFjdHVyZWQgaW4gMjAyMCwga25vd24gVUFSVCBwaW5vdXQgKGhlbHBmdWxseSAKICAgbGFi
ZWxlZCBvbiB0aGUgYm9hcmQpCiAqIDIuIEJsdWUgUENCLCBub3QgbXVjaCBkb2N1bWVudGF0aW9u
IGFib3V0IGl0LCBwcmVzdW1hYmx5IG1hbnVmYWN0dXJlZAogICBiZXR3ZWVuIDIwMjEgYW5kIDIw
MjMKICogMy4gR3JlZW4gUENCLCBtYW51ZmFjdHVyZWQgaW4gMjAyMywga25vd24gVUFSVCBwaW5v
dXQsIHNvbWUgbGF5b3V0CiAgIGNoYW5nZXMgY29tcGFyZWQgdG8gdGhlIDIwMjAgdmFyaWFudAoK
QW1vbmcgdGhlc2UgdmFyaWFudHMsIHRoZXJlIGFyZSBtYW55IGJvYXJkcyB1c2luZyBtdWx0aXBs
ZSBkaWZmZXJlbnQKV2ktRmkgY2hpcHMuICBTdXBwb3J0aW5nIGFsbCBvZiB0aGVtIGlzIG91dCBv
ZiBzY29wZSBmb3IgdGhpcyBwYXRjaApzZXJpZXMuCgpBcyBvZiB0aGUgdGltZSBvZiB3cml0aW5n
IHRoaXMgaGFzIG9ubHkgYmVlbiB0ZXN0ZWQgb24gdGhlIDNyZCB2YXJpYW50LgpJdCBpcyBiZWxp
ZXZlZCB0aGF0IHNvZnR3YXJlLXdpc2UgYWxsIHRocmVlIHdvcmsgbW9zdGx5IHRoZSBzYW1lIChp
ZiB3ZSAKZG9uJ3QgY291bnQgV2ktRmkpLCBidXQgdGVzdGluZyBvbiB0aGUgb3RoZXIgdmFyaWFu
dHMgd291bGQgc3RpbGwgYmUKYXBwcmVjaWF0ZWQuCgpUaGUgZGV2aWNldHJlZSBpcyBiYXNlZCBv
biB0aGUgQW1sb2dpYyBQMjQxIERUUy4KCkNoYW5nZXMgc2luY2UgdjEgWzFdOgogKiByZW1vdmUg
dXNlbGVzcyBub2RlczogY3Zicy1jb25uZWN0b3IsIGV0aG1hYywgaW50ZXJuYWxfcGh5LCBpcgog
KiBhZGQgYGFtbG9naWMsczgwNXlgIERUIGJpbmRpbmcgc2VjdGlvbgogKiBhZGQgUzgwNVkgZHRz
aTogbWVzb24tZ3hsLXM4MDV5LmR0c2kKICogYWRqdXN0IERUIGBtb2RlbGAgdG8gIlhpYW9taSBN
aSBUViBTdGljayAoQXF1YW1hbikiCiAqIGV4cGxhaW4gdGhlIGNoYW5nZXMgYmVpbmcgZG9uZSBh
IGJpdCBtb3JlIGluIHRoZSBjb21taXQgbWVzc2FnZSBmb3IKICAgdGhlIERUIHBhdGNoCiAqIGRy
b3AgYGNsb2Nrc2AgYW5kIGBjbG9jay1uYW1lc2AgZnJvbSBwd21fZWYgKGJhY2tncm91bmQ6IFsy
XSkKICogY2hhbmdlIHNvdW5kIGBtb2RlbGAgdG8gIlhJQU9NSS1BUVVBTUFOIgoKWzFdOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTAxMzEyMDAzMTkuMTk5OTYtMS1mdW5kZXJzY29y
ZUBwb3N0bWFya2V0b3Mub3JnLwpbMl06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFt
bG9naWMvMjAyNDEyMjcyMTI1MTQuMTM3NjY4Mi0xLW1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xl
bWFpbC5jb20vCgpGZXJhc3MgRWzCoEhhZmlkaSAoMik6CiAgZHQtYmluZGluZ3M6IGFybTogYW1s
b2dpYzogYWRkIFM4MDVZIGFuZCBNaSBUViBTdGljawogIGFybTY0OiBkdHM6IGFtbG9naWM6IGFk
ZCBzdXBwb3J0IGZvciB4aWFvbWktYXF1YW1hbi9NaSBUViBTdGljawoKIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwgICAgICB8ICAgNyArCiBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL2FtbG9naWMvTWFrZWZpbGUgICAgICAgICAgfCAgIDEgKwogLi4uL21lc29uLWd4bC1zODA1
eS14aWFvbWktYXF1YW1hbi5kdHMgICAgICAgIHwgMjg4ICsrKysrKysrKysrKysrKysrKwogLi4u
L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3hsLXM4MDV5LmR0c2kgICAgIHwgIDEwICsKIDQgZmls
ZXMgY2hhbmdlZCwgMzA2IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3hsLXM4MDV5LXhpYW9taS1hcXVhbWFuLmR0cwog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neGwt
czgwNXkuZHRzaQoKLS0gCjIuNDcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
