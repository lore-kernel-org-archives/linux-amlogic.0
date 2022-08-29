Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9088ECAAD4
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Aug 2022 09:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:To:From:References:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0lAlkhEkYc4PXjDKZUuUfKyuwylPV63irL9vA+gDSCk=; b=1cNt15EFJZIl51
	sOW5z/EAxXbXesmwMgH0THnt9gX5VNfHpO93dH74bJQDe2Io0SVixyyCLC/GwGuwxnegQBT/6Fiw4
	XbWrI8gQlVhwQvqoGCEuOi0kRozdLlQILFX0hcM6lnqjlCBxebPHE13wynWVOYAz8t9ym3kdzeus8
	4HQqCe8MHxFA+ToZCy/jdgluFf41Eh3RqCtuQJtmWDXy6U2tVJD38mKzPf/vRNzEAw/fxXpVFKxiT
	MfDrwN26OXtbkZE4LRAiDfonjkbszhSfttFW8+XoJRxCCIvWS0kw6dPofMHFrF/nPpbhbfyLxoXQh
	sEYcRz0cRiM2pD7kt0TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSbRK-006yGR-6i; Mon, 29 Aug 2022 09:52:18 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSbQT-006xZ4-Rl
	for linux-amlogic@lists.infradead.org; Mon, 29 Aug 2022 09:51:27 +0000
Received: by mail-wm1-x329.google.com with SMTP id k17so3982207wmr.2
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Aug 2022 02:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:to:from:user-agent:references:from:to:cc;
        bh=tOx2tqybefFHeIMLUW+su+XgGbavJfHYGjEPqAfEtak=;
        b=RYKk0fDG8yPKxONFHoSpdDlNNVRBa8zF+ikdW+hDUIfh+D0dOUIanORctEiBjEypK8
         gPTFoc9XdwBgOrXm1/IDyKsi/bdf+i8ThBebydsCJYVUngxxDUhhxQqFL9Yw5WqHE2Qr
         VihDTL9zqrh2gbyVAic3nQ6VJY4525qfn+LE4e6Ffrok2xQ2wV0T6zykyENEKPcM3ZHB
         tB4CYIkfgpRkfI8DIK4bHFVtI3oXP1A2ietFu9qDfyfw0S/owqfBFzXp9VfVxC9OBHS6
         uX1KZG/3Ip8xcIoNrjSjnEmYP+Jgoh6GMpnh+/nj1MsXIrCUy0b0hNTUrOPtoAIwyzBb
         jb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:to:from:user-agent:references:x-gm-message-state:from:to:cc;
        bh=tOx2tqybefFHeIMLUW+su+XgGbavJfHYGjEPqAfEtak=;
        b=2b63H0IxViQ9wau958ZlHw2WTPKqUvLQaxWG4MGDHWo0l+wmpa08bUcBrL5mXwFS6x
         rUbEXKRnur6VHn0YL5h1vn0GgB4O+uLxowiCs/0j/uOkYlhNY0Pvxcc3ur+sM8V8xYY7
         LWHYuhkoFBM54qCqfm1q0UAepocMphTKucIXvQr5cpnobSCiu91pAphAd3NajpkxpIXV
         i5mdC+MZurm9nm+p6Cd8xLS891btU6MxwgP15mZlS8WqhZsk0gcMdUTiBa4tiAsjoUkE
         uPcLj4DRCYFfji47iZea2tURphXAS28oteyol4xKdj0aozY5dmjMq/x9ZZLVSdU0P1gv
         WMpA==
X-Gm-Message-State: ACgBeo1FOL9YV50S1WMwO9sKhBjk43F4Vk24fv3r56GOtslc/fne2bf/
	rF9tpzjKPaDQokil/FYXrM2wbA==
X-Google-Smtp-Source: AA6agR64cwUPnhx/Tf1ejw/jlZS5h7uLh23KiCPqziDo8ptC4sx4Y1k3FIdRq0G7ItXcWgl0sii7YQ==
X-Received: by 2002:a05:600c:1e1c:b0:3a5:b668:4e2 with SMTP id ay28-20020a05600c1e1c00b003a5b66804e2mr6401869wmb.112.1661766683496;
        Mon, 29 Aug 2022 02:51:23 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id e15-20020adffc4f000000b0021e51c039c5sm6498175wrs.80.2022.08.29.02.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 02:51:23 -0700 (PDT)
References: <20220805085716.5635-1-yu.tu@amlogic.com>
 <20220805085716.5635-4-yu.tu@amlogic.com>
 <1jiln0yzgj.fsf@starbuckisacylon.baylibre.com>
 <ed4038fb-c230-fc27-800c-c99bd1770a1c@amlogic.com>
 <4e3cdd6b-5861-8a4f-1df7-af763f77bad5@amlogic.com>
User-agent: mu4e 1.8.7; emacs 28.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen  Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH V3 3/6] clk: meson: S4: add support for Amlogic S4 SoC
 PLL clock driver
Date: Mon, 29 Aug 2022 11:48:21 +0200
In-reply-to: <4e3cdd6b-5861-8a4f-1df7-af763f77bad5@amlogic.com>
Message-ID: <1jsflftm1y.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_025126_034052_E45C6B83 
X-CRM114-Status: GOOD (  10.91  )
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

