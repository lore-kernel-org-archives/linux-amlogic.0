Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5DEC43458
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2026 19:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oiA/xdaj1LLo3wMIADcd76y7OxaUhhtvUTy1XakPJZI=; b=RmyZ4kx7/WPWz6
	T4JaBB28VVLjxjmLcEHB/QLUyILplXRbleGSu84a5akyZXC4rxlvCxD8QC4KEYV1cDwkudc3RY+jL
	zWCTHurbMEQaweLP2l4/sN8+z2zgfXmTfNk6kB7IJM5t9aVcgkcR1TYIIizn/bhFyzu5fZZNLTIbm
	WdKD9ocJ+5Gsrlj2ZnmJIK/aDJNEuJSQxTO5hHjR7gry4wiWzvPvVmV1aQio7yxdq01I+kMNTvx/z
	2CO5Dip96Kc3Mxv/ZihbQQgeHYxkXOIavU/dHPLWFpphmXS4+bDiHxFDX2SDzvaJCNGaTH5w9XQz3
	kMsvA0r673AYpUGy7KnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBdO-0000000Fmj4-0Nsu;
	Tue, 07 Jul 2026 19:39:10 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBdJ-0000000Fmhe-3xix
	for linux-amlogic@lists.infradead.org;
	Tue, 07 Jul 2026 19:39:09 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2cc61541f8cso15292985ad.0
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Jul 2026 12:39:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783453145; cv=none;
        d=google.com; s=arc-20260327;
        b=XjCtL/v1JLRmXpzthMYLEzEEOH0OslaVRi29hcG5MyEYOGoY73INS+RZAtO8Lgxnqo
         2gftSjUpkCkrgInkWs7DzEl3W5R74y7RaWItetzwEAaWDDaee8A1DgOJC/dkCAcNlvoB
         mD4ZGhLJPOKQslteB0ahN9b+M6xbNNEz+ZTgXhY1VbPqjQMHq825+x5h2H8vY3/fqSig
         H5AHL/hZ4sMk82ajXx3AGhXL4Jb/T6X03za/kHGGaKaEacwumBsAEckMy7OG2w2AheDf
         H24y0ovMf5weq6EpPw166mxlPU8U6+Qaah3qIUvx3uRUgyQROJhafvAG4kr3X7BnPmap
         SC1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TXx/NcgXG31PUtUiinH8vJvIK7iycglmeDb/mzIBX1w=;
        fh=yvyes5OTZs3n8lVa0DYIpckZcuzX7NQBbV1XDup4Ls8=;
        b=kNNDpE4BZcBhJDJ3cNbWpddBHs3Y9Z4EwW3Sx+WfRR27teILL3Pyw8mJO1zbEaYpAb
         EfqMBKslU6ob14uS1FnHdtxyPEgQoxUC0amX2pNUsxwR695XPqmPx2b+jR5ItNX//4Vv
         EIJBDU8U9IEWp1rR4paPSGYp4Cvy4S/ucMXmpwlz4gjaXDiXl7aaKqxgGy9+t3JKXALY
         ep/pf3Yu6lI4E+kjDhd/JMv9rSLXRClEvcqvOKAusvk6LDW7Uo8BDZA4JFpP3ooJrFot
         NN55RiqNfcKneBYRup1W4eVLeGhJjzIzLcSZBPj75zBIXkBUY4LB1ANkC+iKS8ZK8TpD
         NIzA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783453145; x=1784057945; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TXx/NcgXG31PUtUiinH8vJvIK7iycglmeDb/mzIBX1w=;
        b=AdaakdYgi8zsywAMw/1Bz/ODvGX7sRBBRIAxvSTia82LekwlO9OlZnSZUmzR7jsaWl
         Hk6B6oK9MeKo1ikGCf1bopcNS6FSYdQ3EFyWdPHgY0ZgUxxOvWHVNJ1K8KLGxrMKscip
         RjNz4usFLPM6B1arV8/vgrBClLaaGfgtrR6bMloFrU5EPTcfKop4c+xAfr9P6Cv1tlnf
         vkNg4hNYqpjmw8LrHH7Oxak35yVx2QoZKsIBqVw71RkibY1xDohUUbxvGHl+6jCO31nq
         h98eVpLsv9d9TCKxBb2dOz6Ld2PqIWg46EvFqCe1NRRjWe1HQwzJ0DoW770z/ey3g4Z8
         3mAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453145; x=1784057945;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TXx/NcgXG31PUtUiinH8vJvIK7iycglmeDb/mzIBX1w=;
        b=ZvtyLSNTH+f1SpfCj2tJ88IPzbwgJi0mgv1ME9ml7wHDYx8tFWTuc6LYiulGj01Zvz
         lGMX+PIpGvXVgZv7IVQ/TwoLnrOO488BphKE0QnsSb8HZIYpIxkE0ADYiiAajn853W7T
         yttpHGgQdXF5YXlU6oLLh26uscn1Am4CEhw7GDWYsEYQAiCS9Dxo/1YQdBE8djIVK4bT
         qeoqiNUNf3x1oC5XY/dn4QTZqRewSGZi4UI3eWWyrLCv/59ugS5Z0TDvwOhg9eSKi5Ux
         6xjjeOCwOoVcESZL635U7/7N6xd4XAK3s/06d8E0cF3oknpghdR1TnQvUvbzyFPiwE66
         1vWQ==
