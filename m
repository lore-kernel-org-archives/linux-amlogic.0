Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51514C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Oct 2022 20:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4jnf+oZNUyBKhR/kXMv+T+k7grn4CgpSdUbnf2oDTKQ=; b=4oA760srooqUz5
	d5jeHsDqciAumhwEAApRM8b6BGUl51waZEbTOuYZ4BjJZvE9Ki58r+HPr9R8k59JiwwzpgQAqxrug
	vwDlYaFPwCms3GZLDr960KbM7hMCMju90ngdB2oiPcAsLp+jVFJ7xjD3+wuwrmoVwCpqnhWKSYtA0
	WOr/n+Je2Vm846uAdW8pvLjlJoN1UTEFzqhhUw6vcQ304vBN2A0peX4NfH452SGhdf3T+I02pi3B1
	Ev+U8ssa3Aowe5tRqIbYTmsmMo7GLfaY/aiLJ24gaKvVblZlO51mVRorkqxJGlXJbpTYa8M+mfTS1
	uUWBbWVNTmjHlxOqoVFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olFti-0055Qe-IA; Wed, 19 Oct 2022 20:42:42 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olFtX-0055NK-4i; Wed, 19 Oct 2022 20:42:32 +0000
Received: by mail-ej1-x62a.google.com with SMTP id bj12so42694156ejb.13;
        Wed, 19 Oct 2022 13:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcsg8Nj2+GgMON9OjeKFtbpRu0zVg200Uay12BT+4rw=;
        b=lTZUxcN55a/Z7QlxcVEnEaxA0jFoiZIRGBXk82beJ1FuxIdx3GLG/eIwiTyWykAMpE
         ndkE/z5OQjwIIMzit54N8gYVBL/gyPOOWkNVQosBvJbVH68p10uKxttAiUqreCJyrEQb
         DIVlXQABCF6qQqMzjueFzxihAFtULdLoylaKiZ9v2ZO3oVOzh+KM2qoBKfGWUiCv/wDk
         Ma4UXd6RwB8lBruHSrsImTyWlW7XRodF4GNXZbyHN9WSrXhRqEBmGMekdl3xXtfNb7BP
         kqJCvhxSBcYhpq2xlonz9JyGxchiegPZ8UxTkzOUiJncGMNXzk7V9genrUgF5y4b1+aW
         4mIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wcsg8Nj2+GgMON9OjeKFtbpRu0zVg200Uay12BT+4rw=;
        b=LicoJ9V4JzTmX86eKnvodYr4TAL52y9o6HdXT4dHfy5BXf3F0DK86jltJhn7F0mSic
         OcLkK/ZP4UDqccwu39M5xnUHt68N9xQn12TAWiaijEUoJ4x46kaf2ij0LS2Qr/rEbAVy
         KPf+rM/eTfJYTbnBfDCFq+vOdDd6fsTQcfSX+RDu2/u9uTvXk+3n2x55Af85BIFkZkal
         O2g/AlSVi+DigphnZrCMaQHxP3TWK5k0uzqYe6LEuscnJ/oCgAXu9HElj0LFtjJ/r0Kj
         ULZml4e0tc1PtMe9jQdGnHmdeUsddKuAQYZyAPxiRHGJ4y7+XT331gcwww1BflUvSe7A
         Yplw==
X-Gm-Message-State: ACrzQf01wF9jFgFnMGNhrRPvGtfDhCp1ZFXX0dICnozrBHcr2a3coqZB
	lVPienFm+2NxdAhmQ9dN7HVVgdPCVuE77r9Nh9xuEXUZ74A=
X-Google-Smtp-Source: AMsMyM7bX9T37uugRlFWo/3gcD4LAF6hSqosi43o4xXK+sd9ErmYdEO1bqm7GMdz18dg6QSVsHUnMr7qM1RAe4qnJMU=
X-Received: by 2002:a17:906:7314:b0:791:a45a:bc84 with SMTP id
 di20-20020a170906731400b00791a45abc84mr6202359ejc.394.1666212144504; Wed, 19
 Oct 2022 13:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221019091151.6692-1-ilpo.jarvinen@linux.intel.com> <20221019091151.6692-23-ilpo.jarvinen@linux.intel.com>
In-Reply-To: <20221019091151.6692-23-ilpo.jarvinen@linux.intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 19 Oct 2022 22:42:13 +0200
Message-ID: <CAFBinCC+jT65hOArEOm7BWbxraLrhhn5Dfeg7nK0rv3nUjA=WA@mail.gmail.com>
Subject: Re: [PATCH 22/44] serial: meson: Use uart_xmit_advance()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-serial@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_134231_243052_486584DD 
X-CRM114-Status: UNSURE (   7.11  )
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

T24gV2VkLCBPY3QgMTksIDIwMjIgYXQgMTE6MTMgQU0gSWxwbyBKw6RydmluZW4KPGlscG8uamFy
dmluZW5AbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IFRha2UgYWR2YW50YWdlIG9mIHRoZSBu
ZXcgdWFydF94bWl0X2FkdmFuY2UoKSBoZWxwZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBJbHBvIErD
pHJ2aW5lbiA8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+CkFja2VkLWJ5OiBNYXJ0aW4g
Qmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKVGhhdCBo
ZWxwZXIgaXMgYSB3ZWxjb21lIGltcHJvdmVtZW50IGluIG15IG9waW5pb24uIFRoYW5rcyBmb3Ig
d29ya2luZyBvbiB0aGlzIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
