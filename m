Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2B9C43602
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2026 14:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JUDLZpfZSgPrOC5neR5dZ/3lhZu30dSzsZcPLFKVfJc=; b=sL4FYdspcVg4FJ
	ku7Fv5LqkyWPBnKWHBhhnQxd67FuuOwwwUwcFV9P0v0Se59M9pLllXTEUwaiC1US2K0Dw0chQyl5M
	TVXQ4ruIfhkBlheK2bt1WK41e7TQuHTCTxNbxdaqbB11+dxAs06qDV0snPcY7XIGSd+ATjUq8ZVM3
	oZo6OoknNf5y9KIfyhB6+IOPjgC7xFD+pomzZmqsVqruf559Dw0m6fSU6ydoyR/NFVPJ8YPhwuyjf
	/+73kEktkQBh4zRjZxDf/OBUh0SjnTD2/bFG0vG6UkxTM5veG1D2skGdKa7VexanKxQxw3vtcoytR
	Bg3NLbvyxm5qxQYlTlsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6WW-0000000F7SN-3gvB;
	Tue, 07 Jul 2026 14:11:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6WS-0000000F7QV-267R
	for linux-amlogic@lists.infradead.org;
	Tue, 07 Jul 2026 14:11:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 44AD843734;
	Tue,  7 Jul 2026 14:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D76F61F00A3E;
	Tue,  7 Jul 2026 14:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783433500;
	bh=maxRYiGuvp3sk94iMBSr3HRC125ilQL8m9e/yyGjfeA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KIIAVhQLOJ7397SssCcXiHVSdL6tx/XNqk3SbED8xhv7Fc1VjuLrnhouLp3XXV63p
	 KErkYVtjVOR5dY+3HhKDViWREHeWvXIh6tzxRnb3cKY0J4+z+dM8BcW4Te0Q+kGPbM
	 S4jCtA1gd6wXNACIDHuHPQIQtRfM7sCvevsBu2fYaxZVTm0jZhQyJUaULnKZbCLNh2
	 k3XmeitDRWlG5smdkZWxv5aX4aNip/ba1V3E3XBwg74uDWjumVRZY3AWbW8omlaNws
	 8TByuiPPRwCLpECyxqz4Q5Fr/Lop1UqIiFMLk3Cl0hTqO9tlfWl40SZWW7z+T7HUOK
	 G/DM2QIyc0L6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v12 4/7] net: stmmac: qcom-ethqos: set serdes
 mode before powerup
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-sunxi@lists.linux.dev, imx@lists.linux.dev, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, robh@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-4-e3ab1ecf2901@oss.qualcomm.com>
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
 <20260706-qcom-sa8255p-emac-v12-4-e3ab1ecf2901@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 14:11:38 +0000
