Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E78C3DA6D
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 May 2025 12:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9PkuAYP6VbSi7HWoGEr8L5Fg9hh7KyrjS9Y8L88radc=; b=tNP7IC8avIkv3g
	quIaHi6ZHH2gleXjIoVeMsaeVX1ZwDcE965peVXHv+doFLyMrV4JKUC3rbkyawEw5lQOpVPhh32kU
	+VHWwO+RgFSZK/HZt2tEpxLB/DDpfP+iMXuMjGPpQw/Vt8EOOPWV01EtMK82OnwIB4M8wxoGJI76E
	jVQ5L31J6N5lwEyUkzSK/icqChcZGg9YrhxMFjUBZX+RmGOLw9dvmlcvluEhozRgCY6jYbnkBfRY7
	jb+tkmv+OPg/iEsto2sE29ZGydM5kgCHIDKIzhwytKhCOWfHhFoeZQZE0jhgg+fzTm+8VgA7jixOG
	rG2S+Ot4WqGDG71u3s3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIRfM-00000003p1i-3r9v;
	Fri, 23 May 2025 12:38:24 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQS7-00000003guo-3ozK;
	Fri, 23 May 2025 11:20:41 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4b3hmd3T2Mz9vXt;
	Fri, 23 May 2025 12:51:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x6OGEq_bauYM; Fri, 23 May 2025 12:51:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4b3hmd2TkFz9vXs;
	Fri, 23 May 2025 12:51:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4884C8B769;
	Fri, 23 May 2025 12:51:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id p6vSVHiM0Uvz; Fri, 23 May 2025 12:51:45 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 08E138B763;
	Fri, 23 May 2025 12:51:43 +0200 (CEST)
Message-ID: <8ad901c3-3fcb-4643-ac5a-c1f30f93d07f@csgroup.eu>
Date: Fri, 23 May 2025 12:51:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
To: Ai Chao <aichao@kylinos.cn>, perex@perex.cz, tiwai@suse.com,
 johannes@sipsolutions.net, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, broonie@kernel.org, jbrunet@baylibre.com,
 neil.armstrong@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, srinivas.kandagatla@linaro.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 imx@lists.linux.dev, kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
References: <20250522050300.519244-1-aichao@kylinos.cn>
 <20250522050300.519244-3-aichao@kylinos.cn>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250522050300.519244-3-aichao@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_042040_108444_1781C2FD 
