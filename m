Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFA1D29DF7
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jan 2026 09:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VxtQuRpeH7DsfKQX/jL3VGrj1hSWPJvyIhDlQtkcmXE=; b=eW/lGKWv3i358h
	MIYrkDaqEU/KT0HF88TkcE/8tlfez/7zH0/UsEbjOruE8MPQ88N7CsHpMqy+x7yEhFQHLu/Fsfry5
	DajvtJpqzTHy4mjT2Tfuzeq/KSPImDJRMMqjkCfjbrqmP+AHoHu1HcNWzGNwo/cFMP/QZfE/cHEBa
	Yr5dJ5EQg5BPl1JJJVBeTjW53o/nOBOLEjx5u6HhglJJemQtHFGpFmB1wbPx9Nkz8oo1ivJY8ORU/
	vd/sj8xrXLXJVgP63FyVjWwi1vumnyIrGm+P8Us2J5y3Eparq8N5LyYmkz4BLOrX8B38J+Y3S0hwn
	IKhpyd1+1LwZaZP1OYjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfar7-00000006qpk-1rAu;
	Tue, 13 Jan 2026 09:38:29 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfar4-00000006qoc-1Mk7
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Jan 2026 09:38:27 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-37fd6e91990so71345441fa.3
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Jan 2026 01:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768297104; x=1768901904; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8KWgyjMXHabGU6AkOW8T5Mt3kkTj5EnHFmAPDuCp/M=;
        b=mfydHLh62IOVLs3mKm82w+bov0EkkwmkydvH84EfBey7lni8ozfAWUfupoxjMmcuUq
         JXBszmv3GbkLZKCCGF2hRX1kIwrFgbpkbeNLJVKojEeuFW9zl3WWxbNF37yN64A7W07e
         Emr+pEHmBNCvxRMk+3bl2OVm0LptKwupfVVqMPu8DNd3uoFu+JThFJdwiKhpzJsmYIIT
         Pvwx6CEjD8tcbjVPXD4N88FrZT/WtiGPrm8jn4D2LQ4aXO5PaNZeUXQesAV7tB+XYn+R
         USvO7UnyRT1OGHlAZZhTELsZSH3EinSLJOnWOaTs2UkJIe7fpWhiM5rgPks0eFC5/z/T
         w23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768297104; x=1768901904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w8KWgyjMXHabGU6AkOW8T5Mt3kkTj5EnHFmAPDuCp/M=;
        b=s99aR5mPTZTUcHamsQHw9Bw8j3L1tIhvKo9nP/ri3MEy2MujTx7ngJf7cNzF2ao9Wh
         okqVGg4TstbsmQggHP489WNQjEF0/3TlfAmWVEUne1liG2E/jZ+VIoAwZkRzkDZ0uQg/
         KR7MOAMFNumcA1dRcEjkkkjNvUdIkARqm1laWUSmUpAe98gRFZJ4UZaYE0rSacbHPKId
         6C6qi0d2zjgt0b6eYHEB7uNg011lhdjo/51sbkKL+I+Nn7i80uM+23W3Flo3qZAcEQuf
         +7VxdKt3ev5pTqphm6mR4DUN3p0J9NfpSddlTgb6QEIpJO5HD1LIJH+yO1Cx4ef6UilF
         lPsg==
X-Forwarded-Encrypted: i=1; AJvYcCXVNzijpNI2Jpcx9koNct716t65pvEJ+oe+Ezl8RqFyfO7xXBlmZUnjkMzdjUHhTiuwzeEv77flXyVd827u@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4lowIegckTaEiNSNqBtqnq79ttM/qkgqX/56/d0nKYYwbJCzE
	c2FvGVbFsvwWqoNeTxkQr82IJ04rZxX/CrfG5m0QEHAJa76o7UtudLRij1oSBpt7GWyypSBBUPx
	29sIiMtkwRWKgDvJQbzFCd0sr3yjv+eo=
X-Gm-Gg: AY/fxX6cVJz3g0Uy+31oD2tfOSZAJgP1MNuC7Q16Ha5s76AbW71owXPLYELznRYkH/W
	tY2Ia4V5GRoCE2av3s9iWmixQwxb0n29oLrAgq8BVEQxoPodmelR2WuycGO8aDlk2zEPftFnyOx
	6uYCV0YDeAt6rD+3tifR2DgyflPHEdmHAh8+4c2rQ8ZJW7R01rKOO3Lk2bC18KgqdiKg/5u0DPN
	xWxila9SILFMF901mWei2Hy2FrIKNCkf4dPFFPsODLVB5Md/oMu6hU0t4uS+X97oO5A
