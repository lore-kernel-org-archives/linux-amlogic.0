Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3264CD5BCF
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 May 2026 08:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aGSrIGo8sZ/dANi4GRRSGYTEn3RP9l8Kp2mdLu84LY4=; b=AzUwgOg6XHPkue
	8uK6e1wAzCEXko5ZMM/oPEg/n7q3Kf8//TTWnD7dY7X2S6Qew0wtUlN/tjFaqcSy9zodX7p3jPTb7
	kG6m5pGj8t3ot44htpbsfK8dEhOa6lnM+pBAJvB2rh1aqkosI74+PbLsO6XOnJusnbr29yScr1oIf
	4oO0rv2gSH90C6L2dYl3Te28C97GlV4mY8zfCUrtnQhYxcfUVcj/cA3h0Czup3idO59jM5TQgSrq0
	UD340LXWVDHInXJ+sEuiKVLGz1UpWqVLQ7wIImfXPvPQ32ABKwYFCoWCv1spUCMFG+drVZ2AhlImS
	YagUXHH4dL3htfgoSz+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRQlZ-0000000Gfdw-0zZA;
	Mon, 25 May 2026 08:34:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRQlW-0000000Gfcv-1M15
	for linux-amlogic@lists.infradead.org;
	Mon, 25 May 2026 08:34:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 959BD44426
	for <linux-amlogic@lists.infradead.org>; Mon, 25 May 2026 08:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A8521F00A3C
	for <linux-amlogic@lists.infradead.org>; Mon, 25 May 2026 08:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779698065;
	bh=ocdluSnvPrajohiha17GJ29fdKK8Wu3tb+aFtvggHIg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fnSp8BvJfPkA04wxA7mKTPbAve6r/Z636vOY7whORBxplpYMAfV/wkIzs/q3/i2kU
	 WSylGbm5FPI/FIZ80h8rBFkcL7YIWfl2Tvmv4Hn8GME56dJw454mXQsmyz580RiJib
	 gyU/S97sGNd5c/GiPD36dhMtBWOTRXGKlC5f592aABylxp/uZgKFZ7gPRY9Mlfr5w1
	 7Kyiz37jA0NydxK2lw2LEDAySWkh1EwjDUNIwJXUojPX569EN+Wdv6msvBVo4DCfoJ
	 SfjcCp3DkU5Q5/fmn938Q7HVJfEXHnMiXnIP1cAEe5NLoxt0DU81yDyuYOBf/PzOFr
	 /RtWzh9XFxLhA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a40cfab24dso5182979e87.2
        for <linux-amlogic@lists.infradead.org>; Mon, 25 May 2026 01:34:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+iEMv1re71rTqy0Cx38nYct6deQ5darauJzBwDj+YcaxluHrYiESv3AJITiApRNaCG12VQqbtKs8cz1468@lists.infradead.org
X-Gm-Message-State: AOJu0YwDCWOXdIRvXisSMdEbtIeNo2Z1noakM0JBFRlI3o/207JOMK9v
	QAt0jlIc7vsBOn07lRudBqmQlOfD9DMPEDk0mg9MN31J7KO+qZHDzBETpbEGgCBYbuDlrdGAAVU
	yzlScr+U4W7Wl5/tSzXEYUq5XJyFxqew=
X-Received: by 2002:a05:6512:31c4:b0:5a8:7317:5417 with SMTP id
 2adb3069b0e04-5aa32369f4amr3970074e87.9.1779698064269; Mon, 25 May 2026
 01:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260518-fix-set-value-glitch-v1-1-d350732dc934@amlogic.com>
In-Reply-To: <20260518-fix-set-value-glitch-v1-1-d350732dc934@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:34:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLkmm4BbOMZCbJD4H4xfa8nHfExczbXCyF7SapHzQwRZFg@mail.gmail.com>
X-Gm-Features: AVHnY4IyGTi3BnZWsq4c-wualt0vr2BsufA5tdx1c0CYn_gbaKAGwoMKhoJOICc
Message-ID: <CAD++jLkmm4BbOMZCbJD4H4xfa8nHfExczbXCyF7SapHzQwRZFg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: fix gpio output glitch
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_013426_383681_CC5C3102 
X-CRM114-Status: GOOD (  14.18  )
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

T24gTW9uLCBNYXkgMTgsIDIwMjYgYXQgMTA6MjbigK9BTSBYaWFud2VpIFpoYW8gdmlhIEI0IFJl
bGF5CjxkZXZudWxsK3hpYW53ZWkuemhhby5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3cm90ZToK
Cj4gRnJvbTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+Cj4KPiBXaGVu
IHRoZSBzeXN0ZW0gdHJhbnNpdGlvbnMgZnJvbSBib290bG9hZGVyIHRvIGtlcm5lbCwgdGhlIEdQ
SU8gaXMKPiBleHBlY3RlZCB0byBrZWVwIGRyaXZpbmcgaGlnaC4KPgo+IEhvd2V2ZXIsIHRoZSBM
aW51eCBrZXJuZWwgZmlyc3QgY29uZmlndXJlcyB0aGUgcGluIGRpcmVjdGlvbiBhbmQgdGhlbgo+
IHNldHMgdGhlIG91dHB1dCB2YWx1ZS4gVGhpcyBtYXkgY2F1c2UgYSBicmllZiBsb3ctbGV2ZWwg
Z2xpdGNoIG9uIHRoZQo+IEdQSU8gbGluZSwgd2hpY2ggY2FuIGJlIHByb2JsZW1hdGljIGZvciBy
ZWd1bGF0b3IgY29udHJvbC4KPgo+IEJ5IGNvbmZpZ3VyaW5nIHRoZSBvdXRwdXQgdmFsdWUgYmVm
b3JlIHN3aXRjaGluZyB0aGUgcGluIGRpcmVjdGlvbiB0bwo+IG91dHB1dCwgdGhlIGdsaXRjaCBj
YW4gYmUgYXZvaWRlZC4KPgo+IFRoaXMgY29tbWl0IGZpeGVzIHRoZSBpc3N1ZSBieSBzd2FwcGlu
ZyB0aGUgY29uZmlndXJhdGlvbiBvcmRlci4KPgo+IEZpeGVzOiA2ZTliZTNhYmI3OGMgKCJwaW5j
dHJsOiBBZGQgZHJpdmVyIHN1cHBvcnQgZm9yIEFtbG9naWMgU29DcyIpCj4gU2lnbmVkLW9mZi1i
eTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+CgpJcyB0aGlzIGEgcmVn
cmVzc2lvbj8gSS5lLiBkb2VzIGl0IGNhdXNlIHByb2JsZW1zIG9uIGEgc3VwcG9ydGVkCnN5c3Rl
bSB3aXRoIG1haW5saW5lPwoKTGludXMgKHRoZSBiaWcgcGVuZ3VpbikgaXMgdW5oYXBweSB3aXRo
IHRvbyBtYW55IG5vbi1jcml0aWNhbCBmaXhlcwpzbyBJIHdhbm5hIGNoZWNrIHRoaXMgYmVmb3Jl
IHRoaXMgZ29lcyBpbnRvIGZpeGVzLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
