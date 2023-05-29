Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8EEC7EE23
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 May 2023 20:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CTyYHbqoVlAlLNRFZXTPguXfIQ6SulPuuDlPKQFYBL4=; b=bZBMA7mx0KsZA2
	wYbWQG4Bpmk9vKo2Lv+yM4eviYcUSHmMAKgE9s7cgiECm7Vyv24B7GXCOR1v2UPVIVHpZ03XF1wXO
	H1TYzUsGs0JWCqojUY2gVin2uf0Z2i9EYCaOZ9TLCeXhVOcWw06pF+xNffTxP0upF9NcZ1ZxxjMTn
	ewZk91pdzC9FBr+aBmIxSlGzGH3HOUiP3aYoQ4l6Ws6iWOoUJHpghSTxKe6s80BIELjyBtjR04S+K
	Nx0+vadoRcljO2FOLH4kRGYm0Yr1OhEJYbDftp70MauAWPSc7oQNKqm+WEO8wjsP6DOGqLzFLhV9z
	zJqfg+SMY5jJBTUYDJoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3j6b-00Bapg-2C;
	Mon, 29 May 2023 20:04:37 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3j6X-00Bany-2P;
	Mon, 29 May 2023 20:04:35 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-51491b87565so4313784a12.1;
        Mon, 29 May 2023 13:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1685390669; x=1687982669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZoZf/xczibXYDWG/6Mc7Wi2iq3Itvt6yL1vaRCC+K6M=;
        b=axcRkrFkcmKzt054fs7v1UwB2jVBAxH4IyCUC/7o6SFdnJxyzj/vr0+Kv/JJ3jUhWU
         0w7Bol+SfZeFjGzVCN5RLNROdzpPH9bxkLEC3lSWwPDHWhGTsDDEdkFh/PbXbzhS3NWq
         bc+Mo50fliHAsdS1POTT1C0o/ecVuZ9Du47v1vaG1WJbXvKZuhK1x7//E+wTKkW1vqLw
         tPIjejJ4UwL6h9hhj0c2orH3jl4cLuYJSI0qnNEYfF2WuQXBQLrvdg2htLb7KB6It+8o
         Sm98KoIp6AGtOIi2rbn3M29x214f4iu/zgX+fgdeCG0ybSLEvBvcBdywGuxHn/kuvrIO
         whjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685390669; x=1687982669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZoZf/xczibXYDWG/6Mc7Wi2iq3Itvt6yL1vaRCC+K6M=;
        b=InAS8phL7iRMcVp69leeVdJmijtYol7BT6+atygrNANMPu8badmIzbWao30odjvulx
         XLcta0AoEON9J2l9cjZNgiMGgaqf/ni7h+7EHQyFCNeGPz6ATsneX+RGrxZ4yTarTfGZ
         KPCVCeWcffQRYwD6igTBdcTiWi6rGf9M4rIj33pbHFCqUh5vODKv9ezBhOxRqAUUeFvI
         OTEaXNw3wMciKtiZW8q0tqTougoVSj3bui6FmXA88GhTtxdqJ0MRFSgXNfqwnSWIWb98
         SnhCkP85qB4eC2eo9jT8yVFFbWYIJQN2GHJoKJnOKb5AOhv1NGZfGjVUDs713FyAwBJb
         7RMw==
X-Gm-Message-State: AC+VfDy7J1QyU7Fe6gwDR8NoShWTRic1Yw10w4H2m63K1hiwvT9hF6AS
	ViKmkle26O/JGAvKmGoLKt0sbNbv/fdGWblKnxA=
X-Google-Smtp-Source: ACHHUZ6fBnoUW8s7bD4kr2wc2YaDUbTsjPJ7jdxI4pWyyE579kh7lZB5GhSLucvdDMRNz6QURt0vaLwWmjwmMpa1mlI=
X-Received: by 2002:a17:907:2daa:b0:96a:6723:da48 with SMTP id
 gt42-20020a1709072daa00b0096a6723da48mr209616ejc.75.1685390669261; Mon, 29
 May 2023 13:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230527214854.126517-1-gnstark@sberdevices.ru>
 <20230528161117.197f7e61@jic23-huawei> <4d5a7691-68ac-6626-5502-383fad3a9436@sberdevices.ru>
In-Reply-To: <4d5a7691-68ac-6626-5502-383fad3a9436@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 29 May 2023 22:04:18 +0200
Message-ID: <CAFBinCA=earf119bN7ohmTQGDzSMeV9qcL8RU9DUYe0195H5=Q@mail.gmail.com>
Subject: Re: [PATCH v2] meson saradc: add iio device attrib to switch channel
 7 mux
To: George Stark <GNStark@sberdevices.ru>
Cc: Jonathan Cameron <jic23@kernel.org>, "lars@metafoo.de" <lars@metafoo.de>, 
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "khilman@baylibre.com" <khilman@baylibre.com>, 
	"jbrunet@baylibre.com" <jbrunet@baylibre.com>, 
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, 
	"nuno.sa@analog.com" <nuno.sa@analog.com>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>, kernel <kernel@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_130433_803160_4EC00626 
X-CRM114-Status: GOOD (  19.79  )
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

