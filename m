Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4441E77198
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jan 2025 13:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jcZrjLJBTtjVeooTb0hiAuH1dxIN3+c5iAumC+G4Z9g=; b=uRRVPNPDmdK5KX
	+qFCprjEXHfB4Fsqamd9e/qCdI/4sBYCUuOH78AbIVdl0+xf6kg/BdTSv6k2d4u8csVsZ0D4CaLSZ
	PIkmYliQs2AvQy4u17o2ItutRCwGheKZ2BAyVeWVT85ZG72n1hMwZdgo/UwsOzKCEtr5rcFkjoZm5
	fAOSMHmCrUa/I+AqY82qAPAJg2zxmuu6fw/l/YnamWW7RJV9P4lgaKO456cKgqcrM11CpzsaSfsnK
	wPQ1cEGEKnjw32iGCYkqLQAeS1IzPeLbJhW6NG+a09MdeHSj0lHdiYggz6uNB9cNd3qxjdvbfE24r
	ZEeiplze5V6WKar/RgEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUn6E-00000001OYK-09Ds;
	Mon, 06 Jan 2025 13:24:54 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUn5e-00000001OL7-2P8U
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Jan 2025 13:24:20 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso7710231f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Jan 2025 05:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736169856; x=1736774656; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wh7y9ZL8IHaZKAw4Kx4QJ+0Dl9iHJaYj8tnVocIhEBI=;
        b=Vsp2EK/rGA69PO48gKE1pxCnvYM/JS4YlIymi1sFI9tnN8fq21ufkA0RttRKHqUfbr
         CfzFoO0GerF1PtgaONUu74pxulR6DkS1xcJc2G6jtRTgkMo6Y0X9/IxPpn2Ibzm/erXg
         hY/+eFCn1rI3DVrz2pJQPk9FOdDtBaqqFR7fHZPGEtqVCwlApa71u1y+yuuxvxvGhtAT
         5+rTKu4n75z6v92awWBI2LzNJE+Gy4DP4z85GBDom/5iaoCWrrlf32EvQ2E++scUu+VN
         VQ7psVdn/znSJ2sPj1hs/mbHIl4CDiV2RgwIQ4asIy5f/7DVaGjCD/GUWiTgQDbJhpZ8
         ay/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736169856; x=1736774656;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wh7y9ZL8IHaZKAw4Kx4QJ+0Dl9iHJaYj8tnVocIhEBI=;
        b=FWv0C5o+LM04nqzyZAEiDFYggkOn0c8W7r3dwElRilbVRYYED7Va2HjZo6Hs8dZqMj
         5dEnfQF+uNiz238rG8AIcHzASGZdaSh7+khQ7QGW7VhpHyk2nQA+CVd52hVzSaUneSZC
         EXciWSytsbFc3a1z6O18HY4IQ/ZI8peEGl70UavYjsld3eR/o8j6KAyVn+NMk2loEpy/
         oO9f7Jm8gysY33NAjqC6TBjCkEej7Q30ZfmDkw6Ew3pb/f5/JIayr6BSdVsdlGG4XaFB
         Wn3Dr9xrLnjSp/U/n0M6dHlOi+S87ijqprmUTEfPMbuoAoWv3NPpmAlHw816q1AnXq96
         NnAw==
X-Gm-Message-State: AOJu0Ywug/QchHV0IT3sgPQsmcOXK4z4N9sjP4e8mpZqRmdjnieub/bL
	GcdLOEJqlqIcWr9ldTfFo4yXrPZZ1FoZhpAXk5d08aC/aJc2M2ufj2nuYzZPbNs=
X-Gm-Gg: ASbGncvBQPJ9kHNYe0KgskbhEYeU7AXa/eSqGNLy9DR+i2tl8VNpfFe2MDvZQ0z8xA5
	kE87NaXQali62+59RqES2toUSGzxggnxwEpvrlHCVO/FOd3ijnt9tP18vErv29pfBabCWwh0yZ6
	A7uYi/vFebinUzp91zs/cEMyMotVnvmhLAsU3D5KQIL+gkARvYpmYKGYibSX9OnNmf5EgfwQj5i
	VtSurQxHpe7XSRLKOa4WimIz9xkeGC4/AgqfCGNFV48IB+Tsn7hM8xr
