Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD425EB64D7
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Jun 2023 17:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WmTQZsHAqU5NsBLau36nmu2QGwkVcmwBtwJKlqNQK78=; b=n9aHNFza6LYF73
	pgpQNdbutJamearCv2m6Yn1jCzfWy6vR5apWejOvm7vpPogomcix3ioh3dQzNh/hS4WqbutHaZ2uq
	7U70b6qpuey2XAHaDuBumsY9axmpF2q/F2QonLVCFXFQvtqUE0k2HHBfbHtLjPF/cRUDg3pFjsinC
	MPLfBv2e3sncDIgh6rKMRmlxjuQOdpH53uWKOLfJf8xOWByStT/3d7layJw3yZfK+eu2SD5g/vsq6
	wL4+iizi7onHSXohR4g4d7SvkPNadeBl5msjy9pq+MDnqoF1NyXcavKfb3B2Wifp6z04NzzoHWoy4
	ebi6cLdraclU95gJTwyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAwNC-006P9b-03;
	Sun, 18 Jun 2023 17:39:34 +0000
Received: from mail-yw1-f170.google.com ([209.85.128.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAwN8-006P8u-1O;
	Sun, 18 Jun 2023 17:39:31 +0000
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-57083a06b71so20435967b3.1;
        Sun, 18 Jun 2023 10:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687109969; x=1689701969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6cwyhtXgWV8QHFMzUCKjIBrAmoEHpsYP4sSAmGvJDK0=;
        b=UJWGKyCh1tsNhofXMVdmNlAT+ovH2dl1Dqo2eJkKV6SGcIUaLr4guvn8cN6q4Km77u
         iOEUi2vEToNjwT/8of6PEx4a5JMqfbNphEio1BzY5SURfYejx2fcjgXVIr+kw6prRgh2
         G2N6T6uy6TpJHSgCNLOyfq8fqbhEPocRs7FmNug1jIuLgszjDZLow3pwIttWFzoeclau
         AkvA+LTj7/ACZdInBm35UDRaJK4KMScKoe8/QvErqYGlQaENV8EDpzDoDaMBmL8wD6s1
         bU/ErPg5b/NCz3sUaHhsvJQuHaGUvuuucsZFthFvYwdL1LtGWkVh5sz2TVtPS1m+9gys
         iUfw==
X-Gm-Message-State: AC+VfDxYeivPCqZPeMAFxt0LvUKsOczNYM+l6m6drlNPiN//AVLGc1zv
	/iGXx4Bl6JkgDAJrsQgVPd0XYmRtDtaQ5O//CtE=
X-Google-Smtp-Source: ACHHUZ7qZC70KzQVwgJUN9QAiCW2kKiAqm8L7NAuGlKJVCBnrKIVz80N59UhgScANg60i4X7Smm5yA==
X-Received: by 2002:a81:9157:0:b0:570:8802:ec9f with SMTP id i84-20020a819157000000b005708802ec9fmr5225837ywg.19.1687109969025;
        Sun, 18 Jun 2023 10:39:29 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id t66-20020a815f45000000b0054fba955474sm6281071ywb.17.2023.06.18.10.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jun 2023 10:39:28 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-bb167972cffso2871981276.1;
        Sun, 18 Jun 2023 10:39:28 -0700 (PDT)
X-Received: by 2002:a25:d791:0:b0:bc4:78ac:9216 with SMTP id
 o139-20020a25d791000000b00bc478ac9216mr4665462ybg.61.1687109968456; Sun, 18
 Jun 2023 10:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230615182938.18487-1-tanure@linux.com> <20230615182938.18487-3-tanure@linux.com>
 <20230615-capable-implicit-90a8f0265616@spud>
In-Reply-To: <20230615-capable-implicit-90a8f0265616@spud>
From: Lucas Tanure <tanure@linux.com>
Date: Sun, 18 Jun 2023 18:39:17 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2Gm6mr_2cbhCh7a_bOw09W2PBxyOAvasGCrPTdcruczQ@mail.gmail.com>
Message-ID: <CAJX_Q+2Gm6mr_2cbhCh7a_bOw09W2PBxyOAvasGCrPTdcruczQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: clock: Bindings for Meson T7 clock controller
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Nick <nick@khadas.com>, Artem <art@khadas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-serial@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230618_103930_471288_7ADF1F09 
X-CRM114-Status: GOOD (  27.96  )
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
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdW4gMTUsIDIwMjMgYXQgMTA6NDHigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGV5IEx1Y2FzLAo+Cj4gT24gVGh1LCBKdW4gMTUsIDIwMjMg
YXQgMDc6Mjk6MzRQTSArMDEwMCwgTHVjYXMgVGFudXJlIHdyb3RlOgo+ID4gQWRkIGRvY3VtZW50
YXRpb24gZm9yIFQ3IHRoZSBjbG9jayBjb250cm9sbGVyLgo+Cj4gT3RoZXIgdGhhbiB0aGUgYm90
J3MgY29tcGxhaW50LCBmZXcgY29tbWVudHMgZm9yIHlhLgo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBM
dWNhcyBUYW51cmUgPHRhbnVyZUBsaW51eC5jb20+Cj4gPiAtLS0KPiA+ICAuLi4vYmluZGluZ3Mv
Y2xvY2svYW1sb2dpYyxtZXNvbnQ3LnlhbWwgICAgICAgfCAgNjkgKysrCj4gPiAgaW5jbHVkZS9k
dC1iaW5kaW5ncy9jbG9jay9tZXNvbnQ3LWNsa2MuaCAgICAgIHwgNDg3ICsrKysrKysrKysrKysr
KysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNTU2IGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2FtbG9n
aWMsbWVzb250Ny55YW1sCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGlu
Z3MvY2xvY2svbWVzb250Ny1jbGtjLmgKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsbWVzb250Ny55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsbWVzb250Ny55YW1sCj4g
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi4xOGU3Y2NhMGMw
ZTEKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9jbG9jay9hbWxvZ2ljLG1lc29udDcueWFtbAo+Cj4gVGhlIGZpbGVuYW1lIHNob3Vs
ZCBtYXRjaCB0aGUgY29tcGF0aWJsZSAtIHBsZWFzZSB0ZXN0IHRoZSBiaW5kaW5ncywKPiBkdF9i
aW5kaW5nX2NoZWNrIHdpbGwgY29tcGxhaW4uCj4KPiA+IEBAIC0wLDAgKzEsNjkgQEAKPiA+ICsj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkK
PiA+ICslWUFNTCAxLjIKPiA+ICstLS0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9z
Y2hlbWFzL2Nsb2NrL2FtbG9naWMsbWVzb250Ny1jbGsueWFtbCMKPgo+IGFuZCB0aGlzIHNob3Vs
ZCBtYXRjaCB0aGUgZmlsZW5hbWUKPgo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ID4gKwo+ID4gK3RpdGxlOiBBbWxvZ2ljIE1lc29u
IFQ3IENsb2NrIENvbnRyb2xsZXIKPiA+ICsKPiA+ICttYWludGFpbmVyczoKPiA+ICsgIC0gTHVj
YXMgVGFudXJlIDx0YW51cmVAbGludXguY29tPgo+ID4gKwo+ID4gK2Rlc2NyaXB0aW9uOiB8Cj4g
PiArICBUaGUgQW1sb2dpYyBNZXNvbiBUNyBjbG9jayBjb250cm9sbGVyIGdlbmVyYXRlcyBhbmQg
c3VwcGxpZXMgY2xvY2sgdG8KPiA+ICsgIHZhcmlvdXMgcGVyaXBoZXJhbHMgd2l0aGluIHRoZSBT
b0MuCj4gPiArCj4gPiArICBUaGlzIGJpbmRpbmcgdXNlcyBjb21tb24gY2xvY2sgYmluZGluZ3MK
PiA+ICsgIFsxXSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svY2xvY2st
YmluZGluZ3MudHh0Cj4KPiBUaGlzIGRvZXNuJ3QgYWRkIGFueXRoaW5nIGFzIHlvdSdyZSBhZGRp
bmcgYSB5YW1sIGJpbmRpbmcuIEknZCBkcm9wIGl0Cj4gKGFuZCB0aGUgfCBmcm9tIGRlc2NyaXB0
aW9uOiBzaW5jZSB5b3Ugd291bGQgbm8gbG9uZ2VyIGhhdmUgZm9ybWF0dGluZwo+IHRvIHByZXNl
cnZlKS4KPgo+ID4gKwo+ID4gK3Byb3BlcnRpZXM6Cj4gPiArICBjb21wYXRpYmxlOgo+ID4gKyAg
ICBjb25zdDogYW1sb2dpYyx0Ny1jbGtjCj4gPiArCj4gPiArICByZWc6Cj4gPiArICAgIGl0ZW1z
Ogo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IGJhc2ljIHJlZ2lzdGVycwo+Cj4gV2hhdCBkb2Vz
ICJiYXNpYyByZWdpc3RlcnMiIG1lYW4/IEkgdGhpbmsgeW91IHNob3VsZCBiZSBtb3JlIHNwZWNp
ZmljIGluCj4geW91ciBkZXNjcmlwdGlvbi4KPgo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IHBs
bCByZWdpc3RlcnMKPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBjcHVfY2xrIHJlZ2lzdGVycwo+
ID4gKwo+ID4gKyAgcmVnLW5hbWVzOgo+ID4gKyAgICBpdGVtczoKPiA+ICsgICAgICAtIGNvbnN0
OiBiYXNpYwo+ID4gKyAgICAgIC0gY29uc3Q6IHBsbAo+ID4gKyAgICAgIC0gY29uc3Q6IGNwdV9j
bGsKPiA+ICsKPiA+ICsgIGNsb2NrczoKPiA+ICsgICAgbWF4SXRlbXM6IDEKPiA+ICsKPiA+ICsg
IGNsb2NrLW5hbWVzOgo+ID4gKyAgICBjb25zdDogeHRhbAo+ID4gKwo+ID4gKyAgJyNjbG9jay1j
ZWxscyc6Cj4gPiArICAgIGNvbnN0OiAxCj4gPiArCj4gPiArcmVxdWlyZWQ6Cj4gPiArICAtIGNv
bXBhdGlibGUKPiA+ICsgIC0gcmVnCj4gPiArICAtIHJlZy1uYW1lcwo+ID4gKyAgLSBjbG9ja3MK
PiA+ICsgIC0gY2xvY2stbmFtZXMKPiA+ICsgIC0gJyNjbG9jay1jZWxscycKPiA+ICsKPiA+ICth
ZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKPiA+ICsKPiA+ICtleGFtcGxlczoKPiA+ICsgICMg
Q2xvY2sgY29udHJvbGxlciBub2RlOgo+ID4gKyAgLSB8Cj4gPiArICAgIGNsa2M6IGNsb2NrLWNv
bnRyb2xsZXIgewo+Cj4gVGhlIGNvbW1lbnQgYWJvdmUgYW5kIHRoZSBub2RlIG5hbWUgaGVyZSBj
YW4gYmUgZHJvcHBlZC4KPiBZb3UgZG8gaG93ZXZlciBuZWVkIHRvIGNoYW5nZSAiY2xvY2stY29u
dHJvbGxlciIgdG8KPiAiY2xvY2stY29udHJvbGxlckA8YWRkcj4iLgo+Cj4gPiArICAgICAgICBj
b21wYXRpYmxlID0gImFtbG9naWMsdDctY2xrYyI7Cj4gPiArICAgICAgICAjY2xvY2stY2VsbHMg
PSA8MT47Cj4gPiArICAgICAgICByZWcgPSA8MHgwIDB4MDAwMCAweDAwIDB4NDljPiwKPiA+ICsg
ICAgICAgICAgICAgIDwweDAgMHg4MDAwIDB4MDAgMHgzMjA+LAo+ID4gKyAgICAgICAgICAgICAg
PDB4MCAweGUwNDAgMHgwMCAweDBiYz47Cj4KPiBEcm9wIHRoZSAweDAgc3R1ZmYgZnJvbSBoZXJl
Lgo+Cj4gPiArICAgICAgICByZWctbmFtZXMgPSAiYmFzaWMiLCAicGxsIiwgImNwdV9jbGsiOwo+
ID4gKyAgICAgICAgY2xvY2tzID0gPCZ4dGFsPjsKPiA+ICsgICAgICAgIGNsb2NrLW5hbWVzID0g
Inh0YWwiOwo+ID4gKyAgICAgICAgc3RhdHVzID0gIm9rYXkiOwo+Cj4gc3RhdHVzIGNhbiBiZSBk
cm9wcGVkLCBva2F5IGlzIHRoZSBkZWZhdWx0Lgo+Cj4gQ2hlZXJzLAo+IENvbm9yLgo+Ckkgd2ls
bCBkcm9wIHRoaXMgcGF0Y2ggZm9yIG5vdywgd2FpdCBmb3IgdGhlIFM0IGNsb2NrIGRyaXZlciB0
byBiZQp1cHN0cmVhbWVkLCBhbmQgdXNlIHRoYXQgYXMgYSBiYXNlLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
