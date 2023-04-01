Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE075C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Apr 2023 06:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9xEYsA95YAgspHFi7LhfJtjtajuKuqwdTAUX1kw9MNQ=; b=IMZne4NsQtMnaO
	VksGM1+vGMpdXpEIhG5igKy2dtTY/yp3DmAGtklRNZUyT+1QLujSmf/qwTXmNCzHPjcrG/GTykrWy
	5S5XLuyKkyc3SNPK9GKwm92UKL+wTMvjAlMzJkxjJ/OwAFpLCrAVSEhpweXvO66+gQ6KkbHTYVUSH
	s6ekfhxUXSNkWfgZBCQSelFs7HRNA02rv5bizY1gonUBjF1ENV8rt5KeQwws9bY9Tw8ANiYHt8wXL
	TMCVTW5gCDt+w0sZWBna7ZCMfQFDQoBpOZWLQu3TTm0u5BsXqjbiDrra3j5wHDngrMNvByiUcA5fq
	jy8+OSNDNLdmS1EBoucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piUoT-009rOW-0i;
	Sat, 01 Apr 2023 06:34:09 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piUoQ-009rNf-0M
	for linux-amlogic@lists.infradead.org;
	Sat, 01 Apr 2023 06:34:07 +0000
Received: by mail-yb1-xb31.google.com with SMTP id j7so29718522ybg.4
        for <linux-amlogic@lists.infradead.org>; Fri, 31 Mar 2023 23:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680330837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7s9q2glYy7js70Z3ap49SItNnvHkMFlV8iPiQeA75o=;
        b=DVsegUnYDbIDyLoaUw9q8nOleT9TUrYG6ZVsDtG1gwVq2bWJuYfqR0GaZlkKPW+O2b
         Fq1SWGDMO7TRGvGNWZmMpmtX3atKIYEQSAJLzbsu/GC+xWdUhYA/eQjzyCqY7UGjSeTG
         DAhJxAKySMwcKXB+hiuZuQc/0Q0UEQujL30CY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680330837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7s9q2glYy7js70Z3ap49SItNnvHkMFlV8iPiQeA75o=;
        b=5gjsOEzxJNOCq5ZObQG+nsSMdp4ZfoCI4J7kKaHY7hX5gdD4PoA57DzZU6I33tnEKg
         AvLn5xA+Rj87kZjCU/h5tdRC9a+YLKjqLP3lBjQfQyFZ5SHntwBnZ8LNx6XbD8pShUff
         A/F/Hqs0B3AQM2086J4PJLVXlrVPNo3G1sYDsbtAHMWZZNOKwPvTDK2LRFwSoFJqXviw
         RfRo6+NueiCTzqj4R/EMzLfNqCLdVQgt3tEnp9lKss+UpCkjNd92pAnyFPshjrj+Qptm
         lIAnfxXNjgwEyweeOt/GKK2kJcdewiticDsy5gXOWO9tNUAm8/YhaFdnrPuJ1u9OZ2aP
         EQSQ==
X-Gm-Message-State: AAQBX9fg5QBsq8J3EaowXUWkXIyCCxO2lxuOTIHHghpxn7Z7hNZRSlnJ
	qY72uuHvOD3xDRshVxus8F8BEwx7cHwVE1sR3vd5sg==
X-Google-Smtp-Source: AKy350ZTfKGF/TyHNOh7wUgxspaEY4+lkczGTpINf/MJSPRCFll+UdcPxduh0KbDRT6VhlOHfHYJamtth8hqywb4h88=
X-Received: by 2002:a25:d784:0:b0:b76:3b21:b1dc with SMTP id
 o126-20020a25d784000000b00b763b21b1dcmr7524091ybg.0.1680330837072; Fri, 31
 Mar 2023 23:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230320114609.930145-1-christianshewitt@gmail.com>
 <20230320114609.930145-30-christianshewitt@gmail.com> <CAPnjgZ1HW1x3CJ27icDifh4+hjUJjpwCM--FtatzJhrWjkEueA@mail.gmail.com>
 <4DEEACF6-2D41-499E-A2E0-C2DD31E28B03@gmail.com>
