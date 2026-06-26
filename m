Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E4EC43458
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Jun 2026 20:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M6Uy6dfYJNfTHBM0VxKE16+9GFKkiS2GLRqc1HSkObI=; b=iauvEm3afH9oes
	/jElgAjkihz+ItxOo4Q80jWWPX8dPcpJFMtZ9Q+OqTATZp3CWH8H27lrcVE4XDs8H1RokefgKH2QC
	UbUwaKn3/x7yR83UAA/QP0Y25JJ9kguNFG2Zi0h6yAkJRNgsgQex5GDwQRfszphNEP49+uRDbT4zH
	sTN3kxhNgpKoePraBZvsS2QHdR1nS2SonZ6O2O1ExwUJS+EM4lewjL/uaH93i1kudjprXU57PvkEE
	lIwIm2hJ04i9KUchrcN+MvD5sJk58M8viGArSthkAoaOlwc+WVw0WP+57QB2NUKHd4RQvgozlWuvL
	BsB0mvBYDPtZlmOKbHIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDMp-0000000Bos4-3BKx;
	Fri, 26 Jun 2026 20:41:39 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDMn-0000000BorN-0kRr
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Jun 2026 20:41:38 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c80d215169so15290845ad.3
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Jun 2026 13:41:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782506496; cv=none;
        d=google.com; s=arc-20260327;
        b=ivBTA+3gY2W4sRZZU0kb8hlsbu8iRexGcp/nnGD6scFFZfRg0V6xT9KRD5l9lVzDsP
         iP7PPcQWjGH4KJZ4PBbWeIS2hrPRbCO4cIVAkTpQSZruHFOMjbRhGoMtIDQnNA2b7v7b
         LEMsQS37mvVQSfjpr4rbIoDZ55EmwM9xcmLZO7KEklpbIvr68C8R79m89LUUljOvjj/g
         XsIjT77qswMbYKeKOe8RSKoX7BEzqKYwiyexWunhOEJ37A4ZX3oFgO+gdo3Vr5axN83J
         uq3XRotR2ngKrmMoSTivBhAB1GlM8PXVaeeAxYy7z/Ctg7tiMiGyFVCDHnWZSt+wN2s7
         ProQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WIWP18m3HG8WOaoy4MbWUmKe5JZZFk+engmnmas88Q0=;
        fh=XkFhZuki04p2vqSA6NeHPbO012A9SSRRE1hrhlHIGdI=;
        b=DPglI3c6it8ONweteLrnUMiFaTJSjj2w/94TBJ7IjUBSPtWTVTgQhXdHKRZT8VFu/Q
         clZzvOYxJn1pVy3GP8Wl/tGDUTkyXB0vPd4/CzNKUgSxHvpDRsQ8vO+B06/4JUC5Xs77
         UXRV8dGpB0B1/rg/HJfi83dXnW/DdGf44vjdbDuRbNzOrHQw3TCaMO7VRcra1MM1m+z3
         DxR4plcNOF1QEAUHMvybe5151ciRzus6kj99cpmaRUTVoc/LYC/De43PwTpPk8wrmfXS
         yMuA3O5WFoetFkB5EpwfYwYBLl31CcWpN6Dmr8vJN//0f76cKb+kQj0xWrTPIQTMyWIn
         KKSA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1782506496; x=1783111296; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIWP18m3HG8WOaoy4MbWUmKe5JZZFk+engmnmas88Q0=;
        b=EkEdcAzbhjOzK453372FKqSrsj4L6f2Gx1DZKb+3ji/lYJV1HBKUViA2Us3dlsq4Dd
         yjS0aB4LTlbm2tRLWuBDcyKpaVJhQZxQShVuPNRkGgyH5ehH+W6Jcqn+xMv+JRUTD7mS
         Tpkh+fU2iV7yvN/RX2rwzBQXPlJQcsQklYckQxbNQphvXq58DrM9BkskLthBSgu10v8E
         FqcQQ5vaJMa2YcORxww8xrFvPJMvJ/L0vluEwNDIlKxSiRgbIfDHPTK7im3sLZW4UV95
         /aoj5jGr1AycPnWcodcuXEGIE59aSjj2aB63UUDsJ0S0s0BcA6LElGJnbmjUiIqoAfSG
         AEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782506496; x=1783111296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WIWP18m3HG8WOaoy4MbWUmKe5JZZFk+engmnmas88Q0=;
        b=c7zPjAa6URcX9VYhNkKIVGMQlsB2d85iRQ/aGEfBL/2WcZp6zeYPPqH9fg4ao2q5rD
         jO5yOfRJOEbLdeQNyUFZaeshT262XIu/dw4UTznk4b1KCvPL4vx7amAEHkbc1NhVxC0P
         t+6RNwF4hGfpaMFqjNjvuRU2GmBGwL4aZLmmtYMuvlok11rR1TOb61accneYGOy3sWOq
         vqAFLGxqaRJ4qiePWVWfdatEply7KIhQIaFYQIEgS4HQ1gJ8mLK6tvpVP3SgI/WSf8fo
         9Sj+CoYOhma88Q34Tnr2Rn4CtS/y/Yd1AGb+veNrtrmGF3ItRD33ApRn4W7IrQ/pDpfu
         tKdw==
