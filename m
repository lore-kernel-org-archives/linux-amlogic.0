Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE61E9460A
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Feb 2026 21:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gdojE0K/VkJK1cPG07Oab2T2LydM8QVezcBGooYNWL8=; b=LC7tknh6MXjscp
	gXcR23fgW2h7jOKMc1OJQ+sMuNgTK25c40a3m/Fg5pfImJkNnOQbhVh37/ITwwlBPW52WVbCkbyr+
	7Ar285zM7OX1lVmz2yYBDTbum5gmy72TgDwSagmunXJLh6pjW4cRsp21AHMvJxmwAppVErEuGX5Eb
	/Bbo6kwBMprmNydq+73eAXioFOVWfzKqpPgYyIX7RD8pNy6sd22zBlsGo4Yofk4FyZyFqQsgwNcdY
	8I8iH8hOgMt55qQFPGMRYLLH/z4sA/fjcMJnsny1fGuraLbUt4H712G9xNk8DOIK5bJQww6bdIZik
	yrjTUwjWUEXiMDfquiew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpYmV-0000000G28k-3IoH;
	Mon, 09 Feb 2026 21:26:55 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpYmT-0000000G27v-1rFV
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Feb 2026 21:26:54 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-352dda4a34eso66538a91.1
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Feb 2026 13:26:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770672412; cv=none;
        d=google.com; s=arc-20240605;
        b=Ouguogj1nhFpdn4iFuuf5igwf55XzMnedimtC/zeN49xZxjTJMuMsbhb4TKpFZ1p1g
         iLzpy3stsFWH32OepR9dbhm39/gG+JpSUfCn+6pgOQA8GFJBb9CAVYt78b/pGsf+Shsz
         ooq0C7ihipqVnbXfosZT7/SiY1o+S1V3aUxtSM9yxL72Dd91RBDvWdFLqFf58b4VmSIC
         W6Xu3cW5u3+RgXequqSITTe6QTL3GN3aqbq/TJB4XdKDof4O0E7MUGb0TWsqnekIHJfS
         8uT1Bhg4Hq8FlLRd9gztc/U3cDzLOphQpg3ZQbUdOkO6DcBd7PsF8d0edyHDT6vHlulo
         tvNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vgtbeCi2pw6A5kW9LhY7XlTk4VpebFVbTB3poJyaYkE=;
        fh=IfPofRtkQMs2zDjXmbLkiKMHMdET3Ji9B/3tp7io5aM=;
        b=fdYXys7tWERQKIKc7QR9s5kdyRZt27ofCPXRTpoc+friSrHhtMJ2ldb7bETVxcwZAg
         vLhQYsak6+yhYbidHr9c/ZmXi1XtKX+zAu6hBS2TJuLXIBZUKjmMZ824P7tfiga/MlW5
         T+OHlAHRcc9rFr6SjoPGoMPx1jMHPALArVWRNu6r88d1v5Oz5O7jZQtSZWyU5B7165fq
         toYuRyPZZWcibc5FX+I3wO4H3aXA1gS/ABMLMd/SaxHgFVftg7rnU3NPrqFKGONEIKXl
         3fXqUWfluBhcBVmzER8yEKebKpqXWPYnCW2vLLl9XGxgmc8OYT/M1Jt4iAQc5ftUO0JR
         B+Iw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1770672412; x=1771277212; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vgtbeCi2pw6A5kW9LhY7XlTk4VpebFVbTB3poJyaYkE=;
        b=NGbfSsJTa33XYzNTpEI7BPDDPJjbYk0l2xI3v1Ip+xJXRu6v/BzoCYzPS8eL3MdT8s
         egGe/Kbh366gFA7hlYZES4XJi5SzbVMsP+KfU05V7G+Ja+EzgKsaa2vbT3H1hyre+RoD
         WH6XpSR/PxrlYc9VBx3SNNcbZYMINtOl8At66zciRPwJ7n3ph8CsbWRusAM5vDyBGkzg
         HxENbCj4ySP9LEB8FhM2xcK3sc6d/f8n4KkUtcInhShRDgjRxTehyelMMQ17ZApUi5yS
         aTkrgf9DcgxUUd2a1gq14ypVh7QUroE8iVEPlyfwzHj3ZAQsd5bbr/xAK7TtQcWHeC+C
         eXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770672412; x=1771277212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vgtbeCi2pw6A5kW9LhY7XlTk4VpebFVbTB3poJyaYkE=;
        b=cPFk/JdAYlGl1sfQt0pgREoy5z4VM5nJFzsDP3RBPOPI0iRjzDQuREPPuTkHGwiW9F
         pheF++2tAYNc/X5w9yOo/C+aJ8xAcbDbDLsLYfk1onXFzJjp1qDyNN04vlOClMF7lqNa
         ACRaz12nSrd06SpG7UypPzh/kXVS4bnMNeMsdIXMWEFyT2ifsvOprHpEbbCTocSye0Nb
         OMbXbtY5P2TOQPyOj1Wz1zMbTCZWcX1fGqxuHCRv0D8UCDBw0yL7L3vv+dD3iH4lbOxn
         eDaw3mYmQdF6UkzhYVwsLy/TnJOLtfFl6fZVoD4N494XI1Jh5bRYH+Qzl18kI+Pyi3x7
         X9qg==
