Return-Path: <SRS0=vjaz=ZE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C696CC43331
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Nov 2019 10:51:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9898D21A49
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Nov 2019 10:51:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EcMnxF8+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KzPkNF7v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9898D21A49
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/RLL7SbzlQBb5pg4MdMuiWDI8KdRjyR8iHUD3TrcdMI=; b=EcMnxF8+/yxZzu
	SlTK2McJ9z3abXoh4uOC1Vij76SepUUOksw7YuoQwTuxLD6Bj6g8o1U/BdzYiuvVOvU11UaxeXUDU
	hEkEA2MTs5i/jMETEgPgPxt2jIBCtXkcB/WUcr18N5U0QpxyCn8cyI5XDCNvr1nXoGRbwdEXLBQCG
	WySY1P10Ga90s0QngseJ9ytB30jdwO+P+bpjW9P6zMCii0aQ9VaMC2OPJsV5Gq/Z3+QnJIRMwtYcQ
	q/ACuLeaiO4ompU/WCykifJksP5XSxcQo2FmqPXauo2rDrDWXZ2/OuoYKoJtZURA5SHCybD/Npjor
	ZrHW/Omy/MigjvHQsP0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUTlf-0001jm-01; Tue, 12 Nov 2019 10:51:27 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUTld-0001jM-3d; Tue, 12 Nov 2019 10:51:26 +0000
Received: by mail-wr1-x441.google.com with SMTP id i12so11064544wro.5;
 Tue, 12 Nov 2019 02:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=w3da61b7JGSuBbFW6srTkqcNOALgI1mXsG7keOhSKoE=;
 b=KzPkNF7vLNMPI7wGcpmPKJalQ5TUNvUedqERtpafvcrKVrmh7EjsuZemhpR6OHxdK5
 u+ArAuoXHhBSuufU9nkJuJ46YCS1bDkxm3keA82EHAEoh9AgMpRjs568uZIm2eC4BptZ
 PQtU0v2i27TfrbZWwyi6452Y3EQ6NttTFiQx3bFAEilOtbTyU+M3sT4bFiC7cQ36nzFZ
 yT+xMLkYUqyhXKRvK35qar3+ecDY3LKvVhsXaPlJ+1Lfi4/KgBuAXt/jFfXa/9rZyVYy
 /ZhNEJF0Mbyo+jQYcJFezSWS0YWnz68ZAPoQ8yOJnscfDRwbM1bx9TtIxDSLl48as4eS
 ndpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=w3da61b7JGSuBbFW6srTkqcNOALgI1mXsG7keOhSKoE=;
 b=naun0S9fbOUmel1Rzf3tQ6ZWhzZ92q9OtdS+VMVIBFKJGDRuLlaN2rMqU6zU9+rb6X
 chu8H9q5Mxeuns6F/dZlSltSbMyschO+df+w/mvOIOpzS6r5AIIXAtIQu/KijS4dTyop
 Z6asUZZocWFCrDMP9drl/4P3boe9rVxTkNbDrgAyH1YFw9HMK13UbVgoqBUFXiWJ0H8e
 Gj0qozNYJpo3dMK+No7s/lo6ykbk7EBo08e6jFMX2bBSoSl3O1r8QuKRgqPv9ALn4ITQ
 g9wtUFhO1TpEI6Zt7bwVWc+mkFlpEbcwZbZQOyiCS1+Hn2zk3OkF/SScwGKpBF4VLj2P
 xzGQ==
X-Gm-Message-State: APjAAAW7gFxDZPx+xJFxAovcTip7rMnDtXPGeRYJmJT86zQozVKfWPYd
 +gBvA2ZR0SZvOogRiiMXAPQTTqmPbfWTJrCFIwM=
X-Google-Smtp-Source: APXvYqyi2uw32VMwilcptszDlBFN/85aP+rGSUIN70dz2Tdhs5NchrnBpWKZXr2pFLmq3r7c6O2KfeR3bxkToj+cktw=
X-Received: by 2002:adf:c449:: with SMTP id a9mr3868494wrg.240.1573555883099; 
 Tue, 12 Nov 2019 02:51:23 -0800 (PST)
MIME-Version: 1.0
References: <20191014141718.22603-1-narmstrong@baylibre.com>
 <20191014141718.22603-2-narmstrong@baylibre.com>
 <20191023201141.GA21235@bogus>
 <CA+3zgmsJPsvXgsjDQKKrSG+UNdY3SK+hKCTD2X3hGG+OXejHig@mail.gmail.com>
 <CAKgpwJWU3jB0DWEKE09TOV+YLceBFJ75ZirAXQbuhj8v3FwjXg@mail.gmail.com>
 <c32007f5-88b9-45c5-b542-b1dc4dbc76ea@baylibre.com>
In-Reply-To: <c32007f5-88b9-45c5-b542-b1dc4dbc76ea@baylibre.com>
From: Jun Li <lijun.kernel@gmail.com>
Date: Tue, 12 Nov 2019 18:51:10 +0800
Message-ID: <CAKgpwJVHF6Ytdt9kq5SwiixFDLym_UPG51aXag1nVVay0pzofQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] doc: dt: bindings: usb: dwc3: Update entries for
 disabling SS instances in park mode
To: Neil Armstrong <narmstrong@baylibre.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_025125_173011_F6399B83 
X-CRM114-Status: GOOD (  18.74  )
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
Cc: Felipe Balbi <balbi@kernel.org>, Jianxin Pan <jianxin.pan@amlogic.com>,
 devicetree@vger.kernel.org, khilman@baylibre.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tim <elatllat@gmail.com>,
 Dongjin Kim <tobetter@gmail.com>, linux-amlogic@lists.infradead.org,
 Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhpcyBidWcgZXhpc3RzIG9uIGFsbCBjdXJyZW50IHZlcnNpb25zIHBlciBpbmZvcm1hdGlvbiBJ
