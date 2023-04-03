Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA12C77B60
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Apr 2023 08:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wOf5z5oRNQSFS4Ph0BHCDuVSDsJ29aPN7dyTxFtkVvw=; b=mwQ9E71vgC5vrm
	1UGLdts/Dfcsh8x//Eeev28DTukjAKytw8/WOqCkxGKd+ikdvYtwuHkko+siSwxHHpGxdxjPXPtYU
	yMC5t2R7HDYSwquG/PHnicQeuu5Vx6i2W8gldsRYawpzzgRySB/sMbOeHD9HXPKBmUwuoCUfTcV5/
	MDIzxGJdlQCZ1yqJ3XQ82WwuU9oz2lBdDoCcycapADN+x/gWjh6XR6qEPe0n8g61xC3rENHskidrQ
	+5X3neQOQ0nlEz9zrxtJEcCnVJGzJvGb+g/j1UaDf8UuYd0NTZOmfgVirT7qx/lGBkpa2uFu4AZYw
	D86UQWAx4WHBv7zC5nGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjFH2-00ETkB-3B;
	Mon, 03 Apr 2023 08:10:44 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjFGz-00ETj6-37
	for linux-amlogic@lists.infradead.org;
	Mon, 03 Apr 2023 08:10:43 +0000
Received: by mail-wm1-x32d.google.com with SMTP id d11-20020a05600c3acb00b003ef6e6754c5so13762487wms.5
        for <linux-amlogic@lists.infradead.org>; Mon, 03 Apr 2023 01:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680509440; x=1683101440;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4YTLsvZXuKPI+bQLaGf8VHiSKW8VyFtQuobtXNVM98=;
        b=Vnrt282OBYDpYJHLFn0e99ZSW162hVi5JTKNZTnVkpwPnojkxj8tL5mLlD95lZAvox
         9yKq/Ax1WpE5OoS5MVz+VT83JnMQXoFAhhLTkSoAR1x0g284kyYn0rvAQ6idBU+16raR
         0pbKSasjKxF9rlzTzMNYavrN0EgvTMn6vVjsEazBm1JswHXbz+PrxGaXCw++6dRCIcAp
         GqEViDg3/FwudEwo8Np1EtAYLVGCzsAZXBQzB17g88+2+BJBTICkjmJD/8b8s8eciPkr
         b8odH7AlTV9kHzfmueyoGB508kQFZqCQKTQ4yiApL0WjEOawmz5j9o0Zg4AwGsa+yNtn
         DEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680509440; x=1683101440;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V4YTLsvZXuKPI+bQLaGf8VHiSKW8VyFtQuobtXNVM98=;
        b=te+yPo2688wi61uA+ysh6V8Qy+PI3TXVEgevXE2U+w2yT7833TjcuMT7vteo7mCjw2
         WPW3eTD84QPJ1zFL2K4myKJTnYNrk68RtCi7ZpC5ppMPInjsyth7+/JNq5gDx5GINS5r
         x0TGjy8Z2WE8bXzx9BZVPiU/8Bt8GRr4bBy5+wU2M7cem9H04x0OC/txlqlJ16l1M7J+
         9bAG/gbXkUHjOT4dKUar/mR0lK/HEq7do/oQ1l6/fH6HWaF329hNh+bSPljMeb+2iyki
         obnN23lIbjE/7IcvVfQU7XWY60yoDumFD1sqDO3/RyYhHtcVFcQZ4ao/KrvhhxKjVmb8
         cObQ==
X-Gm-Message-State: AAQBX9cCQwxSp5vq9tmZiSOF3e6AHvib8wz72e1OKRRxViHyvMJAV/21
	gFZ9sgfv/ggDGHCFaxPBWfI=
X-Google-Smtp-Source: AKy350YjvWrwFFDMTDDklPmzprZGOdKRLN0tB1dz0PMudf+EbtCTiUvxrInkaJptX7aOebbq8ENkSg==
X-Received: by 2002:a05:600c:4d0f:b0:3ed:de03:7f0a with SMTP id u15-20020a05600c4d0f00b003edde037f0amr12870345wmp.10.1680509440401;
        Mon, 03 Apr 2023 01:10:40 -0700 (PDT)
