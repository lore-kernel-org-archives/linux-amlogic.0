Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57540EB64D7
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Jun 2023 07:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MMzDnrC3vSc4AMnG3gHxvBaSkJeO7KePDiQ5A7JXnLo=; b=uUvCZjYYP0lVaX
	fFTAeYODweUchtDVJ6thGuTYLwHwHHUGgfFm8LFvvFartHbYl+HfL5f4Q0TPsBChHuFI8jnF9QnkA
	jMJ0n7VgKQd+KVxcu0Q1F9BxYj39XyOzsnt4b2LhS63PBmwGDDZ+GZlGZemBD8EHYRvPQKRZ3Jnqs
	x62IzKLdy18dvzafdjkDp2mxrtB6IByMCvdoQ8djFl9A+3a432xBh2GuGdmS6rRBnnMTcVMIxsG3W
	sd4hDL3Y71pYjlseRuCJQbYEy0XSQeR2id4c36fSgXiD7Iv3sCZCddOYiwav6jzWd6QVYhbKdG0Gw
	dBsauJwUp/aynn09ZazQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCba3-002qIP-0w;
	Fri, 23 Jun 2023 07:51:43 +0000
Received: from mail-yb1-f171.google.com ([209.85.219.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCba0-002qB7-3D;
	Fri, 23 Jun 2023 07:51:42 +0000
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-bd5f59fb71dso402134276.3;
        Fri, 23 Jun 2023 00:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687506698; x=1690098698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pxyxDexqa1F6dnoldyOUQc/KFZNYj0AG9ZFf5f/vnv4=;
        b=f2aJWqithLVnjldU1zp8rhPT696tC3DrC7MDeE1TEukxtXCamrUdk9CFt1u1Kjluun
         fi6W8NeY3X/i3swCyOZKMfC7q9jSr6JmuzpjpmScmrI7CWCBXOr2M1sanFIJY9J/8mlA
         EgCjSrZOjB8FJXr7xWKA3+9engaYt/2AIKGdBH2p/1IjLEkM1A/eIskDXWGI17wFbIs0
         saXSQk8GOgQzfMWhKPzTDYTBgbRGWp6SqpaWrIhc0gtMfDfNIZoBW53fZ/kwpZOt+fBz
         ci5qYwckQE00tFBOwzIXp+Y0BXBbXFeo5HMy3JCT0eKNTg+Cqa776gj+fTyKmMh6MkiT
         rlcw==
X-Gm-Message-State: AC+VfDxSBEWHMyVndzVMe8Rv04q3ylXJX50zeNQ7kwYCKZG52g712+v9
	BdocmbE0XsePcjZLRzoPBKRYpEN73JbADWIo
X-Google-Smtp-Source: ACHHUZ4kWZ/WYx2osXTtW1XqlzN0QTOYJpPR196HRdSFzG/GWeOw4qNTNpsUQ6cJz3O+eX/Pn/PDhg==
X-Received: by 2002:a5b:18c:0:b0:c01:71ad:daf6 with SMTP id r12-20020a5b018c000000b00c0171addaf6mr5235272ybl.25.1687506697670;
        Fri, 23 Jun 2023 00:51:37 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 184-20020a2516c1000000b00b99768e3b83sm1903122ybw.25.2023.06.23.00.51.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 00:51:37 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-57059626276so3012287b3.3;
        Fri, 23 Jun 2023 00:51:36 -0700 (PDT)
X-Received: by 2002:a81:4e88:0:b0:565:ba4b:aa81 with SMTP id
 c130-20020a814e88000000b00565ba4baa81mr22920867ywb.45.1687506696754; Fri, 23
 Jun 2023 00:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230622084045.519203-1-tanure@linux.com> <20230622084045.519203-3-tanure@linux.com>
 <20230622-unsent-willing-574906af5e1a@wendy> <4a2a2f0c-f9dd-d5c4-1e7e-5852970f87a7@linaro.org>
In-Reply-To: <4a2a2f0c-f9dd-d5c4-1e7e-5852970f87a7@linaro.org>
From: Lucas Tanure <tanure@linux.com>
Date: Fri, 23 Jun 2023 08:51:25 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+3AcDOYHTJJFRa=rxAWiycDXo99_2KuLSmg5+f4upPJDQ@mail.gmail.com>
Message-ID: <CAJX_Q+3AcDOYHTJJFRa=rxAWiycDXo99_2KuLSmg5+f4upPJDQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for T7
To: neil.armstrong@linaro.org
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Nick <nick@khadas.com>, 
	Artem <art@khadas.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_005141_035251_ABF9600C 
X-CRM114-Status: GOOD (  26.99  )
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

T24gVGh1LCBKdW4gMjIsIDIwMjMgYXQgMTA6MzjigK9BTSBOZWlsIEFybXN0cm9uZwo8bmVpbC5h
cm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiAyMi8wNi8yMDIzIDExOjI2LCBDb25v
ciBEb29sZXkgd3JvdGU6Cj4gPiBIZXkgTHVjYXMsCj4gPgo+ID4gT24gVGh1LCBKdW4gMjIsIDIw
MjMgYXQgMDk6NDA6NDRBTSArMDEwMCwgTHVjYXMgVGFudXJlIHdyb3RlOgo+ID4+IEFtbG9naWMg
VDcgU29DcyB1c2VzIHRoZSBzYW1lIFVBUlQgY29udHJvbGxlciBhcyBTNCBTb0NzIGFuZCBHMTJB
Lgo+ID4+IFRoZXJlIGlzIG5vIG5lZWQgZm9yIGFuIGV4dHJhIGNvbXBhdGlibGUgbGluZSBpbiB0
aGUgZHJpdmVyLCBidXQKPiA+PiBhZGQgVDcgY29tcGF0aWJsZSBsaW5lIGZvciBkb2N1bWVudGF0
aW9uLgo+ID4+Cj4gPj4gQ28tZGV2ZWxvcGVkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5l
bC5vcmc+Cj4gPgo+ID4gWW91IGNhbiBkZWxldGUgdGhpcywgSSBkb24ndCBuZWVkIGEgQ28tZGV2
ZWxvcGVkLWJ5IHRhZyBmb3IgcmV2aWV3Cj4gPiBmZWVkYmFjay4KPiA+Cj4gPj4gU2lnbmVkLW9m
Zi1ieTogTHVjYXMgVGFudXJlIDx0YW51cmVAbGludXguY29tPgo+ID4+IC0tLQo+ID4+ICAgLi4u
L2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL2FtbG9naWMsbWVzb24tdWFydC55YW1sICAgICAg
fCA2ICsrKysrKwo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+ID4+Cj4g
Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwv
YW1sb2dpYyxtZXNvbi11YXJ0LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc2VyaWFsL2FtbG9naWMsbWVzb24tdWFydC55YW1sCj4gPj4gaW5kZXggMDFlYzQ1YjNiNDA2
Li40Y2E0NjczMTY5YWEgMTAwNjQ0Cj4gPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3NlcmlhbC9hbWxvZ2ljLG1lc29uLXVhcnQueWFtbAo+ID4+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvYW1sb2dpYyxtZXNvbi11YXJ0Lnlh
bWwKPiA+PiBAQCAtNDYsNiArNDYsMTIgQEAgcHJvcGVydGllczoKPiA+PiAgICAgICAgICAgICAt
IGFtbG9naWMsbWVzb244Yi11YXJ0Cj4gPj4gICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWd4
LXVhcnQKPiA+PiAgICAgICAgICAgICAtIGFtbG9naWMsbWVzb24tczQtdWFydAo+ID4+ICsgICAg
ICAtIGRlc2NyaXB0aW9uOiBFdmVyeXRoaW5nLUVsc2UgcG93ZXIgZG9tYWluIFVBUlQgY29udHJv
bGxlciBvbiBHMTJBIGNvbXBhdGlibGUgU29Dcwo+ID4KPiA+IHMvRXZlcnl0aGluZy1FbHNlL0Fs
d2F5cy1vbi8KPgo+Cj4gIkV2ZXJ5dGhpbmctRWxzZSIgd2FzIHRoZSBhbWxvZ2ljIG5hbWluZyBm
b3IgdGhlIG5vbi1hbHdheXMtb24gcG93ZXIgZG9tYWluLCBidXQgaXQgc2VlbXMKPiBpdCdzIG5v
IG1vcmUgc29tZXRoaW5nIHVzZWQgb24gbmV3IFNvQ3MgbGlrZSB0aGUgVDcgZmFtaWx5Lgo+Cj4g
QW55d2F5LCB0aGUgZGVzY3JpcHRpb24gaXMgd3JvbmcsIGFuZCBpdCdzIGEgbWVzcyBiZWNhdXNl
IHdlIHVzZWQgImFtbG9naWMsbWVzb24tYW8tdWFydCIKPiBmb3IgdWFydHMgb24gdGhlIEFsd2F5
cy1PbiBkb21haW4sIGJ1dCBoZXJlIGl0J3MgZGVzY3JpYmVkIGFzIEV2ZXJ5dGhpbmctRWxzZS4u
Lgo+Cj4gTHVjYXMsIGlzIHRoZXJlIEFPX3VhcnRzIG9uIFQ3ID8gaWYgbm90IGRyb3AgdGhpcyBh
bWxvZ2ljLG1lc29uLWFvLXVhcnQgZm9yIHRoZSBUNyBVQVJUcy4KTm8sIHRoZXJlIGlzIG5vdCBh
biBBT191YXJ0IGluIFQ3LCBhcyBmYXIgYXMgSSBjYW4gc2VlIGZyb20gdGhlIGNvZGUKYW5kIGRh
dGFzaGVldC4KCj4KPiBCdXQgaWYgdGhlcmUncyBubyBtb3JlIEFPIHVhcnQgY29udHJvbGxlciwg
eW91J2xsIG5lZWQgdG8gY2hhbmdlIGRyaXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMKPiBh
bmQgYWRkIGEgT0ZfRUFSTFlDT05fREVDTEFSRSgpIGZvciBhbWxvZ2ljLG1lc29uLXQ3LXVhcnQu
Cj4KPiBCdXQgc3RpbGwsIHdoeSBkb24ndCB5b3UgdXNlIHRoZSBhbWxvZ2ljLG1lc29uLXM0LXVh
cnQgYXMgZmFsbGJhY2sgaW5zdGVhZCA/CkFzIFM0IGFuZCBUNyBhcmUgdGhlIHNhbWUgYXMgZzEy
YSwgSSB0aG91Z2h0IGl0IHdvdWxkIGJlIGJldHRlciB0bwpqdXN0IGhhdmUgZzEyYSB1YXJ0LgpC
dXQgc3VyZSwgSSBjYW4gdXNlIFM0IGFzIGZhbGxiYWNrLgoKPgo+ICsgICAgICAtIGRlc2NyaXB0
aW9uOiBVQVJUIGNvbnRyb2xsZXIgb24gVDcgY29tcGF0aWJsZSBTb0NzCj4gKyAgICAgICAgaXRl
bXM6Cj4gKyAgICAgICAgICAtIGNvbnN0OiBhbWxvZ2ljLG1lc29uLXQ3LXVhcnQKPiArICAgICAg
ICAgIC0gY29uc3Q6IGFtbG9naWMsbWVzb24tczQtdWFydAo+Cj4gYW5kIHVwZGF0ZSBtZXNvbl91
YXJ0LmMgaWYgdGhlcmUncyBubyBBTyB1YXJ0cyBhbnltb3JlLi4uLgpPaywgdjUgaXMgY29taW5n
IHVwLgo+Cj4gTmVpbAo+Cj4gPiBPdGhlcndpc2UsCj4gPiBBY2tlZC1ieTogQ29ub3IgRG9vbGV5
IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiA+Cj4gPiBQZXJoYXBzIGl0IGNhbiBiZSBm
aXhlZCBvbiBhcHBsaWNhdGlvbiwgSSBkb24ndCBrbm93IGhvdyB0aGUgYW1sb2dpYwo+ID4gbWFp
bnRhaW5lcnMgb3BlcmF0ZS4KPiA+Cj4gPiBDaGVlcnMsCj4gPiBDb25vci4KPiA+Cj4gPj4gKyAg
ICAgICAgaXRlbXM6Cj4gPj4gKyAgICAgICAgICAtIGVudW06Cj4gPj4gKyAgICAgICAgICAgICAg
LSBhbWxvZ2ljLG1lc29uLXQ3LXVhcnQKPiA+PiArICAgICAgICAgIC0gY29uc3Q6IGFtbG9naWMs
bWVzb24tZzEyYS11YXJ0Cj4gPj4gKyAgICAgICAgICAtIGNvbnN0OiBhbWxvZ2ljLG1lc29uLWFv
LXVhcnQKPiA+PiAgICAgICAgIC0gZGVzY3JpcHRpb246IEV2ZXJ5dGhpbmctRWxzZSBwb3dlciBk
b21haW4gVUFSVCBjb250cm9sbGVyIG9uIEcxMkEgU29Dcwo+ID4+ICAgICAgICAgICBpdGVtczoK
PiA+PiAgICAgICAgICAgICAtIGNvbnN0OiBhbWxvZ2ljLG1lc29uLWcxMmEtdWFydAo+ID4+IC0t
Cj4gPj4gMi40MS4wCj4gPj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
