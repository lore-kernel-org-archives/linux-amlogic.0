Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114FBC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Feb 2022 06:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ffd7kB1VaFSzyGG01N4nmr9qtHUhmp4/EpO5Tf7NfCo=; b=D5OBosVg+nukIQ
	n2T6SL03H0/IumTyUygGk+RRAieAx8WYxGH3NtP3U7B2excocrQw+mtn8Il/WRLy+M3CdgXWA5F5j
	YTOOlzGZsbPQ/rpkLa27YroXLLGSKEDXHuL3rnYwaAk4hoyxUA2ic57JkeKJaLXQ2WmlCmk9maKRV
	RtSlxRHIibgYH97dtYhCJ9W4BnfarOBpLmmuB0qkDtt43Of3OXZY84/UKCVHUBLo6c5lM2kj8KJSc
	xkfc+fiEx174dK5Z7ou3MCUvCqrhjRLRtKKkDqGETgBWy9+MLKVaAbCIhL5EiY2ikwGwI6R2/1J5L
	aM97BWZRmVg/2obPCuTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM2G2-003iU3-9b; Mon, 21 Feb 2022 06:33:14 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM2FK-003i5S-JT; Mon, 21 Feb 2022 06:32:32 +0000
Received: by mail-wr1-x42f.google.com with SMTP id u1so25192020wrg.11;
 Sun, 20 Feb 2022 22:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=TVB1SAwyejdejCoebVJa4rEH4qtbM8FunJaGvyM3xDM=;
 b=iM9rYwji7ExpIYsMATDt3yW2TvXSImXKy56t9ZnCBnNRyO+AslIr0JjDxly7meBJNS
 XPjTZIEJ2MxaBO+A/wWNBg6Z8uq39L8PSFfLo7MV8szZKnCg6cC0lcSz0mxX/HUvJ///
 TZ5u8EC8YdenrWo/0aeQ854OfRtrNyOZo7BUUubaQZqm4YzwYXu6TfcKhxapndcPhiHY
 bpuQ3lj0caDNdo7axv8aGGS1HMhqpDpIlrmxt9Eo++ZZcKu2yVr8zZb1sheFDbrnWhn3
 +CdgL1HoKv+E1pSyfqT9E3g2QrS2ijx701r+jwlN4ZvwQ0UlMKYmXSw6VPyJE35UWduB
 O52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=TVB1SAwyejdejCoebVJa4rEH4qtbM8FunJaGvyM3xDM=;
 b=AjFefuKB4dFbVjDjsQ2BZPFgmcFOEasaEBRn6UQx+oVezKfjrGFUPT+KS2GTGAZAsN
 O4oLtZc+bIYaG2quYC3Hkvc3ocimDbNM0MK6vkUkaEH0SaVogQJf6LWc40IXG5KVYoAL
 EsxkORaUkKeDf4cm+nCn+3lYoIffAnNLk7tQmhZs+fvInfi9/d6ywoHAAjNyTD3PWSh/
 GuS4Dcqimzd+hJWE+Ea2ADhmx12I764Ap45+hz8gqZx6Eb8IVGdDg/P3j/QO+wHEO019
 mZnYLKfbiBLTn+UYcRzDsMbxO1nEt+U8hXMLaQTS5X6pgHR1IFwi5K4ZqDchtS55tqay
 Smlg==
X-Gm-Message-State: AOAM531UwpUbZVpgtbiYPne3z2b1/Bo+JAwlP0km+0BAQvKfD4WGNEqu
 xhwhIDEYHITbT18fc2PIQl4=
X-Google-Smtp-Source: ABdhPJx+1Angj51NlGm4D2VR44yakbH8bYZ+MvkrSDPFeVRwcN3Ulhy+q7jJf6Yf2bNkid5hRieHAA==
X-Received: by 2002:a05:6000:258:b0:1e4:eee1:93b9 with SMTP id
 m24-20020a056000025800b001e4eee193b9mr14735201wrz.558.1645425147536; 
 Sun, 20 Feb 2022 22:32:27 -0800 (PST)
Received: from smtpclient.apple ([167.99.200.149])
 by smtp.gmail.com with ESMTPSA id s2sm6429180wmc.45.2022.02.20.22.32.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 20 Feb 2022 22:32:27 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH 0/6] auxdisplay: Add support for the Titanmec TM1628 7
 segment display controller
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <4172e59f-b9d5-d87d-9dbd-a6f683a2173c@gmail.com>
Date: Mon, 21 Feb 2022 10:32:22 +0400
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?utf-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Miguel Ojeda <ojeda@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 linux-amlogic@lists.infradead.org
Message-Id: <5B4B8165-5D64-4336-A149-DF55C47D5ACE@gmail.com>
References: <4172e59f-b9d5-d87d-9dbd-a6f683a2173c@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_223230_713795_71F70311 
X-CRM114-Status: GOOD (  27.75  )
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