Received: from smtpclient.apple ([167.99.200.149])
        by smtp.gmail.com with ESMTPSA id x21-20020a05600c21d500b003ef64affec7sm11267695wmj.22.2023.04.03.01.10.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Apr 2023 01:10:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.2\))
Subject: Re: [PATCH v2 0/1] meson: Demonstration of using binman to produce
 the image
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <CAPnjgZ0Js43JOi3xaeY8tYuELSPXWL-PCBq1-iANLs1074MzbQ@mail.gmail.com>
Date: Mon, 3 Apr 2023 12:10:36 +0400
Cc: Mark Kettenis <mark.kettenis@xs4all.nl>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 u-boot-amlogic@groups.io,
 AML <linux-amlogic@lists.infradead.org>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Message-Id: <1973D65D-692D-4AA7-B074-942D4E9ADB4B@gmail.com>
References: <20230401185458.2280200-1-sjg@chromium.org>
 <87zg7rb8dd.fsf@bloch.sibelius.xs4all.nl>
 <CAPnjgZ0Js43JOi3xaeY8tYuELSPXWL-PCBq1-iANLs1074MzbQ@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
X-Mailer: Apple Mail (2.3696.120.41.1.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_011041_999841_39D85073 
X-CRM114-Status: GOOD (  26.21  )
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

PiBPbiAyIEFwciAyMDIzLCBhdCA2OjQxIGFtLCBTaW1vbiBHbGFzcyA8c2pnQGNocm9taXVtLm9y
Zz4gd3JvdGU6Cj4gCj4gSGkgTWFyaywKPiAKPiBPbiBTdW4sIDIgQXByIDIwMjMgYXQgMDk6Mjgs
IE1hcmsgS2V0dGVuaXMgPG1hcmsua2V0dGVuaXNAeHM0YWxsLm5sPiB3cm90ZToKPiA+Cj4gPiA+
IEZyb206IFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPgo+ID4gPiBEYXRlOiBTdW4sICAy
IEFwciAyMDIzIDA2OjU0OjU3ICsxMjAwCj4gPiA+Cj4gPiA+IFRoZSBPZHJvaWQtQzIgaXMgcXVp
dGUgYSBjb21wbGljYXRlZCBpbWFnZSB3aXRoIG1hbnkgc3RlcHMuIEl0IGlzIGFuIGlkZWFsCj4g
PiA+IGV4YW1wbGUgZm9yIGhvdyBCaW5tYW4gY2FuIGJlIHVzZWQuCj4gPgo+ID4gWW91IHNheSBP
ZHJvaWQtQzIsIGJ1dCB0aGUgcGF0Y2hlcyBzZWVtIHRvIGFkZHJlc3MgdGhlIE9kcm9pZC1DNC4u
Lgo+IAo+IEFoLCB5ZXMuIFRoZSBkaWZmZXJlbmNlIHNlZW1zIHRvIGJlIGFuIEFtbG9naWMgUzkw
NSBvbiB0aGUgQzIgYW5kIGFuIFM5MDJYMyBvbiB0aGUgQzQuIEkgd29uZGVyIGlmIHRoYXQgYWZm
ZWN0cyB0aGUgaW1hZ2UgbWFrZXVwPwoKVGhlcmUgYXJlIGN1cnJlbnRseSBmb3VyIGRpZmZlcmVu
dCBzaWduaW5nIHJlY2lwZXMgdGhhdCBkZXBlbmQgb24gdGhlCmJvYXJkIGZhbWlseSB0aGF0IHlv
dSBhcmUgYnVpbGRpbmcgZm9yOgoKLSBHWEJCCi0gR1hML0dYTQotIEcxMkEvU00xCi0gRzEyQgoK
VGhlIEcxMkEvU00xIGFuZCBHMTJCIHJlY2lwZXMgYXJlIGlkZW50aWNhbCBleGNlcHQgZm9yIGEg
ZGlmZmVyZW50CnNpZ25pbmcgYmluYXJ5IHVzZWQuIFRoZSBsYXRlc3QgQW1sb2dpYyBib2FyZHMg
KFM5MDVYNCwgVDcsIGV0Yy4pCmFsc28gaGF2ZSBpbmNyZW1lbnRhbCBjaGFuZ2VzLCBidXQgbm9u
ZSBhcmUgY3VycmVudGx5IHN1cHBvcnRlZCBpbgpMaW51eCBvciB1LWJvb3QuCgpPbmUgb2YgdGhl
IGNoYWxsZW5nZXMgZm9yIGJpbm1hbiB3aWxsIGJlIHRoZSBzaWduaW5nIHRvb2xzLiBDdXJyZW50
bHkKdGhpcyBwYXRjaHNldCBkZXBlbmRzIHVwb24gQW1sb2dpYyBiaW5hcmllcy4gQXBhcnQgZnJv
bSB0aGVtIGJlaW5nCmNsb3NlZC1zb3VyY2UgYW5kIHRodXMgdW5kZXNpcmFibGUsIHRoZXkgYXJl
IGFsc28geDg2XzY0IG9ubHkgYW5kCnRoZXJlIGFyZSBxdWl0ZSBhIGZldyB1c2VycyAoYW5kIGF0
IGxlYXN0IG9uZSBtYWpvciBkaXN0cm8pIG5lZWRpbmcKdG8gYnVpbGQgb24gYXJtNjQgaGFyZHdh
cmUuCgpUaGVyZSBpcyBhbiBvcGVuLXNvdXJjZSB0b29sIGNhbGxlZCBneGxpbWcgd2hpY2ggc3Vw
cG9ydHMgR1hMIGFuZCBuZXdlcgpib2FyZHMuIElNSE8gaXQgd291bGQgbWFrZSBhIGxvdCBvZiBz
ZW5zZSBmb3IgdS1ib290IHRvIGFic29yYiB0aGUKZnVuY3Rpb25hbGl0eSBvZiBneGxpbWcgKGFu
ZCBleHRlbmQgc3VwcG9ydCBiYWNrd2FyZHMgdG8gR1hCQikgYXMgdGhpcwp3b3VsZCByZW1vdmUg
dGhlIGRlcGVuZGVuY3kgb24gQW1sb2dpYyBiaW5hcmllcyBhbmQgYWxsb3cgdS1ib290IGJ1aWxk
CmFuZCBiaW5tYW4gc2lnbmluZyB0byBiZSBkb25lIGFueXdoZXJlLgoKaHR0cHM6Ly9naXRodWIu
Y29tL3JlcGsvZ3hsaW1nCgo+IFRoZSBwYXRjaCBpcyBmb3IgdGVzdGluZyBieSBDaHJpc3RpYW4s
IHdobyBJIGhvcGUgY2FuIGhlbHAgZ2V0IHRoaXMgbGFuZGVkIGZvciBhbGwgdGhlIEFtbG9naWMg
Ym9hcmRzLgoKSSB3aWxsIHRyeSB0byBmaW5kIHRoZSB0aW1lIHRvIHRlc3QgdGhpcywgYnV0IGl0
4oCZcyBub3Qgc29tZXRoaW5nIEkKY291bGQgZG8gbW9yZSB3aXRoIChhcyBvbmx5IHN1cHBvcnRp
bmcgMS80IG9mIHRoZSBib2FyZCBmYW1pbGllcwp0aGF0IEkgbmVlZCB0byBidWlsZCBmb3IsIGJ1
IEkgZG8gYXBwcmVjaWF0ZSBpdOKAmXMgYSBQT0MpLgoKSW4gY2FzZSB5b3XigJlyZSBub3QgYXdh
cmUsIE1ha2VmaWxlIGJhc2VkIHNpZ25pbmcgaXMgaW1wbGVtZW50ZWQgaW4KdGhlIGFtbG9naWMt
Ym9vdC1maXAgcmVwbyB0aGF0IEnigJltIGN1cnJlbnRseSB0b29sZWQgYXJvdW5kOgoKaHR0cHM6
Ly9naXRodWIuY29tL0xpYnJlRUxFQy9hbWxvZ2ljLWJvb3QtZmlwIAoKVGhpcyBpcyB0aGUg4oCc
Y29tcGV0aXRpb27igJ0gc28gdG8gc3BlYWsuIEl04oCZcyBxdWl0ZSBzaW1wbGUgYW5kIHdpZGVs
eQp1c2VkIGJ5IG1vc3Qgb2YgdGhlIEFtbG9naWMgc3VwcG9ydGluZyBkaXN0cm9zIHJpZ2h0IG5v
dy4KCkNocmlzdGlhbgoKPiA+Cj4gPiA+IEFkZCBhIGJpbm1hbiBkZXNjcmlwdGlvbiBhbmQgdXBk
YXRlIHRoZSBpbnN0cnVjdGlvbnMgYWNjb3JkaW5nbHkuCj4gPiA+Cj4gPiA+IENoYW5nZXMgaW4g
djI6Cj4gPiA+IC0gUmViYXNlIHRvIC1uZXh0Cj4gPiA+Cj4gPiA+IFNpbW9uIEdsYXNzICgxKToK
PiA+ID4gICBSRkM6IE1vdmUgT2Ryb2lkLUMyIHRvIHVzZSBiaW5tYW4gdG8gcHJvZHVjZSB0aGUg
aW1hZ2UKPiA+ID4KPiA+ID4gIGFyY2gvYXJtL2R0cy9tZXNvbi1zbTEtb2Ryb2lkLWM0LXUtYm9v
dC5kdHNpIHwgMTA3ICsrKysrKysrKysrKysrKysKPiA+ID4gIGFyY2gvYXJtL21hY2gtbWVzb24v
S2NvbmZpZyAgICAgICAgICAgICAgICAgIHwgICAxICsKPiA+ID4gIGRvYy9ib2FyZC9hbWxvZ2lj
L29kcm9pZC1jNC5yc3QgICAgICAgICAgICAgIHwgMTI3ICsrKysrLS0tLS0tLS0tLS0tLS0KPiA+
ID4gIHRvb2xzL2Jpbm1hbi9ldHlwZS9hbWxfZW5jcnlwdC5weSAgICAgICAgICAgIHwgMTI0ICsr
KysrKysrKysrKysrKysrKwo+ID4gPiAgdG9vbHMvYmlubWFuL2Z0ZXN0LnB5ICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDMgKwo+ID4gPiAgdG9vbHMvYmlubWFuL21pc3NpbmctYmxvYi1oZWxw
ICAgICAgICAgICAgICAgfCAgIDYgKwo+ID4gPiAgdG9vbHMvYmlubWFuL3Rlc3QvMjEzX2FtbF9l
bmNyeXB0LmR0cyAgICAgICAgfCAgMzggKysrKysrCj4gPiA+ICB0b29scy9iaW5tYW4vdGVzdC8y
MTRfbGlzdF9ub19kdGIuZHRzICAgICAgICB8ICAyMyArKysrCj4gPiA+ICA4IGZpbGVzIGNoYW5n
ZWQsIDMzNyBpbnNlcnRpb25zKCspLCA5MiBkZWxldGlvbnMoLSkKPiA+ID4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCB0b29scy9iaW5tYW4vZXR5cGUvYW1sX2VuY3J5cHQucHkKPiA+ID4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCB0b29scy9iaW5tYW4vdGVzdC8yMTNfYW1sX2VuY3J5cHQuZHRzCj4gPiA+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvYmlubWFuL3Rlc3QvMjE0X2xpc3Rfbm9fZHRiLmR0cwo+
ID4gPgo+IAo+IFJlZ2FyZHMsCj4gU0ltb24KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
