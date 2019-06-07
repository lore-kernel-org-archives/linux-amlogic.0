Return-Path: <SRS0=bWzJ=UG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ECDEC2BCA1
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2019 20:24:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 639F620868
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2019 20:24:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fspZ0Qrb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="EAQ8jUfj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 639F620868
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5X8dgv6FNoTZvhSC17irknESMiUY5zPrsZ8d2iTPoWU=; b=fspZ0QrbBIXUP1
	NgNcurvPx0Ebgz4OgIG3QuP+FbJ+X82ODoDLodywZc+f2qol+uCsIl0hhDCAzewDuf1JZF46oOVOL
	C02Y64uzkT34PL65uKC3AYqc+GCZx1cPRY7NEKhCaQJ9D8K1jZQn+2n2EKE5P1wKACVA2XawhaJW/
	4R1ff9SfbQEyZQbbbEzUDmP8VgavtpKEEQPTpyPysnq1+2g+e/B+j55qhjv4o7lODnlDeybrsQJyy
	jb1rH8QTqEs9lnHEt+2O0Qc/0EJl4Mma1mwFDDQRkUyf63zpTA49BNoNh7VMpJWYcvDHgUlfjl3hU
	HGvuPeD7jYt+spJXlCbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZLPK-0006h0-Id; Fri, 07 Jun 2019 20:24:14 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZLPH-0006gc-GW
 for linux-amlogic@lists.infradead.org; Fri, 07 Jun 2019 20:24:12 +0000
Received: by mail-ot1-x341.google.com with SMTP id p4so3056199oti.0
 for <linux-amlogic@lists.infradead.org>; Fri, 07 Jun 2019 13:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jNlaL52WIIgSVKNO2X4XnRuwPdnlv3cCH295mpyXY5c=;
 b=EAQ8jUfjPfVI8/yoMjfgypfgHsSP0Tzs5Rng4shYNh6FrbvQXcfAKtsRYrI6KMafie
 CwimQEpddZAZLgLKEI4tDpn2kVJNF0VuRu02+OIcM+pHtM47N+463RmljOk0UqtXbV7i
 7hrxlrVe/k7HX3W4YZPzUrmeTpwRtvPkr2Bll/DBMeVcOKYKcWGFDea5Q2Q3fafiTJJF
 ZwqnBdhlz8PwRIKMJyUOkg1VzrZxPhx0sfJXebH0CCIGUKnxO5XA39BGZ4udmEPehACJ
 Dr2v17oU2ayjCSLhQvYIvinGEejnQdbUvorZDgQujTiiUbOUq1sw2QFo/Q4CHROqn+e2
 UdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jNlaL52WIIgSVKNO2X4XnRuwPdnlv3cCH295mpyXY5c=;
 b=OlLIAWJ0M06LavC2l40HbYxBRutwIOIvrKxE3lrMidShZ36t5eGTLI6KJKBR/Fc/zf
 g5VLABvfsVRuWxUOz27qW0JH6ToD4O0aEtxAkuX2Sw1z80i0GlOD5gwnp3mdNGsAw/gY
 D9lqwkDP9K0Qm4vbZ5ZPUDpYIMAVK2zJMsipmkcfLXj40XeW3DJ5r3sIFipRKNy+Fa/x
 V/AkI4iVOyxQuUQe6CzkVwKDWvgtOMDEs63tP+PQMQ4T8kaeD6CadwPduIVtvcH3EUCT
 Gpa3BrGopK+salDzuwkXPn+zju+ORtVNPtoEo9fOW5J/csgi1CQR6Sd3+Nb9pxMMmBhm
 Au6Q==
X-Gm-Message-State: APjAAAXhE/WYeAcSx4uxfdgJc4G6GUX1jLgRFuI1BVvR5jcy1KjyRmLO
 sR3ySk7M0wMjgPbcmnB1vyDVVEKWgpOuTKmn/nA=
X-Google-Smtp-Source: APXvYqwgiNw12vso/HlWEcAyEZMdpJYLLkGxMifew9cHfk6rW4MmeRe7Nr3CY47A1CWX3yox7dvoHHOpWVj+1dWAcgg=
X-Received: by 2002:a9d:32a6:: with SMTP id u35mr21297959otb.81.1559939050108; 
 Fri, 07 Jun 2019 13:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190606132439.25182-1-krzysztof.michonski@digitalstrom.com>
 <20190606132439.25182-2-krzysztof.michonski@digitalstrom.com>
 <CAFBinCB+W8F9PL4ZgiQJxXu7qmgfORgbPB=6AM-kzXmChpjWyg@mail.gmail.com>
 <CAOiNxGD2OLwbHhUWuvOV6H0woQEOuk10_t-PTfqvMKNu_tTn4Q@mail.gmail.com>
