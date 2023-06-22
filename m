Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EBDEB64DB
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Jun 2023 06:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/GHqigr4CpIP8DS+e3nGCzs8eW4gt2NjyASqvaID5y0=; b=gnDD2Pv4sHmALC
	KecYt+8Kn+b8ZqLKT8p6o3wF9uqdRYRiVJ3OQlSJhc1voALtemARBIcQgZkB7guhIJhXHiXbrT77x
	9O7yBW33oLQGnOqrSCTII2svYJ5CL7NYMK23dcgAHyit18WNvPPVTIv0kmFGZXds6CscfyxiICPor
	Un8N5nwg3uled34LN9mXafq/8oSwUbvjMtQOvkxnr2sUP/i88657utZRIuFRFggcFOkdkNQpQvCdH
	e83FOpuOz9Y1N4UZCLIJTHXVd9zbbTfyLmNa0ijPZHC9n5Mo2l3++NUHTNBdIaHgjhrWZDhBuvBpT
	4419GT1eZ7IGVv/LCkUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCE2m-00H57Y-1W;
	Thu, 22 Jun 2023 06:43:48 +0000
Received: from mail-qk1-f177.google.com ([209.85.222.177])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCE2j-00H56i-23;
	Thu, 22 Jun 2023 06:43:47 +0000
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7624af57b21so516325885a.1;
        Wed, 21 Jun 2023 23:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687416223; x=1690008223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zjc9cUsPT2z8mtJnNxRhataxf2ELf1AJBFW6JAfUMCg=;
        b=lpUx2ztXdtlqsQf2d1jw2+ce4xttBessVSUeeUpJalMtiIKwp1DEQaBJHJtdd2iPxo
         cArnxig0UrbTFsOcbCsQC7ZL7s+QH0/uO2lAF85THCuZlZLSR10TI8bA9jLkliUuADYo
         uBjP+FBMi9wnlYSFSezjXNISHd+PaWqXWyuxDV1extDVk0Tx5igCDzN86er7KpM6lbXf
         F70SGRufS9O5NeQc3z7k4fuqiC0mODWGwZ8wUEoDs3B1UllFeiA+Yc3B2CLV5BMMle6/
         67XJlt8hWtIIwU/SKAbsjc4WgXxlQWrlyPMOgRSmLzq2Vw1jq/wEfGTDK0xFrE3f6TN0
         eYdw==
X-Gm-Message-State: AC+VfDyIS2Xvli1DjJ6XeZy9aiOI0V1HjAg0YRve8V0MZDpKuO4yPB8f
	UiHyn6HD4eJFC1nGJcaZLofT6nDQ3pTCOb5n
X-Google-Smtp-Source: ACHHUZ7qFzl0RigPIE3/nN1VBJBtATLtuBtHaP1vN4Gk0rHgO2hT7e3ToeSEssaD4I9wM+dIk378eg==
X-Received: by 2002:a05:622a:48a:b0:3ff:29d7:bdf0 with SMTP id p10-20020a05622a048a00b003ff29d7bdf0mr10197289qtx.62.1687416223341;
        Wed, 21 Jun 2023 23:43:43 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com. [209.85.160.171])
        by smtp.gmail.com with ESMTPSA id bq26-20020a05622a1c1a00b003f9c2f51558sm3238228qtb.24.2023.06.21.23.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 23:43:42 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-3fde068cc3eso50225081cf.0;
        Wed, 21 Jun 2023 23:43:42 -0700 (PDT)
X-Received: by 2002:a05:622a:1002:b0:3f6:b923:b58d with SMTP id
 d2-20020a05622a100200b003f6b923b58dmr22749027qte.27.1687416222287; Wed, 21
 Jun 2023 23:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230621133215.109254-1-tanure@linux.com> <20230621133215.109254-3-tanure@linux.com>
 <20f25e98-d02e-f914-c4e7-72bb9ddb1ae5@linaro.org> <20230621-uncaring-impeding-15cfbe8e0e7c@spud>
 <CAJX_Q+342dx9S4C2C814uQgOj_QR3EBKhETH9eVZOm7PtzFAVQ@mail.gmail.com> <e4c993e1-8409-1ec0-c1b2-175603052e46@linaro.org>
