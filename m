Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA13C606A31B
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Oct 2026 19:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2zlKKP5r;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O8MaDGAy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LEZIja3PUNyV85QO2Lv15DEMDzbLnaU0SAE334yme6E=; b=2zlKKP5rPfxDl4IbZ4ooMDqUyf
	t/RGRpR7GrsDslFV2mWI3V7I9Z+fuOah3pFm6RWNYeGARTbgX7BuYkOzO4G/9SC9PWax+alV1v8DM
	Dlw4slyC4XjcdJIFGS/2INzkTWdauVHSEsILCoOplb/UFtx8jJh0y/dIoKcYS///wpTVZ42E9f89P
	iVGvvAVrarrSK8A0qkcwRhNgUnJ+ZCeTq/JEB2fDmJpd6Kcmzb6COJpHhNCP0Y3JbdQHDmJ+VpAT5
	dQLQM0AeAT/ZSow7Tr/enj1gzgcvMmbcKPMSkiu7WV0S90meNIDqwabGjguHaY4E4CyHCWegC0kYW
	s6/uRmgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL47T-00000001O8z-1pVh;
	Sun, 25 Oct 2026 19:43:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL47S-00000001O8g-0lHT
	for linux-amlogic@lists.infradead.org;
	Sun, 25 Oct 2026 19:43:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 38A1D600D4;
	Sun, 25 Oct 2026 19:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9583A1F01825;
	Sun, 25 Oct 2026 19:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792957380;
	bh=kqlg32oSSwB4pQjx2pNduvbW/yCoSss1FXshNF6lS4c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O8MaDGAyyjE7zY6RRt/rUYA7RwEejsY8K8v+sMAfWqH13ZueBRy+joRjOdz4vN3aQ
	 T6dBzreEAXDu51NcFgO9u6IkduQk0ZDm28ixTEfZtrWi5Hk/lkIS0h4UHAbD0IHL+N
	 OivduHDj1uwAcxHeFARKY21SFGGXVWT9mSSVJFA1mPzztOmgriPA1bhp7IUerlTweN
	 DkmbbFD45UgQKNpEA5oH0B3v3mrE3QYxY16pytfr12N1qTsMfvwQJG7vDvVeeDm024
	 Ztp2ynypDl2TKct+C1NdKErSKTs0+ZSwUiHV6YiqIL2saXDv6mxPmp9v+NRCN0XdQH
	 wtWYCwoEiUqsg==
