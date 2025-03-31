Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A91C36014
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Mar 2025 21:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tMOVyNYDJ56s2gEmkwaSbRFJn7xFzZ6j5RW/utd3SIA=; b=hr2sWhZTOHWon1
	CnKIKb4rTUevpu3CXnEuIN5mw1hukJkpBcz7fTxjdmoBX1dMAm4XLmdYE7FzYGSV/Yj9v/cg9XIkh
	UnraUbEGaXmYlFgiVKsDsvq6/7N1WB/mD1/jKApxvtw5tPy27SH7stPa0zPod/HldZZF7bQLqI6my
	VgByQrNUSDgXD44WN5kNRfbLsaEcMAEH6vL7rnmx3aa+FGvRU9kqFQjS1lo4CDk+HI/WzGeM4kcW5
	xsPm9tbktDsOXKC9KXsamefvl5OTVrQ/XvR6CH7HVF/0dLRdTSaWcQ/t2yAIL/XieFa+10pJ+asWu
	W8VxvNPo2U5TTk2hgQOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzMb8-00000001PCf-3X5w;
	Mon, 31 Mar 2025 21:23:10 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzMZN-00000001Oxq-2f90
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Mar 2025 21:21:23 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-300fefb8e06so7843330a91.0
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Mar 2025 14:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1743456081; x=1744060881; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqFv7p5NcVMXzdeHBPjYikjLO1JUbU/VCURUs/xfOEs=;
        b=ZxMha13qu7vfqD1uPJ3YAzR7VszeB8BnX7L+87BJGL3zO6Ua9+0WlGPPh1S5fkFKjC
         AoA8/QJC9Pqe87c51lMzbiqDcKG38q5uDjac8EAHQyO2VuEPZCCV6SAcg1LsN+TeqJsF
         ssfsNnI4Zg5bZc3nm0HC97By+rUNzWkRhx+qA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743456081; x=1744060881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqFv7p5NcVMXzdeHBPjYikjLO1JUbU/VCURUs/xfOEs=;
        b=FS9ALIE3dGKuvUnCpcHr5KtepkmnFI/EkviY9+xEdIxk0kgiTByK7/y2YYMliSWhqq
         EVP5Af4hq7ee51YnLXDlraRaXlPBioHg4ffWvP77G0UIym1kNYkpfUzY88AwqwAm6BUx
         5iAaAsVkJwI2dYXsz9d3Dz1oc1xRZrvx2AelZ/B6ACcLJHHjLVVOkC13pKEgG28lsdKK
         64cPrML7+T0k7imbiEfKvIIVJqt8y5AITL2lIOhitFI038OSPilsgXcZGOZ3E2FQeWGl
         KFsW7zCIJccZr2rFiABSlhjH1vAj/qPsGrc1yegrJEtHg8mzsSgrYET4wzQFv/avyGYS
         gv9g==
X-Forwarded-Encrypted: i=1; AJvYcCVRaEXpvlDQL4GTaRgZN86W8oRfp6JLrBuVcUjGiu6rgnQDMs4cYTW69TYHpSecTEzy28Tzk74BRX5Ltfaf@lists.infradead.org
X-Gm-Message-State: AOJu0YwaEK6QpgEnPpHA5/34xgT3YnB2skfXvrdw3LghVj+XtCZPjEHv
	Tb0FEIoBuk2ggdGIC1IC7Nu9q8+Dz4SLTOO5b7Tdt7WRCqxiEvcK3D0IliYIbDokbZdpi881cR8
	UWIv7GDDZNKhtJXs0XbNOGRLcVX8NagdOgCw7JA5HcANsPLYfsbHZHMjJ
X-Gm-Gg: ASbGnctypL75gB104QPsSkiOtWZPiz766OkpFv7akGcqDub+mVnwTKVdMk2KowZoS8A
	2VCCbqbP53Omp2Fz2sqM1ffG27TR7m95MtCG2x5y376w+EZrFCNRXgjoIIkww7HR9kz+zDGBX2r
	2N/ftYv5KocOPt61vhijPDd7Y=
