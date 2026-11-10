Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7865B606A321
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Nov 2026 02:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vNQg/+0N;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oTsbMwkg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UYtdEvl173ma17EPIblXTew+8FKhEpxmUbC1g+1Nfic=; b=vNQg/+0ND44npUzWLdC3SwdnMu
	5H+lRh6oy/pyp0Nb/tLQHMkBAlKdns3+9a75JIumAbk75OfblivkEe/0Mc5TL7A4VkvOeGankeQPn
	sYJAw2fiKXDTjkoRBqp2z8vjJxcku2jtwyVI9E+LEnRJWLsLCKpOdSTVyzlSug3tMIXhFPUpPCgMk
	7NiITiBqjl88jsV8kiFjQKE0Hew2qcqSyw4T170ebYARVka2CO3cQg5dpXlvxMeCNELq6TMtyqVpo
	vXHYWrJ7p5p1qA7OG4NgbPIw5TNVhFI5vsw0vb8GAh8qH2cA0ylxetJIsgYn6+e9EL9zuoMcHtkQp
	WhgGMu/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbr7-00000002CCq-0quL;
	Tue, 10 Nov 2026 02:45:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbr6-00000002CCi-260Z
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Nov 2026 02:45:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EF6DD437D0;
	Tue, 10 Nov 2026 02:45:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7976F1F0089F;
	Tue, 10 Nov 2026 02:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794278703;
	bh=2dj621xlnc36AtUmapMH8WKqOt2OTF5gOx5Yx+nRFE8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oTsbMwkgclRaoLjDGoY9wp4zJdT/iULkUi/nzf1/byrsKnCWYgg86nR6/7hKdiGaF
	 JeY+fbr67xX79T1/qczSsYkZTOHJI2+q928DkgVExf7f+NisBYBE72ZXhz3RCsPqTn
	 t+mBTGUXvQve2Q9jLzBN1mvxXvX6oIJR+vEIA1/o6TBV5xLs0K0sf88ObnXMI5q1a0
	 DQUIYaS85tLdrztq4vlXmNdyPi8q6gm1IE7lY4vLa2rMrrC1VvnEJyyuWSHfY8o+aS
	 9ZElSvR9plZZhXNgcUcb7UccbbFdFznjlQAqEdpG1EStM4TimInXv/cMuZFG/3y5js
	 ADMwPoL7JzQyA==
Message-ID: <sashiko-outbox-206063@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/5] dt-bindings: clock: meson: Add audio power
 domain for S4 soc
To: "Jiebing Chen" <jiebing.chen@amlogic.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261110-audio_drvier-v8-1-1489241e4c83@amlogic.com>
References: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
 <20261110-audio_drvier-v8-1-1489241e4c83@amlogic.com>
