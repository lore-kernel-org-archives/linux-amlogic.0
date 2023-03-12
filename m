Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CB4C6FD19
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Mar 2023 20:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yW81/JxE1iwG6f3LloiBRBwoYG8ux40U75jzbeQ2nAE=; b=gQG0LTqg+0tRsQ
	1uNJyYMn+4YogZu25XboZgG27BYDfStf1fXpeOCWx076FOMAq4bwq2P904RGhon9aOsDtdTgVcT4Q
	GWv0F5tqfSjiVEcYu2EYno+D9fMrEx4MsYZQgqYh56fESBSmKFMadF+nHEIluGFQ8WhaoSijXX4JB
	WDdcOLZgYXIs1ffg6muBEDesP99dbFj5xQUI5a9tb8yN+Tg3rktH3VcCvvMKRV6Qp3WaHwhKjwqOc
	CHfSv5Q3dofLq5bCkf/ab1DK6QHWT9xBsZuwtBEBIPtxlkLo0g2ISbzq0ZZx9jiu/U0Y6tVHCUH/X
	mX4leW5p81lltJkYBeDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbSDR-003Tan-Bf; Sun, 12 Mar 2023 20:22:49 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbSDP-003TZ5-3Y; Sun, 12 Mar 2023 20:22:48 +0000
Received: by mail-ed1-x535.google.com with SMTP id g10so11979842eda.1;
        Sun, 12 Mar 2023 13:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678652561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vgKQykf8brlyi2LczfMpXiOtdb7XUjoPCnvpJA0pRs=;
        b=YT8RIQLwpR+tSYlk+sID86w7gAf88qf1mwYjMQGZq/3DjPZxCc4/18g2C+SETqngso
         znC29F8dqIU9jU6JpYoiziU+bjyurLKdVySoGWGjynYrFTxAKjlp5kfMgr2qJUaWrHnD
         IS3j5O8KOoyC+9rtFQVTDcIyNVclxyElqzfhBPwbshReVv5ocAfKRavoKjmmLwuTx35Z
         kGB6xIDN4IhjussmxbbcsbgzuutPBGfIkscXraUXjhWEhIz5OsubQ5QF99vFVLW3Ut68
         KRxV/eTxAAdbj/zINgG4dJKP/6m3lkh/963JpGXNtlOugPyBdIi/BgUSFeHL9saxYIv8
         fE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678652561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0vgKQykf8brlyi2LczfMpXiOtdb7XUjoPCnvpJA0pRs=;
        b=3AKEzvgaqTCy2W/l6BbIQelPXgyLfrNP2mcE7QraW1VcSRyNxxEldwACA3tBF3p1Q9
         e2kwpb064cytJV//ufeHUloAIO85GUnB495g9jm3Xin4gXv84xocvJzxqBuPUbQBs4Pu
         GNjoiN29IXxGbbdPw302q8ztlO+QMwex6WAdrtsW4yAxBMtbesPUVJm1Er3sFeytY2qG
         YjhaCCpPU1C1sMssXsjLC6hDmClUbqlKQSOvBMC3nsqhqBs/b7s3QyMRxbc8lnoIqT+t
         4apXCxn9JtyFHhbivsDO6BgkTOjF3d8VO8nNtE/dm3Npho+pJJY3IbJHMMU01HWC/eD2
         zxGQ==
X-Gm-Message-State: AO0yUKVcS6ZbM3pdeXstVS5rPX1n0d/ALhN4e72gRN4zOGv1B/FbSSrw
	4lRd0gDCCUXES9KA8BkUgXFQCf/nhkA7fttvii4=
X-Google-Smtp-Source: AK7set/qNs3L4eRqxYEPRVan4gRI7HN4pAYdNAoLm6Zm7ma4MQdbrxQCfljfgh/mN9ImyMV604xueQF8Dz1mt7ZDiN0=
X-Received: by 2002:a17:906:e58:b0:922:ff34:d814 with SMTP id
 q24-20020a1709060e5800b00922ff34d814mr2004946eji.6.1678652561372; Sun, 12 Mar
 2023 13:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230310191405.2606296-1-u.kleine-koenig@pengutronix.de>
 <CAFBinCCfqgBkHq2fFy=d+8C6nwq=wehu9nzePfwuY5ndfLMWoQ@mail.gmail.com> <20230311214437.tdv5wl5a6qgsewd4@pengutronix.de>