X-Google-Smtp-Source: AGHT+IHwfY9YDI7gAxVEnaSnjkABdZZOKgGT0o+XpttcOyVXA2GQq0jvYVFLH9NQlhONNF8RbNEGEwVheCtAyPLI7IM=
X-Received: by 2002:a17:90b:570d:b0:2fe:85f0:e115 with SMTP id
 98e67ed59e1d1-30560949feemr889884a91.26.1743456080750; Mon, 31 Mar 2025
 14:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250331074420.3443748-1-christianshewitt@gmail.com>
 <17cfc9e2-5920-42e9-b934-036351c5d8d2@lunn.ch> <Z-qeXK2BlCAR1M0F@shell.armlinux.org.uk>
 <CACdvmAijY=ovZBgwBFDBne5dJPHrReLTV6+1rJZRxxGm42fcMA@mail.gmail.com> <Z-r7c1bAHJK48xhD@shell.armlinux.org.uk>
In-Reply-To: <Z-r7c1bAHJK48xhD@shell.armlinux.org.uk>
From: Da Xue <da@lessconfused.com>
Date: Mon, 31 Mar 2025 17:21:08 -0400
X-Gm-Features: AQ5f1JogYqSKmDgBJP4R985J7fldNhdkXea2BS9P9NlvEC_qQFM2qGPLO_OsWfE
Message-ID: <CACdvmAhvh-+-yiATTqnzJCLthtr8uNpJqUrXQGs5MFJSHafkSQ@mail.gmail.com>
Subject: Re: [PATCH v2] net: mdio: mux-meson-gxl: set 28th bit in eth_reg2
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Da Xue <da@libre.computer>, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Jakub Kicinski <kuba@kernel.org>, 
	linux-amlogic@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>, 
	"David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, 
	Heiner Kallweit <hkallweit1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_142121_686665_4860C603 
X-CRM114-Status: GOOD (  30.21  )
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

