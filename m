Return-Path: <SRS0=wFsb=UL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99912C31E46
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 19:47:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67BB620866
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 19:47:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bYcuBrHa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="jCItuHIq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67BB620866
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iRGznDyJdKbCKMyIbhcWc4FkrPDzhPI0FUdj/HKRPxc=; b=bYcuBrHaZc974U
	tD9lKqU5mww9T3CZj++GEaERPdInzxtl4xWMN9xcRTcPfcxFSw3H+L6+4AGR4oehXJrPU+3XVLZ/h
	IqdiWiNQD7zizMgaCMnSNrv5CVbQ1JthGpYMsnGneiM1ya8/vfycDAL5hsKYUaWU8Lg43axYjG2mx
	nDJylXPCEnNJ4IsdawGfh6vbjiPRuh9WRCXwSGvAVjXHBN5Y3knV2pubNJKGEs4TMj7NDeDSHG0yo
	2/cooJeRCPbeO+ddKinK37pPN/J2t2ayC12RvCx41F2Eaam/pswGJyACh2tjOSGYQADE5XFzZEQiM
	aXal5imkM2wZVrW/L8cQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hb9DP-0001zR-Rv; Wed, 12 Jun 2019 19:47:23 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb9DM-0001ya-Bf; Wed, 12 Jun 2019 19:47:21 +0000
Received: by mail-oi1-x244.google.com with SMTP id e189so12591517oib.11;
 Wed, 12 Jun 2019 12:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EwdJu4okQ0L+2u52FXeBDXEGzF/ps8ei03aC+UR7txM=;
 b=jCItuHIqjcFP/izwsSFnf5iZ4EN8OEZMF4/+XoTAcFGTIvjn8FEFSDtrZZEXarIJht
 XFvZdFpsTYx2UKP8PreoZMEQCIurJCAtxHYRQnD1cDiUz4rMk9IZ5jwLjsMkH6YwbfV8
 JK7juYY/NCn4SQ+bolXDhhhULZdOmNaiTFX6lctDPTgbJ6gXu4x0ppbCc25UIyEGVQtp
 oUF9u4OeEsxLsGYmWkYR/KK1cMA1rXxJ0a5UKjCDFAyN28VcUBpUKp09Cc2KrkGEUmwm
 uhHb8XCubFuUi3Xf0TqPGnVSzGzpC6kjENt0cAfNwGqVy32ibiYbhHmkyb1DMkDKOBAr
 C6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EwdJu4okQ0L+2u52FXeBDXEGzF/ps8ei03aC+UR7txM=;
 b=taJvDTFfvKRbtzEFunRDesywXcVcmmlcyPkNbc1FIt5BWl2CyfBbaP92I8ANf44Ofn
 RG6OduFnu3ZnlMTmX3rYAbWTuDW595lP6SU6D8jjalgwf14nyIB+l3wWraZLlKGW5b9z
 vwwePG/dGwQj4ZqTvfenhC0jU+XqEsvwzjLFv18crQnHn9hiVLeJVY55QGD7jJ3fVNzl
 5N1bjuanZ4fpvaxDuRJAslzvd7Q58QaBDNiJXv+K19rdM+dBwpde2QpOOrjOnmsRC2Bv
 TBkV7BqW4wkrhqYhQDSMbQM+1cFppZijtBeSPJ4qIt71x9WR5cyvWW3czZWQXfg/7V5P
 SzKw==
X-Gm-Message-State: APjAAAVGTrvqzQZmDiOE4qY/TtjIXOzlIBpFgU6Xem8sNe+02tCbcM+p
 ZMfEK1MM86av+SkQwYCFfG0GI7QkmJrwOxkoyyz1o6Rb
X-Google-Smtp-Source: APXvYqxI6uMKFy/wojvtvvvIYK/SGmxdGD9fTWk5+T6YyUI+oS3PdPTdR1rtH6s0f//6So6WdhsACfIUlxQ2vDXFdDk=
X-Received: by 2002:aca:f144:: with SMTP id p65mr598979oih.47.1560368838921;
 Wed, 12 Jun 2019 12:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190608180626.30589-1-martin.blumenstingl@googlemail.com>
 <20190608180626.30589-5-martin.blumenstingl@googlemail.com>
 <20190611163318.tfb5c4jbekjybj76@pengutronix.de>
