Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16A7C6FD18
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Apr 2023 17:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dveu7/hAXtOFlG829kHXTCj3WyLmp9pQX4Zgr+uCh9k=; b=AYUGuVOgopgHUq
	gckbsNwX5RCZ4bzv3mTvkEZSNM6JlBInXHujoroMQoaIi4Wi34QQitXnerxutq1LGsfqaV5lDoDRO
	x8K58nFpyplkEBZgbUQ9dsnvAA/4FGQ9u49SMGr7YG+6Vk84QlOn55y/NIVr6pPaSfsvydIItK20B
	oYzkuEXO7YKauE85O2TfZyK4sOjLdDMA/X3HQTuTVebmAiVJeTEBcIVR+FcgKJ44boc2+7/rOvb9P
	aMWUjNFBq4WlKfSm2guJdZnFkLinGyQobvI1QgRsaBQpLlPtzJKngyhtn6He7vlovTxhmjBupUNG/
	uZgpxlnSag2osHTxMcrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqdsK-00EbNS-2o;
	Sun, 23 Apr 2023 17:51:48 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqdsG-00EbMT-2O;
	Sun, 23 Apr 2023 17:51:45 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-506bdf29712so26744771a12.0;
        Sun, 23 Apr 2023 10:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1682272302; x=1684864302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OA0ppbVgL5FeMNHPio5HwgD93aIrdhW8q22dK3Sz1m8=;
        b=ZVd9skx5EC78EZ/AC/SRBNS4+B9YWd9oI4M0XgTPfk1aTDz+EcXCxgtvSRsgLwZE0g
         RbGv4QfbletmBUdzVzTYzs7DFphjS6D4nSWWoXu+bzIIl2AFTpm1W7M4NKaxBZ7MBFOU
         alOpH++YX2Rf/T8fKxya9VwiLUyD/whXd3+Q7ke3Vln1sYJCq9Ro83iUsUKMj66x+LYk
         ilAt0mg9ZSTZVWfBw6vL5WM7/ODG+Eaib6Mv9Ju9IyJsHCXaNyEpTMZ7QirpZ1VQNvqb
         q9hZDglC8rBr47BOYsF4oEuGrwOeegcY0CVa57kTZixVIw2Uf0UR1r4m6sriIKQXGS2x
         X/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682272302; x=1684864302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OA0ppbVgL5FeMNHPio5HwgD93aIrdhW8q22dK3Sz1m8=;
        b=AAfZjrZibmQotZvdPVADWSRr9wgIAjagNdMG0Qe3k7Z2Ikds0J+Xp8SGq8+uegJPhm
         2w7isLilanVOnSxQxwr9FX9CoDiivCS/lbfVH5DEtZbPNyIIAX2yF3yBvgzJg5C10xlE
         wKqWDBZ1JLbtnSwg7Zn8mQuu1d+6RZuPuhqk+0M0YXzOMZMTcRaf2961hjQZzaLEZ1fg
         t94OETctdj9dCCBX7/eUARq8AyibAk/L4nS0WZmhVh6eiWh4pfIhBlk+WjolbW/9LZKL
         M4gIbpKkN0QlZUxZoYl/cNwQOoX108w5kIcyYS0ZgH2mzbI3KHR8klS6tBlOq/q7YJWf
         OU2w==
X-Gm-Message-State: AAQBX9ddCojfs3Qj6TrCggW8ncgBbsgpu/VvPzThLplnKBn5HuWXGnyL
	d0Td06odo2iCLEoVGdIUd4lBgW5/GGowxStnmwo=
X-Google-Smtp-Source: AKy350buw6nrgnBr18y3RmSiYBmXWUb6v+A+eUdQ7uLO+M2UVAlnBUQR6+EkfMNJsCXYdFUMbla70TBWYcZhFUkUvRU=
X-Received: by 2002:a17:906:a44f:b0:957:28ed:aeb5 with SMTP id
 cb15-20020a170906a44f00b0095728edaeb5mr7755510ejb.9.1682272301997; Sun, 23
 Apr 2023 10:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230418111612.19479-1-ddrokosov@sberdevices.ru> <20230418111612.19479-6-ddrokosov@sberdevices.ru>
