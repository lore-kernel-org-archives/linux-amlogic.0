Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236BDC77B60
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Apr 2023 21:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1kc/otjGipn/tS40HjVRsaIldggJ4I8wWyEkutRcTdM=; b=YWCcRX+MqqCvjd
	jWJuZXz8S2qtQNUJafo5VasV8kBvsaEQWl4mFD0zdcpNgFBsLymuJV+tqazYpPGyQFcfGuYM6SMw0
	Aw66w5RZrBvbJEuIVPG0o3lAC4ZDjbFYVmgmpa+1nK69x1ucan2QZ4o+V0oEKwbJMwj2ZtXwn+xWT
	F0qmeAZPYZ4xaG9Qrdhv8znWykqD3rpkn9o9MomCpmGmKIBYhaXSOpKhvfMj16Rel8ZqEuNlvsWW5
	lBivFYA2qBVKEvtr7qTJ3l83/5oFPdCZtyR4aCEPtmcm4O1mV6/BSBeHZeGPYfOv5taxcWgXyRnKG
	jAkMB0jnytDSae6nc/4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqhOH-00Emlu-1p;
	Sun, 23 Apr 2023 21:37:01 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqhOF-00EmlP-0w;
	Sun, 23 Apr 2023 21:37:00 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-94f1d0d2e03so511833066b.0;
        Sun, 23 Apr 2023 14:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1682285817; x=1684877817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+3ip4SFD8EZ4AogSeaajIrcWIDGjTnupCvB0Wex6sU=;
        b=BiFu6VDoYcTeU8wvs0mVHTjYbn12mqsHHm0FHm/LqRVi62qlw+bF6qVmX44l0LAtiL
         knNGqM1HGnzS24x0qHFzgmYGukcFYpJj4CnoSJYkY2tp4qyCIYuFb0CpsBL2/t+feJ1Q
         BeClrpyYt2MQ8BLLoxS8pjvFhnkBxpGOsOM/bP9Y1L5XDOlsEH/j1S0JlgMgFft+cg6O
         GIOFnyblmF2stvfBm2Bhmr5qjJRm4VL62pmbsJdsHi/vDbzkG9cX1OpG/VdQz5PneGRy
         zI9i4Ne3tweszm5HIi7mLfHGvCDIdq0spz9FnRLq5YiAwUb/rLjkCb+tXHQdHhK2682B
         TpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682285817; x=1684877817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+3ip4SFD8EZ4AogSeaajIrcWIDGjTnupCvB0Wex6sU=;
        b=FtBHVaVQVRup3ydIDsDXR9/UveN/nU9co7GohsgLc9MTcA676SFaxYj/ZZ5kpRTvmg
         7euDNHCfM1avqS8bJt9g0q4gHtA8EjX5gfJBnSkuPGOkhLHZ4Exzz/8M9asCLvipvoi4
         zD45deoHQ5qhztct2nUQ+QxPSSVAOGjk6930cu1Q2M6hRkcGjiAY69bUZhxFEn9v9zLf
         SnS+vJphewgDVjMm6adBFymP/OKuHyjl/6x7kX4GPgGZwnnswSepNwvnP3IzAM8hQsJ4
         Co2PirnWfrfBpY81YTOMUolNBPrjZqIkwrtHvmVD+EeKh/lvjGpalIrQGtbkX3sCTRQt
         mopg==
X-Gm-Message-State: AAQBX9dvTpD5wus7rdtd3SXK7oz3q8LkbbK0g+QImQFZNUziQ3ZHQvgd
	bgwR/8ltJ4qHYMFLiZP/xsBEGGd0hAm8YbxKdIA=
X-Google-Smtp-Source: AKy350YEV07e4rhC2sKUikbC3KSbrZ0KxnyPPhrSLqzhZHnP47SzVPucdMXG0LWYPJZq5gUmWL1XdW9YM7KyAkHFSBk=
X-Received: by 2002:a17:906:9b85:b0:94e:fe77:3f47 with SMTP id
 dd5-20020a1709069b8500b0094efe773f47mr9464495ejc.67.1682285816723; Sun, 23
 Apr 2023 14:36:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230423145300.3937831-1-trix@redhat.com>
In-Reply-To: <20230423145300.3937831-1-trix@redhat.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 23 Apr 2023 23:36:46 +0200
Message-ID: <CAFBinCDQRwaTNLeHD973gD-g9aHOwnu+G+U2di7Tz17LPT2DXg@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: set variables meson_hdmi_* storage-class-specifier
 to static
To: Tom Rix <trix@redhat.com>
Cc: neil.armstrong@linaro.org, airlied@gmail.com, daniel@ffwll.ch, 
	khilman@baylibre.com, jbrunet@baylibre.com, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_143659_328009_25FEAD8F 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
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

T24gU3VuLCBBcHIgMjMsIDIwMjMgYXQgNDo1M+KAr1BNIFRvbSBSaXggPHRyaXhAcmVkaGF0LmNv
bT4gd3JvdGU6Cj4KPiBzbWF0Y2ggaGFzIHNldmVyYWwgc2ltYWlsYXIgd2FybmluZ3MgdG8Kcy9z
aW1haWxhci9zaW1pbGFyLwoKPiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuYy5jOjE4
OToyODogd2FybmluZzogc3ltYm9sCj4gICAnbWVzb25faGRtaV9lbmNpX21vZGVfNDgwaScgd2Fz
IG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KPgo+IFRoZXNlIHZhcmlhYmxlcyBh
cmUgb25seSB1c2VkIGluIHRoZWlyIGRlZmluaW5nIGZpbGUgc28gc2hvdWxkIGJlIHN0YXRpYwo+
Cj4gU2lnbmVkLW9mZi1ieTogVG9tIFJpeCA8dHJpeEByZWRoYXQuY29tPgpXaXRoIGFib3ZlIHR5
cG8gZml4ZWQgKG9yIHdpdGggYSBjb21tZW50IGZyb20gdGhlIG1haW50YWluZXJzIHRoYXQKdGhl
eSBjYW4gZml4IGl0IHdoaWxlIGFwcGx5aW5nKToKQWNrZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGlu
Z2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
