Return-Path: <SRS0=svws=A3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C489BC433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2020 11:55:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91D9D20739
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2020 11:55:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DjoXxWRa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91D9D20739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P7me/kJN6HClXOcDbuk2qMjPuh/3Jv1wpCTXnC4cRX8=; b=DjoXxWRas6wQixOtUTEDPsZAJ
	lfTTDfuMP+Ha0jdiQBi7KJnUwVcKKcFLJnNG0fJ+VCeohCkTTifOLda0/uYZDO12t31IG817KMVwu
	Y5/aM+BzQ/2rD1wRKxio4MsZz6EwLQLIS1a5z2DfGYJEusmi50/561DG6BOZ5lJFlWkpfR07e2JRM
	LDbFpJZgjrf7wlgVyUFBnaTmbhloiUj2meK4WGOBrl1l+AxOmJhkaItB3maWJIKLdmFiLGcWgQOOU
	2h+hlZp6p313fTWikzjIJisivJxvuGTDGkHR7T6naYZm54lpNj9qXMy83sGx8IFwOaZQn+6QxHr+s
	rYr+wkLlw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw2Tb-0005zZ-Rm; Thu, 16 Jul 2020 11:54:59 +0000
Received: from [216.24.177.18] (helo=fornost.hmeau.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw2TW-0005wk-T7; Thu, 16 Jul 2020 11:54:55 +0000
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1jw2SE-0008Jn-GM; Thu, 16 Jul 2020 21:53:35 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Thu, 16 Jul 2020 21:53:34 +1000
Date: Thu, 16 Jul 2020 21:53:34 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v4 00/13] crypto: permit asynchronous skciphers as driver
 fallbacks
Message-ID: <20200716115334.GB31166@gondor.apana.org.au>
References: <20200707063203.5018-1-ardb@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200707063203.5018-1-ardb@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_075454_987115_EDC8F0A0 
X-CRM114-Status: GOOD (  18.93  )
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
 Fabio Estevam <festevam@gmail.com>,
 Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
 Rohit Maheshwari <rohitm@chelsio.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Corentin Labbe <clabbe@baylibre.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 Maxime Ripard <mripard@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, John Allen <john.allen@amd.com>,
 Tero Kristo <t-kristo@ti.com>, linux-crypto@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdWwgMDcsIDIwMjAgYXQgMDk6MzE6NTBBTSArMDMwMCwgQXJkIEJpZXNoZXV2ZWwg
