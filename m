Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4754AC43458
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Jul 2026 20:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D3P8vFt09nJnG/GUkY3k1cOstAvymmJ7uTYR4XscWx0=; b=GFc9GDh5Sp9V49
	EEjuC7iknKLKjUfPAQxSLljBQK95wGdBlYSZyF98LnBGxUhoDzoUPt2wiwOrbREi+5nlcStqg2OE9
	oP4bxiavHELztEqra+x/JMJN9NovjMUx4ofhHYxzYeciYsiE12c+O4/JMAqerplvmoT8Y5a8I01ek
	vWRATJl87OKYityoFa7jF/XUvZeXZZmyG75rZVFvWPtCUF4JnQxdrT3ClL43rFKAMD1vBfFOwtts1
	9DFb1lIhaNMqGTHefF4iPmWf9cJMFLwGd9t4UygNuyAkT1nV955Io+Nq797QoVXdJ2XxIDejtekp7
	beQpWyk3ZtiJOUUzElFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whYUC-00000000Jji-2QXS;
	Wed, 08 Jul 2026 20:03:12 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whYU9-00000000JiZ-3oQs
	for linux-amlogic@lists.infradead.org;
	Wed, 08 Jul 2026 20:03:11 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ccdb73f0e1so10860855ad.3
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Jul 2026 13:03:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783540988; cv=none;
        d=google.com; s=arc-20260327;
        b=I69JifKE4OleERI3EfmO7mOsYUfH26OM17GWi7bt83AenFh5mQnQvqhLxgaHfW0LgU
         /C6wEHzM+coNzkiXeY6FxD+Z6V4OWFxy9lProIQbb5gPbd85tKK7GBdQrh94P6nzruOc
         TBPsgHAPJz99DYrNaXZaYCIIy0xu408NxLvnz3l8RRGt91x03dHpnj7lvnzPD0Uq7k8L
         L65bNNGLBk8uNWfNkfTYudbex0OjAfMNzg3aql3jgx4Y3cC0gDminDs0w4MaMZbpEMQV
         rKHED6IqYniqJDSoyQrgqCO/Duxwz47OBRH6/MbQ71xWjcUWqqQhUzNfc4diFrH9UAMQ
         79iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3raWAoLWRdXsO1B6qPL4d9kyKqPCs3bPbCVnUUFegwg=;
        fh=P1KefQjaxyim8iHQgFQ1+2eu1HJY+ryi2f32sWVlxOw=;
        b=DvpxR5wryojr4UIt2A4qhSttwP01k3n0aBIW5zRy+z4rj40+sbempdEUSLxeRhNy57
         H9XvTyXE6368dO5JOqihQNVjfbMZfWW+QxikQvsS4qob3PNcasr0EmSFztFXRv0CYOSL
         y10fXPdLIourG2ZdrkM+N4g4lhFZtWC8YcSt4OdbkzVnvjGrSh3LgjJAR8eWdHyv+Qyb
         kKZBuYh7vYCptZmrcpctiQCs/cqJfetRwcX9CKklV3KkK2pLZ8SQCLDzsgWArhyVY1/C
         g/Y0eWd1qi9NJTPV83/u/1IZS4C2xTjZgalX33ULYgbjwHUZDjSSsGVAbzq3gaogGQgV
         qdlQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783540988; x=1784145788; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3raWAoLWRdXsO1B6qPL4d9kyKqPCs3bPbCVnUUFegwg=;
        b=qrR36a2afjilIM1/0Zca8L4izZ1tLaABxzwfv7sMStjLjGarIOVw63uIAQkQ2FtZkW
         9FtGLxqnXJfWe1CjhXohpYmBHXm2TcH3+9uR6CFS4mEWkEAtsMNtVuHtBo7ZuVVOtd0G
         4Hn5aA/yrrjKs2YKgrZt5OmrLZvQkB7xgPRz1FBJQfsNNW53uw0s6gJAcv79/hl4FV+X
         1BFqHD/CR0eys/aGJXcyP0OUYhngytePo5rQZh2PN28iDXCQge22jMzI5AOS3efUs9qL
         FeFEuCvbs6tJuT+Abx7aHpoi2jjPvhKwJABdoa4lkq42DT7hAN9U7QZTukZUeufJEaW9
         SMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783540988; x=1784145788;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3raWAoLWRdXsO1B6qPL4d9kyKqPCs3bPbCVnUUFegwg=;
        b=UPGoyQLQSZiPsQE+gs2zhMd+XohC526ND5Cp8kFlM6FySy+RWheKBLMWdyK+B3reQS
         MV7qo8lmWQojUBemEpyNrk0UXY+LJlfPDqooBfkeXMACzmXllVVgZZCse8CohDINtlkM
         Kig6cfM1dOOgo6BYQfpsCXkn66T9M7e53g6cvyxxlbGO5Dm935T+HGcuGFCsb3V5Mfoq
         A25iej2rD20Y2XzpHi1MTr+vxjrblUgwlSMuJHpy26XwAdXDSnrYjVQYq9O+Nonl/sES
         wl/Q3oLgXkxifPgO1d9opwqjT6kBoefQtDpPIoxarAJcdbgVmEhRoB6jWq0L1gUQzGMN
         Nf3g==
