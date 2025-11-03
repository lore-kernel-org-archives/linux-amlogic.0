Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC849CCFA04
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Nov 2025 10:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gp5eSoB24K/wieFP86pph/zVmy+DnHa4kJQoh0LRxAQ=; b=O/tRzBhiWJ/hnz
	u7nkrF4DBGreP7CcrvvafGliXBN/AHnn0snMY/FUXr+Uxix1OSrVPGIVg8zHwtuoyUtvgkUC0Eumf
	6nnJ4/DO8To+ylBJ5Nwr3b0oLeydg2uj/KXPxgC7or0EdruTubW98c0O9Lk025aZI5AN6p+dVkz8G
	nu+CS2JGcSoCLPzT5BlcWgaD6Oaj7hA7ZqdpDDC1ajQ5VOPbgCey+2dAAdf1elbZKLCqP7bk8b7K5
	6UeMEL4PqjyB9X28TAY2RRFuoGRRdPOix4zcGeAlULkdDb6mjJB0Lj3BRcSvfo2Cmtovf0I6gJtWD
	+WvuPu8qF8EzV7aRDS/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrYl-00000009a97-1Pen;
	Mon, 03 Nov 2025 10:13:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrYk-00000009a8n-05Xp;
	Mon, 03 Nov 2025 10:13:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 23CAA60007;
	Mon,  3 Nov 2025 10:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DCD2C4CEE7;
	Mon,  3 Nov 2025 10:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762164788;
	bh=3HvSwd3Hdi/gWECtVw0p3KFzqcxgB2PNYUbt+Yyqiyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eI+/sVQ9SlsH4jxh7ldDJPSzl9u1cyTsFagb7+gvmUh4ExL/zDq0bf1Gbvmp5sPSx
	 PxOyHzDt9E/jVv2OmRkPvGEqzu1k2oujSXANHPm55HKlbab005K9610paGE/jgx9TW
	 M6hQTPI06hlYMNQX/ikArLJ0f1JHblDl5xEcz9EXYY7E798ASikJD+vbmD2II+gdxg
	 PBGbA1BQfNdMFMtvDfCgz/DPrYIJFUoPL1O4ODwd2uR7tdRhknbXeVXvi5vkO2eNxI
	 q0s58Y/m24NQnWTfX5sgkHF3IP/b2lDmSmuoX9GhlxwpFYy386TOHtXf9vpc/W15tl
	 h9byOjeJtFrUQ==
Date: Mon, 3 Nov 2025 15:42:58 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hanjie Lin <hanjie.lin@amlogic.com>, Yue Wang <yue.wang@amlogic.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Andrew Murray <amurray@thegoodpenguin.co.uk>, 
	Jingoo Han <jingoohan1@gmail.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH RESEND 1/3] dt-bindings: PCI: amlogic: Fix the register
 name of the DBI region
Message-ID: <rguwscxck7vel3hjdd2hlkypzdbwdvafdryxtz5benweduh4eg@sny4rr2nx5aq>
References: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
 <20251101-pci-meson-fix-v1-1-c50dcc56ed6a@oss.qualcomm.com>
 <31271df3-73e1-4eea-9bba-9e5b3bf85409@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <31271df3-73e1-4eea-9bba-9e5b3bf85409@linaro.org>
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

