Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47236C28B2B
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Aug 2022 14:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CHzNELfolQBdpKwmgGUYsvfLn/55isi8R9gnu8KVJOI=; b=mvmaLNexS/bW0/
	n31UcqEbM670sczBv++t37z7ARnI3FVYjELCbq0eqiLFUfPlza4lk3acYO3OiWrSieGbEvHglVw2D
	/fL97BeGtBr96+wXT7L7ZO2IN66e7xqi3h7gEFIm2L6qGia2qP6ve54BnI+lBCrYbis8moQcmrtPQ
	lcc5kXdEncpyTHBpYXOawjJSM7l0NehGYcDbUuZhpPV8cUTlYoJH4E0uPxrNI/w4zQ7bGNU0KPEWi
	TpykZvDd64OTJg37uBitj+aViTJP8I1p0SFhL8GOeF+Iix/hBeuxYJz65uj817i8jPecQGYuL1Byk
	8K/yuq8EmwnClHfBMTIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOJkV-002hWD-6B; Wed, 17 Aug 2022 14:10:23 +0000
Received: from mail-qv1-f42.google.com ([209.85.219.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOJk3-002hGf-51; Wed, 17 Aug 2022 14:09:58 +0000
Received: by mail-qv1-f42.google.com with SMTP id h8so10124934qvs.6;
        Wed, 17 Aug 2022 07:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=9vGZaeYeF3C4CiTE5MgNIzB+zcyQS3be59eUDCUL+Fc=;
        b=OwLJRIpmI8vdKW45tCBN7uRBZ3FmeUkV17M9HkibFLLBD5K0BTRLoC3JczsRRXsmN4
         HOiPJJ/sBhjNb1wmSngTMlz3o47CjuRvzU3JMXQzuqv1Rp559C8hLrDUWPHTeR46UsF/
         wPf73SUu2F+4nQ1BfndaWO3+k+fg/c9lgbGvpqSQbDFthZFxkHmv0CkCx9xM2EN/WJEt
         +Afw4z5IApwZrjlyxOI0Qy2fwwfYrd62Q1hm5sI65J8LcqBFAmsc4kpWlDLOXoRnIRQt
         yfq6y/PjrXJMj9vuyuQfCG/9jAvtJKVB2ym5s3q0FsI7vcHKIIEoL4pvmWdkV4wtJTkp
         OvnA==
X-Gm-Message-State: ACgBeo0O0VQ+emrceNyE+4icMA/9e0KpZ3UCy6zwQ0jaukanvwlZ5uGi
	+gMqt8oeqgt3CWWmf2xiAwHSIDT0RDbvoA==
X-Google-Smtp-Source: AA6agR78HSKYLn227JqYZWnVuK5McecdFXNRrurp3zSobHbm1zehuhTmDpexoUtz3SQXSKHfJVvo4A==
X-Received: by 2002:a05:6214:f27:b0:476:9d88:2597 with SMTP id iw7-20020a0562140f2700b004769d882597mr22173743qvb.45.1660745392778;
        Wed, 17 Aug 2022 07:09:52 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id k18-20020a05620a415200b006b627d42616sm2623669qko.35.2022.08.17.07.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 07:09:52 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-324ec5a9e97so233952907b3.7;
        Wed, 17 Aug 2022 07:09:52 -0700 (PDT)
X-Received: by 2002:a0d:eb45:0:b0:333:f813:6c79 with SMTP id
 u66-20020a0deb45000000b00333f8136c79mr5998789ywe.384.1660744920203; Wed, 17
 Aug 2022 07:02:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-4-3d53ae722097@cerno.tech>
 <CAMuHMdUrwzPYjA0wdR7ADj5Ov6+m03JbnY8fBYzRYyWDuNm5=g@mail.gmail.com>
 <20220816132636.3tmwqmrox64pu3lt@houat> <CAMuHMdUNLPbjs=usYQBim5FxsrC1oJLuF+3JB7auzHHRoOqavQ@mail.gmail.com>
 <20220817075351.4xpsqdngjgtiqvob@houat> <CAMuHMdUusnhYodWGCxJBu-1Hd2KW-xdT8jxE_iVdQjDo8b3Y5Q@mail.gmail.com>
 <20220817131454.qcuywcuc4ts4hswm@houat>
In-Reply-To: <20220817131454.qcuywcuc4ts4hswm@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Aug 2022 16:01:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVPEgnnsY-4uuf=FDJ0YxWpch-0kZWFT_TZfcDvXLtwWQ@mail.gmail.com>
Message-ID: <CAMuHMdVPEgnnsY-4uuf=FDJ0YxWpch-0kZWFT_TZfcDvXLtwWQ@mail.gmail.com>
Subject: Re: [PATCH v1 04/35] drm/modes: Introduce 480i and 576i modes
To: Maxime Ripard <maxime@cerno.tech>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>, 
	Samuel Holland <samuel@sholland.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
	Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	linux-sunxi@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Phil Elwell <phil@raspberrypi.com>, 
	Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	DRI Development <dri-devel@lists.freedesktop.org>, Dom Cobley <dom@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_070955_242631_AF423866 
X-CRM114-Status: GOOD (  52.83  )
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

SGkgTWF4aW1lLAoKT24gV2VkLCBBdWcgMTcsIDIwMjIgYXQgMzoxNSBQTSBNYXhpbWUgUmlwYXJk
IDxtYXhpbWVAY2Vybm8udGVjaD4gd3JvdGU6Cj4gT24gV2VkLCBBdWcgMTcsIDIwMjIgYXQgMTA6
NTE6NTVBTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+ID4gT24gV2VkLCBBdWcg
MTcsIDIwMjIgYXQgOTo1NCBBTSBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4gd3Jv
dGU6Cj4gPiA+IE9uIFR1ZSwgQXVnIDE2LCAyMDIyIGF0IDA1OjAwOjM4UE0gKzAyMDAsIEdlZXJ0
IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+ID4gPiBPbiBUdWUsIEF1ZyAxNiwgMjAyMiBhdCAzOjI2
IFBNIE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJuby50ZWNoPiB3cm90ZToKPiA+ID4gPiA+IE9u
IEZyaSwgQXVnIDEyLCAyMDIyIGF0IDAzOjE4OjU4UE0gKzAyMDAsIEdlZXJ0IFV5dHRlcmhvZXZl
biB3cm90ZToKPiA+ID4gPiA+ID4gT24gRnJpLCBKdWwgMjksIDIwMjIgYXQgNjozNSBQTSBNYXhp
bWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gTXVsdGlw
bGUgZHJpdmVycyAobWVzb24sIHZjNCkgZGVmaW5lIHRoZSBhbmFsb2cgVFYgNTI1LWxpbmVzIGFu
ZCA2MjUtbGluZXMKPiA+ID4gPiA+ID4gPiBtb2RlcyBpbiB0aGUgZHJpdmVycy4KPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gTml0OiBzdHJpY3RseSBzcGVha2luZyB0aGVzZSBhcmUgbm90IGFuYWxv
ZyBtb2RlcywgYnV0IHRoZSBkaWdpdGFsCj4gPiA+ID4gPiA+IHZhcmlhbnRzIChJVFUtUiBCVC42
NTYgYW5kIERWRC1WaWRlbyBEMSkgb2YgTlRTQyBhbmQgUEFMLCB1c2luZyBhCj4gPiA+ID4gPiA+
IDEzLjUgTUh6IHNhbXBsaW5nIGZyZXF1ZW5jeSBmb3IgcGl4ZWxzLgo+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiBJbiBhbmFsb2cgbW9kZXMsIHRoZSBvbmx5IGRpc2NyZXRlIHZhbHVlcyBhcmUgdGhl
IG51bWJlciBvZiBsaW5lcywgYW5kCj4gPiA+ID4gPiA+IHRoZSBmcmFtZS9maWVsZCByYXRlIChm
aXhpbmcgdGhlIGhvcml6b250YWwgc3luYyByYXRlIHdoZW4gY29tYmluZWQpLgo+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiBUaGUgbnVtYmVyIG9mIChpbil2aXNpYmxlIHBpeGVscyBwZXIgbGluZSBk
ZXBlbmRzIG9uIHRoZSBhdmFpbGFibGUKPiA+ID4gPiA+ID4gYmFuZHdpZHRoLiAgSW4gYSBkaWdp
dGFsIHZhcmlhbnQgKHdoaWNoIGlzIGFueXRoaW5nIGdlbmVyYXRlZCBieSBhCj4gPiA+ID4gPiA+
IGRpZ2l0YWwgY29tcHV0ZXIgc3lzdGVtKSwgdGhlIGxhdHRlciBkZXBlbmRzIG9uIHRoZSBwaXhl
bCBjbG9jaywgd2hpY2gKPiA+ID4gPiA+ID4gY2FuIHdpbGRseSBkaWZmZXIgZnJvbSB0aGUgMTMu
NSBNSHogdXNlZCBpbiB0aGUgQlQuNjU2IHN0YW5kYXJkLiAoZS5nLgo+ID4gPiA+ID4gPiBBbWln
YSB1c2VzIDcuMDkvMTQuMTkvMjguMzggTUh6IChQQUwpIG9yIDcuMTYvMTQuMzIvMjguNjQgTUh6
IChOVFNDKSkuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFNvIEkgdGhpbmsgd2UgcHJvYmFibHkg
bmVlZCBzb21lIHdheSB0byBnZW5lcmF0ZSBhIFBBTC9OVFNDLWNvbXBhdGlibGUKPiA+ID4gPiA+
ID4gbW9kZSBiYXNlZCBub3Qgb25seSBvbiByZXNvbHV0aW9uLCBidXQgYWxzbyBvbiBwaXhlbCBj
bG9jay4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGlzIHdvdWxkIGFsc28gZml4IHRoZSBjb21tZW50
cyBtYWRlIGJ5IEphbmkgYW5kIFRob21hcywgc28gSSBxdWl0ZQo+ID4gPiA+ID4gbGlrZSB0aGUg
aWRlYSBvZiBpdC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJJ20gc3RydWdnbGluZyBhIGJpdCB0byBm
aW5kIGhvdyB3b3VsZCBjb3VsZCBpbXBsZW1lbnQgdGhpcyB0aG91Z2guCj4gPiA+ID4gPgo+ID4g
PiA+ID4gRnJvbSB3aGF0IHlvdSB3ZXJlIHNheWluZywgSSBndWVzcyB0aGUgcHJvdG90eXBlIHdv
dWxkIGJlIHNvbWV0aGluZyBsaWtlCj4gPiA+ID4gPgo+ID4gPiA+ID4gc3RydWN0IGRybV9kaXNw
bGF5X21vZGUgKmRybV9jcmVhdGVfYW5hbG9nX21vZGUodW5zaWduZWQgaW50IHBpeGVsX2Nsb2Nr
LAo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgaW50IGxpbmVzLAo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGZyYW1lX3JhdGUpCj4gPiA+ID4g
Pgo+ID4gPiA+ID4gQnV0IEkgaGF2ZSB6ZXJvIGlkZWEgb24gd2hhdCB0aGUgaW1wbGVtZW50YXRp
b24gd291bGQgYmUuIERvIHlvdSBoYXZlCj4gPiA+ID4gPiBzb21lIHJlc291cmNlcyBmb3IgdGhp
cyB5b3UgY291bGQgcG9pbnQgbWUgdG8/Cj4gPiA+ID4KPiA+ID4gPiBIb3Jpem9udGFsbHksIEkg
dGhpbmsgeW91IHNob3VsZCBjYWxjdWxhdGUgbGVmdC9yaWdodCBtYXJnaW5zIGFuZAo+ID4gPiA+
IGhzeW5jIGxlbmd0aCB0byB5aWVsZCB0aW1pbmdzIHRoYXQgbWF0Y2ggdGhvc2UgZm9yIHRoZSBC
VC42NTYgUEFML05UU0MKPiA+ID4gPiBtb2Rlcy4gIEkuZS4gd2hlbiBhIDY0MHg1MTIgbW9kZSB3
aXRoIGEgcGl4ZWwgY2xvY2sgb2YgMTQgTUh6IGlzCj4gPiA+ID4gcmVxdWVzdGVkLCB5b3Ugd2Fu
dCB0byBjYWxjdWxhdGUgbGVmdCcsIHJpZ2h0JywgYW5kIGhzbGVuJyBmb3IKPiA+ID4gPgo+ID4g
PiA+IHwgPC0tLS0gbGVmdCcgLS0tPiB8IDwtIDY0MCBwaXhlbHMgLT4gfCA8LS0tLSByaWdodCcg
LS0tPiB8IDwtLS0gaHNsZW4nIC0tPiB8Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
QCAxNCBNSHoKPiA+ID4gPgo+ID4gPiA+IHNvIHRoZXkgbWF0Y2ggdGhlIHRpbWluZ3MgZm9yIGxl
ZnQsIHJpZ2h0LCBhbmQgaHNsZW4gZm9yCj4gPiA+ID4KPiA+ID4gPiB8IDwtLS0gbGVmdCAtLS0+
IHwgPC0tLSA3MjAgcGl4ZWxzIC0tLT4gfCA8LS0tIHJpZ2h0IC0tLT4gfCA8LS0tIGhzbGVuIC0t
LT4gfAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIEAgMTMuNSBNSHoKPiA+ID4gPgo+
ID4gPiA+IEFzIDY0MCBwaXhlbHMgQCAxNCBNSHogYXJlIGxlc3Mgd2lkZSB0aGFuIDcyMCBwaXhl
bHMgQCAxMy41IE1IeiwKPiA+ID4gPiB5b3Ugd2FudCB0byBtYWtlIHN1cmUgdG8gYWxpZ24gdGhl
IGNlbnRlciBvZiB0aGUgdmlzaWJsZSBwYXJ0Lgo+ID4gPgo+ID4gPiBTbyBJIGd1ZXNzIGluIHRo
YXQgZXhhbXBsZSBpZiB3ZSB3YW50IHRvIGNlbnRlciBpdCwgbGVmdCA9PSByaWdodCBhbmQKPiA+
ID4gbGVmdCcgPT0gcmlnaHQnPyBXaGF0IGFib3V0IHRoZSBzeW5jIGxlbmd0aD8KPiA+Cj4gPiBO
bywgbGVmdCBhbmQgcmlnaHQgYXJlIGFzeW1tZXRyaWNhbCwgY2ZyLiBmcm9udCBhbmQgYmFjayBw
b3JjaCBpbgo+ID4gaHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvUEFMI1BBTF9zaWduYWxf
ZGV0YWlscwo+ID4gSS5lLiBpZiB0aGUgcGl4ZWwgcGFydCBpcyByZWR1Y2VkLCBib3RoIHRoZSBs
ZWZ0IGFuZCByaWdodCBtYXJnaW5zCj4gPiBzaG91bGQgYmUgaW5jcmVhc2VkIGJ5IHRoZSBzYW1l
IGFtb3VudC4KPiA+Cj4gPiBGcm9tIHRoZSB0YWJsZSBsaW5rZWQgYWJvdmUsIGhzbGVuIHNob3Vs
ZCBiZSBjYS4gNC43wrVzIChmaXhlZCkuCj4KPiBlYWNoIHBpeGVsIHRha2luZyAxIC8gcGl4ZWxf
Y2xvY2sgc2Vjb25kcyAoYXNzdW1pbmcgcGl4ZWxfY2xvY2sgaXMgaW4KPiBIeiksIGFuZCB0aHVz
IGhzbGVuIChpbiBwaXhlbHMpID0gNC43ICogMTAgXiAtNiAqIHBpeGVsX2NsaywgcmlnaHQ/CgpF
eGFjdGx5LgoKPiA+ID4gPiBWZXJ0aWNhbGx5LCBpdCdzIHNpbXBsZXIsIGFzIHRoZSBudW1iZXIg
b2YgbGluZXMgaXMgZGlzY3JldGUuCj4gPiA+ID4gWW91IGRvIGhhdmUgdG8gdGFrZSBpbnRvIGFj
Y291bnQgaW50ZXJsYWNlIGFuZCBkb3VibGVzY2FuLCBhbmQKPiA+ID4gPiBwcm9ncmVzc2l2ZSBt
b2RlcyB3aXRoIDI2Mi8zMTIgbGluZXMuCj4gPiA+Cj4gPiA+IFNvIHdlIG9ubHkgaGF2ZSB0byBk
ZWFsIHdpdGggNTI1IGFuZCA2MjUgbGluZXMgdG90YWwgKHdpdGhvdXQgdGFraW5nCj4gPiA+IGlu
dGVybGFjZSBhbmQgZG91Ymxlc2NhbiBpbnRvIGFjY291bnQpLCByaWdodD8KPiA+Cj4gPiBZZXMu
Cj4gPgo+ID4gPiBJIGd1ZXNzIHdlIHN0aWxsIGhhdmUgdGhlIHNhbWUgcXVlc3Rpb24sIHdlIHBy
b2JhYmx5IHdhbnQgdG8gY2VudGVyIGl0LAo+ID4gPiBzbyB0b3AgPT0gYm90dG9tLCBidXQgd2hh
dCBhYm91dCB0aGUgdnN5bmMgbGVuZ3RoPwo+ID4KPiA+IFVuZm9ydHVuYXRlbHkgdGhhdCB0YWJs
ZSBkb2VzIG5vdCBtZW50aW9uIHRvcCBhbmQgYm90dG9tIG1hcmdpbnMuCj4gPiBCdXQgYWNjb3Jk
aW5nIHRvIGRyaXZlcnMvdmlkZW8vZmJkZXYvYW1pZmIuYyAoc2VlIHRoZSAiQnJvYWRjYXN0Cj4g
PiB2aWRlbyB0aW1pbmdzIiBjb21tZW50IGJsb2NrIGFuZCB0aGUgZGVmaW5pdGlvbnMgb2YgdGhl
ICJudHNjLWxhY2UiCj4gPiBhbmQgInBhbC1sYWNlIiB2aWRlbyBtb2RlcyksIHRoZXkgYXJlIGFz
eW1tZXRyaWNhbCwgdG9vLgo+ID4KPiA+IFZzeW5jIGxlbmd0aCBpcyAwLjU3Nm1zLCBzbyB0aGF0
J3MgOSBzY2FuIGxpbmVzIChJIGd1ZXNzIEkgZGlkbid0Cj4gPiBoYXZlIHRoYXQgaW5mbyB3aGVu
IEkgd3JvdGUgYW1pZmIsIGFzIEkgdXNlZCA0IGxpbmVzIHRoZXJlKS4KPgo+IFRoYW5rcywgdGhh
dCdzIHNvbWUgZ3JlYXQgaW5mbyBhbHJlYWR5Lgo+Cj4gSXQncyBtZW50aW9uZWQgdGhvdWdoIHRo
YXQgdGhlIHNldHRpbmdzIGZvciBOVFNDIGFyZSAic3RyYWlnaHRmb3J3YXJkIiwKPiBidXQgaXQn
cyBkZWZpbml0ZWx5IG5vdCBmb3IgbWUgOikKCkFzIGluIE5UU0MganVzdCB1c2VzIGRpZmZlcmVu
dCBwaXhlbCBjbG9jayBhbmQgaG9yaXpvbnRhbC92ZXJ0aWNhbCBzeW5jCnJhdGUgdmFsdWVzLi4u
Cgo+IEkndmUgbG9va2VkIGFyb3VuZCBhbmQgaXQgbG9va3MgbGlrZSB0aGUgZW50aXJlIGJsYW5r
aW5nIGFyZWEgaXMKPiBzdXBwb3NlZCB0byBiZSA0MCBwaXhlbHMgaW4gaW50ZXJsYWNlZCwgYnV0
IEkgY291bGRuJ3QgZmluZCBhbnl3aGVyZSBob3cKCjYyNSBsaW5lcyAtIDU3NVsqXSB2aXNpYmxl
IGxpbmVzID0gNTAgbGluZXMuCgpbKl0gQlQuNjU2IHVzZXMgNTc2IHZpc2libGUgbGluZXMgYXMg
dGhhdCdzIGEgbXVsdGlwbGUgb2YgMiwgZm9yIHNwbGl0dGluZwogICAgIGEgZnJhbWUgaW4gdHdv
IGZpZWxkcyBvZiBlcXVhbCBzaXplLgoKInZpc2libGUiIGlzIHJlbGF0aXZlLCBhcyBpdCBpbmNs
dWRlcyB0aGUgb3ZlcnNjYW4gcmVnaW9uLgpTb21lIFBBTCBtb25pdG9ycyB1c2VkIHdpdGggY29t
cHV0ZXJzIGhhZCBrbm9icyB0byBjb250cm9sIHdpZHRoL2hlaWdodAphbmQgcG9zaXRpb24gb2Yg
dGhlIHNjcmVlbiwgc28geW91IGNvdWxkIG1ha2UgdXNlIG9mIG1vc3Qgb3IgYWxsIG9mCnRoZSBv
dmVyc2NhbiByZWdpb24sIGJ1dCBvbiBhIHJlYWwgVFYgeW91J3JlIGxpbWl0ZWQgdG8gY2EuIDY0
MHg1MTIgKG9uClBBTCkgIHdoaWNoIGlzIHdoYXQgYW4gQW1pZ2EgdXNlZCBieSBkZWZhdWx0ICh3
aXRoIGEgMTQgTUh6IHBpeGNsb2NrKS4KPiBpdCdzIHN1cHBvc2VkIHRvIGJlIHNwbGl0IGJldHdl
ZW4gdGhlIHVwcGVyIGFuZCBsb3dlciBtYXJnaW5zIGFuZCB0aGUKPiBzeW5jIHBlcmlvZC4KCiJG
aWVsZCBTeW5jaHJvbml6YXRpb24gb2YgUEFMIFN5c3RlbSIgb24gaHR0cDovL21hcnRpbi5oaW5u
ZXIuaW5mby92Z2EvcGFsLmh0bWwKc2hvd3MgdGhlIHNwbGl0LgoKR3J7b2V0amUsZWV0aW5nfXMs
CgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0KR2VlcnQgVXl0dGVyaG9ldmVuIC0t
IFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9y
ZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2Fs
bCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkg
anVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
