Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965DEC7618A
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 12:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JSZvhBg/NcIo2m10+nMFgE5QAN7yEl6V4671MswmPHI=; b=hUDLfBNFMK4Ba6
	4stz0AGh/VyZTGJc5M0aa77uknHqt1OTr4sIe6QiZaij3eUkzrE669YPKCVFVe1L8P/Ov9wG3mc6z
	lmAof8Dt8/LBv9xbZoj5B6Pr2zibBXxt25lf8whM1H5WN+0UlKN31rTDkof3aXTNmKkmk5bkBZp85
	5Vl+oWI84/0U49uN/Y8CI9AJdupowM73UDca4gpE+i0h5aU5Qy36Ku9Zg8YacU5htl2X51JwueLcP
	3HE682T/BbQk/GX5oCTNOJiSrLhnm+jCQ6E8Om0/+e+7HUqIsMYbaqNQ1AU/SzWCI5w4+SSpEe2/d
	syH0d7RoVaW5r2lwMnlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peEYQ-008xjn-0M;
	Mon, 20 Mar 2023 12:23:58 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peEYM-008xj1-07
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 12:23:55 +0000
Received: by mail-wm1-x32f.google.com with SMTP id i10-20020a05600c354a00b003ee0da1132eso779574wmq.4
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 05:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679315030;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKSX/sOzIw4aFU1Lfx+m/zM0/Meyavyej2x5oudpaHc=;
        b=e2aIBDONURJ+44ulx0GfeCkNFXmxkhGDNNgpzu2SmiMLT3ADi29KAW+MInR9JU1ZN7
         ZsEVPyNMQiDlyCSw6K4OQjDeHtPk6ClNiNaB2wnwbF23Oa3z+r0N4O58/nzi3b6w34cu
         a6l2r1vo7bgoZA8BM7HLCKFwnhfU+dnWQ0en7oBeQoxyq1VhNqCWWShe6YbQKk9ELkrN
         YnhGTLQxcv40tcyDCtfrbMvMsQZGCx4QlyNuP5nhLSs2XSgHOtCaSzcKR5t9XadN2wMq
         YwOYtUO+w0Q0fWxAO9Q8pY6lhfIuoKWPdh9bEK9ffT8HnQl6L4MM9salobNDcWT4/UTC
         gTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679315030;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DKSX/sOzIw4aFU1Lfx+m/zM0/Meyavyej2x5oudpaHc=;
        b=nD7Y42TiGIZBiTTcG9WfT3EK0738wG+RIfMs7q0dpURru4HDCZusy3PJyuPAaM74Eu
         hys3/I6JOW2sjFo637NGriuffAyEBAK7FV63dte/y0fBP8pcjVisTtC2x8Ol5tnuu98H
         aC85CNf2Z9BXvpNnEcVlUpUXpk/Ot2ZYzkEINt7P+zHS+QqystVRMFwK22Qe6NCXr/Q3
         DGRKLdQ0/R5Eoza0EGc6Mrqay6z1n7UdVky1bmjYOoK91mKNIxM7bGN7OFUG26gq6Jyg
         subjZRxc6gAKG4CGCgLGOVulQzUFucNnvyhyhlGn9NLkppNF4lPH0g7HD/up4o6hADNk
         Zd6Q==
X-Gm-Message-State: AO0yUKUFEfvtd9jsMZsq2RmRkr4FO+BfPg7OIMEaH7g9Z0+pSN65nWy6
	A6c5tHAq1tseDkMeAHse1T4=
X-Google-Smtp-Source: AK7set9z2vd0s0b+BUjEabdFeAUjWqvRpOWZ/aNwcROfp58fBXqZDqBcZjmaqgoVZdXE+2GHkvjZDA==
X-Received: by 2002:a05:600c:46c7:b0:3d3:49db:9b25 with SMTP id q7-20020a05600c46c700b003d349db9b25mr31876087wmo.26.1679315030097;
        Mon, 20 Mar 2023 05:23:50 -0700 (PDT)
Received: from smtpclient.apple ([167.99.200.149])
        by smtp.gmail.com with ESMTPSA id 10-20020a05600c230a00b003ed2384566fsm10358401wmo.21.2023.03.20.05.23.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Mar 2023 05:23:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.2\))
Subject: Re: [PATCH 30/33] doc: boards: amlogic: add documentation for
 BananaPi CM4IO
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <5e29634d-0751-5b1b-5bfa-4a85f536f672@linaro.org>
Date: Mon, 20 Mar 2023 16:23:47 +0400
Cc: u-boot-amlogic@groups.io,
 u-boot@lists.denx.de,
 linux-amlogic@lists.infradead.org