T24gTW9uLCBOb3YgMDMsIDIwMjUgYXQgMTA6NDc6MzZBTSArMDEwMCwgTmVpbCBBcm1zdHJvbmcg
d3JvdGU6Cj4gSGkgTWFuaSwKPiAKPiBPbiAxMS8xLzI1IDA1OjI5LCBNYW5pdmFubmFuIFNhZGhh
c2l2YW0gd3JvdGU6Cj4gPiBCaW5kaW5nIGluY29ycmVjdGx5IHNwZWNpZmllcyB0aGUgJ0RCSScg
cmVnaW9uIGFzICdFTEJJJy4gREJJIGlzIGEgbXVzdAo+ID4gaGF2ZSByZWdpb24gZm9yIERXQyBj
b250cm9sbGVycyBhcyBpdCBoYXMgdGhlIFJvb3QgUG9ydCBhbmQgY29udHJvbGxlcgo+ID4gc3Bl
Y2lmaWMgcmVnaXN0ZXJzLCB3aGlsZSBFTEJJIGhhcyBvcHRpb25hbCByZWdpc3RlcnMuCj4gPiAK
PiA+IEhlbmNlLCBmaXggdGhlIGJpbmRpbmcuIFRob3VnaCB0aGlzIGlzIGFuIEFCSSBicmVhaywg
dGhpcyBjaGFuZ2UgaXMgbmVlZGVkCj4gPiB0byBhY2N1cmF0ZWx5IGRlc2NyaWJlIHRoZSBQQ0kg
bWVtb3J5IG1hcC4KPiAKPiBOb3QgZmFuIG9mIHRoaXMgQUJJIGJyZWFrLCB0aGUgY3VycmVudCBi
aW5kaW5ncyBzaG91bGQgYmUgbWFya2VkIGFzIGRlcHJlY2F0ZWQgaW5zdGVhZC4KPiAKCkZhaXIg
ZW5vdWdoLiBXaWxsIG1ha2UgaXQgYXMgZGVwcmVjYXRlZC4KCi0gTWFuaQoKPiA+IAo+ID4gRml4
ZXM6IDdjZDIxMDM5MTEwMSAoImR0LWJpbmRpbmdzOiBQQ0k6IG1lc29uOiBhZGQgRFQgYmluZGlu
Z3MgZm9yIEFtbG9naWMgTWVzb24gUENJZSBjb250cm9sbGVyIikKPiA+IFNpZ25lZC1vZmYtYnk6
IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNpdmFtQG9zcy5xdWFsY29t
bS5jb20+Cj4gPiAtLS0KPiA+ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bj
aS9hbWxvZ2ljLGF4Zy1wY2llLnlhbWwgfCA2ICsrKy0tLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9hbWxvZ2ljLGF4Zy1wY2llLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL2FtbG9naWMsYXhnLXBjaWUu
eWFtbAo+ID4gaW5kZXggNzlhMjFiYTBmOWZkNjI4MDRiYTk1ZmU4YTZjYzMyNTJjZjY1MjE5Ny4u
YzgyNThlZjQwMzI4MzRkODdjZjMxNjBmZmQxZDkzODEyODAxYjYyYSAxMDA2NDQKPiA+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvYW1sb2dpYyxheGctcGNpZS55
YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL2FtbG9n
aWMsYXhnLXBjaWUueWFtbAo+ID4gQEAgLTM2LDEzICszNiwxMyBAQCBwcm9wZXJ0aWVzOgo+ID4g
ICAgIHJlZzoKPiA+ICAgICAgIGl0ZW1zOgo+ID4gLSAgICAgIC0gZGVzY3JpcHRpb246IEV4dGVy
bmFsIGxvY2FsIGJ1cyBpbnRlcmZhY2UgcmVnaXN0ZXJzCj4gPiArICAgICAgLSBkZXNjcmlwdGlv
bjogRGF0YSBCdXMgSW50ZXJmYWNlIHJlZ2lzdGVycwo+ID4gICAgICAgICAtIGRlc2NyaXB0aW9u
OiBNZXNvbiBkZXNpZ25lZCBjb25maWd1cmF0aW9uIHJlZ2lzdGVycwo+ID4gICAgICAgICAtIGRl
c2NyaXB0aW9uOiBQQ0llIGNvbmZpZ3VyYXRpb24gc3BhY2UKPiA+ICAgICByZWctbmFtZXM6Cj4g
PiAgICAgICBpdGVtczoKPiA+IC0gICAgICAtIGNvbnN0OiBlbGJpCj4gPiArICAgICAgLSBjb25z
dDogZGJpCj4gPiAgICAgICAgIC0gY29uc3Q6IGNmZwo+ID4gICAgICAgICAtIGNvbnN0OiBjb25m
aWcKPiA+IEBAIC0xMTMsNyArMTEzLDcgQEAgZXhhbXBsZXM6Cj4gPiAgICAgICBwY2llOiBwY2ll
QGY5ODAwMDAwIHsKPiA+ICAgICAgICAgICBjb21wYXRpYmxlID0gImFtbG9naWMsYXhnLXBjaWUi
LCAic25wcyxkdy1wY2llIjsKPiA+ICAgICAgICAgICByZWcgPSA8MHhmOTgwMDAwMCAweDQwMDAw
MD4sIDwweGZmNjQ2MDAwIDB4MjAwMD4sIDwweGY5ZjAwMDAwIDB4MTAwMDAwPjsKPiA+IC0gICAg
ICAgIHJlZy1uYW1lcyA9ICJlbGJpIiwgImNmZyIsICJjb25maWciOwo+ID4gKyAgICAgICAgcmVn
LW5hbWVzID0gImRiaSIsICJjZmciLCAiY29uZmlnIjsKPiA+ICAgICAgICAgICBpbnRlcnJ1cHRz
ID0gPEdJQ19TUEkgMTc3IElSUV9UWVBFX0VER0VfUklTSU5HPjsKPiA+ICAgICAgICAgICBjbG9j
a3MgPSA8JnBjbGs+LCA8JmNsa19wb3J0PiwgPCZjbGtfcGh5PjsKPiA+ICAgICAgICAgICBjbG9j
ay1uYW1lcyA9ICJwY2xrIiwgInBvcnQiLCAiZ2VuZXJhbCI7Cj4gPiAKPiAKCi0tIArgrq7grqPg
rr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
