Return-Path: <SRS0=njkK=OQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85774C64EB1
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Dec 2018 09:43:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56C3E2083D
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Dec 2018 09:43:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q3r6S8sQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56C3E2083D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r8KOcjH0q5UmPrR8wltJw2aHR3ILSAhFiC3JtSk2fU4=; b=q3r6S8sQNTSUk1
	lzApbzuzh6Ea1luLKYrj4U7ktLFCzhj3n4qC3/z04V5IjJ5QADo8w4nmBDOhvTsQHJAITHnlmvZmq
	bHN79apQK3c1b0/c5AkNBLOp/qiEMX0mTz+bMdAJcbald0B6Jf6k3oIFi682MGW/bnrsR5u+Xv4x8
	qMFICYkFLI6gLl09alFWwadqjMstaV2R0sEryZ1e0Jjrp7Tlj6wseVsDTkaPltaRn7gKLAXgurPoU
	OoroCyzsKdgzMFa7kiMlwmsvrXT+qJZ7X3C3O2KVubAM67gvSAgWr+DZlEio1KkTAqEFazSrQ5IWm
	O6vt9Xnmm4yNZ1eSOulw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVCfR-0007eR-A6; Fri, 07 Dec 2018 09:43:29 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCfE-0007Fu-Eg; Fri, 07 Dec 2018 09:43:18 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 1DE1D20731; Fri,  7 Dec 2018 10:43:05 +0100 (CET)
Received: from xps13 (aaubervilliers-681-1-79-44.w90-88.abo.wanadoo.fr
 [90.88.21.44])
 by mail.bootlin.com (Postfix) with ESMTPSA id 922EA20711;
 Fri,  7 Dec 2018 10:42:54 +0100 (CET)
Date: Fri, 7 Dec 2018 10:42:54 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jianxin Pan <jianxin.pan@amlogic.com>
Subject: Re: [PATCH v7 2/2] mtd: rawnand: meson: add support for Amlogic
 NAND flash controller
Message-ID: <20181207104254.0ecfc1e5@xps13>
In-Reply-To: <20181207102456.1dc67e07@xps13>
References: <1542386439-30166-1-git-send-email-jianxin.pan@amlogic.com>
 <1542386439-30166-3-git-send-email-jianxin.pan@amlogic.com>
 <20181207102456.1dc67e07@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_014316_695779_DD74C06A 
X-CRM114-Status: GOOD (  14.79  )
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
Cc: Rob Herring <robh@kernel.org>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Marek Vasut <marek.vasut@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Richard Weinberger <richard@nod.at>, Neil Armstrong <narmstrong@baylibre.com>,
 Yixun Lan <yixun.lan@amlogic.com>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@bootlin.com>, Jian Hu <jian.hu@amlogic.com>,
 Liang Yang <liang.yang@amlogic.com>, linux-mtd@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgSmlhbnhpbiwKCk1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdy
