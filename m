Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF6F606A326
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2026 15:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tf8wdYlM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ceD5yTLO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RyCUBi0IPnCSQUFdHTgrwUiHwb9XzDh8qcUg50Fpdos=; b=Tf8wdYlMJWHLZbldcBigG4nZBV
	vl2TFPf7X5SJEMS4k+tlHBtUarN6VM9UCl2hJ1kU+H+QPHwb3u6RmhSOTlnooaLuPGAYzhhMiXNOj
	HOnDUJdsPtF2b91qNTnDqhnUny6kt9nlOcfktWncv6rgktDmhPQyWKFZMB5uT/vlXVVVlGunAA8e0
	nJ07re/R+dd5ISNgiQ/wwQfutTGoWTO37HPwMYQrNd5ByErn699cNvscIEcN/soQxqAbIsGLGP7NM
	kJNgszE8hL/3+53XpMFmQPyIlIiWZxR6cFmREmWaQlcRRPxtW5CG8nVrMzPtFfjcz+SFRHFfF+q37
	awUPiSMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMo9q-0000000BwFh-1KSh;
	Fri, 30 Oct 2026 15:04:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMo9p-0000000BwFY-0qhn
	for linux-amlogic@lists.infradead.org;
	Fri, 30 Oct 2026 15:04:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BFB943AD9;
	Fri, 30 Oct 2026 15:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B4771F00A16;
	Fri, 30 Oct 2026 15:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793372680;
	bh=FpRl2xEs1L075uzBSla8lvGnRfjSpHTa30lYePiaivY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ceD5yTLOTmKrixJeFYAWUhrYQL3aFbsY//+Ci7PQbHrY4nurTIE3e6XQ/522D/8Q0
	 zVSc5ZePhnPU+nS8lAfLy60s1Cj4+HBSq1dLK0/ZXVtIU8+mJWwvgo3U6gOMJ9MXMm
	 YpeLc7N9j3LLrr+8onfiKyZAPFAqdbx2Z8ikki4P67ljpECtjCabZxfjRG4Fq8pDIa
	 1J8kT+DDVlKqAKOVwq5YF3Bt2+fSc/Nao4UGXi+trLKY/wVEeJlQICEYFu1rLQ6oyN
	 M9coUhAEnPZR4h/fzswYuNIEWYk1LbZQTxWkG0MPRzTqC+eor3UshkU89NiWC+oBxX
	 prgXELns7BHEg==
Date: Fri, 30 Oct 2026 10:04:35 -0500
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: sashiko-reviews@lists.linux.dev, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org,
	neil.armstrong@linaro.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: hcd: Add downstream USB ports
