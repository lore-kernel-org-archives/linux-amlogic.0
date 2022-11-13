Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF96C4332F
	for <linux-amlogic@archiver.kernel.org>; Sun, 13 Nov 2022 19:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=McM+d4OzTpLPiqsHlrb3+zTAeEndpD5kvZz6Wu3bykI=; b=wuV+XIwrQhcZZU
	I+onk9Rkrmkt2e3QcUpl75MWKb63TInIuY1WrtdKl+Ah2BNpb4rzlBVi7dRkz7qJYfzk28uhB8jlb
	pZEHJeKMCPAGcrtvXoqOWdqDwMVYUMNIw9NiEfyXtwRApvqZmtDhhxR82nN6TDyfwugxGUnoNn16Z
	MqJLNCBBK96ssB6XcY9mqlIZK0r/8nygd44F6hf+UkIzI+Oz7y/UDSZ/lSWESY9/BuMInNLudFYBE
	FtYua9NK/pEenglz+fEcBDj6kscY1HM/Zf4Q2c6bhr4JVzvT2Q/EyovogYC1SQ+jkFPvq5IDWb4Kh
	Q7+Elz9BhUYvJEwarcAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouIyV-00DQ2p-CR; Sun, 13 Nov 2022 19:49:03 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouIyK-00DPwt-0w
	for linux-amlogic@lists.infradead.org; Sun, 13 Nov 2022 19:48:54 +0000
Received: by mail-wr1-x431.google.com with SMTP id cl5so13881775wrb.9
        for <linux-amlogic@lists.infradead.org>; Sun, 13 Nov 2022 11:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urtGGp5NSKnCzuNmXw8f0REx4oVfO4cm/5CFl8huK7k=;
        b=sWuR3DluAzhLY0r9rRBiXIRKVARJIxWuX97LL6z/Ma201raTGFXLhGiIP0psImJorI
         XxoyyaOV8UY43efNeYjhkp4/X5fGpy4cwnOcXRE6sFKwmoM1Yuh9+VxypmIdr49F2tKo
         G/Y7ACZnLx+Z4pP3xlA+u831eXwruRHaXZuOh1F71TM3dzbPmMnPV5HmXVDkzDIqeQKT
         879Ku/ITAv0dMn3lGDMtuBwuWNrOmpWtICdaUVTU2TxBZhjwyw2FATwPmBhxbsLufUub
         oxoIhjbVJVMO/i+0bmDeG1DfELuVYfaO6lb8ytasFXDXyExfTSLLE9urigJ4Ve8rVADP
         258w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=urtGGp5NSKnCzuNmXw8f0REx4oVfO4cm/5CFl8huK7k=;
        b=rxKHC6T7m8ogFh1rpXUjaDrH4003F7L3ElJ5RlAF7KKD09HBbk+puMEQIdUMd1DH/i
         QJY3AM/v0jutIOjK0QcrvjxZDPX/QJmKoNZXLER2gFOaONgKKlU0xWpacEGseNU/Hw3p
         IWyqJ5K9pg8uIRPyzNlJs7Fo2lLK85cyqtkBroLWmPItUcv2J0zWhyodMeZrAerlO4vT
         X4Ly8ddATlnndR+KSKmBdBcOPNOKp692o8v07/oZzQfmFnPwh7rYIpl8Y8YpMuXnN5M5
         w1lh2ACpjX/If55lOjB8LKowu7X+LWG+Ehfrq3tVy/9llG2BbJa2RldxB11Ol3FXEY7s
         EqbQ==
X-Gm-Message-State: ANoB5pntuUdrsglLt8YOqGbZrEP7J0tGXZT0Bplf6bJ6aPOf6wwtucsD
	taTIL1EJ9Bainvfd6Y4sjn6Yzg==
X-Google-Smtp-Source: AA0mqf7dHWm0nu9EyIOQEhW9pElK5EQKu08wMF+XsqBePbB1wQDev5K2ghiHPElC7l0zOJX+GLyD3w==
X-Received: by 2002:adf:fc8f:0:b0:22e:362e:570a with SMTP id g15-20020adffc8f000000b0022e362e570amr5538648wrr.127.1668368929033;
        Sun, 13 Nov 2022 11:48:49 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id m10-20020a5d56ca000000b00241736714c3sm6588801wrw.14.2022.11.13.11.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 11:48:48 -0800 (PST)