X-Forwarded-Encrypted: i=1; AHgh+Ro8cnLz9fQpZc8LEHiPZhWSzu1zxA9a7tACGal6AAk3rYWnfumA313TkWl+PjuHhxasS50DfAy/4VCpyPHA@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4Sq07YzwblE+iIUvnIucBehGPp+8EUtF8jv/ZdRCwNWixjqEe
	5xyWacuF3HsTzsIuC2zP0AhoVzjPdQkUCbjdlXwoEoEcR5KELuLnc2zvCJu7uzPH4sWZ1/V0yIP
	CaIcBsyWtUfeSAKnWkZKdDJK5ziCOM+w=
X-Gm-Gg: AfdE7ckrD8wl3EmjLu8mKLZjfJqkGoSkQChv0PXk0IuzzEzsQcYSA46EpHU0cTm3EkI
	tiCTmABTjOSjDxacyl3+sB+6WI8yxZtt9X6IDYbFXdN5B6uz/xHZrPb1ZyIpkK8ML6q7OVq0qY1
	KV0LW86bsiAeFZx5Ws7ikm1u7RVkiG7BpGHxkpKoi6pPI6l6ixtICs+0/x9JtL1a9/ya0OaP1Bq
	UdGG1956PIqJZFZDC1ic/T8unc/gmve5avfDhJqa58HzPROSYGsNg/rB+U+CToM8N1vQ623BweQ
	euPM+MDeIGA5oAQzg05kJr5mXiHsQA==
X-Received: by 2002:a17:902:e847:b0:2c6:a404:ee91 with SMTP id
 d9443c01a7336-2c7fc6f344dmr79970005ad.21.1782506495557; Fri, 26 Jun 2026
 13:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260626080422.4191435-1-christianshewitt@gmail.com>
In-Reply-To: <20260626080422.4191435-1-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 26 Jun 2026 22:41:24 +0200
X-Gm-Features: AVVi8Cfn4WVK2ZPqNv9jC0XwZH2Brmz7LG-ORQmMP9Wwtqmvfi60nz5FLrHG7m8
Message-ID: <CAFBinCD5bn5VixbomCz0nmHuopBmgh0CJc-V4jY2vdXhoP_VCw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF
 datapath on start/stop
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_134137_224172_F6CC0DCB 
X-CRM114-Status: GOOD (  13.68  )
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

