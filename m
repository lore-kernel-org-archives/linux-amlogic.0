Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714FE606A31E
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Oct 2026 09:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L93xcNeS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=niylCJHV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PnE85qPnxes/3OthYA4lLlYMqLCkS9cHndIsuqgI/TM=; b=L93xcNeSH2mCCgZB4K9j8wpImU
	qKXB7yyPeFqBC01JlZ6pAMnrJ6n6INrF2TmCvYfTGzS3bnBMdpBFJSZlMrN1GGwBNC6VxyNeupEQy
	Urs/KPnmi9yiY4OEoV6Dw1dkVv7UJFNslXIkauEKeMYlOpbCif7Lfc/7omE7GjyzXtxWcSjXrv5S8
	hC9Q1ESkOKYCK5639W6fKrhWeHE8JciWdMSa6kWRQqkgpHhahAsDoMzY7L4SA9y2qespUSt/AqnT2
	JzDug6fixht6jDzOAUYMU28rbubdRNrsaP+09rVpVYoIFzGcyEAKalgW7b7YLM/Vhzwa+aTYRnvyb
	bfmmYDBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdfS-00000004BfE-1XXJ;
	Tue, 27 Oct 2026 09:40:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdfR-00000004Bf2-2S4i;
	Tue, 27 Oct 2026 09:40:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B939060211;
	Tue, 27 Oct 2026 09:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 869B31F01829;
	Tue, 27 Oct 2026 09:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793094028;
	bh=ym7ZIQqtoG4e+CQqKSyynH5jiOK9eEJXm56IzwNu0EM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=niylCJHV2ZImXnkjYlAJxdDnlpnsoxyiyXvvFTcuTukzjwbi6++qUCJ0vIgqTAjnX
	 iXOC/6UMZoKUfsATd0m+ZEuLBvjXA3geQ/g+tTh/hMxAkd+DxEpRLkxQBVh6HcNnTe
	 C5x1i4411+4Z/M6uldP2CmSkOedf2ML0MMV2WSsFkp75LXXm8kOZF+SHwvQqXtoswd
	 syo7vsImSV9MUeCncdCJuOy3r5v9XVsphFndCP4JTpXjP0KF9UZbwvdgOfH+KM0X+y
	 /iBSvRqRrLaPizPQMyMx+iVQBHtVFl3JFMh6OvhGtdfMlybkYHMMLX5vE+heRJtdhB
	 MdPFa183wn2gg==
Date: Tue, 27 Oct 2026 10:40:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org, 
	bmasney+clk@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	lgirdwood@gmail.com, broonie@kernel.org, khilman@baylibre.com, 
	martin.blumenstingl@googlemail.com, perex@perex.cz, tiwai@suse.com, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Jiebing Chen <jiebing.chen@amlogic.com>, 
	Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH v7 1/7] dt-bindings: clock: meson: Add audio power domain
 for S4 soc
Message-ID: <20261027-aloof-lush-hog-c7beeb@quoll>
References: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192404.209695-2-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261025192404.209695-2-christian.koever-draxl@student.uibk.ac.at>
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBPY3QgMjUsIDIwMjYgYXQgMDg6MjM6NThQTSArMDEwMCwgY2hyaXN0aWFuLmtvZXZl
ci1kcmF4bEBzdHVkZW50LnVpYmsuYWMuYXQgd3JvdGU6Cj4gRnJvbTogSmllYmluZyBDaGVuIDxq
aWViaW5nLmNoZW5AYW1sb2dpYy5jb20+Cj4gCj4gVGhlIGF1ZGlvIHBvd2VyIGRvbWFpbiBoYXMg
YmVlbiBmb3VuZCBvbiBTNCBkZXZpY2UuCj4gSXQgbXVzdCBiZSBlbmFibGVkIHByaW9yIHRvIGF1
ZGlvIG9wZXJhdGlvbnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmllYmluZyBDaGVuIDxqaWViaW5n
LmNoZW5AYW1sb2dpYy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2
w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+Cj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9jbG9j
ay9hbWxvZ2ljLGF4Zy1hdWRpby1jbGtjLnlhbWwgfCAxOCArKysrKysrKysrKysrKysrLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9hbWxvZ2lj
LGF4Zy1hdWRpby1jbGtjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
Y2xvY2svYW1sb2dpYyxheGctYXVkaW8tY2xrYy55YW1sCj4gaW5kZXggZmQ3OTgyZGQ0Y2VhLi4x
Y2Q5YTk5ZTVmZjMgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Nsb2NrL2FtbG9naWMsYXhnLWF1ZGlvLWNsa2MueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLGF4Zy1hdWRpby1jbGtjLnlhbWwK
PiBAQCAtMjAsNiArMjAsNyBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgZW51bToKPiAgICAgICAgLSBh
bWxvZ2ljLGF4Zy1hdWRpby1jbGtjCj4gICAgICAgIC0gYW1sb2dpYyxnMTJhLWF1ZGlvLWNsa2MK
PiArICAgICAgLSBhbWxvZ2ljLHM0LWF1ZGlvLWNsa2MKPiAgICAgICAgLSBhbWxvZ2ljLHNtMS1h
dWRpby1jbGtjCj4gIAo+ICAgICcjY2xvY2stY2VsbHMnOgo+IEBAIC05OSw3ICsxMDAsOCBAQCBw
cm9wZXJ0aWVzOgo+ICAKPiAgICByZXNldHM6Cj4gICAgICBkZXNjcmlwdGlvbjogaW50ZXJuYWwg
cmVzZXQgbGluZQo+IC0KCldoeSByZW1vdmluZyB0aGlzIGJsYW5rIGxpbmU/Cgo+ICsgIHBvd2Vy
LWRvbWFpbnM6Cj4gKyAgICBtYXhJdGVtczogMQoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
