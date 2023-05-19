Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758C8C7EE26
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 May 2023 17:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dr3o+622Rl0+vuYvQw6SfdlYD9Jx6Qk6/SwHZatfhh4=; b=IC4NrpiDAFXUlm
	W5iZAqHmpgrH/00fTJ/w6+QSQ7Jl7DxdHp/HUSj9ejATQOWxBthleD1MBryeRfg5YIKB3NSH+tAh4
	TsPe9o1Fd2hhHW6hoZSoNXFbzQBTZxv0bYu3XVZfeRclNSseSZyWk1ezax995S8VzuV76iBB9CvxQ
	issbrwD/GwhsyGGHm+9S1a5UeO2KxFBHySmc6dGENshpY/WBMvQIryBtal99IMKP92nanjCcDDblO
	UgCXNlLgOjVSBbgpwM35aQTchtb6tSNKF9T+nAPgQgOJXhWEj2GJiKAnInbUEC7qrWkpeJhPh7eC2
	S1oqndOL3kjDfBwr9dtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0451-00Gsfh-0k;
	Fri, 19 May 2023 17:39:51 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q044x-00Gsf0-2b;
	Fri, 19 May 2023 17:39:49 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-96622bca286so671896266b.1;
        Fri, 19 May 2023 10:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1684517983; x=1687109983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WaQbuE5cv39OYuI5y6ZtsKaLFzPY8lJPqoWNNkwtTU=;
        b=gNzDPvFxzzNFgOhHoAxieNP/1nvGK+V+PZvuQDYJ1eHWrUjLQNwJb1D5F7VIKxTVLS
         bq916MkfscYab9cZoFtxSWmdIcdN+ZwUetpa6w4Q8lZOZnwK/1P3KoSm8P+TBZV0z9qw
         14oKCJteJKh7p1BkVNSt+5ekxTGJCIRHoYHV5xdT6ZHXTMZeUsbLOfafl2bZ0VebY/m+
         EmpTLkZ/9VPJCZmRTIdMN3WhfMRKM8AyK2dwqj2GDRY9ely/3/sLeWRnjJLpe/htc9mV
         kRuJJmn9ZCblA2qsZTxL3Hz6mv1xKcykj/xxqdH6kzUQpGBQewMNZfbrzev/SAfDLJy1
         YbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684517983; x=1687109983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WaQbuE5cv39OYuI5y6ZtsKaLFzPY8lJPqoWNNkwtTU=;
        b=bgYL3W7+yXaspRd75XXsuJHs56upDsEWPIsxsN1FonIQi2sP1GL3xiRliIDs2U4jGr
         AzA78iW0jQ2nLByyipgVQC6EXm6Gxd595IuShBCTaMXHS5JMx9/Wan2Sby4kGsquV29B
         dJQmBneeNSyGxpEaRg3sg7qrpIMZioKkVDcZX7VWnXEeyhmWuikXrvdT+iv2wKGjRl+9
         ptFSGlv5mpLOGqQ4Z+gB/6xBWhfVFE+/0UMM6nUbGf1lw1NT+g+zrxL5E3CEaAaBvykW
         CqGPakU+Be7Pa15/Y7E7f7xGhrcq9hmJkYBNh3d8F3gWc3kljYPFSaDOVoQyeGg1PA+Q
         PFag==
X-Gm-Message-State: AC+VfDxpVPa6Er0DyK2GDkAPF2mxb7IMTFI5a5gzFDqyenG9Ycm7UBtK
	ryemGKVNFdhSYy+j/lQnOKIzPe3cR0Aos0jH/H0=
X-Google-Smtp-Source: ACHHUZ63jUyq64WtlKEA52qluNBTP5cLS8bHfVIg4CwlIviMD89PBiYTqinu3CU3sghaCbiRMp1eI59E/izhmzoOaXI=
X-Received: by 2002:a17:907:6288:b0:946:be05:ed7a with SMTP id
 nd8-20020a170907628800b00946be05ed7amr2217094ejc.70.1684517983394; Fri, 19
 May 2023 10:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de> <20230517230239.187727-18-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230517230239.187727-18-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 19 May 2023 19:39:32 +0200
Message-ID: <CAFBinCCy2=bA2UghJ08itrdJF-heTJhDnnHHCdhTTVcRt_GbhQ@mail.gmail.com>
Subject: Re: [PATCH 17/97] usb: dwc3-meson-g12a: Convert to platform remove
 callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_103947_886109_C235E2D6 
X-CRM114-Status: GOOD (  12.09  )
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

T24gVGh1LCBNYXkgMTgsIDIwMjMgYXQgMTowMuKAr0FNIFV3ZSBLbGVpbmUtS8O2bmlnCjx1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gVGhlIC5yZW1vdmUoKSBjYWxs
YmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBpbnQgd2hpY2ggbWFrZXMKPiBt
YW55IGRyaXZlciBhdXRob3JzIHdyb25nbHkgYXNzdW1lIGl0J3MgcG9zc2libGUgdG8gZG8gZXJy
b3IgaGFuZGxpbmcgYnkKPiByZXR1cm5pbmcgYW4gZXJyb3IgY29kZS4gSG93ZXZlciB0aGUgdmFs
dWUgcmV0dXJuZWQgaXMgaWdub3JlZCAoYXBhcnQgZnJvbQo+IGVtaXR0aW5nIGEgd2FybmluZykg
YW5kIHRoaXMgdHlwaWNhbGx5IHJlc3VsdHMgaW4gcmVzb3VyY2UgbGVha3MuIFRvIGltcHJvdmUK
PiBoZXJlIHRoZXJlIGlzIGEgcXVlc3QgdG8gbWFrZSB0aGUgcmVtb3ZlIGNhbGxiYWNrIHJldHVy
biB2b2lkLiBJbiB0aGUgZmlyc3QKPiBzdGVwIG9mIHRoaXMgcXVlc3QgYWxsIGRyaXZlcnMgYXJl
IGNvbnZlcnRlZCB0byAucmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkKPiByZXR1cm5zIHZvaWQu
IEV2ZW50dWFsbHkgYWZ0ZXIgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCwgLnJlbW92ZV9uZXco
KSBpcwo+IHJlbmFtZWQgdG8gLnJlbW92ZSgpLgo+Cj4gVHJpdmlhbGx5IGNvbnZlcnQgdGhpcyBk
cml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQo+IGNhbGxiYWNr
IHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50Lgo+Cj4gU2lnbmVkLW9mZi1ieTogVXdlIEts
ZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KUmV2aWV3ZWQtYnk6
IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
