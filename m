Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FE0C83F0A
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jul 2025 11:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=je2T/Ss3lMml8GSm8+HzfgLHDlNmz2HN6yAwgc1CAZU=; b=TTQRc6UuLgWtch
	o7YtEuAfdW7s+9t2MpGrcvgRtv+3deu2z3KvI5g+Ugn6ofAx9ONKccgqkr132wPgMOxdKSBQQvJv6
	jNLvVcTjIVbO1vaMTQ5KOVD1C//Jz2tWPuyL4G+s9HcUt+e6QqMxii4/r4Hk5Gq2ph5xLNG6a+Qkm
	8lk4oIewKocY55BSbhCoU1lRY+sMgLrSZ9+Q1QHoOFg8H57ZhCEGVpo+3dFnPWtWwL6AfRMEn5PbD
	OAFVR6wvG2VZZpoZj40OdCIcyBXNGn2/jo5/HzTaiH62P3lR4UnjNrbUM2Rmm9RcYLj3CmfKVAwOo
	6BYGZ5tX3i010UncP7ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZShY-00000008Rvn-2xAF;
	Wed, 09 Jul 2025 11:11:00 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZREd-000000089oo-2fhL
	for linux-amlogic@lists.infradead.org;
	Wed, 09 Jul 2025 09:37:04 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2363616a1a6so50688895ad.3
        for <linux-amlogic@lists.infradead.org>; Wed, 09 Jul 2025 02:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1752053823; x=1752658623; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+LaGhFdH15NRohN6jDSwkhz0ZXYVZii1BB9nePp2aU=;
        b=G5aAPRld/vFqI7jyPURv9zpnvnvNP71SFC4wlNR21b0p/Au9nm+/xI/R+I5J61A5ao
         1/0Y9W5h+ioHmD6cwzB9+tmAys32fSlTGAGC7pt2ehAcpwIHtp9gyjxPcXPQow+TgfxI
         EKSCyY9bWkpWvRmFsFqghyrdd/nYn150z+Onw9WvJsNwyE61gDyiSZkbpQjLePn9jmaJ
         gENCD9pkSnn5atjzNK6QxnaJSDQ5gwMeCFNlSNs+ZBEJosQ/OsKC3CFZWkqi0Rc3H/Wq
         Ah1Uhy9kHOfxdqCYiZ3v3H4dZs27nONdIvclo49deOJ9HvY2G0So5g0zY+QkHZ0cRL6r
         7X+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752053823; x=1752658623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+LaGhFdH15NRohN6jDSwkhz0ZXYVZii1BB9nePp2aU=;
        b=AdybK4AmgzAMUHEmveCywT9ZLGKb79J4oW6yXW7krliaduGWZPbOd4q+jI5oEl4sKW
         j60qFCx5xDHfm8jVZcNKOH/nsrQhfR0M+ovYg5/SJZXvKLLo4+m+1udE/mhqkiUdzBec
         cuw6Pi/k1uaCwkehxaFiuynP/GBMZZwRQAciR04lvVaqNW27v0NkgXF/VFMdKZDXOiNb
         oxUVvsqhvEqWxqkoala3ivDJBadFVDs6wqUKxR/jjumbesvl3Frpg5vrpkuYZZJKH0He
         vJ10TmgLxurOen15YGQ05A9PLkfUhFYIYngbDKkUYSt4BaEok2L0lSvc4tnC2axzyhrX
         +WoA==
X-Forwarded-Encrypted: i=1; AJvYcCXM/eipIGvFTuEVXdH2hWc5bGoDEAF9j3YxUNgC/6xeJ/yArrGcdgDtGegmecAzFKOukpZ8BwDL49k+bjoh@lists.infradead.org
X-Gm-Message-State: AOJu0YyyZcHOie0arxcsc6qlUEOBZ0EeVSsolvUmjFCqThS1smeDbBnG
	/c00q76kJHdrhngthJXPVKnVKE5bnO074ZtLS5mLfBGsgkald/XmRegyvci294AH2UMP7Cyi1UZ
	EE26PYqsZuWcu97gXpzIIPQMbMF0Nsj4MxTgc