X-Forwarded-Encrypted: i=1; AHgh+Rppe+BbuDrezbHfjPWfdWEPmq5D+dyolh8yWqxb/a2ZQrpUyuKkny0RFIdGoXH7uOs50U2G3gv/XfM8gUGq@lists.infradead.org
X-Gm-Message-State: AOJu0YzfGjJH7rO2dlzvJtYThqL5deZp3bR3KDyBBKRdqozM0IDHEF4R
	y4JkFpyGhEuE3YAbnnl+L2wc5TKSgyiqyEHe6aFLkTl3VfAgBSUPciXKuPHiAON019NbaJI8n3n
	aGAgzuZqdO4dberiLGBQflM2Uo4Po7W4=
X-Gm-Gg: AfdE7cl8dwFXkPzJgVQQPQqf3fgFyulsJb8qkLkHfe5JVkrHh3/DNbEi7D13s0xZ5mA
	YlLit1MvKpxIO/JaXsfPswbVjqPhE+rApxTfeSc79QF7XHyCoaEQG1IDpSQ2gGdB8ZHHBaNf1bx
	ul383H9Rdn16nNJ2lHasMviBqt2Ke2I3urfRvVXdrqcUweGaZ2MdpnsKkb3rm44EdrDbffSkSnL
	Qffmn30cXlxf1Cp0Bpq/e4a3nddrzbqkkkg1aypSLpFAGMiXXjqc9GwLluTm+OiZd2nRoT8MHrr
	5bnzxKUCMCIvfxW6mEPsw7mQHQbBX8kmn7Xo
X-Received: by 2002:a17:902:db08:b0:2c0:d94f:50c7 with SMTP id
 d9443c01a7336-2ccca8f720bmr37243375ad.7.1783453145051; Tue, 07 Jul 2026
 12:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260624135650.727077-1-jerrysteve1101@gmail.com> <20260624135650.727077-5-jerrysteve1101@gmail.com>
In-Reply-To: <20260624135650.727077-5-jerrysteve1101@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:38:53 +0200
X-Gm-Features: AVVi8CffeiaHURy-2AEleWqNmHrerEbtp1JXKt7I-5nEUnoXQSWzsH5GdBfCNl0
Message-ID: <CAFBinCDq7dv4vSC7=Gr4iqydfnKs96VkPpqzG7w7JVUSQceMvw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: amlogic: meson-axg-s400: enable
 mipi_pcie_analog_dphy for PCIe
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Arseniy Krasnov <avkrasnov@salutedevices.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_123905_982028_A127BEC7 
X-CRM114-Status: UNSURE (   8.30  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdW4gMjQsIDIwMjYgYXQgMzo1OOKAr1BNIEp1biBZYW4gPGplcnJ5c3RldmUxMTAx
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgUENJZSBQSFkgbm9kZSByZWZlcmVuY2VzIG1pcGlf
cGNpZV9hbmFsb2dfZHBoeSB2aWEgaXRzIHBoeXMgcHJvcGVydHkuCj4gRW5hYmxlIHRoaXMgYW5h
bG9nIFBIWSBub2RlIHRvIG1ha2UgUENJZSBmdW5jdGlvbmFsbHkgdmlhYmxlLgo+Cj4gRml4ZXM6
IDk3MTViMDFkYTZjZiAoImFybTY0OiBkdHM6IG1lc29uLWF4Zy1zNDAwOiBlbmFibGUgUENJZSBN
LjIgS2V5IEUgc2xvdHMiKQo+IFNpZ25lZC1vZmYtYnk6IEp1biBZYW4gPGplcnJ5c3RldmUxMTAx
QGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVt
ZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
