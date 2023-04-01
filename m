Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349D9C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Apr 2023 20:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=36S4XR7E9DTb8D4zt+JbJ55vAyJRSWXp09a/NSUDoSc=; b=QytrZkrnL2gPY/
	Bw13nw79/0Gd1ylavDVdjFUgUOu9BeDRh01bOnm8a1dC0g7P0e2zT7dgpLwar42nje3hzS79boDvt
	FJiy/CXJyuCyX6VJnNzWikfscjRZJvegBLBEHQlwjF/cj2+6yd27Wp8biJ5fePQw1wSN/Hsb2g15p
	WQh11jP/NlLhvj2ZQ892R/TH78LP6QrAWedadra7vxRaETQSrbtXi890GeCYh1dYLgXhvV7NKlqHA
	4Eqas+wcRq46op0gLyRD02lLGRKYiWWQPGIoiAntv75oHbsjsAVQ6z60ToYJ0Y2SeRLoqqPJC2oWG
	KKX4gLGkHXcW3uYVKJoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piiEB-00BImO-1X;
	Sat, 01 Apr 2023 20:53:35 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piiE8-00BIlP-25
	for linux-amlogic@lists.infradead.org;
	Sat, 01 Apr 2023 20:53:33 +0000
Received: by mail-ed1-x52d.google.com with SMTP id eh3so102914327edb.11
        for <linux-amlogic@lists.infradead.org>; Sat, 01 Apr 2023 13:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1680382409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqQjosDuGQTBpETZjAG39X+37S8cwaG+yZPYtOjYGhQ=;
        b=f9roXyTR5ScrLOxA1NKU/IFXavwCyUxx4KpkeelEGxVBUHegy4vT70Cc6P5MuqZ+ai
         PVKLBsXQX2ft4VaDFWq+gQtvIweZhhxSy8nDu9RzCrlVuDFv/K0tiBorg5Du8Gtn/KZp
         LA1PfiY/CYSFXgNbHKzVv6VU3Hej15CCHq6NjIBTg8D88u0PbYLBB43W8D3a2OHqGSs3
         ronc1tr6ERSA7ey8x05IWyuaxOEXZCYFrCdO6PWSHORzKv1PUpq9kg/TKZZeIJHQCi6p
         8m3Td9YnTw2CB/OHSZw9nIZ9vZYZi4idL7eTgzeMsRf5soxNV5Lm/jSGfaUzHEoS2zSZ
         Fbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680382409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqQjosDuGQTBpETZjAG39X+37S8cwaG+yZPYtOjYGhQ=;
        b=FHzZfElCQ8rhK3eGjdIhpCbW4zGa6oD8MlYsjYqbJMvuiXAdmkkqyY3wJcHp4Ffe2+
         y/5KUX4pVOiDEPg+3sIui14jOPBygBAvGFTkTiB6abiGsGPKSEGj3hyJbcMMFVimLWNi
         etUQsXWN532MtR7UdsgxdBJla4QNmMryZexA6BFxEVjvd4E9fN8YqEH8bND2Zu3sd7B1
         UtaTR3ofyVxgDPFjU8LPRR8uImOLRVrVSFd3udG71H7Z4+SDusR+/2rx3Xtbge8eCCqJ
         gxl4mBiaMhHIbScOQFEXeLAcAT6SL/9aG01A4JPJnB0HOP3SuivMhZmbxibSPK4H+IfM
         tw3Q==
X-Gm-Message-State: AAQBX9fRMS+aDuWcujIa8B+JinAE1fVkfmByB1/JNK4GZ/Gy/gKxTVqY
	FGxhQJFSWBvA4zW2th0czAqHtulZqzzqBjI/JTJBSw==
X-Google-Smtp-Source: AKy350ZZvs1y/I8foLPxydFISvhZf1UTg/GqeEUnRXWtgj/ivcBrRG4Mb0Oz1PNpx3x0RVCrUvMbv47m0wxrzsKyRVA=
X-Received: by 2002:a17:906:b884:b0:932:a33a:3754 with SMTP id
 hb4-20020a170906b88400b00932a33a3754mr15463633ejb.14.1680382409666; Sat, 01
 Apr 2023 13:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230401185458.2280200-1-sjg@chromium.org> <20230402065454.v2.1.I2d7f563b6a82f32478a7874e36672622aebb7893@changeid>
