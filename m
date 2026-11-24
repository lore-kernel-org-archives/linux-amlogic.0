Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32E8606A683
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Nov 2026 21:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aX+oG0rd;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=DdAg+oy4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=J5lBEDaGD7s/IQ6F18EgRg2l6S+8tM3T4l+JHkUBFeA=; b=aX+oG0rdlqQlGsw+uO4y6bHYeD
	5MVTxx4AaQpXMD/javiusMdY7rFNiT/pXf5lOLTCMzuzHXR1cysAY1codnYtdlb+OMbBUkSidnQUk
	xgaj6l3seEpCl3QMsloUfFKLwhtzTK2ZwxSsVMQ+JX+J+8O+OWNMUzizdRdB4/q3Xr/6JSYSvJ0di
	UGXnm9Xqcj9cB26qDAF4BtZqeaM/P5UxoilAyeQwQ7P/Vmhrfen6euVKvl4Y7vamUc5rLQuw9VsFI
	TScxCvdUNPAjE4aoe+7Jbv9B4mU2g4T+rZZ3A75ZwfB+6oE/zaZEEjAVljHTzNA+lpOxdpc5lWnOy
	EK1SS1xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyRG-00000007vhp-05YM;
	Tue, 24 Nov 2026 21:52:34 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyRC-00000007veo-0BNT
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Nov 2026 21:52:32 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-8b4dd5cb4f6so34633147b3.2
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Nov 2026 13:52:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795557149; cv=none;
        d=google.com; s=arc-20260327;
        b=FalQizjpE6Vx6tsrROpNLrtmevjPs/IXitmLkAn+uLnh6PoSVkZ879VgC8fci5en/U
         wMbIWdPaMfySUSEpnV1yVkj6dcOoSmYcoB3FQzDRRPHnEkLw9BsIzra4TdqEBidmGNBW
         REvWRQLMXYu4QtuDVepRtErPIgpEfLgZ/6264XVY0b27vGgn9kW3Be9Q9Z8/rj4YwNUy
         NDjXwNK0Vzy/BDV1OhDr5rt0K2rOwgACU/XDqDeFSP7txgEXzLEbys+D0S7MMxQjb9JJ
         WpQhsZFVlxcq1ZE3deuh4YcYhllCRhy9cbqlUkoqfHbCEPiVaReuoyzHLjK6Aw/lzs9D
         mfpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lf1Y3VuyPwvovOGVJHv+EhVFPSKZjC4cG/I119XVXRE=;
        fh=EsxOeAebfry8zLYWZVJq8EBnGOSz6RllUr8B6PC2CfA=;
        b=A1qACjE7+kR2pTqhqN3B7GgjMNbYP51bIdiTiQzTTWbSVUA6aTTXoOmixP+FOw5rRf
         Zjf0MNC9tDnSjDRXtso+n4+Lt24HIyXhdU3k96gW2bjCoLEvIONDqD1oAcFfnvPdDkz3
         zPOlltpW04WIO+WiAIQbQNy8cfsnd7VEI9XP5NP9KiurbyA0t7DccErmNWympD0vapsG
         KuRzez1nJdpMJ4ejUcEAgbkj2R/Xrv5KRHd3tnKMBMljoasoJ6MTStIVmZ6uW9+2sa6w
         eLB9RtmpppztM/cCOY6caCOAgMXXwZZJCt22Uld9uQYFwBIT5Sg8DIqgmVjUPU1h0iNC
         wTkw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795557148; x=1796161948; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lf1Y3VuyPwvovOGVJHv+EhVFPSKZjC4cG/I119XVXRE=;
        b=DdAg+oy4/TFQRjqvjVCz6n7+9qs8ERhv7hdLjaRdb6Dv4OTN/DuNqzlv71+U+oMq6s
         bmbAMs4FymVpk7UYFxdprtPU0k1j2jR6Ehq545QmZ10QztyclytxWWRyd0WcBfv5taFq
         YIZTPWK+bZl1G4bX63QcFXTNeUdkMxQtPW+h9KOArPzNWwDOjOXTgJ5mq22Ky0Libtsl
         YCo485NHc9e5sdjf2ugtsI17GTor3u40dggle0M9W3113+4qZdTdzuWnPvANZOMujjnB
         NL4aSk929GOGd0p42pEMnOFMP4xqqhRjZxDA20D4IuOkaf45jmH+rMHBYyNSrUkuCgRI
         yUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557148; x=1796161948;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lf1Y3VuyPwvovOGVJHv+EhVFPSKZjC4cG/I119XVXRE=;
        b=mJ6zrXo/ceYT+PjWjtoA+/eicBkVudxoyT3B+tSdcBUsstDHESpYBom+F1aCR9dNHI
         Z78yCk5mC+bjfDRPIzhCfVR8UsEO11LKG+4JHObOB02UyWnXKRciZvtM0ddOdj9SK+FA
         /fdMCBRgWZLdOFN234lCfCp8hi303q9N2EdR2rt/l6bkBWrAlmdLu3NnQX5JilupnPiz
         HL7ni6XfFTA1sQPpH5OaoHNJLei3nb3r/kamTD1dgSeouMEjg7CGua+ur9KFSLpZoyoX
         BM23li1Zbu9mZr1dW1S8EFd8KF6MH7nYpdUa6OfuI1KpSuLYeQ1amH8sb59Yq+dtXsZY
         TkuQ==
