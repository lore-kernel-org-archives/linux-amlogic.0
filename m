Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C08EB64D7
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jun 2023 04:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oB2sIHPrXmJobabZeOuxxe1ZmEGH94Cxaj7dtM4Aecs=; b=N7XIr6YzXGP6vK
	ob/8J4eDSrXgEuJrpDy9QIEbmtk5bmUVLqLqogc1RyZJnSOreJQgCZng79dD1pvvfDXmEqZko+lbY
	B5gLY6wjn4cufjRA787nFPp80cPnfHGk9eYRLLT5I0Y06uCVN7v6gYuCSwRJIhttXL+fQpkhSdutg
	a3KtqklCVRz4I/47b29xrXA78nVD2aIS54CAOOGmMEy/HqBRgFL/NItw1gNj8bSvjIR21mBOon4aJ
	HNnlusUi1xdR2n/W3lQ0S8LxZmUhz7wJ3vhsZWPt+Tjck5NftWYZLWOAnBDxS5llfeTsCOpoYHmDd
	qF0jaMvc8ALp9YaMxzWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF5up-002rmj-0I;
	Fri, 30 Jun 2023 04:39:27 +0000
Received: from mail-yw1-f173.google.com ([209.85.128.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF5ul-002rlH-2U;
	Fri, 30 Jun 2023 04:39:25 +0000
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5700b15c12fso14866837b3.1;
        Thu, 29 Jun 2023 21:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688099959; x=1690691959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WCTjff0Lm/tkc2wvW+DXTAD5VUVHNKURb19DniWHXAc=;
        b=OYrfgqh5wKqyP7iNz/hlcOFjt4QInVh8EW2RBbT4RHHHqxuVSj70UGKp0tHfYNQ8Ba
         viSXJg/y2GL9zHVQIYWjIY1tJMamv8I35lCttqWScLjCOxlXs1izb99kBTHBdnmXmFiF
         n7wwMOqAGfWlJQzPPZ+nRfBhpo9jW6yhmo79ffEbXaqcA3S521m2IJoFm5xMpouDWC+3
         z859tIBuFmV6G2AnqJ+qJAxHDClhLEA6VnshqMHFPQ7LAFnEhBbcfss/xPempRIGJk4a
         RnA4Poc3S0nraOP6yjG0zQwPzzo88pGi4gvavB9oYzo85ipQOxEk1BiIkj9jy7K6GQZB
         iOpg==
X-Gm-Message-State: ABy/qLYekRkNghRvqLG9FS7wJDMKVd+NY9NYqiIILALU//67M7NqaSq+
	xURDNTTfYtpKB4P7K4zKoFafkS0DC2133ji2
X-Google-Smtp-Source: APBJJlGoNCwZbpjODXtFk59W+F6VDQ3PO66kmferUmPiFR3BQSQXo7TfawJA3RRprrbqEn3bDNQahg==
X-Received: by 2002:a0d:d595:0:b0:56d:2189:d87a with SMTP id x143-20020a0dd595000000b0056d2189d87amr1447833ywd.15.1688099959398;
        Thu, 29 Jun 2023 21:39:19 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id j1-20020a0de001000000b0056d2a19ad91sm3187416ywe.103.2023.06.29.21.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 21:39:18 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-56ffd7d7fedso14821487b3.2;
        Thu, 29 Jun 2023 21:39:18 -0700 (PDT)
X-Received: by 2002:a81:5bd6:0:b0:56d:2e22:8b31 with SMTP id
 p205-20020a815bd6000000b0056d2e228b31mr1434020ywb.41.1688099958565; Thu, 29
 Jun 2023 21:39:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230626095223.721011-1-xianwei.zhao@amlogic.com>
 <20230626-viewless-marrow-17838c2172f6@wendy> <676db602-54d8-d6b0-274f-365e65a2102c@amlogic.com>
 <20230627-unsure-uniformly-079cad2c26e6@wendy> <061bb829-fb75-d154-0c15-9f0f982fec41@amlogic.com>
 <CAJX_Q+0Kf3zFyUtkCEkm7K8zXwaovxQmo1DWFwy8y25GQ2wqXg@mail.gmail.com> <0b4b67aa-e8f5-2bd9-223b-0f26add687fe@amlogic.com>
In-Reply-To: <0b4b67aa-e8f5-2bd9-223b-0f26add687fe@amlogic.com>
From: Lucas Tanure <tanure@linux.com>
Date: Fri, 30 Jun 2023 05:39:07 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+3jDsFwmx-voMxCiKadJSobV00BuwLjpzc72UK5681ibQ@mail.gmail.com>
Message-ID: <CAJX_Q+3jDsFwmx-voMxCiKadJSobV00BuwLjpzc72UK5681ibQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Baisc devicetree support for Amlogic T7
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_213923_812083_636562AB 
X-CRM114-Status: GOOD (  30.50  )
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

T24gRnJpLCBKdW4gMzAsIDIwMjMgYXQgMzoyMuKAr0FNIFhpYW53ZWkgWmhhbyA8eGlhbndlaS56
aGFvQGFtbG9naWMuY29tPiB3cm90ZToKPgo+Cj4KPiBPbiAyMDIzLzYvMzAgMDA6MzMsIEx1Y2Fz
IFRhbnVyZSB3cm90ZToKPiA+IFsgRVhURVJOQUwgRU1BSUwgXQo+ID4KPiA+IE9uIFR1ZSwgSnVu
IDI3LCAyMDIzIGF0IDg6NTLigK9BTSBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2lj
LmNvbT4gd3JvdGU6Cj4gPj4KPiA+Pgo+ID4+IE9uIDIwMjMvNi8yNyAxNToyMywgQ29ub3IgRG9v
bGV5IHdyb3RlOgo+ID4+Cj4gPj4KPiA+PiAgID4gWyBFWFRFUk5BTCBFTUFJTCBdCj4gPj4gICA+
Cj4gPj4gICA+IE9uIFR1ZSwgSnVuIDI3LCAyMDIzIGF0IDAyOjEzOjM0UE0gKzA4MDAsIFhpYW53
ZWkgWmhhbyB3cm90ZToKPiA+PiAgID4+IEhpIENvbm9yLAo+ID4+ICAgPj4gICAgICBUaGFua3Mg
Zm9yIHlvdSByZXBseS4KPiA+PiAgID4+IE9uIDIwMjMvNi8yNiAxODowMiwgQ29ub3IgRG9vbGV5
IHdyb3RlOgo+ID4+ICAgPj4KPiA+PiAgID4+Cj4gPj4gICA+Pj4gWyBFWFRFUk5BTCBFTUFJTCBd
Cj4gPj4gICA+Pj4KPiA+PiAgID4+PiBIZXksCj4gPj4gICA+Pj4KPiA+PiAgID4+PiBPbiBNb24s
IEp1biAyNiwgMjAyMyBhdCAwNTo1MjoyMVBNICswODAwLCBYaWFud2VpIFpoYW8gd3JvdGU6Cj4g
Pj4gICA+Pj4+IFQ3IGlzIGFuIGFkdmFuY2VkIGFwcGxpY2F0aW9uIHByb2Nlc3NvciBkZXNpZ25l
ZCBmb3Igc21hcnQgZGlzcGxheS4KPiA+PiAgID4+Pj4KPiA+PiAgID4+Pj4gQWRkIHRoZSBuZXcg
VDcgU29DL2JvYXJkIGRldmljZSB0cmVlIGJpbmRpbmdzLgo+ID4+ICAgPj4+Pgo+ID4+ICAgPj4+
PiBBZGQgYmFzaWMgc3VwcG9ydCBmb3IgdGhlIFQ3IGJhc2VkIEFtbG9naWMgQU40MDAgYm9hcmQs
IHdoaWNoCj4gPj4gICA+Pj4+IGRlc2NyaWJlc3RoZSBmb2xsb3dpbmcgY29tcG9uZW50czogQ1BV
LCBHSUMsIElSUSwgVGltZXIsIFVBUlQuIEl0J3MKPiA+PiAgID4+Pj4gY2FwYWJsZSBvZiBib290
aW5nIHVwIGludG8gdGhlIHNlcmlhbCBjb25zb2xlLgo+ID4+ICAgPj4+Cj4gPj4gICA+Pj4gTHVj
YXMgaGFzIGFscmVhZHkgc2VudCBwYXRjaGVzIGZvciB0aGUgVDcgU29DICYgaXMgYXQgdjU6Cj4g
Pj4gICA+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZGV2aWNldHJlZS8yMDIzMDYy
MzA4MTI0Mi4xMDkxMzEtMS0KPiA+PiAgID4+PiB0YW51cmVAbGludXguY29tLwo+ID4+ICAgPj4+
IFRoZXJlJ3MgYmVlbiBhIGJpdCBvZiBkaXNjdXNzaW9uIHRoZXJlLCBhbmQgdGhlcmUgc2VyaWFs
IHN0dWZmIGluCj4gPj4gICA+Pj4gcGFydGljdWxhciBpcyBkaWZmZXJlbnQgaW4gaGlzIHNlcmll
cyAoaXQgZG9lc24ndCB1c2UgYWx3YXlzLW9uIGZvcgo+ID4+ICAgPj4+IGV4YW1wbGVzKS4KPiA+
PiAgID4+PiBDb3VsZCB5b3UgcGxlYXNlIGdvIGFuZCB0YWtlIGEgbG9vayBhdCBoaXMgc2VyaWVz
Pwo+ID4+ICAgPj4+Cj4gPj4gICA+Pj4gQ2hlZXJzLAo+ID4+ICAgPj4+IENvbm9yLgo+ID4+ICAg
Pj4+Cj4gPj4gICA+PiBBTjQwMCBpcyB0aGUgcmVmZXJlbmNlIGJvYXJkIGRlc2lnbmVkIGJ5IEFt
bG9naWMsIHdoaWNoIGlzIGRpZmZlcmVudAo+ID4+ICAgPj4gZnJvbSBLaGFkYXMgVklNNC4KPiA+
PiAgID4KPiA+PiAgID4gWWV0IHlvdSBzaGFyZSB0aGUgc2FtZSBkdHNpLCB3aGljaCBoZSBoYXMg
Z290IHRocm91Z2ggc2V2ZXJhbAo+ID4+ICAgPiBpdGVyYXRpb25zIG9mIGJlZm9yZSB5b3UgYXJy
aXZlZC4KPiA+PiAgID4KPiA+PiBIaSBMdWNhcywKPiA+PiBBcmUgeW91IGdvaW5nIHRvIGNvbnRp
bnVlIHdpdGggdGhlIGR0c2kgcGFydD8KPiA+Pgo+ID4+ICAgPj4gQW5kIFQ3IHNlcmlhbCBpcyB0
aGUgc2FtZSBhcyBTNCwgc28gSSBmb2xsb3cgUzQgc2VyaWFsLgo+ID4+ICAgPgo+ID4+ICAgPiBZ
ZWFoLCBuby4gU29DIHNwZWNpZmljIGNvbXBhdGlibGUgcGxlYXNlLgo+ID4+ICAgPgo+ID4+ICAg
Pgo+ID4+ICAgPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+ID4+ICAgPiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+ID4+ICAgPiBsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+PiAgID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCj4gPgo+ID4gSGkgWGlhbndlaSwKPiA+
Cj4gPiBJIGFtIGRvaW5nIHRoZSBiYXNpY3MgZm9yIEFtbG9naWMgVDcgQTMxMUQyLCBidXQgdGhl
IG5leHQgc3RlcCAoIHNkCj4gPiBjYXJkIG9yIGVtbWMsIHNvbWV0aGluZyB0byBib290IG9uKSB3
b3VsZCBiZSBtb3JlIGRpZmZpY3VsdCBmb3IgbWUKPiA+IHRoYW4geW91Lgo+ID4gQWZ0ZXIgdGhl
IGZpcnN0IHNlcmllcyBmb3IgVmltNCBnZXRzIG1lcmdlZCwgSSB3aWxsIHN0YXJ0IHRvIHdvcmsg
b24KPiA+IGhvdyB0byBnZXQgc2QgY2FyZHMgd29ya2luZy4KPiA+IEJ1dCBpZiB5b3UgYWxyZWFk
eSBoYXZlIHRoYXQgd29ya2luZyBmb3IgdGhlIEFONDAwIGJvYXJkLCBwbGVhc2Ugc2VuZAo+ID4g
aXQuIEFuZCBJIHdpbGwgbG9vayBhdCB0aGF0IHdvcmsgYW5kIHVzZSBpdCBmb3IgVmltNC4KPiA+
Cj4gPiBPciwgaWYgeW91IGRvbid0IGhhdmUgaXQgcmVhZHkgYW5kIHdhbnQgdG8gc2hhcmUgaXQg
d2l0aCBtZSwgd2UgY2FuCj4gPiB3b3JrIHRvZ2V0aGVyIG9uIHRoZXNlIEEzMTFEMiBwYXRjaGVz
Lgo+ID4gWW91IHRlc3Qgb24gQU40MDAsIGFuZCBJIHRlc3Qgb24gVmltNC4KPiA+Cj4gPiBUaGFu
a3MKPiA+IEx1Y2FzCj4KPiBXZSBhcmUgcHJlcGFyaW5nIHRoaXMgcGFydC4gSG93ZXZlciBpdCBk
ZXBlbmRzIG9uIGNsb2NrLiBTbyB0aGUgY2xvY2sKPiBtdXN0IHJlYWR5IGZpcnN0LgoKV2lsbCB5
b3Ugc2VuZCBjbG9jayBmb3IgVDc/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
