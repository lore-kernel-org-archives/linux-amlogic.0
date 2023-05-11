Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEBAC77B7F
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 May 2023 10:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MmP0lytl+UWIkAEv6d/psM+yCXFlkZ41mUb1L6hP7QY=; b=oFcOFzfdv5qUJI
	FDFOauCyq3FGXilSAYjhmY+hIGnInhQYCdP35ZLyC5yKOhWFbKgAWlyLz9p6LXaKiEDW1kKYNfT3p
	q5gSy3tPSwuiRD+0GvkViBafdmuvLRIQQmBmr97jNtHLOi1XjbKf2fisIuNrR4bKBWXEWnstaQ/Ef
	2PhhjD2aHM2EMzm5BIqvxn5xyyIiHMkpDV7KqrHmQ7Z9TIBI1dzt7G2opTtJuqezrzqMZ57Zv3mVl
	l/+q3yumszcqeqYkcE7AK/gbdMJzEKHRxd1+yyP4ZiQSMd2TO7kQkNnZYixsIRTKtWw+Z38nPiefR
	ZD2eS9snIeE3D1WLvLZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px3lZ-008U7b-2P;
	Thu, 11 May 2023 10:43:21 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px3lW-008U5F-33
	for linux-amlogic@lists.infradead.org;
	Thu, 11 May 2023 10:43:20 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-b9a824c3a95so10555743276.1
        for <linux-amlogic@lists.infradead.org>; Thu, 11 May 2023 03:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683801797; x=1686393797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HwK6O2GyMlAYbj1OPQtJ3JBX3Y5C0lX7LcCuPtjs1rs=;
        b=jsYN3JsF63Nz6qFKAR0lCzd0sprcKZYnTGibq/Jxwtr0by0tRyoQsdbsh/LBKTVwlE
         ykcWHCx1rycHqBtIT4qWxAmver4ZuvAYdlz2kT65MXNU2CmhgvFfteeA1HWPusU5K1f4
         iP+tWKQFU58fDlbNUSONw9ByFq1ALaOjyqtAtTu0zT8KVOP+v7o6eaKoaNTY1RR+p/fq
         V423oNRWGKth4FxHEk/kvC5Ilm/vrZYWSNuimVO13/zsEQ4tG7pfkEpXpxcfVjjoQX+I
         ZfeW4n94sh4n39vfusL/IlF89ODTJXeSvO3sLuCiccn4ooljriZ1/FVPVPxf+OnAgtTE
         BsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683801797; x=1686393797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HwK6O2GyMlAYbj1OPQtJ3JBX3Y5C0lX7LcCuPtjs1rs=;
        b=eCioKabpVgGn0bYA8LsfXEz47W0X4ZOzr2+5hIwYElN5ENDnyhtop/Sp2eIJZf25qH
         fYYpzTWPzbc1SCTOWxmuwbawueeUsPri2vJa3IeMR2d7TbPtR6icqFBU3/IVkhLs+zmD
         Nvj3HftYifJQeWnFCmENckiHiKyuX4a2le5aJWHpDt6mJ+nX+6IvndgZIz16LU471Pc9
         hkViTv8cXZ6HAfxyenXi3Cd3sPnlTcjeJ+7EQkxIgKxyVUECTiHAtjq5srVrXnfRM4oi
         adqlinT5KyXU9PuJLA+Ggd9FkknogPJ/Env3/gipcL6hez9I94vHmIQqmy/XN7KQZ2Y7
         MlBw==
X-Gm-Message-State: AC+VfDz2nAIHRZ6GeXCS2pXtu4cU9flJY+4NvHnoHTdj5DUmA7RYF2Qp
	gc3UO7sgBhduGk+P917LcJit3jHW0JJq3qZr/CDKXw==