X-Google-Smtp-Source: AGHT+IH5vuof9lI6QD87N6B7LDe9P2FN4oZsCmNAYwjolnj651Y9hadagnFcBF2OE8xJNcMfTyaxXnX2atsCncCn3Rc=
X-Received: by 2002:a2e:bc21:0:b0:383:1d66:c204 with SMTP id
 38308e7fff4ca-3831d66c785mr40711961fa.38.1768297103626; Tue, 13 Jan 2026
 01:38:23 -0800 (PST)
MIME-Version: 1.0
References: <20260113011931.40424-1-nick@khadas.com> <1jsec9ritd.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jsec9ritd.fsf@starbuckisacylon.baylibre.com>
From: Nick Xie <xieqinick@gmail.com>
Date: Tue, 13 Jan 2026 17:38:10 +0800
X-Gm-Features: AZwV_QiMouZEUcMJMc0NkPa_HjjwbFSXhGJqMCfsVehqjMCt6pkKsbPx_-HuidM
Message-ID: <CAP4nuTXUd23e6k6iqRVJw6Rcsc46+RrLGR9ZCu=o28g3u2FKSQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: S4: fix SD card initialization failure
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, 
	martin.blumenstingl@googlemail.com, xianwei.zhao@amlogic.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, nick@khadas.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_013826_383576_19ED1431 
X-CRM114-Status: GOOD (  27.51  )
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

SmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+IOS6jjIwMjblubQx5pyIMTPml6Xl
kajkuowgMTY6NTflhpnpgZPvvJoKPgo+IE9uIG1hci4gMTMgamFudi4gMjAyNiBhdCAwOToxOSwg
TmljayBYaWUgPHhpZXFpbmlja0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBUaGUgU0QgY29udHJv
bGxlciAoc2RAZmUwOGEwMDApIHJlcXVpcmVzIGEgY2xvY2sgc291cmNlIGNhcGFibGUgb2YKPiA+
IGdlbmVyYXRpbmcgYSA0MDBrSHogZnJlcXVlbmN5IGZvciB0aGUgaWRlbnRpZmljYXRpb24gcGhh
c2UuCj4gPgo+ID4gQ3VycmVudGx5LCB0aGUgc2Qgbm9kZSB1c2VzIENMS0lEX1NEX0VNTUNfQiBh
cyBjbGtpbjAgYW5kIENMS0lEX0ZDTEtfRElWMgo+ID4gYXMgY2xraW4xLiBCb3RoIG9mIHRoZXNl
IGFyZSBoaWdoLWZyZXF1ZW5jeSBjbG9ja3MgKGUuZy4sIH4xR0h6KS4KPgo+IFRoZSByZWFzb24g
eW91IGFyZSBoYXZpbmcgdGhpcyBwcm9ibGVtIGlzIGJlY2F1c2UgQ0xLSURfU0RfRU1NQ19CIGRv
ZXMKPiBub3QgcHJvdmlkZSA0MDBrSHogYnkgZGVmYXVsdCBvbiB0aGlzIHBsYXRmb3JtLiBXZSBo
YXZlIGJlZW4gb3BlcmF0aW5nCj4gd2l0aCB0aGlzICh3ZWFrKSBhc3N1bXB0aW9uIHNvIGZhciAu
Li4gYW5kIGl0IHdhcyBPSyB1bnRpbCBub3cuCj4KPiA+IFRoZSBpbnRlcm5hbCBkaXZpZGVyIG9m
IHRoZSBTRCBjb250cm9sbGVyIGlzIGxpbWl0ZWQgdG8gYSBtYXhpbXVtIHZhbHVlCj4gPiBvZiA2
NCAoMl42KS4gV2l0aCBpbnB1dCBmcmVxdWVuY2llcyBzaWduaWZpY2FudGx5IGhpZ2hlciB0aGFu
IDI1LjZNSHoKPiA+ICg0MDBrSHogKiA2NCksIHRoZSBkcml2ZXIgaXMgdW5hYmxlIHRvIGdlbmVy
YXRlIHRoZSByZXF1aXJlZCA0MDBrSHoKPiA+IGNsb2NrLCBjYXVzaW5nIHRoZSBwcm9iZSB0byBm
YWlsIHdpdGggLUVJTlZBTC4KPiA+Cj4gPiBGaXggdGhpcyBieSByZXBhcmVudGluZyBjbGtpbjAg
dG8gdGhlIDI0TUh6IFhUQUwgY2xvY2ssIGNvbnNpc3RlbnQgd2l0aAo+ID4gdGhlIGNvbmZpZ3Vy
YXRpb24gb2YgdGhlIHNkaW8gYW5kIGVtbWMgbm9kZXMuIFRoaXMgYWxsb3dzIHRoZSBkaXZpZGVy
Cj4gPiB0byBzdWNjZXNzZnVsbHkgZ2VuZXJhdGUgNDAwa0h6ICgyNE1IeiAvIDYwKS4KPiA+Cj4K
PiBEVCBnZW5lcmFsbHkgZGVzY3JpYmUgd2hhdCB0aGUgSFcgaXMsIG5vdCBob3cgeW91IHdpc2gg
dG8gY29uZmlndXJlIGl0Lgo+Cj4gV2hhdCB5b3UgYXJlIGRvaW5nIGhlcmUgZG9lcyBub3QgcmVw
YXJlbnQgYW55dGhpbmcuIFlvdSBhcmUgYWN0dWFsbHkKPiBtaXMtcmVwcmVzZW50aW5nIHRoZSBj
bG9jayB0cmVlLCBtYWtpbmcgdGhlIE1NQyBkZXZpY2UgYmVsaWV2ZSBpdCBoYXMKPiAyNE1IeiBv
biBpdHMgY2xraW4wLCBldmVuLXRob3VnaCB3aGF0IGl0IGlzIHJlYWxseSBoYXMgc3RpbGwgaXMK
PiBDTEtJRF9TRF9FTU1DX0IgKHByZXN1bWFibHkgcnVubmluZyBhIDFHSHopCj4KPiBTbyBpZiBt
eSB1bmRlcnN0YW5kaW5nIGlzIGNvcnJlY3QsIHlvdSBhcmUgaW5kZWVkIHNldHRpbmcgdGhlIGRp
dmlkZXIgdG8KPiA2MCBpbnN0ZWFkIG9mIDY0LCBidXQgeW91IGFyZSBzdGlsbCBkaXZpZGluZyAx
R0h6IHNvIHdoYXQgeW91IGFjdHVhbGx5Cj4gZ2V0IGl0IDE2LDZNSHoKPgo+IElmIHlvdSB3YW50
IHRvIGdldCAyNE1IeiB0aGUgY2xraW4wLCB3ZSBuZWVkIHRvIGFzc2lnbiB0aGUgcmF0ZSwKPiBz
b21ldGhpbmcgd2UgcHJvYmFibHkgc2hvdWxkIGhhdmUgZG9uZSBiZWZvcmUuCj4KPiBJJ2xsIHNl
bmQgc29tZXRoaW5nIGZvciB0aGlzCj4KPiA+IFZlcmlmaWVkIG9uIEtoYWRhcyBWSU0xUyB3aXRo
IFNvQyBTNCBTOTA1WTQuCj4gPgo+ID4gRml4ZXM6IDNhYjlkNTRiNWQ4NDcgKCJhcm02NDogZHRz
OiBhbWxvZ2ljOiBlbmFibGUgc29tZSBkZXZpY2Ugbm9kZXMgZm9yIFM0IikKPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBOaWNrIFhpZSA8bmlja0BraGFkYXMuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9h
cm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kgfCAyICstCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpIGIvYXJjaC9hcm02NC9i
b290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kKPiA+IGluZGV4IDlkOTllZDI5OTRkZmEuLmI4
N2JjODNiNWE5YmIgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
bWVzb24tczQuZHRzaQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29u
LXM0LmR0c2kKPiA+IEBAIC04MzMsNyArODMzLDcgQEAgc2Q6IG1tY0BmZTA4YTAwMCB7Cj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MCAweGZlMDhhMDAwIDB4MCAweDgwMD47Cj4g
PiAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE3NyBJUlFfVFlQ
RV9FREdFX1JJU0lORz47Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZjbGtj
X3BlcmlwaHMgQ0xLSURfU0RFTU1DX0I+LAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDwmY2xrY19wZXJpcGhzIENMS0lEX1NEX0VNTUNfQj4sCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgPCZ4dGFsPiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA8JmNsa2NfcGxsIENMS0lEX0ZDTEtfRElWMj47Cj4gPiAgICAgICAgICAgICAgICAgICAgICAg
Y2xvY2stbmFtZXMgPSAiY29yZSIsICJjbGtpbjAiLCAiY2xraW4xIjsKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICByZXNldHMgPSA8JnJlc2V0IFJFU0VUX1NEX0VNTUNfQj47Cj4KPiAtLQo+IEpl
cm9tZQoKSGVsbG8gSmVyb21lLAoKVGhhbmtzIGZvciB5b3VyIHJldmlldy4KCkkgYWxzbyBjaGVj
a2VkIHRoZSBBbWxvZ2ljIDUuMTUgdmVuZG9yIGtlcm5lbCBbMV0sIGl0IGFsc28gdXNlIHh0YWwg
YXMgY2xraW4wLgoKWzFdIC0gaHR0cHM6Ly9naXRodWIuY29tL2toYWRhcy9jb21tb25fZHJpdmVy
cy9ibG9iL2toYWRhcy12aW1zLTUuMTUueS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVz
b24tczQuZHRzaSNMMTM1OAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
