Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C2BC71159
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Jun 2025 18:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x0qx2BwQET+chU6/NmC3D5dVOWZDssAGmB3dAPh0yug=; b=ToPT2MiZtsuqlf
	eJ+znC16Q1QfpBkqSN9JobbKMz4fy16ln+L4mQ7EP49Notv2erAuwDkAa5qnJzi7r+hIKGUIZCGrU
	aNZuWhYgQL7SFheDnXsVvj7u0bxRZFs1Lpn0Jjtlb4kba7AUFBLXLiqoHFM7NdAHqnjbkUGeUIPJT
	I5n33zbQE50BaGLDZkWUna1GDhEjdQWzDPqKJl1NabTrwYu/sNZpihj/O1fIVh5UUYHpYXXpR7t8q
	zsZV4XIQ0wAbqKJueQV6iJADZDubW92PF/ZQmNxp/t+vZse7vXgBC3sVcaJFNEgzcjp+pGKYAUF+k
	7PtAURhxwq79PwApKT5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREaE-00000005Dzx-1Hpa;
	Mon, 16 Jun 2025 18:29:26 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRCge-000000050Fx-3gDG
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Jun 2025 16:27:59 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so3946794f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Jun 2025 09:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750091274; x=1750696074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g//RjhSoXItXHLLuz1FPQ8PBTL6LhGzURl5mDmu1U+s=;
        b=avmBJAYXUVjMU1OoUyImypCoPjwK5UvjF2T1OccAqR8BIZMNCLVyzLgiwaJCAs69fS
         JJhcuUxWq+ocw12qXTwcV6dfupINciQCpUgvYQErP8bRZo1z3WLXTyzN0r92X5aRhzUB
         9Or8IjoEI/FIb+fQNLHIIFzRpMUGLgpPiOKQ4gGXH79gNxVFWRB78vNJQMfL6x4N+PXC
         WyuY/ElQWG9fNOMOLkD0qIevT6rZZWdoycPs6EC5JkGx0p5SQHAoCYZFvcHvWDDVVSQt
         55Frjx/dUEhyijA5KkYA/aBCQFNXu2QR3t2M3qS4jVt1tQcaeuYxVrv/L+sk3tsMIvR2
         IGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750091274; x=1750696074;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g//RjhSoXItXHLLuz1FPQ8PBTL6LhGzURl5mDmu1U+s=;
        b=oGIOWOmFaIWPhXsoov8yiI9XJiPDMsny8NsD5s6iovAUFmCLpg8g2cXKYqvgVHNdAL
         4JqeIWMHY9FpAjgmprUvIX1Babcz5aN3Bdv9wcs8JUdddJrKFGKVvf08OSD+/6Xxi/Fr
         hLb54wa3xMGALUv7HT/dphYnj/7d/+TdGBroMo8bdgjNHXuha2fmi51gT4qf8XvJYy9c
         vXSUL2U2s7VxG3f2/jArurGq/1DcLzCtgLY0u/wuYVgObqE8Pm/WdXHnMmDVh9iSdqk0
         GRrFmCNHO7/OCFDNE3rpVS5s0N78h8taTnTDcDTMJjEJUnUSfgTR+zZOKMYWRbsmffck
         6tJg==
X-Forwarded-Encrypted: i=1; AJvYcCWYgbWFY0jL8O4Q2k/JIfulSSsjeSmPwjgTiuD62W+sV2HjMcSSvqKBYPR3lknEK8Pi/WSjeYUwKJnBTRtw@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ1nV5WR3DJ0cHFObgOiARSBeMEhU/ZJ9b0cPqRJEDNnmzUytB
	7pCORXd+AwtVONxsjFlsh9AwHgt2Dwgak29rffot8St/Wi+ZZIKL5PYE8mYhY3+agu/6FvnF4Xo
	fPonD
