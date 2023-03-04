Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E2AC678DB
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Mar 2023 21:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BmYc3Zb2V1ufGW65Vpjn7A8k8QoqFHQbhc3COzWvijU=; b=LpI8k7pqXkS36i
	YFSDXaRcoCbtTNL4WKsPTRwuV+etIQ3jRCOAzjUwpOGDhRrbya5LpHPoLj0KPLRB4SXPnSqDXDY5E
	fOzIAsUndVMmTSU56/1PK3jwp8iuIOHBuw9/xTuabZUKNWyu4sG5Ue7DwbPERA5kqdASIix/Ckht2
	xOxv5WycVDX8UYIU/y5bvN7iIfZnNMnAHxFyb/1uzcw1mQxNV9nOBvlrSh//bJFxliMk+WpAwuo31
	awa5kx6fwjyvdQQHM7me1TDzuNm//fXSCUffAm6vECTjeQSUSLnsoKgFNDMmdHm7VbTk69SVWhWBu
	saB90hxnFVkrFUmbJIlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYZot-009aqh-0b; Sat, 04 Mar 2023 21:53:35 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYZoc-009ap2-Qu; Sat, 04 Mar 2023 21:53:20 +0000
Received: by mail-ed1-x52e.google.com with SMTP id g3so24012450eda.1;
        Sat, 04 Mar 2023 13:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glTmX378wFhL+15561BIoVBCccNOW4FDXoOgifMHBy8=;
        b=EjDJ1R8FKouJnuSxadiRe5SiBIgUSITPbM9SnQjhYDyIZ+LuEOc2GfJjRvdd1K10zP
         0B+VLs/N+kcVjphefjob7VPueiCtPcbheJAVql624mVmTFTwLvvcp1iZwDpKctQLPUHW
         891sEv52O94DJnZ6KiXRE4F/ROjfjMTPMKKI+OF6yfwNHXTh46djS1YKS+5RgOvxGYeH
         ZkMiXVI3btf5P7xmeL3czwdHnO3oxMI8+Piuk+XkuMFjbmF1+Tu4Euz0RahvlkxQA0+9
         WfciGbFo0TezFdbslWClljVVfxIS/uCJg+p/6L25hJAymiS1NrGxJW4JFm2298dmi6Zx
         AF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glTmX378wFhL+15561BIoVBCccNOW4FDXoOgifMHBy8=;
        b=P0aTls+tGkcl6E0YJk5U84Q5/IRSW41Ol8B7f+ObzTaKaPZe9Rrg3q/ttnPpwL83Oy
         +maVjIjsjKihtuml2UHakcbNd96lHTqWDAdJDm+/BChQ4Op7zoqJ0467He0Psk5RLQ6o
         noI6tg3xK2FqFTfazUMNis3sy0FXybYzlnt+FWSBDJ3YjAwEwVQzDIdcf8A5I9KyKXSt
         OYb1tIviI2NnZapAOGwrVl3bXo9S3DPGeI6fB8Lk5pjmkBcLKe/jKzalPQwMSN7gUrjI
         XJO9+2PjuTK6D3PwH9EcPrFJz6mQ7aNq6E9aFrgWF8bu/QqqXNDzj1AAfOC0m0fME0YH
         CMRA==
X-Gm-Message-State: AO0yUKUne5227TdjeX8R2HdBMw8MywZU/oKxrvtCwsgFL40VOvCmfa6r
	2lKhRLAZg4RvqOP/KIHRyg93Sg1C/5dc79yDoLI=
X-Google-Smtp-Source: AK7set+tmz2IUyxluM6H0uJ7rtHOVvVTQ1X6COH7sceQzb5b5yCqFKVzBbXboRNMEcYH9cGeInLEcv9muAb3OM5khBI=
X-Received: by 2002:a50:ce19:0:b0:4bc:2776:5b61 with SMTP id
 y25-20020a50ce19000000b004bc27765b61mr3356647edi.6.1677966793189; Sat, 04 Mar
 2023 13:53:13 -0800 (PST)
MIME-Version: 1.0
References: <20230301153101.4282-1-tzimmermann@suse.de> <20230301153101.4282-12-tzimmermann@suse.de>
In-Reply-To: <20230301153101.4282-12-tzimmermann@suse.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 4 Mar 2023 22:53:02 +0100
Message-ID: <CAFBinCCV4yu1HszSaCJuNVMhDC35hA8cpzLMw1x=a3x+LNYrEw@mail.gmail.com>
Subject: Re: [PATCH 11/22] drm/meson: Use GEM DMA fbdev emulation
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, daniel@ffwll.ch, andrew@aj.id.au, 
	laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-imx@nxp.com, p.zabel@pengutronix.de, anitha.chrisanthus@intel.com, 
	edmund.j.dea@intel.com, khilman@baylibre.com, jbrunet@baylibre.com, 
	alain.volmat@foss.st.com, yannick.fertre@foss.st.com, 
	raphael.gallais-pou@foss.st.com, philippe.cornu@foss.st.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	jernej.skrabec@gmail.com, samuel@sholland.org, jyri.sarha@iki.fi, 
	tomba@kernel.org, linus.walleij@linaro.org, hyun.kwon@xilinx.com, 
	laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230304_135318_911436_F5445776 
X-CRM114-Status: UNSURE (   6.64  )
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

T24gV2VkLCBNYXIgMSwgMjAyMyBhdCA0OjMx4oCvUE0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+Cj4gVXNlIHRoZSBmYmRldiBlbXVsYXRpb24gdGhhdCBp
cyBvcHRpbWl6ZWQgZm9yIERNQSBoZWxwZXJzLiBBdm9pZHMKPiBwb3NzaWJsZSBzaGFkb3cgYnVm
ZmVyaW5nIGFuZCBtYWtlcyB0aGUgY29kZSBzaW1wbGVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CkFja2VkLWJ5OiBNYXJ0aW4gQmx1
bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