X-Gm-Gg: ASbGnctYPp2FEAMQrq6j63PNfrUl/abn3vukEWXei6Y/Q9WGOyVOz6EX9FrNozgrbgR
	FzEy82h0qS/m3uI68vYYjwQv+0BjL/mNfxHzkw1hWZRD+JlroSb6PLFZScW1Pp+QXFGPq4nhQyW
	vBcDTcViYwkACa9OZu4xTkWj1ICJsMiGCAYJUSjbCBCOsYDMrn6WhvM2PWOE59Mvm6b9WN
X-Google-Smtp-Source: AGHT+IEwwywvEzlRHvTTHK1G+2vz8oNtYhpg6zze2DufMOLtj4x+/BetMBVk3t85MV8wrlNO97xNtmt2R0gZv4cwXFg=
X-Received: by 2002:a17:903:287:b0:235:f55d:99cc with SMTP id
 d9443c01a7336-23ddb198289mr32150745ad.2.1752053822733; Wed, 09 Jul 2025
 02:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250704-spisg-v4-0-6b731dfbe610@amlogic.com> <20250704-spisg-v4-2-6b731dfbe610@amlogic.com>
 <CAFBinCB4Lw04StL-kPpzKHPyETKfi5FYFipHRBDDnPdtRVDrmA@mail.gmail.com> <646ef30f-cadb-40ab-a0ad-c493fbdb9709@amlogic.com>
In-Reply-To: <646ef30f-cadb-40ab-a0ad-c493fbdb9709@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 9 Jul 2025 11:36:51 +0200
X-Gm-Features: Ac12FXzaQ629wbNl6vgvdIQIhSzEtFJGPC3mJVuls0iq3-leb4WRKCyFDDxPMKE
Message-ID: <CAFBinCDctqZ_Q2aXOzU514nXBT45GYDHY5-V0cAmZvHkbUR0Mg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] spi: Add Amlogic SPISG driver
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Sunny Luo <sunny.luo@amlogic.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_023703_695403_4AED633F 
X-CRM114-Status: GOOD (  35.19  )
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