T24gRnJpLCBKdW4gMjYsIDIwMjYgYXQgMTA6MDTigK9BTSBDaHJpc3RpYW4gSGV3aXR0CjxjaHJp
c3RpYW5zaGV3aXR0QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgSTJTIEZJRk8gc29mdC1yZXNl
dHMgaXRzIGZhc3QgZG9tYWluIG9uIHN0YXJ0IChBSVVfUlNUX1NPRlQgYml0IDAgKwo+IEFJVV9J
MlNfU1lOQyByZWFkIGluIGFpdV9maWZvX2kyc190cmlnZ2VyKSwgbWlycm9yaW5nIHRoZSBkb3du
c3RyZWFtCj4gdmVuZG9yIGRyaXZlcidzIGF1ZGlvX291dF9pMnNfZW5hYmxlKCkuIFRoZSBTL1BE
SUYgRklGTyBoYXMgbm8gZXF1aXZhbGVudDoKPiBpdCBvbmx5IHRvZ2dsZXMgdGhlIElFQzk1OCBE
Q1UsIHNvIGEgc3RhbGUgZGF0YXBhdGggRklGTyBjYW4gYmUgcmVwbGF5ZWQsCj4gcHJvZHVjaW5n
IHRoZSAibWFjaGluZSBndW4gbm9pc2UiIGJ1ZmZlciB1bmRlcnJ1biAtIG9uIHN0YXJ0IHdoZW4g
c3dpdGNoaW5nCj4gb3V0cHV0cywgYW5kIG9uIHN0b3Agd2hlbiBwbGF5YmFjayBlbmRzLiBUaGUg
bGF0dGVyIGlzIGF1ZGlibGUgb24gZGV2aWNlcwo+IHdpdGggYW4gYWx3YXlzLW9uIFMvUERJRi1m
ZWQgREFDIChlLmcuIHRoZSBFUzcxNDQgb24gdGhlIFdlVGVrIFBsYXkyKS4KPgo+IFRoZSB2ZW5k
b3IgZHJpdmVyIHJlc2V0cyB0aGUgSUVDOTU4IGZhc3QgZG9tYWluIChBSVVfUlNUX1NPRlQgYml0
IDIpIG9uCj4gYm90aCBlbmFibGUgYW5kIGRpc2FibGUgKGF1ZGlvX2h3Xzk1OF9lbmFibGUpLCBh
bmQgd2hlbiByZWNvbmZpZ3VyaW5nCj4gKGF1ZGlvX2h3Xzk1OF9yZXNldCBjbGVhcnMgQUlVXzk1
OF9EQ1VfRkZfQ1RSTCB0aGVuIHJlc2V0cykuIERvIHRoZSBzYW1lOgo+IHJlc2V0IGJlZm9yZSBl
bmFibGluZyB0aGUgRENVIG9uIHN0YXJ0LCBhbmQgYWZ0ZXIgZGlzYWJsaW5nIGl0IG9uIHN0b3Au
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gSGV3aXR0IDxjaHJpc3RpYW5zaGV3aXR0QGdt
YWlsLmNvbT4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5z
dGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpUaGlzIG1hdGNoZXMgdGhlIHZlbmRvciBkcml2ZXIsIHJl
ZmVyZW5jZXM6Ci0gZmFzdC1yZXNldCBTUERJRiBpcyB0cmlnZ2VyZWQgb24gZW5hYmxlIGFuZCBk
aXNhYmxlOiBbMF0KLSBmYXN0LXJlc2V0IFNQRElGIGlzIHRyaWdnZXJlZCBhZnRlciBhbGwgb2Yg
dGhlIGNvbmZpZ3VyYXRpb24gaXMKd3JpdHRlbiwgdGhlbiBEQ1VfRkZfQ1RSTCBpcyBlbmFibGVk
OiBbMV0KClsuLi5dCj4gICAgICAgICBjYXNlIFNORFJWX1BDTV9UUklHR0VSX1NVU1BFTkQ6Cj4g
ICAgICAgICBjYXNlIFNORFJWX1BDTV9UUklHR0VSX1BBVVNFX1BVU0g6Cj4gICAgICAgICBjYXNl
IFNORFJWX1BDTV9UUklHR0VSX1NUT1A6Cj4gICAgICAgICAgICAgICAgIGZpZm9fc3BkaWZfZGN1
X2VuYWJsZShjb21wb25lbnQsIGZhbHNlKTsKPiArICAgICAgICAgICAgICAgc25kX3NvY19jb21w
b25lbnRfd3JpdGUoY29tcG9uZW50LCBBSVVfUlNUX1NPRlQsCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIEFJVV9SU1RfU09GVF85NThfRkFTVCk7Ckl0IGRvZXNuJ3Qg
c2VlbSB0byBtYWtlIGFueSBkaWZmZXJlbmNlLCBzbyBqdXN0IGZvciB0aGUgcmVjb3JkOgpUaGUg
dmVuZG9yIGRyaXZlciBmaXJzdCB0cmlnZ2VycyBBSVVfUlNUX1NPRlRfOTU4X0ZBU1QgdGhlbiBk
aXNhYmxlcyBEQ1U6IFsyXQoKCkJlc3QgcmVnYXJkcywKTWFydGluCgoKWzBdIGh0dHBzOi8vZ2l0
aHViLmNvbS9lbmRsZXNzbS9saW51eC1zOTA1eC9ibG9iL2MxMzkxYmExMTE2YWVkODAxYWFhYmZk
OWM3YmJiNzZmZGE5ODAxZWMvc291bmQvc29jL2FtbC9tOC9hbWxfYXVkaW9faHcuYyNMMTAxNgpb
MV0gaHR0cHM6Ly9naXRodWIuY29tL2VuZGxlc3NtL2xpbnV4LXM5MDV4L2Jsb2IvYzEzOTFiYTEx
MTZhZWQ4MDFhYWFiZmQ5YzdiYmI3NmZkYTk4MDFlYy9zb3VuZC9zb2MvYW1sL204L2FtbF9hdWRp
b19ody5jI0w5NzktTDk4MwpbMl0gaHR0cHM6Ly9naXRodWIuY29tL2VuZGxlc3NtL2xpbnV4LXM5
MDV4L2Jsb2IvYzEzOTFiYTExMTZhZWQ4MDFhYWFiZmQ5YzdiYmI3NmZkYTk4MDFlYy9zb3VuZC9z
b2MvYW1sL204L2FtbF9hdWRpb19ody5jI0wxMDE2LUwxMDE4CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