In-Reply-To: <20230418111612.19479-6-ddrokosov@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 23 Apr 2023 19:51:31 +0200
Message-ID: <CAFBinCDvyweC-m=nKw+FZFYvASDE2x3e-Vt=JkSzBifu87cnNw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: meson: a1: support USB controller in
 OTG mode
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, mturquette@baylibre.com, 
	vkoul@kernel.org, kishon@kernel.org, hminas@synopsys.com, 
	Thinh.Nguyen@synopsys.com, yue.wang@amlogic.com, hanjie.lin@amlogic.com, 
	kernel@sberdevices.ru, rockosov@gmail.com, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-phy@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_105144_802491_B069090E 
X-CRM114-Status: UNSURE (   7.93  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCBBcHIgMTgsIDIwMjMgYXQgMToxNuKAr1BNIERtaXRyeSBSb2tvc292IDxkZHJva29z
b3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgpbLi4uXQo+ICsgICAgICAgICAgICAgICAgICAgICAg
IHVzYjJfcGh5MTogcGh5QDQwMDAgewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Y29tcGF0aWJsZSA9ICJhbWxvZ2ljLGExLXVzYjItcGh5IjsKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNsb2NrcyA9IDwmY2xrYyBDTEtJRF9VU0JfUEhZX0lOPjsKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gInh0YWwiOwpPdXQgb2YgY3Vy
aW9zaXR5IHNpbmNlIHRoZXJlJ3MgYWxzbyBhIENMS0lEX1VTQl9QSFkgY2xvY2sgKHdoaWNoIGlz
CnVzZWQgZm9yIHRoZSBkd2MzIGNvbnRyb2xsZXIgYmVsb3cpOgpEbyB3ZSBrbm93IHRoYXQgdGhp
cyBwYXJ0IG9mIHRoZSBjbG9jayBoaWVyYXJjaHkgaXMgY29ycmVjdD8gSSBoYXZlIG5vCndheSB0
byBjaGVjayB0aGlzIG15c2VsZiwgc28gSSdtIGN1cmlvdXMgaWYgeW91IGNvdWxkIHZlcmlmeSB0
aGlzCnNvbWVob3cuCgpbLi4uXQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGR3YzI6IHVzYkBm
ZjUwMDAwMCB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0g
ImFtbG9naWMsbWVzb24tYTEtdXNiIiwgInNucHMsZHdjMiI7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4ZmY1MDAwMDAgMHgwIDB4NDAwMDA+Owo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDg5IElSUV9U
WVBFX0xFVkVMX0hJR0g+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGh5cyA9
IDwmdXNiMl9waHkxPjsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBoeS1uYW1l
cyA9ICJ1c2IyX3BoeSI7CkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZHdj
Mi55YW1sIG9ubHkgYWxsb3dzIGEKInVzYjItcGh5IiAoZGFzaCBpbnN0ZWFkIG9mIHVuZGVyc2Nv
cmUpLgoKWy4uLl0KPiArICAgICAgICAgICAgICAgICAgICAgICBkd2MzOiB1c2JAZmY0MDAwMDAg
ewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzbnBzLGR3
YzMiOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MCAweGZmNDAw
MDAwIDB4MCAweDEwMDAwMD47Ck5vdGUgdG8gc2VsZjogaW50ZXJlc3RpbmcgdGhhdCBBbWxvZ2lj
IHN3YXBwZWQgdGhlIHJlZ2lzdGVyIGxvY2F0aW9uCm9mIHRoZSBkd2MyIGFuZCBkd2MzIGNvbnRy
b2xsZXJzIHNpbmNlIHRoZSBHMTIgZ2VuZXJhdGlvbi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
