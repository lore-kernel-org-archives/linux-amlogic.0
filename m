Return-Path: <SRS0=pdBZ=4R=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA734C3F2CD
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 16:40:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB91620828
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 16:40:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Le9dAJPV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="AYwe7pcI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB91620828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2Y4guCH7t0obHsghcyQwnv52k6OKiRrc4ZzSHuLLhw=; b=Le9dAJPVqKK7/f
	YHlfDfR2L+OCMLtPy11s5RQWL7vYI6TzM5tOMa3nYOzWAIahCNzQq7O95qrZl4LKfjMslom0XCUZ+
	TwxrDFkinGtYYnFfJ/XIFcmnVDigsxrvRdaV7mQUfxKt/IQCctfA0qJUhVfsiOC5xYOY7QBER02mX
	hQi2DR9KWa5AGzwJ/qRF/XNWck34dZljAXymQtY5n22PyV/Ni7VxLZ3OChtDSYA9cJ1jWnfujavtH
	NDj2C7qOT5oUEy8OJk2w+0zF4iIBz4ImH8UQcreA/d78qjkGOnV1OS3Zv4JqfbdlzicyCfG7OIkzv
	ROTQ1dOSpnQ8g4MXigYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j85AP-0001cz-M7; Sat, 29 Feb 2020 16:40:41 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j85AN-0001cc-6K
 for linux-amlogic@lists.infradead.org; Sat, 29 Feb 2020 16:40:41 +0000
Received: by mail-wm1-x344.google.com with SMTP id i10so10560394wmd.1
 for <linux-amlogic@lists.infradead.org>; Sat, 29 Feb 2020 08:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=LxR7X3dDtcq+5W+FtPVqnuhLYnxLerXbFaqGoz4O5DU=;
 b=AYwe7pcIDKXlE6v2WwL9ERNqawlYCuSexQgu2BwaabpPJHn7Md2KfDapqR3XFnuL2s
 bx2i2qjqlvcuC2lkNb2fFaWUClDC0WrSjVfZXaFVHBslZhRxKsyYhy25KoFNV02V8X1y
 nUvWAgbvde2g4LgXhKq0L+LqKMb5C+s+GOWH0H+Hya+xW8X6L5G3IjIZ+ZLHZvJ69UPN
 +YXOy43rE27HTElQvnyMu5oL6mKh1e31F2GzZxz2BqrQ3/XmVHe+E1/pk1umAirxOt48
 r9uVKaW2RIIZjHdtYHw0HYu4HaVJopd0TQ6qXk4EU7AftjjVZxXWBkQ1HhsoIj34atxE
 GfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=LxR7X3dDtcq+5W+FtPVqnuhLYnxLerXbFaqGoz4O5DU=;
 b=LHWZ8JcMRnwHmXAKHptz1ObmRzIp1vwgncgurzZEuA1MwZ6J5de6ufVWUJKhoCPPpD
 i9AeEIFOqxii/hnkZnCWxH0oDJ/b8Lp4wL8mCGTgE/YzN4AecxxVPvT66w1wgIZRtK/t
 f4ZVHfl/PMp6ArgDxA4tYoZbvXNQ3/K8zFUGKnJAaWeRUv3Wl3nGTr1AWJuei8c8wLTN
 hWF15XKItWrX0/uhuQGC17dMeDu/2TefbmsKczUZB6WYUCv5NHZyPpSRbZgpCfjDmLaE
 aca63PRN2cOTqSYlrDACBgFXTM4mmeROeZ4ibHSa44F0ZTQT/gtIQMChbVLmdW1VqbT6
 mwJg==
X-Gm-Message-State: APjAAAVUcbqvjfxYDrI30jm4NXoDhV6nLJJXEdW2LVq0j/ZwyrzFKqjZ
 vTNBB/DgDixmoV//zaqcOH+E6g==
X-Google-Smtp-Source: APXvYqzY0vNYktgxiNEbjh2hdAMjvswtfIHbX11vAppYZ52GUChksbH9jIHd9eN5E8HVSk1gDkeg0w==
X-Received: by 2002:a1c:4043:: with SMTP id n64mr4416122wma.169.1582994437850; 
 Sat, 29 Feb 2020 08:40:37 -0800 (PST)
Received: from localhost (229.3.136.88.rev.sfr.net. [88.136.3.229])
 by smtp.gmail.com with ESMTPSA id x21sm6545553wmi.30.2020.02.29.08.40.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 29 Feb 2020 08:40:36 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Mohammad Rasim <mohammad.rasim96@gmail.com>, linux-media@vger.kernel.org,
 Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v5 0/3] add videostrong kii pro keymap
In-Reply-To: <20200214085802.28742-1-mohammad.rasim96@gmail.com>
References: <20200214085802.28742-1-mohammad.rasim96@gmail.com>
Date: Sat, 29 Feb 2020 17:40:35 +0100
Message-ID: <7h36atbb3w.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200229_084039_234942_989D8DD0 
X-CRM114-Status: GOOD (  14.12  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Mohammad Rasim <mohammad.rasim96@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Mohammad,

Mohammad Rasim <mohammad.rasim96@gmail.com> writes:

> Videostrong kii pro comes with a NEC remote control, this adds support
> for this remote and also select it from the device dts

With the bindings reviewed/ack'd I'll queue the DT patch (PATCH 3/3) via
the amlogic tree, but the binding and driver patches need to go via the
media subsystem.

Thanks for the patches,

Kevin

> Changes since v1:
> - fix styling issues
>
> Changes since v2:
> - use KEY_VENDOR for mouse key
> - use KEY_PVR instead of KEY_RECORD
> - use KEY_APPSELECT for the launcher
> - use KEY_TV for the tv app key
>
> Changes since v3:
> - add a patch to use the keymap by the device's dts
>
> Changes since v4:
> - add a patch to update the rc bindings
>
> Mohammad Rasim (3):
>   media: rc: add keymap for Videostrong KII Pro
>   dt-bindings: media: add new kii pro key map
>   arm64: dts: amlogic: add rc-videostrong-kii-pro keymap
>
>  .../devicetree/bindings/media/rc.yaml         |  1 +
>  .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   |  4 +
>  drivers/media/rc/keymaps/Makefile             |  1 +
>  .../media/rc/keymaps/rc-videostrong-kii-pro.c | 83 +++++++++++++++++++
>  include/media/rc-map.h                        |  1 +
>  5 files changed, 90 insertions(+)
>  create mode 100644 drivers/media/rc/keymaps/rc-videostrong-kii-pro.c
>
> --
> 2.25.0

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
