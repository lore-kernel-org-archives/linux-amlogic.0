Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB6CC54EBD
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Jan 2023 17:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ps2MfJeF3xol0EwzcvlMYJ4KBjZbIaYqNOsRy5zim6Y=; b=mBHjK2stBkAkWg
	q2MMzTJQ22wVqYekczs18DDu5Sd4msiDgiTfBiQ4u4LgzeVPjAzMQmCrFKsak1cALdfJKMoVs2mmZ
	9pbGvXFF+8WBXTY7h500HebMJWepCJzJSDr4Mv8+qb0EhoBsBTA+cM75elGyAxfAvTrQe1AmNn2zp
	QryRoG/8n2poj2yQ5SSxY68yrFrN1fXNUhcZHJOVsddbbJh3SJSfEOdek505kcXB6qeqSgBM3rrj8
	6CNfxMpaZU31ZTaySJLTPoHuoSi7Gflkg1CYE3sZHSnU6XztnEu5wnPvBZaQv5QCfHKnEzeNHecmB
	SI1lMb7kXTOfP7JmiB9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEwKy-0032hx-CV; Mon, 09 Jan 2023 17:53:32 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEwGG-0030Lm-0q
	for linux-amlogic@lists.infradead.org; Mon, 09 Jan 2023 17:48:41 +0000
Received: by mail-vs1-xe29.google.com with SMTP id n190so5590478vsc.11
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Jan 2023 09:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdV2vwGnOEmlhv8n7U93QPrw3soIxglDsMqqZoAGNCs=;
        b=OvViZphfr5738vJta/xF70K51WoKQjxplA5/RJo/AcybHvHZvOUTOU7+LAMoYwF4u2
         ie9ciq6sqY9Ob/ZMFTTQDMoSVXymbBeob6u+51pohUsru/rYxZaPMynfqEmAGSur41kD
         bxCbP8x+nMSayS1W8GGTy6p54I/KV+X3oQrVwIdzDbTNCe1U+PsJp5ErptBT0L6aIaWt
         1b1Hsyzqf0rUU2a0DzrvkJOS2gatasS6ig+OSKak3e81prvLOlx9VL4+v6ETNd537Rp5
         XGFV01P0QgiebzdQGPGyibWvcAiaJHoFEWbmVgm8r7nPr+uJMP+uqaGbsBaRSfFi78tS
         dmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jdV2vwGnOEmlhv8n7U93QPrw3soIxglDsMqqZoAGNCs=;
        b=QhX7doBvEQZf+CIWD0z4X9eWtHh912GD4gCml+PJRZtNSr32iDknELyl9rHW3vcwLc
         /9ifceNMatbBH+0q1BeLEupADLToB/3YlCHXnhw7Kfwlm36J9GDRqxUpcnLrO/DegDHk
         X1c/CjJ9pv3p8QB6WzKasTSmyvX74OPJmA2F9b5hMwUO2ltVeK0RDkE1bkFZ9GxzRZ5O
         KprgPAyfLt/aF7x9lhBqBIS45wnpOzxwpgjVd9G8bW1zSygamUa6oD8PKPWyWWgOcqZ4
         gr0Z1YR/cjjQmsy/l1zPhnx3yCJKsCXtluNJwvF/lvtVy5TBw8CrOASIep8RDAM25lJ3
         8nqQ==
X-Gm-Message-State: AFqh2kpYaySwDuK6Psv769JCJBKMkNgk8olGszBaPvOJK8yLa6iJHkTk
	4pcr0fBlpig+VEuxP5rPppCOyPx3AtztRTW0Vpas5Mp9Lco=
X-Google-Smtp-Source: AMrXdXvBp1DINcXOCvLmPxiDkUAxnf/FP+Y6732tNVN6rP/zqZs1L1FGyO5PAdWj/z0iT8oGfYrhW/1lEXVhB44r4Cs=
X-Received: by 2002:a67:5c03:0:b0:3ce:a7c5:3757 with SMTP id
 q3-20020a675c03000000b003cea7c53757mr3875326vsb.63.1673286516391; Mon, 09 Jan
 2023 09:48:36 -0800 (PST)