d3JvdGU6Cj4gVGhlIGRyaXZlcnMgZm9yIGNyeXB0byBhY2NlbGVyYXRvcnMgaW4gZHJpdmVycy9j
cnlwdG8gYWxsIGltcGxlbWVudCBza2NpcGhlcnMKPiBvZiBhbiBhc3luY2hyb25vdXMgbmF0dXJl
LCBnaXZlbiB0aGF0IHRoZXkgYXJlIGJhY2tlZCBieSBoYXJkd2FyZSBETUEgdGhhdAo+IGNvbXBs
ZXRlcyBhc3luY2hyb25vdXNseSB3cnQgdGhlIGV4ZWN1dGlvbiBmbG93Lgo+IAo+IEhvd2V2ZXIs
IGluIG1hbnkgY2FzZXMsIGFueSBmYWxsYmFja3MgdGhleSBhbGxvY2F0ZSBhcmUgbGltaXRlZCB0
byB0aGUKPiBzeW5jaHJvbm91cyB2YXJpZXR5LCB3aGljaCBydWxlcyBvdXQgdGhlIHVzZSBvZiBT
SU1EIGltcGxlbWVudGF0aW9ucyBvZgo+IEFFUyBpbiBFQ0IsIENCQyBhbmQgWFRTIG1vZGVzLCBn
aXZlbiB0aGF0IHRoZXkgYXJlIHVzdWFsbHkgYnVpbHQgb24gdG9wCj4gb2YgdGhlIGFzeW5jaHJv
bm91cyBTSU1EIGhlbHBlciwgd2hpY2ggcXVldWVzIHJlcXVlc3RzIGZvciBhc3luY2hyb25vdXMK
PiBjb21wbGV0aW9uIGlmIHRoZXkgYXJlIGlzc3VlZCBmcm9tIGEgY29udGV4dCB0aGF0IGRvZXMg
bm90IHBlcm1pdCB0aGUgdXNlCj4gb2YgdGhlIFNJTUQgcmVnaXN0ZXIgZmlsZS4KPiAKPiBUaGlz
IG1heSByZXN1bHQgaW4gc3ViLW9wdGltYWwgQUVTIGltcGxlbWVudGF0aW9ucyB0byBiZSBzZWxl
Y3RlZCBhcwo+IGZhbGxiYWNrcywgb3IgZXZlbiBsZXNzIHNlY3VyZSBvbmVzIGlmIHRoZSBvbmx5
IHN5bmNocm9ub3VzIGFsdGVybmF0aXZlCj4gaXMgdGFibGUgYmFzZWQsIGFuZCB0aGVyZWZvcmUg
bm90IHRpbWUgaW52YXJpYW50Lgo+IAo+IFNvIHN3aXRjaCBhbGwgdGhlc2UgY2FzZXMgb3ZlciB0
byB0aGUgYXN5bmNocm9ub3VzIEFQSSwgYnkgbW92aW5nIHRoZQo+IHN1YnJlcXVlc3QgaW50byB0
aGUgc2tjaXBoZXIgcmVxdWVzdCBjb250ZXh0LCBhbmQgcGVybWl0dGluZyBpdCB0bwo+IGNvbXBs
ZXRlIGFzeW5jaHJvbm91c2x5IHZpYSB0aGUgY2FsbGVyIHByb3ZpZGVkIGNvbXBsZXRpb24gZnVu
Y3Rpb24uCj4gCj4gUGF0Y2ggIzEgaXMgbm90IHJlbGF0ZWQsIGJ1dCB0b3VjaGVzIHRoZSBzYW1l
IGRyaXZlciBhcyAjMiBzbyBpdCBpcwo+IGluY2x1ZGVkIGFueXdheS4gUGF0Y2ggIzEzIHJlbW92
ZXMgYW5vdGhlciBzeW5jIHNrY2lwaGVyIGFsbG9jYXRpb24gYnkKPiBzd2l0Y2hpbmcgdG8gdGhl
IEFFUyBsaWJyYXJ5IGludGVyZmFjZS4KPiAKPiB2NDoKPiAtIGFkZCBtaXNzaW5nIGtlcm5lbGRv
YyB1cGRhdGVzIGZvciBzdW44aS1jZSBhbmQgc3VuOGktc3MKPiAtIGFkZCBhY2tzIGZyb20gSG9y
aWEsIEphbWllIGFuZCBDb3JlbnRpbgo+IC0gcmViYXNlIG9udG8gY3J5cHRvZGV2L21hc3Rlcgo+
IAo+IHYzOgo+IC0gZGlzcmVnYXJkIHRoZSBmYWxsYmFjayBza2NpcGhlcl9yZXF1ZXN0IHdoZW4g
dGFraW5nIHRoZSByZXF1ZXN0IGNvbnRleHQgc2l6ZQo+ICAgZm9yIFRGTXMgdGhhdCBkb24ndCBu
ZWVkIHRoZSBmYWxsYmFjayBhdCBhbGwgKHBpY294Y2VsbCwgcWNlKQo+IC0gZml4IGVycm9yIGhh
bmRsaW5nIGluIGZhbGxiYWNrIHNrY2lwaGVyIGFsbG9jYXRpb24gYW5kIHJlbW92ZSBwb2ludGxl
c3MKPiAgIG1lbXNldCgpcyAocWNlKQo+IAo+IHYyOgo+IC0gYWRkcmVzcyBpc3N1ZSBmb3VuZCBi
eSBidWlsZCByb2JvdCBpbiBwYXRjaCAjNwo+IC0gYWRkIHBhdGNoICMxMwo+IC0gcmViYXNlIG9u
dG8gY3J5cHRvZGV2L21hc3Rlcgo+IAo+IENjOiBDb3JlbnRpbiBMYWJiZSA8Y2xhYmJlLm1vbnRq
b2llQGdtYWlsLmNvbT4KPiBDYzogQ29yZW50aW4gTGFiYmUgPGNsYWJiZUBiYXlsaWJyZS5jb20+
Cj4gQ2M6IEhlcmJlcnQgWHUgPGhlcmJlcnRAZ29uZG9yLmFwYW5hLm9yZy5hdT4KPiBDYzogIkRh
dmlkIFMuIE1pbGxlciIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+Cj4gQ2M6IE1heGltZSBSaXBhcmQg
PG1yaXBhcmRAa2VybmVsLm9yZz4KPiBDYzogQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3JnPgo+
IENjOiBUb20gTGVuZGFja3kgPHRob21hcy5sZW5kYWNreUBhbWQuY29tPgo+IENjOiBKb2huIEFs
bGVuIDxqb2huLmFsbGVuQGFtZC5jb20+Cj4gQ2M6IEF5dXNoIFNhd2FsIDxheXVzaC5zYXdhbEBj
aGVsc2lvLmNvbT4KPiBDYzogVmluYXkgS3VtYXIgWWFkYXYgPHZpbmF5LnlhZGF2QGNoZWxzaW8u
Y29tPgo+IENjOiBSb2hpdCBNYWhlc2h3YXJpIDxyb2hpdG1AY2hlbHNpby5jb20+Cj4gQ2M6IFNo
YXduIEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz4KPiBDYzogU2FzY2hhIEhhdWVyIDxzLmhhdWVy
QHBlbmd1dHJvbml4LmRlPgo+IENjOiBQZW5ndXRyb25peCBLZXJuZWwgVGVhbSA8a2VybmVsQHBl
bmd1dHJvbml4LmRlPgo+IENjOiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+Cj4g
Q2M6IE5YUCBMaW51eCBUZWFtIDxsaW51eC1pbXhAbnhwLmNvbT4KPiBDYzogSmFtaWUgSWxlcyA8
amFtaWVAamFtaWVpbGVzLmNvbT4KPiBDYzogRXJpYyBCaWdnZXJzIDxlYmlnZ2Vyc0Bnb29nbGUu
Y29tPgo+IENjOiBUZXJvIEtyaXN0byA8dC1rcmlzdG9AdGkuY29tPgo+IENjOiBNYXR0aGlhcyBC
cnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPgo+IENjOiBIb3JpYSBHZWFudMSDIDxob3Jp
YS5nZWFudGFAbnhwLmNvbT4KPiAKPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnCj4gQ2M6IGxpbnV4LW9tYXBAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IAo+IEFyZCBCaWVzaGV1dmVsICgxMyk6Cj4gICBjcnlw
dG86IGFtbG9naWMtZ3hsIC0gZGVmYXVsdCB0byBidWlsZCBhcyBtb2R1bGUKPiAgIGNyeXB0bzog
YW1sb2dpYy1neGwgLSBwZXJtaXQgYXN5bmMgc2tjaXBoZXIgYXMgZmFsbGJhY2sKPiAgIGNyeXB0
bzogb21hcC1hZXMgLSBwZXJtaXQgYXN5bmNocm9ub3VzIHNrY2lwaGVyIGFzIGZhbGxiYWNrCj4g
ICBjcnlwdG86IHN1bjRpIC0gcGVybWl0IGFzeW5jaHJvbm91cyBza2NpcGhlciBhcyBmYWxsYmFj
awo+ICAgY3J5cHRvOiBzdW44aS1jZSAtIHBlcm1pdCBhc3luY2hyb25vdXMgc2tjaXBoZXIgYXMg
ZmFsbGJhY2sKPiAgIGNyeXB0bzogc3VuOGktc3MgLSBwZXJtaXQgYXN5bmNocm9ub3VzIHNrY2lw
aGVyIGFzIGZhbGxiYWNrCj4gICBjcnlwdG86IGNjcCAtIHBlcm1pdCBhc3luY2hyb25vdXMgc2tj
aXBoZXIgYXMgZmFsbGJhY2sKPiAgIGNyeXB0bzogY2hlbHNpbyAtIHBlcm1pdCBhc3luY2hyb25v
dXMgc2tjaXBoZXIgYXMgZmFsbGJhY2sKPiAgIGNyeXB0bzogbXhzLWRjcCAtIHBlcm1pdCBhc3lu
Y2hyb25vdXMgc2tjaXBoZXIgYXMgZmFsbGJhY2sKPiAgIGNyeXB0bzogcGljb3hjZWxsIC0gcGVy
bWl0IGFzeW5jaHJvbm91cyBza2NpcGhlciBhcyBmYWxsYmFjawo+ICAgY3J5cHRvOiBxY2UgLSBw
ZXJtaXQgYXN5bmNocm9ub3VzIHNrY2lwaGVyIGFzIGZhbGxiYWNrCj4gICBjcnlwdG86IHNhaGFy
YSAtIHBlcm1pdCBhc3luY2hyb25vdXMgc2tjaXBoZXIgYXMgZmFsbGJhY2sKPiAgIGNyeXB0bzog
bWVkaWF0ZWsgLSB1c2UgQUVTIGxpYnJhcnkgZm9yIEdDTSBrZXkgZGVyaXZhdGlvbgo+IAo+ICBk
cml2ZXJzL2NyeXB0by9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgfCAgMyArLQo+ICAu
Li4vYWxsd2lubmVyL3N1bjRpLXNzL3N1bjRpLXNzLWNpcGhlci5jICAgICAgfCA0NiArKysrLS0t
LS0KPiAgZHJpdmVycy9jcnlwdG8vYWxsd2lubmVyL3N1bjRpLXNzL3N1bjRpLXNzLmggIHwgIDMg
Ky0KPiAgLi4uL2FsbHdpbm5lci9zdW44aS1jZS9zdW44aS1jZS1jaXBoZXIuYyAgICAgIHwgNDEg
KysrKy0tLS0KPiAgZHJpdmVycy9jcnlwdG8vYWxsd2lubmVyL3N1bjhpLWNlL3N1bjhpLWNlLmgg
IHwgIDggKy0KPiAgLi4uL2FsbHdpbm5lci9zdW44aS1zcy9zdW44aS1zcy1jaXBoZXIuYyAgICAg
IHwgMzkgKysrKy0tLS0KPiAgZHJpdmVycy9jcnlwdG8vYWxsd2lubmVyL3N1bjhpLXNzL3N1bjhp
LXNzLmggIHwgMjYgKystLS0KPiAgZHJpdmVycy9jcnlwdG8vYW1sb2dpYy9LY29uZmlnICAgICAg
ICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9jcnlwdG8vYW1sb2dpYy9hbWxvZ2ljLWd4bC1j
aXBoZXIuYyAgIHwgMjcgKysrLS0tCj4gIGRyaXZlcnMvY3J5cHRvL2FtbG9naWMvYW1sb2dpYy1n
eGwuaCAgICAgICAgICB8ICAzICstCj4gIGRyaXZlcnMvY3J5cHRvL2NjcC9jY3AtY3J5cHRvLWFl
cy14dHMuYyAgICAgICB8IDMzICsrKystLS0KPiAgZHJpdmVycy9jcnlwdG8vY2NwL2NjcC1jcnlw
dG8uaCAgICAgICAgICAgICAgIHwgIDQgKy0KPiAgZHJpdmVycy9jcnlwdG8vY2hlbHNpby9jaGNy
X2FsZ28uYyAgICAgICAgICAgIHwgNTcgKysrKystLS0tLS0KPiAgZHJpdmVycy9jcnlwdG8vY2hl
bHNpby9jaGNyX2NyeXB0by5oICAgICAgICAgIHwgIDMgKy0KPiAgZHJpdmVycy9jcnlwdG8vbWVk
aWF0ZWsvbXRrLWFlcy5jICAgICAgICAgICAgIHwgNjMgKystLS0tLS0tLS0tCj4gIGRyaXZlcnMv
Y3J5cHRvL214cy1kY3AuYyAgICAgICAgICAgICAgICAgICAgICB8IDMzICsrKy0tLS0KPiAgZHJp
dmVycy9jcnlwdG8vb21hcC1hZXMuYyAgICAgICAgICAgICAgICAgICAgIHwgMzUgKysrKy0tLQo+
ICBkcml2ZXJzL2NyeXB0by9vbWFwLWFlcy5oICAgICAgICAgICAgICAgICAgICAgfCAgMyArLQo+
ICBkcml2ZXJzL2NyeXB0by9waWNveGNlbGxfY3J5cHRvLmMgICAgICAgICAgICAgfCAzOCArKysr
LS0tLQo+ICBkcml2ZXJzL2NyeXB0by9xY2UvY2lwaGVyLmggICAgICAgICAgICAgICAgICAgfCAg
MyArLQo+ICBkcml2ZXJzL2NyeXB0by9xY2Uvc2tjaXBoZXIuYyAgICAgICAgICAgICAgICAgfCA0
MiArKysrLS0tLQo+ICBkcml2ZXJzL2NyeXB0by9zYWhhcmEuYyAgICAgICAgICAgICAgICAgICAg
ICAgfCA5NiArKysrKysrKystLS0tLS0tLS0tCj4gIDIyIGZpbGVzIGNoYW5nZWQsIDI4MCBpbnNl
cnRpb25zKCspLCAzMjggZGVsZXRpb25zKC0pCgpBbGwgYXBwbGllZC4gIFRoYW5rcy4KLS0gCkVt
YWlsOiBIZXJiZXJ0IFh1IDxoZXJiZXJ0QGdvbmRvci5hcGFuYS5vcmcuYXU+CkhvbWUgUGFnZTog
aHR0cDovL2dvbmRvci5hcGFuYS5vcmcuYXUvfmhlcmJlcnQvClBHUCBLZXk6IGh0dHA6Ly9nb25k
b3IuYXBhbmEub3JnLmF1L35oZXJiZXJ0L3B1YmtleS50eHQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
