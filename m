Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0139C6FD1C
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Mar 2023 20:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uZVAz2za7qRBso6MOQ5qxAX0qpIr7d3ujG5DvY838FI=; b=lzWnzFRAD7OS2N
	udLKC9Y7cMtozB5F21i/Tr5O2tMIZKgi6PvHlBWuR+nuhB8ikYtGB7Q9T7iLS7dON0JClEAbc9ZYy
	qcV4WkCLN6IiwvaPHRUHItymnup0t2tmaSD+XL7OqH6LTuCuC5UWYBbp3bNr7E/T5RvB4onmzIWQs
	ooyg/EVTwcdaJv8PfVWlDSfLE0bcnYoL0aXkMRbkTHN9WYlqB4u87w1nGXkiS5hDrRRT0s7t2sfs2
	SGpemm9tOSiWKq+FHo1X2EmZFmnJueaOVLkNXBNLCTjgz2jKUu8Uw5+InH5jFFBB0PlIgtBofwrl5
	dMjGLRRCrapjGmWaJ/Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgAjx-007MXr-2Y;
	Sat, 25 Mar 2023 20:43:53 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgAjv-007MWk-0J
	for linux-amlogic@lists.infradead.org;
	Sat, 25 Mar 2023 20:43:52 +0000
Received: by mail-ed1-x536.google.com with SMTP id ew6so20993244edb.7
        for <linux-amlogic@lists.infradead.org>; Sat, 25 Mar 2023 13:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1679777029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=huiy4s/wEgRouQlA847WYvrrC+O6U9t+JM/xZbwtaaw=;
        b=BFJE4BU70syeUHRnLjdv93QSaMc1Ky6UVG+2jYWhQB/uSDh1kheyVMSCcJ6FWpyPSZ
         kaUZi8WgMkF2DZQy01+kT8xvDlMG8p1/fj8B9WJdShIs2HBZ/Nn9u/+g2uIgBg9+kk6K
         Z7hTeayvA4hRLANKpiDiVLkNwKPWPlc+22ypNKhDNjzFMI8vMRUCQEhFdP1+z1/dz1N2
         9AVfR0zciOPEplopwZuezKonVkLJ3UkvS6rFgppUTNNGV8WZdgL5gjNUFd8CiRS3NH86
         rHPxpaPMFKBtarVECZoiwN3tENLwW1MxEjmyDt+hNfAq9TLXBsCDck99RZK8IYAAfbSh
         sDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679777029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huiy4s/wEgRouQlA847WYvrrC+O6U9t+JM/xZbwtaaw=;
        b=abJ0j+mWJipOGa7srYImiWVApGBUELKAEObID6fHTQlPvx1oemqFm444oz+T/9JuYR
         Oz+DpSFgLdH/ien9pOtf3ihc6GAKm9V+VFK8t30u1hRkWGX04FvfFo4CVpH7Yd0/ERkf
         lED8GVRwd1Tn0v5hYPPZ9xISJKjvNHpeo7j93fc9tbqS1YaMi5/2PxyLllU9KpmQEBB5
         Wh7fswK9SExv0q24AbWsmHPfeKGZEtIDeRYmxY6a4CS/MnN0zuc6PEGOEYzRtsOZ6/+H
         OamXTCTPIZDmSMwIJX4d6M9AHoKHY+K9g0JwRZE5o+xR1qha7cel3ECLi4VSiqpLIDrT
         W/mQ==
X-Gm-Message-State: AAQBX9csvab8rRfBIOvQv0GiWNxBZz+RE7DWaWRaLwlKP0z3io+Rj1tm
	WStv7NB73Q7b754K7pJ6rFeAYPj1n1gOfST+HbM=
X-Google-Smtp-Source: AKy350bWwBZjawat5is/ZrrXGo6yHM8e07zr0V3emoJp7YZyWa7LDk8u0izrP6rxfUCisZkY/pmDiZkAg7/ktaXgHbk=
X-Received: by 2002:a17:906:edc9:b0:924:efbb:8a8b with SMTP id
 sb9-20020a170906edc900b00924efbb8a8bmr3442678ejb.6.1679777028901; Sat, 25 Mar
 2023 13:43:48 -0700 (PDT)