cmVzZW5kIGZyb20gY29ycmVjdCBtYWlsIGFjY291bnQ6Cgo+IE9uIDE5IEZlYiAyMDIyLCBhdCA1
OjEzIHBtLCBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPiB3cm90ZToKPiAK
PiBUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIHRoZSBUaXRhbm1lYyBUTTE2MjggNyBzZWdt
ZW50IGRpc3BsYXkKPiBjb250cm9sbGVyLiBJdCdzIGJhc2VkIG9uIHByZXZpb3VzIFJGQyB3b3Jr
IGZyb20gQW5kcmVhcyBGw6RyYmVyLgo+IFRoZSBSRkMgdmVyc2lvbiBwbGFjZWQgdGhlIGRyaXZl
ciBpbiB0aGUgTEVEIHN1YnN5c3RlbSwgYnV0IHRoaXMgd2FzCj4gTkFLJ2VkIGJ5IHRoZSBMRUQg
bWFpbnRhaW5lci4gVGhlcmVmb3JlIEkgbW92ZWQgdGhlIGRyaXZlciB0bwo+IC9kcml2ZXJzL2F1
eGRpc3BsYXkgd2hhdCBzZWVtcyBtb3N0IHJlYXNvbmFibGUgdG8gbWUuCj4gCj4gVG8gYmUgZGVj
aWRlZCBpcyB0aHJvdWdoIHdoaWNoIHRyZWUgdGhpcyBzZXJpZXMgc2hvdWxkIGdvLgo+IEknZCB0
aGluayBTUEkgd291bGQgYmUgbW9zdCBzdWl0ZWQsIGJ1dCB0aGF0J3MgYSBkZWNpc2lvbiBJCj4g
bGVhdmUgdXAgdG8gdGhlIHJlc3BlY3RpdmUgbWFpbnRhaW5lcnMuCj4gCj4gRnVydGhlciBjaGFu
Z2VzIHRvIHRoZSBSRkMgdmVyc2lvbjoKPiAtIERyaXZlciBjYW4gYmUgYnVpbHQgYWxzbyB3L28g
TEVEIGNsYXNzIHN1cHBvcnQsIGZvciBkaXNwbGF5cyB0aGF0Cj4gZG9uJ3QgaGF2ZSBhbnkgc3lt
Ym9scyB0byBiZSBleHBvc2VkIGFzIExFRCdzLgo+IC0gU2ltcGxpZmllZCB0aGUgY29kZSBhbmQg
cmV3cm90ZSBhIGxvdCBvZiBpdC4KPiAtIERyaXZlciBpcyBub3cga2luZCBvZiBhIE1WUCwgYnV0
IGZ1bmN0aW9uYWxpdHkgc2hvdWxkIGJlIHN1ZmZpY2llbnQKPiBmb3IgbW9zdCB1c2UgY2FzZXMu
Cj4gLSBVc2UgdGhlIGV4aXN0aW5nIDcgc2VnbWVudCBzdXBwb3J0IGluIHVhcGkvbGludXgvbWFw
X3RvXzdzZWdtZW50LmgKPiBhcyBzdWdnZXN0ZWQgYnkgR2VlcnQgVXl0dGVyaG9ldmVuLgo+IAo+
IE5vdGU6IFRoZXJlJ3MgYSBudW1iZXIgb2YgY2hpcHMgZnJvbSBvdGhlciBtYW51ZmFjdHVyZXJz
IHRoYXQgYXJlCj4gICAgIGFsbW9zdCBpZGVudGljYWwsIGUuZy4gRkQ2MjgsIFNNMTYyOC4gT25s
eSBkaWZmZXJlbmNlIEkgc2F3IHNvCj4gICAgIGZhciBpcyB0aGF0IHRoZXkgcGFydGlhbGx5IHN1
cHBvcnQgb3RoZXIgZGlzcGxheSBtb2Rlcy4KPiAgICAgVE0xNjI4OiA2eDEyLCA3eDExCj4gICAg
IFNNMTYyOEM6IDR4MTMsIDV4MTIsIDZ4MTEsIDd4MTAKPiAgICAgRm9yIHR5cGljYWwgZGlzcGxh
eXMgb24gZGV2aWNlcyB1c2luZyB0aGVzZSBjaGlwcyB0aGlzCj4gICAgIGRpZmZlcmVuY2Ugc2hv
dWxkbid0IG1hdHRlci4KPiAKPiBTdWNjZXNzZnVsbHkgdGVzdGVkIG9uIGEgVFgzIE1pbmkgVFYg
Ym94IHRoYXQgaGFzIGFuIFNNMTYyOEMgYW5kIGEKPiBkaXNwbGF5IHdpdGggNCBkaWdpdHMgYW5k
IDcgc3ltYm9scy4KClRoYW5rcyBmb3IgZHVzdGluZyBvZmYgc291cmNlcyBhbmQgd29ya2luZyBv
biB0aGlzISAtIGl04oCZcyBhbm90aGVyIHBpZWNlCm9mIHRoZSB1cHN0cmVhbSBwdXp6bGUgZm9y
IGRpc3Ryb3MgdGhhdCBpbnN0YWxsIG9uIEFuZHJvaWQgYm94ZXMuCgpJIG5lZWRlZCB0aGUgZm9s
bG93aW5nIHBhdGNoIHRvIGFkZHJlc3MgY29tcGlsZSBpc3N1ZXMgKG1pc3NpbmcgaW5jbHVkZSwK
YW5kIHRoZSByZWNlbnQgdm9pZC9pbnQgY2hhbmdlIGluIGxpbnV4LW5leHQgKEnigJltIHVzaW5n
IDUuMTcueSk6CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9hdXhkaXNwbGF5L3RtMTYyOC5jIGIvZHJp
dmVycy9hdXhkaXNwbGF5L3RtMTYyOC5jCmluZGV4IGEzOWI2MzgyODJjMS4uYWIzNTU3ZjhiMzMw
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2F1eGRpc3BsYXkvdG0xNjI4LmMKKysrIGIvZHJpdmVycy9h
dXhkaXNwbGF5L3RtMTYyOC5jCkBAIC01LDYgKzUsNyBAQAoqIENvcHlyaWdodCAoYykgMjAxOSBB
bmRyZWFzIEbDpHJiZXIKKi8KCisjaW5jbHVkZSA8bGludXgvY3R5cGUuaD4KI2luY2x1ZGUgPGxp
bnV4L2RlbGF5Lmg+CiNpbmNsdWRlIDxsaW51eC9sZWRzLmg+CiNpbmNsdWRlIDxsaW51eC9tb2R1
bGUuaD4KQEAgLTMyNywxMCArMzI4LDExIEBAIHN0YXRpYyBpbnQgdG0xNjI4X3NwaV9wcm9iZShz
dHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQogICAgICByZXR1cm4gZGV2aWNlX2NyZWF0ZV9maWxlKCZz
cGktPmRldiwgJmRldl9hdHRyX2Rpc3BsYXlfdGV4dCk7Cn0KCi1zdGF0aWMgdm9pZCB0bTE2Mjhf
c3BpX3JlbW92ZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQorc3RhdGljIGludCB0bTE2Mjhfc3Bp
X3JlbW92ZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQp7CiAgICAgIGRldmljZV9yZW1vdmVfZmls
ZSgmc3BpLT5kZXYsICZkZXZfYXR0cl9kaXNwbGF5X3RleHQpOwogICAgICB0bTE2Mjhfc2V0X2Rp
c3BsYXlfY3RybChzcGksIGZhbHNlKTsKKyAgICAgICByZXR1cm4gMDsKfQoKc3RhdGljIHZvaWQg
dG0xNjI4X3NwaV9zaHV0ZG93bihzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQoKSSBhbHNvIG5lZWRl
ZCBDT05GSUdfU1BJX0dQSU89eSBpbiBrZXJuZWwgY29uZmlnLiBXaXRoIHRoaXMgYWRkZWQgdGhl
CmRyaXZlciBwcm9iZXMgb24gbXkgVFgzIG1pbmkgYm94IGFuZCB0aGUgZGlzcGxheSBnb2VzIGRh
cmsgb3ZlcndyaXRpbmcKdGhlIGRlZmF1bHQg4oCYYm9vdOKAmSB0ZXh0LiBUaGUgZm9sbG93aW5n
IHN5c3RlbWQgc2VydmljZSBhbmQgc2NyaXB0IHNldHMKdGhlIGNsb2NrIGFuZCBmbGFzaGVzIHRo
ZSBjb2xvbiBzZXBhcmF0b3Igb24vb2ZmIHRvIGNvdW50IHNlY29uZHM6CgpodHRwczovL2dpdGh1
Yi5jb20vY2hld2l0dC9MaWJyZUVMRUMudHYvY29tbWl0L2M4ZjFlYmU2ZjZjMzY2MTg4ZjE4Zjlk
MmI0MDFkZTZjMjk3OWZkZDcKCldpdGggdGhlIGluY2x1ZGUgZml4dXAgYW5kIG1heWJlIGEgS2Nv
bmZpZyB0d2VhaywgZm9yIHRoZSBzZXJpZXM6CgpUZXN0ZWQtYnk6IENocmlzdGlhbiBIZXdpdHQg
PGNocmlzdGlhbnNoZXdpdHRAZ21haWwuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
