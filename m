Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCCB606A321
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Nov 2026 12:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2f15C4W8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m1SjANHJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vQQHTURUOz5lEAT8wFORAiYIaPcauPpRroXf3xdIuPA=; b=2f15C4W8IhzSmZ9XiMQdhCPkes
	E9RstOr5IVr5AwyRqIleuYzQTK6xtogNXFvuchR6lvadXVEKdoobijCkECm7tZj8Q8gih2L/nf+Gl
	a/m2IQmnLzAhuTcKYVw/RomiyWF6ky0lpi2tRhMfEXSvNj/Ea9om9ePW18H+4ryMc5iLWmaFPjx0D
	CHURC5El+OyJFP+Ck4+rdWW1SXPajip52xLXQ8zBAvZNz2/XzuhtlNl6kAJiSSm1bWoaCmnVTVIAC
	t9g4f5HbojkLWb6OLDahfb3BPNqEgQXGYaJvPU9jNrn4C5AM1+OoSWncOI2DgnExiwkMJSFXaEItl
	SRoGc70A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7Qp-00000006fnT-1qLc;
	Wed, 11 Nov 2026 12:28:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7Qn-00000006fmx-3PPH;
	Wed, 11 Nov 2026 12:28:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ED3DC60DA1;
	Wed, 11 Nov 2026 12:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3CC1F00A05;
	Wed, 11 Nov 2026 12:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794400080;
	bh=47lVK3cOyaNIyjPMt8H8DbVBV5H9SqcaWOsJ4QNlPsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m1SjANHJ+Mi0oTsBGnxlg+2Ju1lu+wi4uIGVlaj1AE6czkPKkPgH0Qw8GWoTSmK5/
	 EJ24qp/39mVkPX2kxa/5u0xlDAWUZ4teFxX/BhT5Y67VvkTjwUQ5MBzLMUdNXoQHty
	 yjLB9lMTLQpqvBiK22zy8FuBoRhl+Efkbfrl5KYqaYUf/mp3e9i3QHjm/b2sgBfAef
	 2lybkqHwVj34L9dRmib3HUbxkThkoH2lyeq1IFfZ4REjUcFp+HcSFBKNBA0A668db0
	 gxh80Fw7BcAo/lLMJVXwVPCY2ohzXlW6dCbay/xl13qWd6Cz/C7TSltq6XnAf+6zDX
	 ZBrwmTtoihG8g==
Date: Wed, 11 Nov 2026 13:27:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH] dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add S4
 support
Message-ID: <20261111-beryl-fossa-of-excitement-eff7eb@quoll>
References: <20261106104632.54161-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261106104632.54161-1-christian.koever-draxl@student.uibk.ac.at>
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBOb3YgMDYsIDIwMjYgYXQgMTE6NDY6MzJBTSArMDEwMCwgY2hyaXN0aWFuLmtvZXZl
ci1kcmF4bEBzdHVkZW50LnVpYmsuYWMuYXQgd3JvdGU6Cj4gRnJvbTogQ2hyaXN0aWFuIFN0ZWZh
biBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+Cj4gCj4gVGhlIFM0IFVTQiBnbHVl
IGlzIHRoZSBHMTJBIG9uZSwgYnV0IGl0IGZyb250cyBhbiB4SENJIGhvc3QgY29udHJvbGxlcgo+
IGluc3RlYWQgb2YgYSBEV0MzIGNvcmUsIHdpdGggdHdvIFVTQjIgUEhZcyBhbmQgbm8gVVNCMyBQ
SFkuIEFkZCBhbiBTNAo+IGNvbXBhdGlibGUgd2l0aCB0aGUgRzEyQSBvbmUgYXMgZmFsbGJhY2ss
IGFuZCBhbGxvdyBhIGdlbmVyaWMgeEhDSQo+IGNoaWxkIG5vZGUuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+Cj4g
LS0tCgpSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3Nr
aUBvc3MucXVhbGNvbW0uY29tPgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
