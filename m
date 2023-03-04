Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744E3C678D5
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Mar 2023 21:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aLmcNeFRohWEDG72ijJGjDLioTRUWJhUUY7wKBBMQ1E=; b=df+S3WI3+VcJ+C
	0Z4nLW5kJUTrLmELcQk+A7c3/K90u4BLj8rL+IG1tujLBtB0PuAGxaDtw34ZdZoPgKkJcM9dLhnps
	FrQhydOgoGMKamhVLX3UCc9T2+7bO82Wi/FDK3jty91FEm68bk9yeoOUYy81dNdEDz35Kkwh8Y9wk
	Iq8Kpq17XST8OvZJfqIGIFcSJu0uMYV7pFTkhF7HTd2QIQC+3oPMTpGLYj5q5GtuwX4wrZalgbNg0
	1JN5EW72udhEj93/x5mTwuJv1SNaP4J8e4mI+EBdEkctzIOdgU/nJ5jIbe8t769OAiFLF6FnAh2uN
	3eLQh0MgpwbnSkIHDCHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYZgj-009ZcP-8S; Sat, 04 Mar 2023 21:45:09 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYZgg-009ZbZ-G1; Sat, 04 Mar 2023 21:45:07 +0000
Received: by mail-ed1-x535.google.com with SMTP id o12so23818168edb.9;
        Sat, 04 Mar 2023 13:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKDIxvFH4F3D/Bp8+BmLpjtlutHoc8KA5An4csidBcU=;
        b=jzS3yeCClEU5ic+r6pgQ/vQwrY4Lj324IPOIkZYoWfvdmucb1ln4sYfsza2nWDWTNL
         4mtcMhMyNlIRWv24QYhcwEtOU12QAYKj9EURBj5bcbmpQoF5570sCwvVOR+IWU30DjI/
         7AB3YMigQcTKQX2rwSYrtfKZwOPcSK7sXlBMzB89QkV5CPJhzpYwTu0LTWwr1CPk5bfT
         5fkm41zDUcAzcqfeaR4Sq3b9aKdO1oRkZ3f6dXusQwZ70heMW1IzC3n+O7Kpew8BPliH
         4AQkZ6ptMn5c7dafr/RgoabPd0AAMGkJUl0j6IH8PTgxEdPCpRvcIzAKTKg/4oLKEwWd
         WXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WKDIxvFH4F3D/Bp8+BmLpjtlutHoc8KA5An4csidBcU=;
        b=Fo1XweVVJJXuFMIa+s7RQvgN8ZbgAUy6fbDzabkJDSOkJS64cQuJyX/6jv1o/1lqKx
         2dN24EP2vOi9IEWUxmoOI481tOvv47qHOEeQ5ouSogTvsetXiew4Wv662EiI12KH555u
         hOeQ+Qn9hGSGzLu925HgVHEriWMyfXb+sCTI11zh60/HWpXm+zG490IOewpKVFp/r0zV
         43hnww3h+rP4wgRFXIocaCZe1GV9Aif7PvuXOK/KlQ6tlndcLk2WVWzurHzW/0itatoK
         1Qr53CDFL3lYAnxGixLFGKGRUSmbwl2xqdkX1zHcWnR1VnnckeOaC7u03TJQqgQ22Nxp
         q2rw==
X-Gm-Message-State: AO0yUKUVaOJflWtH3WIvHirdxTsIQ3NSjOvnVGZSQ360Ezo7ggy8RtYN
	5H8MaVRRFP/vn4PuDvM2phEPyxi+V0ij/YwWovI=
X-Google-Smtp-Source: AK7set9wY0tIW78yGxDw99q432fpv27SQCH8++tgi5/mw5cQNNLf7m3KivFDf11whC1GeXIRw82onTzmkovP2vSJ4lI=
X-Received: by 2002:a17:906:f18f:b0:8af:2ad8:3453 with SMTP id
 gs15-20020a170906f18f00b008af2ad83453mr5871550ejb.6.1677966304797; Sat, 04
 Mar 2023 13:45:04 -0800 (PST)
