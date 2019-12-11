Return-Path: <SRS0=S6c6=2B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0890C43603
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Dec 2019 00:46:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9423E206D5
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Dec 2019 00:46:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y0OWmL+k";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSQi9449"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9423E206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kIvBWHBCihgpksMoa+JZEbc3L8o4rFGeX1m4hxYrggo=; b=Y0OWmL+khDMTIk
	0ayvtRiIavT3+YnDtk/BGC8hNMKbmzgWMWy2rMFuD3B7EN9JW3wCY6F4OiBW/9u7TnkLhJJ94HFD3
	RsGHrz/h0o9MVAwwrxyBYhm6BX4BqnAUCTlSHzfALohZSRmQrU4C8yl1C7RfIUhkYBf1CCdDe8Ihz
	SJbUCOLSh4EoINmagIpoqKBjIB1Ay1SBLP5PDg1cU7JnHulv3HPELAZO4FjpKaIwLyV/CSG5J0QgA
	a7W5XaSc3RxHFFIxzTfsG6dwDzcSWdOeQRsTcS9+SiBemwXmIcdk7VWoHmOtoRzbkK6rS6ifXVJjd
	4JO11Z3gkNZt+vRHfV7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieq8p-0000n0-MG; Wed, 11 Dec 2019 00:46:11 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieq8m-0000mG-0D; Wed, 11 Dec 2019 00:46:09 +0000
Received: by mail-ot1-x344.google.com with SMTP id h20so17314008otn.5;
 Tue, 10 Dec 2019 16:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dNo8gQB2Lns6lssefACZcuCEFfgXMn9otoHM3Ump6ZU=;
 b=MSQi9449EbBVtE8SBD/GOeFr9lc1VEeadwIPv0OUHQIqzCemeFd7M/BqaTHJH2HbFC
 VyC2WdGAJ0Oy7BMvm6c+VXsJmVA9T5O44nKl/i7bv6PirSOnQbfzSRo6tWVFKd5w1Tzp
 EM+9Ny2MRBFb5NHvtnHw5Dye3NOTdNk7MqGkiIxyjoSL4Fv19pYxLtPnlF66mlPaY0BU
 ccadh1t27sktMAwSiei7ID54Jtbum+31GKoG2tV0xt3XzxvvBIYyHzo1sRSy99F1emGF
 BpQeZnZqYUN6v+/AO5QZoW5U5JqSERSUYzkuCLqTi/DD2JIqIxn8V8guYI5nTfJyhAcF
 Toaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dNo8gQB2Lns6lssefACZcuCEFfgXMn9otoHM3Ump6ZU=;
 b=bpsvLKRVANYUJZltFrnyRnSqPi6Ly0eTdrR687bGwLMhdGpIaATXqhoj8EHfwjPhhC
 7c5reKVTcB/VY9ycvPwLTZg7OjrsRZhT5nKH5VAfF4k9mC3zPmIxmReM+etJN3RPML3z
 3YUvn8RT1djyINVRNIsmW0GioUebCm/qsxh3nDlvVGkcVhPppffDzC1t/ZjdHXC5+OzF
 Daw9p3yDQGMfwTjdiCFED5mC1hkmyF0ZIsdZlLhxgvoMTI1i+Uf9SnAe+0e7YNXcNyDH
 mMXwt8wmHu7CmZKFurRn/wBYlwZIPhLijvaO9XARp2SwmgNNHEsvZzhUCgfGbLa/a5g7
 8cMg==
X-Gm-Message-State: APjAAAXkSz3ZQ0adgfRHAZzuNVgvzIXMc0ZQkN1veHJmgRMWLHEq3J9I
 msnpQMV93LbfGyAaBBXUCSllZPxDeUzL+ttp/oysgkvUwd0=
X-Google-Smtp-Source: APXvYqxlHTr1UZyzC6aCajvAM4W2Nsg3YlT+KI7UUGo3jxS4zv5rW02mvvBuzLyLP3MDtSmh3sJHzcCwjpOwaw6OzaY=
X-Received: by 2002:a9d:4f0e:: with SMTP id d14mr452420otl.90.1576025165539;
 Tue, 10 Dec 2019 16:46:05 -0800 (PST)
