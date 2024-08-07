Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDB7C52D6F
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Aug 2024 08:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6SxFGzHbDO5fQfOeKA/0qO9cLdo7HYfb83dOdudP6zE=; b=FdUN5NsxmEhlLv
	aXuSmyju5QFSrdq3LAAn77oIbnMgP8ItUXzK8hOBpiXjDa/dd7N8NYfiAh2lMfqt2sfqpLfK+p4La
	ewe4/Rw3Iijec3kguS0zYLtFAlRaLdtDFbYVhicCBmue8RgHGHWlQF86NgadLOfOK6TWEE5Vx42S+
	CCAfCdTs/KBdtfDF3rQ9aFOMY8iPq3aiVv/Vq+44f8JJmI+BFGi5rodQ5SZFklkLH8lcMWoJPoyzn
	enjLLk9CGodsqoFInRNFFUeGtr6A8YmQcL3TPM/qMoix9Ua/FuzSDwc6G76f4JxzwQRAuighChYSo
	X8gyDA0mX7rZpxFOIvpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbc2H-00000004MbA-1Suf;
	Wed, 07 Aug 2024 08:28:45 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbc0L-00000004Lnd-0TW2
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Aug 2024 08:26:48 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4281d812d3eso14336495e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Aug 2024 01:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723019203; x=1723624003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZHByOv0mOQel4KMBZjJK3uZiiCwuwlf50RnLCFOcRk=;
        b=sK/4rR3ikdkt3b1jem89Qgn5HEE98tvNLf+iI8nolJkOIxQDMiA44IoQ/YEydFlsDP
         PqJEUWs8kT4PUPf7JV5BRBIKAZHnfVl0pE104UgeWxic2HYFZoERdqJyYDwzhvCSzmOd
         Fl4iA3fQ5hvSYCjE6Yl9q3lGoILx9i3x9MSXEGseZnRDtZrRBKJPMvT8G6fJuLA9xwOk
         Hvt8qNS5egPkimOySQykWmQ/VokuxDXkkdh4xTN6osBJWVeh7EC/ncWmmtmy38CDZDtD
         SnmkbkaJ1Q6AFMR167TydOtIv/PNgUUp3C++/NtbB8s4OiBP6/zVTS+F415lNfvGWmy0
         sI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723019203; x=1723624003;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZHByOv0mOQel4KMBZjJK3uZiiCwuwlf50RnLCFOcRk=;
        b=UYgxgPb/OisuLnePgVN6tuDGEgErDtFQgRsFGhB6VK9EzdYmu3abxRpbak+aoUNLSa
         +3Gr9/hs9cpV1ki0JPClAv7mTMYjlB3Qq2j11mFqPl+qMQiHCOHCo5fxsmcrf1cxjyca
         qFBS+6d53Nf9wZKPICEMGNFOcF5wxtWs+q9A9ydOKCXJtSMV6syEzOaQ5YWx4YbSI5Ot
         AV56EO76gR2KvndxC4pyP0eEKuULt67pQfnt1Dj4UBtz7B9DncyJH9SeXCQFfG1j4jQ/
         IukRTlbA5xoxenR1NJ/DliwkNWOcWymKKJTkwWpfRWiGkh6Zoluk6+LJCr/JU8BJNWMV
         LSXg==
X-Forwarded-Encrypted: i=1; AJvYcCWj0pTs0ZfoeQQUXT+QClLj+XTrqm+gSSvl461m3wplRxS0+2kv3uox2sMgktGAh0L5elEryDyP6F64bz6A1EQ3idPgZuMJl8T8xpAwGQE6VOc=
X-Gm-Message-State: AOJu0YxqWAFqZaQEqbo5gnc19nBdrZ/4isFMeSmTdBAGzX74xEGY0a+p
	hI+4jMC+tVZ3r5nIioOXNw7ak5TRRNMUQwlnBg2nJl/5ASVx486W217K4rPwLA8=
X-Google-Smtp-Source: AGHT+IFz38MFkpvdt0BKpKNIiKOyIyBho+s/Gh9rbf8GDZAtKNc/QE+/bIeiT1DD/pgoorf5EawALA==
X-Received: by 2002:a5d:5510:0:b0:368:6606:bd01 with SMTP id ffacd0b85a97d-36bbc1c4abfmr13978046f8f.55.1723019203144;
        Wed, 07 Aug 2024 01:26:43 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:90f1:3c4c:261c:b0f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290580cb80sm18381625e9.45.2024.08.07.01.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 01:26:42 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>,  Kevin Hilman
 <khilman@baylibre.com>,  dri-devel@lists.freedesktop.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/9] drm/meson: dw-hdmi: split resets out of hw init.