MIME-Version: 1.0
References: <20230303123312.155164-1-christianshewitt@gmail.com>
In-Reply-To: <20230303123312.155164-1-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 4 Mar 2023 22:44:53 +0100
Message-ID: <CAFBinCDwGW-NaMx63t2v=Rt298MY1W13A1b1BDwHN72q7ifbZQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/meson: fix 1px pink line on GXM when scaling video overlay
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230304_134506_556951_CBA4BD26 
X-CRM114-Status: GOOD (  13.55  )
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

T24gRnJpLCBNYXIgMywgMjAyMyBhdCAxOjMz4oCvUE0gQ2hyaXN0aWFuIEhld2l0dAo8Y2hyaXN0
aWFuc2hld2l0dEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gUGxheWluZyBtZWRpYSB3aXRoIGEgcmVz
b2x1dGlvbiBzbWFsbGVyIHRoYW4gdGhlIGNydGMgc2l6ZSByZXF1aXJlcyB0aGUKPiB2aWRlbyBv
dmVybGF5IHRvIGJlIHNjYWxlZCBmb3Igb3V0cHV0IGFuZCBHWE0gYm9hcmRzIGRpc3BsYXkgYSAx
cHggcGluawo+IGxpbmUgb24gdGhlIGJvdHRvbSBvZiB0aGUgc2NhbGVkIG92ZXJsYXkuIENvbXBh
cmluZyB3aXRoIHRoZSBkb3duc3RyZWFtCj4gdmVuZG9yIGRyaXZlciByZXZlYWxlZCBWUFBfRFVN
TVlfREFUQSBub3QgYmVpbmcgc2V0IFswXS4KPgo+IFNldHRpbmcgVlBQX0RVTU1ZX0RBVEEgcHJl
dmVudHMgdGhlIDFweCBwaW5rIGxpbmUgZnJvbSBiZWluZyBzZWVuLgo+Cj4gWzBdIGh0dHBzOi8v
Z2l0aHViLmNvbS9lbmRsZXNzbS9saW51eC1zOTA1eC9ibG9iL21hc3Rlci9kcml2ZXJzL2FtbG9n
aWMvYW1wb3J0cy92aWRlby5jI0w3ODY5Cj4KPiBGaXhlczogYmJiZTc3NWVjNWI1ICgiZHJtOiBB
ZGQgc3VwcG9ydCBmb3IgQW1sb2dpYyBNZXNvbiBHcmFwaGljIENvbnRyb2xsZXIiKQo+IFN1Z2dl
c3RlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVt
YWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gSGV3aXR0IDxjaHJpc3RpYW5zaGV3
aXR0QGdtYWlsLmNvbT4KQWNrZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVt
ZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+Cgo+IC0tLQo+IENoYW5nZSBzaW5jZSB2MToKPiBUaGlz
IHRpbWUgSSBzZW50IHRoZSByaWdodCBwYXRjaCBmcm9tIHRoZSBjb3JyZWN0IGJyYW5jaDsgdGhl
IHdvcmRpbmcgaW4KPiB2MSBpcyBpbmNvcnJlY3QgYW5kIHRoZSBjaGFuZ2UgdG8gbWVzb25fcmVn
aXN0ZXJzLmggaXMgbm90IHJlcXVpcmVkLgpUaGFua3MgQ2hyaXN0aWFuIC0gSSB3YXMgYWJvdXQg
dG8gYXNrIHdoZXRoZXIgeW91IGNvdWxkIGlzb2xhdGUgd2hpY2gKcGFydCBvZiB0aGUgb3JpZ2lu
YWwgcGF0Y2ggZml4ZXMgdGhlIGlzc3VlLCBidXQgeW91J3ZlIGJlZW4gcXVpY2tlcgo6LSkKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