MIME-Version: 1.0
References: <20191014141718.22603-1-narmstrong@baylibre.com>
 <20191014141718.22603-2-narmstrong@baylibre.com>
 <20191023201141.GA21235@bogus>
 <CA+3zgmsJPsvXgsjDQKKrSG+UNdY3SK+hKCTD2X3hGG+OXejHig@mail.gmail.com>
 <CAKgpwJWU3jB0DWEKE09TOV+YLceBFJ75ZirAXQbuhj8v3FwjXg@mail.gmail.com>
 <c32007f5-88b9-45c5-b542-b1dc4dbc76ea@baylibre.com>
 <CAKgpwJVHF6Ytdt9kq5SwiixFDLym_UPG51aXag1nVVay0pzofQ@mail.gmail.com>
 <45212db9-e366-2669-5c0a-3c5bd06287f6@synopsys.com>
 <ce35b6d2-7ed1-be2d-6e38-4c6e89340a40@baylibre.com>
In-Reply-To: <ce35b6d2-7ed1-be2d-6e38-4c6e89340a40@baylibre.com>
From: Tim <elatllat@gmail.com>
Date: Tue, 10 Dec 2019 19:45:54 -0500
Message-ID: <CA+3zgmtWQwdJG5NT-t7__Mqt5u_U3m4+HEL6p4PWxx5NES7_AQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] doc: dt: bindings: usb: dwc3: Update entries for
 disabling SS instances in park mode
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_164608_070566_044A7B44 
X-CRM114-Status: GOOD (  24.11  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Felipe Balbi <balbi@kernel.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jun Li <lijun.kernel@gmail.com>, "khilman@baylibre.com" <khilman@baylibre.com>,
 Dongjin Kim <tobetter@gmail.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 Rob Herring <robh@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SnVzdCB3cml0aW5nIHRvIHNheTsKdGhpcyBwYXRjaCBpcyBzdGlsbCBwZXJmb3JtaW5nIHdlbGwg
b24gNS41LjAtcmMxLCBhbmQKdGhlcmUgaXMgbm8gc3BlZWQgaW1wcm92ZW1lbnQgYnkgYWRkaW5n
IERXQzNfR1VDVExfTkFLX1BFUl9FTkhfSFMgQklUKDE3KQogICAgSSBnZXQgdXAgdG8gMzg5MCBt
cyBzZWNvbmQgbGFnIHdpdGggInBpbmcgLXMgNTEyMCAkSVAiIHdoZW4KY29weWluZyBiZXR3ZWVu
IFVTQiBIRERzIGVpdGhlciB3YXksIGJ1dCBhdCBsZWFzdCB0aGlzIHBhdGNoIHN0b3BzIHRoZQpj
cmFzaGluZy4KCgpPbiBUdWUsIERlYyAxMCwgMjAxOSBhdCAzOjU1IEFNIE5laWwgQXJtc3Ryb25n
IDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4KPiBIaSwKPgo+IE9uIDEyLzExLzIw
MTkgMjE6MDMsIFRoaW5oIE5ndXllbiB3cm90ZToKPiA+IEhpLAo+ID4KPiA+IEp1biBMaSB3cm90
ZToKPiA+PiBUaGlzIGJ1ZyBleGlzdHMgb24gYWxsIGN1cnJlbnQgdmVyc2lvbnMgcGVyIGluZm9y
bWF0aW9uIEkgZ290IGZyb20gU3lub3BzeXMuCj4gPj4gKyBUaGluaCBOZ3V5ZW4gPHRoaW5obkBz
eW5vcHN5cy5jb20+Lgo+ID4+Cj4gPj4gTGkgSnVuCj4gPgo+ID4gVGhlIEdVQ1RMMS5QQVJLTU9E
RV9ESVNBQkxFX1NTIGlzIG9ubHkgYXZhaWxhYmxlIGluIGR3Y191c2IzIGNvbnRyb2xsZXIKPiA+
IHJ1bm5pbmcgaW4gaG9zdCBtb2RlLiBUaGlzIHNob3VsZCBub3QgYmUgc2V0IGZvciBvdGhlciBJ
UHMuCj4gPgo+ID4gVGhpcyBjYW4gYmUgZGlzYWJsZWQgYnkgZGVmYXVsdCBiYXNlZCBvbiBJUCwg
YnV0IEkgcmVjb21tZW5kIHRvIGhhdmUgYQo+ID4gcHJvcGVydHkgdG8gZW5hYmxlIHRoaXMgZmVh
dHVyZSBmb3IgZGV2aWNlcyB0aGF0IG5lZWQgdGhpcy4KPgo+IFRoYW5rcywgc28gdGhpcyBwYXRj
aHNldCBpcyB0aGUgcmlnaHQgd2F5IHRvIHNvbHZlIHRoaXMuCj4KPiBGZWxpcGUsIHdvdWxkIGl0
IGJlIHBvc3NpYmxlIHRvIGhhdmUgaXQgbWVyZ2VkIGZvciBuZXh0IHJlbGVhc2UgPwo+IFNob3Vs
ZCBJIHJlc2VuZCBpdCA/Cj4KPiBUaGFua3MsCj4gTmVpbAo+Cj4gPgo+ID4KPiA+Pgo+ID4+IE5l
aWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4g5LqOMjAxOeW5tDEx5pyIMTLm
l6Xlkajkuowg5LiL5Y2INTowMOWGmemBk++8mgo+ID4+PiBIaSBMaSwKPiA+Pj4KPiA+Pj4gT24g
MTEvMTEvMjAxOSAwMjo1OCwgSnVuIExpIHdyb3RlOgo+ID4+Pj4gSGkgTmVpbAo+ID4+Pj4KPiA+
Pj4+IEFzIEkgZ290IHRoZSBpbmZvcm1hdGlvbiBmcm9tIFN5bm9wc3lzLCB0aGlzIGJ1ZyBleGlz
dHMgb24gY3VycmVudCBJUCB2ZXJzaW9ucywKPiA+Pj4+IGFuZCBwZXIgbXkgdGVzdHMgd2l0aCBl
eHRlcm5hbCBVU0IzIGh1YiArIDIgU3VwZXIgc3BlZWQgdWRpc2tzIG9uIGRhdGEKPiA+Pj4+IHJl
YWQgYnkgZGQsIEkgY2FuIHJlcHJvZHVjZSB0aGlzIGlzc3VlIHdpdGggZGlmZmVyZW50IGtlcm5l
bCB2ZXJzaW9ucywgYWxzbyBJCj4gPj4+PiBkaWRuJ3Qgc2VlIG9idmlvdXMgcGVyZm9ybWFuY2Ug
ZHJvcCBieSBkZCB0ZXN0cyBhZnRlciBkaXNhYmxlIHBhcmsgbW9kZSBmb3IKPiA+Pj4+IHN1cGVy
IHNwZWVkLCBzbyBzaG91bGQgd2UganVzdCBkaXNhYmxlIGl0IGJ5IGRlZmF1bHQgc28gbm8gbmVl
ZCBhIHF1aXJrPwo+ID4+PiBJIGRvbid0IGhhdmUgYW55IG9waW5pb24gb24gdGhpcywgSSB0aGlu
ayB0aGUgVVNCICYgRFdDMyBtYWludGFpbmVycyBzaG91bGQgZGVjaWRlCj4gPj4+IGhvdyB0byBo
YW5kbGUgdGhpcy4KPiA+Pj4KPiA+Pj4gRGlkIFN5bm9wc3lzIHNwZWNpZmllZCBhIHJhbmdlIG9m
IGFmZmVjdGVkIElQIHZlcnNpb24gPwo+ID4+Pgo+ID4+PiBOZWlsCj4gPj4+Cj4gPj4+PiBMaSBK
dW4KPiA+Pj4+Cj4gPj4+PiBUaW0gPGVsYXRsbGF0QGdtYWlsLmNvbT4g5LqOMjAxOeW5tDEx5pyI
MTHml6XlkajkuIAg5LiK5Y2IODo0MuWGmemBk++8mgo+ID4+Pj4+IFRoYW5rcyBmb3Igd29ya2lu
ZyBvbiB0aGlzIE5laWwsCj4gPj4+Pj4gSXMgdGhlcmUgc29tZXRoaW5nIHRoYXQgbmVlZHMgZG9p
bmcgZm9yIHRoaXMgcGF0Y2ggdG8gbWFrZSBpdCBpbnRvIDUuMyBvciA1LjQ/Cj4gPj4+Pj4gQXMg
cHJldmlvdXNseSBtZW50aW9uZWQgdGhlIHBhdGNoIHNldCBmaXhlcyB0aGUgaXNzdWUgb24gYWZm
ZWN0ZWQgaGFyZHdhcmU7Cj4gPj4+Pj4gICAgICBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2lu
dC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX3BhdGNod29yay5rZXJuZWwub3JnX3BhdGNoXzExMTY0
NTE1XyZkPUR3SUZhUSZjPURQTDZfWF82SmtYRng3QVhXcUIwdGcmcj11OUZZb3hLdHloanJHRmN5
aXhGWXFUancxWlgwVnNHMmQ4RkNtemtUWS13Jm09QkNmUkhNOWU4NjAzOVN1MC1RdktfeVVqTm5Z
cm5sX0JjdnhUdFZpeXBUOCZzPWFWNXU3dXhOWDZvVExCM18tcU51enJOdnlpcXhfclBDNlA5VE1x
Ry1MTkUmZT0KPiA+Pj4+Pgo+ID4+Pj4+Cj4gPj4+Pj4KPiA+Pj4+PiBPbiBXZWQsIE9jdCAyMywg
MjAxOSBhdCA0OjExIFBNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+
Pj4+PiBPbiBNb24sIE9jdCAxNCwgMjAxOSBhdCAwNDoxNzoxNlBNICswMjAwLCBOZWlsIEFybXN0
cm9uZyB3cm90ZToKPiA+Pj4+Pj4+IFRoaXMgcGF0Y2ggdXBkYXRlcyB0aGUgZG9jdW1lbnRhdGlv
biB3aXRoIHRoZSBpbmZvcm1hdGlvbiByZWxhdGVkCj4gPj4+Pj4+PiB0byB0aGUgcXVpcmtzIHRo
YXQgbmVlZHMgdG8gYmUgYWRkZWQgZm9yIGRpc2FibGluZyBhbGwgU3VwZXJTcGVlZCBYSENpCj4g
Pj4+Pj4+PiBpbnN0YW5jZXMgaW4gcGFyayBtb2RlLgo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IENDOiBE
b25namluIEtpbSA8dG9iZXR0ZXJAZ21haWwuY29tPgo+ID4+Pj4+Pj4gQ2M6IEppYW54aW4gUGFu
IDxqaWFueGluLnBhbkBhbWxvZ2ljLmNvbT4KPiA+Pj4+Pj4+IFJlcG9ydGVkLWJ5OiBUaW0gPGVs
YXRsbGF0QGdtYWlsLmNvbT4KPiA+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25n
IDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KPiA+Pj4+Pj4+IC0tLQo+ID4+Pj4+Pj4gICBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2R3YzMudHh0IHwgMiArKwo+ID4+Pj4+
Pj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gPj4+Pj4+IFNpZ2gsIHdoYXQn
cyBvbmUgbW9yZSB0byB0aGUgbmV2ZXIgZW5kaW5nIGxpc3Qgb2YgcXVpcmtzLi4uCj4gPj4+Pj4+
Cj4gPj4+Pj4+IEFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+ID4KPiA+
IEJSLAo+ID4gVGhpbmgKPiA+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