MIME-Version: 1.0
References: <cbfd45e3-310b-db40-d52b-daf79ce8743d@free.fr> <CAFBinCAdTHuN+AZKm0Yt=Gv0KgMtRruAHDgcF0qrLTZpki3JRQ@mail.gmail.com>
 <CAFBinCBb_5KChqD6wqj_MFxEH_hxL_U3nnA=+1AR8dhdQQVCzw@mail.gmail.com>
 <c3b9c231-10ef-ef69-c702-9e1052b8e704@free.fr> <471489bc-8683-f1ba-3f5c-5a8bf299446a@free.fr>
 <CAFBinCBD38gcR+foUUm6JBOfdpzW1Q3g3nFowxoWG1LGSc31kQ@mail.gmail.com> <3f4a7735-5327-df75-79ac-66209dbffa37@free.fr>
In-Reply-To: <3f4a7735-5327-df75-79ac-66209dbffa37@free.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 25 Mar 2023 21:43:38 +0100
Message-ID: <CAFBinCDqk_JxtB5FhZoeFNpefN6gm_PXu-PVnapi+uNrgZcZfw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson-g12-common: specify full DMC range
To: Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jiucheng Xu <jiucheng.xu@amlogic.com>, 
	AML <linux-amlogic@lists.infradead.org>, Chris Healy <healych@amazon.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Pierre-Hugues Husson <phh@phh.me>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230325_134351_177249_070A38F5 
X-CRM114-Status: UNSURE (   8.27  )
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

T24gVGh1LCBNYXIgMjMsIDIwMjMgYXQgNToxMuKAr1BNIE1hcmMgR29uemFsZXogPG1hcmMudy5n
b256YWxlekBmcmVlLmZyPiB3cm90ZToKPgo+IEFjY29yZGluZyB0byBTOTA1WDIgRGF0YXNoZWV0
IC0gUmV2aXNpb24gMDc6Cj4gRFJBTSBNZW1vcnkgQ29udHJvbGxlciAoRE1DKSByZWdpc3RlciBh
cmVhIHNwYW5zIGZmNjM4MDAwLWZmNjNhMDAwLgo+Cj4gQWNjb3JkaW5nIHRvIERldmljZVRyZWUg
U3BlY2lmaWNhdGlvbiAtIFJlbGVhc2UgdjAuNC1yYzE6Cj4gc2ltcGxlLWJ1cyBub2RlcyBkbyBu
b3QgcmVxdWlyZSByZWcgcHJvcGVydHkuClVwIHVudGlsIHRoaXMgcG9pbnQgSSB0aG91Z2h0IHRo
YXQgdGhlIHJlZyBwcm9wZXJ0eSBpcyBtYW5kYXRvcnkgZXZlbgpmb3IgYSBzaW1wbGUtYnVzLiBU
dXJucyBvdXQgdGhpcyBpcyBub3QgdGhlIGNhc2Ugc28gd2UgcHJvYmFibHkgaGF2ZQp0byBjbGVh
biB1cCBtb3JlIG1lc29uLmR0c2kgLSBidXQgdGhhdCdzIG91dCBvZiBzY29wZSBvZiB0aGlzIHBh
dGNoIG9mCmNvdXJzZS4KCj4gRml4ZXM6IDE0OTkyMThjODBjOSAoImFybTY0OiBkdHM6IG1vdmUg
Y29tbW9uIEcxMkEgJiBHMTJCIG1vZGVzIHRvIG1lc29uLWcxMi1jb21tb24uZHRzaSIpCj4gU2ln
bmVkLW9mZi1ieTogTWFyYyBHb256YWxleiA8bWFyYy53LmdvbnphbGV6QGZyZWUuZnI+ClJldmll
d2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1h
aWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
