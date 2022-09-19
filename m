Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2594ECAAD8
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Sep 2022 01:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WCOCJncNf9IBz7ndW9zYaeG9qNpJIyO2fP7gWPnAYrY=; b=ULSlyEY26j9sFC
	2SZ0ws2Id4Y5ZwTcCpQvVaLyCucGyesFEeCUvglfxtnmJfnwjJI8Je/ri0dyPtAmSQzoZjZOJP2e2
	8l4ne6gVDwoREARTGdJrOaBM7gpZN4eml3Y4IFXPsOPPa/vrldbU3mEkN04W0kRvpU8ufxFSROUas
	jC4xjen/tapqUsnMQSFxxnoB/dysrHXO91m/pR4C5bLNSnDHiIX+yc2E9iIyQqVBpjUONPDif7sMe
	D7s9vfyjMtvPqv29kyELhyjlVW4lLUW6AAR7vgksHSliuQkvpo7U6LofCkqx3jFlSic5fEI2VKGra
	n2yArAeuEikXFVIhAz4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oa5IR-005IAw-BT; Mon, 19 Sep 2022 01:10:03 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oa5IK-005I1r-PP
	for linux-amlogic@lists.infradead.org; Mon, 19 Sep 2022 01:09:59 +0000
Received: from sobremesa.fritz.box (unknown [IPv6:2a02:8010:65b5:0:bbb0:f8ec:7bc9:dbe4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: alarumbe)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 05210660159F;
	Mon, 19 Sep 2022 02:09:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663549788;
	bh=97eKtb5ACsHB0i90sg0ChglscPOhXzYdnuqR0MvnluQ=;
	h=From:To:Cc:Subject:Date:From;
	b=ckPZlLuHsf3GQnS+lfMovbLdecQLYjcV2IYAJlt4nIsoKh/z+h9I8LlR5MoZWKV2L
	 5RuPGllrIQTcY6jEyBmbvTINENxPaDHLDOP+khst1+D7TxqA3H0TIylrxywfN1WIn6
	 s3sfvxiFRgxeaenrKyi9/7A3aJGQbvTJNELH17yMalTaDO1yBbJJfzq9qof9BYzDu1
	 QL6eJi2KAt6idPzuiMa/M8QBpr22yeARtQ/yRoK27nuvVIQmA65PSK1qlQ2cHnoIKG
	 G2Ch7Ob4DO0zGvOYgz3C35v7jqIjDBYdDPo+Qazt6956MDe5R7KVRp5z3DeISyuX+w
	 0VUwnlk9y5Z7w==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: narmstrong@baylibre.com,
	khilman@baylibre.com,
	linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: adrian.larumbe@collabora.com
Subject: [PATCH 0/3] drm/meson: fix use-after-free driver unload issues
Date: Mon, 19 Sep 2022 02:09:37 +0100
Message-Id: <20220919010940.419893-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_180957_720450_2D9EF2EF 
X-CRM114-Status: GOOD (  11.37  )
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

VGhpcyBwYXRjaCBzZXJpZXMgdHJpZXMgdG8gZml4IHNvbWUgdXNlLWFmdGVyLWZyZWUgYnVncyBJ
J3ZlIG9ic2VydmVkIHdpdGgKdGhlIGhlbHAgb2YgS0FTQU4gaW4gQW1sb2dpYydzIEtNUyBEUk0g
ZHJpdmVyLgoKVGhlIGZpcnN0IHBhdGNoIGluIHRoZSBzZXJpZXMgcmVvcmRlcnMgdGhlIGRyaXZl
ciBkZWluaXRpYWxpc2F0aW9uIHNlcXVlbmNlCnNvIHRoYXQgZGV2cmVzIHdvbid0IGRlYWxsb2Nh
dGUgdGhpbmdzIHRoYXQgYXJlIHN0aWxsIGV4cGVjdGVkIHRvIGJlIGFyb3VuZApieSBhIGxhdGVy
IGNhbGwgdG8gZHJtX2Rldl9wdXQuCgpUaGUgc2Vjb25kIHBhdGNoIGFkZHMgYSBtaXNzaW5nIGNh
bGwgdG8gY29tcG9uZW50X21hc3Rlcl9kZWwgaW5zaWRlIGEgbmV3CmRyaXZlcidzIHJlbW92ZSBj
YWxsYmFjay4KClRoZSB0aGlyZCBwYXRjaCBtYWtlcyBzdXJlIHNvbWUgZHJtIGJyaWRnZXMgYWRk
ZWQgZHVyaW5nIGRyaXZlcgppbml0aWFsaXNhdGlvbiBhcmUgcmVtb3ZlZCBhdCBtb2R1bGUgdW5s
b2FkIHRpbWUsIHRvIG1ha2Ugc3VyZSB0aGUgZ2xvYmFsCmJyaWRnZSBsaXN0IGRvZXNuJ3Qga2Vl
cCBub2RlcyB0byBmcmVlZCBtZW1vcnkuCgpBbGwgdGhyZWUgcGF0Y2hlcyBoYXZlIGJlZW4gdGVz
dGVkIG9uIGFuIE9kcm9pZCBOMisgcGx1cyBTQkMuCgpBZHJpw6FuIExhcnVtYmUgKDMpOgogIGRy
bS9tZXNvbjogcmVvcmRlciBkcml2ZXIgZGVpbml0IHNlcXVlbmNlIHRvIGZpeCB1c2UtYWZ0ZXIt
ZnJlZSBidWcKICBkcm0vbWVzb246IGV4cGxpY2l0bHkgcmVtb3ZlIGFnZ3JlZ2F0ZSBkcml2ZXIg
YXQgbW9kdWxlIHVubG9hZCB0aW1lCiAgZHJtL21lc29uOiByZW1vdmUgZHJtIGJyaWRnZXMgYXQg
YWdncmVnYXRlIGRyaXZlciB1bmJpbmQgdGltZQoKIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNv
bl9kcnYuYyAgICAgICAgICB8IDE0ICsrKysrKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vbWVz
b24vbWVzb25fZHJ2LmggICAgICAgICAgfCAgNyArKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vbWVz
b24vbWVzb25fZW5jb2Rlcl9jdmJzLmMgfCAgNyArKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vbWVz
b24vbWVzb25fZW5jb2Rlcl9jdmJzLmggfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVz
b25fZW5jb2Rlcl9oZG1pLmMgfCAgNyArKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVz
b25fZW5jb2Rlcl9oZG1pLmggfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVu
Yy5oICAgICAgICAgfCAxNSArKysrKysrKysrKysrKysKIDcgZmlsZXMgY2hhbmdlZCwgNTEgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKLS0gCjIuMzcuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
