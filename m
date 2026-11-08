Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36904606A322
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Nov 2026 21:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GHK7QMOJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=SRJkhjsP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=x7ODWaGla9Rb+nAkLUzwlbZK05/aV8mNewVPClQms7Q=; b=GHK7QMOJbafj9a1l0OkemcQcC5
	y0WHypSehn75/1hAt+j4mZ2FsZWqrjlktyEx0Q5qrtusx/9gSiw4iL4RBIXCSjemhaL3E5LGZBuSR
	XMa/Hd8I5uwMYNlIBCAzg1gkF3A61jxWw0oaAfq6bnMcmlvUFm3G4As14hDQX8/pnydZcKlnqgAzH
	YpN4aXtzez4nWqrJU2aln5iQf6nG05OqBM+dllFpZ7SuNqeMSgCqF5hqVqUmy6eScEjU4F6XlTpOH
	dWDk5Meea+3kPltgN6ogilX7xqWemZ0nJT1caB/3Ksr75cxxI9sRNeJAI5XdxXMfmFbjiRU/ZojYv
	iiWPDeOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQA7Y-0000000GgDy-120w;
	Sun, 08 Nov 2026 21:08:12 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQA7V-0000000GgCF-1bwQ
	for linux-amlogic@lists.infradead.org;
	Sun, 08 Nov 2026 21:08:10 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-67bef25eb92so359354d50.0
        for <linux-amlogic@lists.infradead.org>; Sun, 08 Nov 2026 13:08:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794172088; cv=none;
        d=google.com; s=arc-20260327;
        b=fEIuaAxRrMCtUImsizwK7dzHT2b7Ht5kHwVTvTc1BN1anq2PiFuu+Nbp3RVfXDOin4
         WLW4OyUgPyWsDVPL/g5FewQFfSpVWs6lyT4qa6hIOQoYBMiHTr319ZifuNqztWlGAejB
         Tzn13MH0UuWYDhDBQaj0XVkkEGXX20hO0+zBmPPI2aVk3+COTw12YdyLRCI8PHApLcU/
         Jo8WNZmXI2ihc3uqrFzehcIdFLvgkzMlqQae+CeLx4RPzKokQM0HbGpjSbMEwFzPcbfZ
         /OTmb+955+VyU8ewp06FSTpwr88szwNHXkHA/rmhaWbTBWIM1ldGXPxE8bMFAH7UK+Nk
         wFBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TKd3XlZghnq1bRXZV5ZgDD+2oyCcUDkC2gv49H+TH8c=;
        fh=FdlThRS+NQ83RTphT1PozLIAkUASvGqdSrRixQoBxFk=;
        b=gSeGAiw3f4T6JqC3FTj6LEwhSdvc11uJqpcCohPGjPPNQpjMXQcRgLLxcNsDri/bgR
         mQ4o2wMURGD34uIybaKQOPuWCDUu0fK5z29jVeqBqgDos+Ly8ciXaAmO/o40HdDtgvd3
         FDiioT4wI6kXlShGNbwPVToWG2PNYd1uIfzjOIBxxxynWRNfWPCjhpHohwKjNud9QFQv
         EBclxyoqSXudmB2U+2kVmoRsMfR1NXWieisUp9SO+3KgL3/4U1FmMlGybKRWPvR38893
         ujPOvsgA/qtL6XXUd69Bav76xHtdZiJJjyN3unXVfcmexzceTIrY/vQ/hw0u78KAS0Dh
         g4hQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794172088; x=1794776888; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TKd3XlZghnq1bRXZV5ZgDD+2oyCcUDkC2gv49H+TH8c=;
        b=SRJkhjsPlDGAY9x+ettST3lO7T30XkAW5+9S8K2jFHag+pGazbBogkJeVZcPvYIXe/
         9NMH8xjBpyoOMQSSpW6lU3GvjQYnvvM2QaMlqFvQBuPV9eezTXUDWXcel15Bxk43lIjV
         82klPyb2nFJYz3ZKmDfKbyKyPtvWYZu1gsvVapEZRRFGzSlfiAWtC91UWVkXT6ztqZoQ
         OER3Hm+292/cVxvmtxInZWL//gkIuQhGHWX0krbpQ9K3x/BXdoi6pTGWu/eBXh0JEuO3
         38F01B/TvOr0RTNbqudHhXCuspOiRmAC/26k/jMUUbbkW6OfNu2xXS2yOazOtljuQsj/
         YJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172088; x=1794776888;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TKd3XlZghnq1bRXZV5ZgDD+2oyCcUDkC2gv49H+TH8c=;
        b=m6g7xnWaWjMXEZwIXjJaRpl3pIncL2RGnngLRB5+ucuKBN7XbcJRPCCddWixIGhEuF
         9/rjLN4Q8P7o7HyKAlEhF6oZAGRc2ZX14GVRWC9HR+zMbvpNblLulr6FxxXzBLbZ+5L6
         yGh91kJZQl08VJKPp9Sw39C8ZMPzC0GdqE+st9N0rD1e6A6jzUkbhSlze8ieEA/GFi7h
         iUw73IRRZQit/V07BFspHi2AepPAYPHrmrK0OdFN4doFW4amZOwjQyz4vGoc0ygP9E14
         Yb6iZlQEsqylRXeiDbPApZf3png7kjrEYalFkZFbP5Avhbc0wrLnm7DfcTtlGc8EH1iK
         gu0w==
