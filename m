Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3933C9EC6B
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jan 2026 11:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6XlCoJ/ldu38HYC/pXuch/AN01ZapdFwCZwhr624Ejw=; b=UNmxLBAzgGGWxD
	nEnwyXA7amWqnzd2RtC49TuqVFj2sWNedM9w1T3KrqLiDa41l19erCjzPYaqFYXx0BK9tM0VtaHc4
	MaU9aqrA/BzxtclDFRgKbLl3V2p/yy9qze/CxetuL1j4i8ypxq6pEbT9ilPHIycnkuU8Hwf6XJKJ2
	kWLNd2I2Y2bcUtxk8YEqsThz/XmSZQMwaRw+kYhg8OGxS/pk3dis8JxOQqTBcjaRhPK7xt6vx5P+e
	tc+Y0M/E1Jy2cbANCRVgDgdD9Of7TS5DobyLS612vIv8ko5Z7+ZJyAaOrfwbfMiCmFwIyT/q2sVQe
	S71SuDYE+u/dmbBHipFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFxU-00000005ETl-0ajD;
	Mon, 12 Jan 2026 11:19:40 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFxR-00000005ERt-3WPX
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Jan 2026 11:19:38 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2a137692691so41838385ad.0
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Jan 2026 03:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768216777; x=1768821577; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxPBiCWb0NOVn214pVZJyp96uXR6w0HjkmgFnnCgJjA=;
        b=cz3SOmtiZBlubF6tPc/ayxGP3JjOQ/prCDCTTP5EylJCrHqxhm4EnnK8Ejois3a837
         wMsO3CqtVlLt5yUKahOzzfnaAyzdSLxSUCnLIkJB6AuLJepPGmc/xkKPQcUecq4eprbs
         vLf4AsI9fujfJa9BpshmzKyCBROht+BmlLpAWKIgWQSBt7Or84EWwWgSXOjDevb4kJ8V
         QHUCQLR/doWQh6mQ9GjvvmkiGs4B7awnkn9yd2DjJxRbaSoCi/5a+Q6Zjy01Q0QAW0Yc
         E6WeDR0Gpt9eYVIiRDQ09jcrp+ipDYbRcwJx6ONfu1Fw4622lQifsm/LQ9AgwH+J1wiW
         lm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768216777; x=1768821577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rxPBiCWb0NOVn214pVZJyp96uXR6w0HjkmgFnnCgJjA=;
        b=L9NzZQ+HV+Msax/kDwyuSFvf9+GLmoeU3BoYnU40/54buPpB4+F3wAp6g20fol4FZo
         5EBEdbXRK7PYFYEolAlhvMZPN9VwKFYnHywt4G0GlsP4vxwIyxnflUm55Wb5OW9Lqzhz
         8qm/O5At3MNDrMCvxAeTIBMzTf5EBrybd9yp0mLv3mtgISxpB7CmHh3Q8aUSDlzcpr2c
         OO32EgJ/Dl/KzKBuHgUG9x3MmdVucilHE5JJUustWlZkteFDFcW2dQKWY2dhkv1kLGX8
         XZkFqg3KxFiozmjuZMHVqDSkQl/BNGxbPWDraqq9T/vpQQml0I3EbIexrl++NWto9tLG
         VIjg==
X-Gm-Message-State: AOJu0YxXg7TfKBOqk8R2LQtt0SCaop5Tnb3gQhqU9sCW0wUSC8CTGeL1
	jKoLuWccSi1M17xAPTlKYkU6HMEHgY35Rljay2/2s0gDmFfWkI1JewBuS/hWTzwMXCDGfJb8rG6
	q42t1hwoGyvdNenQa3EmG/ihHp7u2h8U=
X-Gm-Gg: AY/fxX50N4i8mXY0rNLK0b9HGYbCuCSkD9n1FAxekAEaSWhPRH1PYiM5Jyf5UMRBaYV
	y2RrfMuk/eMFS9xkMgWtT7ojVA+wrxS3EI/yBBak73iX9cmGWRT08QLfR95K5RKTcgd+w3LsVqd
	Ea5WKGGLAwN5fnpFn5qyRsVfTApU679N6atDRmL2drS8XCL+9FIJry8EeWCIjPXtBjbO1jkIrh4
	CmfWWBiulVVt/hePR2sJFHFHhj67PGMz364UsmUtyLpQYv2k1+I5nVWqtLmT1atU4ddfMqaaszo
	EAFM2FDkfKa4kcjYX1Pybom571Xz
X-Google-Smtp-Source: AGHT+IEHicF+3IJcwgxgH/BBD93opK5AWO2KmeQnPaid+LFlPvwR0B0ZKBH5hgAi8y89KFSsmAmBeqgOAxet4wXxVKI=
X-Received: by 2002:a17:902:f60d:b0:2a0:daa7:8a3d with SMTP id
 d9443c01a7336-2a3ee47f15amr165050485ad.23.1768216776602; Mon, 12 Jan 2026
 03:19:36 -0800 (PST)
MIME-Version: 1.0
References: <20260110200426.1461575-1-martin.blumenstingl@googlemail.com>
 <20260110200426.1461575-2-martin.blumenstingl@googlemail.com> <20260112-quixotic-daft-starfish-5fe914@quoll>
In-Reply-To: <20260112-quixotic-daft-starfish-5fe914@quoll>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 12 Jan 2026 12:19:25 +0100
X-Gm-Features: AZwV_QhMOFbqafd1y2lAFL-G5cdRwETJL_KsPrbRSoSrEkURS4Vzk3WQ_kBZSVE
Message-ID: <CAFBinCAG-N+FKfSyqi+6s7dW8mK54W=-NpFAg=x5N4mF3gH22g@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: gpu: mali-bifrost: Add compatible for
 Amlogic Meson S4
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	adrian.larumbe@collabora.com, steven.price@arm.com, 
	boris.brezillon@collabora.com, robh@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_031937_882907_C991A458 
