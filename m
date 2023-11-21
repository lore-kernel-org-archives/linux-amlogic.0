Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22783C5ACB3
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Nov 2023 08:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wzz58TqWTmzxcd3Bva4m407UAcY1E5zs3k8lBrbVsO8=; b=rlcMWQpXD8cLNP
	888L0sumYqxOFrvcgU7eO+ITRxmDVDwtBA9wuF0JsE2L7oB839P2BE4boLSW9diD/eP9XiS1kJ00g
	rMDXE2KUIRbPV++P9iSsevqgPi0bH7TSPhBFuf2n80UqVFstg4CrlRzfcjo1pRyIZL4fSyqAUAc5f
	A6Z7vHWtbfLHE+iqqUmgrP6FFuPiP4Q8T0Kg36jwR7BW2KLFscxC/0ezQN3H12mPdhVbh7xJrJqFK
	WCasTn7MUfCUlKu/8G66zLqHFkBhMd8yzsTmjlT+4+ojUJORtTwZPWd9JK22FGv8GrGDmSB+Z0cah
	yWn2SaXbq1l0YDD1hx1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5LoY-00FxxC-33;
	Tue, 21 Nov 2023 08:08:58 +0000
Received: from mail-lf1-f54.google.com ([209.85.167.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5LoU-00Fxve-0f;
	Tue, 21 Nov 2023 08:08:55 +0000
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50970c2115eso7578923e87.1;
        Tue, 21 Nov 2023 00:08:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700554126; x=1701158926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oeOErr72GGCTbFniaP00vmRzQcGaVer6knTx1tHa9Zo=;
        b=psl3KwH5QXmYDdfNgyvOAW8+Es70L/L1xZUm2xgakqEJ2FDT0WohJCxHskMj5gpXWi
         k0V1LGF0p8cwW5lXBeqDhNQAP9G0CcuPbQg5wgoD4xwIqWr+UyRpO1jmQa6iEm2ew10G
         /A4Nps9HtNlKZ5rh0idi73rosKRlLtLKZCa1HQgDeAMVH/V0Tow9iAqH4avGo43DgaBi
         GbSqcsMIqF0Y/tRS9E7j0yTA9c5lOJwGDQ67AIhzlIFFOgtHVLDAGfKUPX5XVWiFu7TK
         kvvn5sSdyQw/PSQWCOUEL7mj7S8pQmRDt9HAJNpGy0JbVvLy4cPGCwLZ0WxVFY1eS//D
         i9cQ==
X-Gm-Message-State: AOJu0YwJHM4pDNwFPteHZQ8pmciYayR/l/X3dvbYwYLfk8pe2/UdbCRc
	Qws2I87V0HZzSeYARDnRiNNZOcHbrosUyV+G
X-Google-Smtp-Source: AGHT+IFjEyNcrp1kGrAz5o65S260jTebtBwfYG1Xn7WCR9ayPio95AbYvBuXNESX/qVgy/9v4+h/gg==
X-Received: by 2002:a05:6512:2394:b0:507:9fe7:f321 with SMTP id c20-20020a056512239400b005079fe7f321mr8917732lfv.54.1700554125889;
        Tue, 21 Nov 2023 00:08:45 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id bp31-20020a056512159f00b0050aa76b984esm1017199lfb.264.2023.11.21.00.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 00:08:45 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50970c2115eso7578844e87.1;
        Tue, 21 Nov 2023 00:08:45 -0800 (PST)
X-Received: by 2002:ac2:599b:0:b0:507:a5e7:724 with SMTP id
 w27-20020ac2599b000000b00507a5e70724mr6535084lfn.38.1700554124979; Tue, 21
 Nov 2023 00:08:44 -0800 (PST)
MIME-Version: 1.0
References: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
 <19358871-009d-4498-9c13-90d5338b1e9f@amd.com> <76fa8f61-fe31-4040-a38d-cc05be3f4f17@linaro.org>
 <CAMuHMdW4WPJT0Km7w8RWrGJaztk6QDGoFAn0bdGbrEsw81R1FA@mail.gmail.com>
 <acfdce81-f117-4a1a-a9fe-e2b4b8922adb@linaro.org> <bd49f17c-7ebf-4e19-b77b-b5ec95375f7d@amd.com>
 <b48293f3-16e3-4980-b900-add0cb7d69f6@linaro.org>
In-Reply-To: <b48293f3-16e3-4980-b900-add0cb7d69f6@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Nov 2023 09:08:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV_gqmf2=cXmZmYgE3aLxvPBr1DVp0cz0C+YrfBVG-8mg@mail.gmail.com>
Message-ID: <CAMuHMdV_gqmf2=cXmZmYgE3aLxvPBr1DVp0cz0C+YrfBVG-8mg@mail.gmail.com>
Subject: Re: [PATCH v2] docs: dt-bindings: add DTS Coding Style document
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Michal Simek <michal.simek@amd.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Andrew Davis <afd@ti.com>, 
	Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_000854_258187_D0D73336 
X-CRM114-Status: GOOD (  26.91  )
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

SGkgS3J6eXN6dG9mLAoKT24gVHVlLCBOb3YgMjEsIDIwMjMgYXQgODo0N+KAr0FNIEtyenlzenRv
ZiBLb3psb3dza2kKPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4gT24g
MjEvMTEvMjAyMyAwODozMywgTWljaGFsIFNpbWVrIHdyb3RlOgo+ID4gT24gMTEvMjAvMjMgMjA6
MzEsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gPj4gT24gMjAvMTEvMjAyMyAyMDoxOCwg
R2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+ID4+PiBPbiBNb24sIE5vdiAyMCwgMjAyMyBhdCAz
OjUz4oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraQo+ID4+PiA8a3J6eXN6dG9mLmtvemxvd3NraUBs
aW5hcm8ub3JnPiB3cm90ZToKPiA+Pj4+IE9uIDIwLzExLzIwMjMgMTU6MDEsIE1pY2hhbCBTaW1l
ayB3cm90ZTo+ID4KPiA+Pj4+PiBPbiAxMS8yMC8yMyAwOTo0MCwgS3J6eXN6dG9mIEtvemxvd3Nr
aSB3cm90ZToKPiA+Pj4+Pj4gRG9jdW1lbnQgcHJlZmVycmVkIGNvZGluZyBzdHlsZSBmb3IgRGV2
aWNldHJlZSBzb3VyY2VzIChEVFMgYW5kIERUU0kpLAo+ID4+Pj4+PiB0byBicmluZyBjb25zaXN0
ZW5jeSBhbW9uZyBhbGwgKHN1YilhcmNoaXRlY3R1cmVzIGFuZCBlYXNlIGluIHJldmlld3MuCj4g
Pj4+Cj4gPj4+Pj4+ICtPcmdhbml6aW5nIERUU0kgYW5kIERUUwo+ID4+Pj4+PiArLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPiA+Pj4+Pj4gKwo+ID4+Pj4+PiArVGhlIERUU0kgYW5kIERUUyBmaWxl
cyBzaG91bGQgYmUgb3JnYW5pemVkIGluIGEgd2F5IHJlcHJlc2VudGluZyB0aGUgY29tbW9uCj4g
Pj4+Pj4+ICsoYW5kIHJlLXVzYWJsZSkgcGFydHMgb2YgdGhlIGhhcmR3YXJlLiAgVHlwaWNhbGx5
IHRoaXMgbWVhbnMgb3JnYW5pemluZyBEVFNJCj4gPj4+Pj4+ICthbmQgRFRTIGZpbGVzIGludG8g
c2V2ZXJhbCBmaWxlczoKPiA+Pj4+Pj4gKwo+ID4+Pj4+PiArMS4gRFRTSSB3aXRoIGNvbnRlbnRz
IG9mIHRoZSBlbnRpcmUgU29DICh3aXRob3V0IG5vZGVzIGZvciBoYXJkd2FyZSBub3QgcHJlc2Vu
dAo+ID4+Pj4+PiArICAgb24gdGhlIFNvQykuCj4gPj4+Pj4+ICsyLiBJZiBhcHBsaWNhYmxlOiBE
VFNJIHdpdGggY29tbW9uIG9yIHJlLXVzYWJsZSBwYXJ0cyBvZiB0aGUgaGFyZHdhcmUgKGUuZy4K
PiA+Pj4+Pj4gKyAgIGVudGlyZSBTeXN0ZW0tb24tTW9kdWxlKS4KPiA+Pj4+Pgo+ID4+Pj4+IERU
Uy9EVFNJIC0gU09NcyBjYW4gYWN0dWFsbHkgcnVuIGFzIHRoZXkgYXJlIHRoYXQncyB3aHkgaXQg
aXMgZmFpciB0byBzYXkgdGhhdAo+ID4+Pj4+IHRoZXJlIGRvZXNuJ3QgbmVlZCB0byBiZSBEVFMg
cmVwcmVzZW50aW5nIHRoZSBib2FyZC4KPiA+Pj4+Cj4gPj4+PiBJIGhhdmUgbmV2ZXIgc2VlbiBh
IFNvTSB3aGljaCBjYW4gcnVuIHdpdGhvdXQgZWxhYm9yYXRlIGhhcmR3YXJlLWhhY2tpbmcKPiA+
Pj4+IChlLmcuIGNvbm5lY3RpbmcgbXVsdGlwbGUgd2lyZXMgdG8gdGhlIFNvTSBwaW5zKS4gVGhl
IGRlZmluaXRpb24gb2YgdGhlCj4gPj4+PiBTb00gaXMgdGhhdCBpdCBpcyBhIG1vZHVsZS4gTW9k
dWxlIGNhbiBiZSByZS11c2VkLCBqdXN0IGxpa2UgU29DLgo+ID4+Pgo+ID4+PiAvbWUgbG9va3Mg
YXQgaGlzIGJvYXJkIGZhcm0uLi4KCj4gPj4+IEkgZ3Vlc3MgdGhlcmUgYXJlIChtYW55KSBvdGhl
ciBleGFtcGxlcy4uLgo+ID4+Cj4gPj4gT0ssIEkgbmV2ZXIgaGFkIHN1Y2ggaW4gbXkgaGFuZHMu
IEFueXdheSwgdGhlIFNvTSB3aGljaCBjYW4gcnVuCj4gPj4gc3RhbmRhbG9uZSAgaGFzIGEgbWVh
bmluZyBvZiBhIGJvYXJkLCBzbyBob3cgZXhhY3RseSB5b3Ugd2FudCB0bwo+ID4+IHJlcGhyYXNl
IHRoZSBwYXJhZ3JhcGg/Cj4gPgo+ID4gV2hhdCBhYm91dD8KPiA+Cj4gPiAyLiBJZiBhcHBsaWNh
YmxlOiBEVFNJIHdpdGggY29tbW9uIG9yIHJlLXVzYWJsZSBwYXJ0cyBvZiB0aGUgaGFyZHdhcmUg
KGUuZy4KPiA+IGVudGlyZSBTeXN0ZW0tb24tTW9kdWxlKS4gRFRTIGlmIHJ1bnMgc3RhbmRhbG9u
ZS4KPgo+IE9LLCBidXQgdGhlbiBpdCdzIGR1cGxpY2F0aW5nIHRoZSBvcHRpb24gMy4gSXQgYWxz
byBzdWdnZXN0cyB0aGF0IFNvTQo+IHNob3VsZCBiZSBhIERUUywgd2hpY2ggaXMgbm90IHdoYXQg
d2Ugd2FudCBmb3Igc3VjaCBjYXNlLiBTdWNoIFNvTXMgbXVzdAo+IGhhdmUgRFRTSStEVFMuCgpT
byB5b3Ugd2FudCB1cyB0byBoYXZlIGEgb25lLWxpbmUgPFNvTT4uZHRzLCB3aGljaCBqdXN0IGlu
Y2x1ZGVzIDxTb00+LmR0c2k/CklNSE8gdGhhdCBhZGRzIG1vcmUgZmlsZXMgZm9yIG5vIG11Y2gg
Z2Fpbi4KVXNlcnMgb2YgYSBTb00gY2FuIGVhc2lseSBpbmNsdWRlIDxTb00+LmR0cy4KJ2dpdCBn
cmVwICIjaW5jbHVkZSAuKmR0c1w+IicgdGVsbHMgeW91IHdlIGhhdmUgcGxlbnR5IG9mIHVzZXJz
IG9mIHRoYXQgc2NoZW1lLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAg
ICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGlu
dXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZl
cnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBC
dXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVy
IiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