X-CRM114-Status: GOOD (  18.03  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpMZSAyMi8wNS8yMDI1IMOgIDA3OjAyLCBBaSBDaGFvIGEgw6ljcml0wqA6Cj4gVGhlIGZvcl9l
YWNoX2NoaWxkX29mX25vZGVfc2NvcGVkKCkgaGVscGVyIHByb3ZpZGVzIGEgc2NvcGUtYmFzZWQK
PiBjbGVhbi11cCBmdW5jdGlvbmFsaXR5IHRvIHB1dCB0aGUgZGV2aWNlX25vZGUgYXV0b21hdGlj
YWxseSwgYW5kCj4gYXMgc3VjaCwgdGhlcmUgaXMgbm8gbmVlZCB0byBjYWxsIG9mX25vZGVfcHV0
KCkgZGlyZWN0bHkuCgpJIGRvbid0IHVuZGVyc3RhbmQgdGhpcyBleHBsYW5hdGlvbi4KCllvdSBz
YXkgIm5vIG5lZWQgdG8gY2FsbCBvZl9ub2RlX3B1dCgpIiBhbmQgdGhlIG9ubHkgdGhpbmcgeW91
IGRvIGluIAphZGRpdGlvbiB0byBjaGFuZ2luZyBmcm9tIGZvcl9lYWNoX2NoaWxkX29mX25vZGUo
KSB0byAKZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZV9zY29wZWQoKSBpcyB0byBfYWRkXyBhIG5ldyBj
YWxsIHRvIG9mX25vZGVfcHV0KCkuCgpJIHdvdWxkIGV4cGVjdCB0byBzZWUgYSBfcmVtb3ZhbF8g
b2Ygc29tZSBvZl9ub2RlX3B1dCgpIHdoZW4gSSByZWFkIHlvdXIgCmRlc2NyaXB0aW9uLgoKQ2hy
aXN0b3BoZQoKPiAKPiBUaHVzLCB1c2UgdGhpcyBoZWxwZXIgdG8gc2ltcGxpZnkgdGhlIGNvZGUu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQWkgQ2hhbyA8YWljaGFvQGt5bGlub3MuY24+Cj4gLS0tCj4g
ICBzb3VuZC9hb2Evc291bmRidXMvaTJzYnVzL2NvcmUuYyB8IDUgKysrLS0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L3NvdW5kL2FvYS9zb3VuZGJ1cy9pMnNidXMvY29yZS5jIGIvc291bmQvYW9hL3NvdW5kYnVzL2ky
c2J1cy9jb3JlLmMKPiBpbmRleCBjZTg0Mjg4MTY4ZTQuLjIwYTRjNTg5MWFmYyAxMDA2NDQKPiAt
LS0gYS9zb3VuZC9hb2Evc291bmRidXMvaTJzYnVzL2NvcmUuYwo+ICsrKyBiL3NvdW5kL2FvYS9z
b3VuZGJ1cy9pMnNidXMvY29yZS5jCj4gQEAgLTIwNyw2ICsyMDcsOCBAQCBzdGF0aWMgaW50IGky
c2J1c19hZGRfZGV2KHN0cnVjdCBtYWNpb19kZXYgKm1hY2lvLAo+ICAgCQkJfQo+ICAgCQl9Cj4g
ICAJfQo+ICsJb2Zfbm9kZV9wdXQoc291bmQpOwo+ICsKPiAgIAkvKiBmb3IgdGhlIHRpbWUgYmVp
bmcsIHVudGlsIHdlIGNhbiBoYW5kbGUgbm9uLWxheW91dC1pZAo+ICAgCSAqIHRoaW5ncyBpbiBz
b21lIGZhYnJpYywgcmVmdXNlIHRvIGF0dGFjaCBpZiB0aGVyZSBpcyBubwo+ICAgCSAqIGxheW91
dC1pZCBwcm9wZXJ0eSBvciB3ZSBoYXZlbid0IGJlZW4gZm9yY2VkIHRvIGF0dGFjaC4KPiBAQCAt
MzM1LDcgKzMzNyw2IEBAIHN0YXRpYyBpbnQgaTJzYnVzX2FkZF9kZXYoc3RydWN0IG1hY2lvX2Rl
diAqbWFjaW8sCj4gICAKPiAgIHN0YXRpYyBpbnQgaTJzYnVzX3Byb2JlKHN0cnVjdCBtYWNpb19k
ZXYqIGRldiwgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCAqbWF0Y2gpCj4gICB7Cj4gLQlzdHJ1
Y3QgZGV2aWNlX25vZGUgKm5wOwo+ICAgCWludCBnb3QgPSAwLCBlcnI7Cj4gICAJc3RydWN0IGky
c2J1c19jb250cm9sICpjb250cm9sID0gTlVMTDsKPiAgIAo+IEBAIC0zNDcsNyArMzQ4LDcgQEAg
c3RhdGljIGludCBpMnNidXNfcHJvYmUoc3RydWN0IG1hY2lvX2RldiogZGV2LCBjb25zdCBzdHJ1
Y3Qgb2ZfZGV2aWNlX2lkICptYXRjaCkKPiAgIAkJcmV0dXJuIC1FTk9ERVY7Cj4gICAJfQo+ICAg
Cj4gLQlmb3JfZWFjaF9jaGlsZF9vZl9ub2RlKGRldi0+b2ZkZXYuZGV2Lm9mX25vZGUsIG5wKSB7
Cj4gKwlmb3JfZWFjaF9jaGlsZF9vZl9ub2RlX3Njb3BlZChkZXYtPm9mZGV2LmRldi5vZl9ub2Rl
LCBucCkgewo+ICAgCQlpZiAob2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUobnAsICJpMnNidXMiKSB8
fAo+ICAgCQkgICAgb2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUobnAsICJpMnMtbW9kZW0iKSkgewo+
ICAgCQkJZ290ICs9IGkyc2J1c19hZGRfZGV2KGRldiwgY29udHJvbCwgbnApOwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
