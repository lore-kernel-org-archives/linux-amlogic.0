Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CF2C77B60
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Apr 2023 17:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VagRcbjC9zNpHicvK52TdPbQZla/u9DFSoh1yqSc9uY=; b=E6nmeHoiOVqgrD
	+zyCilqLmRw1DbcFSruU61VUvNnj3OddaFMwAltWzZSBmEFmr7dptfUzvOjEzvAL+urlI+jlT3Zz0
	On0x87IpPSoYDVMNdOq9MnO2p535qzP8IADDFh/bu/n5d94E3z8P78CtLpcuHQyhSsVPFDWzZFNXk
	+P/DBf8woPBIKUgxqstTXC1dev1k76eQNuGBLlnQeKey27YY9qLzkoqW1+qZFpxx/+Col82tAFEQ6
	ukeXhGA5K/ovJozvs2PD1yTkwNLzMSebWAEINWDJY2NAm6YkksfErhfgwu/gxRda5i0feDRJY5gtq
	+Hi9N4B2iJYe6OkUHiFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqdc1-00EZoD-20;
	Sun, 23 Apr 2023 17:34:57 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqdbw-00EZnG-0z;
	Sun, 23 Apr 2023 17:34:54 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-957dbae98b4so241939766b.1;
        Sun, 23 Apr 2023 10:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1682271290; x=1684863290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E95S2h7SC5peJBhaFGdGC1nCRzFdlNEvGeNQ+tRZiEg=;
        b=KEsOnVti2sX97MrcpR/U0c+U9xLXeEvx5pHhg7QjYzGUnQ5rHwGPJ3wifSP6hFn/wh
         7jbnz2czpouy4BkvSZwwSpI0r6MNjjO0+UaATdhHhEw/Ovof+WJr1KoE8Xnq9lZftTCW
         ToKEPWcQwwTi+jsa66XOKGvGdh55snCHXQGE3U2jukOtFBTM0f2OANf1UM8iX7KvdXnZ
         Z0Qd9sBSJ9cQueUjAq1MJnzCjzSL0KkAmEIlhSnjeHda5KLVJKRCXWKmP9EwgiiLsAat
         joYyFg7JJJD6NBhCYa72RzqxFDXSEV02SAO56L2uFBIlzB3v/a1CedxFScOF7z2JeGLs
         DcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682271290; x=1684863290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E95S2h7SC5peJBhaFGdGC1nCRzFdlNEvGeNQ+tRZiEg=;
        b=XoH6Odk0P51TamN+dztQltYCFjWqT7R5lmRnd5Ft/ku5OZZLcIlzkfzUVRE4eAXeeH
         8GHHZ7UprV3aAb8i9xLDTHHoiiefROippmkQDjgK2sIC4l6DLy0buw09+CShtzP8X0zf
         9gqs7BQGdFMJ3Bvgz3VBlIxALyVO0aNR11yO4YsFidUbG29KO8RWrXbT11CyIpRKR8EB
         MAlgbVpQ7mYBu1OqvOYg8H82BpKLPa5KbRvyw4DNjwbSdmWfdC0nfAOHctsz2GrzHGll
         AzhLyuFrnao3V2/ErrocgJpwdGZNeryKHZc8eLXYhGU+AKor4kPkkq1y2iMFKKEyEdwR
         FycA==
X-Gm-Message-State: AAQBX9fjlqfu4ivdCeUVF0rJY0MrTsEzZ+iaRbl4QimOZvtDSn3HZVml
	X8nDC3fiAxZDy94nCzndFb2+j2OwaLP9w5PfmE0=
X-Google-Smtp-Source: AKy350ZbjxgZoee3SG7STHRsvuzR6nW94qRQoaRfeuGn9gUgoAa9/bT0GM8UpFH+/h0c8QZDwvlvxiwIQBCZrXm3bOM=
X-Received: by 2002:a17:906:6447:b0:94e:e30e:7245 with SMTP id
 l7-20020a170906644700b0094ee30e7245mr8271124ejn.8.1682271289582; Sun, 23 Apr
 2023 10:34:49 -0700 (PDT)
MIME-Version: 1.0
References: <0f087629-810d-f0e0-bf0b-05ca5defc16d@gmail.com>
 <05e3b9de-ee38-97b6-7f39-5b6f7de1674f@gmail.com> <CAFBinCAdXE+3VrPJAoik_0TFW6TsB0033s+fTYUTNehPrn=PZg@mail.gmail.com>
 <ZDfHtvZawSWWGTRP@orome> <CAFBinCBNA_AWy63P9RwSU98xNJ1-F8KHJWm9Dq1kmrZ7aFbpJw@mail.gmail.com>
 <ZD0Q-fUjMKRrPjXn@orome>
