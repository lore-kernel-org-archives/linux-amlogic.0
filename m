Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098B2C77B71
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Apr 2023 18:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iAM/FTiLSRGbdrFAtLcAH0UMning8ZGii5F37YymWJI=; b=r0AjzzGyZAFh0d
	bFval0bwuYyRZdHp3c0+5XUAySMdrsVevRBjTG35z+U0NOb18qnHYc95MNhvalfHjDViioGBLmF2s
	9DNFQRwQ9zsfgHDVnK45Hs2j0FzB0n9AsnFfHQaICIqtt8AWxyGVrP1Cxk82CWd+JCUSlyyGuQz+e
	hhiXYvwm/HGoLaizG4cwchFH/ymSg2rgnnfQaRj0FKuCG+5LmdJgyeYTtuRzJH/USyyPgPD88mtG9
	B90tSczg15Ijo5/ddHU3e1V8Nr6gkS1gcmPCeT4F5osrCdhzdhE4aTqUTPbnQPmTBjwJXwARvBN9Y
	1N3Hcj0/UMj8nBv/t8Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnOF2-00AN8b-0i;
	Fri, 14 Apr 2023 18:33:48 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnOEw-00AN7V-2a;
	Fri, 14 Apr 2023 18:33:46 +0000
Received: by mail-ej1-x62e.google.com with SMTP id xi5so47840152ejb.13;
        Fri, 14 Apr 2023 11:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1681497219; x=1684089219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIf6PYuTjDTDHZxGxsSMTjaI/J6LADqJdodTRE67zC4=;
        b=BWz02PudPMpPBmM3O7sRMjTt+Erp3EezqseLR6UBuN2fYZMcS2FlW71o3bAAYmsGwQ
         eElZGlGM5DnW4Um2jxqed5mn7CA/JIWIULrCSSNBruZOGqVholmRgo/1NPNrobho3CX5
         1sQAY43kep/S5g21zAsYkKKPAmeGu+/DvnOmDwWiqRJuTBIguMjBR1zVAdtk5S6J1L/9
         3gZB+MX55jAjRuSgzxfHutPh7DLsYWkOn4iE85AQo1iGbtUqH5daEL6HkDJy2WA9V+v4
         THZDWGDTOs/uZI1jJO+LJLyHDd5Fx7ooOVxej/OFCzM6OJLGbF+M15wHkc8pfUCOkrqN
         QTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681497219; x=1684089219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eIf6PYuTjDTDHZxGxsSMTjaI/J6LADqJdodTRE67zC4=;
        b=UMK6XBEfoo9UvnBqkZ09qAGuzgO+aWdfP1+x2DR2et5iox3VGQ5H6x9e7a7+i9hN1e
         zZIM2WpI4lAPE7wxNz3z0+benDBB5k91KkJEf1mx4P76sjqa5VejR96m94YnZMu1BcZI
         +fR8wNrm0UgtGpr6ilX70r2/JVcTJIwCRH2KicU58kP6WP0pXAe4M/tW8Qf0LDM2/JQ/
         vXdkFDotlKB40SKjfwoTeFLZ9fDETjSRHRHCzERFCP7+aSUGbCjSPTh6ips303lI8cqV
         lOKK2c9me+e7eaVYCELdSrNJ+xyVohTtHqAHeiHJeGcZVvK4pfVLE8waJ2HHrEPMIkNQ
         4mnw==
X-Gm-Message-State: AAQBX9fgHw9z8iJFQodrVwGN7qL7AaHOl6+2QgH+BgG4zcv+lKvc+ooh
	IJ0gQuFSLi10u2G1ytpB+VNz3XapLh3XeT2OQI8=
X-Google-Smtp-Source: AKy350YLXEmAtJNKJkWEz0hfaThJ0i/fMSrBL73kyK/Fo8i+L6Gtxeq6N1a2coyzpmofmBTresfqmpVzK2LvD4vlm/o=
X-Received: by 2002:a17:906:af05:b0:933:1b05:8851 with SMTP id
 lx5-20020a170906af0500b009331b058851mr78793ejb.16.1681497219400; Fri, 14 Apr
 2023 11:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <0f087629-810d-f0e0-bf0b-05ca5defc16d@gmail.com>
 <05e3b9de-ee38-97b6-7f39-5b6f7de1674f@gmail.com> <CAFBinCAdXE+3VrPJAoik_0TFW6TsB0033s+fTYUTNehPrn=PZg@mail.gmail.com>
 <ZDfHtvZawSWWGTRP@orome>