X-Google-Smtp-Source: AGHT+IEYX2sk1R9ukeY4XWDMmDErFBY6fzPWeg/ypRYwHmYveU89A+VrD/4Ey7f29RphiwDzBZmMKg==
X-Received: by 2002:a05:6000:178b:b0:385:e303:8dd8 with SMTP id ffacd0b85a97d-38a221ffda0mr51262438f8f.26.1736169856421;
        Mon, 06 Jan 2025 05:24:16 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:2a4a:e041:e2ff:6b41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8330e0sm47133587f8f.34.2025.01.06.05.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 05:24:16 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org,  linux-sound@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  dmitry.baryshkov@linaro.org
Subject: Re: meson-aiu: HDMI codec .prepare() callback not called
In-Reply-To: <CAFBinCCAAZHqrKHyfwHPqk9Ki9nDeGFFQfj34ZF58wj+6AjH-g@mail.gmail.com>
	(Martin Blumenstingl's message of "Mon, 6 Jan 2025 13:49:44 +0100")
References: <CAFBinCDdiJ3UNVUcShjq=7U2=oUwT3ciYdKSuZ5TdcrikxFBpg@mail.gmail.com>
	<1ja5c4b4rt.fsf@starbuckisacylon.baylibre.com>
	<CAFBinCCAAZHqrKHyfwHPqk9Ki9nDeGFFQfj34ZF58wj+6AjH-g@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 06 Jan 2025 14:24:15 +0100
Message-ID: <1j4j2caxds.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_052418_876664_4A5C21BB 
X-CRM114-Status: GOOD (  21.88  )
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

T24gTW9uIDA2IEphbiAyMDI1IGF0IDEzOjQ5LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4u
Ymx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiB3cm90ZToKCj4gSGkgSmVyb21lLAo+Cj4gT24g
TW9uLCBKYW4gNiwgMjAyNSBhdCAxMTo0NOKAr0FNIEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5
bGlicmUuY29tPiB3cm90ZToKPiBbLi4uXQo+PiA+IEkgaGF2ZSBmdXJ0aGVyIHZlcmlmaWVkIHRo
YXQgdGhlIGd4LWNhcmQgcGFyc2luZyBkb2VzIGZpbmQgdGhlIEhETWkKPj4gPiBjb250cm9sbGVy
IGFuZCBsaW5rcyBpdCBjb3JyZWN0bHkuCj4+ID4gVG8gbWUgaXQncyBvZGQgdGhhdCBvbmx5IHRo
ZSAucHJlcGFyZSgpIGNhbGxiYWNrIGlzIG5vdCBjYWxsZWQsIGFsbAo+PiA+IG90aGVycyAoYXMg
bWVudGlvbmVkIGFib3ZlOiAuaHdfcGFyYW1zLCAuc3RhcnR1cCwgLi4uKSBhcmUgd29ya2luZwo+
PiA+IGZpbmUuCj4+Cj4+IEkgdGhpbmsgdGhlIHByb2JsZW0geW91IGFyZSBzZWVpbmcgY29tZXMg
ZnJvbSB0aGUgcXVpcmsgb2YKPj4gY29kZWMtdG8tY29kZWMgbGlua3MuIFRoZSBoZG1pIGNvZGVj
IGxpbmsgaXMgc3VjaCBhIGxpbmsgb24gQW1sb2dpYwo+PiBiZWNhdXNlIGZ1cnRoZXIgZGlnaXRh
bCByb3V0aW5nIGlzIHJlcXVpcmVkIGFmdGVyIHRoZSBiYWNrZW5kLgo+Pgo+PiBUaG9zZSB0eXBl
IG9mIGxpbmtzIGFyZSBub3QgdXNlZCBtdWNoIGJlc2lkZSBzb21lCj4+IENQVSBvZmZsb2FkaW5n
IG9uIFNhbXN1bmcgYW5kIEFtbG9naWMsIGFzIGZhciBhcyBJIGtub3cuCj4+IEl0IGlzIHBvc3Np
YmxlLCBldmVuIGxpa2VseSwgdGhhdCB0aGluZ3MgYXJlIHN0aWxsIG1pc3NpbmcgdGhlcmUuCj4+
Cj4+IFNvIHRob3NlIEMyQyBsaW5rcyBhcmUgb3BlcmF0ZWQgYnkgdGhlIERBUE0gZXZlbnRzLCBu
b3QgdGhlIHJlZ3VhbGFyCj4+IEFTb0MgY29kZS4gWW91IGNhbiBzdGFydCBoZXJlOgo+PiBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51
eC5naXQvdHJlZS9zb3VuZC9zb2Mvc29jLWRhcG0uYyNuMzk5NQo+IFRoYW5rIHlvdSAtIHRoYXQg
aXMgaW5kZWVkIHRoZSByb290IGNhdXNlIQo+Cj4+IFlvdSdsbCBzZWUgdGhhdCAucHJlcGFyZSgp
IGlzIG5vdCBjYWxsZWQsIHNhbWUgYXMgLnRyaWdnZXIoKQo+PiBUaGF0IHNob3VsZCBwcm9wYWJs
eSBiZSBmaXhlZCA6Lwo+IFNpbmNlIEknbSBzdGlsbCB2ZXJ5IG11Y2ggY2x1ZWxlc3MgYWJvdXQg
YWxsIG9mIHRoaXMgSSBqdXN0IGNhbWUgdXAKPiB3aXRoIGFuIGV4cGVyaW1lbnRhbCBwYXRjaC4g
QW55IGZlZWRiYWNrIG9uIGl0IGlzIHdlbGNvbWUgKEkgY2FuIHNlbmQKPiBpdCBhcyBSRkMgcGF0
Y2ggLSBidXQgcHJlcGFyZSBmb3IgbWUgbmVlZGluZyBzdXBwb3J0KS4KCkl0IGlzIHByb2JhYmx5
IGEgZ29vZCBpZGVhIHRvIHNlbmQgaXQgdG8gZ2V0IG1vcmUgZmVlZGJhY2ssIHllcy4KCj4gV2l0
aCB0aGUgYXR0YWNoZWQgcGF0Y2ggSSBub3cgc2VlIGhkbWktY29kZWMncyAucHJlcGFyZSBjYWxs
YmFjayBiZWluZyBjYWxsZWQ6CgpMb29rcyBsaWtlIGEgZ29vZCBzdGFydCA6KQoKQ291cGxlcyBv
ZiBuaXRwaWNrczoKCllvdSBtaWdodCB3YW50IHRvIGNoZWNrIHRoZSBzdHJlYW0gdmFsaWRpdHkg
aW4KdGhlIGZ1bmN0aW9uIHlvdSd2ZSBpbnRyb2R1Y2VkLCBsaWtlIGluIHNvY19kYWlfdHJpZ2dl
cigpCgpJdCBtYXkgYWxzbyBiZSBuaWNlIHRvIHVwZGF0ZSBzbmRfc29jX3BjbV9kYWlfcHJlcGFy
ZSgpIHdpdGggdGhlCmludHJvZHVjZWQgZnVuY3Rpb24uCgo+ICQgc3BlYWtlci10ZXN0IC1jMgo+
Cj4gc3BlYWtlci10ZXN0IDEuMi4xMwo+Cj4gUGxheWJhY2sgZGV2aWNlIGlzIGRlZmF1bHQKPiBT
dHJlYW0gcGFyYW1ldGVycyBhcmUgNDgwMDBIeiwgUzE2X0xFLCAyIGNoYW5uZWxzCj4gVXNpbmcg
MTYgb2N0YXZlcyBvZiBwaW5rIG5vaXNlCj4gUmF0ZSBzZXQgdG8gNDgwMDBIeiAocmVxdWVzdGVk
IDQ4MDAwSHopCj4gQnVmZmVyIHNpemUgcmFuZ2UgZnJvbSAxMjggdG8gMjYyMTQ0Cj4gUGVyaW9k
IHNpemUgcmFuZ2UgZnJvbSA2NCB0byAxMzEwNzIKPiBQZXJpb2RzID0gNAo+IFsgICA0Mi4wNDM0
MTNdIGhkbWktYXVkaW8tY29kZWMgaGRtaS1hdWRpby1jb2RlYy4wLmF1dG86Cj4gaGRtaV9jb2Rl
Y19od19wYXJhbXMoKSB3aWR0aCAxNiByYXRlIDQ4MDAwIGNoYW5uZWxzIDIKPiBbICAgNDIuMDQ3
OTE2XSBoZG1pLWF1ZGlvLWNvZGVjIGhkbWktYXVkaW8tY29kZWMuMC5hdXRvOgo+IGhkbWlfY29k
ZWNfcHJlcGFyZSgpIHdpZHRoIDE2IHJhdGUgNDgwMDAgY2hhbm5lbHMgMgo+Cj4KPgo+IEJlc3Qg
cmVnYXJkcywKPiBNYXJ0aW4KPgo+IFsyLiB0ZXh0L3gtcGF0Y2g7IHNvYy1kYW1wLWNhbGwtcHJl
cGFyZS5kaWZmXS4uLgoKLS0gCkplcm9tZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
