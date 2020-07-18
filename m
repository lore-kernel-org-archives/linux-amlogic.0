Return-Path: <SRS0=xEby=A5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A3EC433E3
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 09:07:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E26C2073E
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 09:07:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DiI7poWV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="beR9fUb9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E26C2073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a3Vdl3acd7qOfoDdRlT/ij5xMBwNiEiCIVzhjdwDdVI=; b=DiI7poWVAhOFF1b9MgTWqZpC2
	w5GtQT4KMM4+htk409y4arny3DkyWMaAc3VidcylnoqnuwUoTcyZcoK1AQJCg2M4H9wQ+lQ60Bivk
	HI/wu8uoHShvUQo3aQ14/ZqRZWB3aZJ7hTPY0cI4OSrs+TQsqhfxjP6n9C3lPMSNkvQ+8fgVVenR1
	GP4v2QQkgfeIRyRYxv+h+Zn0ba7w4LxmJnHBXnL/rKPADOBGUvwknMkB6h807AQLp4XVWK2n4Z2K+
	qWIr2Ov6SiFNXTpBRuehsLQiAF5W9WPISlVtudBcdVHPih+i9gfBtlv8e68f867qdFdUXcVvV0tLR
	RsegrGAGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwioI-0000gO-AC; Sat, 18 Jul 2020 09:07:10 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwioF-0000fM-8A; Sat, 18 Jul 2020 09:07:07 +0000
Received: by mail-wm1-x342.google.com with SMTP id o8so17897229wmh.4;
 Sat, 18 Jul 2020 02:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=0BWRPw8g2XYVXSVbobArkBx7EWxJQQknqmb4NXpsOwM=;
 b=beR9fUb9+Ju9lRSUK9d40Ng8sbQhSPEP+kpI4XRfDpSg2UtZhGEpV8WGFjBFE0hite
 H4B24U3qEGTY+NNzNtrKw1wkdr7K/UTZyNbMfCQEzC6J09nQHgMjoSansJWwRNErAPdN
 T3onXS7bYI9gakeJU5vJRE4NxkBI3kUKtpcSQOXFTJZ84HBb6O/LgjIbAwy2eLwbNG50
 d/gk67Wiy4i/WQLqYBei6xn6R3rFBPB3avLRlLnZyWDTAsgZj6dT9UbL54p0kWoT9AJI
 EzmrKdVrPe3E9DI/ouOKEFHu4x6lFdCN4nu+e5cHpDOYOrufNcza2R/tNNVp3kvPu/wD
 tt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=0BWRPw8g2XYVXSVbobArkBx7EWxJQQknqmb4NXpsOwM=;
 b=Wecoc3pfg8MVcfVfGdJMQlEVUbqzPNiQ2EU6Was1s6IafPhEOL6ru2ADWF+BCYIdZA
 BYOGgKXE5NPcptU9cPopIQbybBUguLptOcAgF0me/STIfizq042G3vYvv43CkdOcWN5S
 rqnYJP9a85JmnGP1Aa2l3VDjktfaEgykWn1yzysfS9QomPaXr0d47/6Mvngj3iZ+Mz/v
 /ZKlDxfyyN6b4YJKlZPyYLTp+ptl9JngZEgl/Cw3WzM9+8qq78j3xZWTid9JWd3lr7ki
 scgbv8jS+KJ9yI7rmxIwP9xs+FxfiicPj06XfHSHZV/jHJ/rabJecaq00+qa0YjDSuBa
 1Jmg==
X-Gm-Message-State: AOAM530t1dfJ3AhQ5Pbs1nwKqwXi8QYmHbcsz+q1buHQFmHEbdGl1WTd
 7EZiJ9brDrdpzjC3TzhEobQ=
X-Google-Smtp-Source: ABdhPJzoshdcpFBb5Yye8csFmbaOC7pfVxul+09SAuay65V7kYX7aTIBoGARazBeNCiCYARxn+7I0A==
X-Received: by 2002:a05:600c:2317:: with SMTP id
 23mr13389823wmo.72.1595063226154; 
 Sat, 18 Jul 2020 02:07:06 -0700 (PDT)