X-Forwarded-Encrypted: i=1; AJvYcCWp05TKiyf59Wo9zFPeP/gTYMk9qzk8rZtKAbwhIHyzBOgkXeHCDbiJn07OnfYyomyQFffEc1J3xyyxfeHl@lists.infradead.org
X-Gm-Message-State: AOJu0YwfkvHkkzWwIGTAyO1gOlu74xCeJzxSsJ2SZUFxoZkNnqYtlYWO
	E+51nnEP3BZsrwCCXkHN5yw0fqUlbVM+No9mVRENlI8uuMyY5rD3lrxUJnSsxA4mdEhzJZhSfys
	gPVq/RhRBdpIPQJ/prLWsipztNBsbvcE=
X-Gm-Gg: AZuq6aLQM3ZBUCwZQjPbsnLy6qyMwJo45nhMi1J3iC2M1GbMu18JXznfYypiEL8s+kN
	xi9FSi0+z+lm+wo18Z0geVygsnAKgPL64pv79XdmLZPTYIryaElOrpSuim7yntB7GclPVMyG7ze
	cWv6B6oAbh0jwZe5SsY1jq9XyK0J0xAnTE3mLVdvMGcJJA/JjJedhlpIqa8UBuShL+ffJrCCGWX
	yOsah7Kd53vSuN3FKpFDIeA3+LsvN+XeVU4ta9W8c54NPLYA9jzNAY98cNfAOJHsHRyZF0i+xR8
	Vkzygrv+wiw1PHNNxh2D9IpsmWhv
X-Received: by 2002:a17:90b:2e51:b0:343:684c:f8ad with SMTP id
 98e67ed59e1d1-354b3ba3294mr10262394a91.4.1770672411768; Mon, 09 Feb 2026
 13:26:51 -0800 (PST)
MIME-Version: 1.0
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <2967a475-9fbe-4d20-a27c-04676c74d03c@linaro.org> <c94987c4-dd46-4eb5-a56b-8132c0c9a118@amlogic.com>
In-Reply-To: <c94987c4-dd46-4eb5-a56b-8132c0c9a118@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 9 Feb 2026 22:26:40 +0100
X-Gm-Features: AZwV_Qio8NRyquzlrCte6-5wu8k1L4ys4q4LdVkXlHVSOU_2HdQLmEswu1-xiH8
Message-ID: <CAFBinCA374KQiKn=_M5JNfY+Re_uw_40A169G=pU2-MghmUV2g@mail.gmail.com>
Subject: Re: [PATCH 00/11] Subject: [PATCH 00/11] Add DRM support for Amlogic S4
To: Ao Xu <ao.xu@amlogic.com>
Cc: neil.armstrong@linaro.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_132653_527284_14EB0927 
X-CRM114-Status: GOOD (  22.91  )
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