MIME-Version: 1.0
References: <20221228100321.15949-1-linux.amoon@gmail.com> <20221228100321.15949-2-linux.amoon@gmail.com>
 <ef20a7dfa027f1a5a24a515e347af10c06a4da85.camel@icenowy.me>
 <CANAwSgSJ1SQXUovgM6FHUozr46C_CogLaAD4gf4ANNHXoav6ag@mail.gmail.com>
 <Y7YDwJX6aqa8vbQK@google.com> <CANAwSgTVnQXGoOfuxmwT7zCMJMY0Hw+uyQx126kNPL2WKGR8Hg@mail.gmail.com>
 <Y7xA0nO53cBRetz4@google.com>
In-Reply-To: <Y7xA0nO53cBRetz4@google.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 9 Jan 2023 23:18:19 +0530
Message-ID: <CANAwSgR1ymx_2QK5Mi_1eS+LbTa2-SdQ+1dQ4hfrwNDLU_DsAg@mail.gmail.com>
Subject: Re: [PATCH v1 01/11] dt-bindings: usb: Add device id for Genesys
 Logic hub controller
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Icenowy Zheng <uwu@icenowy.me>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-amlogic@lists.infradead.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_094840_166616_FAE4881C 
X-CRM114-Status: GOOD (  35.31  )
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