X-Forwarded-Encrypted: i=1; AL+hErEqsVlT9IBfQeaz/vazJop4RxvWVI8b19UHcrLBJStiaSchmCpHp5UeW6x2gXWkmst4iOCvs40n///PmMgs@lists.infradead.org
X-Gm-Message-State: APuU4Z/CkBwPJTYtz+6Zia75a20C7Lw51LYg1imzujk7G/WFn5ubGUrJ
	PGzJn9+5TcV5DPxAKi0HFICep4HoP1a/bwpEFO1XJU6z6VG3NvukqJ0mYgckusFq0NOp6PiFOUV
	I4xMARYu5e+upCA3jUw9kUvyM069M4bk=
X-Gm-Gg: AYBFou1i2X13VO1yI9PKNWxek7coV483WEcy9+z66LOdIUPAv1c0wzqtOmcgy02GTkQ
	o38UErWoMboBe1cFRoKg0QC2FZTg66cU5stQq/Cp0j1ga1KUx+8bMHbhuqXAPVYEeTKeJcpeY5r
	iaLXGR/bHDnijXMrQetTfhx8H9nXUlZiWPgiwYchuPEi3CpBaieBmzlhU0UHzyfnz09i4YLPzqU
	egfc0L6h6tfDOMk95BVeKUofla0u+BzVTr32fYtZCK8yyoaTwGUvuWAuqGRedLmG/1NcaP8eKUs
	FB7gKZ1wlnKvOKnHkdr3EYoJ+ONZ/YJvDmHd6oOfnf3vKO9O5dE9alE9ziqcU70i/cNbvvMRsge
	vfG5lEpm2H2vPAFOxVZzoUAfufD5omhH/SICEQS0PrVlvU+Y+4NSu8aUvWE0lWIm4vlU69Jh0T8
	9NOlbVGNnKnKArX/4=
X-Received: by 2002:a05:690e:bc7:b0:677:df02:fce with SMTP id
 956f58d0204a3-67c3d7cc43cmr1612153d50.5.1794172088171; Sun, 08 Nov 2026
 13:08:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106101913.46664-1-christian.koever-draxl@student.uibk.ac.at> <20261106101913.46664-3-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20261106101913.46664-3-christian.koever-draxl@student.uibk.ac.at>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 8 Nov 2026 22:07:57 +0100
X-Gm-Features: AclHuK_oGazsWw9BXqhuCXk0AQ3FrnvIBj2gHr_VP-7Spxdsvm38LfrWlZ3lq_0
Message-ID: <CAFBinCDS_toG+4BySkUoXx73a2JWtp+tD6NHwYHk4mU+p+GF=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] thermal/drivers/amlogic: add S4 support
To: christian.koever-draxl@student.uibk.ac.at
Cc: glaroque@baylibre.com, rafael@kernel.org, daniel.lezcano@kernel.org, 
	rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-pm@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_130809_440957_5D7341BB 
X-CRM114-Status: UNSURE (   8.83  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBOb3YgNiwgMjAyNiBhdCAxMToxOeKAr0FNCjxjaHJpc3RpYW4ua29ldmVyLWRyYXhs
QHN0dWRlbnQudWliay5hYy5hdD4gd3JvdGU6Cj4KPiBGcm9tOiBDaHJpc3RpYW4gU3RlZmFuIEvD
tnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4KPgo+IFRoZSBTNCBDUFUgc2Vuc29yIHJl
YWRzIGl0cyBjYWxpYnJhdGlvbiB0aHJvdWdoIHRoZSBzZWN1cmUgbW9uaXRvciBhbmQKPiBvdGhl
cndpc2UgbWF0Y2hlcyB0aGUgVDcgc2V0dXAsIGluY2x1ZGluZyB0aGUgc2VwYXJhdGUgYnVzIGFu
ZAo+IGZ1bmN0aW9uYWwgY2xvY2tzLCBzbyByZXVzZSB0aGUgVDcgZGF0YSBmb3IgaXQuIFRoZSBk
cml2ZXIgYWxyZWFkeQo+IGVuYWJsZXMgZXZlcnkgY2xvY2sgdGhlIGRldmljZSB0cmVlIGxpc3Rz
Lgo+Cj4gV2l0aG91dCB0aGUgY2FsaWJyYXRpb24gdGhlIGRyaXZlciByZXBvcnRlZCBhYm91dCAt
MTQ0IGRlZ3JlZXMgQ2Vsc2l1cwo+IG9uIGFuIFM5MDVXMiBib2FyZDsgd2l0aCBpdCB0aGUgcmVh
ZGluZ3MgYXJlIHBsYXVzaWJsZSBhbmQgQ1BVCj4gdGhyb3R0bGluZyBlbmdhZ2VzLgo+Cj4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxv
b2suZGU+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3Rp
bmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
