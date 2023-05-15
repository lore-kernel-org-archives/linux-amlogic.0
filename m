Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE83C7EE2E
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 May 2023 09:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bIBUc3Ta5VqHtKWCM9F+bjySOHNiMlwxIyPSSsaPFgo=; b=jQlHI+BoJ+Ttmf
	Lkuwlzzg+CbH2/ytP5ZYmzrVMSLKG72iRJ0IbGJopiHP77Zt9/MTUYALKJk614IPUckaq5BOgRP1M
	VyWz3q1sB1C33LrWUFKdQ1uC5B2NqaHoYxtYQd/QOTQh5ElJYAlAZM4z89xMsaq6g+cuUJydgdHER
	cFgJFoGmzsj+xGQoICytOmn2VQxflSyR30hQo+3RCk7eqYG+4TqxP5vAOG2EcxEXwhXontqG2g30U
	4TDZHFOnmxwhvMuyxIjn8lgHo6mD6qw/k//VS3keMyXA+bLYXORyiay4fdNQCSSfmI+rN0MsgSLw1
	6H8BtkBbKgKAu6His8dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyUkk-001cBZ-2r;
	Mon, 15 May 2023 09:44:26 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyUkh-001cB6-2y
	for linux-amlogic@lists.infradead.org;
	Mon, 15 May 2023 09:44:25 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-ba1cde4ee59so10133626276.1
        for <linux-amlogic@lists.infradead.org>; Mon, 15 May 2023 02:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684143861; x=1686735861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ld/YrdRTBdqdy0pycTOaYtPC+M6ZVb33T18X0mOr9Mg=;
        b=cdlIzyrsvetkTBgU08Y1Zelpxa56GODDdbsv30gwuNa8JEHUikUeME5gj5LxzLdcnh
         JhTkJZK0daAJTRkH2g6IGjb/OKRvMOI6GQ2lTBoQvER4C20TAim7bO+I1ewvZeZoiC+r
         A2szzK6gbrCcQ+IirtzC+xqkMQkp6wdHOJNU/WRzKarJKQAfC7J2GhPKvowZxLYQt16x
         by/DrsnkKSIq9swDO7fWi9lIUnZsSJIQp2YfOpev6cQa8uHVyQPZBGOaBhnUfeQDEmyR
         I7DKwJ8AWwa3k9uU/GgUAMl4q+bGuA/lw9/++LmVHvc3Bwpig03INeOHTgc2NygNBx7L
         Rvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684143861; x=1686735861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ld/YrdRTBdqdy0pycTOaYtPC+M6ZVb33T18X0mOr9Mg=;
        b=evob5EkpexLSqWwOObkZNhDZ2yTobFXqxZbvNexIs+Es/W/2m1FQwDx8Nab9oEeoIe
         ppplncU0G555YzCp/NCeAb+BaTv7Q58QZ5s0tvaJPCqDJLdKn/XnuXgg3nRL1DWkKzM2
         Gyr4vtruoxK0eE0IBVwiKJ6AJPRZuNy+mgKwjNf2l3ITGHY7LHHnoqJPcpgL210jP9T9
         cL21oGSAgGkC3oACF6dmrwcq1OSs0DMM7YbIJi3RJgKrOc0D5WPSJmy/FuosAIj0/Yr3
         RTDcpKQuNtUZVyClRBJTK4rZbe3oZkFpWcZGvy9P6uPbtLlNWYh6PgL2ZyEo505KcBlr
         lsoA==
X-Gm-Message-State: AC+VfDxmW2Qqtth4Cv1R0omcmRSQbTKeg3NRC9yvBEmSa7HnSEHccGkG
	NVLjGSgQE1LjdIk6BNyKTmm7XHYNPwYA34BiUNXGxA==
