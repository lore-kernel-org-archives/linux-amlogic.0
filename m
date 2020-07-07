Return-Path: <SRS0=38i7=AS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE22C433E0
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 06:32:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AFEA206CD
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 06:32:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PNi59r3M";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="oacChSNn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AFEA206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5A4ZtwcUR54+hYPY/1gwD0x7Cdro5b+MocmngbhlFSk=; b=PNi59r3MCWnRf0esvjiclPSrjm
	4nrkD++mdhzLwL8bmJwT3Ih3w2+gn60wGk797v7EOk+H4gc+rUugcbzkjLpGBiktrSnDxrBqHxlBm
	IoF/lYf8yX1Qy31fHEEAror8qUn467VJ3DJWLCt3pqug0v6RqCdwGzYUq0RnxwASI5UMgNMubomIX
	Skbw95BsuUBJYaXmf7ZG+zVu4Vn/Xyf79wMy+SG8hASi0hM81DYJtuEikj9sjHHzoD5SQRAuaFvUa
	KUwrNboU4lvm/drvqSbKNv7GYq5yCvKF6jr1QFJa4rQzUvFvlSQrdu5DeFcDRWPpbH/PUWgOC5aHw
	Jgut1nvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsh9d-0001sq-5c; Tue, 07 Jul 2020 06:32:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsh9a-0001sQ-Tq; Tue, 07 Jul 2020 06:32:32 +0000
