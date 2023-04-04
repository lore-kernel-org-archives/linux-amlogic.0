Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2236C76188
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Apr 2023 21:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A/6b/sSDtijtKSZ2NnSIsshMNwmY5JdL0DWkafDNcsg=; b=W6PaC6EhWaYIu7
	soF74LZBh5z+yWfT3YgOdP/wg0/mqWB1QT99oBiPF3h3U/BwPBfmvhzp/LIeOlPAWOPQ0F8uf2gVm
	422iCC2vVx3ltkyhgY87JBBHb2DqJsNgb3x6ZbtVW9/3xOECmdKS20ou54SGzEq7X9XAUdm02btYd
	GBGoi3LTm2cdhlhyVI07JHtKovxTXtYWP5w+QLne6O8EGozf36xWVsBCmqyGSSeksC2Fd4cLdqRDR
	JOK6o1uUnmCLFdmU0yf2uJ6NPI2sOWC/o2dOuMS9KGIMVyEFEl7lXhBewclNwRrWMLBjDwPaB1dHv
	/6HGAP9SvmRiHKastsKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjo4y-002tAG-0H;
	Tue, 04 Apr 2023 21:20:36 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjo4v-002t9V-0Y;
	Tue, 04 Apr 2023 21:20:34 +0000
Received: by mail-ed1-x534.google.com with SMTP id t10so135932706edd.12;
        Tue, 04 Apr 2023 14:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1680643230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5+FAUacxS+s9wS9+WZNPmawepdrV15aiNOEp44JCVM=;
        b=La2q1cdEt1u8ad1MBI9z/YWXhjb1ddmFhaPLuOFZUYuelVrfE8HIhxNPyvFClV0P7g
         svtJ9lEKx+c3VSuhd0Oz8p5I/gXLjPr7+DglxX6aD7V5k0vz++j4xeNMqMgquRg3AEv3
         4y4BFu26N3/RiY4pKwASDwLAlCj7SrYCR+5KaJHbmQQzEQUeT2zoiOUeE0TkZcOSvoLC
         Z38gr3u/CJgZr4/T46A4/jqp+5gxiDeMV+GgKpmdtndU+NCKQVBh1OgsPzu2NOAn8FYW
         Bej2iZ9mMb+l4XonfKUVNMU/JWDiqiU4JrOABkvWWYqw8U+GKBEdUHA0SZjHpeTvE4Kn
         ffXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680643230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q5+FAUacxS+s9wS9+WZNPmawepdrV15aiNOEp44JCVM=;
        b=525ggfBrInwR+6KEkPYFe5hd/ljRyUSY4rRU/Rqgbf3ujSswNnsxnGImYu4IXBOIyD
         H4qFKoDl8B8lQCGEQoBsgSc1DKruHVkRnGVeTzRfe/0W5n20aV7y3ddUneD92BAxGimd
         +jDBKvch8Pf8Lx2+LvQ484ceXK6cU3P1ddC5SkQeYHc3vPRbyPXnMT5vO7TpI2TQMujd
         tFU+3jR6heU5NBareGf7xw/HbAw0L+MIZdZaie7Vwg362xDuIxA7EL8l/pKvmMfrcojM
         LAzQ27rydr3El1CRecRWBkY2PBBomy1/pz0vSUl9PoaDqN2lCAIQ2uXQbPEiVm8z9cWM
         w6qA==
X-Gm-Message-State: AAQBX9dI6YHuwOmGFb33CEqKmnkG9erRS2umqgzq4yBs8pxQ4F5ULg5I
	9iAxzjKvmWdoo7Sbcz55YQSPM5e+08jwOFWCfUI=
X-Google-Smtp-Source: AKy350YQ8eox73r1Pc5Z61GA80cewysG9JVXMIiHYkLb+7yCzu/Auu3EHBU62rmW7kSappwZiTuB5zbuMVnl6rg80/s=
X-Received: by 2002:a17:907:c80b:b0:8f5:2e0e:6def with SMTP id
 ub11-20020a170907c80b00b008f52e0e6defmr565741ejc.0.1680643230540; Tue, 04 Apr
 2023 14:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch> <20230404201842.567344-3-daniel.vetter@ffwll.ch>
In-Reply-To: <20230404201842.567344-3-daniel.vetter@ffwll.ch>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 4 Apr 2023 23:20:19 +0200
Message-ID: <CAFBinCCQ+DRZ-T8rBO=fpP8s47X11iM4oZ5=LEjp_HqjAFSivg@mail.gmail.com>
Subject: Re: [PATCH 3/8] drm/aperture: Remove primary argument
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Deepak Rawat <drawat.floss@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Emma Anholt <emma@anholt.net>, Helge Deller <deller@gmx.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-hyperv@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-fbdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_142033_211895_D96A8678 
X-CRM114-Status: UNSURE (   9.99  )
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

T24gVHVlLCBBcHIgNCwgMjAyMyBhdCAxMDoxOOKAr1BNIERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAZmZ3bGwuY2g+IHdyb3RlOgo+Cj4gT25seSByZWFsbHkgcGNpIGRldmljZXMgaGF2ZSBh
IGJ1c2luZXNzIHNldHRpbmcgdGhpcyAtIGl0J3MgZm9yCj4gZmlndXJpbmcgb3V0IHdoZXRoZXIg
dGhlIGxlZ2FjeSB2Z2Egc3R1ZmYgc2hvdWxkIGJlIG51a2VkIHRvby4gQW5kCj4gd2l0aCB0aGUg
cHJlY2VlZGluZyB0d28gcGF0Y2hlcyB0aG9zZSBhcmUgYWxsIHVzaW5nIHRoZSBwY2kgdmVyc2lv
biBvZgpJIHRoaW5rIGl0J3Mgc3BlbGxlZCAicHJlY2VkaW5nIgoKWy4uLl0KPiAgZHJpdmVycy9n
cHUvZHJtL21lc29uL21lc29uX2Rydi5jICAgICAgICAgICB8ICAyICstCmZvciB0aGUgbWVzb24g
ZHJpdmVyOgpBY2tlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5n
bEBnb29nbGVtYWlsLmNvbT4KCgpUaGFuayB5b3UgYW5kIGJlc3QgcmVnYXJkcywKTWFydGluCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