SGksCgpPbiBXZWQsIEp1bCA5LCAyMDI1IGF0IDg6MjnigK9BTSBYaWFud2VpIFpoYW8gPHhpYW53
ZWkuemhhb0BhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4KPiBIaSBNYXJ0aW4sCj4gICAgIFRoYW5rcyBm
b3IgeW91ciByZXBseS4KPgo+IE9uIDIwMjUvNy85IDAwOjAxLCBNYXJ0aW4gQmx1bWVuc3Rpbmds
IHdyb3RlOgo+ID4gWyBFWFRFUk5BTCBFTUFJTCBdCj4gPgo+ID4gSGksCj4gPgo+ID4gT24gRnJp
LCBKdWwgNCwgMjAyNSBhdCA1OjA34oCvQU0gWGlhbndlaSBaaGFvIHZpYSBCNCBSZWxheQo+ID4g
PGRldm51bGwreGlhbndlaS56aGFvLmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4g
Wy4uLl0KPiA+PiArICAgICAgIGRpdi0+dGFibGUgPSB0Ymw7Cj4gPj4gKwo+ID4+ICsgICAgICAg
LyogUmVnaXN0ZXIgdmFsdWUgc2hvdWxkIG5vdCBiZSBvdXRzaWRlIG9mIHRoZSB0YWJsZSAqLwo+
ID4+ICsgICAgICAgcmVnbWFwX3VwZGF0ZV9iaXRzKHNwaXNnLT5tYXAsIFNQSVNHX1JFR19DRkdf
QlVTLCBDRkdfQ0xLX0RJViwKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgICBGSUVMRF9Q
UkVQKENGR19DTEtfRElWLCBTUElTR19DTEtfRElWX01JTiAtIDEpKTsKPiA+IEFyZSB5b3UgZG9p
bmcgdGhpcyB0byBwcmV2ZW50IGVycm9ycyBmb3IgdmFsdWUgemVybz8KPiA+IElmIHNvLCBpcyBD
TEtfRElWSURFUl9NQVhfQVRfWkVSTyBhcHBsaWNhYmxlIGluc3RlYWQgKGl0IGhhcyBiZWVuCj4g
PiBkaXNjdXNzZWQgZm9yIHRoZSB0NyBjbG9jayBjb250cm9sbGVyIHJlY2VudGx5OiBbMF0pPwo+
ID4KPgo+IE5vLCBpZiBhZGQgYWRkIGZsYWcgQ0xLX0RJVklERVJfTUFYX0FUX1pFUk8sIHJlZyB2
YWx1ZSB3aWxsIGVxdWFscwo+IGRpdmlkZXIsIHNlZQo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQvdHJlZS9kcml2ZXJz
L2Nsay9jbGstZGl2aWRlci5jP2g9bmV4dC0yMDI1MDcwOAo+IEFzIGZvbGxvdyBpbiBmdW5jdGlv
biBfZ2V0X2Rpdi4KPiAgICAgICAgICAiaWYgKGZsYWdzICYgQ0xLX0RJVklERVJfTUFYX0FUX1pF
Uk8pCj4gICAgICAgICAgICAgICAgICByZXR1cm4gdmFsID8gdmFsIDogY2xrX2Rpdl9tYXNrKHdp
ZHRoKSArIDE7Igo+Cj4gQnV0IGhlcmUgcmVnIHZhbHVlIGFkZGluZyBvbmUgZXF1YWxzIGRpdmlk
ZXIuCkkgc2VlLCB0aGFua3MuCgo+ID4+ICsgICAgICAgLyogUmVnaXN0ZXIgY2xrLWRpdmlkZXIg
Ki8KPiA+PiArICAgICAgIHBhcmVudF9uYW1lc1swXSA9IF9fY2xrX2dldF9uYW1lKHNwaXNnLT5w
Y2xrKTsKPiA+IEluc3RlYWQgb2YgdXNpbmcgX19jbGtfZ2V0X25hbWUgbXkgc3VnZ2VzdGlvbiBp
cyB0byB1c2Ugc3RydWN0Cj4gPiBjbGtfcGFyZW50X2RhdGEgd2l0aCAuZndfbmFtZSBzZXQuCj4g
PiBJZiB5b3Ugd2FudCB0byBzaW1wbGlmeSB0aGUgY29kZSBmdXJ0aGVyIHlvdSBjYW4gdXNlIGhl
bHBlciBtYWNyb3MKPiA+IGxpa2UgQ0xLX0hXX0lOSVRfRldfTkFNRQo+Cj4gaGVyZSBJIGRvbid0
IGtub3cgcGFyZW50IGZ3X25hbWUsIFRoZSBzeXN0ZW0gZG9lcyBub3QgaGF2ZSBhCj4gY29ycmVz
cG9uZGluZyBpbnRlcmZhY2UgdG8gb2J0YWluIHBhcmVudCBmd19uYW1lLCBvbmx5IG5hbWUgKGNs
ay1jb3JlLT5uYW1lKQpUaGUgLmZ3X25hbWUgaXMgc2ltcGx5ICJwY2xrIiBpbiB0aGlzIGNhc2Uu
ClRoYXQgY2xvY2sgaXMgdGhlbiBpbnRlcm5hbGx5IGxvb2tlZCB1cCAoYnkgdGhlIGNvbW1vbiBj
bG9jawpmcmFtZXdvcmspIHVzaW5nIHRoZSAiY2xvY2stbmFtZXMiIGFuZCAiY2xvY2tzIiBwcm9w
ZXJ0aWVzIGZyb20geW91cgpkZXZpY2UtdHJlZS4KClsuLi5dCj4gPj4gK3N0YXRpYyBpbnQgYW1s
X3NwaXNnX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPj4gK3sKPiA+PiAr
ICAgICAgIHN0cnVjdCBzcGlfY29udHJvbGxlciAqY3RscjsKPiA+PiArICAgICAgIHN0cnVjdCBz
cGlzZ19kZXZpY2UgKnNwaXNnOwo+ID4+ICsgICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBk
ZXYtPmRldjsKPiA+PiArICAgICAgIHZvaWQgX19pb21lbSAqYmFzZTsKPiA+PiArICAgICAgIGlu
dCByZXQsIGlycTsKPiA+PiArCj4gPj4gKyAgICAgICBjb25zdCBzdHJ1Y3QgcmVnbWFwX2NvbmZp
ZyBhbWxfcmVnbWFwX2NvbmZpZyA9IHsKPiA+PiArICAgICAgICAgICAgICAgLnJlZ19iaXRzID0g
MzIsCj4gPj4gKyAgICAgICAgICAgICAgIC52YWxfYml0cyA9IDMyLAo+ID4+ICsgICAgICAgICAg
ICAgICAucmVnX3N0cmlkZSA9IDQsCj4gPj4gKyAgICAgICAgICAgICAgIC5tYXhfcmVnaXN0ZXIg
PSBTUElTR19NQVhfUkVHLAo+ID4+ICsgICAgICAgfTsKPiA+IE1vc3QgcmVnbWFwX2NvbmZpZ3Mg
aW4gQW1sb2dpYyBkcml2ZXJzIGFyZSBzdGF0aWMgY29uc3QuCj4gPiBJZiB5b3UgbWFrZSBpdCBh
IHN0YXRpYyBjb25zdCB0aGVuIEkgc3VnZ2VzdCByZW5hbWluZyB0aGUgdmFyaWFibGUgdG8KPiA+
IGFtbF9zcGlzZ19yZWdtYXBfY29uZmlnIGZvciBjb25zaXN0ZW5jeS4KPiA+Cj4KPiByZWdtYXBf
Y29uZmlnIGFzIGEgbG9jYWwgdmFyaWFibGUsIGl0IGNhbiBzYXZlIHNwYWNlLgpUaGFua3MsIEkg
d2FzIG5vdCBhd2FyZSBvZiB0aGF0LgpGb3IgZG9jdW1lbnRhdGlvbiBwdXJwb3Nlcywgd2l0aCB0
aGUgb3JpZ2luYWwgYXBwcm9hY2g6CiQgYWFyY2g2NC1saW51eC1nbnUtc2l6ZSAtZCBkcml2ZXJz
L3NwaS9zcGktYW1sb2dpYy1zcGlzZy5rbwogIHRleHQgICAgZGF0YSAgICAgYnNzICAgICBkZWMg
ICAgIGhleCBmaWxlbmFtZQogIDc1MDQgICAgMTM3NyAgICAgICAwICAgIDg4ODEgICAgMjJiMSBk
cml2ZXJzL3NwaS9zcGktYW1sb2dpYy1zcGlzZy5rbwoKYW5kIG1ha2luZyB0aGUgcmVnbWFwX2Nv
bmZpZyBzdGF0aWMgY29uc3Q6CiQgYWFyY2g2NC1saW51eC1nbnUtc2l6ZSAtZCBkcml2ZXJzL3Nw
aS9zcGktYW1sb2dpYy1zcGlzZy5rbwogIHRleHQgICAgZGF0YSAgICAgYnNzICAgICBkZWMgICAg
IGhleCBmaWxlbmFtZQogIDc3MTYgICAgMTM3NyAgICAgICAwICAgIDkwOTMgICAgMjM4NSBkcml2
ZXJzL3NwaS9zcGktYW1sb2dpYy1zcGlzZy5rbwoKWy4uLl0KPiA+PiArICAgICAgIGRldmljZV9y
ZXNldF9vcHRpb25hbChkZXYpOwo+ID4gSSBoYXZlbid0IGNoZWNrZWQgdGhlIHJlc2V0IGNvZGUg
YnV0IEkgdGhpbmsgdGhlIHJldHVybiB2YWx1ZSBzdGlsbAo+ID4gbmVlZHMgdG8gYmUgY2hlY2tl
ZCAoZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1neC1tbWMuYyBkb2VzIHNvKS4KPiA+IEV2ZW4gdGhv
dWdoIHRoZSByZXNldCBpcyBvcHRpb25hbCB0aGVyZSdzIGNvbmRpdGlvbnMgd2hlcmUgd2UgbXVz
dCBhY3QKPiA+IGZvciBleGFtcGxlIG9uIC1FUFJPQkVfREVGRVIgKHdoaWNoIG11c3QgYmUgcHJv
cGFnYXRlZCkuCj4gPgo+Cj4gVGhlIHJlc2V0IG1pZ2h0IG5vdCBleGlzdCBmb3IgdGhpcyBub2Rl
LCBzZWUgcmVsZXZhbnQgeWFtbCBmaWxlLgpUaGlzIHBhcnQgSSB1bmRlcnN0YW5kLiBPcHRpb25h
bCBob3dldmVyIGRvZXNuJ3QgbWVhbiB0aGF0IHdlIGNhbgpzaW1wbHkgaWdub3JlIGFsbCBlcnJv
cnMuCkxldCdzIGNvbnNpZGVyIHRoZSBmb2xsb3dpbmcgdGhyZWUgc2NlbmFyaW9zOgoxKSByZXNl
dCBub3QgcHJvdmlkZWQgaW4gLmR0YiAtPiB3ZSBkb24ndCBleHBlY3QgYW55IGVycm9yIGhlcmUK
MikgcmVzZXQgaXMgcHJvdmlkZWQgaW4gLmR0YiBidXQgdGhlIHJlc2V0LWNvbnRyb2xsZXIgaGFz
IG5vdCBiZWVuCnJlZ2lzdGVyZWQgLT4gc3Bpc2cgZHJpdmVyIG11c3QgcHJvcGFnYXRlIC1FUFJP
QkVfREVGRVIKMykgcmVzZXQgaXMgcHJvdmlkZWQgaW4gLmR0YiBidXQgcmVzZXRfY29udHJvbF9y
ZXNldCAod2hpY2ggaXMgdXNlZAppbnRlcm5hbGx5IGluIGRldmljZV9yZXNldF9vcHRpb25hbCkg
cmV0dXJucyBhbiBlcnJvciAtPiBzcGlzZyBtdXN0CnByb3BhZ2F0ZSB0aGlzIGVycm9yCgpZb3Vy
IGNvZGUgd29ya3MgZm9yIHRoZSBmaXJzdCBjYXNlIGJ1dCBpdCBkb2Vzbid0IGNvbnNpZGVyIHRo
ZSBvdGhlciB0d28uClRoYXQgc2FpZCwgSSdtIG5vdCBzdXJlIGlmIHRoZSB0aGlyZCBjYXNlIGlz
IHJlYWxpc3RpYyBnaXZlbiB0aGUgVDcKcmVzZXQgY29udHJvbGxlciB1c2VzIE1NSU8gYWNjZXNz
LiBUaGlzIG1heSBjaGFuZ2UgaW4gZnV0dXJlIHRob3VnaAooaWYgU1BJU0cgSVAgaXMgdGhlIHNh
bWUgYnV0IHRoZSByZXNldCBjb250cm9sbGVyIGNoYW5nZXMpLgpJdCBzdGlsbCBsZWF2ZXMgdGhl
IHNlY29uZCBjYXNlIHdoZXJlIHRoZSBzcGlzZyBkcml2ZXIgc2hvdWxkIGJlCnByb2JlZCBvbmx5
IGFmdGVyIHRoZSByZXNldCBjb250cm9sbGVyIGlzIGF2YWlsYWJsZS4KCgpCZXN0IHJlZ2FyZHMs
Ck1hcnRpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
