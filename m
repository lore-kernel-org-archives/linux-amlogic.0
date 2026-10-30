Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65367606A326
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2026 11:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wo+UIW6/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=koSobmDN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5VMURa0KO6DiIxDkYwuK/mOW9ADBHnZ6NM9SQ+rU/KI=; b=Wo+UIW6/GVU6lKFYAps0pZjaVY
	YcUrfMWLn2USlTx/8HRK8N/5A/LyvqJnv6Q4mQvsVKgd7QfwJ/jhi4S3emDLvZcbm+bJR0YJZgs5f
	1Mg+ZeDzu1oKKGlkms95oY5J3qr8rxi4Eiq2yoLOlfK5v0iDV33DXrryhr2RThQPvORwdFc9/7YTh
	XyJwVuDJ6BeLQM11Mrb6szm+sk9ua2nQBDbceFsUvTOB2RtirP+KJIqA6TQOCdvwnxzML0tM3VNQA
	MI9/Y8PVt/CHTK4Y/Pv+2PHnKZxDSq5Ty9DrA1gsPc6TRL8HRgKTixpcAirzsX0iw4AXUwBvqvsQ8
	YJOsC4GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMka0-0000000BW5q-125m;
	Fri, 30 Oct 2026 11:15:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkZz-0000000BW5g-0tpm;
	Fri, 30 Oct 2026 11:15:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A3490438F8;
	Fri, 30 Oct 2026 11:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1B21F0093A;
	Fri, 30 Oct 2026 11:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793358926;
	bh=4LuX6viShIi0dZkWLBzFB0AnGUBKUuhfZQE4sOsfOL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=koSobmDNsosyI2zvhAxvlL4srpRmz79RPyy0cykC6V3p6prMwP/y7DC7uMuTszGTv
	 BG3mNdgEf1FC44ikXoPJbiNxlVCiFi9VANl5UdM4qnkOyfhplcZOw5GRd9U1yzgYul
	 uNRd2okYdwVh0oc6CcUD/FA8tmDpo9fzGM1goXjPB7VZiE1sfh49/Q+MZf+ajtP82Z
	 AaPKFoWq3teCVundpmSTf2m8qoyVYWGoXKmjAqm8Rj1c6CQQzvSpx33CBiq+d5GbLP
	 3VCUfX9Eit+2ST8x6xksGoNm/8ySFDGK62SFdvDKW1yVbaJmaV7l5nrQH0fy/Cea8Z
	 ZBCvcFKVk1Gdg==
Date: Fri, 30 Oct 2026 12:15:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org, 
	bmasney+clk@redhat.com, khilman@baylibre.com, martin.blumenstingl@googlemail.com, 
	rafael@kernel.org, viresh.kumar@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH 1/4] dt-bindings: clock: amlogic,s4-pll-clkc: add the CPU
 clock
Message-ID: <20261030-rustling-expensive-lyrebird-aeb880@quoll>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-2-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261025192219.209137-2-christian.koever-draxl@student.uibk.ac.at>
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

T24gU3VuLCBPY3QgMjUsIDIwMjYgYXQgMDg6MjI6MTZQTSArMDEwMCwgY2hyaXN0aWFuLmtvZXZl
ci1kcmF4bEBzdHVkZW50LnVpYmsuYWMuYXQgd3JvdGU6Cj4gRnJvbTogQ2hyaXN0aWFuIFN0ZWZh
biBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+Cj4gCj4gQWRkIGFuIGlkZW50aWZp
ZXIgZm9yIHRoZSBTNCBDUFUgY2xvY2sgc28gdGhhdCB0aGUgQ1BVIG5vZGVzIGNhbgo+IHJlZmVy
ZW5jZSBpdCBmb3IgZnJlcXVlbmN5IHNjYWxpbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0
aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+Cj4gLS0tCj4gIGlu
Y2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYW1sb2dpYyxzNC1wbGwtY2xrYy5oIHwgMSArCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKQWNrZWQtYnk6IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyenlzenRvZi5rb3psb3dza2lAb3NzLnF1YWxjb21tLmNvbT4KCkJlc3QgcmVnYXJkcywK
S3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
