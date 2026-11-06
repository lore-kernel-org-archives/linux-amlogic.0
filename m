Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F356606A329
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jPAf9iOh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZUz2LLs6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LCWbmLqMRFqNvPMDoGc4+gF+U8nbuhYJEOx71R6I5Lc=; b=jPAf9iOhSigb4ch5yeoBQKnBxv
	VY+gfQydiH44Zd5FLBsBtwoynyEoHJ9qcwaax9ixSQjIjk6Fad0fGZ0pCaaAnws3DLXWXvgWIfrhY
	tW+K/oJGIbga2YY5NADOicVoeBUEJnMAy9TkoLM0f14Krtdb2ItmAoX1CDnjtWZeGoKnj4WzkJDFu
	QBYkUM5EPl2qp8vwqgImx/S/mSQvR4XFliJZJuG6AEoDrywbPLVQOMSPzCmcPEXAD7YQBU60m7lYS
	cax1UFbiGGdRtuRm2U1Q710vboRZ479zCIY5kjZ1PfE6WAsXJGleYDVgp74tS30gEBYG3DGiIdnRj
	vv2WlEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH8N-0000000BvFR-0UTC;
	Fri, 06 Nov 2026 10:25:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH8L-0000000BvF4-3OKR
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Nov 2026 10:25:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D5564067C;
	Fri,  6 Nov 2026 10:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF8FB1F0089F;
	Fri,  6 Nov 2026 10:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793960721;
	bh=lXoBFpH05wl+DU/OIxv7PpdFuT7gEFSRqiFhWeDB/xo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZUz2LLs6iN84eNW61fUInUgVh+EMVrJ9/jQ0VIeMehhqZpzeCy3SizWHqIRI61fvn
	 aKjY2+pS8pnVMG0SwhLd4A15fElvUjDlZOm9NJX3HYXN+G49Z72oSeTnFdFwP7WxEd
	 xdLyd3GUJeWG9WUzHJtAOBShkba6cXbwBP96JU2n2DzAKIzBT1mR2xLfIleZd8pFmM
	 9rpkR4ZIk6F9cN1vSb42OmoeLJcJ/ZwncJeI4UKjT4UPNX17W8zspfLQ+Do4Cw3wYk
	 K2EIdGjAfYHHL62FoyeUO0/AkPmcI9jZnV10oNBNFsACt/6gSwuAyrT5f8dY/X1Kel
	 Xkpfp2sIaoYJg==