X-Gm-Gg: ASbGncuV/K/NfxU5LD4wAJwBZ7KcAzNQdQVZ3kktZL2SXFitdAQsx9azSqcq6TEQ7OI
	Y94RtSyy223OH426iXMzkho5O5gHrX65WZX9u8sW9B7KPvqflLpkeng9fGflYJHNRIfhQGGrQUK
	enVLhJCetknh2cvY38vKgD0R2ammKkmUuKppT+upli2r14HAV9nOoZdrjLYQVfrgCB7M0Lcfzrl
	CdR/qTptBF5SrK9K9ugJwTfauFk3f6OageD8qEKwIQPczKYbNFASDXQ1z0mK7FZxzWlcgHqm3ak
	pKJFUIlq06aaHUPQF4S2xGv5/7DByzxPlxqXtE4acsw77FUaEpgajVr4oVA/pw==
X-Google-Smtp-Source: AGHT+IErBlsaj2oMz4KGG0U/n1iHZhnbyvR7L71f4kcmN+NZni2stWVZL4S2bu1UJwMFwQlCqMCesg==
X-Received: by 2002:a05:6000:240e:b0:3a4:eec8:c9b3 with SMTP id ffacd0b85a97d-3a57237dc17mr8397766f8f.23.1750091274515;
        Mon, 16 Jun 2025 09:27:54 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1866:9357:88b6:f1b2])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b089b5sm11356238f8f.48.2025.06.16.09.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 09:27:53 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>,  Chuan Liu
 <chuan.liu@amlogic.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  Dmitry Rokosov
 <ddrokosov@sberdevices.ru>,  robh+dt <robh+dt@kernel.org>,  Rob Herring
 <robh@kernel.org>,  devicetree <devicetree@vger.kernel.org>,  linux-clk
 <linux-clk@vger.kernel.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 4/6] clk: meson: t7: add support for the T7 SoC PLL
 clock
In-Reply-To: <4dd25114-212d-44d6-938a-63871750c292@amlogic.com> (Jian Hu's
	message of "Thu, 12 Jun 2025 21:02:00 +0800")
References: <20250509074825.1933254-1-jian.hu@amlogic.com>
	<20250509074825.1933254-5-jian.hu@amlogic.com>
	<1jtt5ny6gq.fsf@starbuckisacylon.baylibre.com>
	<4dd25114-212d-44d6-938a-63871750c292@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 16 Jun 2025 18:27:53 +0200
Message-ID: <1jh60fd52u.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_092757_106263_87555F87 
X-CRM114-Status: GOOD (  12.35  )
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