T24gTW9uLCBNYXIgMzEsIDIwMjUgYXQgNDozMOKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IE9uIE1vbiwgTWFyIDMxLCAyMDI1IGF0
IDAzOjA5OjAwUE0gLTA0MDAsIERhIFh1ZSB3cm90ZToKPiA+IE9uIE1vbiwgTWFyIDMxLCAyMDI1
IGF0IDk6NTXigK9BTSBSdXNzZWxsIEtpbmcgKE9yYWNsZSkKPiA+IDxsaW51eEBhcm1saW51eC5v
cmcudWs+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBNb24sIE1hciAzMSwgMjAyNSBhdCAwMzo0Mzoy
NlBNICswMjAwLCBBbmRyZXcgTHVubiB3cm90ZToKPiA+ID4gPiBPbiBNb24sIE1hciAzMSwgMjAy
NSBhdCAwNzo0NDoyMEFNICswMDAwLCBDaHJpc3RpYW4gSGV3aXR0IHdyb3RlOgo+ID4gPiA+ID4g
RnJvbTogRGEgWHVlIDxkYUBsaWJyZS5jb21wdXRlcj4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGlz
IGJpdCBpcyBuZWNlc3NhcnkgdG8gZW5hYmxlIHBhY2tldHMgb24gdGhlIGludGVyZmFjZS4gV2l0
aG91dCB0aGlzCj4gPiA+ID4gPiBiaXQgc2V0LCBldGhlcm5ldCBiZWhhdmVzIGFzIGlmIGl0IGlz
IHdvcmtpbmcsIGJ1dCBubyBhY3Rpdml0eSBvY2N1cnMuCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhl
IHZlbmRvciBTREsgc2V0cyB0aGlzIGJpdCBhbG9uZyB3aXRoIHRoZSBQSFlfSUQgYml0cy4gVS1i
b290IGFsc28KPiA+ID4gPiA+IHNldHMgdGhpcyBiaXQsIGJ1dCBpZiB1LWJvb3QgaXMgbm90IGNv
bXBpbGVkIHdpdGggbmV0d29ya2luZyBzdXBwb3J0Cj4gPiA+ID4gPiB0aGUgaW50ZXJmYWNlIHdp
bGwgbm90IHdvcmsuCj4gPiA+ID4gPgo+ID4gPiA+ID4gRml4ZXM6IDlhMjRlMWZmNDMyNiAoIm5l
dDogbWRpbzogYWRkIGFtbG9naWMgZ3hsIG1kaW8gbXV4IHN1cHBvcnQiKTsKPiA+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IERhIFh1ZSA8ZGFAbGlicmUuY29tcHV0ZXI+Cj4gPiA+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RpYW4gSGV3aXR0IDxjaHJpc3RpYW5zaGV3aXR0QGdtYWlsLmNvbT4KPiA+
ID4gPiA+IC0tLQo+ID4gPiA+ID4gUmVzZW5kaW5nIG9uIGJlaGFsZiBvZiBEYSBYdWUgd2hvIGhh
cyBlbWFpbCBzZW5kaW5nIGlzc3Vlcy4KPiA+ID4gPiA+IENoYW5nZXMgc2luY2UgdjEgWzBdOgo+
ID4gPiA+ID4gLSBSZW1vdmUgYmxhbmsgbGluZSBiZXR3ZWVuIEZpeGVzIGFuZCBTb0IgdGFncwo+
ID4gPiA+ID4gLSBTdWJtaXQgd2l0aG91dCBtYWlsIHNlcnZlciBtYW5nbGluZyB0aGUgcGF0Y2gK
PiA+ID4gPiA+IC0gTWlub3IgdHdlYWtzIHRvIHN1YmplY3QgbGluZSBhbmQgY29tbWl0IG1lc3Nh
Z2UKPiA+ID4gPiA+IC0gQ0MgdG8gc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4gPiA+ID4KPiA+
ID4gPiA+IFswXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtYW1s
b2dpYy9wYXRjaC9DQUNxdlJVYngtS3NyTXdDSFlRUzZlR1hCb2h5bkQ4UTFDUXg9OD05VmhxWmkx
M0JDUVFAbWFpbC5nbWFpbC5jb20vCj4gPiA+ID4gPgo+ID4gPiA+ID4gIGRyaXZlcnMvbmV0L21k
aW8vbWRpby1tdXgtbWVzb24tZ3hsLmMgfCAzICsrLQo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gPiA+Cj4gPiA+ID4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9uZXQvbWRpby9tZGlvLW11eC1tZXNvbi1neGwuYyBiL2RyaXZlcnMv
bmV0L21kaW8vbWRpby1tdXgtbWVzb24tZ3hsLmMKPiA+ID4gPiA+IGluZGV4IDAwYzY2MjQwMTM2
Yi4uZmM1ODgzMzg3NzE4IDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9uZXQvbWRpby9t
ZGlvLW11eC1tZXNvbi1neGwuYwo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9uZXQvbWRpby9tZGlv
LW11eC1tZXNvbi1neGwuYwo+ID4gPiA+ID4gQEAgLTE3LDYgKzE3LDcgQEAKPiA+ID4gPiA+ICAj
ZGVmaW5lICBSRUcyX0xFREFDVCAgICAgICAgICAgICAgIEdFTk1BU0soMjMsIDIyKQo+ID4gPiA+
ID4gICNkZWZpbmUgIFJFRzJfTEVETElOSyAgICAgICAgICAgICAgR0VOTUFTSygyNSwgMjQpCj4g
PiA+ID4gPiAgI2RlZmluZSAgUkVHMl9ESVY0U0VMICAgICAgICAgICAgICBCSVQoMjcpCj4gPiA+
ID4gPiArI2RlZmluZSAgUkVHMl9SRVNFUlZFRF8yOCAgQklUKDI4KQo+ID4gPiA+Cj4gPiA+ID4g
SXQgbXVzdCBoYXZlIHNvbWUgbWVhbmluZywgaXQgY2Fubm90IGJlIHJlc2VydmVkLiBTbyBsZXRz
IHRyeSB0byBmaW5kCj4gPiA+ID4gYSBiZXR0ZXIgbmFtZS4KPiA+ID4KPiA+ID4gSW5kZWVkLCB0
aGF0IHdhcyBteSB0aG91Z2h0cyBhcyB3ZWxsLCBidXQgQW5kcmV3IGdvdCBoaXMgcmVwbHkgaW4K
PiA+ID4gYmVmb3JlIEkgZ290IGFyb3VuZCB0byByZXBseWluZyEKPiA+Cj4gPiBUaGUgZGF0YXNo
ZWV0cyBkb24ndCBoYXZlIG11Y2ggaW4gdGhlIHdheSBvZiBpbmZvcm1hdGlvbiBhYm91dCB0aGlz
Cj4gPiByZWdpc3RlciBiaXQuIFRoZSBBbWxvZ2ljIEdYTCBkYXRhc2hlZXQgaXMgbm90b3Jpb3Vz
bHkgaW5hY2N1cmF0ZS4KPiA+Cj4gPiBFVEhfUkVHMiAwWEM4ODM0NTU4Cj4gPiAyOToyOCBSIDB4
MSByZXNlcnZlZAo+ID4KPiA+IEl0IGNsYWltcyB0aGUgYml0IGlzIHJlYWQgb25seSB3aGlsZSB0
aGUgQlNQIGhhcmQgY29kZXMgdGhlIHNldHRpbmcgb2YKPiA+IHRoaXMgcmVnaXN0ZXIuIEkgYW0g
b3BlbiB0byBhbnkgbmFtZSBmb3IgdGhpcyByZWdpc3RlciBiaXQuCj4gPiBUaGlzIGlzIHRoZSBv
bmx5IHRoaW5nIGhvbGRpbmcgdXAgZGlzdHJvIG5ldGJvb3RpbmcgZm9yIHRoZXNlIHZlcnkKPiA+
IHBvcHVsYXIgY2hpcCBmYW1pbHkuCj4KPiBXaGljaCBpbnRlcmZhY2UgbW9kZSBkbyB3ZSB0aGlu
ayB0aGlzIGFmZmVjdHM/Cj4KPiBBcyBhIHN1Z2dlc3Rpb24sIG1heWJlIGNhbGwgaXQ6Cj4KPiBS
RUcyXzxpbnRlcmZhY2Vtb2RlPl9FTgo+Cj4gYW5kIHBvc3NpYmx5IGFkZCBhIGNvbW1lbnQgIlRo
aXMgYml0IGlzIGRvY3VtZW50ZWQgYXMgcmVzZXJ2ZWQsIGJ1dAo+IG5lZWRzIHRvIGJlIHNldCBz
byB0aGF0IDxpbnRlcmZhY2Vtb2RlPiBjYW4gcGFzcyB0cmFmZmljLiBUaGlzIGlzCj4gYW4gdW5v
ZmZpY2lhbCBuYW1lLiIKCkkgZm91bmQgdGhpcyBvbiB0aGUgemlyY29uIGtlcm5lbDoKCiNkZWZp
bmUgUkVHMl9FVEhfUkVHMl9SRVZFUlNFRCAoMSA8PCAyOCkKCnByZWdzLT5Xcml0ZTMyKFJFRzJf
RVRIX1JFRzJfUkVWRVJTRUQgfCBSRUcyX0lOVEVSTkFMX1BIWV9JRCwgUEVSX0VUSF9SRUcyKTsK
CkkgY2FuIHJlc3BpbiBhbmQgY2FsbCBpdCB0aGF0LgoKPgo+IC0tCj4gUk1LJ3MgUGF0Y2ggc3lz
dGVtOiBodHRwczovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCj4gRlRU
UCBpcyBoZXJlISA4ME1icHMgZG93biAxME1icHMgdXAuIERlY2VudCBjb25uZWN0aXZpdHkgYXQg
bGFzdCEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