In-Reply-To: <ZD0Q-fUjMKRrPjXn@orome>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 23 Apr 2023 19:34:38 +0200
Message-ID: <CAFBinCBeoAb_VKyBfSHWz=AAmiJV+FmzfS4yR_zXUEu==Vfbqg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] pwm: meson: make full use of common clock framework
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-pwm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_103452_366374_F88530CA 
X-CRM114-Status: GOOD (  14.50  )
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

T24gTW9uLCBBcHIgMTcsIDIwMjMgYXQgMTE6MjfigK9BTSBUaGllcnJ5IFJlZGluZwo8dGhpZXJy
eS5yZWRpbmdAZ21haWwuY29tPiB3cm90ZToKWy4uLl0KPiBJdCBzZWVtcyB0byBtZSBsaWtlIHJl
YWxseSB5b3VyIG9ubHkgb3B0aW9uIGlzIHRvIGNvbXBsZXRlbHkgaGlkZSB0aGF0Cj4gY2xvY2sg
ZnJvbSBMaW51eC4gRXZlbiBpZiB5b3UgdXNlIENMS19JR05PUkVfVU5VU0VELCB5b3UgY291bGQg
c3RpbGwgcnVuCj4gaW50byBhIHNpdHVhdGlvbiB3aGVyZSB0aGUgY2xvY2sgZ2V0cyB0dXJuZWQg
b2ZmLgo+Cj4gQWN0dWFsbHkgdGhlIHNhbWUgaXMgdHJ1ZSBvZiB0aGUgUFdNIGNoYW5uZWwuIE9u
Y2UgdGhlIFBXTSBjaGFubmVsIGlzCj4gcmVnaXN0ZXJlZCBzb21lYm9keSBjb3VsZCB0cnkgYW5k
IHVzZSB0aGUgc3lzZnMgaW50ZXJmYWNlIHRvIGNvbnRyb2wgaXQuCj4gU28gZXZlbiBpZiBub3Ro
aW5nIGluIHRoZSBEVCBtYWtlcyB1c2Ugb2YgdGhlICJyZXNlcnZlZCIgUFdNIGNoYW5uZWwsCj4g
cGVvcGxlIGNvdWxkIHN0aWxsIHRyeSB0byB1c2UgaXQsIHdoaWNoIG1lYW5zIHRoYXQgZXZlbiBp
ZiB0aGUgY2xvY2sKPiB3ZXJlIHRvIHJlbWFpbiBhbHdheXMgb24sIHNvbWVib2R5IGNvdWxkIG1v
ZGlmeSB0aGUgcGVyaW9kIGFuZAo+IGRlc3RhYmlsaXplIHRoZSBDUFUuCj4KPiBJIHRoaW5rIHJl
c2VydmluZyBzcGVjaWZpYyBQV00gY2hhbm5lbHMgaXMgdGhlIG9ubHkgd2F5IHRvIHNhZmVseSBt
YWtlCj4gdGhpcyB3b3JrLiBQZW9wbGUgY291bGQgc3RpbGwgYWJ1c2UgdGhpcyBieSBwYXRjaGlu
ZyB0aGUgRFQsIGJ1dCBvbmNlCj4geW91IGNhbiBkbyB0aGF0LCB5b3UgY2FuIHByb2JhYmx5IGRv
IGEgd2hvbGUgYnVuY2ggb2Ygb3RoZXIgdGhpbmdzIGFzCj4gd2VsbCwgc28gaWYgdGhlcmUncyBu
byBoYXJkd2FyZSBtZWNoYW5pc20gdG8gcHJldmVudCBhY2Nlc3MgdG8gdGhlIFBXTQo+IGNoYW5u
ZWwsIHRoYXQncyBhYm91dCBhcyBnb29kIGFzIGl0J2xsIGdldC4KSSBhZ3JlZSB3aXRoIHlvdS4g
SXQgc2hvdWxkIGJlIGRvbmUgaW4gYSBzZXBhcmF0ZSBwYXRjaChzZXQpLCBub3QgYXMKcGFydCBv
ZiB0aGlzIENDRiBjb252ZXJzaW9uIGFzIHRoZSBpc3N1ZSB3aGljaCB5b3UgbWVudGlvbiBpcyBh
bHJlYWR5CnByZXNlbnQgZXZlbiB3aXRob3V0IEhlaW5lcidzIGNoYW5nZXMuCgoKQmVzdCByZWdh
cmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