b3RlIG9uIEZyaSwgNyBEZWMgMjAxOAoxMDoyNDo1NiArMDEwMDoKCj4gSGkgSmlhbnhpbiwKPiAK
PiBMb29rcyBnb29kIHRvIG1lIG92ZXJhbGwsIGEgZmV3IGNvbW1lbnRzIGlubGluZS4KPiAKPiBK
aWFueGluIFBhbiA8amlhbnhpbi5wYW5AYW1sb2dpYy5jb20+IHdyb3RlIG9uIFNhdCwgMTcgTm92
IDIwMTgKPiAwMDo0MDozOCArMDgwMDoKPiAKPiA+IEZyb206IExpYW5nIFlhbmcgPGxpYW5nLnlh
bmdAYW1sb2dpYy5jb20+Cj4gPiAKPiA+IEFkZCBpbml0aWFsIHN1cHBvcnQgZm9yIHRoZSBBbWxv
Z2ljIE5BTkQgZmxhc2ggY29udHJvbGxlciB3aGljaCBmb3VuZAo+ID4gaW4gdGhlIE1lc29uLUdY
QkIvR1hML0FYRyBTb0NzLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBMaWFuZyBZYW5nIDxsaWFu
Zy55YW5nQGFtbG9naWMuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogWWl4dW4gTGFuIDx5aXh1bi5s
YW5AYW1sb2dpYy5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKaWFueGluIFBhbiA8amlhbnhpbi5w
YW5AYW1sb2dpYy5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmln
ICAgICAgfCAgIDEwICsKPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9NYWtlZmlsZSAgICAgfCAg
ICAxICsKPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgfCAxNDE3ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDE0
MjggaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9tZXNvbl9uYW5kLmMKPiA+IAoKSSBmb3Jnb3QgdG8gbWVudGlvbiwgQm9yaXMgaGFzIGRv
bmUgbW9yZSBjbGVhbnVwIHdoaWNoIGJyZWFrcyB5b3VyCnBhdGNoZXMsIHBsZWFzZSBoYXZlIGEg
bG9vayBhdCB0aGUgZm9sbG93aW5nIGNvbW1pdHMgaW4gdGhlIG5hbmQvbmV4dApicmFuY2gsIHRo
ZXkgd2lsbCBmb3JjZSB5b3UgdG8gZG8gc29tZSBsaWdodCByZXdvcmsgdG8gZ2V0IHRoZSBkcml2
ZXIKYnVpbGRpbmcgKGVzcGVjaWFsbHksIHlvdSBzaG91bGQgbm90IGV4cG9ydCB0aGUgLT5zZWxl
Y3RfY2hpcCBob29rIGFueW1vcmUpOgoKN2EwOGRiYWVkZDM2IG10ZDogcmF3bmFuZDogTW92ZSAt
PnNldHVwX2RhdGFfaW50ZXJmYWNlKCkgdG8gbmFuZF9jb250cm9sbGVyX29wcwpmMmFiZmViMjA3
OGIgbXRkOiByYXduYW5kOiBNb3ZlIHRoZSAtPmV4ZWNfb3AoKSBtZXRob2QgdG8gbmFuZF9jb250
cm9sbGVyX29wcwo3ZDZjMzdlOTBjZjkgbXRkOiByYXduYW5kOiBEZXByZWNhdGUgdGhlIC0+c2Vs
ZWN0X2NoaXAoKSBob29rCjE3NzAwMjJmZmE4NSBtdGQ6IHJhd25hbmQ6IGFtcy1kZWx0YTogU3Rv
cCBpbXBsZW1lbnRpbmcgLT5zZWxlY3RfY2hpcCgpCjY1M2M1N2M3ZGEwOCBtdGQ6IHJhd25hbmQ6
IHZmNjEwOiBTdG9wIGltcGxlbWVudGluZyAtPnNlbGVjdF9jaGlwKCkKMmFjZTQ1MWNhZTIyIG10
ZDogcmF3bmFuZDogdGVncmE6IFN0b3AgaW1wbGVtZW50aW5nIC0+c2VsZWN0X2NoaXAoKQpiMjUy
NTE0MTRmNmUgbXRkOiByYXduYW5kOiBtYXJ2ZWxsOiBTdG9wIGltcGxlbWVudGluZyAtPnNlbGVj
dF9jaGlwKCkKNTUwYjlmYzRlM2FmIG10ZDogcmF3bmFuZDogZnNtYzogU3RvcCBpbXBsZW1lbnRp
bmcgLT5zZWxlY3RfY2hpcCgpCjAyYjRhNTI2MDRhNCBtdGQ6IHJhd25hbmQ6IE1ha2UgLT5zZWxl
Y3RfY2hpcCgpIG9wdGlvbmFsIHdoZW4gLT5leGVjX29wKCkgaXMgaW1wbGVtZW50ZWQKYWUyMjk0
YjEwYjBmIG10ZDogcmF3bmFuZDogUGFzcyB0aGUgQ1MgbGluZSB0byBiZSBzZWxlY3RlZCBpbiBz
dHJ1Y3QgbmFuZF9vcGVyYXRpb24KMWQwMTc4NTkzZDE0IG10ZDogcmF3bmFuZDogQWRkIG5hbmRf
W2RlXXNlbGVjdF90YXJnZXQoKSBoZWxwZXJzCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
