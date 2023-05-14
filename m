Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807F1C7EE23
	for <linux-amlogic@archiver.kernel.org>; Sun, 14 May 2023 20:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pb4JcrYMIyX2j6Ymqk15RjeWF3eg57uxaKyY5Cbkdzw=; b=0w/HL//zQHVEzi
	ciO/f3+yDem2SsxdonpVtVk0UoYUw20PNALKumsi/3b9KjdsoHzBnBVUGzurSGf9MZMxLkQYZVT/l
	Ydb0R5ApNPX3bp/Hh8PteFXW4Cg82EhE0SxerG6XDZBt3U+aIib0wgwJ1OHXms8W4cOJq/Aqz9C17
	OOit44aiYY041oU/zVQ4NcMuFsuY6sp2XULAf2Q25NOKfx3h1RDyeep2r1KEf57yhZcKdNOTDpwKK
	CQZeP59NaweX5laERlHmju0LNdEL3UnTfhw/xf/vKjLpNIIeV+t6f1T/d/vnTmZLO0eoQ+VxzvNUd
	s29X2kN1EYEfaolUQJpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyIjJ-000DnR-1n;
	Sun, 14 May 2023 20:54:09 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyIjG-000Dll-23;
	Sun, 14 May 2023 20:54:08 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so105599126a12.1;
        Sun, 14 May 2023 13:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1684097644; x=1686689644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYXzQGD4CK+PR6VYYUVHfW34nIF3O8YOM3IMJi2QYTs=;
        b=JSTgRl2SmfcWopA251KJrDng3cAoIp4gpXTE6HFK9VY+6/gwM2oVqDfKldQgX8ptxo
         ApgzLBeMR+G9CV6GSQ1WbFQDz4JP11YlBscQtb9vLloHBDuTmjLnfPNHnQqqOhQL2wOR
         D8XEOc1beJW1wZQV228VMaPTxOF8pfC1mTBIfiJkgO9u0SsWl/PMIZ+dJPxvEG26pPxr
         kNi1tn/9CXQAwmp4Zk0wcOAi2qA3/Dte0Vu1JaJye6PjrDi9B6fsFjqAPWW/uDTF2HHG
         Ga/dYwkzcGXFnrm4TTqdpY2EopR2rqmjhwB3DUE+tLcqNPzlwEMylXAYql2Rvv8CFSJ0
         xoBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684097644; x=1686689644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYXzQGD4CK+PR6VYYUVHfW34nIF3O8YOM3IMJi2QYTs=;
        b=CVogg6hOixMBVCYt88B6RMQGqPNLy6JamlqvOCbKTGO96ZJt8H8gOD/ENXPvczW/+M
         IJpBoASWsT7JH/BSYG3GrNyVlbA9fLxznNTVluKxz1hd2AMf0F4vbl2w+z/yywUxLUiF
         YghmcBvncAoQNeURIebFxjWUW8aVGKR+imSLTV3k4F0fEbLiG+W3eQOVKdsjQe6cU7qG
         zhuTSorB+q4PeAENcWZWHZRYnXKI2Db8sgZsqEq/HHohNvs7AqkUi1GNwwShL2xewhpJ
         LOGgxvaloUbD0HD4YnVDCRVOLlxH8nD5gj6NuqFOfrZizqm1oa98sx9VI1OGSOgmTfTj
         5cVg==
X-Gm-Message-State: AC+VfDypgkchLYz6AwBybmu7qYhUQ4wFEF28FwYA2C3VhsuhhWUBqwuS
	VHxU0q5amyazhpShDHNTiW+b2k/l6ywAJ/8DdfM=
X-Google-Smtp-Source: ACHHUZ6aAc7g+tuqtm7m+Fo4Q/ZkFtq4577x7D2m+gvXW5qmQnJ1rjCVz8GazQhyDuyNmWlvfQcoabyoo8++z0bEXLY=
X-Received: by 2002:a17:907:6e06:b0:969:c354:7d9a with SMTP id
 sd6-20020a1709076e0600b00969c3547d9amr17320894ejc.12.1684097644271; Sun, 14
 May 2023 13:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230405195927.13487-1-ddrokosov@sberdevices.ru>
 <20230405195927.13487-5-ddrokosov@sberdevices.ru> <CAFBinCA3uZXzr3RgnWnKV5Qr-CPaZQX5joDg319i_cgzhLJy2g@mail.gmail.com>
 <20230425123304.xjmrkraybp2siwdw@CAB-WSD-L081021> <CAFBinCCqx1oHf+PcXBkeRYHnGQChbTTPRyD8SJU+ait+TG+AjQ@mail.gmail.com>
 <20230511132606.vk52yorf43alwgew@CAB-WSD-L081021>
