Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0519AEB64D9
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Jun 2023 19:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qXuoc10BXk6Xtu8dSOcPRslqtR1f4cyQSevn3u9Nu0Q=; b=PqeAjVQT3tgab9
	ulbNmzmXIJKvyCVG8iggTVajJOCVzPWtkHA7FzPOpZ8CNKXSjP2ivuIzXN9ayPU4Y+gecZNYGixb9
	pPSfg4sSM9qjMa0o2Y/pFcPFtHuU4laKmM60tbSy+JhDLipqXpSSVsn1/ZZpJR6odKfkSfQn5aF5t
	GtDPy3XNrPXmoVwYsVRgUzAmFIQtR5BLIAuyqvh9MKTD7vpFUiMyfd51tEc/HjU/fNPMzFc5Ci94U
	KTeICn/Xb/Ef6gCIZ9dACLM2JJluJHh8PZjJkQrBA4ak03GDgQXihGaZ7ggsMxVrTA6ST/Q8ZVcF1
	VWUbqTy6X/xu9nu+ktFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBKxX-009MeW-0h;
	Mon, 19 Jun 2023 19:54:43 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBKxV-009Mdp-0R
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Jun 2023 19:54:42 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-51a2fa4a45eso4915858a12.0
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Jun 2023 12:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1687204478; x=1689796478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyRSVfrJOL+bwgeDq4PIh5Rzl57vR7EHanbiiiTR8wg=;
        b=NdU4cZf3o/Slw0OTT0Gkj4kXxTKxGNmHJGYPORt2EYMWK5iXe7DO8O1LCMqXG/ES7B
         hCqJrja0F2Rb6FUdthfgH86ZBv9JQS5RTB9oVpmp3u7Xqi8xsTecpmP9kxXxJ83hhVQ+
         Yy0WiRDPjAobfzucFS/a/YNBAIDXOvEEBCfC5WKJs1Nixgo2ZhI8PFAhL/+ZbmmQTKkt
         DmCUn6vBedA3NJQzlSNnD53HP0VXfXEtob8G+HaXAtPN2U0357taEr8fTaM2HxQ9qYAc
         f1bASkWnbfoWeAhj5d67zNVlCiUu3JQ4uMx37g112b3UEK9cIpccSBm7k8+3GD5+C8EG
         PxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687204478; x=1689796478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RyRSVfrJOL+bwgeDq4PIh5Rzl57vR7EHanbiiiTR8wg=;
        b=VmCGu6+PAaJYqoR7ZjKt12XearYPS2vvD70/c7cg9RY1Y/U+rSmJ1dCXxleTIVWdbC
         xefjCTjhEFU9tKhBRQodYc6sY1JmoiMAkSYaQATIorKinZXq3ncpOm9WLEOz3hiajdCg
         O0XqTJjYgmx2mDRi1pK/0gvYmT1m8nKPEs1wG0PIq4xoPFShsZ3cpHWA5bssgIfrBPPF
         qQ49Fcqh7wyAHTMGP/F5OkS8YHhVdVaYEwcAkaF/FEQ2XwkHD5kkDRfXh7QTsQx+TCju
         P37bmzM7pXsAfyXf904pUeCOMBwr42mxJVHKJkI4wHZ+1ug3FE/mE8qoeLXznUyds7tW
         Vu2w==
X-Gm-Message-State: AC+VfDxZ43EHEtN/zPOg3oplarLZk9CR3VGiKBIZBtI800HiR+8wgxzZ
	IvdaoUvA/KTfhjjQCM0evhtobZlwfvtZOXuxFq2yiOjJnS8=