References: <12dd5cb49efa7714f8e0389e4c7b3bc829e8a90e.1668289299.git.christophe.jaillet@wanadoo.fr>
 <3166437.e9J7NaK4W3@diego>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] clk: Remove a useless include
Date: Sun, 13 Nov 2022 20:29:43 +0100
In-reply-to: <3166437.e9J7NaK4W3@diego>
Message-ID: <1jo7ta3aao.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221113_114852_078523_398B793C 
X-CRM114-Status: GOOD (  11.98  )
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

Ck9uIFN1biAxMyBOb3YgMjAyMiBhdCAwOTo0OCwgSGVpa28gU3TDvGJuZXIgPGhlaWtvQHNudGVj
aC5kZT4gd3JvdGU6Cgo+IEFtIFNhbXN0YWcsIDEyLiBOb3ZlbWJlciAyMDIyLCAyMjo0MzowMyBD
RVQgc2NocmllYiBDaHJpc3RvcGhlIEpBSUxMRVQ6Cj4+IDxsaW51eC9yYXRpb25hbC5oPiBpcyBu
b3QgbmVlZGVkIGZvciB0aGVzZSBkcml2ZXJzLiBSZW1vdmUgdGhlCj4+IGNvcnJlc3BvbmRpbmcg
I2luY2x1ZGUuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIEpBSUxMRVQgPGNocmlz
dG9waGUuamFpbGxldEB3YW5hZG9vLmZyPgo+PiAtLS0KPj4gIGRyaXZlcnMvY2xrL2Nsay12ZXJz
YWNsb2NrNS5jIHwgMSAtCj4+ICBkcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmMgICB8IDEgLQo+
PiAgZHJpdmVycy9jbGsvcm9ja2NoaXAvY2xrLmMgICAgfCAxIC0KPgo+IENsb2NrLXRyZWVzIGZv
ciBzb2MgZmFtaWxpZXMgbm9ybWFsbHkgaGF2ZSBkaWZmZXJlbnQgc3ViLW1haW50YWluZXJzLAo+
IHNvIGRlcGVuZGluZyBvbiBob3cgd2Ugd2FudCB0byBtZXJnZSB0aGlzLCB5b3UgbWlnaHQgbmVl
ZCB0byBzcGxpdAo+IHRoaXMgaW50byAzIHBhdGNoZXMuCj4KPiBCdXQgYXQgbGVhc3QgZm9yIHRo
ZSBSb2NrY2hpcCBwYXJ0LCBJJ20gYWxzbyBmaW5lIHdpdGggdGhlIHBhdGNoIGdvaW5nCj4gaW4g
YXMgYSB3aG9sZSwgc28gKGZvciB0aGUgUm9ja2NoaXAgcGFydCk6Cj4KPiBBY2tlZC1ieTogSGVp
a28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPgo+Cj4gSGVpa28KClNhbWUgZm9yIHRoZSBB
bWxvZ2ljIHBhcnQKCkFja2VkLWJ5OiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNv
bT4KCj4KPj4gIDMgZmlsZXMgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKPj4gCj4KPiBbLi4uXQo+
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9yb2NrY2hpcC9jbGsuYyBiL2RyaXZlcnMvY2xr
L3JvY2tjaGlwL2Nsay5jCj4+IGluZGV4IGU2M2Q0ZjIwYjQ3OS4uMzk4YzQyN2I4ZTgxIDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL2Nsay9yb2NrY2hpcC9jbGsuYwo+PiArKysgYi9kcml2ZXJzL2Ns
ay9yb2NrY2hpcC9jbGsuYwo+PiBAQCAtMjEsNyArMjEsNiBAQAo+PiAgI2luY2x1ZGUgPGxpbnV4
L21mZC9zeXNjb24uaD4KPj4gICNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4KPj4gICNpbmNsdWRl
IDxsaW51eC9yZWJvb3QuaD4KPj4gLSNpbmNsdWRlIDxsaW51eC9yYXRpb25hbC5oPgo+PiAgCj4+
ICAjaW5jbHVkZSAiLi4vY2xrLWZyYWN0aW9uYWwtZGl2aWRlci5oIgo+PiAgI2luY2x1ZGUgImNs
ay5oIgo+PiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