SGkgQW8gWHUsCgpPbiBUaHUsIEZlYiA1LCAyMDI2IGF0IDEyOjU24oCvUE0gQW8gWHUgPGFvLnh1
QGFtbG9naWMuY29tPiB3cm90ZToKPgo+IEhpIG5laWwsIG1hcnRpbiwgamVyb21lCj4KPiBUaGlz
IGVtYWlsIHByb3Bvc2VzIGEgcmVmYWN0b3Jpbmcgb2YgdGhlIE1lc29uIERSTSBkcml2ZXIgdG8g
YWRvcHQgYQo+IGNvbXBvbmVudC1iYXNlZCBwaXBlbGluZSBtYW5hZ2VtZW50IG1vZGVsLCBpbnNw
aXJlZCBieSB0aGUgQVJNIEtvbWVkYSBEUk0KPiBkcml2ZXIuCkZpcnN0IG9mIGFsbDogdGhhbmtz
IGZvciB3b3JraW5nIG9uIGEgcGxhbiBvbiBob3cgdG8gbW92ZSB0aGluZ3MgZm9yd2FyZCEKCj4g
VGhlIGN1cnJlbnQgTWVzb24gRFJNIGltcGxlbWVudGF0aW9uIHRpZ2h0bHkgY291cGxlcyBkcm1f
cGxhbmUgYW5kCj4gZHJtX2NydGMgbG9naWMgd2l0aCBzcGVjaWZpYyBoYXJkd2FyZSBibG9ja3Mg
KE9TRCBNSUYsIEFGQkMsIHNjYWxlciwKPiBibGVuZCwgcG9zdGJsZW5kKSwgd2hpY2ggbWFrZXMg
aXQgaW5jcmVhc2luZ2x5IGRpZmZpY3VsdCB0byBzY2FsZSB0bwo+IG5ld2VyIFNvQ3MuCkkgaGF2
ZSB0byBhZG1pdCB0aGF0IEknbSBuZXcgdG8gdGhpcyBwYXJ0IG9mIHRoZSBEUk0gZHJpdmVyIC8K
c3Vic3lzdGVtIC0gc28gSSB3aWxsIHByb2JhYmx5IGFzayBzb21lIG5vdmljZSBxdWVzdGlvbnMu
Cgo+IFRoZSBhdHRhY2hlZCAvdnB1LWJsb2NrLyBmaWxlIGRlc2NyaWJlcyB0aGUgcHJvcG9zZWQg
VlBVIGJsb2NrIHBpcGVsaW5lLgo+Cj4gVGhpcyBpbXBsZW1lbnQgaW50cm9kdWNlcyBhIGdlbmVy
aWMgcGlwZWxpbmUgZnJhbWV3b3JrIHdoZXJlOgo+Cj4gLSBIYXJkd2FyZSBibG9ja3MgKE1JRiwg
QUZCQywgU0NBTEVSLCBCTEVORCwgUE9TVEJMRU5EKSBhcmUgbW9kZWxlZCBhcwo+ICAgIGluZGVw
ZW5kZW50IGNvbXBvbmVudHMgd2l0aCB3ZWxsLWRlZmluZWQgY2FwYWJpbGl0aWVzLgo+Cj4gLSBk
cm1fcGxhbmUgYW5kIGRybV9jcnRjIGFyZSByZXNwb25zaWJsZSBvbmx5IGZvciBidWlsZGluZyBh
bmQgdmFsaWRhdGluZwo+ICAgIGEgcGlwZWxpbmUsIG5vdCBmb3IgZGlyZWN0bHkgcHJvZ3JhbW1p
bmcgaGFyZHdhcmUgcmVnaXN0ZXJzLgo+IC0gUGVyLWJsb2NrIGF0b21pYyBzdGF0ZSBpcyBzZXBh
cmF0ZWQgZnJvbSBTb0Mtc3BlY2lmaWMgcmVnaXN0ZXIgbGF5b3V0cywKPiAgICBzaW1pbGFyIHRv
IEtvbWVkYSdzIGNvbXBvbmVudF9zdGF0ZSBhbmQgcGlwZWxpbmVfc3RhdGUgbW9kZWwuCkkgaGF2
ZSB0d28gcXVlc3Rpb25zIGhlcmU6Ci0gSG93IGlzIHBlci1Tb0MgcmVnaXN0ZXIgYWNjZXNzIG1h
bmFnZWQ/Ci0gSG93IGFyZSAiY29tbW9uIiAoc2hhcmVkIGFjcm9zcyBtdWx0aXBsZSAtIG9yIGV2
ZW4gYWxsIFNvQ3MpCnJlZ2lzdGVycyBtYW5hZ2VkPwoKSXQgc2VlbXMgdGhhdCB0aGUga29tZWRh
IGRyaXZlciB1c2VzIGtvbWVkYV9kZXZfZnVuY3MgZm9yIHRoZQpwZXItdmFyaWFudCBhY2Nlc3Mu
Ckhvd2V2ZXIsIGl0J3Mgbm90IGNsZWFyIGhvdyB0aGlzIHNjYWxlcyBhcyBvbmx5IHR3byBtb3N0
bHkgaWRlbnRpY2FsCmRpc3BsYXkgY29udHJvbGxlcnMgKEQzMiBhbmQgRDcxKSBldmVyIG1hZGUg
aXQgaW50byB0aGUgZHJpdmVyLgoKPiBUaGlzIGlzIGFjaGlldmVkIGJ5IGludHJvZHVjaW5nIGZv
dXIgY29yZSBvYmplY3RzLCBhcyBzaG93biBpbiB0aGUKPiBhdHRhY2hlZCBjbGFzcy1kaWFncmFt
IGRvY3VtZW50Lgo+Cj4gLSBtZXNvbl92cHVfYmxvY2sKPiAtIG1lc29uX3ZwdV9ibG9ja19zdGF0
ZQo+IC0gbWVzb25fcGlwZWxpbmUKPiAtIG1lc29uX3BpcGVsaW5lX3N0YXRlCj4KPgo+IFRoZSBh
dG9taWMgZmxvdyBpcyBzdHJ1Y3R1cmVkIGFzIHNob3duIGluIHRoZSBhdHRhY2hlZCBjb21taXQt
ZmxvdyBkb2N1bWVudC4KVGhlIHB1YmxpYyBBMzExRCBkYXRhc2hlZXQgcGFnZSAzMDQgWzBdIHNo
b3dzIHRoYXQgQ1ZCUywgSERNSVRYIGFuZApNSVBJX0RTSSBhcmUgcGFydCBvZiB0aGUgVlBVIGJs
b2NrLgpUaG9zZSBhcmVuJ3QgbWVudGlvbmVkIGluIHlvdXIgZmxvd3MuIElzIHRoYXQgYmVjYXVz
ZSB0aGV5IGFyZSAiYWZ0ZXIiClBPU1RCTEVORCBhbmQgd291bGQgdGhlcmVmb3JlIGJlIHBhcnQg
b2YgYSBmdXR1cmUgcmVmYWN0b3JpbmcKYXBwcm9hY2g/CgpBbHNvIFJNREEgaXMgc2hvd24gaW4g
dGhlIHNhbWUgZGlhZ3JhbSBhcyBwYXJ0IG9mIFZQVS4gTmVpbCBoYWQgdG8Kd29yayBoYXJkIHRv
IGltcGxlbWVudCBpdCBiYWNrIHRoZW4gZm9yIEFGQkMuCllvdSBoYXZlbid0IGxpc3RlZCBpdCBp
biB5b3VyIGRpYWdyYW1zIGJ1dCBJIGFzc3VtZSBpdCBpcyBnb2luZyB0byBiZQpwYXJ0IG9mIHRo
ZSBpbXBsZW1lbnRhdGlvbiBhcyBpdCBpcy93YXMgbWFuZGF0b3J5IGZvciBBRkJDLgpDYW4geW91
IGNvbmZpcm0gbXkgdW5kZXJzdGFuZGluZyBoZXJlIChvciBjbGVhciB1cCBteSBjb25mdXNpb24p
PwoKPiBUaGUgaW50ZW50aW9uIG9mIHRoaXMgcHJvcG9zYWwgaXMgbm90IHRvIGNoYW5nZSBoYXJk
d2FyZSBiZWhhdmlvciwgYnV0IHRvCj4gZ3JhZHVhbGx5IHJlc3RydWN0dXJlIHRoZSBkcml2ZXIg
dG8gaW1wcm92ZSBtYWludGFpbmFiaWxpdHksIHNjYWxhYmlsaXR5LAo+IGFuZCBjb3JyZWN0bmVz
cyBvZiBhdG9taWMgc3RhdGUgaGFuZGxpbmcgYWNyb3NzIGRpZmZlcmVudCBNZXNvbiBTb0NzLgo+
Cj4gVGhpcyBpcyBhbiBpbml0aWFsIHByb3Bvc2FsIGludGVuZGVkIHRvIGdhdGhlciBmZWVkYmFj
ayBvbiB0aGUgb3ZlcmFsbAo+IGFyY2hpdGVjdHVyZSBiZWZvcmUgY29udmVydGluZyBleGlzdGlu
ZyBjb2RlIHBhdGhzIGluY3JlbWVudGFsbHkuCk1ha2luZyBpbmNyZW1lbnRhbCBjaGFuZ2VzIHNv
dW5kcyBncmVhdCEgVGhlIG1lc29uIERSTSBkcml2ZXIgaXMgdG9vCmJpZyB0byAianVzdCIgY29w
eSBpdCBhbmQgbWFrZSBtb2RpZmljYXRpb25zIChvciBldmVuIG1vZGlmeWluZyBpdApkaXJlY3Rs
eSB3aXRoIG9uZSBodWdlIHBhdGNoKS4KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKClswXSBodHRw
czovL2RsLmtoYWRhcy5jb20vcHJvZHVjdHMvdmltMy9kYXRhc2hlZXQvYTMxMWQtZGF0YXNoZWV0
LnBkZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