X-Forwarded-Encrypted: i=1; AL+hErGbnH4vKoUF7fM60eTZvMVlzHOb52CAUaLSMa1KTYKixrdNavsFgLvbS7G7Gw+n9fufx+zfZrRLbMeEhgaH@lists.infradead.org
X-Gm-Message-State: APuU4Z/hQbbCXDOFvSKQhaLaaWZ/quCgoIKIyjX9/0MZ5dQYDnmGs60H
	r/U8w2sn28EGM9cd/iqCRh9OiBHI6XnZbc+c7xeNpgBD3DQ3gwoILEZeF50jrRXWk531QJXcJR9
	p7ItWusKPZEL3rBhejOHeQupF7h26noQ=
X-Gm-Gg: AZFdTZcFCWPdHG292J2+VAH4juxzO8r+6cHydgzZ599IuYIuioA6zt8BLu137se1ptp
	o02yXUrfq6WHbF+Qgr5KqpVAMpcWpukCBvHSOZ/bRDRSxx2oLV3tymegL2DLyI5yhIiL1LOXRmR
	y2DAhKZbBUTEZVf8+qAOMuM6HENY5llaNTtyHEhsyd6cffsTmu0Rr0FrFzD+wIsQQUiMXXeofhk
	ILnE7RmN9ZLLHo+E/cJjEIRziXPfsuRbISKYuC4fSrNrC6jMbf78SXNBfBafgzMncNm21WNWZBw
	acRe6/mCc+07tgstjovlb+aQBs6MpsUDBDgR2dScsLcH4JqmOy/nJLZ8mpKikaKxIsixjeDpzCx
	Ky4FCPEeXsQDAaJVKEMjTaEewuNr2L6XdSPbctyIDzc0DzsafyhXBC0X76dO/RGeaZSXP1Q==
X-Received: by 2002:a05:690c:6d87:b0:88f:ccf7:25d9 with SMTP id
 00721157ae682-8b520504b49mr86018497b3.60.1795557148692; Tue, 24 Nov 2026
 13:52:28 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117-g12a-mux-data-path-v2-1-fc56db5973af@iav.lv>
 <CAFBinCALe-8oB5Mwpyx-B_7dKJ-WZcMCjycHv=xH+JasRBOaPw@mail.gmail.com> <20261124-re-martin-g12a-mux-t7@iav.lv>
In-Reply-To: <20261124-re-martin-g12a-mux-t7@iav.lv>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 22:52:18 +0100
X-Gm-Features: Aa3M54pdaFD27QxQGunyvXHUItWwaVO9EDUyn4_5FJjuusCb-0isvsezb1c1rbA
Message-ID: <CAFBinCB3auaxcJ4wV+Q-KS4hBKfacrPpu_X9BAVBirAuMNbDvw@mail.gmail.com>
Subject: Re: [PATCH net v2] net: mdio: mux-meson-g12a: keep the MAC data path
 when switching MDIO
