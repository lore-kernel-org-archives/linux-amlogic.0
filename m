Return-Path: <SRS0=LsuB=UP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C1CC31E50
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Jun 2019 16:30:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E597D204EC
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Jun 2019 16:30:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mgyfmrlz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="kGRjikKK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E597D204EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KCRdezrzrMQY5cpE7J1csTIlnPpD4sL5O5qd67O4w3s=; b=mgyfmrlzVM5Ufn
	FgQtiNEd0X/fG6hoP5MLXCxTA3BK6bPVV5yrjhmPGd37NROdB6lgYtAc52jIDQ7b4UkxgLqFlUbyR
	Fq//PZGpwFr5Jhvpc/YRka4YxmaHFTUzCYHByhYk0BZM/TAtb2onIg0qkU1zBbZPiRwO7KsJLbwoA
	e67NF0AIf/A9JWPu1PFK5HiSaRfee3q9BlF6r0OvhP6EdYEsgJS3EGXEIdvUikpWjb1fGXbQGeZNj
	4/YQ0leqagA8jAUsPnuas9rwt3uCMMukdzivdiGwUMeDjeTTRLExLc4zkaKGaenecG7P4TRdj9L5V
	MV9AXP0fhQiqG/h9iavA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hcY3G-0005Jh-7x; Sun, 16 Jun 2019 16:30:42 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcY3C-0005JD-Mu
 for linux-amlogic@lists.infradead.org; Sun, 16 Jun 2019 16:30:40 +0000
Received: by mail-ot1-x342.google.com with SMTP id n5so7148642otk.1
 for <linux-amlogic@lists.infradead.org>; Sun, 16 Jun 2019 09:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1p95r2P+iLQDA9/qAxTTojaZqK/ooRtlgiUQElDx0f4=;
 b=kGRjikKKk36V/Rj7w2LH5zccniyVfnXk87O2wwbUQtJimrVjU2AJVbo8wPvdRfGU3k
 HjcPXzxZ/iEM3Rh67mlekcQC/zfPufFRpRym3t9CbaqFwqOn9b9CP/e37KYjxue5LsKC
 mBP8AJQV/mD89fxxceTZ6tS8eSKdyy0kGUPplYlNwucZ8YJZhWa/l4piS6d2TwCzx7W9
 2snp6eAlJc5fulhYJtiJkay94Vop7hlfRUJ8ALQGq/a44D4hM2gRMzgetyvQiNhLlc0g
 ld2hCWbok2ylaM58iSVtys+kMwEWhTK/bcs/38U/cW+80X7mhTJ5V7q2+yIZyuH+K8FY
 HGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1p95r2P+iLQDA9/qAxTTojaZqK/ooRtlgiUQElDx0f4=;
 b=SKLFug1RkhRWsS+k6QmL+nbjjRhUXtFQ5rwzQZhHqRMB81pK9KuGAwKXFTl4LR8EU0
 7LAPshifeko4fYfbyYvCw1o5/4mIXkdHIw7bD9iVgFKpQfKJ+KOAVB5RKdiJulufayq2
 wsNYUHKcT9iIkaePHnPCu5buCt0wjYIAdx6Aj3BK6S2uE4oCL1gGQTwVTl6rJHs28+0h
 vqpfyUhhdLXVk0zRM1Z95FnQV/Yuc1KzaA6GUaPG2Bd+p6Q7bB07yXM4Cz92mN/+9ZaE
 W0FW+B7ampHssx/9zaH+rr8sSjvTbWEgTrO7yJYV5jLp1cHQfpye+q4dWp5oSPYgn8nu
 QNUA==
X-Gm-Message-State: APjAAAWxqYK8pMA2D7/rSi1YUVKkKE3sODdtX+qOTIZvXdVXX0BKIIAk
 qVi5af0c9umn0ZENA6/hW+Bh/OaQPKFvhcKJwtICvN20sJM=
X-Google-Smtp-Source: APXvYqxNp2/hE+zYzlMRN//jDi9i6oPXKt38YGqEF8Slk2CPRCyC3CT/Jiu48MHoiRlETRQocB36yKTEAryv/kETw3g=
X-Received: by 2002:a9d:6405:: with SMTP id h5mr43292831otl.42.1560702635352; 
 Sun, 16 Jun 2019 09:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <2878d188-4c06-b1a3-4ba9-00a274cd2018@aplu.fr>
 <CAFBinCAV=UuX4vovuUqb+hs+sbHth4asQT_idBq2XiBKBeVbGw@mail.gmail.com>
 <c6684037-7d06-457e-2931-9e375128b2e7@aplu.fr>