In-Reply-To: <20230511132606.vk52yorf43alwgew@CAB-WSD-L081021>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 14 May 2023 22:53:53 +0200
Message-ID: <CAFBinCCmNLQF_qV3k4kgDEAsemEsjL-GQtPex7Pmxrc2sHx30A@mail.gmail.com>
Subject: Re: [PATCH v13 4/6] clk: meson: a1: add Amlogic A1 PLL clock
 controller driver
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com, 
	sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	khilman@baylibre.com, jian.hu@amlogic.com, kernel@sberdevices.ru, 
	rockosov@gmail.com, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_135406_679521_23621EAE 
X-CRM114-Status: GOOD (  31.01  )
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

SGkgRG1pdHJ5LgoKT24gVGh1LCBNYXkgMTEsIDIwMjMgYXQgMzoyNuKAr1BNIERtaXRyeSBSb2tv
c292IDxkZHJva29zb3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgpbLi4uXQo+ID4gSWYgeW91IGFn
cmVlIHdpdGggbXkgc3RhdGVtZW50IGZyb20gYWJvdmUgSSdsbCBiZSBhYmxlIHRvIG1ha2UgbXkK
PiA+IG9yaWdpbmFsIHF1ZXN0aW9uIG1vcmUgc3BlY2lmaWM6Cj4gPiBTaW5jZSB3ZSBrbm93IHRo
YXQgd2UgaGF2ZSBhbGwgdGhlIHJlcXVpcmVkIGlucHV0cyBmb3IgZml4ZWRfcGxsLAo+ID4gc3lz
X3BsbCBhbmQgaGlmaV9wbGwgLSBkbyB5b3Uga25vdyB3aGF0IEFVREREUyBpcyBhbmQgd2hldGhl
ciBpdAo+ID4gcmVxdWlyZXMgYW55IHNwZWNpZmljIGNsb2NrIGlucHV0cyAob3RoZXIgdGhhbiAi
Zml4cGxsX2luIiBhbmQKPiA+ICJoaWZpcGxsX2luIik/Cj4gPgo+Cj4gVG8gYmUgaG9uZXN0LCBJ
IGhhdmUgcHJlcGFyZWQgQTEgcGVyaXBoZXJhbHMgYW5kIEExIFBMTCBkcml2ZXJzIGJhc2VkIG9u
IHZlcnkKPiBwb29yIEFtbG9naWMgZGF0YXNoZWV0cyBhbmQgY3VzdG9tIDQuMTktYmFzZWQgdmVu
ZG9yIGRyaXZlcnMuCj4gVGhlIHZlbmRvciBkcml2ZXIgaGFzIGFuIEFVREREUyBjbG9jayBpbiB0
aGUgUExMIGNsb2NrIHBhcnQsIGJ1dCBpdCBpcyBub3QKPiB1c2VkIGFueXdoZXJlLiBVbmZvcnR1
bmF0ZWx5LCBhcyB1c3VhbCwgdGhlIGRhdGFzaGVldCBkb2Vzbid0IHByb3ZpZGUgYW55Cj4gaW5m
b3JtYXRpb24gb3IgZXhwbGFuYXRpb24gYWJvdXQgd2hhdCBpdCBpcy4gSG93ZXZlciwgdGhlIGRy
aXZlciBoYXMgYSBmZXcKPiBsaW5lcyBvZiBjb21tZW50cyB0aGF0IGluZGljYXRlOgo+Cj4gICAg
IC8qCj4gICAgICAqIGF1ZCBkZHMgY2xvY2sgaXMgbm90IHBsbCBjbG9jaywgbm90IGRpdmlkZXIg
Y2xvY2ssCj4gICAgICAqIE5vIGNsb2NrIG1vZGVsIGNhbiBkZXNjcmliZSBpdC4KPiAgICAgICog
U28gd2UgcmVnYXJkIGl0IGFzIGEgZ2F0ZSwgYW5kIHRoZSBnYXRlIG9wcwo+ICAgICAgKiBzaG91
bGQgcmVhbGl6ZSBsb25lbHkuCj4gICAgICAqLwo+Cj4gQWRkaXRpb25hbGx5LCB0aGUgdmVuZG9y
IGRyaXZlciBzdGF0ZXMgdGhhdCBBVURERFMgaGFzIGEgNDlNaHogY2xvY2ssCj4gYnV0IEkgZG8g
bm90IHNlZSBhbnkgcmVsYXRpb25zaGlwIHdpdGggb3RoZXIgY2xvY2tzIChpbmNsdWRpbmcgdGhl
IGV4cG9ydGVkCj4gR0VOQ0xLKS4KPiBKaWFuIGRpZCBub3QgaW5jbHVkZSBpdCBpbiB0aGUgZmly
c3QgdmVyc2lvbiBvZiB0aGUgUExMIGRyaXZlciwgYW5kIEkgaGF2ZQo+IGRlY2lkZWQgbm90IHRv
IGNoYW5nZSBpdCBlaXRoZXIuCj4KPiBJIGFsc28gbm90aWNlZCBhIGZldyBsaW5lcyBvZiBBVURE
RFMgaW5pdGlhbGl6YXRpb24gc2VxdWVuY2VzIGluIHRoZSB2ZW5kb3IKPiBkcml2ZXIsIHdoaWNo
IG1heSBhZmZlY3QgQ1BVIGNsb2NrIG9iamVjdHMgKGZyb20gbXkgcG9pbnQgb2YgdmlldykuCj4g
SG93ZXZlciwgdGhleSBhcmUgY3VycmVudGx5IHVuZGVyIGRldmVsb3BtZW50LCBhbmQgSSB3aWxs
IHRyeSB0byBmaWd1cmUgaXQKPiBvdXQgd2l0aCBBbWxvZ2ljIHN1cHBvcnQuCj4KPiA+ID4gSG93
ZXZlciwgSSBkbyBub3QgYmVsaWV2ZSB0aGlzIHRvIGJlIGEgc2lnbmlmaWNhbnQgaXNzdWUuIFRo
ZSBjbG9jayBEVAo+ID4gPiBiaW5kaW5ncyBhcmUgb3JnYW5pemVkIHRvIHNpbXBsaWZ5IHRoZSBw
cm9jZXNzIG9mIGludHJvZHVjaW5nIG5ldyBiaW5kaW5ncywKPiA+ID4gd2hldGhlciBwdWJsaWMg
b3IgcHJpdmF0ZS4gRm9yIGluc3RhbmNlLCB3ZSBtYXkgYWRkIG5ldyBiaW5kaW5ncyB0bwo+ID4g
PiBpbmNsdWRlL2R0LWJpbmRpbmdzIGF0IHRoZSBlbmQgb2YgdGhlIGxpc3QgYW5kIGluY3JlYXNl
IHRoZSBvdmVyYWxsIG51bWJlciwKPiA+ID4gd2l0aG91dCBkaXNydXB0aW5nIHRoZSBEVCBiaW5k
aW5ncyBBQkkgKHRoZSBvbGQgbnVtYmVycyB3aWxsIHJlbWFpbgo+ID4gPiB1bmNoYW5nZWQpLgo+
ID4gWWVwLCB0aGlzIHBhcnQgaXMgY2xlYXIgdG8gbWUuIEkgc2hvdWxkIGhhdmUgYmVlbiBtb3Jl
IHNwZWNpZmljIHRoYXQgSQo+ID4gd2FzIGFza2luZyBhYm91dCB0aGUgaW5wdXRzIHRoYXQgYXJl
IGRlc2NyaWJlZCBpbiB0aGUgLnlhbWwgZmlsZSwgbm90Cj4gPiB0aGUgY2xvY2sgSURzLgo+Cj4g
QWN0dWFsbHksIEFVREREUyBoYXMgYW4geHRhbDJkZHMgcGFyZW50IGNsb2NrLCBhbmQgaWYgd2Ug
bmVlZCB0byBoYXZlCj4gdGhlIEFVREREUyBjbG9jayBpbiB0aGUgUExMIGRyaXZlciwgd2Ugc2hv
dWxkIGFkZCBvbmUgbW9yZSBsaW5rIGJldHdlZW4KPiBwZXJpcGhlcmFscyBhbmQgUExMIGRyaXZl
cnMuCj4KPiBMZXQgbWUga25vdyBpZiB5b3UgaGF2ZSBhbnkgcXVlc3Rpb25zLgpJIGhhdmUgbm8g
cXVlc3Rpb25zIC0gYWxsIEkgY2FuIHNheSBpcyB0aGF0OgotIEkgbGlrZSB5b3VyIGFwcHJvYWNo
IG9mIGNsYXJpZnlpbmcgZGV0YWlscyBvZiB0aGUgQVVERERTIGNsb2NrIHdpdGggQW1sb2dpYwot
IGFuZCBJIGZ1bGx5IGFncmVlIHdpdGggeW91ciBjb25jbHVzaW9uIHRoYXQgKGRlcGVuZGluZyBv
biB3aGF0CkFtbG9naWMgc2F5cykgd2UgbmVlZCBvbmUgbW9yZSBsaW5rIGZyb20gdGhlIFBMTCBk
cml2ZXIgdG8gdGhlIEFVREREUwpjbG9jawoKVGhhbmsgeW91IGZvciB5b3VyIHBlcnNpc3RlbmNl
IHdpdGggdGhpcyBzZXJpZXMsIEknbSBzdXJlIGl0IHdpbGwgcGF5Cm9mZiBpbiB0aGUgbG9uZyBy
dW4hCgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