IGdvdCBmcm9tIFN5bm9wc3lzLgorIFRoaW5oIE5ndXllbiA8dGhpbmhuQHN5bm9wc3lzLmNvbT4u
CgpMaSBKdW4KCk5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4g5LqOMjAx
OeW5tDEx5pyIMTLml6Xlkajkuowg5LiL5Y2INTowMOWGmemBk++8mgo+Cj4gSGkgTGksCj4KPiBP
biAxMS8xMS8yMDE5IDAyOjU4LCBKdW4gTGkgd3JvdGU6Cj4gPiBIaSBOZWlsCj4gPgo+ID4gQXMg
SSBnb3QgdGhlIGluZm9ybWF0aW9uIGZyb20gU3lub3BzeXMsIHRoaXMgYnVnIGV4aXN0cyBvbiBj
dXJyZW50IElQIHZlcnNpb25zLAo+ID4gYW5kIHBlciBteSB0ZXN0cyB3aXRoIGV4dGVybmFsIFVT
QjMgaHViICsgMiBTdXBlciBzcGVlZCB1ZGlza3Mgb24gZGF0YQo+ID4gcmVhZCBieSBkZCwgSSBj
YW4gcmVwcm9kdWNlIHRoaXMgaXNzdWUgd2l0aCBkaWZmZXJlbnQga2VybmVsIHZlcnNpb25zLCBh
bHNvIEkKPiA+IGRpZG4ndCBzZWUgb2J2aW91cyBwZXJmb3JtYW5jZSBkcm9wIGJ5IGRkIHRlc3Rz
IGFmdGVyIGRpc2FibGUgcGFyayBtb2RlIGZvcgo+ID4gc3VwZXIgc3BlZWQsIHNvIHNob3VsZCB3
ZSBqdXN0IGRpc2FibGUgaXQgYnkgZGVmYXVsdCBzbyBubyBuZWVkIGEgcXVpcms/Cj4KPiBJIGRv
bid0IGhhdmUgYW55IG9waW5pb24gb24gdGhpcywgSSB0aGluayB0aGUgVVNCICYgRFdDMyBtYWlu
dGFpbmVycyBzaG91bGQgZGVjaWRlCj4gaG93IHRvIGhhbmRsZSB0aGlzLgo+Cj4gRGlkIFN5bm9w
c3lzIHNwZWNpZmllZCBhIHJhbmdlIG9mIGFmZmVjdGVkIElQIHZlcnNpb24gPwo+Cj4gTmVpbAo+
Cj4gPgo+ID4gTGkgSnVuCj4gPgo+ID4gVGltIDxlbGF0bGxhdEBnbWFpbC5jb20+IOS6jjIwMTnl
ubQxMeaciDEx5pel5ZGo5LiAIOS4iuWNiDg6NDLlhpnpgZPvvJoKPiA+Pgo+ID4+IFRoYW5rcyBm
b3Igd29ya2luZyBvbiB0aGlzIE5laWwsCj4gPj4gSXMgdGhlcmUgc29tZXRoaW5nIHRoYXQgbmVl
ZHMgZG9pbmcgZm9yIHRoaXMgcGF0Y2ggdG8gbWFrZSBpdCBpbnRvIDUuMyBvciA1LjQ/Cj4gPj4g
QXMgcHJldmlvdXNseSBtZW50aW9uZWQgdGhlIHBhdGNoIHNldCBmaXhlcyB0aGUgaXNzdWUgb24g
YWZmZWN0ZWQgaGFyZHdhcmU7Cj4gPj4gICAgIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cGF0Y2gvMTExNjQ1MTUvCj4gPj4KPiA+Pgo+ID4+Cj4gPj4gT24gV2VkLCBPY3QgMjMsIDIwMTkg
YXQgNDoxMSBQTSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiB3cm90ZToKPiA+Pj4KPiA+
Pj4gT24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMDQ6MTc6MTZQTSArMDIwMCwgTmVpbCBBcm1zdHJv
bmcgd3JvdGU6Cj4gPj4+PiBUaGlzIHBhdGNoIHVwZGF0ZXMgdGhlIGRvY3VtZW50YXRpb24gd2l0
aCB0aGUgaW5mb3JtYXRpb24gcmVsYXRlZAo+ID4+Pj4gdG8gdGhlIHF1aXJrcyB0aGF0IG5lZWRz
IHRvIGJlIGFkZGVkIGZvciBkaXNhYmxpbmcgYWxsIFN1cGVyU3BlZWQgWEhDaQo+ID4+Pj4gaW5z
dGFuY2VzIGluIHBhcmsgbW9kZS4KPiA+Pj4+Cj4gPj4+PiBDQzogRG9uZ2ppbiBLaW0gPHRvYmV0
dGVyQGdtYWlsLmNvbT4KPiA+Pj4+IENjOiBKaWFueGluIFBhbiA8amlhbnhpbi5wYW5AYW1sb2dp
Yy5jb20+Cj4gPj4+PiBSZXBvcnRlZC1ieTogVGltIDxlbGF0bGxhdEBnbWFpbC5jb20+Cj4gPj4+
PiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+
Cj4gPj4+PiAtLS0KPiA+Pj4+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNi
L2R3YzMudHh0IHwgMiArKwo+ID4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykK
PiA+Pj4KPiA+Pj4gU2lnaCwgd2hhdCdzIG9uZSBtb3JlIHRvIHRoZSBuZXZlciBlbmRpbmcgbGlz
dCBvZiBxdWlya3MuLi4KPiA+Pj4KPiA+Pj4gQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtl
cm5lbC5vcmc+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