In-Reply-To: <20230402065454.v2.1.I2d7f563b6a82f32478a7874e36672622aebb7893@changeid>
From: Steev Klimaszewski <steev@kali.org>
Date: Sat, 1 Apr 2023 15:53:18 -0500
Message-ID: <CAKXuJqiEp1Kt-GhrQKAa1y9X1SuLkpx7FFd8gTsWLfPu+Xd92A@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] RFC: Move Odroid-C2 to use binman to produce the image
To: Simon Glass <sjg@chromium.org>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	u-boot-amlogic@groups.io, Alper Nebi Yasak <alpernebiyasak@gmail.com>, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_135332_696114_414C1008 
X-CRM114-Status: GOOD (  13.13  )
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

SGkgU2ltb24sCgpPbiBTYXQsIEFwciAxLCAyMDIzIGF0IDE6NTXigK9QTSBTaW1vbiBHbGFzcyA8
c2pnQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4KPiBUaGlzIHNob3dzIGhvdyBiaW5tYW4gY2FuIGJl
IHVzZWQgdG8gcmVwbGFjZSB0aGUgbG9uZyBhbmQgY29tcGxpY2F0ZWQKPiBpbnN0cnVjdGlvbnMg
d2l0aCBhbiBhdXRvbWF0ZWQgYnVpbGQuIEl0IGlzIHN0aWxsIGNvbXBsaWNhdGVkIHRvIHJlYWQK
PiBidXQgdXNlcnMgZG9uJ3QgaGF2ZSB0byB3b3JyeSBhYm91dCB0aGUgZGV0YWlscy4KPgo+IEl0
IG5lZWRzIHNvbWUgdGlkeWluZyB1cCBhbmQgb25seSBzdXBwb3J0cyBPZHJvaWQtQzIgYXQgcHJl
c2VudC4KPgo+IFNpZ25lZC1vZmYtYnk6IFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPgo+
IC0tLQo+Cj4gQ2hhbmdlcyBpbiB2MjoKPiAtIFJlYmFzZSB0byAtbmV4dAo+Cj4gIGFyY2gvYXJt
L2R0cy9tZXNvbi1zbTEtb2Ryb2lkLWM0LXUtYm9vdC5kdHNpIHwgMTA3ICsrKysrKysrKysrKysr
KysKPiAgYXJjaC9hcm0vbWFjaC1tZXNvbi9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAgIDEg
Kwo+ICBkb2MvYm9hcmQvYW1sb2dpYy9vZHJvaWQtYzQucnN0ICAgICAgICAgICAgICB8IDEyNyAr
KysrKy0tLS0tLS0tLS0tLS0tCj4gIHRvb2xzL2Jpbm1hbi9ldHlwZS9hbWxfZW5jcnlwdC5weSAg
ICAgICAgICAgIHwgMTI0ICsrKysrKysrKysrKysrKysrKwo+ICB0b29scy9iaW5tYW4vZnRlc3Qu
cHkgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMyArCj4gIHRvb2xzL2Jpbm1hbi9taXNzaW5n
LWJsb2ItaGVscCAgICAgICAgICAgICAgIHwgICA2ICsKPiAgdG9vbHMvYmlubWFuL3Rlc3QvMjEz
X2FtbF9lbmNyeXB0LmR0cyAgICAgICAgfCAgMzggKysrKysrCj4gIHRvb2xzL2Jpbm1hbi90ZXN0
LzIxNF9saXN0X25vX2R0Yi5kdHMgICAgICAgIHwgIDIzICsrKysKPiAgOCBmaWxlcyBjaGFuZ2Vk
LCAzMzcgaW5zZXJ0aW9ucygrKSwgOTIgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCB0b29scy9iaW5tYW4vZXR5cGUvYW1sX2VuY3J5cHQucHkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHRvb2xzL2Jpbm1hbi90ZXN0LzIxM19hbWxfZW5jcnlwdC5kdHMKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHRvb2xzL2Jpbm1hbi90ZXN0LzIxNF9saXN0X25vX2R0Yi5kdHMKPgpUaGlzIHNheXMgQzIg
YW5kIG9ubHkgc3VwcG9ydHMgQzIsIGJ1dCB5b3UncmUgbW9kaWZ5aW5nIHRoIEM0CmRvY3VtZW50
YXRpb24/ICBJJ20ganVzdCBhIHJhbmRvbSBkaXN0cm8gbWFpbnRhaW5lciB3aXRoIGludGVyZXN0
IGluCnRoaXMgYW5kIHdhbnQgdG8gYmUgY2xlYXIgaXMgYWxsLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