Message-ID: <20261030150435.GA3992442-robh@kernel.org>
References: <20261014082037.1774672-1-wenst@chromium.org>
 <20261014082037.1774672-2-wenst@chromium.org>
 <sashiko-outbox-171010@kernel.org>
 <CAGXv+5EuYc3iEpwNDNX+Sa2QXnPNe_C0HHH1PCy+j2vyV88xuA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGXv+5EuYc3iEpwNDNX+Sa2QXnPNe_C0HHH1PCy+j2vyV88xuA@mail.gmail.com>
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBPY3QgMTQsIDIwMjYgYXQgMDc6MTY6NTFQTSArMDkwMCwgQ2hlbi1ZdSBUc2FpIHdy
b3RlOgo+IE9uIFdlZCwgT2N0IDE0LCAyMDI2IGF0IDU6MzHigK9QTSA8c2FzaGlrby1ib3RAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEg
U2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6
Cj4gPiAtIFtNZWRpdW1dIGR0LWJpbmRpbmdzOiB1c2I6IHBvcnRAMCBzY2hlbWEgY29uc3RyYWlu
dCBieXBhc3NlZAo+ID4gLS0KPiA+Cj4gPiBjb21taXQgYWFhNjEwNzY2M2Y0ZDUyNGMyNjZjM2Ex
ODI2NGM0MTZhODZhNGJiNAo+ID4gQXV0aG9yOiBDaGVuLVl1IFRzYWkgPHdlbnN0QGNocm9taXVt
Lm9yZz4KPiA+Cj4gPiBkdC1iaW5kaW5nczogdXNiOiBoY2Q6IEFkZCBkb3duc3RyZWFtIFVTQiBw
b3J0cwo+ID4KPiA+IFRoaXMgY29tbWl0IGFkZHMgYSAicG9ydHMiIGNoaWxkIG5vZGUgdG8gdGhl
IFVTQiBIQ0QgYmluZGluZyB0byBzdXBwb3J0Cj4gPiBjb25uZWN0aW5nIGRvd25zdHJlYW0gVVNC
IGNvbm5lY3RvciBub2RlcyB2aWEgT0YgZ3JhcGguIEl0IGF0dGVtcHRzIHRvIGVuZm9yY2UKPiA+
IHRoYXQgVVNCIGRvd25zdHJlYW0gcG9ydCBudW1iZXJzIHN0YXJ0IGF0IDEsIGFuZCB1cGRhdGVz
IHRoZSBhZGRyZXNzIG1hdGNoaW5nCj4gPiBmb3IgaGFyZC13aXJlZCBkb3duc3RyZWFtIGRldmlj
ZXMuCj4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3VzYi91c2ItaGNkLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
dXNiL3VzYi1oY2QueWFtbAo+ID4gPiBpbmRleCA0NWExOWQ0OTI4YWZhLi4yNGRmOTlkZmIyNDNj
IDEwMDY0NAo+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNi
L3VzYi1oY2QueWFtbAo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvdXNiL3VzYi1oY2QueWFtbAo+ID4gPiBAQCAtMjksOCArMjksMTYgQEAgcHJvcGVydGllczoK
PiA+ID4gICAgIiNzaXplLWNlbGxzIjoKPiA+ID4gICAgICBjb25zdDogMAo+ID4gPgo+ID4gPiAr
ICBwb3J0czoKPiA+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVz
L3BvcnRzCj4gPiA+ICsgICAgZGVzY3JpcHRpb246IFRoZSBkb3duc3RyZWFtIGZhY2luZyBVU0Ig
cG9ydHMKPiA+ID4gKwo+ID4gPiArICAgIHBhdHRlcm5Qcm9wZXJ0aWVzOgo+ID4gPiArICAgICAg
Il5wb3J0QFsxLTlhLWZdWzAtOWEtZl0/JCI6Cj4gPiA+ICsgICAgICAgICRyZWY6IC9zY2hlbWFz
L2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9ydAo+ID4KPiA+IFtTZXZlcml0eTogTWVkaXVtXQo+
ID4gRG9lcyB0aGlzIGxvY2FsIGNvbnN0cmFpbnQgYWN0dWFsbHkgcHJldmVudCBwb3J0QDAgZnJv
bSBwYXNzaW5nIHZhbGlkYXRpb24/Cj4gPgo+ID4gU2luY2UgSlNPTiBzY2hlbWEgcGF0dGVyblBy
b3BlcnRpZXMgb25seSByZXN0cmljdCBtYXRjaGluZyBub2RlcywgYQo+ID4gbm9uLW1hdGNoaW5n
IG5vZGUgbGlrZSBwb3J0QDAgd2lsbCBmYWxsIGJhY2sgdG8gdGhlIGdlbmVyaWMgZ3JhcGgueWFt
bAo+ID4gcmVmZXJlbmNlLgoKVGhpcyBpcyBhIGNvbW1vbiBpc3N1ZSB3ZSBoYXZlIGluIGdyYXBo
IGFuZCBldGhlcm5ldC1zd2l0Y2ggc2NoZW1hcy4uLgoKPiA+IEJlY2F1c2UgZ3JhcGgueWFtbCBl
dmFsdWF0ZXMgYW55dGhpbmcgbWF0Y2hpbmcgXnBvcnQoQC4qKT8kLCB3b3VsZG4ndAo+ID4gcG9y
dEAwIGJlIGV2YWx1YXRlZCBhcyB2YWxpZCBhbmQgc2lsZW50bHkgcGFzcywgY29tcGxldGVseSBi
eXBhc3NpbmcgdGhlCj4gPiBpbnRlbnQgdGhhdCBkb3duc3RyZWFtIHBvcnQgbnVtYmVycyBzdGFy
dCBhdCAxPwo+IAo+IEkgc3VzcGVjdCBJIG5lZWQgdG8gd3JpdGUgaXQgYXM6Cj4gCj4gICAgIHBv
cnRzOgo+ICAgICAgIHByb3BlcnRpZXM6Cj4gICAgICAgICBwb3J0QDA6IGZhbHNlCj4gICAgICAg
cGF0dGVyblByb3BlcnRpZXM6Cj4gICAgICAgICAiXnBvcnRAWzEtOWEtZl1bMC05YS1mXT8kIjog
Li4uCgpZb3Ugc2hvdWxkIGp1c3Qgbm90IHJlc3RyaWN0IGl0IGhlcmUgc28gc2NoZW1hIGlzIGFw
cGxpZWQgdG8gYW55IHBvcnQgCm5vZGUgYW5kIGluc3RlYWQgcmVzdHJpY3QgdGhlICdyZWcnIHZh
bHVlcyBhbGxvd2VkLgoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
