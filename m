Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECF0C61DA4
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Mar 2023 21:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/vnZ7rIY8eUUL9xhSu8S2O6V0gRHEDSeaieXvdKi6+A=; b=etVFfmQuuc704X
	k0G9jr5eMBKUYSY1hLxY8M4AJK+O5HSLF/pUi4Pjen4kAXvVYW875R5dCuZ8FsNuXt3aGdj27tv02
	UU5cJYfOtggHaTDhAF0VxkCB4VtxJssEUVkUo2KMAfS/ZWKBLa2A0717eL+t5jjdWq0LhtrE6J4D/
	FgcvsjqlnJLiOQ5YR/8RO86EkhAC6Iarx33LctDhN8qAwvAzK6XCwkKRNWdsAixS2urKKKAs1aBES
	B6GMtpR7usghoE1vmFwpW/4Tg5f/FyaiRr7Fr6P49CzwVhdK5YoD5X8Ta1lQcWVI9tP+yxQENHjuz
	Bp+Vv+6rPr1gfBvNBJ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpuB-007y4x-5P; Mon, 13 Mar 2023 21:40:31 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpu5-007y1z-7F
	for linux-amlogic@lists.infradead.org; Mon, 13 Mar 2023 21:40:26 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-541a05e4124so80121677b3.1
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Mar 2023 14:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678743619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecgxfHAz/UBXIjhNVQyUFhEfo+f44kweGIvOpc2a+8o=;
        b=K2pXxPF4Q5NEb4aJh/ZtgOcay4z11aGdPJNGxoAyPpo5KHia65JmMJB5d/8Zuyw+mk
         tdCZvErxJ2+Ov6F3uwE0QJROGtFxcgLs87rRt5F0kxCCgObLtL179NI1TBOK9gGgGNJF
         Eh1qJPWmBakRFt6FaPcxyZurn1mCFc0uppN0BduNDbYkQ+cupOSDrFYHqqBB3+fKZKrd
         MbQHQFxJIAhFilhE19dQAn6Hs0OfHLcEq+ul1IX3tDPWqnP0oSGLzgbn7d3SK+ZP02oo
         r6ydpI+oGA5J1HikH4j8Apu5N/h8d3h2Vnb/H9bp2xjP5xBYwfX+xhPNTLVqo8zyv8em
         5+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678743619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ecgxfHAz/UBXIjhNVQyUFhEfo+f44kweGIvOpc2a+8o=;
        b=k/FwxbGgWPa0C3VqIFdln1hKbX7x/A6pebOI/wtUyJb7BJo4y/0ZZtROyvymTi9fck
         B+alI9HbdO2pD3v0A+EvCAzfwHfYMN1OiFFm+1mmzymJubaeyP3IE2G1VG8e4Gjyni4F
         nTkRiBdfduZetDY9uvlcwt4Bfhx5iFVfQcAlMFb+fR/xDZcCaOTkJzTgqAJ7t7TG2l59
         s78Scx9GsXR2QmGG57MtVGKVqFAqr0E2drz6LimqnRMxKpVEHq61/LhKOT7OriPScc1A
         JG4Ls/OGgTFiUvb9hyTcSlyB0IZuDCB4RohPXTTvOUXab0XiONsxTZYmELOLhWjztBSY
         ITaA==
X-Gm-Message-State: AO0yUKU6pJVHwDAqIqq13/f2wpb+WTsYtyMJh0DaqMf8PSkXF0sKwg2Z
	6sEpuI5ie/Rh+kiywKgdbgb0LJSIJJlX6M5VaJ/ekR5JRK1XSkx6
X-Google-Smtp-Source: AK7set8MXe6q7JAQYwdFRB8ZhsrrhbkSYB8JcvLg20wPqKZq56TZe41RwUBKjK5hxxwd+ByFitU1csO05sXE3FhMJro=
X-Received: by 2002:a81:af1f:0:b0:536:4ad1:f71 with SMTP id
 n31-20020a81af1f000000b005364ad10f71mr22810681ywh.9.1678743619469; Mon, 13
 Mar 2023 14:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230313155138.20584-1-tzimmermann@suse.de> <20230313155138.20584-25-tzimmermann@suse.de>
In-Reply-To: <20230313155138.20584-25-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Mar 2023 22:40:07 +0100
Message-ID: <CACRpkdZLFuGdSqnDYXnoWEjnVmumT23Rz4Y9QT9-9=Uoj5PUpQ@mail.gmail.com>
Subject: Re: [PATCH v2 24/25] drm/mcde: Use GEM DMA fbdev emulation
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, daniel@ffwll.ch, linux-aspeed@lists.ozlabs.org, 
	dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_144025_271857_9498BE76 
X-CRM114-Status: UNSURE (   6.87  )
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
bWVybWFubkBzdXNlLmRlPiB3cm90ZToKCj4gVXNlIHRoZSBmYmRldiBlbXVsYXRpb24gdGhhdCBp
cyBvcHRpbWl6ZWQgZm9yIERNQSBoZWxwZXJzLiBBdm9pZHMKPiBwb3NzaWJsZSBzaGFkb3cgYnVm
ZmVyaW5nIGFuZCBtYWtlcyB0aGUgY29kZSBzaW1wbGVyLgo+Cj4gUmVwb3J0ZWQtYnk6IExpbnVz
IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiBMaW5rOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9kcmktZGV2ZWwvQ0FDUnBrZGF3U1FzTnFLSmtTU29TdzNIbU1IeU5YRlV5d3hr
ZHN6cFRDLWFfdVpBK3RRQG1haWwuZ21haWwuY29tLwo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxl
aWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KVGVzdGVkLWJ5OiBMaW51cyBXYWxsZWlqIDxs
aW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