Message-ID: <sashiko-outbox-201213@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] clk: meson: s4: keep the PWM clocks off vid_pll
To: christian.koever-draxl@student.uibk.ac.at
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261106101827.46467-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106101827.46467-1-christian.koever-draxl@student.uibk.ac.at>
Date: Fri, 06 Nov 2026 10:25:20 +0000
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gY2xrOiBtZXNvbjogczQ6IHVu
dXNlZCBTNF9DT01QX1NFTCBtYWNybyBsZWZ0IGJlaGluZCBieQogIFM0X1BXTV9TRUwKLS0KCmNv
bW1pdCA1NjY2YzkwODk3ZDFhNGJiNTMyMDE2ODA5OWI4MzdjYTFlZjgyMTZiCkF1dGhvcjogQ2hy
aXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+CgpjbGs6IG1l
c29uOiBzNDoga2VlcCB0aGUgUFdNIGNsb2NrcyBvZmYgdmlkX3BsbAoKVGhpcyBjb21taXQgcmVt
b3ZlcyB2aWRfcGxsIGZyb20gdGhlIFM0IFBXTSBjbG9jayBwYXJlbnQgbGlzdCBhbmQgYWRkcyBh
Cm11eCB0YWJsZSB0byBwcmVzZXJ2ZSB0aGUgaGFyZHdhcmUgcmVnaXN0ZXIgaW5kaWNlcyBmb3Ig
dGhlIHJlbWFpbmluZwppbnB1dHMuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZXNvbi9z
NC1wZXJpcGhlcmFscy5jIGIvZHJpdmVycy9jbGsvbWVzb24vczQtcGVyaXBoZXJhbHMuYwo+IGlu
ZGV4IGJhNDFmY2Q5MDU4ODEuLmU1ZTVmZjk3OWVmZDIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9j
bGsvbWVzb24vczQtcGVyaXBoZXJhbHMuYwo+ICsrKyBiL2RyaXZlcnMvY2xrL21lc29uL3M0LXBl
cmlwaGVyYWxzLmMKPiBAQCAtMjU4OCw1MSArMjU4OCw2MSBAQCBzdGF0aWMgc3RydWN0IGNsa19y
ZWdtYXAgczRfc3BpY2MwX2VuID0gewo+ICAJfSwKPiAgfTsKPiAgCj4gLS8qIFBXTSBDbG9jayAq
Lwo+ICsvKgo+ICsgKiBQV00gQ2xvY2sKPiArICoKPiArICogdmlkX3BsbCAobXV4IGlucHV0IDEp
IGlzIGxlZnQgb3V0OiBpdCBiZWxvbmdzIHRvIHRoZSB2aWRlbyBwYXRoIGFuZCBpcwo+ICsgKiBy
ZXByb2dyYW1tZWQgb24gZGlzcGxheSBtb2RlIGNoYW5nZXMuCj4gKyAqLwo+ICtzdGF0aWMgdTMy
IHM0X3B3bV9wYXJlbnRzX3RhYmxlW10gPSB7IDAsIDIsIDMgfTsKPiArCj4gIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgY2xrX3BhcmVudF9kYXRhIHM0X3B3bV9wYXJlbnRzW10gPSB7Cj4gIAl7IC5md19u
YW1lID0gInh0YWwiLCB9LAo+IC0JeyAuaHcgPSAmczRfdmlkX3BsbC5odyB9LAo+ICAJeyAuZndf
bmFtZSA9ICJmY2xrX2RpdjQiLCB9LAo+ICAJeyAuZndfbmFtZSA9ICJmY2xrX2RpdjMiLCB9LAo+
ICB9Owo+ICAKPiAtc3RhdGljIFM0X0NPTVBfU0VMKHB3bV9hLCBDTEtDVFJMX1BXTV9DTEtfQUJf
Q1RSTCwgOSwgMHgzLCBzNF9wd21fcGFyZW50cyk7Cj4gKyNkZWZpbmUgUzRfUFdNX1NFTChfbmFt
ZSwgX3JlZywgX3NoaWZ0KSBcCj4gKwlNRVNPTl9DT01QX1NFTChzNF8sIF9uYW1lLCBfcmVnLCBf
c2hpZnQsIDB4MywgczRfcHdtX3BhcmVudHMsIFwKPiArCQkgICAgICAgczRfcHdtX3BhcmVudHNf
dGFibGUsIDAsIDApCj4gKwo+ICtzdGF0aWMgUzRfUFdNX1NFTChwd21fYSwgQ0xLQ1RSTF9QV01f
Q0xLX0FCX0NUUkwsIDkpOwoKW1NldmVyaXR5OiBMb3ddCkRvZXMgcmVwbGFjaW5nIGFsbCBTNF9D
T01QX1NFTCgpIHVzZXMgd2l0aCBTNF9QV01fU0VMKCkgbGVhdmUKUzRfQ09NUF9TRUwoKSB1bnVz
ZWQgaW4gZHJpdmVycy9jbGsvbWVzb24vczQtcGVyaXBoZXJhbHMuYywgdHJpZ2dlcmluZyBhCi1X
dW51c2VkLW1hY3JvcyB3YXJuaW5nIHVuZGVyIFc9MiBidWlsZHM/IEVpdGhlciBTNF9DT01QX1NF
TCgpIGNvdWxkIHRha2UKYSB0YWJsZSBhcmd1bWVudCBvciB0aGUgdW51c2VkIG1hY3JvIGRlZmlu
aXRpb24gc2hvdWxkIGJlIHJlbW92ZWQuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6
Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTA2MTAxODI3LjQ2NDY3LTEtY2hyaXN0aWFu
LmtvZXZlci1kcmF4bEBzdHVkZW50LnVpYmsuYWMuYXQ/cGFydD0xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