T24gVGh1IDEyIEp1biAyMDI1IGF0IDIxOjAyLCBKaWFuIEh1IDxqaWFuLmh1QGFtbG9naWMuY29t
PiB3cm90ZToKCj4+PiArCj4+PiArc3RhdGljIHN0cnVjdCBjbGtfcmVnbWFwIHQ3X3BjaWVfcGxs
X29kID0gewo+Pj4gKyAgICAgLmRhdGEgPSAmKHN0cnVjdCBjbGtfcmVnbWFwX2Rpdl9kYXRhKXsK
Pj4+ICsgICAgICAgICAgICAgLm9mZnNldCA9IEFOQUNUUkxfUENJRVBMTF9DVFJMMCwKPj4+ICsg
ICAgICAgICAgICAgLnNoaWZ0ID0gMTYsCj4+PiArICAgICAgICAgICAgIC53aWR0aCA9IDUsCj4+
PiArICAgICAgICAgICAgIC5mbGFncyA9IENMS19ESVZJREVSX09ORV9CQVNFRCB8Cj4+PiArICAg
ICAgICAgICAgICAgICAgICAgIENMS19ESVZJREVSX0FMTE9XX1pFUk8sCj4+IFdoYXQncyB0aGUg
YmVoYXZpb3VyIG9mIHRoZSBkaXZpZGVyIG9uIHplcm8gdGhlbiA/Cj4KPgo+IElmIHRoZXJlIGlz
IG5vIENMS19ESVZERVJfQUxMT1dfWkVSTywgdGhlcmUgaXMgYSB3YXJuaW5nIHdoZW4gcmVnaXN0
ZXJpbmcKPiB0N19wY2llX3BsbF9vZC4KPgo+IGxpa2UgdGhpczoKPgo+IMKgIC0tLS0tLS0tLS0t
LVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQo+IMKgIFdBUk5JTkc6IENQVTogMSBQSUQ6IDEgYXQg
ZHJpdmVycy9jbGsvY2xrLWRpdmlkZXIuYzoxNDAKPiBkaXZpZGVyX3JlY2FsY19yYXRlKzB4ZmMv
MHgxMDAKPiDCoCBwY2llX3BsbF9vZDogWmVybyBkaXZpc29yIGFuZCBDTEtfRElWSURFUl9BTExP
V19aRVJPIG5vdCBzZXQKPiDCoCBNb2R1bGVzIGxpbmtlZCBpbjoKPiDCoENQVTogMSBQSUQ6IDEg
Q29tbTogc3dhcHBlci8wIE5vdCB0YWludGVkCj4gNS40LjI4My0wOTk3Ni1nYTgwM2U5NGVlZDg4
LWRpcnR5ICM5MQo+IMKgIEhhcmR3YXJlIG5hbWU6IHRtMl90OTYyZTJfYWIzMTEgKERUKQo+IMKg
Q2FsbCB0cmFjZToKPiDCoCBbZmZmZmZmYzAyMDAwMzc1MCvCoCA2NF1bPGZmZmZmZmMwMTAwZTNl
M2M+XSBkdW1wX2JhY2t0cmFjZSsweDAvMHgxZTQKPiDCoCBbZmZmZmZmYzAyMDAwMzc5MCvCoCAz
Ml1bPGZmZmZmZmMwMTAwZTQwNDQ+XSBzaG93X3N0YWNrKzB4MjQvMHgzNAo+IMKgIFtmZmZmZmZj
MDIwMDAzN2IwK8KgIDk2XVs8ZmZmZmZmYzAxMTMwYTJlOD5dIGR1bXBfc3RhY2srMHhiYy8weDEw
OAo+IMKgW2ZmZmZmZmMwMjAwMDM4MTArIDE0NF1bPGZmZmZmZmMwMTAxMGM0ODQ+XSBfX3dhcm4r
MHhmNC8weDFiOAo+IMKgIFtmZmZmZmZjMDIwMDAzOGEwK8KgIDY0XVs8ZmZmZmZmYzAxMDEwYzVm
ND5dIHdhcm5fc2xvd3BhdGhfZm10KzB4YWMvMHhjOAo+IMKgW2ZmZmZmZmMwMjAwMDM4ZTArwqAg
NjRdWzxmZmZmZmZjMDEwNjFkMzY0Pl0gZGl2aWRlcl9yZWNhbGNfcmF0ZSsweGZjLzB4MTAwCj4g
wqBbZmZmZmZmYzAyMDAwMzkyMCvCoCA4MF1bPGZmZmZmZmMwMTA2MjRlODQ+XQo+IGNsa19yZWdt
YXBfZGl2X3JlY2FsY19yYXRlKzB4NzQvMHg4OAo+IMKgIFtmZmZmZmZjMDIwMDAzOTcwK8KgIDk2
XVs8ZmZmZmZmYzAxMDYxNmE1ND5dIF9fY2xrX3JlZ2lzdGVyKzB4NjJjLzB4Yjc4Cj4KPiBzbyBh
ZGQgaXQgdG8gYXZvaWQgdGhlIHdhcm5pbmcuCgpUaGF0IGRvZXMgbm90IHJlYWxseSBhbnN3ZXIg
bXkgcXVlc3Rpb24KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
