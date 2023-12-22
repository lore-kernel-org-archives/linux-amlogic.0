Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B946DC41535
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Dec 2023 10:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gSoMZCuEaa062j+N6E3Olpzy1Eyfa28/sc3jk4gEZB8=; b=Ntlzr+b09YOjYT
	7OWnqyeCamKycso6jkBBFoVfwgMwGQtwZhef+0AzjJFixPoHPdFgV+6u+PI0IMAtn22Uc8Gct08K1
	3AE/QbLM+s4kSy+as4mRSzA4klN1InzGNOIfe4/+mmVCwCKHmAOEtYvYgaYyWqUWtUc2xR0DUPvD2
	WU5G6WVIN2/o9tzmcBmHyHeGflvRCJcq+zOfLPfxJcmsJFrz139ccdUgncNQ6iHnDOEfU87YAFkzS
	TfRMYDB7vmHfX4Ym0/TQXCOhEQEqXiiPvZUY7xuFHXBsLF4C6YYLjOu5qyqcsMjyivuEAvSoAQl4h
	iXTDTs2M2tbQo3YWwuKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGcWM-005W62-35;
	Fri, 22 Dec 2023 10:12:46 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGcWK-005W5L-2H
	for linux-amlogic@lists.infradead.org;
	Fri, 22 Dec 2023 10:12:46 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-28b82dc11e6so1082662a91.1
        for <linux-amlogic@lists.infradead.org>; Fri, 22 Dec 2023 02:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1703239962; x=1703844762; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdoNGX1KxNkpP3oAqLoaAe4EdC/4AxyKYEpoYHOwAEQ=;
        b=ccE5yiUYXgpctBWHERry9+pPdGokJBqf1oYD42+dZ9R2zBraWmJqiDU5AUqUyvgvms
         HQRc+FRSbJDf0RZaA+rvnXGHoR2wdqx1S2mdyKu48qTUnP+h8Crs12r7ZcDtP/QVchS+
         zAtBoicpJ2Ec6foqRP8xHblDfyQ/Kx2VPC45LHJRkUzIJY//AmSzQC/1y7W/kenG9WR7
         OvJsyJwnGlb0Z0Nqgb7TjYk+ft493h68YkOZtc4drCRFSO5jZ80V4zq7dug7Jz5KaYmG
         tN/4moB0FeeEJJNWYrNFOy8yoVs9JbNI3RYQmQV1Id6YSxAsQl6DkNLxICnwSL2NOBEb
         iSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703239962; x=1703844762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vdoNGX1KxNkpP3oAqLoaAe4EdC/4AxyKYEpoYHOwAEQ=;
        b=qVwgWWLcSxKJKXV09cd/LKIYXN4hIS6BEhc6Y17h51JiVMwf8RYVejvpr2V3sO5mG9
         mvIVR5yxjsjz9iT+xRPrlSDQVLeZhLsHRh5Y4q2HfmDlbaty+krUJiydV8y6Eac5GrJB
         nMKSeQYgBNXwALSiB0DhY3Fklkf7owkTLxM7clUGhNQokukM2Z2I/WMyg0zZQ3IPc2eI
         N38rbG2NgrdJbLwp3U9c3JWcefieETn1LI6S4Sf8ThpZUA1vQG7UZuBblRx2vRWU8bXq
         52918OPd3qgTiqRALckm2jbGUppPQYZv1T2htUnAxzZj2zAMzEPHSJoCfhJLthwvbhMN
         hGlQ==
X-Gm-Message-State: AOJu0YwKDAqaSyh/mXUa5YlpoY0DMFP90OcmvI5YgaVdnrcEFMw1SWnn
	XT7G3LLrcsG3/rzCI/M0UpMZ/j8iJa9mqeS87S8=
X-Google-Smtp-Source: AGHT+IGRIV7pvjiFYSQ9d7sslbxtt1545Nx4nbcj99xJQon85WbiNN8wVRIajG7u8TGRT10Y5ZPxfZV5MRwr7bOGOP8=
X-Received: by 2002:a17:90b:19d2:b0:28b:cf7d:bc72 with SMTP id
 nm18-20020a17090b19d200b0028bcf7dbc72mr695938pjb.56.1703239961483; Fri, 22
 Dec 2023 02:12:41 -0800 (PST)
MIME-Version: 1.0
References: <20231221211222.1380658-1-martin.blumenstingl@googlemail.com>
 <tek6c6symqgm6x6ujh4m67q32en24pzrkjbchffir7qljo4gor@7qpu4zmgyzpq>
 <CAFBinCAxh0xU2mDRX3t42j6oJ534p9RPUV+dYoRe0oacTw_7iA@mail.gmail.com> <2f2bc3xvemk2x3sno65so6vglmpavjtyeiqzy6yyzwvx5hqtmi@tsfx2hr7rmqp>
In-Reply-To: <2f2bc3xvemk2x3sno65so6vglmpavjtyeiqzy6yyzwvx5hqtmi@tsfx2hr7rmqp>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 22 Dec 2023 11:12:30 +0100
Message-ID: <CAFBinCCLorBkGmpeUiep6gT7N__2641ec+f=hJyUgVEv1x6EdA@mail.gmail.com>
Subject: Re: [RFC PATCH v1] regulator: pwm-regulator: Fix continuous
 get_voltage for disabled PWM
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: lgirdwood@gmail.com, broonie@kernel.org, linux-pwm@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Thierry Reding <thierry.reding@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Dmitry Rokosov <ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_021244_762004_1FA823B0 
X-CRM114-Status: GOOD (  13.71  )
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