X-Google-Smtp-Source: ACHHUZ4oQOwBKmQqjEJKI8Xyl7E8lAKnYccshQEse6MTexFIRWVjUn0WWitQsU7gg5VXUNmU/apcOwiFcKuZmG66m8Y=
X-Received: by 2002:a17:907:a42:b0:96f:afe9:25c7 with SMTP id
 be2-20020a1709070a4200b0096fafe925c7mr10751771ejc.10.1687204477606; Mon, 19
 Jun 2023 12:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAFBinCD0RT0p-jk86W0JuMT3ufohRh1RqWCcM35DKZJpuc10HQ@mail.gmail.com>
 <CAPDyKFqgYnBfm-NespEZF8AJ5Ou4Bya8jLfVEnfyZvfAZ05Q7Q@mail.gmail.com>
 <CAFBinCDjPJHEhN-Jx3DhhhHJ3yi8oEoW7u4-Ld6Rd1+W826ttA@mail.gmail.com>
 <CAPDyKFqKSWJkJwgCO89jgKQ6AB==P9BWkuX6XtKj=ASOH15y9g@mail.gmail.com>
 <CAFBinCDwgYw3v31hP4AtV3+Z1o+esDqMKugRwMMMLqSX0Acjzw@mail.gmail.com>
 <CAPDyKFr+hQo+N31r=3f58taf9sYW0UF0ApCJhwz9vRsyNizcvg@mail.gmail.com>
 <CAFBinCDSv_vdu5887vveotvaOGFrZvaSX4jM+7Q3QvDhTdazzw@mail.gmail.com> <CAPDyKFpS-UwiaRPMqSpX0mNPrS5p=yJzu3g0=pGyCkWHSYyqWg@mail.gmail.com>
