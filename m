Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B660C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Dec 2021 12:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ft9/mb9Mf13Z+pz46NbNFPALFbDyS2j7penAC+ivtF0=; b=wlfzc9vXBCCGNo
	mvrjHwCVP9TuoIIVpnakKm7fblvytjhHgmkJP0Tp1ZV31sV7OSxJkJI5MHRlcdQTtae2P8SH7Bc6s
	8F3gpuhfyEYVu/wItEq2f0jcF9UUR2G0LnZImkQFJq+eMtu7r1by3Xy/lohuzk7YA+Sx5Aq8bhhxk
	xECtRW/Qh6Aotlo52luObkDNXAHWdp1Y92DgE6ZH5/VwcSPp4SN7rSCjcJxPx+AwwaWdQtIttbnVn
	JHntMB6Ew/Fqfz881XzE3mvr8ykx9kcvNYReDv0N+s/CkcqfZ5mT23opp24IwzIqENwJfQvRdp3W/
	I2ZFecRQeP53ygxcggOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzeLz-006n6m-T1; Tue, 21 Dec 2021 12:34:51 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzeLw-006n5E-SG
 for linux-amlogic@lists.infradead.org; Tue, 21 Dec 2021 12:34:51 +0000
Received: by mail-wr1-x433.google.com with SMTP id d9so7127284wrb.0
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Dec 2021 04:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=b/jmZSC412tUFfD3gmJLlzQzAIC3g+qciQB1Jm4blYY=;
 b=X+Wcqu2I6KAq2NJyZFiIgnq+xxdf2JqgSr7wUTrXB5gxn3XnaK2MMGNgFTNK3MRDJJ
 FRongtOunU0CS7YKW4E4xfzp/lSIWFmAM1TNk6L7Qr38oqAbcryfaGk4CFdcKeVz5LJJ
 rGrq7BVStd+lDkEbUnF2ruWKwbQ1/lVWhSuiyJiesnXg22YgJVoxevUm3dzxSFCYY6Ef
 Kb8nDQJIrIczSy4cDAXy6dlEQM/wpdtVMZXe4HV3YMuykjkvqIH0GGf8l7opbtd4DwpF
 vnXhEM15KkAuvBIeEQ0zIbFxY5/Y9Ivf66R4igy8mm25d80+z+NF6EGor3YfZlEqfS4J
 tpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=b/jmZSC412tUFfD3gmJLlzQzAIC3g+qciQB1Jm4blYY=;
 b=vHd2L5ul2mmNIOrUGY3itVcYnNU2RLTr0x+y2pKuyvyEr3vzJ5elf6ojwlz88/Lrf7
 of26dXbKbC4I9zz8zq3llrWIjoIf5/9J18ETpnRMe3y0ZQl6f6NTVmtBdELTv+v6H0Mp
 Km2bGzZdOLOWTuvo1Jkz8sADJ96fZuwFjYtdDGYm99A/VQtWS8csyu77DRNZNiqqjaCi
 voXBq4xjkzd65eYSXhKiIO1qQ5AZiAhULq4GyZgphv7rfC2st+k98jQLWxSSS32Qb0/M
 iC/vL68jPsl2CDGUNmgben5ArQooLAEs1FhhWh94A7XOJPL81XeDw/2lHDqgp5yslwZu
 0CfA==
X-Gm-Message-State: AOAM533+EvCwva+Ld0Qy9puLMDTdLolEYagERZjGtvGd3BROiROnAmsg
 LT0/LvKR89hat7Hx3mIenLTr7g==
X-Google-Smtp-Source: ABdhPJzi8cPliz8CplB/gBW7tP6LLsw9z9Wz+UL71hacW3s39wjzyJfjTY7WskcS4y4UjIVZK8okJA==
X-Received: by 2002:a5d:4144:: with SMTP id c4mr2509533wrq.702.1640090086285; 
 Tue, 21 Dec 2021 04:34:46 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id bd8sm2128886wmb.44.2021.12.21.04.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 04:34:45 -0800 (PST)
References: <20211218142632.15293-1-alexander.stein@mailbox.org>
 <1j4k769ch7.fsf@starbuckisacylon.baylibre.com> <4534376.LvFx2qVVIh@kongar>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alexander Stein <alexander.stein@mailbox.org>, Rob Herring
 <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/1] arm64: dts: meson-g12b-odroid-n2: move assigned-clocks
Date: Tue, 21 Dec 2021 11:54:07 +0100
In-reply-to: <4534376.LvFx2qVVIh@kongar>
Message-ID: <1j4k7287bv.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_043449_001871_3B9ABD53 
X-CRM114-Status: GOOD (  23.63  )
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

