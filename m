Return-Path: <SRS0=O/xb=RI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF04C43381
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Mar 2019 14:41:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6914020848
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Mar 2019 14:41:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gwvHMS6E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uzu3D3ta"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6914020848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lwSFKReTO0m5uArfd3hpE/dj9ErugN+SlbJIu8uArdU=; b=gwvHMS6EJNb8RV
	ooWVoGw8ogVnoP2RyvfZvOduKTu+AKVnsIZbdHiekU/5G+AVwyDeV1fftdsRG/dd1FL2dJq+2Zbw9
	Txla1ZT1iqFw7oPa1ekVBCOI9I4oe6/M9Pb9BgZcCwJ/v16YBu99nb61m8rAZzw5eZdrLiQgogYdu
	t3MbdDiiZpSwEes1eCND4Y8Uni6djYakvT2EZPgW/yxXjJDePqy9MkaNr49FPajOpeGaWZPRKhgWm
	SD53Ny4gmNvKfakIVVV4kgmTJe1bGjj/9YvgHCP7hJiV1SiiK4jspVx0NjEnUpKaqzJ4X/VD5uzTi
	xlQG7nrPpHMlH/MKO5iw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1BFY-0006bj-71; Tue, 05 Mar 2019 14:40:56 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1BFT-0006bG-W3
 for linux-amlogic@lists.infradead.org; Tue, 05 Mar 2019 14:40:53 +0000
Received: by mail-qt1-x842.google.com with SMTP id o6so9137885qtk.6
 for <linux-amlogic@lists.infradead.org>; Tue, 05 Mar 2019 06:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=m3HdspcP01oqd+8Gc3wdISXIH3pF9nzA+hiIW0Rirow=;
 b=Uzu3D3tack//+mSCBtp5j48d4jBo0Gkh+GYeT0xKPmbqIUleArxL2GeGsdCMf6t6Em
 ygfMDnfxOk1sgzMD/epAlxFp7kTxpcrQ2VA/ZL9vAhElKflVfYh+5ITVE7/DF1urgrkG
 IYk3mSm3h45RFS9teoRFM/xzKW6jjumB9tt3L7BJiNsQOIlWcATrQp8THp5pNj2UGNfo
 PR/p2+BIWyHbA6CP6aEbk5VGbBI+Ht+ijzEVSkzSYOyXucuW4es6pfBXNL/cOlgOzjIW
 ewYtGwJcF3/g2N6bcHFYjLk7vaeObWGRjDV3/APzCXCvzVbEXhRRKN8naYUt7yW2JCg2
 YOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m3HdspcP01oqd+8Gc3wdISXIH3pF9nzA+hiIW0Rirow=;
 b=Qm01h/w2P4PYzdDXTkeQJYPvSgqQpVnzOTgNup9lwq5yql73AFwFc5v9WKsWoGTL0Q
 cbRsqMx56A4Cy7rPtWkV2JAEGknB6w54HsWufATSB3UQqDUlX3x2FkM++lKl7j7HaP4V
 +c2DyQRTt/G7NzdgHSpzQDml8Pf6eH+zXXt9C1k3I5BZhLFp9EtWdjkalDjinHBerzxa
 T41Rudt9Oy9dUp1dVYILLnWywdOT3yWoQN4KpmvT/9W4P7VK3hUkDTgpo3x9asc2gDvq
 o7rL5WlMsHl9v5/xV/3PHgLCDlDrpokilfPXChSAUYsLTh4DcjubQKA4jO4g7Gxc9M82
 +0wg==
X-Gm-Message-State: APjAAAVFi0JvBgYoRZXU1BIUqw0dOjm9szeXwUyiwnHCTG+xiqKMPQ5L
 8un1ozmLhzioJtGbUS1xJG26Ay8DeV7ALt49IWo=
X-Google-Smtp-Source: APXvYqwyl8DLDehrGowly1xmbgqxBK65DhmNyuHK4i3KImZjhcpBO2N5pf3mONRLWuxMdxYIKeMUnGvYh7GUWqXO8NY=
X-Received: by 2002:ac8:f76:: with SMTP id l51mr1651495qtk.248.1551796849175; 
 Tue, 05 Mar 2019 06:40:49 -0800 (PST)
