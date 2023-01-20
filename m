Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C777CC25B4E
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Jan 2023 10:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MMgCbmFVHs+ve1CCc4jnbtIhOapMhPuGGYIe0RA5Q2w=; b=iGRNLoE5FxBx2p
	SUNw62T/ewaD9lr8kzVjoTZlpWBvA4cd/6yHvkOPt/6HmoNPtnBJBfMGn6r0nDe1tQerEdLpGZuHk
	ZhVfP8E73fmvW1XW3vAEFwvLP2It8EZiRIbsoHGV8Lr76RRd6/Uqb1Lw5ljCalmCmVnbsLBu2Gzlo
	LjkL7y33b/7YsYOUfQ6h9Ql/O3JgKQzat/WF/XBOy+0VIwB//FAIW/sN+/OFZUnkD6Tie2aHvpqRf
	fgLeE/VWvOuxVaJpc7x2tIoVlx9rICCwT65TwJrbrXfq0RX5WiCqW+if3km5/2aJ7s39JMjAJWKYM
	AZ76VR0+uHBfBOkeC1KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIoQx-009jPA-Vh; Fri, 20 Jan 2023 10:15:44 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIoP7-009iaX-22
	for linux-amlogic@lists.infradead.org; Fri, 20 Jan 2023 10:13:53 +0000
Received: by mail-wm1-x331.google.com with SMTP id j17so3638022wms.0
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Jan 2023 02:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZVqcL0xW73wfQaxg9BxXn6+FdbbVO9Jjcbrhv1lAVJM=;
        b=nP8F9V6I+nC+ktL0lcFHv1x8AM9DurCmr2R+AlrEcUPcfdwOlWEvjtwfxy0xdy0iHp
         sm+nrGdBenRnhI+qFB5nHnEW1Z3CS+dk87FH2536OM6F6wUFZHwQAD4IsA2rBet+/RY+
         JZlA1QaBtN5ROIQavstC1G9LDHc9UVn5y3LPe7oSDywadz2e76ZX+b2h3Mhqo02moVo1
         a1vsZmNE4vunQwWMJ9NfehDRM1qFagcQvomiUaYV70gCEHV2MDvmCPEuLg2UOz2hF3FT
         QkGXqHyoxoYhNuQqsIkfxI+POSLgYMqgd/s/muUTZXeWGf3FeN6tNISjjSsEwaeOrLMd
         bTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZVqcL0xW73wfQaxg9BxXn6+FdbbVO9Jjcbrhv1lAVJM=;
        b=q/kWYYoFWt/QTLN7t2RR1P6rj2ty980GjvTEglZe9aPaQva9F4R29mvgvccYOWut8V
         TSCg9TXn7fw5Jg2eE81yUheE3i1Yiq5+2OGaxroqsTHUnjSgGnQpfpDCj7lEHZWX3oGZ
         /gE/IK1EOr71ETXBQZJskijT4m5Qn7ixLRTxUp338Zlu4ksOHguOQupODR/foJz3XVTp
         mIXBNj8jCcswBIF0Xx455VWnzqcHeKoetY5+WxAmg/KcOSu9Uk9Sxzex0748leGp3Kr3
         17JlSw3WGpbvOcxLLk9Z9g9SwAGJHxgVz3lLPGHCwo0rz9kcD/8DN5Jh55u6JNxrHjYo
         7JHQ==
X-Gm-Message-State: AFqh2krvPVRJRNQalMR3OI0D8vCQ6JKPzlS27nmsRbZbIrBsKVD3llkC
	ORUE+6TLS0D+trTrSGmzOlfYuQ==
X-Google-Smtp-Source: AMrXdXt3XUbsefby5PW8M8bCChp15hd4F7Z4dOjg6DN8aEsIIlSHZgKQB98OXMJnLhY7l5dwWgIepw==
X-Received: by 2002:a05:600c:3555:b0:3da:f4d4:4c2 with SMTP id i21-20020a05600c355500b003daf4d404c2mr13290243wmq.37.1674209627458;
        Fri, 20 Jan 2023 02:13:47 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id k10-20020a05600c1c8a00b003db2dbbd710sm2039409wms.25.2023.01.20.02.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 02:13:46 -0800 (PST)
References: <d75ef7df-a645-7fdd-491a-f89f70dbea01@gmail.com>
 <Y8Qwk5H8Yd7qiN0j@lunn.ch>
 <03ea260e-f03c-d9d7-6f5f-ff72836f5739@gmail.com>
 <51abd8ca-8172-edfa-1c18-b1e48231f316@linaro.org>
 <6de25c61-c187-fb88-5bd7-477b1db1510e@gmail.com>
 <e75ed56f-ba25-f337-e879-33cc2a784740@gmail.com>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, David Miller
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kevin Hilman
 <khilman@baylibre.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..."
 <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH net-next] net: phy: meson-gxl: support more
 G12A-internal PHY versions