X-CRM114-Status: GOOD (  16.44  )
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

SGkgS3J6eXN6dG9mLAoKT24gTW9uLCBKYW4gMTIsIDIwMjYgYXQgMTA6MzHigK9BTSBLcnp5c3p0
b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCBKYW4gMTAs
IDIwMjYgYXQgMDk6MDQ6MjRQTSArMDEwMCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiA+
IEFkZCBhIGNvbXBhdGlibGUgc3RyaW5nIGZvciB0aGUgTWFsaS1HMzEgR1BVIGluIHRoZSBBbWxv
Z2ljIE1lc29uIFM0Cj4gPiBTb0MuIEl0IGhhcyB0d28gY2xvY2sgaW5wdXRzIChHUFUgY2xvY2sg
YW5kIGEgYnVzIGNsb2NrKSBhcyB3ZWxsIGFzIHR3bwo+ID4gcmVzZXRzIChtYWluIEdQVSByZXNl
dCBsaW5lIGFuZCBhIEdQVSBBQlAgcmVzZXQgbGluZSkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
TWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4K
PiA+IC0tLQo+ID4gIC4uLi9iaW5kaW5ncy9ncHUvYXJtLG1hbGktYmlmcm9zdC55YW1sICAgICAg
ICB8IDIwICsrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0
aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZ3B1L2FybSxtYWxpLWJpZnJvc3QueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktYmlmcm9zdC55YW1sCj4gPiBpbmRleCBkYjQ5YjhmZjhj
NzQuLjg1ZmFlNzc1MzAwNCAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktYmlmcm9zdC55YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxpLWJpZnJvc3QueWFtbAo+ID4gQEAg
LTE5LDYgKzE5LDcgQEAgcHJvcGVydGllczoKPiA+ICAgICAgICAgICAgLSBlbnVtOgo+ID4gICAg
ICAgICAgICAgICAgLSBhbGx3aW5uZXIsc3VuNTBpLWg2MTYtbWFsaQo+ID4gICAgICAgICAgICAg
ICAgLSBhbWxvZ2ljLG1lc29uLWcxMmEtbWFsaQo+ID4gKyAgICAgICAgICAgICAgLSBhbWxvZ2lj
LG1lc29uLXM0LW1hbGkKPiA+ICAgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTgzLW1hbGkK
PiA+ICAgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTgzYi1tYWxpCj4gPiAgICAgICAgICAg
ICAgICAtIG1lZGlhdGVrLG10ODE4Ni1tYWxpCj4gPiBAQCAtMTQzLDYgKzE0NCwyNSBAQCBhbGxP
ZjoKPiA+ICAgICAgICAgIHBvd2VyLWRvbWFpbi1uYW1lczogZmFsc2UKPiA+ICAgICAgICByZXF1
aXJlZDoKPiA+ICAgICAgICAgIC0gcmVzZXRzCj4gPiArICAtIGlmOgo+ID4gKyAgICAgIHByb3Bl
cnRpZXM6Cj4gPiArICAgICAgICBjb21wYXRpYmxlOgo+ID4gKyAgICAgICAgICBjb250YWluczoK
PiA+ICsgICAgICAgICAgICBjb25zdDogYW1sb2dpYyxtZXNvbi1zNC1tYWxpCj4gPiArICAgIHRo
ZW46Cj4gPiArICAgICAgcHJvcGVydGllczoKPiA+ICsgICAgICAgIHBvd2VyLWRvbWFpbnM6Cj4g
PiArICAgICAgICAgIG1heEl0ZW1zOiAxCj4gPiArICAgICAgICBwb3dlci1kb21haW4tbmFtZXM6
IGZhbHNlCj4gPiArICAgICAgICBjbG9ja3M6Cj4gPiArICAgICAgICAgIG1pbkl0ZW1zOiAyCj4K
PiBtaXNzaW5nIG1heEl0ZW1zClRoYW5rcywgSSdsbCBhZGQgaXQhCgo+IENhbid0IHRoaXMgYmUg
Y29tYmluZWQgd2l0aCBleGlzdGluZyBtZXNvbiBlbnRyeSwgKmFmdGVyKiBmaXhpbmcgaXQgdG8K
PiBpbmNsdWRlIG1pc3NpbmcgY2xvY2tzPwpJIGRvbid0IHRoaW5rIHNvOiBHMTJBIChhbmQgZWFy
bGllciBTb0NzKSBoYXZlIHRoZSBNYWxpIHJlZ2lzdGVycwoic29tZXdoZXJlIiwgd2hpbGUgb24g
UzQgTWFsaSBpcyBvbiB0aGUgQVBCNCBidXMuCkV2ZW4gaWYgdGhleSBhcmUgb24gYSBidXMgb24g
RzEyQTogdGhlbiB0aGVyZSdzIG5vIGNsb2NrIGxpbmtlZCB3aXRoCnRoYXQgYnVzIChhdCBsZWFz
dCBub3RoaW5nIEknbSBhd2FyZSBvZikuClRoaXMgaXMgd2h5IEkgZXZlbiBpbnRyb2R1Y2VkIGEg
bmV3IHNlY3Rpb24gaW4gdGhlIGJpbmRpbmdzLgoKCkJlc3QgcmVnYXJkcywKTWFydGluCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
