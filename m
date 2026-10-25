Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FDD606A31B
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Oct 2026 19:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SjpUF7OU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bUmDhlcV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HLBNTZ/kBM1u39HwZzi+ZXbntb9NV9D4uuQcTuWjcZw=; b=SjpUF7OUuDju9ta83oXihkag+d
	snmJ2Mz3/G5M3C8FsfvHorI98KVdka1tTmnEfjWhdgiTLx/tl+1mAz8zdpfa0Q42Hw7R1NQ7bNAuf
	hzmIQetgfIFYL9efWVbesZLKUcDs/FXC4SBWJV/Lo+/PZAVg+Gg3KUHJRHN8KoD2DhdFpAFl16+mm
	JlPvqVwuYs+Lb3uWP7YF6lIB6IjJ6DRTsGUv+5uvGu67m+C9Tpc5VPbudTA10uZrMZlKuUI1VhcwG
	CIM+WwXrvrKmQjbtFxCEReINcMbHrk1dXTMgDUb5PGMrEzORduBesJLG7qKb5bA+y1esMyJitJ83J
	d6DADgRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL47V-00000001O9c-2BK8;
	Sun, 25 Oct 2026 19:43:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL47S-00000001O8n-42EB
	for linux-amlogic@lists.infradead.org;
	Sun, 25 Oct 2026 19:43:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0824060120;
	Sun, 25 Oct 2026 19:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 650341F01828;
	Sun, 25 Oct 2026 19:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792957381;
	bh=8h8F/ulXVgUyzmdy0weLIC0OOzaMsDaQfyRgn9jCG5g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bUmDhlcVyXuNR9lm4fFX+bOcycqGAbhiP2qum3eh1llzGHrxWVPtvOgJ2/z0NduVw
	 qHobfekG3qtnbEcaCQULrwT1eYaoo8YjykcshjbBlElwRuYvnGSpAiVAhJFqI+ibgu
	 7zPvbB1DzxABrvTK15p4Vg9j8NrxaUAePZdvfeqsqWLUfvQ/eBUaeR3pjxFOHEHX69
	 PDLjYdnJ+x1rt8UOtNbzLDh6x/HB4yLclFwl8Xe2MRkQbyjwBjPLL2XjOpMueyz8Zp
	 o6wQst48fMJSKSXvJ4xYzQkds+35NvBLW3DucfC6NTvkVVs1Xbc6p/NnADfN6kmUkx
	 Y6gulkO9NtwxA==
Message-ID: <sashiko-outbox-184390@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: thermal: amlogic: add the S4 CPU
 sensor