X-Forwarded-Encrypted: i=1; AHgh+RoA3kwqXUZ9X/yhm39oD9MFBC1iUKgpJBen2HstFUwYEdLrY5Oxz7ZV6j8k9HbVyOsi1mht7qv5DcsyE22Y@lists.infradead.org
X-Gm-Message-State: AOJu0YxK23sYhBY4AvOK6YEeZJ+dmJXPsQIyaKEx8u80SxwK2hfm5a5p
	fougIiMxVxuYYnkWgFtF5+KEUnmZ84BbKW2qShSHySzUkbznd6qa6R39Y+apTjx8kOVF2OiV9/J
	IQvPhMu48k9ePfLEOkl0B9gGqfboU2U8now==
X-Gm-Gg: AfdE7ckRkw7YkaUplF68ahEJiJmMvKrduR4uwLYQ+KR0zK6SfJzYmgfjQ/DIPt9bLA5
	cuMty90LeqYztQuKXzdiS9kt0d8MHMp+1s+711EB8QndMYICQ7rBGFZGI1HJUCMzBJjV5RfZIxr
	hWFNLw+yOLNkPM6EX0NMDjsjYyNOZwloijzxB+45v7iU+z0d6AuNE9FLWjB9pFnPPc2V4yuz8ut
	CH59EP2LDOdFCu2EQZQ8w2zncolwUNOuRsFvi+s4Dc9JZK3ZjA2bubHy/fo4RhgHePrmC/76Smh
	MhFSmlpTDZaUWoIWGPXdCNr5OCJUfA==
X-Received: by 2002:a17:902:d507:b0:2c7:f12d:5d37 with SMTP id
 d9443c01a7336-2ccea3b4332mr41011575ad.17.1783540988351; Wed, 08 Jul 2026
 13:03:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com> <20260706-a9-ir-v1-2-4f082ca8aaf1@amlogic.com>
 <CAFBinCBbRrt6jWj4pczE=-j86Sw2aiAaBpUoTx1x9XErw5NFpQ@mail.gmail.com> <74fc6cfe-f844-4cbb-bc1e-0ad96af37040@amlogic.com>
In-Reply-To: <74fc6cfe-f844-4cbb-bc1e-0ad96af37040@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 8 Jul 2026 22:02:57 +0200
X-Gm-Features: AUfX_mylmZnzRL8QYx31DSmWj6ivxEWovLb2UkpKfybbs6Pkvk-Opma3o6RcohY
Message-ID: <CAFBinCBQ+g8Kr2tL9ob9PvTakGrtwH3qZWjEy-ytGiufGUEieg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: a9: Add IR controller support
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_130309_954496_A4A4E986 
X-CRM114-Status: GOOD (  15.22  )
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

T24gV2VkLCBKdWwgOCwgMjAyNiBhdCA0OjM54oCvQU0gWGlhbndlaSBaaGFvIDx4aWFud2VpLnpo
YW9AYW1sb2dpYy5jb20+IHdyb3RlOgo+Cj4gSGkgTWFydGluLAo+ICAgICBUaGFua3MgZm9yIHlv
dXIgcmV2aWV3Lgo+Cj4gT24gMjAyNi83LzggMDM6MzMsIE1hcnRpbiBCbHVtZW5zdGluZ2wgd3Jv
dGU6Cj4gPiBIaSBYaWFud2VpIFpoYW8sCj4gPgo+ID4gT24gTW9uLCBKdWwgNiwgMjAyNiBhdCA0
OjQz4oCvQU0gWGlhbndlaSBaaGFvIHZpYSBCNCBSZWxheQo+ID4gPGRldm51bGwreGlhbndlaS56
aGFvLmFtbG9naWMuY29tQGtlcm5lbC5vcmc+ICB3cm90ZToKPiA+IFsuLi5dCj4gPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBmdW5jLWlyLWluIHsKPiA+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlX3BpbnM6IGdyb3VwLXJlbW90ZS1waW5z
IHsKPiA+IENhbiB3ZSBrZWVwIHRoZSBlc3RhYmxpc2hlZCBuYW1pbmc6Cj4gPiAkIGdpdCBncmVw
IHJlbW90ZV9pbnB1dF9hb19waW5zIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy8gfCB3YyAt
bAo+ID4gMzcKPiA+Cj4gPiBJJ20gd29ycmllZCB0aGF0IGFkZGluZyBJUiBibGFzdGVyL291dHB1
dCBzdXBwb3J0IGF0IHNvbWUgcG9pbnQgd2lsbAo+ID4gdGhlbiBsZWFkIHRvIGNvbmZ1c2lvbi4K
PiA+Cj4gV2lsbCBkby4gSSB3aWxsIHJlbmFtZSByZW1vdGVfaW5wdXRfYW9fcGlucy4KSSdtIGFs
c28gaGFwcHkgd2l0aCByZW1vdGVfaW5wdXRfZF9waW5zIG9yIGhvd2V2ZXIgdGhlIGRhdGFzaGVl
dCBjYWxscwp0aGlzIHBpbi9mdW5jdGlvbiAoc2VlaW5nIHRoYXQgQTkgaGFzIEFPLCBDLCBEIGFu
ZCBURVNUIHBpbnMgaW4gdGhlCmFsd2F5cy1vbiBkb21haW4pLgpUaGUgcGFydCB0aGF0J3MgaW1w
b3J0YW50IGZvciBtZTogaW5jbHVkZSAiaW5wdXQiIGluIHRoZSBuYW1lIChzbyBpdCdzCmNsZWFy
IHRoYXQgdGhpcyBpcyBJUiBpbnB1dCwgbm90IElSIG91dHB1dCkuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