Date: Tue, 10 Nov 2026 02:45:03 +0000
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MyBwb3RlbnRpYWwKaXNzdWVzIHRvIGNvbnNpZGVyOgotIFtMb3ddIGR0LWJpbmRpbmdzOiBjbG9j
azogbWVzb246IGNvbW1pdCBtZXNzYWdlIG9taXRzIHM0LWF1ZGlvLWNsa2MKICBjb21wYXRpYmxl
Ci0gW0xvd10gZHQtYmluZGluZ3M6IGNsb2NrOiBtZXNvbjogcG93ZXItZG9tYWlucyBmb3JiaWRk
ZW4gb24gQVhHIGFuZAogIFNNMSB2YXJpYW50cwotIFtMb3ddIGR0LWJpbmRpbmdzOiBjbG9jazog
bWVzb246IHVud2llbGR5IHBlci1jb21wYXRpYmxlIGNvbmRpdGlvbmFscwogIGluIGFsbE9mCi0t
Cgpjb21taXQgM2Y5NTM0ZTViM2MyNTUxYTQyYjE2NDJlMWNjNjI5MjNlOTk3NWZjYwpBdXRob3I6
IEppZWJpbmcgQ2hlbiA8amllYmluZy5jaGVuQGFtbG9naWMuY29tPgoKPiBkdC1iaW5kaW5nczog
Y2xvY2s6IG1lc29uOiBBZGQgYXVkaW8gcG93ZXIgZG9tYWluIGZvciBTNCBzb2MKPgo+IFRoZSBh
dWRpbyBwb3dlciBkb21haW4gaGFzIGJlZW4gZm91bmQgb24gUzQgZGV2aWNlLgo+IEl0IG11c3Qg
YmUgZW5hYmxlZCBwcmlvciB0byBhdWRpbyBvcGVyYXRpb25zLgo+Cj4gU2lnbmVkLW9mZi1ieTog
SmllYmluZyBDaGVuIDxqaWViaW5nLmNoZW5AYW1sb2dpYy5jb20+CgpbU2V2ZXJpdHk6IExvd10K
RG9lcyB0aGUgY29tbWl0IG1lc3NhZ2Ugb21pdCB0aGF0IHRoaXMgcGF0Y2ggaW50cm9kdWNlcyB0
aGUKYW1sb2dpYyxzNC1hdWRpby1jbGtjIGNvbXBhdGlibGUgc3RyaW5nIGFuZCBpdHMgI3Jlc2V0
LWNlbGxzIHJlcXVpcmVtZW50PwpUaGUgdGl0bGUgYW5kIGNoYW5nZWxvZyBvbmx5IG1lbnRpb24g
YWRkaW5nIHRoZSBhdWRpbyBwb3dlciBkb21haW4gZm9yIFM0LApidXQgYW1sb2dpYyxzNC1hdWRp
by1jbGtjIHdhcyBub3QgcHJlc2VudCBpbiB0aGlzIGJpbmRpbmcgYmVmb3JlLgoKPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsYXhn
LWF1ZGlvLWNsa2MueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9j
ay9hbWxvZ2ljLGF4Zy1hdWRpby1jbGtjLnlhbWwKPiBpbmRleCBmZDc5ODJkZDRjZWFiLi43NWRk
YWY4ZDgwOTE3IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9jbG9jay9hbWxvZ2ljLGF4Zy1hdWRpby1jbGtjLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svYW1sb2dpYyxheGctYXVkaW8tY2xrYy55YW1sCj4g
QEAgLTIwLDYgKzIwLDcgQEAgcHJvcGVydGllczoKPiAgICAgIGVudW06Cj4gICAgICAgIC0gYW1s
b2dpYyxheGctYXVkaW8tY2xrYwo+ICAgICAgICAtIGFtbG9naWMsZzEyYS1hdWRpby1jbGtjCj4g
KyAgICAgIC0gYW1sb2dpYyxzNC1hdWRpby1jbGtjCj4gICAgICAgIC0gYW1sb2dpYyxzbTEtYXVk
aW8tY2xrYwo+ICAKPiAgICAnI2Nsb2NrLWNlbGxzJzoKPiBAQCAtMTAwLDYgKzEwMSw5IEBAIHBy
b3BlcnRpZXM6Cj4gICAgcmVzZXRzOgo+ICAgICAgZGVzY3JpcHRpb246IGludGVybmFsIHJlc2V0
IGxpbmUKPiAgCj4gKyAgcG93ZXItZG9tYWluczoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICBy
ZXF1aXJlZDoKPiAgICAtIGNvbXBhdGlibGUKPiAgICAtICcjY2xvY2stY2VsbHMnCj4gQEAgLTEx
NSw2ICsxMTksNyBAQCBhbGxPZjoKPiAgICAgICAgICAgIGNvbnRhaW5zOgo+ICAgICAgICAgICAg
ICBlbnVtOgo+ICAgICAgICAgICAgICAgIC0gYW1sb2dpYyxnMTJhLWF1ZGlvLWNsa2MKPiArICAg
ICAgICAgICAgICAtIGFtbG9naWMsczQtYXVkaW8tY2xrYwo+ICAgICAgICAgICAgICAgIC0gYW1s
b2dpYyxzbTEtYXVkaW8tY2xrYwo+ICAgICAgdGhlbjoKPiAgICAgICAgcmVxdWlyZWQ6Cj4gQEAg
LTEyMiw2ICsxMjcsMTggQEAgYWxsT2Y6Cj4gICAgICBlbHNlOgo+ICAgICAgICBwcm9wZXJ0aWVz
Ogo+ICAgICAgICAgICcjcmVzZXQtY2VsbHMnOiBmYWxzZQo+ICsgIC0gaWY6Cj4gKyAgICAgIHBy
b3BlcnRpZXM6Cj4gKyAgICAgICAgY29tcGF0aWJsZToKPiArICAgICAgICAgIGNvbnRhaW5zOgo+
ICsgICAgICAgICAgICBlbnVtOgo+ICsgICAgICAgICAgICAgIC0gYW1sb2dpYyxzNC1hdWRpby1j
bGtjCj4gKyAgICB0aGVuOgo+ICsgICAgICByZXF1aXJlZDoKPiArICAgICAgICAtIHBvd2VyLWRv
bWFpbnMKPiArICAgIGVsc2U6Cj4gKyAgICAgIHByb3BlcnRpZXM6Cj4gKyAgICAgICAgcG93ZXIt
ZG9tYWluczogZmFsc2UKCltTZXZlcml0eTogTG93XQpTaG91bGQgcG93ZXItZG9tYWlucyBiZSBz
ZXQgdG8gZmFsc2UgZm9yIHRoZSBvdGhlciBjb21wYXRpYmxlcyBoZXJlPyAgQm90aApBWEcgYW5k
IFNNMSBhbHNvIGhhdmUgZGVkaWNhdGVkIGF1ZGlvIHBvd2VyIGRvbWFpbnMgaW4gaGFyZHdhcmUs
IHNvCmRpc2FsbG93aW5nIHBvd2VyLWRvbWFpbnMgaW4gdGhlIGVsc2UgYnJhbmNoIGNhdXNlcyBk
dGJzX2NoZWNrIGZhaWx1cmVzIGlmCmFtbG9naWMsYXhnLWF1ZGlvLWNsa2Mgb3IgYW1sb2dpYyxz
bTEtYXVkaW8tY2xrYyBub2RlcyByZWZlcmVuY2UgdGhlbToKCmRyaXZlcnMvcG1kb21haW4vYW1s
b2dpYy9tZXNvbi1lZS1wd3JjLmM6YXhnX3B3cmNfZG9tYWluc1tdIHsKICAgIC4uLgoJW1BXUkNf
QVhHX0FVRElPX0lEXSA9IE1FTV9QRCgiQVVESU8iLCBheGdfcHdyY19tZW1fYXVkaW8pLAp9OwoK
ZHJpdmVycy9wbWRvbWFpbi9hbWxvZ2ljL21lc29uLWVlLXB3cmMuYzpzbTFfcHdyY19kb21haW5z
W10gewogICAgLi4uCglbUFdSQ19TTTFfQVVESU9fSURdID0gTUVNX1BEKCJBVURJTyIsIHNtMV9w
d3JjX21lbV9hdWRpbyksCiAgICAuLi4KfTsKCltTZXZlcml0eTogTG93XQpUaGlzIGlzbid0IGEg
YnVnLCBidXQgYWRkaW5nIGFub3RoZXIgcGVyLWNvbXBhdGlibGUgaWYtdGhlbi1lbHNlIGJsb2Nr
IHRvCmFtbG9naWMsYXhnLWF1ZGlvLWNsa2MueWFtbCBtYWtlcyB0aGUgc2hhcmVkIHNjaGVtYSBo
YXJkZXIgdG8gbWFpbnRhaW4sCmVzcGVjaWFsbHkgc2luY2UgUzQgYWxzbyBkaXZlcmdlcyBmcm9t
IEFYRywgRzEyQSwgYW5kIFNNMSBieSBub3QgdXNpbmcgdGhlCnNsdl9zY2xrMC4uOSBhbmQgc2x2
X2xyY2xrMC4uOSBjbG9jayBpbnB1dHMuICBXb3VsZCBpdCBiZSBjbGVhbmVyIHRvIHNwbGl0CmFt
bG9naWMsczQtYXVkaW8tY2xrYyBpbnRvIGl0cyBvd24gYmluZGluZyBzY2hlbWEsIHNpbWlsYXIg
dG8KYW1sb2dpYyxzNC1wZXJpcGhlcmFscy1jbGtjLnlhbWwgYW5kIGFtbG9naWMsczQtcGxsLWNs
a2MueWFtbD8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMv
cGF0Y2hzZXQvMjAyNjExMTAtYXVkaW9fZHJ2aWVyLXY4LTAtMTQ4OTI0MWU0YzgzQGFtbG9naWMu
Y29tP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
