Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B08606A331
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Nov 2026 15:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RwGbrz09
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uJtSsPjlPxK5pCRKyBU3ZoOkjIe6V2yLucZekWAb6ds=; b=RwGbrz093/XsdbZF7Zq8bggqCK
	v6dfIR3fymLPNaEHPitk8WPLQTl2yizXNrcPZ1oGr+XVd8gpKksKT1htnpx48L7CwkN+8nDvu4H+Y
	rQmzQCbVXE9MugJ3Pbp2Jego8OXRKEpoHL0TASDRWqof02FrhonOs/82/j5PV8q532ue+tmE8j27V
	kK9FbIwMCKzkBO+nMBNRHcWlGY0acFkL/M5TzI3+vyFNYXyqur7TnqJZlbBJtyduR0vVUv7e7R984
	i70XJzL4s7Nfo4kWvNhClAGgGcfRSh7sfB5SGkW19taN2aq/+V5C2xEaIR80hvWXQ2ZFEuHRQITw0
	KEoduXAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRX0-000000013pD-2JX2;
	Mon, 09 Nov 2026 15:43:38 +0000
Received: from mail-yx1-f45.google.com ([74.125.224.45])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRWu-000000013oO-3Y5j
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Nov 2026 15:43:35 +0000
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67bec5dc8d4so600930d50.0
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Nov 2026 07:43:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239004; x=1794843804;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQ4LVrS7TAycIWuwYP6nLPokX8EbBu04NF8VpAWRnUc=;
        b=MdXcaBMrSomDMXH44PRH2zmfVOFkc0SKlaS2sPWNaNAzOZEHLnLGGnEyr5PawgoDIB
         YZBciyneX4RchcnKUjEOo/cDu4pPSWlaM8Fl0hNyDX4uk5nPUsDYZp1LroOzUEuARuiQ
         b0iGIf6+yHeR0sBrBpln+C8AhKBbJLH5nQM1hp45v0C05YY3KgDDd3xScFBLTVtujY46
         BsmuH7lwWgzIXjlLMpNuQyGMoFxuuLvMMGDcNs/i1C3UvBYvrl5/2nSVmgjlffahEkKY
         l5oCUD85ORi+RLZAooaMEQvhdKjDrJHthklF4q3MLcjm9Dem3rCTTxMgmhpGm4LYThPF
         A7qQ==
X-Forwarded-Encrypted: i=1; AL+hErGZKBDuTERb72mM1plnvvkPpPNY1KBeg9C2o2Jrn4NhnergBEFlJTF/pBbJgCCLgoq4IkA2TDL7vYONIqJS@lists.infradead.org
X-Gm-Message-State: APuU4Z/ilJuFVoOaK7Ril/Bqk6MoPcjDWsIpXdG4ncKpTdG7PXxgZTpx
	vSjSt9toNr0zDX2X5NbtDDZ8oqknBLjRcD+AWKeI8rw0bRkWaHRldExUs3bgSHZf
X-Gm-Gg: AYBFou2QHEBGZm5tls1Wqa4pR7rCviestE6pxG+xN+VmPMbFAD3MGbl/+o21/Npc0AN
	8gHz4bwizcABj1+ZCEtlFRHqtdq4RvYyK8TJkW7Z9ftAWDgnyTWKvy95sVMDKvjXOfcZa6NAhN9
	/B8MeBoeeSK672zaxfxRYXr0b3dADJKokXJESVc0f0ry3kHj2JDS8gKl/DcUQ+dJwX4/HomjkJx
	e9HM7Ugr0R1jwtyRH6vNpqsIGW9pX/eWUjFr7T9Dwuqyfgm0KdnYb3oxtfwv4t1J7AHaWmnNjn2
	cwmTzgbU/1DPgEJgjD/8ZE/bSAPoMiOhi2/gOy+F+CFJYZ//FSx2DEEcdqS/wUNucOn9s59FZpF
	Z2UUIgm/aWi4T3LWh/Rx7ROVmrTNLGFH8zwLDneeURL/9o/1WuVfPO66DMAfP5dXP6XNS1Z/z3A
	+qGBKEIXna27IjP7bn4SM/J/S/fobI7ii6+Oyd5l1/nwOf6sNFXDLS4l6umHO4wrpPmpaxxXMmh
	KHjg42KsEBl+8+nkErjubIUAbedUFGxiqRfns1cCCZ9naIcfahVnrucCJYhQceIH5N8T5NreRPE
	AcquZfU79ow3E/mYpMlwZqaw1ptEF4d2iUEgi8+80M2tGZ9IsyQwy12dr07XKXak