Date: Fri, 20 Jan 2023 11:01:56 +0100
In-reply-to: <e75ed56f-ba25-f337-e879-33cc2a784740@gmail.com>
Message-ID: <1jo7qtwm1z.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_021349_163823_ED066BF7 
X-CRM114-Status: GOOD (  28.65  )
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

Ck9uIFRodSAxOSBKYW4gMjAyMyBhdCAyMzo0MiwgSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQx
QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IE9uIDE1LjAxLjIwMjMgMjE6MzgsIEhlaW5lciBLYWxsd2Vp
dCB3cm90ZToKPj4gT24gMTUuMDEuMjAyMyAxOTo0MywgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+
PiBIaSBIZWluZXIsCj4+Pgo+Pj4gTGUgMTUvMDEvMjAyMyDDoCAxODowOSwgSGVpbmVyIEthbGx3
ZWl0IGEgw6ljcml0wqA6Cj4+Pj4gT24gMTUuMDEuMjAyMyAxNzo1NywgQW5kcmV3IEx1bm4gd3Jv
dGU6Cj4+Pj4+IE9uIFN1biwgSmFuIDE1LCAyMDIzIGF0IDA0OjE5OjM3UE0gKzAxMDAsIEhlaW5l
ciBLYWxsd2VpdCB3cm90ZToKPj4+Pj4+IE9uIG15IFNDMi1iYXNlZCBzeXN0ZW0gdGhlIGdlbnBo
eSBkcml2ZXIgd2FzIHVzZWQgYmVjYXVzZSB0aGUgUEhZCj4+Pj4+PiBpZGVudGlmaWVzIGFzIDB4
MDE4MDMzMDAuIEl0IHdvcmtzIG5vcm1hbCB3aXRoIHRoZSBtZXNvbiBnMTJhCj4+Pj4+PiBkcml2
ZXIgYWZ0ZXIgdGhpcyBjaGFuZ2UuCj4+Pj4+PiBTd2l0Y2ggdG8gUEhZX0lEX01BVENIX01PREVM
IHRvIGNvdmVyIHRoZSBkaWZmZXJlbnQgc3ViLXZlcnNpb25zLgo+Pj4+Pgo+Pj4+PiBIaSBIZWlu
ZXIKPj4+Pj4KPj4+Pj4gQXJlIHRoZXJlIGFueSBkYXRhc2hlZXRzIGZvciB0aGVzZSBkZXZpY2Vz
PyBBbnl0aGluZyB3aGljaCBkb2N1bWVudHMKPj4+Pj4gdGhlIGxvd2VyIG5pYmJsZSByZWFsbHkg
aXMgYSByZXZpc2lvbj8KPj4+Pj4KPj4+Pj4gSSdtIGp1c3QgdHJ5aW5nIHRvIGF2b2lkIGZ1dHVy
ZSBwcm9ibGVtcyB3aGVyZSB3ZSBmaW5kIGl0IGlzIGFjdHVhbGx5Cj4+Pj4+IGEgZGlmZmVyZW50
IFBIWSwgbmVlZHMgaXRzIG93biBNQVRDSF9FWEFDVCBlbnRyeSwgYW5kIHRoZW4gd2UgZmluZCB3
ZQo+Pj4+PiBicmVhayBkZXZpY2VzIHVzaW5nIDB4MDE4MDMzMDIgd2hpY2ggd2UgaGFkIG5vIGlk
ZWEgZXhpc3RzLCBidXQgZ290Cj4+Pj4+IGNvdmVyZWQgYnkgdGhpcyBjaGFuZ2UuCj4+Pj4+Cj4+
Pj4gVGhlIFNDMiBwbGF0Zm9ybSBpbmhlcml0ZWQgYSBsb3QgZnJvbSBHMTJBLCB0aGVyZWZvcmUg
aXQncyBwbGF1c2libGUKPj4+PiB0aGF0IGl0J3MgdGhlIHNhbWUgUEhZLiBBbHNvIHRoZSB2ZW5k
b3IgZHJpdmVyIGZvciBTQzIgZ2l2ZXMgYSBoaW50Cj4+Pj4gYXMgaXQgaGFzIHRoZSBmb2xsb3dp
bmcgY29tcGF0aWJsZSBmb3IgdGhlIFBIWToKPj4+Pgo+Pj4+IGNvbXBhdGlibGUgPSAiZXRoZXJu
ZXQtcGh5LWlkMDE4MC4zMzAxIiwgImV0aGVybmV0LXBoeS1pZWVlODAyLjMtYzIyIjsKPj4+Pgo+
Pj4+IEJ1dCB5b3UncmUgcmlnaHQsIEkgY2FuJ3Qgc2F5IGZvciBzdXJlIGFzIEkgZG9uJ3QgaGF2
ZSB0aGUgZGF0YXNoZWV0cy4KPj4+Cj4+PiBPbiBHMTJBICgmIEdYTCksIHRoZSBQSFkgSUQgaXMg
c2V0IGluIHRoZSBNRElPIE1VWCByZWdpc3RlcnMsCj4+PiBwbGVhc2Ugc2VlOgo+Pj4gaHR0cHM6
Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL25ldC9tZGlv
L21kaW8tbXV4LW1lc29uLWcxMmEuYyNMMzYKPj4+Cj4+PiBTbyB5b3Ugc2hvdWxkIGVpdGhlciBh
ZGQgc3VwcG9ydCBmb3IgdGhlIFBIWSBtdXggaW4gU0MyIG9yIGNoZWNrCj4+PiB3aGF0IGlzIGlu
IHRoZSBFVEhfUEhZX0NOVEwwIHJlZ2lzdGVyLgo+Pj4KPj4gVGhhbmtzIGZvciB0aGUgaGludC4g
SSBqdXN0IGNoZWNrZWQgYW5kIHJlYWRpbmcgYmFjayBFVEhfUEhZX0NOVEwwIGF0IHRoZQo+PiBl
bmQgb2YgZzEyYV9lbmFibGVfaW50ZXJuYWxfbWRpbygpIGdpdmVzIG1lIHRoZSBleHBlY3RlZCBy
ZXN1bHQgb2YgMHgzMzAxMDE4MC4KPj4gQnV0IHN0aWxsIHRoZSBQSFkgcmVwb3J0cyAzMzAwLgo+
PiBFdmVuIGlmIEkgd3JpdGUgc29tZSBvdGhlciByYW5kb20gdmFsdWUgdG8gRVRIX1BIWV9DTlRM
MCwgSSBnZXQgMDE4MC8zMzAwCj4+IGFzIFBIWSBJRC4KPj4gCj4+IEZvciB1LWJvb3QgSSBmb3Vu
ZCB0aGUgZm9sbG93aW5nOgo+PiAKPj4gaHR0cHM6Ly9naXRodWIuY29tL2toYWRhcy91LWJvb3Qv
YmxvYi9raGFkYXMtdmltNC1yLTY0Yml0L2RyaXZlcnMvbmV0L3BoeS9hbWxvZ2ljLmMKPj4gCj4+
IHN0YXRpYyBzdHJ1Y3QgcGh5X2RyaXZlciBhbWxvZ2ljX2ludGVybmFsX2RyaXZlciA9IHsKPj4g
CS5uYW1lID0gIk1lc29uIEdYTCBJbnRlcm5hbCBQSFkiLAo+PiAJLnVpZCA9IDB4MDE4MDMzMDAs
Cj4+IAkubWFzayA9IDB4ZmZmZmZmZjAsCj4+IAkuZmVhdHVyZXMgPSBQSFlfQkFTSUNfRkVBVFVS
RVMsCj4+IAkuY29uZmlnID0gJm1lc29uX3BoeV9jb25maWcsCj4+IAkuc3RhcnR1cCA9ICZtZXNv
bl9hbWxfc3RhcnR1cCwKPj4gCS5zaHV0ZG93biA9ICZnZW5waHlfc2h1dGRvd24sCj4+IH07Cj4+
IAo+PiBTbyBpdCdzIHRoZSBzYW1lIFBIWSBJRCBJJ20gc2VlaW5nIGluIExpbnV4Lgo+PiAKPj4g
TXkgYmVzdCBndWVzcyBpcyB0aGF0IHRoZSBmb2xsb3dpbmcgaXMgdGhlIGNhc2U6Cj4+IAo+PiBU
aGUgUEhZIGNvbXBhdGlibGUgc3RyaW5nIGluIERUIGlzIHRoZSBmb2xsb3dpbmcgaW4gYWxsIGNh
c2VzOgo+PiBjb21wYXRpYmxlID0gImV0aGVybmV0LXBoeS1pZDAxODAuMzMwMSIsICJldGhlcm5l
dC1waHktaWVlZTgwMi4zLWMyMiI7Cj4+IAo+PiBUaGVyZWZvcmUgaWQgMDE4MC8zMzAxIGlzIHVz
ZWQgZXZlbiBpZiB0aGUgUEhZIHJlcG9ydHMgc29tZXRoaW5nIGVsc2UuCj4+IE1lYW5zIGl0IGRv
ZXNuJ3QgbWF0dGVyIHdoaWNoIHZhbHVlIHlvdSB3cml0ZSB0byBFVEhfUEhZX0NOVEwwLgo+PiAK
Pj4gSSByZWR1Y2VkIHRoZSBjb21wYXRpYmxlIHN0cmluZyB0byBjb21wYXRpYmxlID0gImV0aGVy
bmV0LXBoeS1pZWVlODAyLjMtYzIyIgo+PiBhbmQgdGhpcyByZXN1bHRlZCBpbiB0aGUgYWN0dWFs
IFBIWSBJRCBiZWluZyB1c2VkLgo+PiBZb3UgY291bGQgY2hhbmdlIHRoZSBjb21wYXRpYmxlIGlu
IGR0cyB0aGUgc2FtZSB3YXkgZm9yIGFueSBnMTJhIHN5c3RlbQo+PiBhbmQgSSBhc3N1bWUgeW91
IHdvdWxkIGdldCAwMTgwLzMzMDAgdG9vLgo+PiAKPj4gUmVtYWluaW5nIHF1ZXN0aW9uIGlzIHdo
eSB0aGUgdmFsdWUgaW4gRVRIX1BIWV9DTlRMMCBpcyBpZ25vcmVkLgo+PiAKPgo+IEkgdGhpbmsg
SSBmb3VuZCB3aGF0J3MgZ29pbmcgb24uIFRoZSBQSFkgSUQgd3JpdHRlbiB0byBTb0MgcmVnaXN0
ZXIKPiBFVEhfUEhZX0NOVEwwIGlzbid0IGVmZmVjdGl2ZSBpbW1lZGlhdGVseS4gSXQgdGFrZXMg
YSBQSFkgc29mdCByZXNldCBiZWZvcmUKPiBpdCByZXBvcnRzIHRoZSBuZXcgUEhZIElELiBXb3Vs
ZCBiZSBnb29kIHRvIGhhdmUgYSBjb21tZW50IGluIHRoZQo+IGcxMmEgbWRpbyBtdXggY29kZSBt
ZW50aW9uaW5nIHRoaXMgY29uc3RyYWludC4KPgo+IEkgc2VlIG5vIGVhc3kgd2F5IHRvIHRyaWdn
ZXIgYSBzb2Z0IHJlc2V0IGVhcmx5IGVub3VnaC4gVGhlcmVmb3JlIGl0J3MgaW5kZWVkCj4gdGhl
IHNpbXBsZXN0IG9wdGlvbiB0byBzcGVjaWZ5IHRoZSBuZXcgUEhZIElEIGluIHRoZSBjb21wYXRp
YmxlLgoKVGhpcyBpcyBiZWNhdXNlIChJIGd1ZXNzKSB0aGUgUEhZIG9ubHkgcGlja3MgdXBzIHRo
ZSBJRCBmcm9tIHRoZSBnbHVlCndoZW4gaXQgcG93ZXJzIHVwLiBBZnRlciB0aGF0IHRoZSB2YWx1
ZXMgYXJlIGlnbm9yZWQuCgpSZW1lbWJlciB0aGUgUEhZIGlzIGEgImJvdWdodCIgSVAsIHRoZSBn
bHVlL211eCBwcm92aWRlcyB0aGUgaW5wdXQKc2V0dGluZ3MgcmVxdWlyZWQgYnkgdGhlIFBIWSBw
cm92aWRlci4KCkJlc3Qgd291bGQgYmUgdG8gdHJpZ2dlciBhbiBIVyByZXNldCBvZiBQSFkgZnJv
bSBnbHVlIGFmdGVyIHNldHRpbmcgdGhlCnJlZ2lzdGVyIEVUSF9QSFlfQ05UTDAuCgpNYXliZSB0
aGlzIHBhdGNoIGNvdWxkIGhlbHAgOiA/Cmh0dHBzOi8vZ2l0bGFiLmNvbS9qYnJ1bmV0L2xpbnV4
Ly0vY29tbWl0L2NjYmIwN2IwYzllYjJkZTI2ODE4ZWI0ZjhhYTFmZDBlNWIzMWU2ZGIucGF0Y2gK
CkkgdHJpZWQgdGhpcyB3aGVuIHdlIGRlYnVnZ2VkIHRoZSBjb25uZWN0aXZpdHkgaXNzdWUgb24g
dGhlIGcxMiBlYXJsaWVyCnRoaXMgc3ByaW5nLiBJIGRpZCBub3Qgc2VuZCBpdCBiZWNhdXNlIHRo
ZSBwcm9ibGVtIHdhcyBmb3VuZCB0byBiZSBpbgpzdG1tYWMuCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