Received: from e123331-lin.nice.arm.com (adsl-70.109.242.21.tellas.gr
 [109.242.21.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DFC2C206CD;
 Tue,  7 Jul 2020 06:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594103549;
 bh=vX6i3Ra+kAMs1TuleEtAIqe2wt8EgPexdR6kk5rGYqw=;
 h=From:To:Cc:Subject:Date:From;
 b=oacChSNntimn3y6H6HbE4sgNBQcgJdyaw4Lc7klfZcHsRGpQlsYM/esigsJzQZvBM
 a270k5/uUclz90XD8j+MClpntDBQR2z1Ea6xSlgD31JlGhjZ6VFC2dIXxeOdGmESy1
 FQkylwrduhsp9YAwA5aOmXBXQNkPP5fi/+zndphg=
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v4 00/13] crypto: permit asynchronous skciphers as driver
 fallbacks
Date: Tue,  7 Jul 2020 09:31:50 +0300
Message-Id: <20200707063203.5018-1-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_023231_273368_85E831A5 
X-CRM114-Status: GOOD (  13.96  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Eric Biggers <ebiggers@google.com>,
 Corentin Labbe <clabbe.montjoie@gmail.com>,
 Ayush Sawal <ayush.sawal@chelsio.com>, Jamie Iles <jamie@jamieiles.com>,
 Fabio Estevam <festevam@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
 Rohit Maheshwari <rohitm@chelsio.com>, Chen-Yu Tsai <wens@csie.org>,
 Corentin Labbe <clabbe@baylibre.com>, NXP Linux Team <linux-imx@nxp.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 Maxime Ripard <mripard@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, John Allen <john.allen@amd.com>,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhlIGRyaXZlcnMgZm9yIGNyeXB0byBhY2NlbGVyYXRvcnMgaW4gZHJpdmVycy9jcnlwdG8gYWxs
IGltcGxlbWVudCBza2NpcGhlcnMKb2YgYW4gYXN5bmNocm9ub3VzIG5hdHVyZSwgZ2l2ZW4gdGhh
dCB0aGV5IGFyZSBiYWNrZWQgYnkgaGFyZHdhcmUgRE1BIHRoYXQKY29tcGxldGVzIGFzeW5jaHJv
bm91c2x5IHdydCB0aGUgZXhlY3V0aW9uIGZsb3cuCgpIb3dldmVyLCBpbiBtYW55IGNhc2VzLCBh
bnkgZmFsbGJhY2tzIHRoZXkgYWxsb2NhdGUgYXJlIGxpbWl0ZWQgdG8gdGhlCnN5bmNocm9ub3Vz
IHZhcmlldHksIHdoaWNoIHJ1bGVzIG91dCB0aGUgdXNlIG9mIFNJTUQgaW1wbGVtZW50YXRpb25z
IG9mCkFFUyBpbiBFQ0IsIENCQyBhbmQgWFRTIG1vZGVzLCBnaXZlbiB0aGF0IHRoZXkgYXJlIHVz
dWFsbHkgYnVpbHQgb24gdG9wCm9mIHRoZSBhc3luY2hyb25vdXMgU0lNRCBoZWxwZXIsIHdoaWNo
IHF1ZXVlcyByZXF1ZXN0cyBmb3IgYXN5bmNocm9ub3VzCmNvbXBsZXRpb24gaWYgdGhleSBhcmUg
aXNzdWVkIGZyb20gYSBjb250ZXh0IHRoYXQgZG9lcyBub3QgcGVybWl0IHRoZSB1c2UKb2YgdGhl
IFNJTUQgcmVnaXN0ZXIgZmlsZS4KClRoaXMgbWF5IHJlc3VsdCBpbiBzdWItb3B0aW1hbCBBRVMg
aW1wbGVtZW50YXRpb25zIHRvIGJlIHNlbGVjdGVkIGFzCmZhbGxiYWNrcywgb3IgZXZlbiBsZXNz
IHNlY3VyZSBvbmVzIGlmIHRoZSBvbmx5IHN5bmNocm9ub3VzIGFsdGVybmF0aXZlCmlzIHRhYmxl
IGJhc2VkLCBhbmQgdGhlcmVmb3JlIG5vdCB0aW1lIGludmFyaWFudC4KClNvIHN3aXRjaCBhbGwg
dGhlc2UgY2FzZXMgb3ZlciB0byB0aGUgYXN5bmNocm9ub3VzIEFQSSwgYnkgbW92aW5nIHRoZQpz
dWJyZXF1ZXN0IGludG8gdGhlIHNrY2lwaGVyIHJlcXVlc3QgY29udGV4dCwgYW5kIHBlcm1pdHRp
bmcgaXQgdG8KY29tcGxldGUgYXN5bmNocm9ub3VzbHkgdmlhIHRoZSBjYWxsZXIgcHJvdmlkZWQg
Y29tcGxldGlvbiBmdW5jdGlvbi4KClBhdGNoICMxIGlzIG5vdCByZWxhdGVkLCBidXQgdG91Y2hl
cyB0aGUgc2FtZSBkcml2ZXIgYXMgIzIgc28gaXQgaXMKaW5jbHVkZWQgYW55d2F5LiBQYXRjaCAj
MTMgcmVtb3ZlcyBhbm90aGVyIHN5bmMgc2tjaXBoZXIgYWxsb2NhdGlvbiBieQpzd2l0Y2hpbmcg
dG8gdGhlIEFFUyBsaWJyYXJ5IGludGVyZmFjZS4KCnY0OgotIGFkZCBtaXNzaW5nIGtlcm5lbGRv
YyB1cGRhdGVzIGZvciBzdW44aS1jZSBhbmQgc3VuOGktc3MKLSBhZGQgYWNrcyBmcm9tIEhvcmlh
LCBKYW1pZSBhbmQgQ29yZW50aW4KLSByZWJhc2Ugb250byBjcnlwdG9kZXYvbWFzdGVyCgp2MzoK
LSBkaXNyZWdhcmQgdGhlIGZhbGxiYWNrIHNrY2lwaGVyX3JlcXVlc3Qgd2hlbiB0YWtpbmcgdGhl
IHJlcXVlc3QgY29udGV4dCBzaXplCiAgZm9yIFRGTXMgdGhhdCBkb24ndCBuZWVkIHRoZSBmYWxs
YmFjayBhdCBhbGwgKHBpY294Y2VsbCwgcWNlKQotIGZpeCBlcnJvciBoYW5kbGluZyBpbiBmYWxs
YmFjayBza2NpcGhlciBhbGxvY2F0aW9uIGFuZCByZW1vdmUgcG9pbnRsZXNzCiAgbWVtc2V0KClz
IChxY2UpCgp2MjoKLSBhZGRyZXNzIGlzc3VlIGZvdW5kIGJ5IGJ1aWxkIHJvYm90IGluIHBhdGNo
ICM3Ci0gYWRkIHBhdGNoICMxMwotIHJlYmFzZSBvbnRvIGNyeXB0b2Rldi9tYXN0ZXIKCkNjOiBD
b3JlbnRpbiBMYWJiZSA8Y2xhYmJlLm1vbnRqb2llQGdtYWlsLmNvbT4KQ2M6IENvcmVudGluIExh
YmJlIDxjbGFiYmVAYmF5bGlicmUuY29tPgpDYzogSGVyYmVydCBYdSA8aGVyYmVydEBnb25kb3Iu
YXBhbmEub3JnLmF1PgpDYzogIkRhdmlkIFMuIE1pbGxlciIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+
CkNjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+CkNjOiBDaGVuLVl1IFRzYWkg
PHdlbnNAY3NpZS5vcmc+CkNjOiBUb20gTGVuZGFja3kgPHRob21hcy5sZW5kYWNreUBhbWQuY29t
PgpDYzogSm9obiBBbGxlbiA8am9obi5hbGxlbkBhbWQuY29tPgpDYzogQXl1c2ggU2F3YWwgPGF5
dXNoLnNhd2FsQGNoZWxzaW8uY29tPgpDYzogVmluYXkgS3VtYXIgWWFkYXYgPHZpbmF5LnlhZGF2
QGNoZWxzaW8uY29tPgpDYzogUm9oaXQgTWFoZXNod2FyaSA8cm9oaXRtQGNoZWxzaW8uY29tPgpD
YzogU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPgpDYzogU2FzY2hhIEhhdWVyIDxzLmhh
dWVyQHBlbmd1dHJvbml4LmRlPgpDYzogUGVuZ3V0cm9uaXggS2VybmVsIFRlYW0gPGtlcm5lbEBw
ZW5ndXRyb25peC5kZT4KQ2M6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KQ2M6
IE5YUCBMaW51eCBUZWFtIDxsaW51eC1pbXhAbnhwLmNvbT4KQ2M6IEphbWllIElsZXMgPGphbWll
QGphbWllaWxlcy5jb20+CkNjOiBFcmljIEJpZ2dlcnMgPGViaWdnZXJzQGdvb2dsZS5jb20+CkNj
OiBUZXJvIEtyaXN0byA8dC1rcmlzdG9AdGkuY29tPgpDYzogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0
dGhpYXMuYmdnQGdtYWlsLmNvbT4KQ2M6IEhvcmlhIEdlYW50xIMgPGhvcmlhLmdlYW50YUBueHAu
Y29tPgoKQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgt
b21hcEB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwoKQXJkIEJpZXNoZXV2ZWwgKDEzKToKICBjcnlwdG86IGFtbG9naWMtZ3hsIC0gZGVmYXVsdCB0
byBidWlsZCBhcyBtb2R1bGUKICBjcnlwdG86IGFtbG9naWMtZ3hsIC0gcGVybWl0IGFzeW5jIHNr
Y2lwaGVyIGFzIGZhbGxiYWNrCiAgY3J5cHRvOiBvbWFwLWFlcyAtIHBlcm1pdCBhc3luY2hyb25v
dXMgc2tjaXBoZXIgYXMgZmFsbGJhY2sKICBjcnlwdG86IHN1bjRpIC0gcGVybWl0IGFzeW5jaHJv
bm91cyBza2NpcGhlciBhcyBmYWxsYmFjawogIGNyeXB0bzogc3VuOGktY2UgLSBwZXJtaXQgYXN5
bmNocm9ub3VzIHNrY2lwaGVyIGFzIGZhbGxiYWNrCiAgY3J5cHRvOiBzdW44aS1zcyAtIHBlcm1p
dCBhc3luY2hyb25vdXMgc2tjaXBoZXIgYXMgZmFsbGJhY2sKICBjcnlwdG86IGNjcCAtIHBlcm1p
dCBhc3luY2hyb25vdXMgc2tjaXBoZXIgYXMgZmFsbGJhY2sKICBjcnlwdG86IGNoZWxzaW8gLSBw
ZXJtaXQgYXN5bmNocm9ub3VzIHNrY2lwaGVyIGFzIGZhbGxiYWNrCiAgY3J5cHRvOiBteHMtZGNw
IC0gcGVybWl0IGFzeW5jaHJvbm91cyBza2NpcGhlciBhcyBmYWxsYmFjawogIGNyeXB0bzogcGlj
b3hjZWxsIC0gcGVybWl0IGFzeW5jaHJvbm91cyBza2NpcGhlciBhcyBmYWxsYmFjawogIGNyeXB0
bzogcWNlIC0gcGVybWl0IGFzeW5jaHJvbm91cyBza2NpcGhlciBhcyBmYWxsYmFjawogIGNyeXB0
bzogc2FoYXJhIC0gcGVybWl0IGFzeW5jaHJvbm91cyBza2NpcGhlciBhcyBmYWxsYmFjawogIGNy
eXB0bzogbWVkaWF0ZWsgLSB1c2UgQUVTIGxpYnJhcnkgZm9yIEdDTSBrZXkgZGVyaXZhdGlvbgoK
IGRyaXZlcnMvY3J5cHRvL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICB8ICAzICstCiAu
Li4vYWxsd2lubmVyL3N1bjRpLXNzL3N1bjRpLXNzLWNpcGhlci5jICAgICAgfCA0NiArKysrLS0t
LS0KIGRyaXZlcnMvY3J5cHRvL2FsbHdpbm5lci9zdW40aS1zcy9zdW40aS1zcy5oICB8ICAzICst
CiAuLi4vYWxsd2lubmVyL3N1bjhpLWNlL3N1bjhpLWNlLWNpcGhlci5jICAgICAgfCA0MSArKysr
LS0tLQogZHJpdmVycy9jcnlwdG8vYWxsd2lubmVyL3N1bjhpLWNlL3N1bjhpLWNlLmggIHwgIDgg
Ky0KIC4uLi9hbGx3aW5uZXIvc3VuOGktc3Mvc3VuOGktc3MtY2lwaGVyLmMgICAgICB8IDM5ICsr
KystLS0tCiBkcml2ZXJzL2NyeXB0by9hbGx3aW5uZXIvc3VuOGktc3Mvc3VuOGktc3MuaCAgfCAy
NiArKy0tLQogZHJpdmVycy9jcnlwdG8vYW1sb2dpYy9LY29uZmlnICAgICAgICAgICAgICAgIHwg
IDIgKy0KIGRyaXZlcnMvY3J5cHRvL2FtbG9naWMvYW1sb2dpYy1neGwtY2lwaGVyLmMgICB8IDI3
ICsrKy0tLQogZHJpdmVycy9jcnlwdG8vYW1sb2dpYy9hbWxvZ2ljLWd4bC5oICAgICAgICAgIHwg
IDMgKy0KIGRyaXZlcnMvY3J5cHRvL2NjcC9jY3AtY3J5cHRvLWFlcy14dHMuYyAgICAgICB8IDMz
ICsrKystLS0KIGRyaXZlcnMvY3J5cHRvL2NjcC9jY3AtY3J5cHRvLmggICAgICAgICAgICAgICB8
ICA0ICstCiBkcml2ZXJzL2NyeXB0by9jaGVsc2lvL2NoY3JfYWxnby5jICAgICAgICAgICAgfCA1
NyArKysrKy0tLS0tLQogZHJpdmVycy9jcnlwdG8vY2hlbHNpby9jaGNyX2NyeXB0by5oICAgICAg
ICAgIHwgIDMgKy0KIGRyaXZlcnMvY3J5cHRvL21lZGlhdGVrL210ay1hZXMuYyAgICAgICAgICAg
ICB8IDYzICsrLS0tLS0tLS0tLQogZHJpdmVycy9jcnlwdG8vbXhzLWRjcC5jICAgICAgICAgICAg
ICAgICAgICAgIHwgMzMgKysrLS0tLQogZHJpdmVycy9jcnlwdG8vb21hcC1hZXMuYyAgICAgICAg
ICAgICAgICAgICAgIHwgMzUgKysrKy0tLQogZHJpdmVycy9jcnlwdG8vb21hcC1hZXMuaCAgICAg
ICAgICAgICAgICAgICAgIHwgIDMgKy0KIGRyaXZlcnMvY3J5cHRvL3BpY294Y2VsbF9jcnlwdG8u
YyAgICAgICAgICAgICB8IDM4ICsrKystLS0tCiBkcml2ZXJzL2NyeXB0by9xY2UvY2lwaGVyLmgg
ICAgICAgICAgICAgICAgICAgfCAgMyArLQogZHJpdmVycy9jcnlwdG8vcWNlL3NrY2lwaGVyLmMg
ICAgICAgICAgICAgICAgIHwgNDIgKysrKy0tLS0KIGRyaXZlcnMvY3J5cHRvL3NhaGFyYS5jICAg
ICAgICAgICAgICAgICAgICAgICB8IDk2ICsrKysrKysrKy0tLS0tLS0tLS0KIDIyIGZpbGVzIGNo
YW5nZWQsIDI4MCBpbnNlcnRpb25zKCspLCAzMjggZGVsZXRpb25zKC0pCgotLSAKMi4xNy4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
