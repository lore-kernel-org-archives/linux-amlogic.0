Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF11CAC5A7
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Sep 2025 11:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c4YtU8nENa6iNxCqnAlTSUr500dJOLaAuIuAtOrPfSc=; b=laL4wLwhf+Af28
	0egbryQysexCIFpEtcVuF545vaP2GVtpxIkjpS9ZzxYr+x180iAGqrbHlO7ID+W6N9nATscw5Xj6G
	FaOeyYv7DQNzx+pVG5wB9FbSYVc6fSGEpZ3fTYjnRtVi2AktdLGJ0juqe02AfuUszUkSQYtutRetd
	MF4jm67hkP5H3egcbzdXE0CGef/DgZwz/TD6dasuPHBWtvvp9L0iGDFUxPe6mZLDrAW4FA1U8u8hB
	rVMF575mbi379SfjsqT/rDzdCKvbyLFsSCV6Jo4BrLer/seoR1/7PiVzREucE0WZzUHwW6lx6o+Vt
	OWO/f8kzx1BlxOXJb2ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0eJY-0000000A8wx-2Lko;
	Mon, 22 Sep 2025 11:02:36 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0eJT-0000000A8wW-1tyK
	for linux-amlogic@lists.infradead.org;
	Mon, 22 Sep 2025 11:02:35 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-27a6c3f482dso3600705ad.1
        for <linux-amlogic@lists.infradead.org>; Mon, 22 Sep 2025 04:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1758538950; x=1759143750; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+li5jZLjno+mrEq1vnQPMSZK9xNs3cFzE65Gz2fSCdQ=;
        b=m9Z+txSg/XfW4xPCCfyv1VruF3V1190iJlUyMMJI7BWgvwc7C6iGRBaF05HEm+deOK
         4VZNynHRSjtE240AMHZcRRcRi0VRrXbX1kFnj11Q2a74lKzcrCnAafuUbjG2XY6+8Ij4
         SqNj6Cl9tUNFnRRLRmo5WnOFJzWfHee8oVwRzfPjSMRh/WLZRp2KD2JClIRvBMGkr/Ma
         qLgvWwwaOb9SoanOwFKw6U9jUdAmg1+PGilnDrE/6kgRlhHDX7HZsChHRnurDsNaL/s7
         0IF5jh1MGqs8dfqNLrSs3jeZ3/m22AP9So5BVEuPLNr4YZMes9tuADLIEh8nQsz+enr5
         x5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758538950; x=1759143750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+li5jZLjno+mrEq1vnQPMSZK9xNs3cFzE65Gz2fSCdQ=;
        b=qvIJJEvZS8r3Z/4Hyx/GvBpeoMY+v7QikYU0/BZp7cwRz5/bCujJ8bCzZPLBtGan5A
         PSoH9gb1IWqe3mcn0GBTrf+NXw5rvqsASRdJ20/0Epnol30QR1Qggtw7KfezYi1K8s1G
         7L8b8ZG4TbE8l9sxYJF/5LY05vmrK+sip479tOD4iL5YcJ4TLXCwaRu2j2JGDnlf3USl
         X9jBLM+T0ZBlt+a/EkGO9cEiAybdAnGk09/2MrM68/SRTKgmU4R3ykm25BlGjYqDf0vl
         XiPxe/E0VCPRVXXtRREoiKvEtTHjLRQ/rtixI0441DuQDs9RGegfmS6Eycmt4ScNBOfl
         qJEA==
X-Forwarded-Encrypted: i=1; AJvYcCVAPKTurfu+eBpcEYeCSbDrXM5agu4sut0JS49C1dp2b/XNmbw6G94uiB6jLcQF+LamKHTsQMpLgyOjHOGz@lists.infradead.org
X-Gm-Message-State: AOJu0YwRmOCt6zLnoFyupZ2OGz/KRvbdF25Zi6cxP3mUxuhgRXUFKugO
	d0miuaS0WIVA0DZ6o9vw2X6Evx7w5n2CoMbp8S7Pw+Gn9MllCu7/V9X+3EeKo7ruZxlF2yhCMZ+
	commNsoWU55OiCzqEL86TdTbZgY3aO7c=
X-Gm-Gg: ASbGncsPombt5OnIbwJf5YM+WBlXS+ltTJ/+m5st6lnvJcVrq1P9Wyqk1zzpevenbWX
	/NnwkJZpAWZraDYB6hJND7Toq9YdZ7CYBEMJ+l0Rx6DzyafpPsFEmbESAUj2NTlwyUIGhjiL5Ib
	m1Fq3BErAuNSizsHFrfOszi216oAjIslapdvZOrXPQOdzVOeDqdQeTCtN/431kEC3znseO6Epa4
	tLdvTSPfK2tlt92r5wZZ8edA4cjNrLxPBsWF9+V