Message-Id: <20260707141138.D76F61F00A3E@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIENhbGxpbmcgcGh5X3Nl
dF9tb2RlX2V4dCgpIHdpdGggc3RhdGljYWxseSBjYWNoZWQgZXRocW9zLT5waHlfbW9kZSBpZ25v
cmVzIGR5bmFtaWMgcGh5bGluayBpbnRlcmZhY2UgY2hhbmdlcywgbGVhZGluZyB0byBpbmNvcnJl
Y3QgUEhZIHBlcmZvcm1hbmNlIHN0YXRlLgotLQoKY29tbWl0IDFhYTM1YjU0ZTJjMWUzMDk3ODAw
YmY2MWFjODY2NWY2OTU4OTYzMWYKQXV0aG9yOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6
LmdvbGFzemV3c2tpQG9zcy5xdWFsY29tbS5jb20+CgpuZXQ6IHN0bW1hYzogcWNvbS1ldGhxb3M6
IHNldCBzZXJkZXMgbW9kZSBiZWZvcmUgcG93ZXJ1cAoKQ2FsbCBwaHlfc2V0X21vZGVfZXh0KCkg
YmVmb3JlIHBoeV9wb3dlcl9vbigpIGluCnFjb21fZXRocW9zX3NlcmRlc19wb3dlcnVwKCkuIFRo
aXMgaXMgZG9uZSBhaGVhZCBvZiBhZGRpbmcgc3VwcG9ydCBmb3IgdGhlCmZpcm13YXJlLW1hbmFn
ZWQgRU1BQyBvbiBRdWFsY29tbSBzYTgyNTVwLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcWNvbS1ldGhxb3MuYyBiL2RyaXZlcnMvbmV0
L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9zLmMKPiAtLS0gYS9kcml2
ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1xY29tLWV0aHFvcy5jCj4gKysr
IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcWNvbS1ldGhxb3Mu
Ywo+IEBAIC02MDEsMTAgKzYwMSwxOSBAQCBzdGF0aWMgaW50IHFjb21fZXRocW9zX3NlcmRlc19w
b3dlcnVwKHN0cnVjdCBuZXRfZGV2aWNlICpuZGV2LCB2b2lkICpwcml2KQo+ICAJaWYgKHJldCkK
PiAgCQlyZXR1cm4gcmV0Owo+ICAKPiArCXJldCA9IHBoeV9zZXRfbW9kZV9leHQoZXRocW9zLT5z
ZXJkZXNfcGh5LCBQSFlfTU9ERV9FVEhFUk5FVCwKPiArCQkJICAgICAgIGV0aHFvcy0+cGh5X21v
ZGUpOwoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIHRoaXMgaWdub3JlIGR5bmFtaWMgcGh5bGluayBp
bnRlcmZhY2UgY2hhbmdlcyBieSBhbHdheXMgdXNpbmcgdGhlCnN0YXRpY2FsbHkgY2FjaGVkIGV0
aHFvcy0+cGh5X21vZGU/CgpBdCBwcm9iZSwgZXRocW9zLT5waHlfbW9kZSBpcyBzdGF0aWNhbGx5
IGFzc2lnbmVkIGZyb20gdGhlIGRldmljZSB0cmVlLgpPbiBpbnRlcmZhY2UgdXAsIHN0bW1hY19v
cGVuKCkgY2FsbHMgcWNvbV9ldGhxb3Nfc2VyZGVzX3Bvd2VydXAoKSwgd2hpY2gKY2FsbHMgcGh5
X3NldF9tb2RlX2V4dCgpIGFuZCB0aGVuIHBoeV9wb3dlcl9vbigpLgoKTGF0ZXIsIHdoZW4gcGh5
bGluayByZXNvbHZlcyB0aGUgbGluayBhbmQgZHluYW1pY2FsbHkgc3dpdGNoZXMgdGhlIGludGVy
ZmFjZSwKaXQgY2FsbHMgZXRocW9zX21hY19maW5pc2hfc2VyZGVzKCkgd2hpY2ggY2FsbHMgcGh5
X3NldF9tb2RlX2V4dCgpIHdpdGggdGhlCm5ldyBkeW5hbWljYWxseSBuZWdvdGlhdGVkIGludGVy
ZmFjZSBtb2RlLiBIb3dldmVyLCBiZWNhdXNlIHRoZSBQSFkgaXMgYWxyZWFkeQpwb3dlcmVkIG9u
LCB0aGUgU0NNSSBQSFkgZHJpdmVyIGNhY2hlcyB0aGUgbmV3IHBlcmZvcm1hbmNlIHN0YXRlIGJ1
dCBuZXZlcgphcHBsaWVzIGl0IHRvIHRoZSBoYXJkd2FyZS4KCklmIHRoZSB1c2VyIHN1YnNlcXVl
bnRseSB0b2dnbGVzIHRoZSBpbnRlcmZhY2UgKGlwIGxpbmsgc2V0IGV0aDAgZG93bi91cCksCnFj
b21fZXRocW9zX3NlcmRlc19wb3dlcnVwKCkgaXMgY2FsbGVkIGFnYWluLiBXaWxsIHRoaXMgcGFz
cyB0aGUgc3RhbGUsIHN0YXRpYwpldGhxb3MtPnBoeV9tb2RlIGluc3RlYWQgb2YgdGhlIGN1cnJl
bnQgcGh5bGluayBtb2RlLCB0aGVyZWJ5IHJldmVydGluZyB0aGUgUEhZCnRvIHRoZSB3cm9uZyBj
b25maWd1cmF0aW9uIGFuZCBhcHBseWluZyB0aGUgd3JvbmcgcGVyZm9ybWFuY2Ugc3RhdGU/Cgo+
ICsJaWYgKHJldCkKPiArCQlnb3RvIGVycl9vdXQ7Cj4gKwo+ICAJcmV0ID0gcGh5X3Bvd2VyX29u
KGV0aHFvcy0+c2VyZGVzX3BoeSk7Cj4gIAlpZiAocmV0KQo+IC0JCXBoeV9leGl0KGV0aHFvcy0+
c2VyZGVzX3BoeSk7Cj4gKwkJZ290byBlcnJfb3V0Owo+ICAKPiArCXJldHVybiAwOwo+ICsKPiAr
ZXJyX291dDoKPiArCXBoeV9leGl0KGV0aHFvcy0+c2VyZGVzX3BoeSk7Cj4gIAlyZXR1cm4gcmV0
Owo+ICB9CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3Bh
dGNoc2V0LzIwMjYwNzA2LXFjb20tc2E4MjU1cC1lbWFjLXYxMi0wLWUzYWIxZWNmMjkwMUBvc3Mu
cXVhbGNvbW0uY29tP3BhcnQ9NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