In-Reply-To: <20190611163318.tfb5c4jbekjybj76@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 12 Jun 2019 21:47:07 +0200
Message-ID: <CAFBinCA1SVXVPJdLQr4S99qEoowqXsNqP5tr64xn46xjaKLqeA@mail.gmail.com>
Subject: Re: [PATCH v2 04/14] pwm: meson: change MISC_CLK_SEL_WIDTH to
 MISC_CLK_SEL_MASK
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190612_124720_420889_65223860 
X-CRM114-Status: GOOD (  12.38  )
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
Cc: linux-pwm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgVXdlLAoKT24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgNjozMyBQTSBVd2UgS2xlaW5lLUvDtm5p
Zwo8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKWy4uLl0KPiA+IEBAIC00
NjMsNyArNDYzLDcgQEAgc3RhdGljIGludCBtZXNvbl9wd21faW5pdF9jaGFubmVscyhzdHJ1Y3Qg
bWVzb25fcHdtICptZXNvbiwKPiA+Cj4gPiAgICAgICAgICAgICAgIGNoYW5uZWwtPm11eC5yZWcg
PSBtZXNvbi0+YmFzZSArIFJFR19NSVNDX0FCOwo+ID4gICAgICAgICAgICAgICBjaGFubmVsLT5t
dXguc2hpZnQgPSBtdXhfcmVnX3NoaWZ0c1tpXTsKPiA+IC0gICAgICAgICAgICAgY2hhbm5lbC0+
bXV4Lm1hc2sgPSBCSVQoTUlTQ19DTEtfU0VMX1dJRFRIKSAtIDE7Cj4gPiArICAgICAgICAgICAg
IGNoYW5uZWwtPm11eC5tYXNrID0gTUlTQ19DTEtfU0VMX01BU0s7Cj4gPiAgICAgICAgICAgICAg
IGNoYW5uZWwtPm11eC5mbGFncyA9IDA7Cj4gPiAgICAgICAgICAgICAgIGNoYW5uZWwtPm11eC5s
b2NrID0gJm1lc29uLT5sb2NrOwo+ID4gICAgICAgICAgICAgICBjaGFubmVsLT5tdXgudGFibGUg
PSBOVUxMOwo+Cj4gSU1ITyBjbGtfbXV4IGlzIHVnbHkgaGVyZS4gSXQgY291bGQgZWFzaWx5IGp1
c3QgdGFrZQo+Cj4gICAgICAgICAubWFzayA9IDMgPDwgbXV4X3JlZ19zaGlmdHNbaV0sCmluIG1v
c3QgY2FzZXMgdGhhdCB3b3VsZCBiZSBldmVuIG5pY2VyIHRvIHJlYWQgYmVjYXVzZSBpdCBjb3Vs
ZCBiZSBleHByZXNzZWQgYXM6CiAgLm1hc2sgPSBHRU5NQVNLKDUsIDQpCgpzbyBJIGxpa2UgeW91
ciBpZGVhIGluIGdlbmVyYWwKdGhvdWdoIEkgdGhpbmsgaXQgc2hvdWxkIG5vdCBibG9jayB0aGlz
IHBhdGNoCgpbLi4uXQo+IEFwYXJ0IGZyb20gdGhhdCwgSSB3b25kZXIgaWYgdGhlIHB3bS1tZXNv
biBkcml2ZXIgc2hvdWxkIGJldHRlciB1c2UKPiBjbGtfcmVnaXN0ZXJfbXV4IGluc3RlYWQgb2Yg
b3BlbiBjb2RpbmcgaXQuIChUaG91Z2ggdGhlcmUgZG9lc24ndCBzZWVtCj4gdG8gZXhpc3RzIGEg
ZGV2bV8gdmFyaWFudCBvZiBpdC4pCkkgdHJpZWQgdG8gdXNlIGNsa19yZWdpc3Rlcl9tdXggaW4g
dGhlIHBhc3QuIGl0IHdvcmtzIGJ1dCBpdCdzIG5vdCBhcwpuaWNlIHRvIHJlYWQgYXMgdGhlIG9w
ZW4tY29kZWQgdmFyaWFudCBiZWNhdXNlIGl0IHRha2VzIDEwIHBhcmFtZXRlcnMuCkkgZmluZCBp
dCBlYXNpZXIgdG8gcmVhZCAxMyBzZXBhcmF0ZSBsaW5lcyBjb21wYXJlZCB0byByZWFkaW5nIGEK
ZnVuY3Rpb24gY2FsbCB3aXRoIDEwIHBhcmFtZXRlcnMKCgpNYXJ0aW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