In-Reply-To: <CAOiNxGD2OLwbHhUWuvOV6H0woQEOuk10_t-PTfqvMKNu_tTn4Q@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 7 Jun 2019 22:23:59 +0200
Message-ID: <CAFBinCBYCry3qYicPTq1Ui4d4792fWgtocSyaYyVLV3ji6Qyrw@mail.gmail.com>
Subject: Re: [PATCH 2/2] Enable secure monitor on gxl
To: =?UTF-8?Q?Krzysztof_Micho=C5=84ski?= <michonskikrzysztof@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190607_132411_577930_1E50D06D 
X-CRM114-Status: GOOD (  11.71  )
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

KGFkZGluZyBiYWNrIHRoZSBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcgbWFpbGlu
ZyBsaXN0KQoKT24gRnJpLCBKdW4gNywgMjAxOSBhdCA5OjEzIEFNIEtyenlzenRvZiBNaWNob8WE
c2tpCjxtaWNob25za2lrcnp5c3p0b2ZAZ21haWwuY29tPiB3cm90ZToKPgo+IEhpIE1hcnRpbiwK
PiA+IHRoZSBzdWJqZWN0IHNob3VsZCBzdGFydCB3aXRoOiAiYXJtNjQ6IGR0czogbWVzb24tZ3hs
OiIsIHNlZSB0aGUgZ2l0Cj4gPiBoaXN0b3J5IChub3RlIHRoYXQgdGhlcmUgd2FzIGEgcnVsZSBj
aGFuZ2UgdG8gdXNlICJhcm02NCIgaW5zdGVhZCBvZgo+ID4gIkFSTTY0IikKPiBUaGFua3MsIHNv
IEkgd2lsbCByZXNlbmQgdGhlIHBhdGNoZXMgd2l0aCBjb3JyZWN0IHRvcGljIHNvb24uCnRoYW5r
IHlvdSEKCj4gPiB5b3UgY2FuIHVzZSBhIGZhbGxiYWNrIGNvbXBhdGlibGUgc3RyaW5nIHNvIHRo
aXMgbmV3IC5kdHMvLmR0YiBhbHNvCj4gPiB3b3JrcyB3aXRoIG9sZCBrZXJuZWxzICh3aGljaCBk
b24ndCBzdXBwb3J0IHRoZSBuZXcsIEdYTCBzcGVjaWZpYywKPiA+IGNvbXBhdGlibGUgc3RyaW5n
IHlldCk6Cj4gVGhlIHNlY3VyZSBtb25pdG9yIHRoZW4gd2lsbCBub3QgYmUgY29tcGF0aWJsZSB3
aXRoIGd4bCBzaW5jZQo+IHRoZSBzaGFyZV9pbi9vdXQgc3RvcmFnZSBhZGRyZXNzZXMgaW4gdGhl
IGd4bCBzdHJ1Y3QgZGlmZmVyIGZyb20gZ3hiYi4KSSBtaXNzZWQgdGhhdCwgdGhhbmsgeW91IGZv
ciBjbGFyaWZ5aW5nIHRoaXMuIEknbGwgcmVwbHkgd2l0aCBhCnNwZWNpZmljIHF1ZXN0aW9uIHRv
IHlvdXIgb3RoZXIgcGF0Y2gKCj4gU2hvdWxkIEkgc3RpbGwgYWRkIHRoZSBmYWxsYmFjayBzdHJp
bmcgdGhlbj8KYXNzdW1pbmcgR1hCQiBhbmQgR1hMIGFyZW4ndCBjb21wYXRpYmxlIHRoZW4gSSB3
b3VsZCBkbyBpdCBsaWtlIHRoaXM6Ci0gbW92ZSB0aGUgZXhpc3Rpbmcgc2VjdXJlIG1vbml0b3Ig
bm9kZSBmcm9tIG1lc29uLWd4LmR0c2kgdG8KbWVzb24tZ3hiYi5kdHNpIChiZWNhdXNlIGJhc2Vk
IG9uIHlvdXIgZGVzY3JpcHRpb24gaXQgZG9lc24ndCB3b3JrIG9uCkdYTC9HWE0gYW55d2F5cykK
LSBsaWtlIHlvdXIgcGF0Y2ggYWxyZWFkeSBkb2VzOiBpbnRyb2R1Y2UgYSBuZXcgc2VjdXJlIG1v
bml0b3Igbm9kZSBpbgptZXNvbi1neGwuZHRzaQoKCk1hcnRpbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
