Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61DDEB64D8
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jun 2023 15:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kdlzvnyOoOXWLziAZqoFIjwT2G3BAvLpn6bBR/LP9B4=; b=Y61KjB+jrsj/Mw
	zs12fc6kvv3Vy/4bmVc9nEW7cBJpLf0qs3LWTSaL9NhtqmZNlI6TgHsqxi4sKjNtelCevMfSKRQlG
	4XVBIH5BK1fYtE3NWHY99U7ArP1SYdRjW4JOfq5hTtPERhWB6t8jTZTPm4YqxNSDu3GgUQPY/4ohY
	B5z1rWoKu/2XjGSx+kvvTCBiz4NCyyJ5EQgm479wg7tsmoru9ehsaj7UgzltymNgT9KnBu+vvSqMO
	992ULuz+XybP+bIQxy3tDrZIRM4hmj14qGCtwIhpo+ZgCKQtZW8jS5/YYVH7V/fPoBvKS2udE+6xe
	mtx7YpS6bFxBh5FcRA0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Skk-00C7OG-1H;
	Wed, 14 Jun 2023 15:49:46 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Skh-00C7NV-18
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jun 2023 15:49:44 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-bc4e41b7bc9so761968276.2
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Jun 2023 08:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686757781; x=1689349781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxVrMc42GlGm037tYDtQh1qqmMvrc7pVLH4c7Xq6Nww=;
        b=a1lns4S840FDGsylZBmR1hjPQ5CMUMRtMRMM2Ts3BQRr1P9Lt/vv3y08UrU2yposa9
         sns0eNVtWBSwIjLcsr6ErbS+qh1jxFirCvJVtdvC2lZ66qMaRT3gt8lYFXWH2jlH3PVf
         qG3QJp3ug0/kpNzcmX3sCHgxp2TFHYb9fW2Xwbm2Yqq/BcEvQ20AyLmLFipSBgKM+el/
         34LVQ03NgWBLcUaVEArEvVF/V0RFsL8ryvUZfRlr0AnSZzqiWleFeS924jiCHoVT7Ipt
         51/0X0J3BS8DwBk8hXzwYzlX+J7hqDyeJBzpxFlsuLfR5emzur8SSinrbkx18HAK/a7q
         7vJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686757781; x=1689349781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TxVrMc42GlGm037tYDtQh1qqmMvrc7pVLH4c7Xq6Nww=;
        b=T9aoPShDhtZ50JuVev/m6aSxcm4SYy0uf8jW44suPJh6X0uFSUy2pvokWt1Vsunbwx
         VZWRYPMg9z2yhdkcRDpaOgNLXBwJXt9DDhaGY2RcROsEr7JgRy1de5TFUZpsqs2l9lH7
         vYrBmbZ02giQE65vD2bq3lYhCzLUZ6KHkkoYJItDUfz8S2Wafhw5kA4MSKH1xnpOTgXW
         sc/1kAwDlEe9lPWiLWcHs9RzOq6EVxmY7GfzfUl+McHUMG5NfztZueRZ2aU8sHPUr242
         Md+cQKmPBL4FtJyw4qtjtKuelJJRUqZLWzZ/7tDOUZ4kMHh/Po8G81BmgDa4fyDZh4t/
         TOxw==
X-Gm-Message-State: AC+VfDy/4YBnOQU2U2bVA72fvxCp0k0Erl6zGvdCU2/NZ9txXcmZI48A
	1pR8HwdyDxzOZD1UB0F8hBbfwzB+T+nHSQQmu1xA1g==
X-Google-Smtp-Source: ACHHUZ7e/n0Lm0wrB1nuWYk3tKRGNJfvpDpevXdTTfkMRXQ7qEe06IhcWrw2SqZnLVGpqolrepQCHzgztLAGVPweNF4=
X-Received: by 2002:a0d:f102:0:b0:570:acd:493f with SMTP id
 a2-20020a0df102000000b005700acd493fmr1899602ywf.19.1686757781433; Wed, 14 Jun
 2023 08:49:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAFBinCD0RT0p-jk86W0JuMT3ufohRh1RqWCcM35DKZJpuc10HQ@mail.gmail.com>
 <CAPDyKFqgYnBfm-NespEZF8AJ5Ou4Bya8jLfVEnfyZvfAZ05Q7Q@mail.gmail.com>
 <CAFBinCDjPJHEhN-Jx3DhhhHJ3yi8oEoW7u4-Ld6Rd1+W826ttA@mail.gmail.com>
 <CAPDyKFqKSWJkJwgCO89jgKQ6AB==P9BWkuX6XtKj=ASOH15y9g@mail.gmail.com>
 <CAFBinCDwgYw3v31hP4AtV3+Z1o+esDqMKugRwMMMLqSX0Acjzw@mail.gmail.com>
 <CAPDyKFr+hQo+N31r=3f58taf9sYW0UF0ApCJhwz9vRsyNizcvg@mail.gmail.com> <CAFBinCDSv_vdu5887vveotvaOGFrZvaSX4jM+7Q3QvDhTdazzw@mail.gmail.com>