DQpPbiBNb24gMTUgQXVnIDIwMjIgYXQgMjE6MjAsIFl1IFR1IDx5dS50dUBhbWxvZ2ljLmNvbT4g
d3JvdGU6DQoNCj4+Pj4gKw0KPj4+PiArc3RhdGljIHN0cnVjdCBjbGtfcmVnbWFwIHM0X2hkbWlf
cGxsX2RjbyA9IHsNCj4+Pj4gK8KgwqDCoCAuZGF0YSA9ICYoc3RydWN0IG1lc29uX2Nsa19wbGxf
ZGF0YSl7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCAuZW4gPSB7DQo+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC5yZWdfb2ZmID0gQU5BQ1RSTF9IRE1JUExMX0NUUkwwLA0KPj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAuc2hpZnTCoMKgID0gMjgsDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC53aWR0aMKgwqAgPSAxLA0KPj4+PiArwqDCoMKgwqDCoMKgwqAgfSwNCj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIC5tID0gew0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAucmVnX29m
ZiA9IEFOQUNUUkxfSERNSVBMTF9DVFJMMCwNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LnNoaWZ0wqDCoCA9IDAsDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC53aWR0aMKgwqAg
PSA4LA0KPj4+PiArwqDCoMKgwqDCoMKgwqAgfSwNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIC5uID0g
ew0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAucmVnX29mZiA9IEFOQUNUUkxfSERNSVBM
TF9DVFJMMCwNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnNoaWZ0wqDCoCA9IDEwLA0K
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAud2lkdGjCoMKgID0gNSwNCj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIH0sDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCAuZnJhYyA9IHsNCj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLnJlZ19vZmYgPSBBTkFDVFJMX0hETUlQTExfQ1RSTDEsDQo+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5zaGlmdMKgwqAgPSAwLA0KPj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAud2lkdGjCoMKgID0gMTcsDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCB9LA0K
Pj4+PiArwqDCoMKgwqDCoMKgwqAgLmwgPSB7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC5yZWdfb2ZmID0gQU5BQ1RSTF9IRE1JUExMX0NUUkwwLA0KPj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAuc2hpZnTCoMKgID0gMzEsDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC53
aWR0aMKgwqAgPSAxLA0KPj4+PiArwqDCoMKgwqDCoMKgwqAgfSwNCj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIC5yc3QgPSB7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5yZWdfb2ZmID0gQU5B
Q1RSTF9IRE1JUExMX0NUUkwwLA0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuc2hpZnTC
oMKgID0gMjksDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC53aWR0aMKgwqAgPSAxLA0K
Pj4+PiArwqDCoMKgwqDCoMKgwqAgfSwNCj4+Pj4gK8KgwqDCoCB9LA0KPj4+PiArwqDCoMKgIC5o
dy5pbml0ID0gJihzdHJ1Y3QgY2xrX2luaXRfZGF0YSl7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCAu
bmFtZSA9ICJoZG1pX3BsbF9kY28iLA0KPj4+PiArwqDCoMKgwqDCoMKgwqAgLm9wcyA9ICZtZXNv
bl9jbGtfcGxsX3JvX29wcywNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIC5wYXJlbnRfZGF0YSA9IChj
b25zdCBzdHJ1Y3QgY2xrX3BhcmVudF9kYXRhIFtdKSB7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHsgLmZ3X25hbWUgPSAieHRhbCIsIH0NCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIH0sDQo+
Pj4+ICvCoMKgwqDCoMKgwqDCoCAubnVtX3BhcmVudHMgPSAxLA0KPj4+PiArwqDCoMKgwqDCoMKg
wqAgLyoNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBEaXNwbGF5IGRpcmVjdGx5IGhhbmRsZSBo
ZG1pIHBsbCByZWdpc3RlcnMgQVRNLCB3ZSBuZWVkDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgICog
Tk9DQUNIRSB0byBrZWVwIG91ciB2aWV3IG9mIHRoZSBjbG9jayBhcyBhY2N1cmF0ZSBhcw0KPj4+
PiArwqDCoMKgwqDCoMKgwqDCoCAqIHBvc3NpYmxlDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgICov
DQo+Pj4NCj4+PiBJcyBpdCByZWFsbHkgPw0KPj4+DQo+Pj4gR2l2ZW4gdGhhdCBIRE1JIHN1cHBv
cnQgZm9yIHRoZSBzNCBpcyB0aGVyZSB5ZXQsIHRoZQ0KPj4+IGFkZHJlc3NlcyBoYXZlIGNoYW5n
ZXMgYW5kIHRoZSByZWdpb24gaXMgbm8gbG9uZ2VyIGEgc3lzY29uLCBpdCBpcyB0aW1lDQo+Pj4g
Zm9yIHRoZSBIRE1JIGRyaXZlciB0byBnZXQgZml4ZWQuDQo+IFRoZSBIRE1JIFBMTCBpcyBjb25m
aWd1cmVkIGluIHRoZSBVYm9vdCBwaGFzZSBhbmQgZG9lcyBub3QgY2hhbmdlIHRoZQ0KPiBmcmVx
dWVuY3kgaW4gdGhlIGtlcm5lbCBwaGFzZS4gU28gd2UgdXNlIHRoZSBOT0NBQ0hFIGZsYWcgYW5k
DQo+ICJyb19vcHMiLg0KDQpUaGF0J3Mgbm8gcmVhc29uIHRvIHB1dCBOT0NBQ0hFIG9yIHJvLW9w
cw0KDQpJZiB5b3Ugd2FudCB0aGUgZnJlcXVlbmNpZXMgdG8gYmUgc3RhdGljYWxseSBhc3Npbmdl
ZCwgdGhlIGNvcnJlY3Qgd2F5DQp3b3VsZCBiZSB0aHJvdWdoIGFzc2lnbmVkLXJhdGUgaW4gRFQg
SSBndWVzcy4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
