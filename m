Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C231BC6FD18
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Apr 2023 18:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEKNG3ekKVRTaV6SAeasf3TFhE3Pu2GwGA9Y+3EfMlY=; b=FlYij/U5cjmusD
	TOLglnjA0A3S+jWLtNTrO8kEfvsTeHHF9kYDj5+dDn/o1RBcQqLDQQKKVnvZfNnSdjkKffgGpZrzH
	ffTt1yyRju1O/LkGR+a2CxikwSKWaNr/0wlMTWeYTSWJBQypPwX5mzDnJbC8vslu/VvTcbG6dcBQG
	VOAC6HJbZrxJ+ThTZR++esZdmrxGnjn0q31YGWN1Xjuc7+hwA3XrJoJnNmOWhEQ6E1ufPFjL+pryp
	APQXx9ZX9d8NxQPjChRCSKybLTOS5g7CpdMvV2rfUZgexeShWMG2k0x2jDZLut5RA3zJI+S7X2Cf2
	vpZWE3q8Rir5bhTy8RAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqe0E-00Ebvr-2Q;
	Sun, 23 Apr 2023 17:59:58 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqe0A-00EbuW-2U;
	Sun, 23 Apr 2023 17:59:55 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-956ff2399c9so568587766b.3;
        Sun, 23 Apr 2023 10:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1682272792; x=1684864792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C64A0dsE3cz/VSxxzDX9cD4SWqMcPZ5sOUVKtV/7k14=;
        b=V+cHIDG6x/qtvEaBgAvD+5TiN/RlOxI2/koCW+pkpWGvr+JR/DiJ8N9mPpdgBZ7g0u
         s8dITIz6jTFqHocpokqgwVg+gkB4HyukW/CX5vxlNJHMhNF1b7GIhFdQ1WEQvRhpS0sh
         XpjmbTMwH+x6OcpNhkilFUuQfGD+V3lOX9cJz2Y+3j7vUOGglA5JNtYNGGRUcOwZZeXP
         6yiT6YThiRbZuK22db96MZU0/5K7TO2phC2wYjaZ501DuJeKlRdRUDA0JxCIN0BNZdZm
         59mlEdO+mtqOmBqmmKfpNRFep1dNGvJJcr/CCWDW1lQPo60m/RBzercm6gzsl13yDVFC
         CbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682272792; x=1684864792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C64A0dsE3cz/VSxxzDX9cD4SWqMcPZ5sOUVKtV/7k14=;
        b=jVBv+YrJBgCKSvcf4fU+1OHB1ID5QXJEnGUmkqrMfqTubIxzM6akUtuFbjxOQWpRVP
         JwWtrTHw69CuEtnSKyNxSGW3yADNw00Po5IbSr2szPI7V3Yoxl9bJPYc0vfm66T9c3Yz
         5Ay8HZ153qm1FftbJeB/aLWYtGEULwh3/6fqfFbaGmmBM/s6D7LEqG76q9bDubc3NPCA
         Q/G3uboLCd+jBLs0zNWeC3aJLQKVPwyuCch3VdDkIT/hxY799cXSdm9SR8J+1FVTNhlF
         wXmNHhr1HFRwcqKWswxvw1YwWbQ3TMsyCKQDHu5+ienMauptBvJHm3s1BcoRJbk7E8aM
         ibSw==
X-Gm-Message-State: AAQBX9ehu//2oFTuL/lzlIOtozqP/PIs0v04gsMzI6HLU7buBW1/A3wL
	606i+dvzz+jzmPleJ/C45+3/nSdz+KP2yeQTGLg=
X-Google-Smtp-Source: AKy350YDbpNGHB6yJxs24uoSutOLtuIogeMZt2ANhq1PG1ddyqqXndVZ4QEUuAtvzsrZhzyHhxcSR0su7uVnbDEP0Jg=
X-Received: by 2002:a17:906:1498:b0:94f:322d:909c with SMTP id
 x24-20020a170906149800b0094f322d909cmr8196354ejc.34.1682272791598; Sun, 23
 Apr 2023 10:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <5a5920db-4c32-25e8-d1e3-bd2f724dd242@gmail.com>
 <20230421145723.oq7zqbhhz4fhkmyj@CAB-WSD-L081021> <5b1a84ee-1f96-1585-5167-4f4e266a7fb7@gmail.com>
 <20230421191416.yg5tbkm6n2mg2kpg@CAB-WSD-L081021>
In-Reply-To: <20230421191416.yg5tbkm6n2mg2kpg@CAB-WSD-L081021>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 23 Apr 2023 19:59:40 +0200
Message-ID: <CAFBinCDUT6EG1ZqEu=c-MGM1+DVUN+uGHqmbBU5m5iWzmni0RA@mail.gmail.com>
Subject: Re: [PATCH] pwm: meson: simplify calculation in meson_pwm_get_state
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-pwm@vger.kernel.org, 
	kernel@sberdevices.ru
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_105954_813626_13E0CC90 
X-CRM114-Status: GOOD (  17.77  )
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