In-Reply-To: <c6684037-7d06-457e-2931-9e375128b2e7@aplu.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 16 Jun 2019 18:30:24 +0200
Message-ID: <CAFBinCDJ0oAhrficayP0aMWrUsasU-NT6RkGH3x1BLw8U3h6pA@mail.gmail.com>
Subject: Re: Meson8b network not stable at gigabit
To: Aymeric <mulx@aplu.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190616_093038_775523_6E77421E 
X-CRM114-Status: GOOD (  16.46  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGVsbG8gQXltZXJpYywKCk9uIFN1biwgSnVuIDE2LCAyMDE5IGF0IDY6MDUgUE0gQXltZXJpYyA8
bXVseEBhcGx1LmZyPiB3cm90ZToKWy4uLl0KPiA+IGNhbiB5b3UgcGxlYXNlOgo+ID4gMS4gYm9v
dCBtYWlubGluZSBMaW51eAo+ID4gMi4gYnJpbmcgZXRoMCB1cAo+ID4gMy4gcnVuICJjYXQgL3By
b2MvaW50ZXJydXB0cyB8IGdyZXAgc3RtbWFjIgo+ID4gNC4gd2FpdCAxIG1pbnV0ZSwgZG8gbm90
IGRpc2Nvbm5lY3QgdGhlIG5ldHdvcmsgY2FibGUgZXRjLgo+ID4gNS4gcnVuICJjYXQgL3Byb2Mv
aW50ZXJydXB0cyB8IGdyZXAgc3RtbWFjIiBhZ2Fpbgo+Cj4gSnVzdCBhZnRlciBib290LCB3aGVu
IEkgd2FzIGFibGUgdG8gbG9naW4gdG8gdGhlIGNvbnNvbGUsCj4KPiAkIHVuYW1lIC1hCj4gTGlu
dXggb2Ryb2lkIDUuMi4wLXJjNCAjMTEgU01QIFBSRUVNUFQgU2F0IEp1biAxNSAxOToyNzo0MiBD
RVNUIDIwMTkKPiBhcm12N2wgR05VL0xpbnV4Cj4gJCBjYXQgL3Byb2MvaW50ZXJydXB0cyB8IGdy
ZXAgc3RtbWFjCj4gIDQwOiAgICAgICAgIDEyICAgICAgICAgIDAgICAgICAgICAgMCAgICAgICAg
ICAwICBtZXNvbi1ncGlvLWlycWNoaXAgIDE3Cj4gTGV2ZWwgICAgIHN0bW1hYy0wOjAwCj4KPgo+
IEFuZCBoZXJlIGlzIHdpdGggb25lIG1pbnV0ZSBkZWxheToKPgo+ICQgKGRhdGUgLVIgOyAgY2F0
IC9wcm9jL2ludGVycnVwdHMgfCBncmVwIHN0bW1hYyA7IHNsZWVwIDFtIDsgZGF0ZSAtUiA7Cj4g
Y2F0IC9wcm9jL2ludGVycnVwdHMgfCBncmVwIHN0bW1hYyApCj4KPiBTdW4sIDE2IEp1biAyMDE5
IDE3OjIyOjAwICswMjAwCj4gIDQwOiAgICAgICAgIDMyICAgICAgICAgIDAgICAgICAgICAgMCAg
ICAgICAgICAwICBtZXNvbi1ncGlvLWlycWNoaXAgIDE3Cj4gTGV2ZWwgICAgIHN0bW1hYy0wOjAw
Cj4gU3VuLCAxNiBKdW4gMjAxOSAxNzoyMzowMCArMDIwMAo+ICA0MDogICAgICAgICA0NyAgICAg
ICAgICAwICAgICAgICAgIDAgICAgICAgICAgMCAgbWVzb24tZ3Bpby1pcnFjaGlwICAxNwo+IExl
dmVsICAgICBzdG1tYWMtMDowMApteSBpbnRlcnByZXRhdGlvbiBvZiB0aGlzIGlzOiB0aGUgUEhZ
IGlzIGRldGVjdGluZyBhIGxpbmsgY2hhbmdlIGFuZAp0aGF0J3Mgd2h5IHRoZSBrZXJuZWwgYmVo
YXZlcyBhY2NvcmRpbmdseQoKPiA+IGRpZCB5b3UgcnVsZSBvdXQgdGhlIHVzdWFsIHN1c3BlY3Rz
IChkaWZmZXJlbnQgc3dpdGNoIHBvcnQsIHRyeSB3aXRoCj4gPiBhbm90aGVyIGNhYmxlKT8KPgo+
IEkndmUgdHJpZWQgaW5kZWVkIGFscmVhZHkgdHJ5IGFsbCBvdGhlciBwb3J0IG9mIHRoZSBzd2l0
Y2ggKGl0J3MgbXkKPiBpbnRlcm5ldCBib3gpIGFuZCBhbiBvdGhlciBuZXR3b3JrIGNhYmxlLCB3
aXRoIHRoZSBzYW1lIHJlc3VsdC4KPiBCdXQgaW50ZXJlc3RpbmdseSBJJ3ZlIHBlcmZvcm1lZCBv
bmUgbW9yZSB0ZXN0IHRvZGF5LCBieSBjb25uZWN0aW5nIHRoZQo+IG9kcm9pZCB0byBhbiBvdGhl
ciBzd2l0Y2ggKGEgRC1MSU5LIDhwIGdpZ2FiaXQpIGFuZCB0aGVyZSB3aGF0ZXZlciBjYWJsZQo+
IEkgdXNlLCB0aGUgbGluayBiZWNhbWUgc3RhYmxlLiBUaGlzIGlzIHN0cmFuZ2UgYXMgSSd2ZSBv
dGhlciBQQ3MKPiBkaXJlY3RseSBjb25uZWN0ZWQgdG8gdGhlIGludGVybmV0IGJveCBhbmQgd29y
a2luZyBmaW5lIGluIGdpZ2FiaXTigKYuIGFuZAo+IHRoZSBkLWxpbmsgYW5kIHRoZSBpbnRlcm5l
dCBib3ggYXJlIGluIGdpZ2FiaXQgdG9vLgp0aGF0J3MgaW50ZXJlc3RpbmcgaW5kZWVkIGFuZCBt
YXkgZXhwbGFpbiB3aHkgSSdtIG5vdCBzZWVpbmcgdGhpcyBpc3N1ZQoKPiBUaGUgcmVzdWx0IGZy
b20gL3Byb2MvaW50ZXJydXB0cyBhYm92ZSBhcmUgd2hlbiBJJ20gY29ubmVjdGVkIHRvIG15Cj4g
b3BlcmF0b3IgYm94LCBmcm9tIHRoZSBkLWxpbmsgdGhlIHZhbHVlIGRvZXNuJ3QgY2hhbmdlIGFu
eSBtb3JlLgo+Cj4gQWNjb3JkaW5nIHRvIHRoZSAiYWJvdXQgcGFnZSIgb2YgdGhlIGludGVybmV0
IGJveCwgdGhpcyBpcyBhIFNhZ2VtY29tCj4gKExpdmVib3ggMykuCj4KPiBTbyBpdCBsb29rIGxp
a2UgdGhlcmUgYSBpbmNvbXBhdGliaWxpdHkgYmV0d2VlbiB0aGUgUmVhbHRlayBSVEw4MjExRiBh
bmQKPiB0aGUgIlNhZ2VtY29tIiBidXQgbm90IHdpdGggYSAic3R1cGlkIiBkLWxpbmsgc3dpdGNo
4oCmLgpjYW4geW91IHRyeSB0byBkaXNhYmxlIEVFRSAoZW5lcmd5IGVmZmljaWVudCBFdGhlcm5l
dCkgZm9yIEdiaXQgbGlua3M/CnlvdSBuZWVkIHRvIHJlYnVpbGQgdGhlIC5kdGIgKHR5cGljYWxs
eSBidWlsdCB0b2dldGhlciB3aXRoIHRoZQprZXJuZWwpIGZvciB0aGF0OgotIG9wZW4gYXJjaC9h
cm0vYm9vdC9kdHMvbWVzb244Yi1vZHJvaWRjMS5kdHMKLSBnbyB0byB0aGUgImV0aF9waHkiIG5v
ZGUgKGZvciBleGFtcGxlOiBbMF0pCi0gYmVsb3cgdGhlICJyZWcgPSA8MD47IiBsaW5lIGFkZDog
ZWVlLWJyb2tlbi0xMDAwdDsKLSByZWJ1aWxkIHRoZSBrZXJuZWwgdG8gZ2V0IGFuIHVwZGF0ZWQg
LmR0YgotIGJvb3QgdGhlIGtlcm5lbCB3aXRoIHRoYXQgLmR0YgoKMy4xMCBrZXJuZWwgaGFzIEVF
RSBkaXNhYmxlZCBmb3IgMTAwTWJpdCBhbmQgR2JpdCBsaW5rcyBidXQgaW4gdGhlCnBhc3Qgd2Ug
aGF2ZSBvbmx5IHNlZW4gaXNzdWVzIHdpdGggR2JpdCBsaW5rcyBpbiByZWFsaXR5CndlIHJlbW92
ZWQgdGhhdCBlZWUtYnJva2VuLTEwMDB0IHByb3BlcnR5IHdpdGggdjUuMCBpbiBbMV0KaXQgc2Vl
bWVkIHRoYXQgZml4aW5nIHRoZSBpbnRlcnJ1cHQgcG9sYXJpdHkgYWxzbyBmaXhlcyBhbGwgaXNz
dWVzCnRoYXQgd2UgcHJldmlvdXNseSB3b3JrZWQgYXJvdW5kIGJ5IGRpc2FibGluZyBFRUUuCm1h
eWJlIHlvdSBmb3VuZCBhIGNhc2Ugd2hlcmUgd2Ugc3RpbGwgbmVlZCB0aGF0IGludGVycnVwdAoK
Ck1hcnRpbgoKClswXSBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi8wOWVl
OTUxNjE3ZDlhZjhhODZkMjI4YjJlZDM0MDM1MDc2YWI2MDAxL2FyY2gvYXJtL2Jvb3QvZHRzL21l
c29uOGItb2Ryb2lkYzEuZHRzI0wyMzYKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9s
aW51eC9jb21taXQvZTM1ZTI2YjI2ZTk1NWM1M2U2MWMxNTRiYTI2YjliYjE1ZGE2Yjg1OAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