X-Google-Smtp-Source: AGHT+IGmUtMYlpRUtriAGyHEqqhD7tsNW/oErA13JErbQr7Uwk/4xc/l1EjiIRO/SRnBAHwmetXhu5CvO/UV+bZ8Paw=
X-Received: by 2002:a17:903:1c3:b0:275:c2f:1b41 with SMTP id
 d9443c01a7336-2750c3e5feamr49668395ad.53.1758538950329; Mon, 22 Sep 2025
 04:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
 <b88a947c-7074-4fed-8283-c278b573a7ca@sirena.org.uk> <CAFBinCBe3LhN+3beovFVuWPpe3pDF5P1wSt7nPjm=ykRAx4zzQ@mail.gmail.com>
 <1jldm855cd.fsf@starbuckisacylon.baylibre.com> <aNEZcNbSfJlkP7Ra@finisterre.sirena.org.uk>
In-Reply-To: <aNEZcNbSfJlkP7Ra@finisterre.sirena.org.uk>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 22 Sep 2025 13:02:18 +0200
X-Gm-Features: AS18NWBF_8d672goWt-c8mlWPO6qTZjdU-iJtORQkODp_RuBXGukLUDReQvFfGA
Message-ID: <CAFBinCCn-rBNoCiTkgn9__NyujAbPOeEdhLskbWwg_onRh=44w@mail.gmail.com>
Subject: Re: [PATCH 00/26] clk: amlogic: clock controllers clean-up and factorisation
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_040231_508743_E6B451A9 
X-CRM114-Status: GOOD (  19.28  )
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

T24gTW9uLCBTZXAgMjIsIDIwMjUgYXQgMTE6NDDigK9BTSBNYXJrIEJyb3duIDxicm9vbmllQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gU3VuLCBTZXAgMjEsIDIwMjUgYXQgMDI6NTk6MzBQTSAr
MDIwMCwgSmVyb21lIEJydW5ldCB3cm90ZToKPiA+IE9uIFN1biAyMSBTZXAgMjAyNSBhdCAxNDoy
MSwgTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNv
bT4gd3JvdGU6Cj4KPiA+ID4gQSBmZXcgZGF5cyBhZ28gTWFyZWsgcmVwb3J0ZWQgcHJvYmxlbXMg
b24gYW4gT2Ryb2lkLU4yIGFuZCBwcm92aWRlZCBhIGZpeDogWzBdCj4gPiA+IEl0J3Mgbm90IHF1
ZXVlZCB1cCBmb3IgLW5leHQgeWV0Lgo+ID4gPgo+ID4gPiBQbGVhc2UgZ2l2ZSBNYXJlaydzIHBh
dGNoIGEgdHJ5Cj4KPiA+IEJlaW5nIG9uIHRoZSBBMzExRCBhcyB3ZWxsLCBpdCBpcyBsaWtlbHkg
dG8gYmUgdGhlIHNhbWUgaXNzdWUuCj4gPiBJIHN1c3BlY3QgeW91IHdvdWxkIG5vdCBzZWUgdGhl
IGNyYXNoIGl0IHdpdGhvdXQgZWFybHljb24gaW5kZWVkLgo+Cj4gPiBUaGUgZml4IGlzIGluIGNs
ay1uZXh0IGFscmVhZHkgc28gbGludXgtbmV4dCBzaG91bGQgZ2V0IGl0IHNvb24uCj4gPiBTb3Jy
eSBmb3IgdGhlIGluY29udmVuaWVuY2UgYW5kIHRoYW5rcyBmb3IgdGhlIHJlcG9ydC4KPgo+IElm
IGl0J3Mgc3VwcG9zZWQgdG8gdHVybiB1cCBpbiAtbmV4dCBpdCdzIHByb2JhYmx5IGVhc2llciBm
b3IgbWUgdG8gcGljawo+IGl0IHVwIGZyb20gdGhlcmUgZ2l2ZW4gdGhlIGZpcm13YXJlIGlzc3Vl
cyB3aXRoIHRoZSBib2FyZCwgdGhvdWdoIHRoZXJlCj4gbWF5IG5vdCBiZSBvbmUgdW50aWwgVGh1
cnNkYXkuClRoZSBtZW50aW9uZWQgcGF0Y2gganVzdCBsYW5kZWQgaW4gbGludXgtbmV4dAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