To: christian.koever-draxl@student.uibk.ac.at
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261025192244.209256-2-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192244.209256-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192244.209256-2-christian.koever-draxl@student.uibk.ac.at>
Date: Sun, 25 Oct 2026 19:43:01 +0000
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gZHQtYmluZGluZ3M6
IHRoZXJtYWw6IGFtbG9naWM6IG1pc3NpbmcgYnVzIGNsb2NrIGNvbnN0cmFpbnQgZm9yIFM0IHNl
bnNvcgotLQoKY29tbWl0IGIyZDQyYTJmOTBjNzg4MjY1MGVmYjA5MGRhZmYzMWE5ZWQxYWQzZTAK
QXV0aG9yOiBDaHJpc3RpYW4gU3RlZmFuIEvDtnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0bG9vay5k
ZT4KCmR0LWJpbmRpbmdzOiB0aGVybWFsOiBhbWxvZ2ljOiBhZGQgdGhlIFM0IENQVSBzZW5zb3IK
ClRoaXMgY29tbWl0IGFkZHMgdGhlIGFtbG9naWMsczQtY3B1LXRoZXJtYWwgY29tcGF0aWJsZSBz
dHJpbmcgdG8gdGhlIEFtbG9naWMKdGhlcm1hbCBiaW5kaW5nIHNjaGVtYSBmb3IgdGhlIFM0IENQ
VSB0ZW1wZXJhdHVyZSBzZW5zb3IuCgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvdGhlcm1hbC9hbWxvZ2ljLHRoZXJtYWwueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL2FtbG9naWMsdGhlcm1hbC55YW1sCj4gaW5k
ZXggZTcyY2IzOWFjNjM1ZC4uNWQ5NjZhYjRkODIwZSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGhlcm1hbC9hbWxvZ2ljLHRoZXJtYWwueWFtbAo+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL2FtbG9naWMsdGhl
cm1hbC55YW1sCj4gQEAgLTIzLDYgKzIzLDcgQEAgcHJvcGVydGllczoKPiAgICAgICAgICAgIC0g
Y29uc3Q6IGFtbG9naWMsZzEyYS10aGVybWFsCj4gICAgICAgIC0gZW51bToKPiAgICAgICAgICAg
IC0gYW1sb2dpYyxhMS1jcHUtdGhlcm1hbAo+ICsgICAgICAgICAgLSBhbWxvZ2ljLHM0LWNwdS10
aGVybWFsCj4gICAgICAgICAgICAtIGFtbG9naWMsdDctdGhlcm1hbAo+ICAKPiAgICByZWc6Cgpb
U2V2ZXJpdHk6IE1lZGl1bV0KU2hvdWxkIGFtbG9naWMsczQtY3B1LXRoZXJtYWwgYWxzbyByZXF1
aXJlIHR3byBjbG9ja3MgKGJ1cyBhbmQgY29yZSkgaW4gdGhlCmFsbE9mIGNvbmRpdGlvbmFsIGJs
b2NrLCBvciB1c2UgYW1sb2dpYyx0Ny10aGVybWFsIGFzIGEgZmFsbGJhY2sgY29tcGF0aWJsZT8K
CkluIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL2FtbG9naWMsdGhl
cm1hbC55YW1sLCB0aGUgc2Vjb25kCmFsbE9mIGNvbmRpdGlvbmFsIGNoZWNrcyBvbmx5IGZvciBh
bWxvZ2ljLHQ3LXRoZXJtYWw6CgogIC0gaWY6CiAgICAgIHByb3BlcnRpZXM6CiAgICAgICAgY29t
cGF0aWJsZToKICAgICAgICAgIGNvbnRhaW5zOgogICAgICAgICAgICBjb25zdDogYW1sb2dpYyx0
Ny10aGVybWFsCiAgICB0aGVuOgogICAgICBwcm9wZXJ0aWVzOgogICAgICAgIGNsb2NrczoKICAg
ICAgICAgIG1pbkl0ZW1zOiAyCiAgICAgIHJlcXVpcmVkOgogICAgICAgIC0gY2xvY2stbmFtZXMK
ICAgIGVsc2U6CiAgICAgIHByb3BlcnRpZXM6CiAgICAgICAgY2xvY2tzOgogICAgICAgICAgbWF4
SXRlbXM6IDEKICAgICAgICBjbG9jay1uYW1lczogZmFsc2UKCkJlY2F1c2UgYW1sb2dpYyxzNC1j
cHUtdGhlcm1hbCBpcyBvbWl0dGVkIGZyb20gdGhhdCBjb25kaXRpb24sIGl0IGZhbGxzIGludG8K
dGhlIGVsc2UgYnJhbmNoLCB3aGljaCByZXN0cmljdHMgY2xvY2tzIHRvIGEgc2luZ2xlIGVudHJ5
IGFuZCBmb3JiaWRzCmNsb2NrLW5hbWVzLgoKSW4gY29tbWl0IDgxOTViOTQ1Nzk0YyAoImR0LWJp
bmRpbmdzOiB0aGVybWFsOiBhbWxvZ2ljOiBkZXNjcmliZSBidXMgY2xvY2sKZm9yIHQ3LXRoZXJt
YWwiKSwgdGhlIHNpbmdsZS1jbG9jayBlbHNlIGJyYW5jaCB3YXMgcmV0YWluZWQgb25seSBmb3Ig
b2xkZXIKYmluZGluZ3MgdG8gYXZvaWQgYnJlYWtpbmcgZXhpc3RpbmcgZGV2aWNlIHRyZWVzLCB3
aGVyZWFzIFQ3IHJlcXVpcmVzIGJvdGgKdGhlIHBlcmlwaGVyYWwgYnVzIGdhdGUgY2xvY2sgYW5k
IHRoZSBzaGFyZWQgY29yZSBjbG9jay4KCkxvb2tpbmcgYXQgZHJpdmVycy9jbGsvbWVzb24vczQt
cGVyaXBoZXJhbHMuYywgUzQgaGFzIHRoZSBzYW1lIGNsb2NrIHRvcG9sb2d5CmFzIFQ3LCB3aXRo
IGRlZGljYXRlZCBwZXItc2Vuc29yIGJ1cyBnYXRlIGNsb2NrcyAoczRfdHNfZGRyIC8gQ0xLSURf
VFNfRERSCmFuZCBzNF90c19wbGwgLyBDTEtJRF9UU19QTEwpIGluIGFkZGl0aW9uIHRvIHRoZSBz
aGFyZWQgZnVuY3Rpb25hbCBjbG9jawooczRfdHNfY2xrIC8gQ0xLSURfVFMpOgoKZHJpdmVycy9j
bGsvbWVzb24vczQtcGVyaXBoZXJhbHMuYzoKc3RhdGljIFM0X1BDTEsoczRfdHNfZGRyLAlDTEtD
VFJMX1NZU19DTEtfRU4wX1JFRzEsIDE1LCBDTEtfSUdOT1JFX1VOVVNFRCk7CnN0YXRpYyBTNF9Q
Q0xLKHM0X3RzX3BsbCwJQ0xLQ1RSTF9TWVNfQ0xLX0VOMF9SRUcxLCAxNiwgQ0xLX0lHTk9SRV9V
TlVTRUQpOwoKV2l0aG91dCBhbGxvd2luZyBib3RoIGNsb2NrcyBpbiB0aGUgYmluZGluZywgZGV2
aWNlIHRyZWUgbm9kZXMgdXNpbmcKYW1sb2dpYyxzNC1jcHUtdGhlcm1hbCBjYW5ub3QgZGVzY3Jp
YmUgdGhlIHNlbnNvcidzIHBlcmlwaGVyYWwgYnVzIGdhdGUgY2xvY2sKZm9yIGFtbG9naWNfdGhl
cm1hbF9wcm9iZSgpIHRvIG1hbmFnZSB2aWEgZGV2bV9jbGtfYnVsa19nZXRfYWxsKCksIGxlYXZp
bmcKdGhlIHNlbnNvciByZWxpYW50IG9uIHRoZSB0ZW1wb3JhcnkgQ0xLX0lHTk9SRV9VTlVTRUQg
ZmxhZyBvbiBzNF90c19wbGwuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNo
aWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMDI1MTkyMjQ0LjIwOTI1Ni0xLWNocmlzdGlhbi5rb2V2
ZXItZHJheGxAc3R1ZGVudC51aWJrLmFjLmF0P3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
