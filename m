Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77E7C64EC4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 08:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CrKsamST3j3URIpXQqVoQMEkJcy4K3SAaem30fwBHDw=; b=GEfB8M04Djlq3E
	fXEyRSuG6pm2RQalHpBqt9SkXrVUmKOkfGnFvzbluvCuvsF7MY84aPpbtINnsy9+p31R01Fw5DrKB
	RkV6TzOquK8RamUFdQEJtLTO/nT2eS9Vt4LrSXzi2VJ8vjlFU9vjsxYCVoW95dP7qkn4yLXPXftmX
	6VVLDW+hygsW+vUinxL3u2uWpd4lsNrQ0BKtvcz85S51dgswa6TSU7OxP46ISBVVCCi/A9IgwhkQL
	LoTpO4AaCWoR1KybbmZvQP+LaIKTMyczzvpVG876YyH7/N3rVenObyX8rw2Fnd/J1bxu7hLbUc/TY
	9/2tzDGNdQHwjfO67p8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paBSv-008TB3-DK; Thu, 09 Mar 2023 08:17:33 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paBSs-008T9h-4b
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 08:17:31 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-536c02eea4dso21225657b3.4
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 00:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678349848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2l5Id5YkQHVcDPnMRyRmnfI/ab4qev+27T/LcA5p4xY=;
        b=zHNKNBYRp8ZMtYES6iOOJZdPs+/VrS4r4YOJIdMcn27ttfxXw+5AQLOM553VKzbfnu
         vLHmIOaLbVGba0VsvH1A00WV2qAWWgRg6OCdzr0CGE6bztDfQMn/g9Y5OsP9YhvR9IvQ
         MBPkKaiastTwTZvY+KgDfsVknQjxIsmsmH17UUOwZlFCPeT099gAT1AvqRLyWYGb78VF
         buB27vSGCDqka04+hzRqEy0gBl5mSK5NjjfTzm/G9U23TwZT1xq5DqboEq5enhwfaKIC
         YzzD9CYsGf0djIqiap2rDOQQywTt+nLUZAXM8IkxeeJ6AXIvCT0l3gLpZjJP6pzCZ/ff
         Vvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678349848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2l5Id5YkQHVcDPnMRyRmnfI/ab4qev+27T/LcA5p4xY=;
        b=vwi97gATipzqWO2WLsmNJwDetSKqy+xHc66aUOwBPwYsGvW0HgISP5ibap2d6JOYG/
         c6J9Ax68rogIylixkvotG69ijdbwt2z1SIy2Ud54EeAkUFUm44QMrR9t5HX35Vd+JB8K
         E+h3Ha+NMQpora+tzbY65uPaXnnLN8Xt6pj1E6SYYimKQ9G42wWLXNme0iUldgdOEKsi
         rDV21bFUxhYihjPCiKSv6Ab31s9/aXnZ4fvfLRFsCmbLQPRP8nnzW1b1JDvjEbp7ecgY
         X1wufinGuy+XwqjMq0iqkHnjO8UVf040FZnTJ+tcBb2jDIuQTHMx0wC17MXct8pJsV5c
         3FvA==
X-Gm-Message-State: AO0yUKW+7zCwU4gtSR7ADSSWffWl1sljX39ua935JQNbZbeAh+H5Fo95
	iKPgz8VONIpylGbBZerNfXcIOFlmNYeVGEi6OLbn3w==
X-Google-Smtp-Source: AK7set9NqrT7RUuXgHnInuqDO8U0SE1ojud6SJk/FpmB3GQVriAzuG0269C9t+4xeg2JU5VBcDK6EbBkG9E/pM7QunM=
X-Received: by 2002:a81:4312:0:b0:52e:b718:24d5 with SMTP id
 q18-20020a814312000000b0052eb71824d5mr13477522ywa.9.1678349847927; Thu, 09
 Mar 2023 00:17:27 -0800 (PST)
MIME-Version: 1.0
References: <20230301153101.4282-1-tzimmermann@suse.de> <CACRpkdawSQsNqKJkSSoSw3HmMHyNXFUywxkdszpTC-a_uZA+tQ@mail.gmail.com>
 <0e789778-03ca-e3cb-9c94-e8b55573894c@suse.de>