SGVsbG8gVXdlLAoKT24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgODoxMOKAr0FNIFV3ZSBLbGVpbmUt
S8O2bmlnCjx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgpbLi4uXQo+IEFs
c28gdGhlIGNhbGN1bGF0aW9uIGlzIHdyb25nOiBJZiBhIHJlbGF0aXZlIGR1dHktY3lsZSBpbiB0
aGUgaW50ZXJ2YWwKPiBbOTElOyAwJV0gbWFwcyBsaW5lYXJ5IHRvIFs4NjAgbVY7IDExNDAgbVZd
IHlvdSBnZXQgMTEwMCBtViBhdAo+Cj4gICAgICAgICAgICAgIDExMDAgbVYgLSA4NjAgbVYKPiAg
ICAgICAgIDkxICsgLS0tLS0tLS0tLS0tLS0tLSAqICgwIC0gOTEpID0gMTMKPiAgICAgICAgICAg
ICAgMTE0MCBtViAtIDg2MCBtVgo+Cj4gKElmIHRoZSBjYWxjdWxhdGlvbnMgaW4gdGhlIGRyaXZl
ciB1c2VkIHNpZ25lZCBtdWx0aXBsaWNhdGlvbiBhbmQKPiBkaXZpc2lvbiwgYWxsIHRoZSBjaGVj
a3MgZm9yIG1heF91Vl9kdXR5IDwgbWluX3VWX2R1dHkgY291bGQganVzdCBnbwo+IGF3YXkuKQo+
Cj4gU28geW91IHdhbnQKPgo+ICsgICAgICAgICAgICAgICBwd20tZHV0eWN5Y2xlLXJhbmdlID0g
PDEzIDA+OwpUaGFuayB5b3UhCgo+IChpZiB0aGlzIHJlc3RyaWN0aW9uIGlzIHJlYWxseSBuZWNl
c3NhcnkpLgpJIGNvdWxkIG5vdCBmaW5kIGEgd2F5IGFyb3VuZCB0aGlzLgpXaXRob3V0IHRoaXMg
Y2hhbmdlIHB3bV9yZWd1bGF0b3Jfc2V0X3ZvbHRhZ2UoKSBpcyBjYWxsZWQgd2l0aCByZXFfbWlu
Cjg2MG1WIGFuZCByZXFfbWF4IDExNDBtVi4KcHdtX3JlZ3VsYXRvcl9zZXRfdm9sdGFnZSgpIHdp
bGwgdGhlbiBwaWNrIHRoZSBsb3dlc3QgcG9zc2libGUKdm9sdGFnZSwgd2hpY2ggdGhlbiByZXN1
bHRzIGluIDg2MG1WIChleGFjdGx5IHdoYXQgSSBnZXQgd2l0aG91dCBhbnkKcGF0Y2hlcykuCgpU
byBiZSBhYmxlIHRvIGtlZXAgdGhlIG9yaWdpbmFsIG1pbmltdW0gdm9sdGFnZSBpbiAuZHRzIHdv
dWxkIGJlIHRvCndvcmsgb24gd2hhdCBNYXJrIHN1Z2dlc3RlZCB3aGVyZSBoZSBzYWlkOgoiSSdk
IGV4cGVjdCBhIGNoYW5nZSBpbiB0aGUgaW5pdF9zdGF0ZSgpIGZ1bmN0aW9uLCBwb3NzaWJseSBv
bmUgdGhhdApwcm9ncmFtcyB0aGUgUFdNIHRvIHJlZmxlY3QgdGhlIGFjdHVhbCBoYXJkd2FyZSBz
dGF0ZSIKClsuLi5dCj4gPiAtICAgICBpZiAocHN0YXRlLmVuYWJsZWQpCj4gPiAtICAgICAgICAg
ICAgIHZvbHRhZ2UgPSBwd21fZ2V0X3JlbGF0aXZlX2R1dHlfY3ljbGUoJnBzdGF0ZSwgZHV0eV91
bml0KTsKPiA+IC0gICAgIGVsc2UgaWYgKG1heF91Vl9kdXR5IDwgbWluX3VWX2R1dHkpCj4gPiAt
ICAgICAgICAgICAgIHZvbHRhZ2UgPSBtYXhfdVZfZHV0eTsKPiA+IC0gICAgIGVsc2UKPiA+IC0g
ICAgICAgICAgICAgdm9sdGFnZSA9IG1pbl91Vl9kdXR5Owo+ID4gKyAgICAgdm9sdGFnZSA9IHB3
bV9nZXRfcmVsYXRpdmVfZHV0eV9jeWNsZSgmcHN0YXRlLCBkdXR5X3VuaXQpOwo+Cj4gSSdkIGFk
ZCBoZXJlOgo+Cj4gICAgICAgICBpZiAodm9sdGFnZSA8IG1pbihtYXhfdVZfZHV0eSwgbWluX3VW
X2R1dHkpIHx8Cj4gICAgICAgICAgICAgdm9sdGFnZSA+IG1heChtYXhfdVZfZHV0eSwgbWluX3VW
X2R1dHkpKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT1RSRUNPVkVSQUJMRTsKSSBjYW4g
ZG8gdGhhdCAtIGFsdGhvdWdoIEkgdGhpbmsgaXQgc2hvdWxkIGJlIGEgc2VwYXJhdGUgY2hhbmdl
LgoKCkJlc3QgcmVnYXJkcywKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