SGkgR2VvcmdlLAoKT24gU3VuLCBNYXkgMjgsIDIwMjMgYXQgMTE6NTLigK9QTSBHZW9yZ2UgU3Rh
cmsgPEdOU3RhcmtAc2JlcmRldmljZXMucnU+IHdyb3RlOgpbLi4uXQo+ID4gQmFzZWQgb24gdGhl
IGxpbWl0ZWQgZGVzY3JpcHRpb24gd2UgaGF2ZSBoZXJlLCBJJ20gbm90IHVuZGVyc3RhbmRpbmcg
d2h5Cj4gPiB5b3UgZG9uJ3QganVzdCBleHByZXNzIHRoaXMgYXMgYSBzZXQgb2YgY2hhbm5lbHMu
IE9uZSBjaGFubmVsIHBlciBtdXgKPiA+IHNldHRpbmcsIHdpdGggdGhlIGluX3ZvbHRhZ2VYX2xh
YmVsIHByb3ZpZGluZyB0aGUgaW5mb3JtYXRpb24gb24gd2hhdCB0aGUKPiA+IGNoYW5uZWwgaXMg
Y29ubmVjdGVkIHRvLgo+ID4KPiA+IFRoaXMgaXMgYW4gaW50ZXJlc3RpbmcgZmFjaWxpdHksIHNv
IGdvb2QgdG8gZW5hYmxlIGZvciBoaWdoIHByZWNpc2lvbiBjYWxpYnJhdGlvbgo+ID4gYnV0IHdl
IHN0aWxsIHdhbnQgdG8gbWFwIGl0IHRvIHN0YW5kYXJkcyBzaWduYWxzLiAgVXNlcnNwYWNlIGRv
ZXNuJ3QKPiA+IGNhcmUgdGhhdCB0aGVzZSBhcmUgYWxsIGJlaW5nIG1lYXN1cmVkIHZpYSB0aGUg
c2FtZSBpbnB1dCA3IC0gd2hpY2gKPiA+IGlzIGl0c2VsZiBwcm9iYWJseSBhbiBpbnB1dCB0byBh
IE1VWC4KPiA+Cj4gPiBKb25hdGhhbgo+Cj4gSGVsbG8gSm9uYXRoYW4KPgo+IFRoYW5rcyBmb3Ig
dGhlIHJldmlldy4KPgo+IFlvdXIgaWRlYSBvZiBleHBvc2luZyB0aGUgbXV4IHNldHRpbmcgYXMg
aWlvIGNoYW5uZWxzIGlzIHZlcnkKPiBpbnRlcmVzdGluZyBhbmQgYXQgbGVhc3Qgd29ydGggdHJ5
aW5nLgo+IFRoZSBzeXNmcyBhcHByb2FjaCB3YXMgY2hvc2VuIGJlY2F1c2Ugb2YgdGhlIGNvZGUg
Y2hhbmdlcyBhcmUgc2ltcGxlIGFuZAo+IG5lYXQgKGNvbXBhcmUgdG8gY2hhbm5lbHMgYXBwcm9h
Y2gpLgo+IEFsc28gY2FsaWJyYXRpb24gYnkgdXNpbmcgdGhvc2UgbXV4IGlucHV0cyBhcmUgYWxy
ZWFkeSBzdXBwb3J0ZWQgaW4gdGhlCj4gZHJpdmVyIChwZXJmb3JtZWQgYXQgcHJvYmUgc3RhZ2Up
IHNvIEkgZXhwZWN0IHZlcnkgc3BlY2lhbCB1c2VjYXNlcyBmb3IKPiB0aG9zZSBtdXggc2V0dGlu
Z3MgbGlrZSBkZWJ1ZyBvciBkZXZpY2UgcHJvZHVjdGlvbiBzdGFnZSB0ZXN0cy4gSW4gdGhvc2UK
PiB1c2VzY2FzZXMgaGFyZHdhcmUgc3BlY2lmaWMga25vd2xlZGdlIGlzIHJlcXVpcmVkIGFueXdh
eS4KQW5vdGhlciBkb3duc2lkZSB0byB0aGUgZGVidWdmcyBhcHByb2FjaCBpcyB1c2VyIHN1cHBv
cnQ6CklmIHNvbWVvbmUgcmVwb3J0cyBvZGQgdmFsdWVzIG9uIEFEQyBjaGFubmVsIDcgdGhlbiB3
ZSBuZWVkIHRvIG1ha2UKc3VyZSB0byBkb3VibGUgY2hlY2sgaWYgdGhlIG11eCBoYXMgYmVlbiBh
bHRlcmVkIGZyb20gdXNlcnNwYWNlICh0aGUKY2FsaWJyYXRpb24gZHVyaW5nIGluaXRpYWxpemF0
aW9uIGVuc3VyZXMgdG8gbGVhdmUgY2hhbm5lbCA3IGluIGEKY29uc2lzdGVudCBzdGF0ZSwgd2hp
bGUgYSB1c2VyIG1heSBjaGFuZ2UgdGhlIG11eCwgZm9yZ2V0IGFib3V0IGl0IGFuZAp0aGVuIGNv
bXBsYWluIHRoYXQgdmFsdWVzIGFyZSB3cm9uZykuCgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