In-Reply-To: <20230311214437.tdv5wl5a6qgsewd4@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 12 Mar 2023 21:22:30 +0100
Message-ID: <CAFBinCAVSjNWytfCfxFmS_OfVNNyzzwfxh3i_9+ufaw6qwDdbg@mail.gmail.com>
Subject: Re: [PATCH] pwm: meson: Explicitly set .polarity in .get_state()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Munehisa Kamata <kamatam@amazon.com>, 
	Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_132247_337407_DAD2CAA7 
X-CRM114-Status: GOOD (  28.56  )
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

T24gU2F0LCBNYXIgMTEsIDIwMjMgYXQgMTA6NDTigK9QTSBVd2UgS2xlaW5lLUvDtm5pZwo8dS5r
bGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIFNhdCwgTWFyIDExLCAy
MDIzIGF0IDEwOjAwOjUwUE0gKzAxMDAsIE1hcnRpbiBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4gPiBI
aSBVd2UsCj4gPgo+ID4gT24gRnJpLCBNYXIgMTAsIDIwMjMgYXQgODoxNOKAr1BNIFV3ZSBLbGVp
bmUtS8O2bmlnCj4gPiA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPiA+
IFsuLi5dCj4gPiA+IFRoZXJlIGlzIGEgY29tcGxpY2F0aW5nIGZhY3QsIHRoYXQgdGhlIC5hcHBs
eSgpIGNhbGxiYWNrIGZha2VzIHN1cHBvcnQKPiA+ID4gZm9yIGludmVyc2VkIHBvbGFyaXR5LiBU
aGlzIGlzIG5vdCAoYW5kIGNhbm5vdCkgYmUgbWF0Y2hlZCBieQo+ID4gPiAuZ2V0X3N0YXRlKCku
IEFzIGZpeGluZyB0aGlzIGlzbid0IGVhc3ksIG9ubHkgcG9pbnQgaXQgb3V0IGluIGEgY29tbWVu
dAo+ID4gPiB0byBwcmV2ZW50IGF1dGhvcnMgb2Ygb3RoZXIgZHJpdmVycyBmcm9tIGNvcHlpbmcg
dGhhdCBhcHByb2FjaC4KPiA+IElmIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9ucyBvbiBob3cgdG8g
Zml4IHRoaXMgdGhlbiBwbGVhc2UgbGV0IHVzIGtub3cuCj4gPiBJIGRvbid0IHJlY2FsbCBhbnkg
Ym9hcmQgbmVlZGluZyBzdXBwb3J0IGZvciBpbnZlcnRlZCBQV00gLSBidXQgdGhleQo+ID4gbWF5
IGJlIG91dCB0aGVyZSBzb21ld2hlcmUuLi4KPgo+IEFuZCB0aGF0J3MgdGhlIHByb2JsZW0uIEFz
IHRoZSBoYXJkd2FyZSBkb2Vzbid0IHN1cHBvcnQgaW52ZXJ0ZWQKPiBwb2xhcml0eSB0aGVyZSBp
cyBubyB3YXkgdG8gaW1wbGVtZW50IGl0IGNvcnJlY3RseS4gVGhlIG9ubHkgcmlnaHQgd2F5Cj4g
d291bGQgYmUgdG8gcmV0dXJuIC1FSU5WQUwgaW4gdGhpcyBjYXNlLCBidXQgdGhpcyBtaWdodCBi
cmVhayBzb21lCj4gY29uc3VtZXJzLgo+Cj4gSSBoYXZlIGFuIGlkZWEgaG93IHRvIGV2b2x2ZSB0
aGUgUFdNIEFQSS4gVGhhdCdzIGJ5IGludHJvZHVjaW5nIGFuCj4gLm9mZnNldCBwYXJhbWV0ZXIg
dG8gc3RydWN0IHB3bV9zdGF0ZS4gVGhpcyB3b3VsZCBkZXNjcmliZSB0aGUgZm9sbG93aW5nCj4g
UFdNIHNpZ25hbDoKPgo+Cj4gICAgX19fX19fX19fX18vwq/Cr8Kvwq/Cr8Kvwq/Cr8KvXF9fX19f
X19fX19fX19fXy/Cr8Kvwq/Cr8Kvwq/Cr8Kvwq9cX19fXwo+ICAgIF4gICAgICAgICAgICAgICAg
ICAgICAgICAgXiAgICAgICAgICAgICAgICAgICAgICAgICBeICAgICAgICAgICAgICAgICAgICAg
ICAgIF4gICAgICAgICAgICAgICAgICAgICAgICAgXgo+ICAgIDwtLS0tLS0gcGVyaW9kIC0tLS0t
LS0tLS0+Cj4gICAgPC0gb2Zmc2V0LT4KPiAgICAgICAgICAgICAgIDwtLS0tLS0tLT4gZHV0eV9j
eWNsZQo+Cj4gVGhpcyBpcyBtb3JlIGdlbmVyYWwgdGhhbiBwb2xhcml0eTogSXQgY2FuIGRlc2Ny
aWJlIG5vcm1hbCBwb2xhcml0eQo+ICgub2Zmc2V0ID0gMCkgYW5kIGludmVyc2VkIHBvbGFyaXR5
ICgub2Zmc2V0ID0gLnBlcmlvZCAtIC5kdXR5X2N5Y2xlKS4KPgo+IFRoZW4gdGhlIHBvbGljeSB0
byBpbXBsZW1lbnQgYSBwd21fc3RhdGUgbGlrZSB0aGF0IHdvdWxkIHByb2JhYmx5IGJlOgo+Cj4g
IC0gUGljayB0aGUgYmlnZ2VzdCBwZXJpb2Qgbm90IGJpZ2dlciB0aGFuIHJlcXVlc3RlZAo+ICAt
IGZvciB0aGF0IHBlcmlvZCBwaWNrIHRoZSBiaWdnZXN0IGR1dHkgY3ljbGUgbm90IGJpZ2dlciB0
aGFuIHJlcXVlc3RlZAo+ICAtIGZvciB0aGF0IHBlcmlvZCBhbmQgZHV0eV9jeWNsZSBwaWNrIHRo
ZSBiaWdnZXN0IG9mZnNldCBub3QgYmlnZ2VyCj4gICAgdGhhbiByZXF1ZXN0ZWQuCj4KPiBXaXRo
IHRoZXNlIHJ1bGVzIGluIHBsYWNlIGl0IHdvdWxkIGJlIGFsbG93ZWQgdG8gY29uZmlndXJlIG5v
cm1hbAo+IHBvbGFyaXR5IGZvciBhIHJlcXVlc3Qgd2l0aCBpbnZlcnRlZCBwb2xhcml0eSwgYnV0
IG5vdCB0aGUgb3RoZXIgd2F5Cj4gYXJvdW5kLiBUaGVuIHRoZSBhbGdvcml0aG0gY3VycmVudGx5
IGltcGxlbWVudGVkIGluIHRoZSBtZXNvbiBkcml2ZXIKPiB3b3VsZCBiZSBhbGxvd2VkLgo+Cj4g
QSBjb25zdW1lciB0aGF0IGRvZXNuJ3QgY2FyZSBhYm91dCB0aGUgb2Zmc2V0IChpLmUuIG1vc3Qg
ZHJpdmVycykgY291bGQKPiBqdXN0IHBhc3MgLm9mZnNldCA9IC5wZXJpb2QgLSAxLgo+Cj4gVG8g
YmUgcHJhY3RpY2FsIGZvciBjb25zdW1lcnMgd2hvIGNhcmUgYWJvdXQgcG9sYXJpdHksIHdlIGZp
cnN0IHdvdWxkCj4gbmVlZCBhIHdheSB0byB0ZXN0IHRoZSBjYXBhYmlsaXRpZXMgb2YgYSBQV00g
dGhvdWdoLiBJIGhhdmUgYW4gaWRlYSBmb3IKPiB0aGF0LCB0b28sIGJ1dCB0b2RheSB0aGlzIGlz
IHN0aWxsIHZhcG91cndhcmUuCkluIG15IG9waW5pb24geW91ciBwcm9wb3NhbCBtYWtlcyBzZW5z
ZS4gSSBkb24ndCBoYXZlIHRoZSB0aW1lIHRvCmltcGxlbWVudCBpdCBteXNlbGYgYXQgdGhlIG1v
bWVudCB0aG91Z2guIEkgY2FuIGhlbHAgdGVzdCBvbiBzb21lIG9mCnRoZSBBbWxvZ2ljIFNCQ3Mg
dGhhdCBJIGhhdmUgKGFuZCB1c2UgYSBjaGVhcCBzaWduYWwgYW5hbHl6ZXIgSSBoYXZlCnRvIGxv
b2sgYXQgdGhlIGdlbmVyYXRlZCBQV00gc2lnbmFsKS4KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
