Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE8960A261E
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2026 11:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aF3ZrKS+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B6wz9Fxz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=K5xT4Fa8ekjJ0b9DbcqOp6rK4uGgN+jUWMlIyeI0WT0=; b=aF3ZrKS+97Pqt1CvLBTULC1SCr
	8NUtX9Rua1+0W1Z+HU16Wi3XtP29NPk40J0pHc5/dSVk5ps+Yz9b6rQ3eL49JRJsU4oPI/5ir+BiH
	GOW8DK8g/EKc5eSNNyXhdTAgLExI8IomXXohmXZBvQMeMn/LaSC0pQdqSedtD/SDyMOgrbS6mmrvw
	vwqd6ogYML/Gxb21tzyuUUWkLiETyM736GZfLZYST+seaOitbBVibsquCCoS+/N+/aK2AqpFOYcpp
	QdqSWxbRYiWHLNl1a0Lej3k0VmL7f2C6xqfylZcRALz+USCXa7GiWeMd6AnbhwjekjNE7otmWSxPC
	+EL+CqEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkVl-0000000BVWh-0OoL;
	Fri, 30 Oct 2026 11:11:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkVj-0000000BVWV-258K;
	Fri, 30 Oct 2026 11:11:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 57099602CA;
	Fri, 30 Oct 2026 11:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD301F00A02;
	Fri, 30 Oct 2026 11:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793358662;
	bh=zxZ61noBemOEJ9Z/Swm3wSwkY7NkjJ1S3EShVMj989I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B6wz9Fxz6TcjWK5RVkgW6OK/pRylEpQuIfP6QSdziPqzdCOAuAFyIBvq/pCr7qsw5
	 RfgaO+FBxRrCG1LU3kErftUbiB6gvDTvFbV9W2hBdFTN6jk77WWFZaWZwIcYvxammu
	 6jzm1CHzHKNkesPb1ERuda8+n5pEP3J06XSRzDXcmJgJmrk/r4jGn7QcrpLsEwqyG4
	 Z5lzbOp3Y/ycXRLdiqX2+jnRxPjswUlwyzi/o1OKjnruDxpaDCMUROAmawG2BmSc43
	 Kroj/hsVhjz4f89dQrGEs8kFHbFad30/9x8vNTJMEZAtZeHOS0xXIDEimf/9MEE6Hi
	 /0MUq4weqCK+g==
Date: Fri, 30 Oct 2026 12:10:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, vkoul@kernel.org, mani@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH 1/2] dt-bindings: phy: amlogic,g12a-usb2-phy: add S4
 compatible
Message-ID: <20261030-chihuahua-of-perpetual-current-1d40e3@quoll>
References: <20261025192202.209045-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192202.209045-2-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261025192202.209045-2-christian.koever-draxl@student.uibk.ac.at>
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBPY3QgMjUsIDIwMjYgYXQgMDg6MjI6MDFQTSArMDEwMCwgY2hyaXN0aWFuLmtvZXZl
ci1kcmF4bEBzdHVkZW50LnVpYmsuYWMuYXQgd3JvdGU6Cj4gRnJvbTogQ2hyaXN0aWFuIFN0ZWZh
biBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+Cj4gCj4gVGhlIFM0IFVTQjIgUEhZ
IGlzIHRoZSBHMTJBL0ExIGRlc2lnbiB3aXRoIGEgZmV3IGRpZmZlcmVudCBhbmFsb2cKPiBzZXR0
aW5ncywgc28gaXQgbmVlZHMgaXRzIG93biBjb21wYXRpYmxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IENocmlzdGlhbiBTdGVmYW4gS8O2dsOpci1EcmF4bCA8Y2tvZXZlckBvdXRsb29rLmRlPgo+IC0t
LQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L2FtbG9naWMsZzEyYS11
c2IyLXBoeS55YW1sIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKQWNr
ZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAb3NzLnF1YWxj
b21tLmNvbT4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