In-Reply-To: <e4c993e1-8409-1ec0-c1b2-175603052e46@linaro.org>
From: Lucas Tanure <tanure@linux.com>
Date: Thu, 22 Jun 2023 07:43:31 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+09WLqmnWwOL7QESEuDzwZvVVzbtg9Upd5j2LOAYs=vmA@mail.gmail.com>
Message-ID: <CAJX_Q+09WLqmnWwOL7QESEuDzwZvVVzbtg9Upd5j2LOAYs=vmA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for T7
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Nick <nick@khadas.com>, Artem <art@khadas.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_234345_678830_1F32BFFB 
X-CRM114-Status: GOOD (  24.72  )
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

T24gVGh1LCBKdW4gMjIsIDIwMjMgYXQgNzowNeKAr0FNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiAyMi8wNi8yMDIzIDA3
OjMyLCBMdWNhcyBUYW51cmUgd3JvdGU6Cj4gPiBPbiBXZWQsIEp1biAyMSwgMjAyMyBhdCA3OjEy
4oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPiA+Pgo+ID4+IEx1
Y2FzLAo+ID4+Cj4gPj4gT24gV2VkLCBKdW4gMjEsIDIwMjMgYXQgMDM6NTM6MDRQTSArMDIwMCwg
S3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiA+Pj4gT24gMjEvMDYvMjAyMyAxNTozMiwgTHVj
YXMgVGFudXJlIHdyb3RlOgo+ID4+Pj4gQW1sb2dpYyBUNyBTb0NzIHVzZXMgdGhlIHNhbWUgVUFS
VCBjb250cm9sbGVyIGFzIFM0IFNvQ3MgYW5kIEcxMkEuCj4gPj4+PiBUaGVyZSBpcyBubyBuZWVk
IGZvciBhbiBleHRyYSBjb21wYXRpYmxlIGxpbmUgaW4gdGhlIGRyaXZlciwgYnV0Cj4gPj4+PiBh
ZGQgVDcgY29tcGF0aWJsZSBsaW5lIGZvciBkb2N1bWVudGF0aW9uLgo+ID4+Pj4KPiA+Pj4+IFNp
Z25lZC1vZmYtYnk6IEx1Y2FzIFRhbnVyZSA8dGFudXJlQGxpbnV4LmNvbT4KPiA+Pj4+IC0tLQo+
ID4+Pj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9hbWxvZ2ljLG1lc29uLXVhcnQu
eWFtbCAgICAgICAgICB8IDIgKysKPiA+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspCj4gPj4+Pgo+ID4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9zZXJpYWwvYW1sb2dpYyxtZXNvbi11YXJ0LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL2FtbG9naWMsbWVzb24tdWFydC55YW1sCj4gPj4+PiBp
bmRleCAwMWVjNDViM2I0MDYuLjg2MGFiNThkODdiMCAxMDA2NDQKPiA+Pj4+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvYW1sb2dpYyxtZXNvbi11YXJ0Lnlh
bWwKPiA+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwv
YW1sb2dpYyxtZXNvbi11YXJ0LnlhbWwKPiA+Pj4+IEBAIC0zMyw2ICszMyw3IEBAIHByb3BlcnRp
ZXM6Cj4gPj4+PiAgICAgICAgICAgICAgICAtIGFtbG9naWMsbWVzb244Yi11YXJ0Cj4gPj4+PiAg
ICAgICAgICAgICAgICAtIGFtbG9naWMsbWVzb24tZ3gtdWFydAo+ID4+Pj4gICAgICAgICAgICAg
ICAgLSBhbWxvZ2ljLG1lc29uLXM0LXVhcnQKPiA+Pj4+ICsgICAgICAgICAgICAgIC0gYW1sb2dp
YyxtZXNvbi10Ny11YXJ0Cj4gPj4+PiAgICAgICAgICAgIC0gY29uc3Q6IGFtbG9naWMsbWVzb24t
YW8tdWFydAo+ID4+Pj4gICAgICAgIC0gZGVzY3JpcHRpb246IEFsd2F5cy1vbiBwb3dlciBkb21h
aW4gVUFSVCBjb250cm9sbGVyIG9uIEcxMkEgU29Dcwo+ID4+Pj4gICAgICAgICAgaXRlbXM6Cj4g
Pj4+PiBAQCAtNDYsNiArNDcsNyBAQCBwcm9wZXJ0aWVzOgo+ID4+Pj4gICAgICAgICAgICAtIGFt
bG9naWMsbWVzb244Yi11YXJ0Cj4gPj4+PiAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi1neC11
YXJ0Cj4gPj4+PiAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi1zNC11YXJ0Cj4gPj4+PiArICAg
ICAgICAgIC0gYW1sb2dpYyxtZXNvbi10Ny11YXJ0Cj4gPj4+Cj4gPj4+IEl0IGRvZXMgbm90IGxv
b2sgbGlrZSB5b3UgdGVzdGVkIHRoZSBEVFMgYWdhaW5zdCBiaW5kaW5ncy4gUGxlYXNlIHJ1bgo+
ID4+PiBgbWFrZSBkdGJzX2NoZWNrYCAoc2VlCj4gPj4+IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy93cml0aW5nLXNjaGVtYS5yc3Qgb3IKPiA+Pj4gaHR0cHM6Ly93d3cubGluYXJv
Lm9yZy9ibG9nL3RpcHMtYW5kLXRyaWNrcy1mb3ItdmFsaWRhdGluZy1kZXZpY2V0cmVlLXNvdXJj
ZXMtd2l0aC10aGUtZGV2aWNldHJlZS1zY2hlbWEvCj4gPj4+IGZvciBpbnN0cnVjdGlvbnMpLgo+
ID4+Cj4gPj4gQ2hlY2sgYmFjayBvbiB0aGUgcHJldmlvdXMgdmVyc2lvbiwgSSBzaG91bGQndmUg
cG9zdGVkIGFuIHVudGVzdGVkCj4gPj4gdmVyc2lvbiBvZiB3aGF0IHlvdSBuZWVkIHRvIGFkZC4K
PiA+IEkgc2F3IHRoYXQsIGJ1dCBhZGRpbmcgYSBTNCBkb2Vzbid0IG1ha2Ugc2Vuc2UgdG8gbWUu
IEFuZCB5b3UgZGlkbid0Cj4gPiBzaG93IHRoZSBlbnRpcmUgY2hhbmdlLCBzbyBJIGNhbid0IHVu
ZGVyc3RhbmQgd2hhdCB5b3Ugd2FudCB0aGVyZS4KPgo+IEZvciBzdXJlIHlvdSBuZWVkIHNvbWV0
aGluZyB3aGljaCBkb2VzIG5vdCB0cmlnZ2VyIGVycm9ycy4gSWYgeW91IGNsYWltCj4gYWRkaW5n
IFM0IGFzIGZhbGxiYWNrIGRvZXMgbm90IG1ha2Ugc2Vuc2UsIHRoZW4gd2h5IGRpZCB5b3UgdXNl
IGl0Pwo+IFNlbmRpbmcgYSBjb2RlIHdoaWNoIGlzIGNsZWFybHkgaW5jb3JyZWN0IGRvZXMgbm90
IG1ha2Ugc2Vuc2UuCj4KU29ycnksIEkgdGhpbmsgd2UgYXJlIHRhbGtpbmcgYWJvdXQgZGlmZmVy
ZW50IHRoaW5ncy4gSXQgZG9lcyBub3QgbWFrZQpzZW5zZSB0byBtZSB0byBhZGQgYW4gUzQgbGlu
ZSBpbiB0aGUgZG9jdW1lbnRhdGlvbiB3aGVuIGl0IGlzIGFscmVhZHkKdGhlcmUuIFNvIEkgY291
bGQgbm90IHVuZGVyc3RhbmQgb3IgbWFrZSBzZW5zZSBvZiB0aGUgcGF0Y2ggQ29ub3Igc2VudApp
biByZXBseSB0byBteSBWMi4KCktyenlzenRvZiwgSSB3aWxsIGNoZWNrIGFnYWluIHdpdGggZHRi
c19jaGVjayBhbmQgcmUtc2VuZC4KCj4KPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