X-Received: by 2002:a05:690e:44a3:b0:67c:7f7:208f with SMTP id 956f58d0204a3-67c3da6889amr2070289d50.87.1794239004706;
        Mon, 09 Nov 2026 07:43:24 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c3b95cf4bsm4182503d50.16.2026.11.09.07.43.24
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:43:24 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b300713befso7514657b3.1
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Nov 2026 07:43:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHWPmdZhm7CMkpz9q33XgsyiNnU/i2aqida0auFqETdwbkDbaNJ+KtJiiLU7ozM9BfcBLhkDeBN54s939bZ@lists.infradead.org
X-Received: by 2002:a05:690c:e3ce:b0:8b3:56f0:38d1 with SMTP id
 00721157ae682-8b36c854704mr28695777b3.3.1794239004423; Mon, 09 Nov 2026
 07:43:24 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103163715.385394-1-tanure@linux.com> <20261103163715.385394-3-tanure@linux.com>
 <20261105-stoic-cricket-of-tolerance-cb3014@quoll> <35dc1ebf-5194-4ec8-adfb-dcc8ea717750@amlogic.com>
In-Reply-To: <35dc1ebf-5194-4ec8-adfb-dcc8ea717750@amlogic.com>
From: Lucas Tanure <tanure@linux.com>
Date: Mon, 9 Nov 2026 15:43:13 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+0QqBHGv-4nfmY8N_xr=KQgUFtwPQTVZBxTK1LHV0jGOQ@mail.gmail.com>
X-Gm-Features: AclHuK8i80yCCEWCPsmXh9g28kddZ8mRpDlp24I5tNty5i0jlojD6mTpEXhkklk
Message-ID: <CAJX_Q+0QqBHGv-4nfmY8N_xr=KQgUFtwPQTVZBxTK1LHV0jGOQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, xianwei.zhao@amlogic.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_074333_019049_51166987 
X-CRM114-Status: GOOD (  28.26  )
X-Spam-Score: -0.8 (/)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBOb3YgNiwgMjAyNiBhdCAzOjE24oCvQU0gQ2h1YW4gTGl1IDxjaHVhbi5saXVAYW1s
b2dpYy5jb20+IHdyb3RlOgo+Cj4gSGkgS3J6eXN6dG9mLCBMdWNhcywKPgo+IE9uIDExLzUvMjAy
NiA3OjU3IFBNLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+ID4gWyBFWFRFUk5BTCBFTUFJ
TCBdCj4gPgo+ID4gT24gVHVlLCBOb3YgMDMsIDIwMjYgYXQgMDQ6Mzc6MTBQTSArMDAwMCwgTHVj
YXMgVGFudXJlIHdyb3RlOgo+ID4+Cj4gPj4gQXNzaXN0ZWQtYnk6IExMTQo+ID4KPiA+IERyb3Ag
dGhpcyBvbmUuCj4gPgo+ID4+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIFRhbnVyZSA8dGFudXJlQGxp
bnV4LmNvbT4KPiA+PiAtLS0KPiA+PiAgIC4uLi9iaW5kaW5ncy9uZXQvYW1sb2dpYyxtZXNvbi1k
d21hYy55YW1sICAgICB8IDU5ICsrKysrKysrKysrKysrKysrKysKPiA+PiAgIDEgZmlsZSBjaGFu
Z2VkLCA1OSBpbnNlcnRpb25zKCspCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9hbWxvZ2ljLG1lc29uLWR3bWFjLnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2FtbG9naWMsbWVzb24tZHdtYWMueWFt
bAo+ID4+IGluZGV4IGU3NjljOWJiNzBkOC4uNmRlMDEzZTNlOGY2IDEwMDY0NAo+ID4+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvYW1sb2dpYyxtZXNvbi1kd21h
Yy55YW1sCj4gPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9h
bWxvZ2ljLG1lc29uLWR3bWFjLnlhbWwKPiA+PiBAQCAtMjMsNiArMjMsNyBAQCBzZWxlY3Q6Cj4g
Pj4gICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWd4YmItZHdtYWMKPiA+PiAgICAgICAgICAg
ICAtIGFtbG9naWMsbWVzb24tYXhnLWR3bWFjCj4gPj4gICAgICAgICAgICAgLSBhbWxvZ2ljLG1l
c29uLWcxMmEtZHdtYWMKPiA+PiArICAgICAgICAgIC0gYW1sb2dpYyx0Ny1kd21hYwo+ID4+ICAg
ICByZXF1aXJlZDoKPiA+PiAgICAgICAtIGNvbXBhdGlibGUKPiA+Pgo+ID4+IEBAIC01Nyw2ICs1
OCw1OSBAQCBhbGxPZjoKPiA+PiAgICAgICAgICAgICAgIC0gY29uc3Q6IGNsa2luMQo+ID4+ICAg
ICAgICAgICAgICAgLSBjb25zdDogdGltaW5nLWFkanVzdG1lbnQKPiA+Pgo+ID4+ICsgIC0gaWY6
Cj4gPj4gKyAgICAgIHByb3BlcnRpZXM6Cj4gPj4gKyAgICAgICAgY29tcGF0aWJsZToKPiA+PiAr
ICAgICAgICAgIGNvbnRhaW5zOgo+ID4+ICsgICAgICAgICAgICBjb25zdDogYW1sb2dpYyx0Ny1k
d21hYwo+ID4+ICsgICAgdGhlbjoKPiA+PiArICAgICAgcHJvcGVydGllczoKPiA+PiArICAgICAg
ICBjbG9ja3M6Cj4gPj4gKyAgICAgICAgICBpdGVtczoKPiA+PiArICAgICAgICAgICAgLSBkZXNj
cmlwdGlvbjogR01BQyBtYWluIGNsb2NrCj4gPj4gKyAgICAgICAgICAgIC0gZGVzY3JpcHRpb246
IEZpcnN0IHBhcmVudCBjbG9jayBvZiB0aGUgaW50ZXJuYWwgbXV4Cj4gPj4gKyAgICAgICAgICAg
IC0gZGVzY3JpcHRpb246IFNlY29uZCBwYXJlbnQgY2xvY2sgb2YgdGhlIGludGVybmFsIG11eAo+
ID4+ICsgICAgICAgICAgICAtIGRlc2NyaXB0aW9uOgo+ID4+ICsgICAgICAgICAgICAgICAgY2xv
Y2sgb2YgdGhlIHBpcGVsaW5lIHN0YWdlIGluc2VydGVkIGluIHRoZSBidXMgcGF0aCBiZXR3ZWVu
Cj4gPj4gKyAgICAgICAgICAgICAgICB0aGUgY29udHJvbGxlciBhbmQgdGhlIERSQU0uIFdpdGhv
dXQgaXQsIHRoZSBjb250cm9sbGVyIGNhbm5vdAo+ID4+ICsgICAgICAgICAgICAgICAgY29tcGxl
dGUgRE1BIHRyYW5zZmVycy4KPiA+PiArICAgICAgICAgICAgLSBkZXNjcmlwdGlvbjoKPiA+PiAr
ICAgICAgICAgICAgICAgIGNsb2NrIG9mIHRoZSByZWdpc3RlciBibG9jayBob2xkaW5nIFBSR19F
VEgwIGFuZCBQUkdfRVRIMS4KPiA+PiArICAgICAgICAgICAgICAgIFdpdGhvdXQgaXQsIHRoZSBi
bG9jayByZWFkcyBhcyB6ZXJvIGFuZCBpZ25vcmVzIHdyaXRlcy4KPiA+Cj4gPiBUaGlzIHNvdW5k
cyBsaWtlIHlvdSB0YWtlIGNsb2NrIGZyb20gb3RoZXIgYmxvY2suIFRoYXQncyB3cm9uZywgdGhh
dAo+ID4gZGV2aWNlIHNob3VsZCB0YWtlIGl0cyBvd24gY2xvY2suCj4KPiBJIHNlZSB0aGF0IHRo
ZSBjbG9jayBpbiB0aGUgZHRzIHBhdGNoIGNvcnJlc3BvbmRzIHRvIDwmY2xrY19wZXJpcGhzCj4g
Q0xLSURfU1lTX0VUSFBIWT4uIFRoaXMgY2xvY2sgcHJvdmlkZXMgdGhlIHdvcmtpbmcgY2xvY2sg
Zm9yIHRoZSBBUEIgQnVzCj4gb2YgdGhlIEVUSCBQSFkgY29udHJvbGxlciwgYW5kIHRoaXMgY2xv
Y2sgd2lsbCBhZmZlY3QgdGhlIHJlZ2lzdGVyCj4gcmVhZGluZyBhbmQgd3JpdGluZyBvZiB0aGUg
RVRIIFBIWSAoaW5jbHVkaW5nIHRoZSBFVEhfUExMKS4gU2VlIHNlY3Rpb24KPiAxNS4zLjQuMiBS
ZWdpc3RlckRlc2NyaXB0aW9uIGluIEEzMTFEMiBEYXRhc2hlZXQgZm9yIGRldGFpbHMuCgpUaGFu
a3MuIFRoYXQgc2VjdGlvbiBpcyB0aGUgUEhZIGJsb2NrIGF0IDB4ZmUwMjgwMDAsIHRoZSByZWdp
b24gb2YgdGhlCm1kaW8gbXVsdGlwbGV4ZXIgbm9kZS4gVGhlIHJlZ2lzdGVycyBpbiB0aGlzIGRl
c2NyaXB0aW9uIGFyZSBQUkdfRVRIMAphbmQgUFJHX0VUSDEgaW4gZXRoX3RvcCBhdCAweGZlMDI0
MDAwLiBPbiB0aGUgVklNNCB0aGUgc2FtZSBnYXRlIGZlZWRzCnRoZW0gdG9vOiB3aXRoIGl0IG9m
ZiB0aGV5IHJlYWQgYXMgemVybyBhbmQgaWdub3JlIHdyaXRlcy4gTXkgZGF0YXNoZWV0CnJldmlz
aW9ucyBkbyBub3Qgc2F5IHdoaWNoIGNsb2NrIGZlZWRzIGV0aF90b3AuIENhbiB5b3UgY29uZmly
bSBpdCBpcwp0aGlzIG9uZT8KClRoYW5rcywKTHVjYXMKCj4KPiA+Cj4gPgo+ID4+ICsKPiA+PiAr
ICAgICAgICBjbG9jay1uYW1lczoKPiA+PiArICAgICAgICAgIGl0ZW1zOgo+ID4+ICsgICAgICAg
ICAgICAtIGNvbnN0OiBzdG1tYWNldGgKPiA+PiArICAgICAgICAgICAgLSBjb25zdDogY2xraW4w
Cj4gPj4gKyAgICAgICAgICAgIC0gY29uc3Q6IGNsa2luMQo+ID4+ICsgICAgICAgICAgICAtIGNv
bnN0OiBwaXBlbGluZQo+ID4+ICsgICAgICAgICAgICAtIGNvbnN0OiBwY2xrCj4gPj4gKwo+ID4+
ICsgICAgICAgICMgVGhlIFBIWSBhZGRzIHRoZSAybnMgUkdNSUkgZGVsYXlzLCBzZWUgZXRoZXJu
ZXQtY29udHJvbGxlci55YW1sLgo+ID4+ICsgICAgICAgICMgVGhlIFJYIGRlbGF5IGxpbmUgb2Yg
dGhpcyBnbHVlIGlzIGZpbmUgdHVuaW5nIGluIDIwMHBzIHN0ZXBzLAo+ID4+ICsgICAgICAgICMg
YWRkZWQgb24gdG9wIG9mIHdoYXQgcGh5LW1vZGUgZGVzY3JpYmVzLiBUaGUgVFggc2lkZSBoYXMg
bm8gZmluZQo+ID4+ICsgICAgICAgICMgdHVuaW5nOiBpdHMgb25seSBzdGVwIGlzIGEgcXVhcnRl
ciBvZiB0aGUgY2xvY2sgcGVyaW9kLCB0aGUgZnVsbAo+ID4+ICsgICAgICAgICMgMm5zIGF0IDFH
Yml0L3MsIHNvIHRoZSBUWCBwcm9wZXJ0eSBpcyBub3QgYWNjZXB0ZWQuCj4gPj4gKyAgICAgICAg
dHgtaW50ZXJuYWwtZGVsYXktcHM6IGZhbHNlCj4gPj4gKwo+ID4+ICsgICAgICAgICMgRGVwcmVj
YXRlZDogbmV3IFNvQ3MgdXNlIHRoZSBzdGFuZGFyZCAqLWludGVybmFsLWRlbGF5LXBzCj4gPj4g
KyAgICAgICAgIyBwcm9wZXJ0aWVzIGluc3RlYWQuCj4gPj4gKyAgICAgICAgYW1sb2dpYyx0eC1k
ZWxheS1uczogZmFsc2UKPiA+PiArICAgICAgICBhbWxvZ2ljLHJ4LWRlbGF5LW5zOiBmYWxzZQo+
ID4+ICsKPiA+PiArICAjIERlbGF5IGRlZmluaXRpb25zIGZvciBNZXNvbjhiIGFuZCBuZXdlcgo+
ID4+ICsgIC0gaWY6Cj4gPj4gKyAgICAgIHByb3BlcnRpZXM6Cj4gPj4gKyAgICAgICAgY29tcGF0
aWJsZToKPiA+PiArICAgICAgICAgIGNvbnRhaW5zOgo+ID4+ICsgICAgICAgICAgICBlbnVtOgo+
ID4+ICsgICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbjhiLWR3bWFjCj4gPj4gKyAgICAgICAg
ICAgICAgLSBhbWxvZ2ljLG1lc29uOG0yLWR3bWFjCj4gPj4gKyAgICAgICAgICAgICAgLSBhbWxv
Z2ljLG1lc29uLWd4YmItZHdtYWMKPiA+PiArICAgICAgICAgICAgICAtIGFtbG9naWMsbWVzb24t
YXhnLWR3bWFjCj4gPj4gKyAgICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWcxMmEtZHdtYWMK
PiA+PiArICAgIHRoZW46Cj4gPj4gKyAgICAgIHByb3BlcnRpZXM6Cj4gPj4gICAgICAgICAgIGFt
bG9naWMsdHgtZGVsYXktbnM6Cj4gPj4gICAgICAgICAgICAgZW51bTogWzAsIDIsIDQsIDZdCj4g
Pj4gICAgICAgICAgICAgZGVmYXVsdDogMgo+ID4+IEBAIC0xMDYsNiArMTYwLDcgQEAgYWxsT2Y6
Cj4gPj4gICAgICAgICAgICAgY29udGFpbnM6Cj4gPj4gICAgICAgICAgICAgICBlbnVtOgo+ID4+
ICAgICAgICAgICAgICAgICAtIGFtbG9naWMsbWVzb24tZzEyYS1kd21hYwo+ID4+ICsgICAgICAg
ICAgICAgIC0gYW1sb2dpYyx0Ny1kd21hYwo+ID4+ICAgICAgIHRoZW46Cj4gPj4gICAgICAgICBw
cm9wZXJ0aWVzOgo+ID4+ICAgICAgICAgICByeC1pbnRlcm5hbC1kZWxheS1wczoKPiA+PiBAQCAt
MTQyLDYgKzE5NywxMCBAQCBwcm9wZXJ0aWVzOgo+ID4+ICAgICAgICAgLSBpdGVtczoKPiA+PiAg
ICAgICAgICAgICAtIGNvbnN0OiBhbWxvZ2ljLG1lc29uNi1kd21hYwo+ID4+ICAgICAgICAgICAg
IC0gY29uc3Q6IHNucHMsZHdtYWMKPiA+PiArICAgICAgLSBpdGVtczoKPiA+PiArICAgICAgICAg
IC0gY29uc3Q6IGFtbG9naWMsdDctZHdtYWMKPiA+PiArICAgICAgICAgIC0gY29uc3Q6IHNucHMs
ZHdtYWMtNS4xMGEKPiA+PiArICAgICAgICAgIC0gY29uc3Q6IHNucHMsZHdtYWMKPiA+Cj4gPiBJ
IHNlZSBubyBzdWNoIGh1bmsgaW4gdGhlIGNvZGUsIHNvIG5vdCBzdXJlIGhvdyB0byByZXZpZXcg
dGhpcy4KPiA+Cj4gPiBCZXN0IHJlZ2FyZHMsCj4gPiBLcnp5c3p0b2YKPiA+Cj4gPgo+ID4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0Cj4gPiBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
PiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo+Cj4gLS0KPiBCZXN0IHJlZ2FyZHMsCj4gQ2h1YW4KPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