In-Reply-To: <CAFBinCDSv_vdu5887vveotvaOGFrZvaSX4jM+7Q3QvDhTdazzw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 14 Jun 2023 17:49:05 +0200
Message-ID: <CAPDyKFpS-UwiaRPMqSpX0mNPrS5p=yJzu3g0=pGyCkWHSYyqWg@mail.gmail.com>
Subject: Re: Odroid-C1 regression with commit 4bc31edebde5 ("mmc: core: Set HS
 clock speed before sending HS CMD13")
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Luca Weiss <luca@z3ntu.xyz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_084943_428418_FE2E8827 
X-CRM114-Status: GOOD (  26.26  )
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

T24gVHVlLCAxNiBNYXkgMjAyMyBhdCAyMjo0NSwgTWFydGluIEJsdW1lbnN0aW5nbAo8bWFydGlu
LmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIE1heSAxNSwg
MjAyMyBhdCAxMTo0NOKAr0FNIFVsZiBIYW5zc29uIDx1bGYuaGFuc3NvbkBsaW5hcm8ub3JnPiB3
cm90ZToKPiBbLi4uXQo+ID4gPiA+IDMpIElmIDIpIHNlZW1zIHRvIHdvcmsgYWJvdmUsIHdlIG5l
ZWQgdG8gZmlndXJlIG91dCB3aHkKPiA+ID4gPiBtbWNfc3dpdGNoX3N0YXR1cygpIGlzIGhhbmdp
bmcuIElmIHRoZXJlIGlzIGEgcHJvYmxlbSB3aXRoIHRoZSBlTU1DCj4gPiA+ID4gY2FyZCByZXNw
b25kaW5nIGluLWNvcnJlY3RseSwgdGhlIGhvc3QgZHJpdmVyIHNob3VsZCByZXR1cm4gd2l0aCBh
bgo+ID4gPiA+IGVycm9yIGNvZGUsIHJpZ2h0Pwo+ID4gPiBZb3UncmUgcmlnaHQ6IGl0J3MgaW5k
ZWVkIGhhbmdpbmcgaW4gbW1jX3N3aXRjaF9zdGF0dXMoKQo+ID4gPiBJIGRvbid0IGdldCBhbnkg
aW50ZXJydXB0cyAodGltZW91dCwgQ1JDIGVycm9yLCAuLi4pIGZvciBpdC4KPiA+ID4gRG8geW91
IGhhdmUgYW55IHN1Z2dlc3Rpb25zIHdoYXQgdG8gY2hlY2sgbmV4dD8KPiA+Cj4gPiBTbyB0aGUg
bW1jX3N3aXRjaF9zdGF0dXMoKSBpcyBzZW5kaW5nIGEgQ01EMTMuIEV2ZW4gaWYgdGhlIGNhcmQK
PiA+IGRvZXNuJ3QgcmVwbHksIEkgd291bGQgZXhwZWN0IHRoYXQgdGhlIG1lc29uIG1tYyBjb250
cm9sbGVyIHdvdWxkCj4gPiByYWlzZSBzb21lIGtpbmQgb2YgZXJyb3IgY29uZGl0aW9uLCBwcm9i
YWJseSB2aWEgYSB0aW1lb3V0LWlycS4KPiA+Cj4gPiBEaWQgeW91IHZlcmlmeSB0aGF0IHRoZSBk
cml2ZXIgaXMgYWN0dWFsbHkgd2FpdGluZyBmb3IgYW4gSVJRIHRvCj4gPiBoYXBwZW4sIHdoaWNo
IGFsc28gbWVhbnMgd2FpdGluZyBmb3IgYSBDTUQxMyByZXNwb25zZT8KPiByZWdpc3RlciAweDI0
IGlzIElDVEwgKGludGVycnVwdCBjb250cm9sKSBhbmQgMHgyOCBpcyBJU1RBVCAoaW50ZXJydXB0
IHN0YXR1cykKPiBJU1RBVCBpcyBhbGwgemVyb3MgYW5kIElDVEwgaXMgMHgzMDY3IHdoaWNoIHRy
YW5zbGF0ZXMgc286Cj4gLSBCSVQoMCk6IFJFU1BfT0sKPiAtIEJJVCgxKTogUkVTUF9USU1FT1VU
Cj4gLSBCSVQoMik6IFJFU1BfRVJSX0NSQwo+IC0gQklUKDUpOiBEQVRBX1RJTUVPVVQKPiAtIEJJ
VCg2KTogREFUQV9FUlJfQ1JDCj4gLSBCSVQoMTIpOiBSWEZJRk9fRlVMTAo+IC0gQklUKDEzKTog
VFhGSUZPX0VNUFRZCj4KPiBJIGd1ZXNzIGluIHRoaXMgY2FzZSBCSVQoMSkgUkVTUF9USU1FT1VU
IGlzIHRoZSByZWxldmFudCBvbmUuCj4KPiByZWdpc3RlciAweDA0IGlzIFNFTkQgYW5kIHJlYWRz
IDB4NGQgd2hpY2ggdHJhbnNsYXRlcyB0bzoKPiAtIENNRDEzCj4gLSBNTUNfUlNQX1BSRVNFTlQg
KEhBU19SRVNQLCBCSVQoNikpCj4gLSBubyBvdGhlciBmbGFncyAoU1RPUCwgUjFCLCAuLi4pIGFy
ZSBzZXQKPgo+IEZ1bGwgcmVnaXN0ZXIgZHVtcDoKPiAjIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9y
ZWdtYXAvYzExMDhlMDAubW1jL3JlZ2lzdGVycwo+IDAwOiAwMDAwMDkwMAo+IDA0OiAwMDAwMDA0
ZAo+IDA4OiBlN2ZmZTAwMgo+IDBjOiAwMmYwMDAzZgo+IDEwOiAwMDAzZjAwOQo+IDE0OiAwM2I4
MWMwMAo+IDE4OiAyYzQzYmNmMAo+IDFjOiBlMDAwMDE1MAo+IDIwOiAwMDAwMDAwMAo+IDI0OiAw
MDAwMzA2Nwo+IDI4OiAwMDAwMDAwMAo+IDJjOiAwMDAwMDAwMAo+IDMwOiAwMDAwMDAwMAo+IDM0
OiAwMGZlMGNmZgo+IDM4OiAwMDAwMTAwYgo+Cj4gSW4gY2FzZSB5b3UgYXJlIGN1cmlvdXMsIHRo
ZSBkcml2ZXIgaXM6IGRyaXZlcnMvbW1jL2hvc3QvbWVzb24tbXgtc2RoYy1tbWMuYwoKVGhhbmtz
IGZvciBzaGFyaW5nIHRoaXMgZGF0YSEKCkkgYXNzdW1lIHRoZSBhYm92ZSByZWdpc3RlcnMgaW5k
aWNhdGUgdGhhdCB3ZSBoYXZlIHNlbnQgdGhlIGNvbW1hbmQKYW5kIGFyZSBub3cgd2FpdGluZyBm
b3IgYW4gSVJRIGZvciBhIHJlc3BvbnNlL2Vycm9yLCBidXQgd2UgbmV2ZXIKcmVjZWl2ZSBvbmUu
CgpUbyByZWFsbHkgZmlndXJlIG91dCB3aGF0IGlzIGdvaW5nIG9uLCBJIHRoaW5rIHdlIG5lZWQg
dG8gZG8gc29tZQphZGRpdGlvbmFsIGxvdyBsZXZlbCBkZWJ1Z2dpbmcvdGVzdGluZy4KCkkgd2Fz
IGxvb2tpbmcgYXQgdGhlIGNvbW1pdCBtZXNzYWdlIGZyb20gZTRiZjFiMDk3MGVmICgibW1jOiBo
b3N0OgptZXNvbi1teC1zZGhjOiBuZXcgZHJpdmVyIGZvciB0aGUgQW1sb2dpYyBNZXNvbiBTREhD
IGhvc3QiKSwgd2hpY2gKaW5kaWNhdGVzIHRoYXQgdGhlIGNsb2NrIG1hbmFnZW1lbnQgaXMgcXVp
dGUgbGltaXRlZCBmb3IgdGhpcyBIVy4gRm9yCmV4YW1wbGUsIHRoZSA1MTAwMDAwMEh6IGlzbid0
IG9uZSBvZiB0aGUgc3VwcG9ydGVkIGZyZXF1ZW5jaWVzLiBDb3VsZAp0aGF0IGJlIHRoZSByZWFz
b24gZm9yIHRoZSBwcm9ibGVtPyBQZXJoYXBzIGlmIHdlIHBsYXkgd2l0aCBjaGFuZ2luZwp0aGUg
ZnJlcXVlbmN5IHRvIHNvbWV0aGluZyB0aGF0IGlzIGNvbnNpZGVyZWQgc3VwcG9ydGVkIC0gdGhl
biBjYW4gd2UKbWFrZSB0aGlzIHdvcms/CgpLaW5kIHJlZ2FyZHMKVWZmZQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
