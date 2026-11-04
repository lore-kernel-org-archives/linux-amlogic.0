Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299CC606D805
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Nov 2026 13:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pqu8WPZy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jI6RFciy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7iVhQ/O4s8p5aXmrW72sYjokwflUk5lXY5iwqdDZvmw=; b=Pqu8WPZy4GggLh8CwDMb1iTTZZ
	Jw8PvYV+PLMeUP8kKZazFcOAc1ngdY++mbJOrqmE1HEya6cJUWl/ZlJRsRYzbr37slKtj6uQnEv0N
	pQcelDA6bCZCfrRg1wzQ1HD440GcRkgsBQPeim7W1n2mZd3C8AnsVEeLDStN6dj/roxRtWO5W0ktN
	gysj7c5N2IvP159QkiCh7EkNIa9cbkenYX/GpQw/ek2ZM16bb4NFKz6n51x5TaFCf59i2CW9EvZyh
	nFRTgWnzuLw5N1CaXi7GZXYGzsiFVu06m3FNCEXYAmfuWHGwhC5FdikFlLZJi9Tfsuc9JRg5ifeBy
	G0YiFzfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaps-00000005SMN-0ZwQ;
	Wed, 04 Nov 2026 13:15:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOapq-00000005SLY-1u2d;
	Wed, 04 Nov 2026 13:15:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B1E6C60ABF;
	Wed,  4 Nov 2026 13:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C1C1F000C1;
	Wed,  4 Nov 2026 13:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798125;
	bh=FYpkozZQqv5x8iGDJjbaY+F1srftlQoPOW5hP9D9X1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jI6RFciyCCWXNetAAeL6LGKusLjRvuvWTJ8+RHwmtT/2IiFX5IfOAy8MSAtkWPUip
	 GSZqGcD3pCUTusSIts9E5lgJQohwbGovx7ec86EX1qsk5uYKPOtGZcB9NyhLPUdP/a
	 VBlGa2wJ+JnjogABNC42/9mj93Jp2xqiZKfWakmfQOM8h8vbBqnEGo4t+/nY9beYQ3
	 5vj8SdWcZo9H+qJEApj2vqBTzm+jl+27bC/LZFAgZhDo1/RDj00IYPrsm0RI0E7EkG
	 fKa5g4uSBAWXh+8hffpU75CNxhRlQmVN/0+DtNrAQjExQbyQuX+5EsuYDdY52vApuJ
	 n+EKyQLHrrG8g==
Date: Wed, 4 Nov 2026 14:15:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, sean@mess.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH 1/2] dt-bindings: media: amlogic,meson6-ir: allow
 wakeup-source
Message-ID: <20261104-taupe-eagle-of-experience-d3b6ea@quoll>
References: <20261025192320.209446-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192320.209446-2-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261025192320.209446-2-christian.koever-draxl@student.uibk.ac.at>
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

T24gU3VuLCBPY3QgMjUsIDIwMjYgYXQgMDg6MjM6MThQTSArMDEwMCwgY2hyaXN0aWFuLmtvZXZl
ci1kcmF4bEBzdHVkZW50LnVpYmsuYWMuYXQgd3JvdGU6Cj4gRnJvbTogQ2hyaXN0aWFuIFN0ZWZh
biBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+Cj4gCj4gVGhlIHJlY2VpdmVyIGNh
biBzdGF5IHBvd2VyZWQgYWNyb3NzIHN1c3BlbmQgYW5kIHdha2UgdGhlIHN5c3RlbSB3aGVuCj4g
YSByZW1vdGUgY29udHJvbCBrZXkgaXMgcHJlc3NlZC4gQWxsb3cgYm9hcmRzIHRvIG1hcmsgaXQg
YXMgYSB3YWtldXAKPiBzb3VyY2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIFN0ZWZh
biBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+Cj4gLS0tCj4gIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9hbWxvZ2ljLG1lc29uNi1pci55YW1sIHwgMiAr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpBY2tlZC1ieTogS3J6eXN6dG9m
IEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBvc3MucXVhbGNvbW0uY29tPgoKQmVzdCBy
ZWdhcmRzLApLcnp5c3p0b2YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
