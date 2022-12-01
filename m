Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9239C4332F
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Dec 2022 22:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W4L5eNYSHUYMoZqRMngnB/w3tROa+Ck3JcgUcnBorEo=; b=cnsEi6GH17eUgS
	JQKQsup7U+X1Rpdo7ydB9z/QMocwicE37W5EuS1XmP9VKuPCnrjsb9cP8uYTRnJlKvao1bPgWeIVX
	rH8/ZMft5W/maxbO3K+56IgcFSSSUuiHwAQUBvhyBrCHt0je15T/3+TEaXyy2zp7ThcFiSqCixGzr
	eXtSSPIlmJwlJNuLH28bR6sycYceD0jxccgq79qmF1ewiEAy7kRFZZRAfmePgWkK8KyfaiWbOyBpe
	FGUsbPp9RywoWsYCzfWPyviyJzClwF1gizTRGOywX+ZycPeWS64I0OX9KMLV6veeOHij5Xv5dpTGr
	p7zigRkkQMuI3JU3vM9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0sRx-00BRwR-RL; Thu, 01 Dec 2022 22:54:37 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0sH1-00BQZV-T9; Thu, 01 Dec 2022 22:43:21 +0000
Received: by mail-ed1-x52c.google.com with SMTP id m19so4239340edj.8;
        Thu, 01 Dec 2022 14:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wdccEwoNUzYrqC6jNWDrT9rEAVvVXyiFMgGI7jA68lQ=;
        b=Wk8Iq4Zwruqwxl5xoc1ZTWIyOX5WMpQN1z38ssGVJLqjpltkZZKrGOViQ67FiKHWH/
         2l1ctyiArazBiuXAuq+mxWdCFSZ29k/TqxC6HR19sG73B9PcKOaNE3L/RzvFzdTqj9uJ
         MR81ZSyFpBqJ3451tqP7MPqhUZmq8OW1rbc9N8f0uAuDGKnSohLo/FHgcXxE01hx875T
         Pe1gIimImpVMscHQvsDGvTQK7dxHrFLBBxFL0M7vf0/kSPX0OPj9AmTGI14hW7DtRk+m
         /I+5KuK2jtuCqzqUJKHOC8ETyLKNuYHIaLgE0zpV2kHsQCcWb/VfAV2lFyqdHT9Dl029
         1lNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdccEwoNUzYrqC6jNWDrT9rEAVvVXyiFMgGI7jA68lQ=;
        b=OqRXzxuP+aZueUhKApzOd8DQUES5/O4Yj/M45uj6ek49ScfQNebDCeW0xhHl6foAVR
         eiDWyjdo39qpSsOAiYRt64waKZ23zVw3yA1RXV3fTinzoBoojAuihS7vV4vxXiCSAcWU
         2fvspk7sM41ObxZYLf1jGUhGZ+z2wqH9ejktgzh9CHWBMb8cQ7c8IS2pGKqPouO/ZCLj
         K0y1x7998brOLv90J+cphPEp0Qr68eLHLZW8Ed2G8ovy6QOEnQHZmVLPLRrpOOYBx/Gx
         2cYTDV9fb42YbqWJgEZMeWGuj/wv2s5VEH/FEmX649sVdpeGBfDvzJUQj4tRCzd5xr9c
         QcKg==
X-Gm-Message-State: ANoB5pnUe6sK5++5G9zs2fAu52adURlZY/YRBGUgNbVKK+67MrjFcmxZ
	Jd1YZJv8jyzEG9P47u//MxK3wMBK5+3rauQML00=
X-Google-Smtp-Source: AA0mqf4EmcLVsqU7UbhglMRJS2t+F+vm+uCeB++oDgfvumT67E/omHA7fyQhH1O6Lipy+diU8tBHUJZMSGBvomoZELQ=
X-Received: by 2002:a05:6402:d6a:b0:467:6dbf:e3e8 with SMTP id
 ec42-20020a0564020d6a00b004676dbfe3e8mr23352735edb.291.1669934597635; Thu, 01
 Dec 2022 14:43:17 -0800 (PST)
MIME-Version: 1.0
References: <20221201103026.53234-1-tomeu.vizoso@collabora.com> <20221201103026.53234-4-tomeu.vizoso@collabora.com>
In-Reply-To: <20221201103026.53234-4-tomeu.vizoso@collabora.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 1 Dec 2022 23:43:06 +0100
Message-ID: <CAFBinCB1pZm0AaJq4_dsVksdp7RP+aTiXK04wFeLQ9vChbkYCQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] soc: amlogic: meson-pwrc: Add NNA power domain for A311D
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: italonicola@collabora.com, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	"moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_144319_980116_1F08649B 
X-CRM114-Status: GOOD (  10.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Dec 1, 2022 at 11:30 AM Tomeu Vizoso <tomeu.vizoso@collabora.com> wrote:
>
> Based on power initialization sequence in downstream driver.
>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> +static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_nna[] = {
> +       { G12A_HHI_NANOQ_MEM_PD_REG0, GENMASK(31, 0) },
> +       { G12A_HHI_NANOQ_MEM_PD_REG1, GENMASK(23, 0) },
I noticed the discussion in v1 of this series where Neil noted that
you should change GENMASK(31, 0) to GENMASK(23, 0) (for
G12A_HHI_NANOQ_MEM_PD_REG1).
This is all a bit confusing because the S905D3 datasheet mentions that
the HHI_NANOQ_MEM_PD_REG1 register uses the full 32 bits.
I'm still fine with the way it is right now because the datasheets are
not always perfect.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