Message-ID: <sashiko-outbox-184389@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] thermal/drivers/amlogic: add S4 support
To: christian.koever-draxl@student.uibk.ac.at
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261025192244.209256-3-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192244.209256-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192244.209256-3-christian.koever-draxl@student.uibk.ac.at>
Date: Sun, 25 Oct 2026 19:43:00 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gdGhlcm1hbC9kcml2
ZXJzL2FtbG9naWM6IG1pc3NpbmcgUzQgYnVzIGNsb2NrIGluIGJpbmRpbmcgYW5kIGNvbXBhdGli
bGUKLS0KCmNvbW1pdCBkZmU1YWJmNzk2N2FlY2I5NTIxM2EyOWQ0M2VhNmVmYTY1Y2ViNWQ5CkF1
dGhvcjogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+
Cgp0aGVybWFsL2RyaXZlcnMvYW1sb2dpYzogYWRkIFM0IHN1cHBvcnQKClRoaXMgY29tbWl0IGFk
ZHMgdGhlIGFtbG9naWMsczQtY3B1LXRoZXJtYWwgY29tcGF0aWJsZSBzdHJpbmcgdG8gdGhlIEFt
bG9naWMKdGhlcm1hbCBkcml2ZXIgbWF0Y2ggdGFibGUsIHJldXNpbmcgdGhlIFQ3IHBhcmFtZXRl
ciBkYXRhIHNvIHRoYXQgdGhlIFM0IENQVQp0aGVybWFsIHNlbnNvciByZWFkcyBpdHMgY2FsaWJy
YXRpb24gdmlhIHRoZSBzZWN1cmUgbW9uaXRvci4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGhl
cm1hbC9hbWxvZ2ljX3RoZXJtYWwuYyBiL2RyaXZlcnMvdGhlcm1hbC9hbWxvZ2ljX3RoZXJtYWwu
Ywo+IGluZGV4IDYwNzI4ZGU2OTY4YWMuLmM1OGJhYzYzM2JlZGMgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy90aGVybWFsL2FtbG9naWNfdGhlcm1hbC5jCj4gKysrIGIvZHJpdmVycy90aGVybWFsL2Ft
bG9naWNfdGhlcm1hbC5jCj4gQEAgLTI5Miw2ICsyOTIsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgb2ZfYW1sb2dpY190aGVybWFsX21hdGNoW10gPSB7Cj4gIAkJLmNvbXBh
dGlibGUgPSAiYW1sb2dpYyxhMS1jcHUtdGhlcm1hbCIsCj4gIAkJLmRhdGEgPSAmYW1sb2dpY190
aGVybWFsX2ExX2NwdV9wYXJhbSwKPiAgCX0sCj4gKwl7Cj4gKwkJLmNvbXBhdGlibGUgPSAiYW1s
b2dpYyxzNC1jcHUtdGhlcm1hbCIsCj4gKwkJLmRhdGEgPSAmYW1sb2dpY190aGVybWFsX3Q3X3Bh
cmFtLAo+ICsJfSwKCltTZXZlcml0eTogTWVkaXVtXQpTaG91bGQgUzQgdXNlIGFtbG9naWMsczQt
dGhlcm1hbCAoZWl0aGVyIHdpdGggYW1sb2dpYyx0Ny10aGVybWFsIGFzIGEKZmFsbGJhY2sgY29t
cGF0aWJsZSBvciBhZGRlZCB0byB0aGUgdHdvLWNsb2NrIGNvbmRpdGlvbiBpbiB0aGUgYmluZGlu
ZykKaW5zdGVhZCBvZiBhIHN0YW5kYWxvbmUgYW1sb2dpYyxzNC1jcHUtdGhlcm1hbCBjb21wYXRp
YmxlPwoKSW4gZHJpdmVycy9jbGsvbWVzb24vczQtcGVyaXBoZXJhbHMuYywgQW1sb2dpYyBTNCBw
cm92aWRlcyBib3RoIGEgc2hhcmVkCmZ1bmN0aW9uYWwgY2xvY2sgKHM0X3RzX2NsaykgYW5kIGRl
ZGljYXRlZCBwZXItc2Vuc29yIEFQQiBidXMgY2xvY2tzIGZvciB0aGUKUExML0NQVSBhbmQgRERS
IHRoZXJtYWwgc2Vuc29yczoKCnN0YXRpYyBTNF9QQ0xLKHM0X3RzX2RkciwJQ0xLQ1RSTF9TWVNf
Q0xLX0VOMF9SRUcxLCAxNSwgQ0xLX0lHTk9SRV9VTlVTRUQpOwpzdGF0aWMgUzRfUENMSyhzNF90
c19wbGwsCUNMS0NUUkxfU1lTX0NMS19FTjBfUkVHMSwgMTYsIENMS19JR05PUkVfVU5VU0VEKTsK
Ckhvd2V2ZXIsIGluIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL2Ft
bG9naWMsdGhlcm1hbC55YW1sLAp0aGUgYWxsT2YgY29uZGl0aW9uYWwgYmxvY2sgb25seSBwZXJt
aXRzIHR3byBjbG9ja3Mgd2hlbiB0aGUgY29tcGF0aWJsZQpjb250YWlucyBhbWxvZ2ljLHQ3LXRo
ZXJtYWw6CgogIC0gaWY6CiAgICAgIHByb3BlcnRpZXM6CiAgICAgICAgY29tcGF0aWJsZToKICAg
ICAgICAgIGNvbnRhaW5zOgogICAgICAgICAgICBjb25zdDogYW1sb2dpYyx0Ny10aGVybWFsCiAg
ICB0aGVuOgogICAgICBwcm9wZXJ0aWVzOgogICAgICAgIGNsb2NrczoKICAgICAgICAgIG1pbkl0
ZW1zOiAyCiAgICAgIHJlcXVpcmVkOgogICAgICAgIC0gY2xvY2stbmFtZXMKICAgIGVsc2U6CiAg
ICAgIHByb3BlcnRpZXM6CiAgICAgICAgY2xvY2tzOgogICAgICAgICAgbWF4SXRlbXM6IDEKICAg
ICAgICBjbG9jay1uYW1lczogZmFsc2UKCkJlY2F1c2UgYW1sb2dpYyxzNC1jcHUtdGhlcm1hbCBm
YWxscyBpbnRvIHRoZSBlbHNlIGJyYW5jaCwgdGhlIHNjaGVtYSBmb3JiaWRzCnNwZWNpZnlpbmcg
dGhlIHBlci1zZW5zb3IgQVBCIGJ1cyBjbG9jayAoQ0xLSURfVFNfUExMIC8gQ0xLSURfVFNfRERS
KSBhbG9uZ3NpZGUKQ0xLSURfVFMuIElmIHRoZSBib290bG9hZGVyIGRvZXMgbm90IGxlYXZlIHRo
ZSBBUEIgYnVzIGNsb2NrIGVuYWJsZWQsIG9yIG9uY2UKQ0xLX0lHTk9SRV9VTlVTRUQgaXMgcmVt
b3ZlZCBmcm9tIHM0X3RzX3BsbCBhbmQgczRfdHNfZGRyLCByZWdpc3RlciBhY2Nlc3NlcyBpbgph
bWxvZ2ljX3RoZXJtYWxfZW5hYmxlKCkgYW5kIGFtbG9naWNfdGhlcm1hbF9nZXRfdGVtcCgpIGR1
cmluZwphbWxvZ2ljX3RoZXJtYWxfcHJvYmUoKSBjYW4gYWNjZXNzIGFuIHVuY2xvY2tlZCBwZXJp
cGhlcmFsLgoKQWRkaXRpb25hbGx5LCBzaW5jZSBTNCBwYXNzZXMgdGhlIHNlbnNvciBpbmRleCB2
aWEgdGhlIGFtbG9naWMsc2VjdXJlLW1vbml0b3IKcGhhbmRsZSBhcmd1bWVudCByYXRoZXIgdGhh
biBoYXJkY29kaW5nIHVfZWZ1c2Vfb2ZmIHBlciBjb21wYXRpYmxlLCBkb2VzCm5hbWluZyB0aGUg
Y29tcGF0aWJsZSBhbWxvZ2ljLHM0LWNwdS10aGVybWFsIHByZXZlbnQgcmV1c2luZyBpdCBmb3Ig
dGhlIFM0IEREUgp0aGVybWFsIHNlbnNvcj8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRw
czovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjEwMjUxOTIyNDQuMjA5MjU2LTEtY2hyaXN0
aWFuLmtvZXZlci1kcmF4bEBzdHVkZW50LnVpYmsuYWMuYXQ/cGFydD0yCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