Ck9uIFN1biAxOSBEZWMgMjAyMSBhdCAxMDo1NiwgQWxleGFuZGVyIFN0ZWluIDxhbGV4YW5kZXIu
c3RlaW5AbWFpbGJveC5vcmc+IHdyb3RlOgoKPiBBbSBTYW1zdGFnLCAxOC4gRGV6ZW1iZXIgMjAy
MSwgMTY6MDM6MTYgQ0VUIHNjaHJpZWIgSmVyb21lIEJydW5ldDoKPj4gCj4+IE9uIFNhdCAxOCBE
ZWMgMjAyMSBhdCAxNToyNiwgQWxleGFuZGVyIFN0ZWluIDxhbGV4YW5kZXIuc3RlaW5AbWFpbGJv
eC5vcmc+IHdyb3RlOgo+PiAKPj4gPiBkdHNjaGVtYSBleHBlY3RzIGEgJ2Nsb2NrcycgcHJvcGVy
dHkgaWYgJ2Fzc2lnbmVkLWNsb2NrcycgaXMgdXNlZCwgYnV0Cj4+ID4gJ3NvdW5kJyBub2RlIGRv
ZXMgbm90Lgo+PiA+IFNvIG1vdmUgdGhlIE1QTExbMC0yXSBjbG9jayBzZXR0aW5ncyAmY2xrY19h
dWRpbyB3aGljaCBhY3R1YWxseSB1c2UgdGhlbS4KPj4gCj4+IE5vLCB0aGlzIGRvZXMgbm90IG1h
a2Ugc2Vuc2UuCj4+IFRoZSBzb3VuZCBjYXJkIG5lZWRzIHRoZSBjbG9ja3Mgc2V0IGluIHN1Y2gg
d2F5IC0gbm90aGluZyBlbHNlCj4+IFRoZSBjbG9jayBjb250cm9sbGVyIHdvcmsganVzdCBhcyB3
ZWxsIHJlZ2FybGVzcyBvZiB0aGUgY2xvY2sgcmF0ZQo+PiAKPj4gSGF2aW5nIGEgY2xvY2sgcHJv
cGVydHkgb3Igbm90IGRvZXMgbm90IGNoYW5nZSB0aGF0CgpBbHNvIHRoZSBkb2N1bWVudGF0aW9u
IG9mIGFzc2lnbmVkIGRvZXMgbm90IG1hbmRhdGUgdGhhdC4KCj4KPiBXZWxsLCBJIGNoZWNrZWQg
d2hhdCBvdGhlcnMgZGlkIHRvIGZpeCB0aGlzIHdhcm5pbmcuIFNvIEkgZGlkIHRoZSBzYW1lIGFz
IGluIFsxXS4KPiBEZXNwaXRlIHRoYXQsIElNSE8gaWYgeW91IHNwbGl0ICdhc3NpZ25lZC1jbG9j
a3MnIGZvciB0aGUgc2FtZSBjbG9jayDCtGFsbAo+IG92ZXIgdXNlcnMgd2hvIGlzIGdvbm5hIHdp
bj8KCjEuIFRoaXMgaXMgZXhwbGljaXRseSBmb3JiaWRkZW4gYnkgdGhlIGFzc2lnbmVkLWNsb2Nr
IGJpbmRpbmcgZG9jdW1lbnRhdGlvbgoyLiBMaWtlIG90aGVyIGludGVyZmFjZXMsIGl0IGlzIGxp
a2VseSBhIGxhc3Qgd3JpdGUgd2lucwoKVGhlIGZhY3QgdGhlIElEIGFzc2lnbmVkIGJ5IHRoZSBj
YXJkIGFuZCB0aGUgb25lIGNsYWltZWQgY29udHJvbGxlciBhcmUKdGhlIHNhbWUgaXMgbWVyZWx5
IGEgY29pbmNpZGVuY2UuIFRoZSBJRCBhc3NpZ25lZCBjb3VsZCB2ZXJ5IHdlbGwgaGF2ZQpiZWVu
IGludGVybmFsIHRvIHRoZSBhdWRpbyBjb250cm9sbGVyLgoKPiBCZWNhdXNlIHRoZSBzb3VuZCBj
YXJkIG5lZWRzIHRoZSBjbG9ja3Mgc2V0Cj4gaGlzIHdheSBpdCBpcyBzZXQsIGl0IGlzIGRvbmUg
aW4gdGhlIHNhbWUgZmlsZS4KCklmIEkgcHVzaCB0aGlzIGxvZ2ljIGZ1cnRoZXIsIEkgbWF5IGFz
IHdlbGwgcHV0IGV2ZXJ5dGhpbmcgYXQgcm9vdCBvZiBEVCwKb3IgYW55d2hlcmUgZWxzZSwgYXMg
bG9uZyBhcyBpdCBpcyBpbiB0aGUgc2FtZSBmaWxlIGFuZCB0aGVyZSBpcyBhIGNsb2NrCnByb3Bl
cnR5IGZvciB0aGUgc2NoZW1hLiBXZSBjb3VsZCBwdXQgaXQgd2l0aCB1YXJ0LCB0aGF0IHdvdWxk
IHdvcmsgOykKKGp1c3Qga2lkZGluZykKClRoZSBjYXJkcyBuZWVkcyB0aGVzZSByYXRlIGJlY2F1
c2Ugb2YgcmF0ZSBmYW1pbHkgd2UgY2hvb3NlIHRvIHN1cHBvcnQsCmFuZCBob3cgd2UgY2hvb3Nl
IHRvIHN1cHBvcnQgdGhlbS4gVGhpcyBpcyB3aGVyZSB0aGUgYXNzaWdubWVudCBtYWtlcwpzZW5z
ZS4KCj4KPiBCZXN0IHJlZ2FyZHMsCj4gQWxleGFuZGVyCj4KPiBbMV0gaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1p
dC8/aWQ9NGFmYjA2YWZkNzY4NTU5MzJhMmQxOWM5ODNjMDEzMTA1ZjFjZmI5YQo+Cj4+ID4gVGhp
cyBmaXhlcyB0aGUgZHRzY2hlbWEgd2FybmluZzoKPj4gPiBhcmNoL2FybTY0L2Jvb3QvZHRzL2Ft
bG9naWMvbWVzb24tZzEyYi1vZHJvaWQtbjIuZHQueWFtbDogc291bmQ6ICdjbG9ja3MnIGlzIGEg
ZGVwZW5kZW5jeSBvZiAnYXNzaWduZWQtY2xvY2tzJwo+PiA+Cj4+IAo+PiBUaGVuIHRoZSBzY2hl
bWEgbmVlZHMgZml4aW5nIElNTwo+PiAKPj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgU3Rl
aW4gPGFsZXhhbmRlci5zdGVpbkBtYWlsYm94Lm9yZz4KPj4gPiAtLS0KPj4gPiAgLi4uL2Jvb3Qv
ZHRzL2FtbG9naWMvbWVzb24tZzEyYi1vZHJvaWQtbjIuZHRzaSAgICB8IDE1ICsrKysrKystLS0t
LS0tLQo+PiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQo+PiA+Cj4+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNv
bi1nMTJiLW9kcm9pZC1uMi5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29u
LWcxMmItb2Ryb2lkLW4yLmR0c2kKPj4gPiBpbmRleCA5YzA1YzgzNDUzZjUuLjg1MjU3NTA3MjA2
YyAxMDA2NDQKPj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEy
Yi1vZHJvaWQtbjIuZHRzaQo+PiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9t
ZXNvbi1nMTJiLW9kcm9pZC1uMi5kdHNpCj4+ID4gQEAgLTI1MiwxNCArMjUyLDYgQEAgc291bmQg
ewo+PiA+ICAJCQkJIlUxOSBJTlIiLCAiQUNPREVDIExPUlAiLAo+PiA+ICAJCQkJIkxpbmVvdXQi
LCAiVTE5IE9VVEwiLAo+PiA+ICAJCQkJIkxpbmVvdXQiLCAiVTE5IE9VVFIiOwo+PiA+IC0KPj4g
PiAtCQlhc3NpZ25lZC1jbG9ja3MgPSA8JmNsa2MgQ0xLSURfTVBMTDI+LAo+PiA+IC0JCQkJICA8
JmNsa2MgQ0xLSURfTVBMTDA+LAo+PiA+IC0JCQkJICA8JmNsa2MgQ0xLSURfTVBMTDE+Owo+PiA+
IC0JCWFzc2lnbmVkLWNsb2NrLXBhcmVudHMgPSA8MD4sIDwwPiwgPDA+Owo+PiA+IC0JCWFzc2ln
bmVkLWNsb2NrLXJhdGVzID0gPDI5NDkxMjAwMD4sCj4+ID4gLQkJCQkgICAgICAgPDI3MDk1MDQw
MD4sCj4+ID4gLQkJCQkgICAgICAgPDM5MzIxNjAwMD47Cj4+ID4gIAkJc3RhdHVzID0gIm9rYXki
Owo+PiA+ICAKPj4gPiAgCQlkYWktbGluay0wIHsKPj4gPiBAQCAtMzY1LDYgKzM1NywxMyBAQCAm
Y2VjYl9BTyB7Cj4+ID4gIH07Cj4+ID4gIAo+PiA+ICAmY2xrY19hdWRpbyB7Cj4+ID4gKwlhc3Np
Z25lZC1jbG9ja3MgPSA8JmNsa2MgQ0xLSURfTVBMTDI+LAo+PiA+ICsJCQkJPCZjbGtjIENMS0lE
X01QTEwwPiwKPj4gPiArCQkJCTwmY2xrYyBDTEtJRF9NUExMMT47Cj4+ID4gKwlhc3NpZ25lZC1j
bG9jay1wYXJlbnRzID0gPDA+LCA8MD4sIDwwPjsKPj4gPiArCWFzc2lnbmVkLWNsb2NrLXJhdGVz
ID0gPDI5NDkxMjAwMD4sCj4+ID4gKwkJCQkJPDI3MDk1MDQwMD4sCj4+ID4gKwkJCQkJPDM5MzIx
NjAwMD47Cj4+ID4gIAlzdGF0dXMgPSAib2theSI7Cj4+ID4gIH07Cj4+IAo+PiAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
