Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2CFC61DA4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 22:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZM9PsaLqgYX0EWCg7hTZG0x8bGLSsGCQpuAFqvq0zjA=; b=mQo+6b8RmEld0A
	3RghyBNtgovBxDimGujdsEmLaI+Nn1yQkPIHSoKxUW+kGpALQdOo8iKqbckdj9oPfiXETrhOtZqkh
	gYVvDoOpg8cx6r2XOZl6GRRF99w6fLQg6/c8h1wVmdHyCVVhbrvzikS2xjv3+WCb4TRtveithx8k3
	e4629FhSfZDzyWz8shBujQvKstFvBms6pdONr9HHsVIHS/TRc4s5GKqakb6nSTUDzen9Mcd4oBNBc
	cF7s5osmq+iUumyJKJKY4HPwYOLasgD1j3FXuTZ7a2Dsh0ZM4uKiY+cFVo1amomH37lGPObZUAGJ+
	9O1QcBK7PTDpX6vpZwCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZJBp-00FEnk-4m; Mon, 06 Mar 2023 22:20:17 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZJBk-00FEl0-9Z
	for linux-amlogic@lists.infradead.org; Mon, 06 Mar 2023 22:20:14 +0000
Received: by mail-yb1-xb36.google.com with SMTP id n18so9727944ybm.10
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Mar 2023 14:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678141211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pOqDJttcohXKj1RSFtrNisdNxjQPQ9b/aoMKjMVgTM=;
        b=WQLXFgm2cskHChBbeJjnWfHzLaVEexVQKOQ4rB9cRG3lQA3qPXuomhUFMa1bPJaV+O
         elX+AVtcktbnW0u6KZFFrMz/uVu6DNtCdgp7AOhijqFyjyBI6havk1pXij2OauQZ92qg
         TP7BYf+epbi5+Fb8EdRlsu8DoxuCo/2SVjKw2HJW8WDIUgzdaxomEvmi9CQMcj+Gtg/u
         AWdSzRJdlgO45NCMRtVrCRZOSi4bGROwqVtYX+0cJKot3gy/M2pkyUPeu9oLPYu3Bo7A
         haB/pNnDt3IxCUNKe7BAbGoTTF32+chnWsq932lhwVWXjK9AljFmPq2wHMNt9iZXwgl3
         6/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678141211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0pOqDJttcohXKj1RSFtrNisdNxjQPQ9b/aoMKjMVgTM=;
        b=rE4kVjiFsZQbHVXoEzKhyWvaOvLYL4axCJHP6+HCUkPlosbXzzESlhJbN9txg3EuLq
         tvm14TO1QcqSnFhls1XRpC9i6qUpcNvlPCXnahORG+3MOlrRrleGR6fp0IVsHScEr4Fv
         O7e83rRrDZp/Tt7o/acumZbUA7ypE+b2vbMruTKVxIi0mqkDnxg8P1/0Ekbl9y11ZuPv
         OqhzxIA5tUPisy64Pf2932DUb6+XJMOq+Woh0yc5XmpGtHclqSh325CPcBLzUkffaNDt
         pn3MrXNbFzO6UbwVrq306y5InKdsA6nkpunm6gL8Jl0yjNYLPexDk+4H5ZNpMCzhEq9M
         cCsA==
X-Gm-Message-State: AO0yUKXO8aKogC54e/IB0AmZBabXOyZUPJE3dUOcLPDcBxxyE81DmhCQ
	HY1fAeorrqj5oy0tWY0xyMWdFpSvKvuWKMqTr0mXLw==
X-Google-Smtp-Source: AK7set+xwxOTuAGUH2F4JBk51moW8y8vFCxjzdcMEe6q9xVEyLeKbxDfeAXuirvD55r2Rwjk4zMOQZkWM/2/groUae8=
X-Received: by 2002:a05:6902:4c2:b0:ab8:1ed9:cfd6 with SMTP id
 v2-20020a05690204c200b00ab81ed9cfd6mr7198831ybs.5.1678141211227; Mon, 06 Mar
 2023 14:20:11 -0800 (PST)
MIME-Version: 1.0
References: <20230301153101.4282-1-tzimmermann@suse.de>
In-Reply-To: <20230301153101.4282-1-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Mar 2023 23:19:59 +0100
Message-ID: <CACRpkdawSQsNqKJkSSoSw3HmMHyNXFUywxkdszpTC-a_uZA+tQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230306_142012_564948_607A02E6 
X-CRM114-Status: GOOD (  10.69  )
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

T24gV2VkLCBNYXIgMSwgMjAyMyBhdCA0OjMx4oCvUE0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgoKPiBBZGQgZmJkZXYgZW11bGF0aW9uIHRoYXQgaXMgb3B0
aW1pemVkIGZvciBETUEgaGVscGVycywgYXMgdXNlZCBieSBtb3N0Cj4gZHJpdmVycy4gSXQgb3Bl
cmF0ZXMgZGlyZWN0bHkgb24gR0VNIERNQSBidWZmZXJzIGluIHN5c3RlbSBtZW1vcnkuCj4gTWVt
b3J5IHBhZ2VzIGFyZSBtbWFwJ2VkIGRpcmVjdGx5IHRvIHVzZXJzcGFjZS4gTm8gaW1wbGljaXQg
c2hhZG93Cj4gYnVmZmVycyBuZWVkIHRvIGJlIGFsbG9jYXRlZDsgYXMgY2FuIGhhcHBlbiB3aXRo
IHRoZSBnZW5lcmljIGZiZGV2Cj4gZW11bGF0aW9uLiBDb252ZXJ0IGRyaXZlcnMgdGhhdCBmdWxm
aWwgdGhlIHJlcXVpcmVtZW50cy4KPgo+IFRlc3RlZCB3aXRoIGZiY29uIGFuZCBJR1Qgb24gdmM0
Lgo+Cj4gRnV0dXJlIGRpcmVjdGlvbjogcHJvdmlkaW5nIGEgZGVkaWNhdGVkIGZiZGV2IGVtdWxh
dGlvbiBmb3IgR0VNIERNQQo+IGhlbHBlcnMgd2lsbCBhbGxvdyB1cyB0byByZW1vdmUgdGhpcyBj
YXNlIGZyb20gdGhlIGdlbmVyaWMgZmJkZXYgY29kZS4KPiBUaGUgbGF0dGVyIGNhbiB0aGVuIGJl
IHNpbXBsaWZpZWQuCgoxKSBJIGxvdmUgeW91ciB3b3JrLgoKMikgV2h5IGlzbid0IHRoaXMgRFJN
IGRyaXZlciBjaGFuZ2VkPwpkcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2Rydi5jCkFGQUlDVCBp
dCBhbHNvIHVzZXMgR0VNIGJ1ZmZlcnMgaW4gc3lzdGVtIG1lbW9yeS4KCjMpIFRoaXMgb25lOgpk
cml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFfZHJ2LmMKaXMgYWxzbyB2ZXJ5IHNpbWlsYXIsIGJ1
dCBjYW4gc29tZXRpbWVzIHVzZSBhIGRlZGljYXRlZApSQU0gbWVtb3J5IGZvciBhbGxvY2F0aW9u
cyB1c2luZyBDTUEsIGRvZXMgdGhhdCBtYWtlCml0IG5vdCBhIGNhbmRpZGF0ZT8KClRoZXkgYXJl
bid0IG11Y2ggZGlmZmVyZW50IGluIGhvdyB0aGV5IHdvcmsgZnJvbSB0aGUgVFZFMjAwLgoKWW91
cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
