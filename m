Return-Path: <SRS0=ipOD=OT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE6EC04EB8
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Dec 2018 09:08:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3ECF12081F
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Dec 2018 09:08:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WHBJvsJa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Y2JGgst4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3ECF12081F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3oBJqT5pU2bT4ByOG/yVxm5ImWtUXu3VZp2i+JqiFOs=; b=WHBJvsJaRYBuRq
	2fllDN8QK4qBiwztouzXeAues4jsTDK5XuShrd+Oq61mdDEA8MbrZBFQMNa2AS0aCUd/skcSwQIu1
	ykZywk+Kp0k5W2Nl38GBzYBE7cyPdj2vDEhM1jfjEIKRIU8ZEcFehwnFrHYjlZCid1Lz6octppx/c
	uddQPzRleKJgQeTAqM4ozrfdq1GJCTVxazw7+JnyaytDIwS0JZ63n4AYdndFMqRCrz+R5e71oJlQQ
	rGZ+G5KcCcV67k2XGia/jMEvchQRCAPK0E7OyXrYNjNjeBqM1Nd3pvGJJQYG3j5cnQXHD9Ui7op5e
	Kn5d9VZo12UxYW6Czv+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWHYb-0001R3-G6; Mon, 10 Dec 2018 09:08:53 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWHYZ-0001QG-4O
 for linux-amlogic@lists.infradead.org; Mon, 10 Dec 2018 09:08:52 +0000
Received: by mail-wr1-x442.google.com with SMTP id p4so9592435wrt.7
 for <linux-amlogic@lists.infradead.org>; Mon, 10 Dec 2018 01:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O42yOUsF5m+Lm0y0IAiKsUjTDgPRlx7ZlXUb1Wixasw=;
 b=Y2JGgst4Wq69089a6dMvnE9M5RC+BX2YAWO6UZZttNO05XPoWtVMyr38C2YaMq3RCE
 YDP7QX6iQh4C5tPGD1wULR9qZx4wnifTFlM4zyGE3UJhPzCxebjocTLx76R7FK6hAXG3
 IVYzN96axke57HiP47V/rBbqnu0Hi9uz2RN+EqBlEhJOlM3QPW4UwdCBM4PDHgYMo7yn
 OZj0R0t/wczy6DkOTN2fB8C4jCBt9PLJfY3IoYCa91YgO2S7OFNbOVzZo2UYJAKX0IYK
 7PABEnL1LAlWAwmNUy0ZgstotVMNxFDaQlXv2oYA+v0MPNLjn7vPMbaZi9UgCQ4GqXzu
 ldhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O42yOUsF5m+Lm0y0IAiKsUjTDgPRlx7ZlXUb1Wixasw=;
 b=WBpJhRtuPC/umbtwENUfDbIAIIqmqb532me9SHIgDZrAsiZQ7OLtIwHGAPpWdalDZL
 fYaSAXTIgTo7hW4eNexRMSJ3/n/aLGCMkD4yE/fSHbUKyul2nU5Qv/1VrI5QGVTdpG81
 5cTnUN1CrqgW37Gkj0fPULLCmBFawAA9dPwAAm4k1qGqA7W960X2hc6G1iI4YDKkx3ln
 6tBNyce9APe3P2EDMjqq+YjNwZT4Wcpn9MUf/qFgPhOi958gzYWbUa4CbqwtIumtp4U3
 vc4VFVaNbjC032PlAru5EikPcYYBENzOYR5ny7d4qP7LX5mViWXV1LZcO7sNnfR25i2g
 PGlQ==
X-Gm-Message-State: AA+aEWZGgzdUJx9V4VHKeA+0whwi/77HcSdfNIylQsXHXvTfOquE33xF
 kJNBxAK9D5vSlvo+rAJYBBXEwQnhYAqxBN7CX/Jw7A==
X-Google-Smtp-Source: AFSGD/Wd+hiVKRniurs4QTQa1A0ux9tGPXRYixIMksqehfHHfQUFs9Uri/NN5VsRGqFYOy44DKCRqw3HOXcjJFTypcY=
X-Received: by 2002:a5d:678b:: with SMTP id v11mr9948524wru.245.1544432919775; 
 Mon, 10 Dec 2018 01:08:39 -0800 (PST)
MIME-Version: 1.0
References: <20181210090448.4301-1-mjourdan@baylibre.com>
In-Reply-To: <20181210090448.4301-1-mjourdan@baylibre.com>
From: Maxime Jourdan <mjourdan@baylibre.com>
Date: Mon, 10 Dec 2018 10:08:28 +0100
Message-ID: <CAMO6nazQaBuSD=VN7+e1jcmgsMx_Zvj+yAENhQN5PvJKvyR0qQ@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: remove firmware framebuffers
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181210_010851_196363_F5937E6D 
X-CRM114-Status: UNSURE (   7.83  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Dec 10, 2018 at 10:05 AM Maxime Jourdan <mjourdan@baylibre.com> wrote:
>
> In case we are using simplefb or another conflicting framebuffer, make
> the call to drm_fb_helper_remove_conflicting_framebuffers()
>
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> ---
>  drivers/gpu/drm/meson/meson_drv.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>

Woops, some spaces made it in there.. will resend, sorry about that.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