To: Igor Velkov <iav@iav.lv>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Lucas Tanure <tanure@linux.com>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_135230_117423_B67DBD7E 
X-CRM114-Status: GOOD (  22.67  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgSWdvciwKCk9uIFR1ZSwgTm92IDI0LCAyMDI2IGF0IDEwOjMx4oCvUE0gSWdvciBWZWxrb3Yg
PGlhdkBpYXYubHY+IHdyb3RlOgo+Cj4gSGkgTWFydGluLAo+Cj4gT24gVHVlLCBOb3YgMjQsIDIw
MjYgYXQgOTo1MCBQTSBNYXJ0aW4gQmx1bWVuc3RpbmdsCj4gPG1hcnRpbi5ibHVtZW5zdGluZ2xA
Z29vZ2xlbWFpbC5jb20+IHdyb3RlOgo+ID4gSSBoYXZlIGp1c3QgcmV2aWV3ZWQgTHVjYXMgcGF0
Y2ggWzBdIHdoaWNoIGFkZHMgRXRoZXJuZXQgc3VwcG9ydCBmb3IgdGhlIFQ3IFNvQy4KPiA+IEhl
IGtlcHQgdGhlIGludGVybmFsIE1ESU8gbXV4IHBhdGggZGlzYWJsZWQgYnkgZGVmYXVsdCwgc28g
Ym9hcmRzCj4gPiB1c2luZyBpdCB3aWxsIGhhdmUgdG8gZW5hYmxlIGl0Lgo+ID4gSGF2ZSB5b3Ug
dGVzdGVkIHRoYXQgYXBwcm9hY2ggYXMgd2VsbD8gSWYgbm90OiBpdCB3b3VsZCBiZSBncmVhdCBp
Zgo+ID4geW91IGNvdWxkIGludmVzdGlnYXRlIHRoZSBwcm9zL2NvbnMgb2YgeW91ciBhcHByb2Fj
aCB2cy4gTHVjYXMnCj4gPiBhcHByb2FjaC4KPgo+IE5vdCBvbiBoYXJkd2FyZS4gQnkgdGhlIGNv
ZGUgaXQgd29ya3M6IG1kaW8tbXV4IHJlZ2lzdGVycyBvbmx5IHRoZQo+IGF2YWlsYWJsZSBjaGls
ZCBidXNlcywgYW5kIHRoZSBnMTJhIGRyaXZlciB3cml0ZXMgQ05UTDIgb25seSBmcm9tCj4gc3dp
dGNoX2ZuLiBXaXRoIGludF9tZGlvIGRpc2FibGVkIHRoZSBpbnRlcm5hbCBidXMgbmV2ZXIgZXhp
c3RzLCBzbwo+IENOVEwyIG9ubHkgZXZlciBnZXRzIHRoZSBleHRlcm5hbCBzZXR0aW5nLgo+Cj4g
QnV0IHRoYXQgYXZvaWRzIHRoZSBidWcgcmF0aGVyIHRoYW4gZml4ZXMgaXQuIFRoZSBNRElPIHNv
dXJjZSBhbmQgdGhlCj4gZGF0YSBwYXRoIGFyZSBzZXBhcmF0ZSBDTlRMMiBiaXRzOyB0aGUgZHJp
dmVyIHN3aXRjaGVkIHRoZW0gdG9nZXRoZXIuCj4gRGlzYWJsaW5nIGludF9tZGlvIG9ubHkga2Vl
cHMgdGhhdCBwYXRoIGZyb20gcnVubmluZywgYW5kIG9ubHkgb24KPiBib2FyZHMgd2hvc2UgRFQg
ZG9lcyBpdC4gVGhlIEcxMkEvRzEyQi9TTTEvUzQvQzMgZHRzaSBlbmFibGUgaW50X21kaW8sCj4g
YW5kIHRlbiBib2FyZHMgdXNlIHRoZSBpbnRlcm5hbCBQSFkgcmVseWluZyBvbiB0aGF0LiBDaGFu
Z2luZyB0aGUKPiBkZWZhdWx0IHRvdWNoZXMgYWxsIG9mIHRoZW0sIGFuZCBleGlzdGluZyBEVEJz
IGtlZXAgdGhlIGJ1Zy4KPgo+IFRoZSBkcml2ZXIgY2hhbmdlIHJlbW92ZXMgdGhlIGNvdXBsaW5n
OiB0aGUgZGF0YSBwYXRoIGZvbGxvd3MgdGhlIFBIWQo+IHRoZSBNQUMgYXR0YWNoZXMsIHdpdGgg
YW55IERUQi4gRm9yIGEgbmV3IFNvQyBsaWtlIFQ3LCBpbnRfbWRpbwo+IGRpc2FibGVkIGluIHRo
ZSBkdHNpIGlzIG9yZGluYXJ5IERUIHByYWN0aWNlLCBhbmQgdGhlIHR3byBjb21iaW5lLiBJZgo+
IG9uZSBoYXMgdG8gcGljaywgdGhlIGRyaXZlciBjaGFuZ2U6IGl0IGZpeGVzIHRoZSBjYXVzZS4K
QWxsIG9mIHRoaXMgc291bmRzIHJlYXNvbmFibGUuCldoYXQgY2F1Z2h0IG15IGV5ZSBpcyB0aGF0
IHRoZSBjb2RlIG5vdyByZWFkcyBzdHJhbmdlOiB3ZSBoYXZlIGEgbXV4CnRoYXQgd2UncmUgZm9s
bG93aW5nIGZvciBoYWxmIG9mIHRoZSByZWdpc3RlciB2YWx1ZXMgd2hpbGUgYW5vdGhlcgpwYXJ0
IGlzIGZpeGVkIGF0IHByb2JlIHRpbWUuCgpJIGRvbid0IGtub3cgc3RtbWFjLCBwaHlsaWIgbm9y
IG1kaW8tbXV4LW1lc29uLWcxMmEgZW5vdWdoIHRvIHBvaW50Cm91dCBhbiBhbHRlcm5hdGl2ZSBz
b2x1dGlvbi4KU28gdW50aWwgc29tZW9uZSBjb21lcyB1cCB3aXRoIGEgYmV0dGVyIHBsYW4geW91
J3JlIHBhdGNoIGFuZApkZXNjcmlwdGlvbiBpcyB0aGUgYmVzdCB3ZSBoYXZlLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