SGkgTWF0dGhpYXMsCgpPbiBNb24sIDkgSmFuIDIwMjMgYXQgMjE6NTksIE1hdHRoaWFzIEthZWhs
Y2tlIDxta2FAY2hyb21pdW0ub3JnPiB3cm90ZToKPgo+IE9uIFNhdCwgSmFuIDA3LCAyMDIzIGF0
IDA4OjMxOjIzUE0gKzA1MzAsIEFuYW5kIE1vb24gd3JvdGU6Cj4gPiBIaSBNYXR0aGlhcywKPiA+
Cj4gPiBUaGFua3MgZm9yIHRoZSByZXZpZXcgY29tbWVudHMKPiA+Cj4gPiBPbiBUaHUsIDUgSmFu
IDIwMjMgYXQgMDQ6MjUsIE1hdHRoaWFzIEthZWhsY2tlIDxta2FAY2hyb21pdW0ub3JnPiB3cm90
ZToKPiA+ID4KPiA+ID4gT24gV2VkLCBEZWMgMjgsIDIwMjIgYXQgMDM6NTk6MTdQTSArMDUzMCwg
QW5hbmQgTW9vbiB3cm90ZToKPiA+ID4gPiBIaSBJY2Vub3d5LAo+ID4gPiA+Cj4gPiA+ID4gVGhh
bmtzIGZvciB0aGUgcmV2aWV3IGNvbW1lbnRzCj4gPiA+ID4KPiA+ID4gPiBPbiBXZWQsIDI4IERl
YyAyMDIyIGF0IDE1OjM4LCBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4gd3JvdGU6Cj4g
PiA+ID4gPgo+ID4gPiA+ID4g5ZyoIDIwMjItMTItMjjmmJ/mnJ/kuInnmoQgMTA6MDMgKzAwMDDv
vIxBbmFuZCBNb29u5YaZ6YGT77yaCj4gPiA+ID4gPiA+IEFkZCB1c2IgaHViIGRldmljZSBpZCBm
b3IgR2VuZXN5cyBMb2dpYywgSW5jLiBHTDg1MkctT0hHIEh1YiBVU0IgMi4wCj4gPiA+ID4gPiA+
IHJvb3QgaHViIGFuZCBHZW5lc3lzIExvZ2ljLCBJbmMuIEdMMzUyMy1RRk43NiBVU0IgMy4xIHJv
b3QgaHViLgo+ID4gPgo+ID4gPiBuaXQ6IFFGTiA3NiBpcyBvbmUgb2YgdGhlIHBhY2thZ2Ugb3B0
aW9ucyBvZiB0aGUgR0wzNTIzLCBJIGV4cGVjdCB0aGlzCj4gPiA+IGJpbmRpbmcgdG8gYmUgYXBw
bGljYWJsZSBhcyB3ZWxsIGZvciBvdGhlciBHTDM1MjMgdmFyaWFudHMsIHNvIEknZCBzdWdnZXN0
Cj4gPiA+IHRvIGRyb3AgdGhlIHN1ZmZpeC4gTm90IHN1cmUgd2hhdCAnT0hHJyBzdGFuZHMgZm9y
LCB0aGUgR2VuZXN5cyB3ZWJzaXRlCj4gPiA+IG9ubHkgbGlzdHMgYSBHTDg1MkcgaHViIHdpdGgg
ZGlmZmVyZW50IHBhY2thZ2UgdHlwZXMgKG5vbmUgb2YgdGhlbSAnT0hHJyksCj4gPiA+IHNvIEkn
ZCBzYXkgZHJvcCB0aGUgc3VmZml4IHVubGVzcyBpdCBpcyBrbm93biB0aGF0ICdPSEcnIHZhcmlh
bnQgdXNlcwo+ID4gPiBhIGRpZmZlcmVudCBwcm9kdWN0IGlkIHRoYW4gb3RoZXIgR0w4NTJHIHZh
cmlhbnRzCj4gPiA+Cj4gPgo+ID4gWWVzLCBJIHdpbGwgYmUgc3VyZSB0byBkbyB0aGlzIHJlZmVy
ZW5jZSwgSSBqdXN0IHBpY2tlZCB0aGVzZSBmcm9tIHRoZQo+ID4gYm9hcmQgc2NoZW1hdGljcy4K
PiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFuYW5kIE1vb24gPGxp
bnV4LmFtb29uQGdtYWlsLmNvbT4KPiA+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiA+ICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2dlbmVzeXMsZ2w4NTBnLnlhbWwgfCAyICsr
Cj4gPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+IGRpZmYgLS1naXQKPiA+ID4gPiA+ID4gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvdXNiL2dlbmVzeXMsZ2w4NTBnLnlhbWwKPiA+ID4gPiA+ID4gYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2dlbmVzeXMsZ2w4NTBnLnlhbWwKPiA+
ID4gPiA+ID4gaW5kZXggYTlmODMxNDQ4Y2NhLi5kYjAwOWYzZWY0MzggMTAwNjQ0Cj4gPiA+ID4g
PiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZ2VuZXN5cyxn
bDg1MGcueWFtbAo+ID4gPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdXNiL2dlbmVzeXMsZ2w4NTBnLnlhbWwKPiA+ID4gPiA+ID4gQEAgLTE2LDYgKzE2LDgg
QEAgcHJvcGVydGllczoKPiA+ID4gPiA+ID4gICAgY29tcGF0aWJsZToKPiA+ID4gPiA+ID4gICAg
ICBlbnVtOgo+ID4gPiA+ID4gPiAgICAgICAgLSB1c2I1ZTMsNjA4Cj4gPiA+ID4gPiA+ICsgICAg
ICAtIGdlbmVzeXMsdXNiNWUzLDYxMAo+ID4gPiA+ID4gPiArICAgICAgLSBnZW5lc3lzLHVzYjVl
Myw2MjAKPiA+ID4gPiA+Cj4gPiA+ID4gPiBJIGRvbid0IHRoaW5rIGdlbmVzeXMsIGlzIG5lZWRl
ZCBoZXJlIGJlY2F1c2UgdXNiNWUzIG1lYW5zIFVTQiBWSUQKPiA+ID4gPiA+IDB4MDVlMywgd2hp
Y2ggaXMgYWxyZWFkeSBsaW5rZWQgdG8gR2VuZXN5cyBMb2dpYy4KPiA+ID4gPiA+Cj4gPiA+ID4K
PiA+ID4gPiBPaywgSSBhZGRlZCB0aGlzIGFzIGdlbmVzeXMsIGlzIGl0IHBhcnQgb2YgdGhlIG1h
bnVmYWN0dXJlciBvciB2ZW5kb3IgbmFtZQo+ID4gPiA+IHdoaWNoIGlzIG1vc3QgY29tbW9ubHkg
dXNlZCBmb3IgYWRkaW5nIHZlbmRvci1zcGVjaWZpYyBjb21wYXRpYmxlIHN0cmluZ3MuCj4gPiA+
Cj4gPiA+IFRoYXQgZG9lc24ndCBmb2xsb3cgdGhlIGdlbmVyaWMgVVNCIGJpbmRpbmcsIHBsZWFz
ZSBkcm9wICdnZW5lc3lzLCcuCj4gPiA+Cj4gPgo+ID4gWWVzLCBJIHdpbGwgZHJvcCB0aGlzIGlu
IHRoZSBuZXh0IHZlcnNpb24uCj4gPgo+ID4gPiA+ID4gSW4gYWRkaXRpb24sIHRoZSBjb250cm9s
IGxvZ2ljIG9mIHRoZXNlIHR3byBodWJzIGFyZSBuZWVkZWQgdG8gYmUKPiA+ID4gPiA+IHZlcmlm
aWVkLgo+ID4gPiA+Cj4gPiA+ID4gV2Ugd2VyZSB1c2luZyBncGlvLWhvZyB0byByZXNldCB0aGUg
VVNCIGh1Yiwgc28gbm93IHN3aXRjaCB0byBVU0Igb25ib2FyZCBodWIKPiA+ID4gPgo+ID4gPiA+
ID4KPiA+ID4gPiA+IEFuZCB3aGF0J3MgdGhlIHN0YXR1cyBvZiB0aGUgY29tcGFuaW9uIGh1YiBv
ZiB0aGUgVVNCMyBodWI/IElzIGl0Cj4gPiA+ID4gPiByZWFsbHkgYSBVU0IzLW9ubHkgaHViLCBv
ciBpcyBpdHMgVVNCMiBwYXJ0IGp1c3QgZXF1YWwgdG8gYW5vdGhlciBVU0IzCj4gPiA+ID4gPiBo
dWI/Cj4gPiA+ID4gPgo+ID4gPiA+IHVzYjVlMyw2MTAgaXMgVVNCIDIuMCBwb3J0IGh1YiBwcmVz
ZW50IG9uIE9kcm9pZCBDMSBhbmQgT2Ryb2lkIEMyIGJvYXJkCj4gPiA+ID4KPiA+ID4gPiB1c2I1
ZTMsNjIwIGlzIFVTQiAzLjEgcG9ydCBodWIgcHJlc2VudCBvbiBPZHJvaWQgTjIuCj4gPiA+Cj4g
PiA+IExpa2UgSWNlbm93eSBJIHdvdWxkIGV4cGVjdCB0aGUgR0wzNTIzIHRvIHByb3ZpZGUgYWxz
byBhIDIuMCBodWIuCj4gPiA+Cj4gPiA+IFdoYXQgaXMgdGhlIG91dHB1dCBvZiAnbHN1c2InIG9u
IHRoZSBPZHJvaWQgTjI/Cj4gPgo+ID4gYWxhcm1Ab2Ryb2lkLW4yOn4kIGxzdXNiIC10dgo+ID4g
LzogIEJ1cyAwMi5Qb3J0IDE6IERldiAxLCBDbGFzcz1yb290X2h1YiwgRHJpdmVyPXhoY2ktaGNk
LzFwLCA1MDAwTQo+ID4gICAgIElEIDFkNmI6MDAwMyBMaW51eCBGb3VuZGF0aW9uIDMuMCByb290
IGh1Ygo+ID4gICAgIHxfXyBQb3J0IDE6IERldiAyLCBJZiAwLCBDbGFzcz1IdWIsIERyaXZlcj1o
dWIvNHAsIDUwMDBNCj4gPiAgICAgICAgIElEIDA1ZTM6MDYyMCBHZW5lc3lzIExvZ2ljLCBJbmMu
IEdMMzUyMyBIdWIKPiA+IC86ICBCdXMgMDEuUG9ydCAxOiBEZXYgMSwgQ2xhc3M9cm9vdF9odWIs
IERyaXZlcj14aGNpLWhjZC8ycCwgNDgwTQo+ID4gICAgIElEIDFkNmI6MDAwMiBMaW51eCBGb3Vu
ZGF0aW9uIDIuMCByb290IGh1Ygo+ID4gICAgIHxfXyBQb3J0IDE6IERldiAyLCBJZiAwLCBDbGFz
cz1IdWIsIERyaXZlcj1odWIvNHAsIDQ4ME0KPiA+ICAgICAgICAgSUQgMDVlMzowNjEwIEdlbmVz
eXMgTG9naWMsIEluYy4gSHViCj4KPiBUaGFua3MuIFNvIGl0IGxvb2tzIGxpa2UgMHgwNjEwIGlz
IHRoZSBwcm9kdWN0IGlkIG9mIHRoZSBVU0IgMi4wIHBvcnRpb24KPiBvZiB0aGUgR0wzNTIzLiBG
cm9tIHRoaXMgcGF0Y2ggaXQgc2VlbXMgdGhlIEdMODUyRyB1c2VzIHRoZSBzYW1lIHByb2R1Y3QK
PiBpZD8KClllcywgaXQgbG9va3MgY29ycmVjdCBhcyBwZXIgdGhlIGxzdXNiIG91dHB1dAoKVGhh
bmtzCi1BbmFuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