In-Reply-To: <4DEEACF6-2D41-499E-A2E0-C2DD31E28B03@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 1 Apr 2023 19:33:40 +1300
Message-ID: <CAPnjgZ31yd8v8ip3=csY0hGv693h8WZ9=f+hi1J3x_j8VjSjUQ@mail.gmail.com>
Subject: Re: [PATCH 29/33] doc: boards: amlogic: update documentation for
 WeTek Core2
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: u-boot@lists.denx.de, u-boot-amlogic@groups.io, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_233406_149072_5EAEDBF0 
X-CRM114-Status: GOOD (  18.18  )
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

SGkgQ2hyaXN0aWFuLAoKT24gVHVlLCAyMSBNYXIgMjAyMyBhdCAxODoxMSwgQ2hyaXN0aWFuIEhl
d2l0dAo8Y2hyaXN0aWFuc2hld2l0dEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4KPiA+IE9uIDIwIE1h
ciAyMDIzLCBhdCAxMDo0MCBwbSwgU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+IHdyb3Rl
Ogo+ID4KPiA+IEhpIENocmlzdGlhbiwKPiA+Cj4gPiBPbiBUdWUsIDIxIE1hciAyMDIzIGF0IDA2
OjA1LCBDaHJpc3RpYW4gSGV3aXR0Cj4gPiA8Y2hyaXN0aWFuc2hld2l0dEBnbWFpbC5jb20+IHdy
b3RlOgo+ID4+Cj4gPj4gSW1wcm92ZSBkb2N1bWVudGF0aW9uLgo+ID4+Cj4gPj4gU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0aWFuIEhld2l0dCA8Y2hyaXN0aWFuc2hld2l0dEBnbWFpbC5jb20+Cj4gPj4g
LS0tCj4gPj4gZG9jL2JvYXJkL2FtbG9naWMvd2V0ZWstY29yZTIucnN0IHwgODMgKysrKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0tLQo+ID4+IDEgZmlsZSBjaGFuZ2VkLCA0NyBpbnNlcnRpb25z
KCspLCAzNiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBUaGlzIHNob3VsZCByZWFsbHkgbW92ZSB0byBi
aW5tYW4uIFdvdWxkIHlvdSBsaWtlIHRvIHRha2UgYSBsb29rPwo+ID4KPiA+IEkgc2VudCBhIHBh
dGNoIGZvciB0aGlzIGEgd2hpbGUgYWdvIGJ1dCBpdCBuZWVkcyBzb21ldGhpbmcgdG8gcmV2aWV3
Cj4gPiBhbmQgdHJ5IG91dC4KPiA+Cj4gPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3By
b2plY3QvdWJvb3QvcGF0Y2gvMjAyMjAxMTAwMzE0MTMuMTk3MDgzNi0zOS1zamdAY2hyb21pdW0u
b3JnLwo+ID4KPiA+IEkgYW0gaGFwcHkgdG8gZG8gbW9yZSBvbiBpdCBhcyBuZWVkZWQuCj4KPiBI
ZWxsbyBTaW1vbiwKPgo+IEZvciBub3cgdGhpcyBpcyBqdXN0IGEgY2xlYW51cCBidXQgbG9uZ2Vy
LXRlcm0gKHdvbuKAmXQgYmUgcXVpY2spIEkgY2FuCj4gdGFrZSBhIGxvb2suIERvIHlvdSBoYXZl
IHRoYXQgc2VyaWVzIHJlYmFzZWQgYWdhaW5zdCBjdXJyZW50IGFuZCBpbiBhCj4gcmVwbyBzb21l
d2hlcmUgZm9yIGVhc2llciBjaGVycnktcGlja2luZz8KPgoKT0sgSSBzZW50IGEgdjIgcGF0Y2gu
CgpSZWdhcmRzLApTaW1vbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
