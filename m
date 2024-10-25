Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCF6D0C5F9
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Oct 2024 09:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c6dcHAC98lA1NFi3sL6t/p5Wmyuyj0fsx+oUg46BCj4=; b=OXJRJFpx05h/O2
	ZgH+9Ez/3MIrWCb6FcjrrOc48OFs3ffFG+dCJ6gUnRAIdc79s9lv2DH6awiAhWjVpbso1EK1SnY59
	E91RCY8tVoAq7pSqswZ7uBHWD+UtxOmxoZKGUDNnOS/vuCE642xinrRrv5ukxB2YybzIlEVKEBB8T
	OEFeILx2jUFuEQ5Tr+mQYQWBi52NToRc0idZqscSqL7xvrGmmWTqm2IAnJIVTWbJQPuSOc1aeAsE4
	yfyNfPt4l8HvPFTCUEkUO1DaHYse4j0fh+odN2ax4Jvm7hgJ70UlCjV7sJK75//zP6eqoQGMDVr8K
	BKgcIFiik10phererPWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4H3M-00000003Gfd-1DI6;
	Fri, 25 Oct 2024 09:56:20 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4H1y-00000003GQj-0co9
	for linux-amlogic@lists.infradead.org;
	Fri, 25 Oct 2024 09:54:56 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-6db20e22c85so16228647b3.0
        for <linux-amlogic@lists.infradead.org>; Fri, 25 Oct 2024 02:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729850093; x=1730454893; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovzUCbOnf8ad3/AG/s6edyQx3Y96JvN5zzmYGNZvn88=;
        b=OhbVisnZk32nWGEZa6oOboKi3liszE3ZhvomKiLWltBTK/IqDm0vnFKFjHc6/qtjQq
         D30BHBTRfeEME6Bg6ahQEHAzvNYbqyfLIim67/tcrujqUuazEOwa3d0N9p2cslltQjqV
         79EIu5s7V1QbOFKlJar4iCEway0WKkpIpazCT8rOzU/HsLZ2dGs0vogyGbngvl4Jbo69
         UIg1e0d7CdTh5Uw2QhbhuYfaVfFMhHDPqKH8uQHCROGG1aJr3/YFGlqvatppiXPe4PJr
         pELxu8CfieO+1X4s91G0NmImIL518gmToDW9Hrn+iqQ4HW7hmEYJxXvqzIXNBNNj0NkA
         92NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729850093; x=1730454893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ovzUCbOnf8ad3/AG/s6edyQx3Y96JvN5zzmYGNZvn88=;
        b=NXfgNRihBEYHYHp5tvFQlsLkqMXgtnZoMPP6h4Why6zkNQEiFVnp/CfBZf1gAetFat
         2urQCeiVkOLF2grjBzQuXLAouVxEBHiAwSG7A8X+2+ukGcHp2b32saamSQ0AAFYCMTBP
         ZNzaLMDgUwDm2EDYdnBVmgon+/u6NB6r3idLQSS7Xl11AdaoFwoNww4j17TSUcpUSGj9
         jsergOtWDTXmfYsvxuj71Dk0zR7qTxqALDQRKtF93Y2bHjKh1SpMaX8cGdK2wWulRp6G
         quRRM/pfr7Ew3WBrwClqxogBYv2c2gh+CBFSCPI0LBhtYSbWTuoYPpMM8JQy5FIinBTS
         5S5w==
X-Forwarded-Encrypted: i=1; AJvYcCUBATMHbr8yf1Fr8/1US+x4Z4EwMVVn20nqAf7uwPdk2bK84FUg85pX/4OPtP1q+bIBT3xCv3XExOPWYbqN@lists.infradead.org
X-Gm-Message-State: AOJu0YxuIDJfD9pZxxbaJ43WEcu/blyRGXuYpTcxwZV5HbCk3fv6pPUx
	HUOVpFZIrtVMxeHBPt1qvvfZ1TIH3wpuhPcd0DSHPCkWf6BZv2abCrUi5JHFDmgSVoIUeO/mhWD
	/+nxlzaP8HDxAwS+Vq1HoNzff42rdT8xK1EI7kA==
X-Google-Smtp-Source: AGHT+IFZu/LyAjfpwX5MrN+JVkr0x0xSzSrKk0A5Mdi5tj38z9PJE4G47Yh4NVVkEqgziX0kL7VNUYJrsxipC6JS6p4=
X-Received: by 2002:a05:690c:fc7:b0:6e7:fb87:7094 with SMTP id
 00721157ae682-6e85814d77fmr57343097b3.6.1729850092872; Fri, 25 Oct 2024
 02:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20241002182200.15363-1-ville.syrjala@linux.intel.com> <ZxtMz8JP3DbzpMew@intel.com>