In-Reply-To: <CAPDyKFpS-UwiaRPMqSpX0mNPrS5p=yJzu3g0=pGyCkWHSYyqWg@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 19 Jun 2023 21:54:26 +0200
Message-ID: <CAFBinCCnB=po9x6tsxCzRM99ZqgV9=5jBxS9LaoJqLPGZYSH6g@mail.gmail.com>
Subject: Re: Odroid-C1 regression with commit 4bc31edebde5 ("mmc: core: Set HS
 clock speed before sending HS CMD13")
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Luca Weiss <luca@z3ntu.xyz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_125441_201582_A192D746 
X-CRM114-Status: GOOD (  19.07  )
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

SGkgVWxmLAoKT24gV2VkLCBKdW4gMTQsIDIwMjMgYXQgNTo0OeKAr1BNIFVsZiBIYW5zc29uIDx1
bGYuaGFuc3NvbkBsaW5hcm8ub3JnPiB3cm90ZToKWy4uLl0KPiA+IEZ1bGwgcmVnaXN0ZXIgZHVt
cDoKPiA+ICMgY2F0IC9zeXMva2VybmVsL2RlYnVnL3JlZ21hcC9jMTEwOGUwMC5tbWMvcmVnaXN0
ZXJzCj4gPiAwMDogMDAwMDA5MDAKPiA+IDA0OiAwMDAwMDA0ZAo+ID4gMDg6IGU3ZmZlMDAyCj4g
PiAwYzogMDJmMDAwM2YKPiA+IDEwOiAwMDAzZjAwOQo+ID4gMTQ6IDAzYjgxYzAwCj4gPiAxODog
MmM0M2JjZjAKPiA+IDFjOiBlMDAwMDE1MAo+ID4gMjA6IDAwMDAwMDAwCj4gPiAyNDogMDAwMDMw
NjcKPiA+IDI4OiAwMDAwMDAwMAo+ID4gMmM6IDAwMDAwMDAwCj4gPiAzMDogMDAwMDAwMDAKPiA+
IDM0OiAwMGZlMGNmZgo+ID4gMzg6IDAwMDAxMDBiCj4gPgo+ID4gSW4gY2FzZSB5b3UgYXJlIGN1
cmlvdXMsIHRoZSBkcml2ZXIgaXM6IGRyaXZlcnMvbW1jL2hvc3QvbWVzb24tbXgtc2RoYy1tbWMu
Ywo+Cj4gVGhhbmtzIGZvciBzaGFyaW5nIHRoaXMgZGF0YSEKPgo+IEkgYXNzdW1lIHRoZSBhYm92
ZSByZWdpc3RlcnMgaW5kaWNhdGUgdGhhdCB3ZSBoYXZlIHNlbnQgdGhlIGNvbW1hbmQKPiBhbmQg
YXJlIG5vdyB3YWl0aW5nIGZvciBhbiBJUlEgZm9yIGEgcmVzcG9uc2UvZXJyb3IsIGJ1dCB3ZSBu
ZXZlcgo+IHJlY2VpdmUgb25lLgo+Cj4gVG8gcmVhbGx5IGZpZ3VyZSBvdXQgd2hhdCBpcyBnb2lu
ZyBvbiwgSSB0aGluayB3ZSBuZWVkIHRvIGRvIHNvbWUKPiBhZGRpdGlvbmFsIGxvdyBsZXZlbCBk
ZWJ1Z2dpbmcvdGVzdGluZy4KPgo+IEkgd2FzIGxvb2tpbmcgYXQgdGhlIGNvbW1pdCBtZXNzYWdl
IGZyb20gZTRiZjFiMDk3MGVmICgibW1jOiBob3N0Ogo+IG1lc29uLW14LXNkaGM6IG5ldyBkcml2
ZXIgZm9yIHRoZSBBbWxvZ2ljIE1lc29uIFNESEMgaG9zdCIpLCB3aGljaAo+IGluZGljYXRlcyB0
aGF0IHRoZSBjbG9jayBtYW5hZ2VtZW50IGlzIHF1aXRlIGxpbWl0ZWQgZm9yIHRoaXMgSFcuIEZv
cgo+IGV4YW1wbGUsIHRoZSA1MTAwMDAwMEh6IGlzbid0IG9uZSBvZiB0aGUgc3VwcG9ydGVkIGZy
ZXF1ZW5jaWVzLiBDb3VsZAo+IHRoYXQgYmUgdGhlIHJlYXNvbiBmb3IgdGhlIHByb2JsZW0/IFBl
cmhhcHMgaWYgd2UgcGxheSB3aXRoIGNoYW5naW5nCj4gdGhlIGZyZXF1ZW5jeSB0byBzb21ldGhp
bmcgdGhhdCBpcyBjb25zaWRlcmVkIHN1cHBvcnRlZCAtIHRoZW4gY2FuIHdlCj4gbWFrZSB0aGlz
IHdvcms/CllvdSBzZWVtIHRvIGJlIG1vcmUgZmFtaWxpYXIgd2l0aCB0aGlzIEFtbG9naWMgTU1D
IGNvbnRyb2xsZXIgdGhhbiBJIGFtIDstKQpUb2RheSBJIGZpbmFsbHkgaGFkIHNvbWUgdGltZSBm
b3IgdGVzdGluZyBhbmQgd2hlbiBJIHN0YXJ0ZWQgWml5YW5nCkh1YW5nIHByb3ZpZGVkIGEgcGF0
Y2ggWzBdIChhZG1pdHRlZGx5OiBJIHRoaW5rIGl0IG5lZWRzIHRvIGJlCmltcHJvdmVkLCBidXQg
ZmluYWxseSB3ZSBrbm93IHRoYXQgaXQncyBhIE1NQyBjb250cm9sbGVyIGRyaXZlcgpsaW1pdGF0
aW9uIGFuZCBub3QgYW4gTU1DIGNvcmUgYnVnKQoKCkJlc3QgcmVnYXJkcywKTWFydGluCgoKWzBd
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFtbG9naWMvVFlaUFIwMU1CNTU1NkI1NkQ4
MzRFMDJGNDFDNDREODFEQzk1RkFAVFlaUFIwMU1CNTU1Ni5hcGNwcmQwMS5wcm9kLmV4Y2hhbmdl
bGFicy5jb20vCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