T24gRnJpLCBBcHIgMjEsIDIwMjMgYXQgOToxNOKAr1BNIERtaXRyeSBSb2tvc292IDxkZHJva29z
b3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgpbLi4uXQo+ID4gPiBJbnNpZGUgdGhpcyBwYXRjaCwg
aW4gbXkgb3BpbmlvbiwgeW91IGhhdmUgbm90IG9ubHkgc2ltcGxpZmllZCBhbmQKPiA+ID4gb3B0
aW1pemVkIGJ1dCBoYXZlIGFsc28gbW9kaWZpZWQgdGhlIGxvZ2ljLiBJdCBpcyBpbXBvcnRhbnQg
dG8gcHJvdmlkZQo+ID4gPiBtb3JlIGRldGFpbHMgb24gdGhpcyBtb2RpZmljYXRpb24uIFByZXZp
b3VzbHksIGluIGNhc2VzIHdoZXJlCj4gPiA+IChjaGFubmVsLT5sbyAhPSAwKSAmJiAoY2hhbm5l
bC0+bG8gPCBjaGFubmVsLT5oaSksIHBlcmlvZCBhbmQgZHV0eV9jeWNsZQo+ID4gPiB3ZXJlIG5v
dCBjYWxjdWxhdGVkLiBIb3dldmVyLCBpbiB5b3VyIHBhdGNoc2V0LCBkdXR5X2N5Y2xlIGFuZCBw
b2xhcml0eQo+ID4gPiBhcmUgY2FsY3VsYXRlZCBhbmQgcmV0dXJuZWQgdG8gdGhlIGNhbGxlciBp
biBzdWNoIGNhc2VzLgo+ID4gPiBDYW4geW91IHBsZWFzZSBzaGFyZSB0aGUgZGV0YWlscyBvZiB3
aHkgdGhpcyBpcyB0aGUgcmlnaHQgc29sdXRpb24/Cj4gPgo+ID4gSXQncyB0aGUgb2J2aW91cyBz
b2x1dGlvbi4gSSBzZWUgbm8gcmVhc29uIHRvIHJldHVybiBhbGwgemVybydzIGZvcgo+ID4gbG8g
PCBoaSwgYW5kIGFsc28gdGhlIGNvbW1pdCB0aGF0IGFkZGVkIHRoaXMgY2FsY3VsYXRpb24gZG9l
c24ndCBwcm92aWRlCj4gPiBhbiBleHBsYW5hdGlvbi4gSXQganVzdCByZWZlcmVuY2VzIHRoZSBj
YWxjdWxhdGlvbiBpbiBtZXNvbl9wd21fY2FsYygpLAo+ID4gaG93ZXZlciBJIGZhaWwgdG8gc2Vl
IHRoYXQgbG8gPCBoaSBpcyB0cmVhdGVkIGRpZmZlcmVudGx5IHRoZXJlLgo+ID4KPiA+IGMzNzVi
Y2JhYWJkYiAoInB3bTogbWVzb246IFJlYWQgdGhlIGZ1bGwgaGFyZHdhcmUgc3RhdGUgaW4gbWVz
b25fcHdtX2dldF9zdGF0ZSgpIikKPiA+Cj4KPiBBY3R1YWxseSwgSSBkb24ndCBzZWUgYW55IGFy
Z3VtZW50cyB0byBieXBhc3MgdGhlIGNhc2Ugd2hlcmUgbG8gPCBoaSwKPiBzbyB0aGUgY3VycmVu
dCBpbXBsZW1lbnRhdGlvbiBvZiBnZXRfc3RhdGUoKSBpcyBxdWVzdGlvbmFibGUuCj4gSSB0aGlu
ayBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gd2FpdCBNYXJ0aW4ncyBvcGluaW9uIHdoeSBtZXNvbl9w
d21fY2FsYygpCj4gbG9naWMgd2FzIGludmVyc2VkIHdpdGggc3VjaCBjb25kaXRpb25zLgpUbyBi
ZSBob25lc3Q6IEkgZG9uJ3QgcmVjYWxsIHdoeSBJIGRpZCBpdCBsaWtlIHRoYXQuIFNvIHBsZWFz
ZSBnbyB3aXRoCkRtaXRyeSdzIHN1Z2dlc3Rpb24gKHRvIHVwZGF0ZSB0aGUgcGF0Y2ggZGVzY3Jp
cHRpb24gdGhhdCB0aGlzCiJvcHRpbWl6YXRpb24iIGlzIG5vdyBnb25lKS4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