In-Reply-To: <ZxtMz8JP3DbzpMew@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 12:54:42 +0300
Message-ID: <CAA8EJprT=BGyMnvkjS4BkRqar1hHn_hpXFaz9gstPL_9u1rAsQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm: Treewide plane/crtc legacy state sweeping
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Alexey Brodkin <abrodkin@synopsys.com>, 
	amd-gfx@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Danilo Krummrich <dakr@redhat.com>, freedreno@lists.freedesktop.org, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Inki Dae <inki.dae@samsung.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
	Karol Herbst <kherbst@redhat.com>, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-msm@vger.kernel.orga, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Liviu Dudau <liviu.dudau@arm.com>, Lyude Paul <lyude@redhat.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, 
	Marijn Suijten <marijn.suijten@somainline.org>, nouveau@lists.freedesktop.org, 
	nouveau@lists.freedesktop.orga, 
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Rob Clark <robdclark@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Sandy Huang <hjc@rock-chips.com>, Sean Paul <sean@poorly.run>, 
	spice-devel@lists.freedesktop.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, Xinhui Pan <Xinhui.Pan@amd.com>, 
	Zack Rusin <zack.rusin@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_025454_282621_74550936 
X-CRM114-Status: GOOD (  21.86  )
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

T24gRnJpLCAyNSBPY3QgMjAyNCBhdCAxMDo0NiwgVmlsbGUgU3lyasOkbMOkCjx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIE9jdCAwMiwgMjAyNCBhdCAw
OToyMTo1OFBNICswMzAwLCBWaWxsZSBTeXJqYWxhIHdyb3RlOgo+ID4gRnJvbTogVmlsbGUgU3ly
asOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiA+Cj4gPiBBbiBhdHRlbXB0
IHRvIGhpZGUgdGhlIGRybV9wbGFuZS9jcnRjIGxlZ2FjeSBzdGF0ZSBiZXR0ZXIuCj4gPgo+ID4g
VGhpcyBhbHNvIGhpZ2hsaWdodHMgdGhlIGZhY3QgdGhhdCBhIGxvdCBvZiBzdXBwb3NlZGx5Cj4g
PiBhdG9taWMgZHJpdmVycyBhcmUgcG9raW5nIGFyb3VuZCBpbiB0aGUgbGVnYWN5IGNydGMgc3Rh
dGUsCj4gPiB3aGljaCBpcyByYXRoZXIgcXVlc3Rpb25hYmxlLiBGb3IgcGxhbmVzIHdlIGRpZCBm
b3JjZSB0aGUKPiA+IGxlZ2FjeSBzdGF0ZSB0byBOVUxMIGFscmVhZHkgdG8gZm9yY2UgZHJpdmVy
cyB0byBiZWhhdmUuCj4gPiBCdXQgZXZlbiB0aGVuIGl0IHNlZW1zIGNhcGFibGUgb2YgY29uZnVz
aW5nIHBlb3BsZSB3aXRoCj4gPiBpdHMgaGlnaCBwcm9maWxlIGxvY2F0aW9uIGRpcmVjdGx5IHVu
ZGVyIGRybV9wbGFuZS4KPiA+Cj4gPiBUaGlzIG1pZ2h0IGVuZCB1cCBhcyBzb21lIGtpbmQgb2Yg
Y29uZmxpY3QKPiA+IGdhbG9yZSwgYnV0IHRoZSBhbHRlcm5hdGl2ZSB3b3VsZCBpbnZvbHZlIHRy
eWluZwo+ID4gdG8gd2VhbiB0aGUgYXRvbWljIGRyaXZlcnMgb2ZmIG9uZSBieSBvbmUsCj4gPiB3
aGljaCB3b3VsZCBwcm9iYWJseSB0YWtlIGZvcmV2ZXIuIEF0IGxlYXN0IHdpdGgKPiA+IHRoaXMg
dGhlIGlzc3VlIGJlY29tZXMgdmlzaWJsZSBhbmQgc2hvdWxkbid0IGJlCj4gPiBmb3Jnb3R0ZW4g
YXMgZWFzaWx5Lgo+Cj4gUGluZywgYW55b25lIGhhdmUgdGhvdWdodHMgb24gdGhpcz8gSSdkIGxp
a2UgdG8gZ2V0IHNvbWV0aGluZwo+IGxpa2UgdGhpcyBpbiBhdCBzb21lIHBvaW50IHRvIG1ha2Ug
dGhlIGxlZ2FjeSBzdGF0ZSAoYWIpdXNlcnMKPiBlYXNpbHkgdmlzaWJsZS4uLgoKSSB0aGluayB0
aGF0J3MgYSBnb29kIGlkZWEuIEkgaG9wZSB0byBmaW5kIGEgdGltZSBzbG90IGFuZCBjaGVjayB0
aGUKKGFiKXVzaW5nIG9mIGxlZ2FjeSBzdGF0ZSBpbiBkcm0vbXNtIGRyaXZlci4KCj4KPiA+Cj4g
PiBUaGUgY2MgbGlzdCB3YXMgZ2V0dGluZyB3YXkgb3V0IG9mIGhhbmQsIHNvIEkgaGFkCj4gPiB0
byB0cmltIGl0IGEgYml0LiBIb3BlZnVsbHkgSSBkaWRuJ3QgY2hvcCBvZmYgdG9vCj4gPiBtYW55
IG5hbWVzLi4uCgoKCi0tIApXaXRoIGJlc3Qgd2lzaGVzCkRtaXRyeQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
