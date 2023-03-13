Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7E9C61DA4
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Mar 2023 21:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+nhy9KQR29empGUUpZz5zQW/QzCav+RD6sMk29A6AwA=; b=ntGLh7IoSpprtn
	iAlR7GilvPnGF6HpJmkXwUupTJeY2hdAOVh3Js8TXGL7n+uUqgGnDnHg1hjoVWQeG9SxqWPSJzBZv
	uJ1vJiwDvCRHLYtxz2JYjD+d8TxvvgaOt5P7FqSLgS5qRpekEx5r9f4FjS+CzwSFoUCdkUiOdu1hM
	ytvPS+cbzil3RJ+TiEWzGgLb96y5RsV73K6rs8r2TzbqOgghKG2sQhFQVc7EzORJya6jAdvJ/Kp0B
	0k4uVeIO/uncpt8yESZqIq5kcPGcIql4LV4R7tm5Xlfu2F/eF8kQg7rNGZfmWJQfp5emsGYwZs/Wt
	8alN/aoUh40dvdnwmWVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbps3-007xCG-Op; Mon, 13 Mar 2023 21:38:19 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbprv-007x99-6Y
	for linux-amlogic@lists.infradead.org; Mon, 13 Mar 2023 21:38:12 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5416698e889so146416027b3.2
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Mar 2023 14:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678743487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MoCrv9jwtexNbM0NP+aK8vItTXphA3RLnXqGbEpBLs=;
        b=xnGA9kGt5bQ4YrNXkJOympjlw68CgWtl3SW41AE7nxCMJYMdWvJlJmf8OsD521O0ru
         ks3n8qJ5fJU7jStpXl7Xt7p8PoiA3hD7dm2iwld4aCLU7waMKi1jmpzcAqDRO6rK45mJ
         k2U5SqPfZEe3fwFpNSunb/Xcm9kwiMdOFgJX59hKE0PhqsCRdTx+GpOAD76w0W5kYjjX
         KN/9EVX3+oPtJ/Ctq3V5iiE4LZtnHpj+gT646MZnCzR9sga8PcuQ5QI3vIQHVu7ViIXt
         plEPA66q1Ti5bnFwI5jOnabwlVkD3R64ywTde70O72GAFBPqPFkH77wd+SlTvqeu6no0
         ZOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678743488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MoCrv9jwtexNbM0NP+aK8vItTXphA3RLnXqGbEpBLs=;
        b=1kMQXpBHYWNJn758iPSYlYHTqm7gmlPQ92aCmbLyH0xfrmlE7oIurqHyQflM/GNdaq
         JLY81qItbhwutcTW9ENaPIRZxPJgz7rcqvWse6glf+rq5PXKICYF9Zl7mbR7hv2Cdqv4
         hlQVaSMUUGUOG5VOA5ZW0arUHunrgqO8as8pYkG21kFPScmkDTcBd2oPI+28T7yrZu8V
         ZKHV89P52bwIkimD7sjX0qnsjNVvXA+jdIBRVZXTT0HSEr/LluTVF1dCd8RDCu7DTEQS
         kjEOQvAjwdz9I/rgiukUD04HKR+aaEu9avVn5AQasZfkZptGSStlCvPv9hmh3ubBHaUk
         oujQ==
X-Gm-Message-State: AO0yUKWfXyPNbnleye8DSSv0Wb+ewwTNqc1BbVJux00P9KDdgTy6D9bv
	i0UKxbE24Nk/ikdyW1T8OTZhahz08ThlJy0EnTVAyA==
X-Google-Smtp-Source: AK7set8L1lXLBOk8wvAHM9wRqKPNXWlxKrtxI+qzt+FALwwKZEBkTpnXYO0qQldUzFZLmRJDWTgYnC/ZzTNl4HJfoug=
X-Received: by 2002:a81:ae04:0:b0:534:d71f:14e6 with SMTP id
 m4-20020a81ae04000000b00534d71f14e6mr5550337ywh.9.1678743487766; Mon, 13 Mar
 2023 14:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230313155138.20584-1-tzimmermann@suse.de>
In-Reply-To: <20230313155138.20584-1-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Mar 2023 22:37:56 +0100
Message-ID: <CACRpkdZngHNjW0=ZtnjvNV=rfR8tip_iqTE-FDWY+ggsU6DCmw@mail.gmail.com>
Subject: Re: [PATCH v2 00/25] drm/dma-helper: Add dedicated fbdev emulation
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, daniel@ffwll.ch, linux-aspeed@lists.ozlabs.org, 
	dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_143811_249371_6E810FC5 
X-CRM114-Status: UNSURE (   6.10  )
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

T24gTW9uLCBNYXIgMTMsIDIwMjMgYXQgNDo1MeKAr1BNIFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPiB3cm90ZToKCj4gVGVzdGVkIHdpdGggZmJjb24gYW5kIElHVCBvbiB2
YzQuCgpBbHNvIHRlc3RlZCBvbiB0aGUgVTg1MDAgTUNERSBvbiBTYW1zdW5nIEdULUk4MTkwIChH
b2xkZW4pCnN1Y2Nlc3NmdWxseS4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