Message-Id: <3CBB7476-13B0-410F-9F19-1323157F1FFC@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
 <20230320114609.930145-31-christianshewitt@gmail.com>
 <5e29634d-0751-5b1b-5bfa-4a85f536f672@linaro.org>
To: neil.armstrong@linaro.org
X-Mailer: Apple Mail (2.3696.120.41.1.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_052354_092484_00169CC8 
X-CRM114-Status: GOOD (  13.55  )
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

Cj4gT24gMjAgTWFyIDIwMjMsIGF0IDQ6MTMgcG0sIE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0
cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPiAKPiBPbiAyMC8wMy8yMDIzIDEyOjQ2LCBDaHJpc3Rp
YW4gSGV3aXR0IHdyb3RlOgo+PiBBZGQgYnVpbGQgaW5zdHJ1Y3Rpb25zIGZvciB0aGUgQmFuYW5h
UGkgQlBJLUNNNElPIGNhcnJpZXIgYm9hcmQgd2l0aAo+PiBCUEktQ000IG1vZHVsZS4KPj4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0aWFuIEhld2l0dCA8Y2hyaXN0aWFuc2hld2l0dEBnbWFpbC5jb20+
Cj4+IC0tLQo+PiAgYm9hcmQvYW1sb2dpYy91MjAwL01BSU5UQUlORVJTICAgICAgIHwgICAxIC0K
Pj4gIGJvYXJkL2FtbG9naWMvdzQwMC9NQUlOVEFJTkVSUyAgICAgICB8ICAgMiArCj4+ICBkb2Mv
Ym9hcmQvYW1sb2dpYy9iYW5hbmFwaS1jbTRpby5yc3QgfCAxNTIgKysrKysrKysrKysrKysrKysr
KysrKysrKysrCj4+ICBkb2MvYm9hcmQvYW1sb2dpYy9pbmRleC5yc3QgICAgICAgICAgfCAgIDEg
Kwo+PiAgNCBmaWxlcyBjaGFuZ2VkLCAxNTUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRvYy9ib2FyZC9hbWxvZ2ljL2JhbmFuYXBpLWNtNGlvLnJz
dAo+IAo+IDxzbmlwPgo+IAo+PiArCj4+ICtVLUJvb3QgU2lnbmluZyB3aXRoIFByZS1CdWlsdCBG
SVAgcmVwbwo+PiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gKwo+
PiArLi4gY29kZS1ibG9jazo6IGJhc2gKPj4gKyAgICAkIGdpdCBjbG9uZSBodHRwczovL2dpdGh1
Yi5jb20vTGlicmVFTEVDL2FtbG9naWMtYm9vdC1maXAgLS1kZXB0aD0xCj4+ICsgICAgJCBjZCBh
bWxvZ2ljLWJvb3QtZmlwCj4+ICsgICAgJCBta2RpciBteS1vdXRwdXQtZGlyCj4+ICsgICAgJCAu
L2J1aWxkLWZpcC5zaCBiYW5hbmFwaS1jbTRpbyAvcGF0aC90by91LWJvb3QvdS1ib290LmJpbiBt
eS1vdXRwdXQtZGlyCj4gCj4gCj4gVGhpcyBzaG91bGQgYmUgYmFuYW5hcGktbTJzIHNpbmNlIHRo
ZSBzYW1lIGlzIHVzZWQsIG9yIHdlIHNob3VsZCBkdXBsaWNhdGUgaXQgZm9yIGNtNGlvL2NtNC4K
Cmh0dHBzOi8vZ2l0aHViLmNvbS9MaWJyZUVMRUMvYW1sb2dpYy1ib290LWZpcC90cmVlL21hc3Rl
ci9iYW5hbmFwaS1jbTRpbwoKXiBJdOKAmXMgdGhlIHNhbWUgRklQcyB0aGF0IHdlcmUgc3VibWl0
dGVkIGZvciBNMlMgYnV0IGZvciBwYWNrYWdpbmcKcmVhc29ucyBJIGNsb25lZCB0aGVtICh1c2Vy
cyBzdHJ1Z2dsZSB0byBmaW5kIGltYWdlcyBub3QgZXhwbGljaXRseQpuYW1lZCBmb3IgdGhlaXIg
Ym9hcmQpLiBJ4oCZbGwgc3VibWl0IHBhdGNoZXMgZm9yIHRoZSBNMlMgYW5kIE0yLVBybwpib2Fy
ZHMgb25jZSB0aGlzIHNlcmllcyBpcyBhY2NlcHRlZCAoaG9wZWZ1bGx5KS4KCkNocmlzdGlhbgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
