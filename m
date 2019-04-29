Return-Path: <SRS0=ef8O=S7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C5B3C04AA6
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 15:59:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C58E2075E
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 15:59:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ppAqYbsX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="L2NDNSrr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C58E2075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZgC37lee9TS+cUUsKwfBGGVXeRwP3iwXqf/42z5C0K4=; b=ppAqYbsXW2ezIbsZe0lhEvyDS
	86bj5p2DGBBiLyAUq8SeoA98ZFqQ4WMlYAjKOZFW6fVW5E8uO2RZeokBAmq9AKO4bhlZrmEyTQJ24
	0VFgqtJpUhl7DBxdiIvxpQ/L4z5nRwL0FsVsEQuofMUpMZ5DxXf1Kg9U5JivMweDhtZkHhqEe8JVK
	5aoBT8xuja8eP0bCMcpFUg+Pysygf0FM2D04xF7GWijqbX9T2jUqhY1YxWzrgJUJMbc84x0wwznmR
	7iTYvnqV3ed2+dEIntHwSHRNvoOPQeCD6xBnSpr16IdI3aG4phwVXCoj4BX3iiBscVLTxkob7tml4
	K6qE288+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL8gc-0001K4-2D; Mon, 29 Apr 2019 15:59:22 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL8gZ-0001Jg-9Y
 for linux-amlogic@lists.infradead.org; Mon, 29 Apr 2019 15:59:20 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44t8Tw6f7Qz9vD3V;
 Mon, 29 Apr 2019 17:59:00 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=L2NDNSrr; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id hkeVVjfzCfqx; Mon, 29 Apr 2019 17:59:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44t8Tw5N2zz9vD3T;
 Mon, 29 Apr 2019 17:59:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556553540; bh=Kp+aYmFfv0JnYmtls8kr+xjU9L+AwS+/axPDLN7qAsk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=L2NDNSrrHtZM9ifT2jdeIcFKfGkJFjJOEa3L/AgvNxvyqEk2zKI8+BQYvcm5iw3Cx
 p57f+V5CMVuIh4MQHinoRagT8tQdRCW8S/7gN8XZdtSjCsG0WlJMUWEf5Y/qBOZcm0
 fBe4xPw6PxTLgIKLcQcKMB6nrGtG9CNdp6aRGXqE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E91B88B8B4;
 Mon, 29 Apr 2019 17:59:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id AeKoec8SOXJI; Mon, 29 Apr 2019 17:59:05 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3D02D8B8B3;
 Mon, 29 Apr 2019 17:59:04 +0200 (CEST)