In-Reply-To: <CAFBinCCvWFCCvb9gPvv0-eudG=iuKROk5rPSiorKTnHcToDfTQ@mail.gmail.com>
	(Martin Blumenstingl's message of "Tue, 6 Aug 2024 22:49:40 +0200")
References: <20240730125023.710237-1-jbrunet@baylibre.com>
	<20240730125023.710237-6-jbrunet@baylibre.com>
	<CAFBinCCvWFCCvb9gPvv0-eudG=iuKROk5rPSiorKTnHcToDfTQ@mail.gmail.com>
Date: Wed, 07 Aug 2024 10:26:42 +0200
Message-ID: <1ja5hozqkd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_012645_277152_6EE6B459 
X-CRM114-Status: GOOD (  26.41  )
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

T24gVHVlIDA2IEF1ZyAyMDI0IGF0IDIyOjQ5LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4u
Ymx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiB3cm90ZToKCj4gSGkgSmVyb21lLAo+Cj4gT24g
VHVlLCBKdWwgMzAsIDIwMjQgYXQgMjo1MOKAr1BNIEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5
bGlicmUuY29tPiB3cm90ZToKPj4KPj4gVGhpcyBwcmVwYXJlcyB0aGUgbWlncmF0aW9uIHRvIHJl
Z21hcCB1c2FnZS4KPj4KPj4gVG8gcHJvcGVybHkgc2V0dXAgcmVnbWFwLCB0aGUgQVBCIG5lZWRz
IHRvIGJlIGluIHdvcmtpbmcgb3JkZXIuCj4+IFRoaXMgaXMgZWFzaWVyIGhhbmRsZWQgaWYgdGhl
IHJlc2V0cyBhcmUgbm90IG1peGVkIHdpdGggaHcgaW5pdC4KPj4KPj4gTW9yZSBjaGVja3MgYXJl
IHJlcXVpcmVkIHRvIGRldGVybWluZSBpZiB0aGUgcmVzZXRzIGFyZSBuZWVkZWQKPj4gb24gcmVz
dW1lIG9yIG5vdC4gQWRkIGEgbm90ZSBmb3IgdGhpcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmVy
b21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9ncHUv
ZHJtL21lc29uL21lc29uX2R3X2hkbWkuYyB8IDE0ICsrKysrKysrKy0tLS0tCj4+ICAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZXNvbi9tZXNvbl9kd19oZG1pLmMKPj4gaW5kZXggNWNkMzI2NGFiODc0Li40N2FhM2UxODRl
OTggMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMK
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYwo+PiBAQCAtNTgx
LDExICs1ODEsNiBAQCBzdGF0aWMgdm9pZCBtZXNvbl9kd19oZG1pX2luaXQoc3RydWN0IG1lc29u
X2R3X2hkbWkgKm1lc29uX2R3X2hkbWkpCj4+ICAgICAgICAgLyogQnJpbmcgSERNSVRYIE1FTSBv
dXRwdXQgb2YgcG93ZXIgZG93biAqLwo+PiAgICAgICAgIHJlZ21hcF91cGRhdGVfYml0cyhwcml2
LT5oaGksIEhISV9NRU1fUERfUkVHMCwgMHhmZiA8PCA4LCAwKTsKPj4KPj4gLSAgICAgICAvKiBS
ZXNldCBIRE1JVFggQVBCICYgVFggJiBQSFkgKi8KPj4gLSAgICAgICByZXNldF9jb250cm9sX3Jl
c2V0KG1lc29uX2R3X2hkbWktPmhkbWl0eF9hcGIpOwo+PiAtICAgICAgIHJlc2V0X2NvbnRyb2xf
cmVzZXQobWVzb25fZHdfaGRtaS0+aGRtaXR4X2N0cmwpOwo+PiAtICAgICAgIHJlc2V0X2NvbnRy
b2xfcmVzZXQobWVzb25fZHdfaGRtaS0+aGRtaXR4X3BoeSk7Cj4+IC0KPj4gICAgICAgICAvKiBF
bmFibGUgQVBCMyBmYWlsIG9uIGVycm9yICovCj4+ICAgICAgICAgaWYgKCFtZXNvbl92cHVfaXNf
Y29tcGF0aWJsZShwcml2LCBWUFVfQ09NUEFUSUJMRV9HMTJBKSkgewo+PiAgICAgICAgICAgICAg
ICAgd3JpdGVsX2JpdHNfcmVsYXhlZChCSVQoMTUpLCBCSVQoMTUpLAo+PiBAQCAtNjc1LDYgKzY3
MCwxMCBAQCBzdGF0aWMgaW50IG1lc29uX2R3X2hkbWlfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYs
IHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKPj4gICAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJS
KG1lc29uX2R3X2hkbWktPmhkbWl0eF9waHkpOwo+PiAgICAgICAgIH0KPj4KPj4gKyAgICAgICBy
ZXNldF9jb250cm9sX3Jlc2V0KG1lc29uX2R3X2hkbWktPmhkbWl0eF9hcGIpOwo+PiArICAgICAg
IHJlc2V0X2NvbnRyb2xfcmVzZXQobWVzb25fZHdfaGRtaS0+aGRtaXR4X2N0cmwpOwo+PiArICAg
ICAgIHJlc2V0X2NvbnRyb2xfcmVzZXQobWVzb25fZHdfaGRtaS0+aGRtaXR4X3BoeSk7Cj4gVGhl
IG9sZCBvdXQgb2YgdHJlZSB2ZW5kb3IgZHJpdmVyIFswXSBlbmFibGVzIHRoZSAiaXNmciIgYW5k
ICJpYWhiIgo+IChpbiBQX0hISV9IRE1JX0NMS19DTlRMIGFuZCBQX0hISV9HQ0xLX01QRUcyKSBj
bG9ja3MgYmVmb3JlIHRyaWdnZXJpbmcKPiB0aGUgcmVzZXRzLgo+IFByZXZpb3VzbHkgbWVzb25f
ZHdfaGRtaSdzIGJlaGF2aW9yIHdhcyBpZGVudGljYWwgYXMgaXQgZW5hYmxlZCB0aGUKPiBjbG9j
a3MgaW4gbWVzb25fZHdfaGRtaV9iaW5kKCkgYW5kIG9ubHkgbGF0ZXIgdHJpZ2dlcmVkIHRoZSBy
ZXNldHMuCj4KPiBJJ20gdG90YWxseSBmaW5lIHdpdGggbW92aW5nIHRoZSByZXNldHMgdG8gbWVz
b25fZHdfaGRtaV9iaW5kKCkgYnV0IEkKPiB0aGluayBpdCBzaG91bGQgaGFwcGVuIGFmdGVyIGRl
dm1fY2xrX2J1bGtfZ2V0X2FsbF9lbmFibGUoKSBoYXMgYmVlbgo+IGNhbGxlZCAodG8ga2VlcCB0
aGUgb3JkZXIgYW5kIHRodXMgYXZvaWQgc2lkZS1lZmZlY3RzIHRoYXQgd2UgZG9uJ3QKPiBrbm93
IGFib3V0IHlldCkuCgpHb29kIHBvaW50LgoKSSB3YXMgYWxzbyB0aGlua2luZyBhYm91dCBzcXVh
c2hpbmcgdGhpcyB3aXRoIHRoZSByZWdtYXAgcGF0Y2guCkkndmUgc3BsaXQgaXQgYXBhcnQgZm9y
IHYxIHRvIG1ha2UgdGhpbmdzIGEgYml0IG1vcmUgY2xlYXIgYnV0IGl0IG9ubHkKcmVhbGx5IG1h
a2VzIHNlbnNlIHdpdGggdGhlIHJlZ21hcCBjb252ZXJzaW9uLiAKCj4KPiBBbHNvIG91dCBvZiBj
dXJpb3NpdHk6IGFyZSB5b3UgcGxhbm5pbmcgdG8gY29udmVydCB0aGUgZHJpdmVyIHRvIHVzZQo+
IGRldm1fcmVzZXRfY29udHJvbF9idWxrX2dldF9leGNsdXNpdmUoKT8KPgoKSXQncyBiZWVuIGEg
d2hpbGUgdGhpcyBJJ3ZlIGRvbmUgdGhhdC4gSSByZW1lbWJlciBJIHRob3VnaHQgYWJvdXQgaXQu
CkkgdGhpbmsgaXQgd2FzIGEgYml0IG1vcmUgZGlmZmljdWx0IHRvIHVzZSB0aGF0IGNsb2Nrcy4g
SSB3YXMgbG9va2luZyBhdAptYWtpbmcgdGhlIGRyaXZlciBhIGJpdCBtb3JlIGNsZWFuIGFuZCBz
aW1wbGUuIEl0IHdhcyBub3QgcmVhbGx5IGhlbHBpbmcKdG8gbW92ZSBpdCBpbiB0aGF0IGRpcmVj
dGlvbiBJSVJDLgoKPgo+IEJlc3QgcmVnYXJkcywKPiBNYXJ0aW4KPgo+Cj4gWzBdIGh0dHBzOi8v
Z2l0aHViLmNvbS9lbmRsZXNzbS9saW51eC1zOTA1eC9ibG9iL21hc3Rlci9kcml2ZXJzL2FtbG9n
aWMvaGRtaS9oZG1pX3R4XzIwL2h3L2hkbWlfdHhfaHcuYyNMNDcwCgotLSAKSmVyb21lCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