MIME-Version: 1.0
References: <CAJDSL=VG2YbAwuL_1SOVfWfD4gWquNG353p8LkCP+jiFpiN=9A@mail.gmail.com>
 <CAJDSL=W7X3am=iCOvafyzLuL8hzZriDWh4Zs2zfgBZDdDJtx7w@mail.gmail.com>
 <d1e057447b1c9ca832db3161242e35963bb15ba0.camel@baylibre.com>
 <CAJDSL=X09A5KCT5BLSpMwBRUW_7rb2skJiS99qzTWr+cYcLhtA@mail.gmail.com>
In-Reply-To: <CAJDSL=X09A5KCT5BLSpMwBRUW_7rb2skJiS99qzTWr+cYcLhtA@mail.gmail.com>
From: =?UTF-8?B?QW5kcsOpIEJhbHNh?= <andrebalsa@gmail.com>
Date: Tue, 5 Mar 2019 15:40:38 +0100
Message-ID: <CAJDSL=W=EMb3YZikBd5K6nzp+3kLm4O5OXaxgiBtQLMUPfk=CA@mail.gmail.com>
Subject: Re: Possible regression in driver meson-gx-mmc in kernel 5.0.0
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190305_064052_051990_25CF3186 
X-CRM114-Status: GOOD (  23.07  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGVsbG8sIEplcm9tZSwgbGlzdCwKCkFmdGVyIG1vcmUgdGVzdGluZywgSSBtYW5hZ2VkIHRvIHRy
YWNlIHRoZSBleGFjdCBwYXRjaCB0aGF0IHdhcwpjYXVzaW5nIHRoZSBTRCBjYXJkIHdyaXRlIGVy
cm9ycyB0aGF0IEkgc2F3IHdpdGgga2VybmVsIDUuMC4wIGFuZCB3YXMKbm90IHNlZWluZyB3aXRo
IGtlcm5lbCA0LjIwLjEzIGFuZCBlYXJsaWVyOgppdCBpcyB2ZXJ5IGV4YWN0bHkgW1JGVCBQQVRD
SCAzLzRdIG1tYzogbWVzb24tZ3g6IGFsaWduIGRlZmF1bHQgcGhhc2UKb24gc29jIHZlbmRvciB0
cmVlCiBmcm9tIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE4LzEyLzYvNzQ2CgpUaGUgcGF0Y2gg
YWN0dWFsbHkganVzdCBjaGFuZ2VzIGEgc2luZ2xlIHZhbHVlIGluIGEgc2luZ2xlIGxpbmUgb2Yg
Y29kZToKCi0gY2xrX3NldF9waGFzZShob3N0LT50eF9jbGssIDI3MCk7CisgY2xrX3NldF9waGFz
ZShob3N0LT50eF9jbGssIDApOwoKVGhlIHBhdGNoIHNwZWNpZmljYWxseSBzdGF0ZXMgdGhhdCB0
aGUgdmFsdWUgb2YgemVybyBkb2VzIG5vdCBtYXRjaAp0aGUgcmVjb21tZW5kZWQgdmFsdWUgaW4g
dGhlICh2ZW5kb3IpIGRvY3VtZW50YXRpb24sIGJ1dCBzZXRzIHRoZSBzYW1lCnZhbHVlIGFzIGlu
IHRoZSB2ZW5kb3IgdHJlZS4gU28gaXQgc2VlbXMgdGhlcmUgaXMgYSBtaXNtYXRjaCBiZXR3ZWVu
CnRoZSB2ZW5kb3IgdHJlZSBhbmQgdGhlIHZlbmRvciBkb2N1bWVudGF0aW9uIChJIGFtIGd1ZXNz
aW5nIHRoYXQgaXMKbm90IGFuIHVuY29tbW9uIHNpdHVhdGlvbikuCgpJZiB5b3UgY291bGQga2lu
ZGx5IHBvaW50IG1lIHRvIHRoZSBkb2N1bWVudGF0aW9uIGFuZCB0aGUgdmVuZG9yIHRyZWUKcmVw
b3NpdG9yeSwgSSB3b3VsZCBiZSBhYmxlIHRvIHBlcmhhcHMgYnJpbmcgc29tZSBtb3JlIGNsYXJp
ZnlpbmcKaW5mb3JtYXRpb24gZm9yIHRoaXMgaXNzdWU/CgpPbiBNb24sIE1hciA0LCAyMDE5IGF0
IDU6NTUgUE0gQW5kcsOpIEJhbHNhIDxhbmRyZWJhbHNhQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBI
aSBKZXJvbWUsCj4gVGhhbmtzIGZvciB0aGUgYW5zd2VyLgo+Cj4gPiBZb3UgcmV2ZXJ0ZWQgbW9y
ZSB0aGFuIG9uZSBwYXRjaCBoZXJlLiIKPgo+IFllcywgSSBkaWRuJ3Qga25vdyB3aGljaCBwYXRj
aCBleGFjdGx5IHdhcyBjYXVzaW5nIHRoZSBwcm9ibGVtLgo+IElmIHlvdSB3YW50IG1lIHRvIHRl
c3QgdGhlIGRyaXZlciB3aXRoIHRoZSBzcGlubG9jayByZW1vdmFsIHBhdGNoKGVzKQo+IGFwcGxp
ZWQgYnV0IHdpdGhvdXQgdGhlIGRlbGF5IC8gcGhhc2Ugc2V0dGluZyBwYXRjaChlcyksIGp1c3Qg
c2F5Lgo+Cj4gUmVnYXJkcywKPiBBbmRyZXcKPgo+IE9uIE1vbiwgTWFyIDQsIDIwMTkgYXQgNDoz
NCBQTSBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4gPgo+ID4g
T24gTW9uLCAyMDE5LTAzLTA0IGF0IDE0OjQ2ICswMTAwLCBBbmRyw6kgQmFsc2Egd3JvdGU6Cj4g
PiA+IEhlbGxvLCBteSBmaXJzdCBwb3N0IHRvIHRoZSBsaXN0LCBuaWNlIHRvIG1lZXQgZXZlcnli
b2R5Lgo+ID4gPgo+ID4gPiBJIGNhbm5vdCBib290IGtlcm5lbCA1LjAuMCBvbiBteSBTOTA1IFRW
IGJveCAodXNpbmcKPiA+ID4gbWVzb24tZ3hiYi1wMjAxLmR0YikgZnJvbSBhbiBTRCBjYXJkLCBz
ZWUgdGhlIGVycm9ycyBiZWxvdyAoY2FwdHVyZWQKPiA+ID4gZnJvbSBzZXJpYWwgb3V0cHV0KS4K
PiA+Cj4gPiBBcyBJIGFscmVhZHkgcG9pbnRlZCBvdXQgdG8gc29tZWJvZHkgZWxzZSwgaXQgaXMg
ZGlmZmljdWx0IHRvIGdpdmUgYW55IGZvcm0gb2YKPiA+IHN1cHBvcnQgZm9yIGJvYXJkcyB3ZSBr
bm93IG5vdGhpbmcgYWJvdXQsIGVzcGVjaWFsbHkgdGhlIG9uZSB0aGF0IGFyZQo+ID4gJ2NvbnZl
bmllbnRseScgdXNpbmcgdGhlIERUIG9mIHRoZSByZWYgZGVzaWduCj4gPgo+ID4gPgo+ID4gPiBJ
ZiBJIHJldmVydCBvbmx5IG1lc29uLWd4LW1tYy5jIHRvIHRoZSB2ZXJzaW9uIGluIGtlcm5lbCA0
LjIwLjEzLAo+ID4gPiBrZXJuZWwgNS4wLjAgYm9vdHMgd2l0aG91dCBhbnkgcHJvYmxlbXMuCj4g
Pgo+ID4gWW91IHJldmVydGVkIG1vcmUgdGhhbiBvbmUgcGF0Y2ggaGVyZS4KPiA+Cj4gPiA+Cj4g
PiA+IEl0IHNlZW1zIHRoZSBwcm9ibGVtcyBvY2N1ciBiZWNhdXNlIG9mIHBhdGNoZXMgaW50cm9k
dWNlZCBieSBKZXJvbWUKPiA+ID4gQnJ1bmV0IGluIERlY2VtYmVyLCBzZWUKPiA+ID4gaHR0cHM6
Ly9sa21sLm9yZy9sa21sLzIwMTgvMTIvNi83NDUKPiA+ID4KPiA+ID4gTXkgZ3Vlc3MgaXMgdGhl
IHJlbW92YWwgb2YgdGhlIHNwaW5sb2NrIGFsbG93cyBmb3IgcmFjZSBjb25kaXRpb25zCj4gPiA+
IHRoYXQgY2F1c2UgdGhlIG1tYyBkcml2ZXIgdG8gZmFpbCB3aGVuIHdyaXRpbmcgdG8gYW4gU0Qg
Y2FyZC4KPiA+Cj4gPiAxKSBBcyBwb2ludGVkIG91dCBpbiB0aGUgcmVsYXRlZCBjb21taXQgbWVz
c2FnZSB0aGlzIHNwaW5sb2NrIHdhcyB1c2VsZXNzLgo+ID4gQW55b25lIGxvb2tpbmcgYXQgdGhl
IGNvZGUgc2hvdWxkIGJlIGFibGUgdG8gc2VlIHRoYXQuIFdoYXQgeW91IGFyZSBzZWVpbmcgaXMK
PiA+IHRoZSByZXN1bHQgb2YgQ1JDIGVycm9ycy4KPiA+Cj4gPiAyKSBUaGUgbGFzdCAyIHBhdGNo
ZXMgb2YgcmVsYXRlZCBzZXJpZXMgaGFkIGJlZW4gc2VudCBhcyBSRlQsIGJ1dCBub2JvYnkKPiA+
IHJlcGxpZWQuCj4gPgo+ID4gVGhlc2UgMiBjaGFuZ2VzIGhlbHBlZCBzZXZlcmFsIGRlc2lnbnMg
d29yayBhbmQgSSBjb3VsZCBub3Qgc2VlIGFueSByZWdyZXNzaW9uCj4gPiBvbiB0aGUgZGVzaWdu
cyBJIGhhZCBhdCB0aGUgdGltZSwgaW5jbHVkaW5nIHRoZSBwMjAwCj4gPgo+ID4gTm93IHdlIGdv
dCBzZXZlcmFsIHJlcG9ydHMgb2YgcmVncmVzc2lvbi4KPiA+Cj4gPiBJdCBpcyB2ZXJ5IGRpZmZp
Y3VsdCB0byBmaW5kIHNldHRpbmdzIHRoYXQgd2lsbCB3b3JrIGZvciB0aGUgYWxsIHRoZSBkZXNp
Z25zLgo+ID4gVGhlIGRvY3VtZW50YXRpb24gaXMgbm90IHZlcmJvc2UgcmVnYXJkaW5nIHRoaXMu
IFlvdSBjYW4ndCBldmVuIHRha2UgdGhlCj4gPiB2ZW5kb3Iga2VybmVsIGFzIHJlZmVyZW5jZSwg
dGhlIGNvZGUgaXMgZXh0cmVtZWx5ICdmYW5jeScgYW5kIHBoYXNlIHNldHRpbmdzCj4gPiBhcmUg
cGVycGV0dWFsbHkgY3ljbGluZyB3aXRoaW4gdGhlIGlycSBoYW5kbGVyLCB3aGljaCBpcyB1bmFj
Y2VwdGFibGUuCj4gPgo+ID4gV2UgYXJlIGFjdGl2ZWx5IHdvcmtpbmcgdG8gc29sdmUgdGhpcyBh
bmQgaG9wZWZ1bGx5IHdlIHdpbGwgYmUgYWJsZSB0byBzaGFyZQo+ID4gc29tZXRoaW5nIHNvb24K
PiA+Cj4gPiA+Cj4gPiA+IEkgYW0gYXZhaWxhYmxlIHRvIHRlc3QgdGhlIGRyaXZlciBmdXJ0aGVy
IHdpdGggYW55IHByb3Bvc2VkIHNvbHV0aW9uLgo+ID4gPgo+ID4gPiBSZWdhcmRzLAo+ID4gPiBB
bmRyZXcKPiA+Cj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