X-Google-Smtp-Source: ACHHUZ7GfJx9MP3qtqPM8KCkJqmfzOB1a4KjfFHMliWf8xRk0DK+bTILphb2c/JnUwR+7pXP4zKVdN4mEErExNVQqG4=
X-Received: by 2002:a25:dbd2:0:b0:b92:5a0e:d5df with SMTP id
 g201-20020a25dbd2000000b00b925a0ed5dfmr22793004ybf.46.1683801797441; Thu, 11
 May 2023 03:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAFBinCD0RT0p-jk86W0JuMT3ufohRh1RqWCcM35DKZJpuc10HQ@mail.gmail.com>
 <CAPDyKFqgYnBfm-NespEZF8AJ5Ou4Bya8jLfVEnfyZvfAZ05Q7Q@mail.gmail.com> <CAFBinCDjPJHEhN-Jx3DhhhHJ3yi8oEoW7u4-Ld6Rd1+W826ttA@mail.gmail.com>
In-Reply-To: <CAFBinCDjPJHEhN-Jx3DhhhHJ3yi8oEoW7u4-Ld6Rd1+W826ttA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 11 May 2023 12:42:41 +0200
Message-ID: <CAPDyKFqKSWJkJwgCO89jgKQ6AB==P9BWkuX6XtKj=ASOH15y9g@mail.gmail.com>
Subject: Re: Odroid-C1 regression with commit 4bc31edebde5 ("mmc: core: Set HS
 clock speed before sending HS CMD13")
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Luca Weiss <luca@z3ntu.xyz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_034319_012434_9D2E7793 
X-CRM114-Status: GOOD (  23.20  )
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

T24gV2VkLCAxMCBNYXkgMjAyMyBhdCAyMjo1NCwgTWFydGluIEJsdW1lbnN0aW5nbAo8bWFydGlu
LmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBVbGYsCj4KPiBPbiBX
ZWQsIE1heSAxMCwgMjAyMyBhdCA0OjIx4oCvUE0gVWxmIEhhbnNzb24gPHVsZi5oYW5zc29uQGxp
bmFyby5vcmc+IHdyb3RlOgo+IFsuLi5dCj4gPiBUaGFua3MgZm9yIHJlcG9ydGluZyAtIGFuZCBt
eSBhcG9sb2dpZXMgZm9yIHRoZSBsb25nIGRlbGF5ISBJdCdzIGJlZW4KPiA+IGEgYnVzeSBwZXJp
b2Qgd2l0aCBsb3RzIG9mIHRyYXZlbGxpbmcgZm9yIG1lLgo+IFRoYW5rIHlvdSBmb3IgdGFraW5n
IHRoZSB0aW1lIHRvIGxvb2sgaW50byB0aGlzIG5vdyAtIG5vIG5lZWQgdG8gYXBvbG9naXplIQo+
Cj4gWy4uLl0KPiA+ID4gSW4gdGhpcyBzdGF0ZSBJIGdldDoKPiA+ID4gIyBjYXQgL3N5cy9rZXJu
ZWwvZGVidWcvbW1jMS9pb3MKPiA+ID4gY2xvY2s6ICAgICAgICAgIDUyMDAwMDAwIEh6Cj4gPiA+
IGFjdHVhbCBjbG9jazogICA1MTAwMDAwMCBIego+ID4gPiB2ZGQ6ICAgICAgICAgICAgMjEgKDMu
MyB+IDMuNCBWKQo+ID4gPiBidXMgbW9kZTogICAgICAgMiAocHVzaC1wdWxsKQo+ID4gPiBjaGlw
IHNlbGVjdDogICAgMCAoZG9uJ3QgY2FyZSkKPiA+ID4gcG93ZXIgbW9kZTogICAgIDIgKG9uKQo+
ID4gPiBidXMgd2lkdGg6ICAgICAgMyAoOCBiaXRzKQo+ID4gPiB0aW1pbmcgc3BlYzogICAgOSAo
bW1jIEhTMjAwKQo+ID4gPiBzaWduYWwgdm9sdGFnZTogMSAoMS44MCBWKQo+ID4gPiBkcml2ZXIg
dHlwZTogICAgMCAoZHJpdmVyIHR5cGUgQikKPiA+Cj4gPiBJdCBsb29rcyB0byBtZSB0aGF0IHdl
IGFyZSBpbiB0aGUgcHJvY2VzcyBvZiBlbmFibGluZyB0aGUgSFMyMDAgbW9kZSwKPiA+IGJ1dCBo
YW5ncyBhdCBzb21lIHBvaW50LiBVbmxlc3MgSSBhbSBtaXN0YWtlbi4KPiA+Cj4gPiBNb3JlIHBy
ZWNpc2VseSwgSSBzdXNwZWN0IGl0J3MgZWl0aGVyIHRoZSBjYWxsIHRvIG1tY19zZXRfY2xvY2so
KSBvcgo+ID4gdGhlIGNhbGwgdG8gbW1jX3N3aXRjaF9zdGF0dXMoKSwgaW4gbW1jX3NlbGVjdF9o
czIwMCgpLiBDYW4geW91IGhhdmUgYQo+ID4gY2xvc2VyIGxvb2sgdG8gY29uZmlybSB0aGlzPwo+
IEluZGVlZCwgcmVtb3ZpbmcgbW1jX3NldF9jbG9jaygpIGZyb20gbW1jX3NlbGVjdF9oczIwMCgp
IGFsc28gbWFrZXMgbXkKPiBlTU1DIGFwcGVhciBhZ2FpbiBvbiB0b3Agb2YgTGludXggNi40LXJj
MS4KPiBTZWUgdGhlIGF0dGFjaGVkIGRpZmYgaW4gY2FzZSBpdCdzIG5vdCBmdWxseSBjbGVhciB3
aGljaAo+IG1tY19zZXRfY2xvY2soKSBjYWxsIEkgcmVtb3ZlZC4KClRoYW5rcyBmb3IgdGhlIHVw
ZGF0ZSEgUmVtb3ZpbmcgdGhhdCBjYWxsIHJlc3RvcmVzIG1tY19zZWxlY3RfaHMyMDAoKQp0byB0
aGUgcHJldmlvdXMgYmVoYXZpb3VyIC0gc28gdGhhbmtzIGZvciBjb25maXJtaW5nIHRoYXQgdGhp
cyBpcwp3b3JraW5nLgoKSG93ZXZlciwgdG8gZmluZCB0aGUgcHJvcGVyIHNvbHV0aW9uLCBJIHRo
aW5rIHdlIG5lZWQgdG8gdW5kZXJzdGFuZAp3aHkgd2UgYXJlIGhhbmdpbmcgaW4gdGhlIG1lc29u
LW14LXNkaGMgZHJpdmVyIGZpcnN0LiBIZXJlJ3MgYSBjb3VwbGUKb2YgZm9sbG93IHVwIHF1ZXN0
aW9ucyBmcm9tIG1lOgoKMSkgQmVmb3JlIGNhbGxpbmcgbW1jX3NldF9jbG9jaygpIHdoYXQgaXMg
dGhlIGFjdHVhbCBjbG9jayByYXRlIHRoYXQKaGFzIGJlZW4gc2V0IGJ5IHRoZSBtZXNvbiBkcml2
ZXI/CgoyKSBEb2VzIHRoZSBjYWxsIHRvIG1tY19zZXRfY2xvY2soKSByZXR1cm4gb3IgaGFuZz8g
Q2FuIHdlIHZlcmlmeSB0aGF0CnRoZSBjbG9jayBnZXRzIHNldCBjb3JyZWN0bHk/CgozKSBJZiAy
KSBzZWVtcyB0byB3b3JrIGFib3ZlLCB3ZSBuZWVkIHRvIGZpZ3VyZSBvdXQgd2h5Cm1tY19zd2l0
Y2hfc3RhdHVzKCkgaXMgaGFuZ2luZy4gSWYgdGhlcmUgaXMgYSBwcm9ibGVtIHdpdGggdGhlIGVN
TUMKY2FyZCByZXNwb25kaW5nIGluLWNvcnJlY3RseSwgdGhlIGhvc3QgZHJpdmVyIHNob3VsZCBy
ZXR1cm4gd2l0aCBhbgplcnJvciBjb2RlLCByaWdodD8KCktpbmQgcmVnYXJkcwpVZmZlCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