In-Reply-To: <ZDfHtvZawSWWGTRP@orome>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 14 Apr 2023 20:33:28 +0200
Message-ID: <CAFBinCBNA_AWy63P9RwSU98xNJ1-F8KHJWm9Dq1kmrZ7aFbpJw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] pwm: meson: make full use of common clock framework
To: Thierry Reding <thierry.reding@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-pwm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_113342_855890_D1F022D9 
X-CRM114-Status: GOOD (  30.11  )
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

SGVsbG8gVGhpZXJyeSBhbmQgSGVpbmVyLAoKT24gVGh1LCBBcHIgMTMsIDIwMjMgYXQgMTE6MTPi
gK9BTSBUaGllcnJ5IFJlZGluZwo8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPiB3cm90ZToKPgo+
IE9uIFR1ZSwgQXByIDExLCAyMDIzIGF0IDA5OjQ4OjQ2UE0gKzAyMDAsIE1hcnRpbiBCbHVtZW5z
dGluZ2wgd3JvdGU6Cj4gPiBPbiBUdWUsIEFwciAxMSwgMjAyMyBhdCA5OjI24oCvUE0gSGVpbmVy
IEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiBbLi4uXQo+ID4gPiAr
ICAgICAgICAgICAgICAgaW5pdC5uYW1lID0gbmFtZTsKPiA+ID4gKyAgICAgICAgICAgICAgIGlu
aXQub3BzID0gJmNsa19nYXRlX29wczsKPiA+ID4gKyAgICAgICAgICAgICAgIGluaXQuZmxhZ3Mg
PSBDTEtfU0VUX1JBVEVfUEFSRU5UOwo+ID4gQXMgbXVjaCBhcyBJIGRvbid0IHdhbnQgaXQ6IEkg
dGhpbmsgd2UgbmVlZCBDTEtfSUdOT1JFX1VOVVNFRCBoZXJlIGFzIHdlbGwgOi0oCj4gPiBPbiBH
WEJCLCBHWEwgYW5kIEdYTSBTb0NzIHRoZSBib2FyZCBkZXNpZ24gdHlwaWNhbGx5IHVzZXMgUFdN
Cj4gPiByZWd1bGF0b3JzIChsaWtlIHRoZSBib2FyZHMgdXNpbmcgMzItYml0IFNvQ3MgYXMgd2Vs
bCBhcyBuZXdlciBib2FyZHMKPiA+IHVzaW5nIEcxMkEgb3IgbGF0ZXIgU29DcykuCj4gPiBUaGlz
IG1lYW5zOiBpZiB3ZSBlbmFibGUgdGhhdCBQV00gY29udHJvbGxlciBhbmQgb25lIG9mIHRoZSBj
aGFubmVscwo+ID4gaXMgZmlybXdhcmUgbWFuYWdlZCBhbmQgdGhlIG90aGVyIGlzbid0IHRoZW4g
d2UgY2FuIGVuZCB1cCBkaXNhYmxpbmcKPiA+IHRoZSBjbG9jayAtIHRha2luZyBhd2F5IFZDQ0sg
KHdoaWNoIHN1cHBsaWVzIHRoZSBDUFUpIG9yIFZEREVFICh3aGljaAo+ID4gc3VwcGxpZXMgR1BV
IGFuZCB2YXJpb3VzIG90aGVyIGNvbXBvbmVudHMpLgo+ID4gSSdkIGJlIGhhcHB5IGlmIHRoZXJl
IGFyZSBvdGhlciBzdWdnZXN0aW9ucyBhcm91bmQgdGhpcyB0aG91Z2guCj4KPiBXaGF0IGV4YWN0
bHkgZG9lcyAiZmlybXdhcmUgbWFuYWdlZCIgbWVhbj8gVHlwaWNhbGx5IHdlIGRlc2NyaWJlIGFs
bAo+IHN1cHBsaWVzIGluIERUIHRvIGF2b2lkIHRoZXNlIGtpbmRzIG9mIHdvcmthcm91bmRzLiBJ
ZiBWQ0NLIGFuZC9vciBWRERFRQo+IGFyZSBQV00tY29udHJvbGxlZCByZWd1bGF0b3JzIHRoYXQg
c2hvdWxkIG5ldmVyIGJlIHR1cm5lZCBvZmYsIGNhbiB0aGV5Cj4gbm90IHNpbXBseSBiZSBhZGRl
ZCB0byBkZXZpY2UgdHJlZSBhbmQgbWFya2VkIGFzICJhbHdheXMtb24iPyBUaGF0IHdvdWxkCj4g
cHJvcGFnYXRlIHRvIHRoZSBQV00gYW5kIG1ha2Ugc3VyZSB0aGUgY29ycmVzcG9uZGluZyBjbG9j
ayByZW1haW5zCj4gZW5hYmxlZC4KTW9zdCBBbWxvZ2ljIGJvYXJkcyB1c2UgUFdNLWNvbnRyb2xs
ZWQgcmVndWxhdG9ycy4gVGhlcmUncyB0aHJlZSBTb0MKZ2VuZXJhdGlvbnMgSSBrbm93IG9mIHRo
YXQgYXJlICJzcGVjaWFsIiB3aGVuIGl0IGNvbWVzIHRvIG1hbmFnaW5nCnRoZXNlIHJlZ3VsYXRv
cnMgKGFuZCBDUFUgY2xvY2tzKSB0aG91Z2guCkxldCdzIHN0YXJ0IHdpdGggdGhlIHNpbXBsZSBv
bmVzOiBNZXNvbjgvOGIvOG0yLCBHMTJBLCBHMTJCLCBTTTEgKGFuZApJIGFzc3VtZSBuZXdlciBn
ZW5lcmF0aW9ucyBhcyB3ZWxsKTogaGVyZSB0aGUgUFdNIHJlZ3VsYXRvcnMgYXJlCm1hbmFnZWQg
YnkgTGludXguClRoZW4gdGhlcmUncyB0aGUgc3BlY2lhbCBjYXNlczogR1hCQiwgR1hMIGFuZCBH
WE0gd2hpY2ggcnVuIGEgU0NQSQpmaXJtd2FyZSBmb3IgbWFuYWdpbmcgdGhlIENQVSBjbG9ja3Ms
IHJlZ3VsYXRvcnMgYW5kIHN1c3BlbmQuCgpTQ1BJIGZpcm13YXJlIGlzIHJ1bm5pbmcgaW4gdGhl
ICJzZWN1cmUgd29ybGQiLCB3aGlsZSBMaW51eCBpcyBydW5uaW5nCmluIHRoZSAibm9ybWFsIHdv
cmxkIi4KSSBkb24ndCBrbm93IGlmIHRoZXJlJ3MgYm9hcmRzIHdpdGggc2VjdXJlIGJvb3QgdGhh
dCBsb2NrIExpbnV4IG91dApmcm9tIHRoZSBQV00gYW5kIENQVSBjbG9jayByZWdpc3RlcnMuClRo
aXMgbWVhbnM6IHNvIGZhciB3ZSd2ZSBsZWZ0IGFueSBQV00gY29udHJvbGxlciBzZXR0aW5ncyB0
aGF0IHJlbGF0ZQp0byB0aGUgcmVndWxhdG9ycyB1cCB0byB0aGUgU0NQSSBmaXJtd2FyZSwgbm90
IG1lc3Npbmcgd2l0aCBhbnkgb2YgdGhlCnJlZ2lzdGVycyBmcm9tIExpbnV4LgoKTXkgY29uY2Vy
biBpcyBmb3IgZXhhbXBsZSB3aXRoIHRoZSBLaGFkYXMgVklNMiwgc2VlIGl0J3Mgc2NoZW1hdGlj
cyBbMF0gcGFnZSA0OgotIFBXTV9DIGlzIHVzZWQgdG8gbWFuYWdlIHRoZSBWRERFRSByZWd1bGF0
b3IgKEkgc3VzcGVjdCB0aGF0IHRoZXJlJ3MKYSB0eXBvIHRob3VnaCBhbmQgaXQgc2hvdWxkIGJl
IGNhbGxlZCBWRERFRV9QV01fQywgYnV0IHRoZSBzY2hlbWF0aWNzCnN0YXRlIHRoYXQgdGhlIHNp
Z25hbCBpcyBjYWxsZWQgIlZEREVFX1BXTV9EIikKLSBQV01fRCBjYW4gcm91dGVkIHRvIHRoZSBH
UElPIGhlYWRlcnMKTm93IGlmIGEgdXNlciBlbmFibGVzICZwd21fY2QgKHRoZSBQV00gY29udHJv
bGxlciByZXNwb25zaWJsZSBmb3IKY2hhbm5lbCBQV01fQyBhbmQgUFdNX0QpIHRvIHVzZSBQV01f
RCBvbiB0aGUgcGluIGhlYWRlciB3ZSBkb24ndCB3YW50CnRvIHR1cm4gb2ZmIFBXTV9DIGJ5IGFj
Y2lkZW50LgpUdXJuaW5nIFBXTV9DIG9mZiBieSBhY2NpZGVudCBjYW4gaGFwcGVuIGlmIHdlIHJl
Z2lzdGVyIHRoZSBjbG9jayBnYXRlCmFuZCBkb24ndCBoYXZlIGEgY29uc3VtZXIgZm9yIGl0LiBD
Q0YgKGNvbW1vbiBjbG9jayBmcmFtZXdvcmspIGNhbgp0aGVuIGp1c3QgdHVybiBvZmYgdGhhdCBj
bG9jayBiZWNhdXNlIGl0J3MgdW51c2VkLiBUaGlzIHdvdWxkIGxvY2sgdXAKdGhlIGJvYXJkIGJl
Y2F1c2UgVkRERUUgaXMgdXNlZCBmb3IgY3JpdGljYWwgZnVuY3Rpb25hbGl0eSBvbiB0aGUgU29D
LgoKVHdvIGV4dHJhIHF1ZXN0aW9ucyBmcm9tIEhlaW5lcjoKPiBJIGNoZWNrIHJlZ2FyZGluZyBU
aGllcnJ5J3MgY29tbWVudCBhbmQgZm91bmQgdGhlIHZkZGNwdQo+IHB3bS1yZWd1bGF0b3JzIGRl
c2NyaWJlZCBpbiB0aGUgRFQncy4gSXMgeW91ciBjb25jZXJuIHRoYXQKPiBub3QgZm9yIGFsbCBi
b2FyZHMgdGhlIHZkZGNwdSBwd20tcmVndWxhdG9yIGlzIGRlc2NyaWJlZCBpbgo+IHRoZSBEVD8K
Q29ycmVjdCwgYm9hcmRzIHRoYXQgaGF2ZSB0aGUgcHdtLXJlZ3VsYXRvcnMgZGVzY3JpYmVkIGlu
IHRoZWlyIC5kdHMKKHR5cGljYWxseSB0aGUgYm9hcmRzIHVzaW5nIGEgTWVzb244LzhiLzhtMiwg
RzEyQSwgRzEyQiBvciBTTTEgU29DKQphcmUgbm90IGEgcHJvYmxlbS4KT25seSB0aGUgb25lcyB0
aGF0IGRvbid0IGRlc2NyaWJlIHRoZSBwd20tcmVndWxhdG9ycyBpbiB0aGVpciAuZHRzIGFyZQph
biBpc3N1ZSBhcyB0aGVzZSBhcmUgbWFuYWdlZCBieSB0aGUgU0NQSSBmaXJtd2FyZS4KCj4gQUZB
SUNTIHB3bSBjaGFubmVscyBhcmUgaW5kZXBlbmRlbnQuIEhvdyBjYW4gc3dpdGNoaW5nCj4gb2Zm
IHRoZSBjbG9jayBmb3Igb25lIGNoYW5uZWwgYWZmZWN0IHRoZSBvdGhlciBjaGFubmVsPwpJdCdz
IG5vdCBhYm91dCBvbmUgY2hhbm5lbCBhZmZlY3RpbmcgdGhlIG90aGVyLiBNeSB0aG91Z2h0IGlz
IHRoYXQKQ0NGJ3MgImRpc2FibGVkIHVudXNlZCBjbG9ja3MiIGZlYXR1cmUgd2lsbCB0dXJuIG9m
ZiB0aGUgY2xvY2sgaWYgaXQncwpub3QgdXNlZC4gU2luY2UgU0NQSSBmaXJtd2FyZSB1c2VzIGl0
LCBMaW51eCBkb2Vzbid0IGtub3cgdGhhdCBDQ0YgbWF5CmRpc2FibGUgdGhlIGNsb2NrIHVubGVz
cyBDTEtfSUdOT1JFX1VOVVNFRCBpcyBzZXQuCgpJIGhvcGUgdGhpcyBtYWtlcyBzZW5zZS4gSWYg
eW91IGhhdmUgYW55IGFkZGl0aW9uYWwgcXVlc3Rpb25zIHRoZW4KZmVlbCBmcmVlIHRvIGFzay4K
CgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKClswXSBodHRwczovL2RsLmtoYWRhcy5jb20vcHJvZHVj
dHMvdmltMi9zY2hlbWF0aWMvdmltMl9zY2hfdjEyLnBkZgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