Subject: Re: [PATCH 22/41] drivers: tty: serial: cpm_uart: fix logging calls
To: "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-23-git-send-email-info@metux.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a00ba23b-e73e-c964-a6d0-347cb605b8c8@c-s.fr>
Date: Mon, 29 Apr 2019 17:59:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556369542-13247-23-git-send-email-info@metux.net>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_085919_623255_22A319F1 
X-CRM114-Status: GOOD (  13.38  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org, macro@linux-mips.org,
 andrew@aj.id.au, gregkh@linuxfoundation.org, slemieux.tyco@gmail.com,
 liviu.dudau@arm.com, linux-mips@vger.kernel.org, vz@mleia.com,
 linux@prisktech.co.nz, matthias.bgg@gmail.com, khilman@baylibre.com,
 linux-serial@vger.kernel.org, sudeep.holla@arm.com, sparclinux@vger.kernel.org,
 jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpMZSAyNy8wNC8yMDE5IMOgIDE0OjUyLCBFbnJpY28gV2VpZ2VsdCwgbWV0dXggSVQgY29uc3Vs
dCBhIMOpY3JpdMKgOgo+IEZpeCBjaGVja3BhdGNoIHdhcm5pbmdzIGJ5IHVzaW5nIHByX2Vycigp
Ogo+IAo+ICAgICAgV0FSTklORzogUHJlZmVyIFtzdWJzeXN0ZW0gZWc6IG5ldGRldl1fZXJyKFtz
dWJzeXN0ZW1dZGV2LCAuLi4gdGhlbiBkZXZfZXJyKGRldiwgLi4uIHRoZW4gcHJfZXJyKC4uLiAg
dG8gcHJpbnRrKEtFUk5fRVJSIC4uLgo+ICAgICAgIzEwOTogRklMRTogZHJpdmVycy90dHkvc2Vy
aWFsL2NwbV91YXJ0L2NwbV91YXJ0X2NwbTIuYzoxMDk6Cj4gICAgICArCQlwcmludGsoS0VSTl9F
UlIKPiAKPiAgICAgIFdBUk5JTkc6IFByZWZlciBbc3Vic3lzdGVtIGVnOiBuZXRkZXZdX2Vycihb
c3Vic3lzdGVtXWRldiwgLi4uIHRoZW4gZGV2X2VycihkZXYsIC4uLiB0aGVuIHByX2VyciguLi4g
IHRvIHByaW50ayhLRVJOX0VSUiAuLi4KPiAgICAgICMxMjg6IEZJTEU6IGRyaXZlcnMvdHR5L3Nl
cmlhbC9jcG1fdWFydC9jcG1fdWFydF9jcG0yLmM6MTI4Ogo+ICAgICAgKwkJcHJpbnRrKEtFUk5f
RVJSCj4gCj4gICAgICBXQVJOSU5HOiBQcmVmZXIgW3N1YnN5c3RlbSBlZzogbmV0ZGV2XV9lcnIo
W3N1YnN5c3RlbV1kZXYsIC4uLiB0aGVuIGRldl9lcnIoZGV2LCAuLi4gdGhlbiBwcl9lcnIoLi4u
ICB0byBwcmludGsoS0VSTl9FUlIgLi4uCj4gICAgICArICAgICAgICAgICBwcmludGsoS0VSTl9F
UlIKPiAKPiAgICAgIFdBUk5JTkc6IFByZWZlciBbc3Vic3lzdGVtIGVnOiBuZXRkZXZdX2Vycihb
c3Vic3lzdGVtXWRldiwgLi4uIHRoZW4gZGV2X2VycihkZXYsIC4uLiB0aGVuIHByX2VyciguLi4g
IHRvIHByaW50ayhLRVJOX0VSUiAuLi4KPiAgICAgICsgICAgICAgICAgIHByaW50ayhLRVJOX0VS
Ugo+IAo+IFNpZ25lZC1vZmYtYnk6IEVucmljbyBXZWlnZWx0IDxpbmZvQG1ldHV4Lm5ldD4KClJl
dmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGMtcy5mcj4KCkJ1
dCBpcyB0aGF0IHJlYWxseSB3b3J0aCBkb2luZyB0aG9zZSBjaGFuZ2VzID8KCklmIHdlIHdhbnQg
dG8gZG8gc29tZXRoaW5nIHVzZWZ1bCwgd291bGRuJ3QgaXQgbWFrZSBtb3JlIHNlbnNlIHRvIApp
bnRyb2R1Y2UgdGhlIHVzZSBvZiBkZXZfZXJyKCkgaW4gb3JkZXIgdG8gaWRlbnRpZnkgdGhlIGZh
dWx0aW5nIGRldmljZSAKaW4gdGhlIG1lc3NhZ2UgPwoKQ2hyaXN0b3BoZQoKPiAtLS0KPiAgIGRy
aXZlcnMvdHR5L3NlcmlhbC9jcG1fdWFydC9jcG1fdWFydF9jcG0xLmMgfCA2ICsrLS0tLQo+ICAg
ZHJpdmVycy90dHkvc2VyaWFsL2NwbV91YXJ0L2NwbV91YXJ0X2NwbTIuYyB8IDYgKystLS0tCj4g
ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvc2VyaWFsL2NwbV91YXJ0L2NwbV91YXJ0X2NwbTEuYyBi
L2RyaXZlcnMvdHR5L3NlcmlhbC9jcG1fdWFydC9jcG1fdWFydF9jcG0xLmMKPiBpbmRleCA1NmZj
NTI3Li5hZWQ2MWU5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9jcG1fdWFydC9j
cG1fdWFydF9jcG0xLmMKPiArKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvY3BtX3VhcnQvY3BtX3Vh
cnRfY3BtMS5jCj4gQEAgLTcxLDggKzcxLDcgQEAgaW50IGNwbV91YXJ0X2FsbG9jYnVmKHN0cnVj
dCB1YXJ0X2NwbV9wb3J0ICpwaW5mbywgdW5zaWduZWQgaW50IGlzX2NvbikKPiAgIAlkcG1lbXN6
ID0gc2l6ZW9mKGNiZF90KSAqIChwaW5mby0+cnhfbnJmaWZvcyArIHBpbmZvLT50eF9ucmZpZm9z
KTsKPiAgIAlkcF9vZmZzZXQgPSBjcG1fZHBhbGxvYyhkcG1lbXN6LCA4KTsKPiAgIAlpZiAoSVNf
RVJSX1ZBTFVFKGRwX29mZnNldCkpIHsKPiAtCQlwcmludGsoS0VSTl9FUlIKPiAtCQkgICAgICAg
ImNwbV91YXJ0X2NwbTEuYzogY291bGQgbm90IGFsbG9jYXRlIGJ1ZmZlciBkZXNjcmlwdG9yc1xu
Iik7Cj4gKwkJcHJfZXJyKCJjcG1fdWFydF9jcG0xLmM6IGNvdWxkIG5vdCBhbGxvY2F0ZSBidWZm
ZXIgZGVzY3JpcHRvcnNcbiIpOwo+ICAgCQlyZXR1cm4gLUVOT01FTTsKPiAgIAl9Cj4gICAJZHBf
bWVtID0gY3BtX2RwcmFtX2FkZHIoZHBfb2Zmc2V0KTsKPiBAQCAtOTAsOCArODksNyBAQCBpbnQg
Y3BtX3VhcnRfYWxsb2NidWYoc3RydWN0IHVhcnRfY3BtX3BvcnQgKnBpbmZvLCB1bnNpZ25lZCBp
bnQgaXNfY29uKQo+ICAgCj4gICAJaWYgKG1lbV9hZGRyID09IE5VTEwpIHsKPiAgIAkJY3BtX2Rw
ZnJlZShkcF9vZmZzZXQpOwo+IC0JCXByaW50ayhLRVJOX0VSUgo+IC0JCSAgICAgICAiY3BtX3Vh
cnRfY3BtMS5jOiBjb3VsZCBub3QgYWxsb2NhdGUgY29oZXJlbnQgbWVtb3J5XG4iKTsKPiArCQlw
cl9lcnIoImNwbV91YXJ0X2NwbTEuYzogY291bGQgbm90IGFsbG9jYXRlIGNvaGVyZW50IG1lbW9y
eVxuIik7Cj4gICAJCXJldHVybiAtRU5PTUVNOwo+ICAgCX0KPiAgIAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3R0eS9zZXJpYWwvY3BtX3VhcnQvY3BtX3VhcnRfY3BtMi5jIGIvZHJpdmVycy90dHkv
c2VyaWFsL2NwbV91YXJ0L2NwbV91YXJ0X2NwbTIuYwo+IGluZGV4IDQwY2ZjZjQuLmEwZmNjZGEg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsL2NwbV91YXJ0L2NwbV91YXJ0X2NwbTIu
Ywo+ICsrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9jcG1fdWFydC9jcG1fdWFydF9jcG0yLmMKPiBA
QCAtMTA2LDggKzEwNiw3IEBAIGludCBjcG1fdWFydF9hbGxvY2J1ZihzdHJ1Y3QgdWFydF9jcG1f
cG9ydCAqcGluZm8sIHVuc2lnbmVkIGludCBpc19jb24pCj4gICAJZHBtZW1zeiA9IHNpemVvZihj
YmRfdCkgKiAocGluZm8tPnJ4X25yZmlmb3MgKyBwaW5mby0+dHhfbnJmaWZvcyk7Cj4gICAJZHBf
b2Zmc2V0ID0gY3BtX2RwYWxsb2MoZHBtZW1zeiwgOCk7Cj4gICAJaWYgKElTX0VSUl9WQUxVRShk
cF9vZmZzZXQpKSB7Cj4gLQkJcHJpbnRrKEtFUk5fRVJSCj4gLQkJICAgICAgICJjcG1fdWFydF9j
cG0uYzogY291bGQgbm90IGFsbG9jYXRlIGJ1ZmZlciBkZXNjcmlwdG9yc1xuIik7Cj4gKwkJcHJf
ZXJyKCJjcG1fdWFydF9jcG0uYzogY291bGQgbm90IGFsbG9jYXRlIGJ1ZmZlciBkZXNjcmlwdG9y
c1xuIik7Cj4gICAJCXJldHVybiAtRU5PTUVNOwo+ICAgCX0KPiAgIAo+IEBAIC0xMjUsOCArMTI0
LDcgQEAgaW50IGNwbV91YXJ0X2FsbG9jYnVmKHN0cnVjdCB1YXJ0X2NwbV9wb3J0ICpwaW5mbywg
dW5zaWduZWQgaW50IGlzX2NvbikKPiAgIAo+ICAgCWlmIChtZW1fYWRkciA9PSBOVUxMKSB7Cj4g
ICAJCWNwbV9kcGZyZWUoZHBfb2Zmc2V0KTsKPiAtCQlwcmludGsoS0VSTl9FUlIKPiAtCQkgICAg
ICAgImNwbV91YXJ0X2NwbS5jOiBjb3VsZCBub3QgYWxsb2NhdGUgY29oZXJlbnQgbWVtb3J5XG4i
KTsKPiArCQlwcl9lcnIoImNwbV91YXJ0X2NwbS5jOiBjb3VsZCBub3QgYWxsb2NhdGUgY29oZXJl
bnQgbWVtb3J5XG4iKTsKPiAgIAkJcmV0dXJuIC1FTk9NRU07Cj4gICAJfQo+ICAgCj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