In-Reply-To: <0e789778-03ca-e3cb-9c94-e8b55573894c@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 9 Mar 2023 09:17:16 +0100
Message-ID: <CACRpkdYUVBq_-iZxtoe65eh3ruUOprF_JEG-sZfUSNVhjacVLA@mail.gmail.com>
Subject: Re: [PATCH 00/22] drm/dma-helper: Add dedicated fbdev emulation
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, daniel@ffwll.ch, andrew@aj.id.au, 
	laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-imx@nxp.com, p.zabel@pengutronix.de, anitha.chrisanthus@intel.com, 
	edmund.j.dea@intel.com, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, alain.volmat@foss.st.com, 
	yannick.fertre@foss.st.com, raphael.gallais-pou@foss.st.com, 
	philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, jernej.skrabec@gmail.com, samuel@sholland.org, 
	jyri.sarha@iki.fi, tomba@kernel.org, hyun.kwon@xilinx.com, 
	laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_001730_203038_6119636E 
X-CRM114-Status: GOOD (  14.58  )
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

T24gVHVlLCBNYXIgNywgMjAyMyBhdCA5OjU14oCvQU0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+IEFtIDA2LjAzLjIzIHVtIDIzOjE5IHNjaHJpZWIgTGlu
dXMgV2FsbGVpajoKCj4gPiAyKSBXaHkgaXNuJ3QgdGhpcyBEUk0gZHJpdmVyIGNoYW5nZWQ/Cj4g
PiBkcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2Rydi5jCj4gPiBBRkFJQ1QgaXQgYWxzbyB1c2Vz
IEdFTSBidWZmZXJzIGluIHN5c3RlbSBtZW1vcnkuCj4KPiBUaGlzIGRyaXZlciByZXF1aXJlcyBk
YW1hZ2UgaGFuZGxpbmcKPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4yL3Nv
dXJjZS9kcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2Rydi5jI0w5Nwo+Cj4gZm9yIHdoaWNoIHdl
IGhhdmUgdG8gY2FsbCB0aGUgZnJhbWVidWZmZXIncyBkaXJ0eSBjYWxsYmFjawoKT2ggdGhhdCBv
bmUgaXMgb24gbWUgLi4uIEkgbm8gbG9uZ2VyIHJlbWVtYmVyIGV4YWN0bHkgd2h5IEkgdXNlZApk
cm1fZ2VtX2ZiX2NyZWF0ZV93aXRoX2RpcnR5KCkgYnV0IEkgdGhpbmsgaXQgd2FzIGJlY2F1c2Ug
SSBoYWQgdGhlCmFtYml0aW9uIHRoYXQgdGhlIGRyaXZlciB3b3VsZCBvbmx5IHNlbmQgb3V0IHVw
ZGF0ZXMgdG8gRFNJIGNvbW1hbmQKZGlzcGxheXMgd2hlbmV2ZXIgc29tZXRoaW5nIGNoYW5nZWQs
IHNvIGFzIHRvIG1pbmltaXplIHRyYWZmaWMuCgpJdCB0dXJucyBvdXQgdGhpcyBhbWJpdGlvbiB3
aXRoIGNvbW1hbmQgbW9kZSBpc24ndCB3b3JraW5nIGluCnByYWN0aWNlIGJlY2F1c2UgYWxsIHRo
ZSBNQ0RFIGRvZXMgaXMgdG8gY3JlYXRlIGEgY29udGludW91cyBzdHJlYW0Kb2YgRFNJIGNvbW1h
bmRzIGFuZCB3aGlsZSBpdCBpcyBwb3NzaWJsZSB0byBzZW5kIHNpbmdsZSBmcmFtZQp1cGRhdGVz
IHdpdGggaXQsIGl0J3Mgbm90IHdvcmtpbmcgaW4gcHJhY3RpY2UuIFNvIHdlIGFyZSBqdXN0IHNl
dHRpbmcKdXAgY29udGludW91cyB1cGRhdGVzLiBXZSB0dXJuIG9mIHRoZSBWQkxBTksgSVJRcyBh
IGJpdCwgYnV0IEkKZ3Vlc3MgdGhlIERSTSBmcmFtZXdvcmsgZG9lcyB0aGF0IGZvciB1cyB3aGVu
IG5vdGhpbmcgZ29lcyBvbi4KCkkgdGVzdGVkIHRvIHJlcGxhY2UgdGhpcyB3aXRoIGRybV9nZW1f
ZmJfY3JlYXRlIGFuZCBpdCB3b3JrcyBqdXN0CmZpbmUuIEknbGwgc2VuZCBvdXQgYSBwYXRjaCBz
byB5b3UgY2FuIG1ha2UgdGhpcyBjaGFuZ2UgYWxzbyB0byB0aGUKTUNERSBkcml2ZXIuCgpZb3Vy
cywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