X-Google-Smtp-Source: ACHHUZ57dks5NjzFar8XRoWSvpAHCu8E9cPpJwR08uZWn7Cc1zaJGCLurbzr8wy+whRxVo1xguA1MuYqy9fFb0+g7Cc=
X-Received: by 2002:a81:6d04:0:b0:55a:abf7:636e with SMTP id
 i4-20020a816d04000000b0055aabf7636emr27580098ywc.24.1684143861270; Mon, 15
 May 2023 02:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAFBinCD0RT0p-jk86W0JuMT3ufohRh1RqWCcM35DKZJpuc10HQ@mail.gmail.com>
 <CAPDyKFqgYnBfm-NespEZF8AJ5Ou4Bya8jLfVEnfyZvfAZ05Q7Q@mail.gmail.com>
 <CAFBinCDjPJHEhN-Jx3DhhhHJ3yi8oEoW7u4-Ld6Rd1+W826ttA@mail.gmail.com>
 <CAPDyKFqKSWJkJwgCO89jgKQ6AB==P9BWkuX6XtKj=ASOH15y9g@mail.gmail.com> <CAFBinCDwgYw3v31hP4AtV3+Z1o+esDqMKugRwMMMLqSX0Acjzw@mail.gmail.com>
In-Reply-To: <CAFBinCDwgYw3v31hP4AtV3+Z1o+esDqMKugRwMMMLqSX0Acjzw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 15 May 2023 11:43:45 +0200
Message-ID: <CAPDyKFr+hQo+N31r=3f58taf9sYW0UF0ApCJhwz9vRsyNizcvg@mail.gmail.com>
Subject: Re: Odroid-C1 regression with commit 4bc31edebde5 ("mmc: core: Set HS
 clock speed before sending HS CMD13")
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Luca Weiss <luca@z3ntu.xyz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_024423_979827_46C912A3 
X-CRM114-Status: GOOD (  28.05  )
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

T24gU3VuLCAxNCBNYXkgMjAyMyBhdCAyMjo0MiwgTWFydGluIEJsdW1lbnN0aW5nbAo8bWFydGlu
LmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBVbGYsCj4KPiBPbiBU
aHUsIE1heSAxMSwgMjAyMyBhdCAxMjo0M+KAr1BNIFVsZiBIYW5zc29uIDx1bGYuaGFuc3NvbkBs
aW5hcm8ub3JnPiB3cm90ZToKPiBbLi4uXQo+ID4gPiBJbmRlZWQsIHJlbW92aW5nIG1tY19zZXRf
Y2xvY2soKSBmcm9tIG1tY19zZWxlY3RfaHMyMDAoKSBhbHNvIG1ha2VzIG15Cj4gPiA+IGVNTUMg
YXBwZWFyIGFnYWluIG9uIHRvcCBvZiBMaW51eCA2LjQtcmMxLgo+ID4gPiBTZWUgdGhlIGF0dGFj
aGVkIGRpZmYgaW4gY2FzZSBpdCdzIG5vdCBmdWxseSBjbGVhciB3aGljaAo+ID4gPiBtbWNfc2V0
X2Nsb2NrKCkgY2FsbCBJIHJlbW92ZWQuCj4gPgo+ID4gVGhhbmtzIGZvciB0aGUgdXBkYXRlISBS
ZW1vdmluZyB0aGF0IGNhbGwgcmVzdG9yZXMgbW1jX3NlbGVjdF9oczIwMCgpCj4gPiB0byB0aGUg
cHJldmlvdXMgYmVoYXZpb3VyIC0gc28gdGhhbmtzIGZvciBjb25maXJtaW5nIHRoYXQgdGhpcyBp
cwo+ID4gd29ya2luZy4KPiA+Cj4gPiBIb3dldmVyLCB0byBmaW5kIHRoZSBwcm9wZXIgc29sdXRp
b24sIEkgdGhpbmsgd2UgbmVlZCB0byB1bmRlcnN0YW5kCj4gPiB3aHkgd2UgYXJlIGhhbmdpbmcg
aW4gdGhlIG1lc29uLW14LXNkaGMgZHJpdmVyIGZpcnN0LiBIZXJlJ3MgYSBjb3VwbGUKPiA+IG9m
IGZvbGxvdyB1cCBxdWVzdGlvbnMgZnJvbSBtZToKPiA+Cj4gPiAxKSBCZWZvcmUgY2FsbGluZyBt
bWNfc2V0X2Nsb2NrKCkgd2hhdCBpcyB0aGUgYWN0dWFsIGNsb2NrIHJhdGUgdGhhdAo+ID4gaGFz
IGJlZW4gc2V0IGJ5IHRoZSBtZXNvbiBkcml2ZXI/Cj4gPgo+ID4gMikgRG9lcyB0aGUgY2FsbCB0
byBtbWNfc2V0X2Nsb2NrKCkgcmV0dXJuIG9yIGhhbmc/IENhbiB3ZSB2ZXJpZnkgdGhhdAo+ID4g
dGhlIGNsb2NrIGdldHMgc2V0IGNvcnJlY3RseT8KPiBJIHVzZWQgdGhlIGF0dGFjaGVkIGRpZmYg
dG8gYW5zd2VyIHRoZXNlIHR3byBxdWVzdGlvbnMuIFNlZSB0aGUKPiBmb2xsb3dpbmcgbG9nIGV4
dHJhY3QgKGZ1bGwgbG9nIGlzIGF0dGFjaGVkKToKPiBtZXNvbi1teC1zZGhjIGMxMTA4ZTAwLm1t
YzogVHJ5aW5nIHRvIHNldCBNTUMgY2xvY2sgdG8gNDAwMDAwSHoKPiBtZXNvbi1teC1zZGhjIGMx
MTA4ZTAwLm1tYzogQWN0dWFsIE1NQyBjbG9jayB0byAzOTk4MTJIego+IG1tYzE6IG1tY19zZWxl
Y3RfaHMyMDAgc3dpdGNoaW5nIHRvIGNsb2NrIGZyb20gY2FyZC0+ZXh0X2NzZC5oc19tYXhfZHRy
Li4uCj4gbWVzb24tbXgtc2RoYyBjMTEwOGUwMC5tbWM6IFRyeWluZyB0byBzZXQgTU1DIGNsb2Nr
IHRvIDUyMDAwMDAwSHoKPiBtZXNvbi1teC1zZGhjIGMxMTA4ZTAwLm1tYzogQWN0dWFsIE1NQyBj
bG9jayB0byA1MTAwMDAwMEh6Cj4gbW1jMTogbW1jX3NlbGVjdF9oczIwMCBtbWNfc2V0X2Nsb2Nr
IHJldHVybmVkCj4KPiA+IDMpIElmIDIpIHNlZW1zIHRvIHdvcmsgYWJvdmUsIHdlIG5lZWQgdG8g
ZmlndXJlIG91dCB3aHkKPiA+IG1tY19zd2l0Y2hfc3RhdHVzKCkgaXMgaGFuZ2luZy4gSWYgdGhl
cmUgaXMgYSBwcm9ibGVtIHdpdGggdGhlIGVNTUMKPiA+IGNhcmQgcmVzcG9uZGluZyBpbi1jb3Jy
ZWN0bHksIHRoZSBob3N0IGRyaXZlciBzaG91bGQgcmV0dXJuIHdpdGggYW4KPiA+IGVycm9yIGNv
ZGUsIHJpZ2h0Pwo+IFlvdSdyZSByaWdodDogaXQncyBpbmRlZWQgaGFuZ2luZyBpbiBtbWNfc3dp
dGNoX3N0YXR1cygpCj4gSSBkb24ndCBnZXQgYW55IGludGVycnVwdHMgKHRpbWVvdXQsIENSQyBl
cnJvciwgLi4uKSBmb3IgaXQuCj4gRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb25zIHdoYXQgdG8g
Y2hlY2sgbmV4dD8KClNvIHRoZSBtbWNfc3dpdGNoX3N0YXR1cygpIGlzIHNlbmRpbmcgYSBDTUQx
My4gRXZlbiBpZiB0aGUgY2FyZApkb2Vzbid0IHJlcGx5LCBJIHdvdWxkIGV4cGVjdCB0aGF0IHRo
ZSBtZXNvbiBtbWMgY29udHJvbGxlciB3b3VsZApyYWlzZSBzb21lIGtpbmQgb2YgZXJyb3IgY29u
ZGl0aW9uLCBwcm9iYWJseSB2aWEgYSB0aW1lb3V0LWlycS4KCkRpZCB5b3UgdmVyaWZ5IHRoYXQg
dGhlIGRyaXZlciBpcyBhY3R1YWxseSB3YWl0aW5nIGZvciBhbiBJUlEgdG8KaGFwcGVuLCB3aGlj
aCBhbHNvIG1lYW5zIHdhaXRpbmcgZm9yIGEgQ01EMTMgcmVzcG9uc2U/CgpLaW5kIHJlZ2FyZHMK
VWZmZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