Received: from [172.16.20.20] ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id w12sm20824919wrm.79.2020.07.18.02.07.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 18 Jul 2020 02:07:05 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.14\))
Subject: Re: [PATCH 2/2] arm64: dts: meson: add support for the WeTek Core 2
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <2ab5e28a-77f6-cac1-68ed-f0a23d5f2a24@baylibre.com>
Date: Sat, 18 Jul 2020 13:07:02 +0400
Message-Id: <109D2AE5-AF4B-4DAF-B2C5-3B8740BF33BD@gmail.com>
References: <20200718050056.1713-1-christianshewitt@gmail.com>
 <20200718050056.1713-2-christianshewitt@gmail.com>
 <2ab5e28a-77f6-cac1-68ed-f0a23d5f2a24@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailer: Apple Mail (2.3445.104.14)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_050707_297457_6AF66872 
X-CRM114-Status: GOOD (  16.87  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Cj4gT24gMTggSnVsIDIwMjAsIGF0IDEyOjUyIHBtLCBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9u
Z0BiYXlsaWJyZS5jb20+IHdyb3RlOgo+IAo+IExlIDE4LzA3LzIwMjAgw6AgMDc6MDAsIENocmlz
dGlhbiBIZXdpdHQgYSDDqWNyaXQgOgo+PiBUaGUgV2VUZWsgQ29yZTIgaXMgYSBjb21tZXJjaWFs
IGRldmljZSBiYXNlZCBvbiB0aGUgQW1sb2dpYyBRMjAwIHJlZmVyZW5jZQo+PiBkZXNpZ24gYnV0
IHdpdGggdGhlIGZvbGxvd2luZyBkaWZmZXJlbmNlczoKPj4gCj4+IC0gM0dCIFJBTSwgMzJHQiBl
TU1DCj4+IC0gQmx1ZSBhbmQgUmVkIExFRHMgdXNlZCB0byBzaWduYWwgb24vb2ZmIHN0YXR1cwo+
PiAtIHVhcnRfQU8gY2FuIGJlIGFjY2Vzc2VkIGFmdGVyIG9wZW5pbmcgdGhlIGNhc2U7IHNvbGRl
cmluZyByZXF1aXJlZAo+PiAtIFVTQiBPVEcgaXMgbm90IGFjY2Vzc2libGUgKGluc2lkZSB0aGUg
Y2FzZSkKPj4gLSBSZWFsdGVrIFJUTDgxNTIgRXRoZXJuZXQgKGludGVybmFsIFVTQiBjb25uZWN0
aW9uKQo+PiAKPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEhld2l0dCA8Y2hyaXN0aWFuc2hl
d2l0dEBnbWFpbC5jb20+Cj4+IC0tLQo+PiBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvTWFr
ZWZpbGUgICAgICAgICAgfCAgMSArCj4+IC4uLi9kdHMvYW1sb2dpYy9tZXNvbi1neG0td2V0ZWst
Y29yZTIuZHRzICAgICB8IDkwICsrKysrKysrKysrKysrKysrKysKPj4gMiBmaWxlcyBjaGFuZ2Vk
LCA5MSBpbnNlcnRpb25zKCspCj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL2FtbG9naWMvbWVzb24tZ3htLXdldGVrLWNvcmUyLmR0cwo+PiAKPj4gZGlmZiAtLWdpdCBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtlZmlsZSBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9NYWtlZmlsZQo+PiBpbmRleCA1Y2FjNGQxZDQ4N2QuLjRlMjIzOWZmY2FhNSAx
MDA2NDQKPj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlCj4+ICsr
KyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtlZmlsZQo+PiBAQCAtNDEsNiArNDEs
NyBAQCBkdGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tZ3htLXEyMDEuZHRiCj4+IGR0
Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1neG0tcmJveC1wcm8uZHRiCj4+IGR0Yi0k
KENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1neG0tczkxMi1saWJyZXRlY2gtcGMuZHRiCj4+
IGR0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1neG0tdmVnYS1zOTYuZHRiCj4+ICtk
dGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tZ3htLXdldGVrLWNvcmUyLmR0Ygo+PiBk
dGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tc20xLXNlaTYxMC5kdGIKPj4gZHRiLSQo
Q09ORklHX0FSQ0hfTUVTT04pICs9IG1lc29uLXNtMS1raGFkYXMtdmltM2wuZHRiCj4+IGR0Yi0k
KENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1zbTEtb2Ryb2lkLWM0LmR0Ygo+PiBkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4bS13ZXRlay1jb3JlMi5k
dHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3htLXdldGVrLWNvcmUyLmR0
cwo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjQ0ZmM1ZWEz
OGRjMAo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dp
Yy9tZXNvbi1neG0td2V0ZWstY29yZTIuZHRzCj4+IEBAIC0wLDAgKzEsOTAgQEAKPj4gKy8vIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCsgT1IgTUlUKQo+PiArLyoKPj4gKyAqIENv
cHlyaWdodCAoYykgMjAyMCBDaHJpc3RpYW4gSGV3aXR0IDxjaHJpc3RpYW5zaGV3aXR0QGdtYWls
LmNvbT4KPj4gKyAqLwo+PiArCj4+ICsvZHRzLXYxLzsKPj4gKwo+PiArI2luY2x1ZGUgIm1lc29u
LWd4bS5kdHNpIgo+PiArI2luY2x1ZGUgIm1lc29uLWd4LXAyM3gtcTIweC5kdHNpIgo+PiArI2lu
Y2x1ZGUgPGR0LWJpbmRpbmdzL2lucHV0L2lucHV0Lmg+Cj4+ICsjaW5jbHVkZSA8ZHQtYmluZGlu
Z3MvbGVkcy9jb21tb24uaD4KPj4gKwo+PiArLyB7Cj4+ICsJY29tcGF0aWJsZSA9ICJ3ZXRlayxj
b3JlMiIsICJhbWxvZ2ljLHM5MTIiLCAiYW1sb2dpYyxtZXNvbi1neG0iOwo+PiArCW1vZGVsID0g
IldlVGVrIENvcmUgMiI7Cj4+ICsKPj4gKwltZW1vcnlAMCB7Cj4+ICsJCWRldmljZV90eXBlID0g
Im1lbW9yeSI7Cj4+ICsJCXJlZyA9IDwweDAgMHgwIDB4MCAweDgwMDAwMDAwPjsgLyogMiBHaUIg
b3IgMyBHaUIgKi8KPj4gKwl9Owo+PiArCj4+ICsJbGVkcyB7Cj4+ICsJCWNvbXBhdGlibGUgPSAi
Z3Bpby1sZWRzIjsKPj4gKwo+PiArCQlibHVlIHsKPj4gKwkJCWNvbG9yID0gPExFRF9DT0xPUl9J
RF9CTFVFPjsKPj4gKwkJCWZ1bmN0aW9uID0gTEVEX0ZVTkNUSU9OX1NUQVRVUzsKPj4gKwkJCWdw
aW9zID0gPCZncGlvIEdQSU9EVl8yNCBHUElPX0FDVElWRV9ISUdIPjsKPj4gKwkJCWRlZmF1bHQt
c3RhdGUgPSAib24iOwo+PiArCQl9Owo+PiArCX07Cj4+ICsKPj4gKwlhZGMta2V5cyB7Cj4+ICsJ
CWNvbXBhdGlibGUgPSAiYWRjLWtleXMiOwo+PiArCQlpby1jaGFubmVscyA9IDwmc2FyYWRjIDA+
Owo+PiArCQlpby1jaGFubmVsLW5hbWVzID0gImJ1dHRvbnMiOwo+PiArCQlrZXl1cC10aHJlc2hv
bGQtbWljcm92b2x0ID0gPDE3MTAwMDA+Owo+PiArCj4+ICsJCWJ1dHRvbi11cGRhdGUgewo+PiAr
CQkJbGFiZWwgPSAidXBkYXRlIjsKPj4gKwkJCWxpbnV4LGNvZGUgPSA8S0VZX1ZFTkRPUj47Cj4+
ICsJCQlwcmVzcy10aHJlc2hvbGQtbWljcm92b2x0ID0gPDEwMDAwPjsKPj4gKwkJfTsKPj4gKwl9
Owo+PiArCj4+ICsJZ3Bpby1rZXlzLXBvbGxlZCB7Cj4+ICsJCWNvbXBhdGlibGUgPSAiZ3Bpby1r
ZXlzLXBvbGxlZCI7Cj4+ICsJCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+PiArCQkjc2l6ZS1jZWxs
cyA9IDwwPjsKPj4gKwkJcG9sbC1pbnRlcnZhbCA9IDwxMDA+Owo+PiArCj4+ICsJCWJ1dHRvbi1w
b3dlciB7Cj4+ICsJCQlsYWJlbCA9ICJwb3dlciI7Cj4+ICsJCQlsaW51eCxjb2RlID0gPEtFWV9Q
T1dFUj47Cj4+ICsJCQlncGlvcyA9IDwmZ3Bpb19hbyBHUElPQU9fMiBHUElPX0FDVElWRV9MT1c+
Owo+PiArCQl9Owo+PiArCX07Cj4+ICt9Owo+PiArCj4+ICsvKiBUaGlzIGlzIGRpc2FibGVkIGFz
IFJlYWx0ZWsgUlRMODE1MiBVU0IgcHJvdmlkZXMgRXRoZXJuZXQgKi8KPj4gKyZldGhtYWMgewo+
PiArCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4+ICsJcGh5LW1vZGUgPSAicm1paSI7Cj4+ICsJcGh5
LWhhbmRsZSA9IDwmaW50ZXJuYWxfcGh5PjsKPiAKPiBJIHRoaW5rIHlvdSBjYW4gcmVtb3ZlIHRo
ZXNlIDIgbGluZXMKPiAKPj4gK307Cj4+ICsKPj4gKyZpbnRlcm5hbF9waHkgewo+PiArCXBpbmN0
cmwtMCA9IDwmZXRoX2xpbmtfbGVkX3BpbnM+LCA8JmV0aF9hY3RfbGVkX3BpbnM+Owo+PiArCXBp
bmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4gCj4gU2ltcGx5IGFkZCA6Cj4gc3RhdHVzID0gImRp
c2FibGVkIjsKPiAKPj4gK307Cj4+ICsKPj4gKyZpciB7Cj4+ICsJbGludXgscmMtbWFwLW5hbWUg
PSAicmMtd2V0ZWstcGxheTIiOwo+PiArfTsKPj4gKwo+PiArLyogVGhpcyBpcyBjb25uZWN0ZWQg
dG8gdGhlIEJsdWV0b290aCBtb2R1bGU6ICovCj4+ICsmdWFydF9BIHsKPj4gKwlzdGF0dXMgPSAi
b2theSI7Cj4+ICsJcGluY3RybC0wID0gPCZ1YXJ0X2FfcGlucz4sIDwmdWFydF9hX2N0c19ydHNf
cGlucz47Cj4+ICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPj4gKwl1YXJ0LWhhcy1ydHNj
dHM7Cj4+ICsKPj4gKwlibHVldG9vdGggewo+PiArCQljb21wYXRpYmxlID0gImJyY20sYmNtNDM0
MzgtYnQiOwo+PiArCQllbmFibGUtZ3Bpb3MgPSA8JmdwaW8gR1BJT1hfMTcgR1BJT19BQ1RJVkVf
SElHSD47Cj4+ICsJCW1heC1zcGVlZCA9IDwyMDAwMDAwPjsKPj4gKwkJY2xvY2tzID0gPCZ3aWZp
MzJrPjsKPj4gKwkJY2xvY2stbmFtZXMgPSAibHBvIjsKPj4gKwl9Owo+PiArfTsKPj4gCj4gCj4g
Cj4gT3RoZXJ3aXNlIGxvb2tzIGdvb2QKPiAKPiBOZWlsCgpJ4oCZdmUgdGVzdGVkIGJvdGggY2hh
bmdlcywgYm90aCBhcmUgZmluZSBzbyB3aWxsIHNlbmQgdjIuCgpUaGFua3MgZm9yIHRoZSBxdWlj
ayByZXZpZXcuCgpDaHJpc3RpYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
