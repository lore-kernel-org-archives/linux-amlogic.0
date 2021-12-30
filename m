Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A7BC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Dec 2021 22:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9wCmbz0/ooptvpYdQQDKFtinI47uYuHJZjmnzwqD6/Y=; b=3UCigILFt72/Gc
	9GK6CLrxjxAXddxOraCTfbMzp+Eeqp1bvTUQpmnA7p3LAIkHlk0fDf/Sl4Df259kk2hsYg3KMnNMd
	uiO0A0Oc9n1SQ3fMkskm4jhYeE+uNFnQHMSS54e34F/k9QhpAFSM6k2gMi+kOaujSfiehDimcvIOv
	HxcqSKSSfwU6l+TqW71qZltH4+MvQNW3kvafqQlqyWSKhgO5MIBMg0zkUIbw61722pJEyXtEaE5kz
	vQdxrkaFCxH8FbnYT9kez6Cw3rUgisQeZzV/kPFvz9mEJq6MP3q+5hX2HvIX3cZEcKGj1ApOZDLQL
	93mklEaAPaW+/cQ0G4hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n33iJ-005KCC-Bb; Thu, 30 Dec 2021 22:15:59 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n33i7-005K9p-4y; Thu, 30 Dec 2021 22:15:48 +0000
Received: by mail-ed1-x52e.google.com with SMTP id j6so102656703edw.12;
 Thu, 30 Dec 2021 14:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hc0r2N9wILBK5j6lJv9HNUF6SLNKhbock+fy92xHib4=;
 b=S4zo9HXK7TxDYR7nNe9U50ZS+pGeqfgcuXLGD01vJc+YS1OZ2fytLy20F3GxT/TBZN
 M/tRy3erdJjtrVAXk7eG3hNw/l8FpDcmc7r3XgK/6QVB2GLS1TeNA8EjJzz/C15ZRWqU
 ka7cLk5YmGiYkcLUtZmM6Z123GmMR9zdfv42RG0ZzYJNNVSTKgxIhWg5aGx52ufv1G5w
 fyjAStE/w45eOdE7Aof0WZcMN6BSYUCIDGOL/W6a6Q3Xgf+sv+MH1m+3L9goJpHFd8cP
 fUp9pp32LfFgeLYV+zPI55us7GMeWTZWMUexlPNddrjbrP75k9ZNnwfR6zuHI2On1qw8
 ZqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hc0r2N9wILBK5j6lJv9HNUF6SLNKhbock+fy92xHib4=;
 b=RDKWeHoHo2AxqkuLNjqa0/suUtV8r4jKUv1FANNYCqNlZukxEx0NuKekl/E1HNXNPx
 GJCcQlZ7ekXczJ10diWeIi57hYHFjSjMot8keCBElXyZwfEWKios3xBa/2/NCIyr57EB
 pN1FfdUWMlTm5EPnf3aJUss8PxU/XRN9OkFSguY0qjtU28usT7/EnUh1dsqooOnpEwOq
 YOMJeTU+M7H4bQjhPAMgjo0dKxtR59eWvtnLHMAJDG/WvzSm0xWkRWmHUW8E+T8lLS5+
 whr7A7/24MYFnAax0KNpniC/qAnPtEfWCLiVnhBMxZF53vQGeaX0NUO10beIpw0/rGzj
 Oadg==
X-Gm-Message-State: AOAM5331c60ozfaJI7b+S5ZvIQKe/GTzPUgRb1BmGiwvHlEBSnycE5cB
 eI+e+htdPIIUdCwdbREnoRVBpN1Uco3f5Y+Bu8jIzd9JLe8=
X-Google-Smtp-Source: ABdhPJwN8U+Azq6TQKPJcwkI3nTp68GV7SECOynL0LNxLA7UFWd8eTpZTdIr52huvf7ugqk5mIdwK2KkgMPO2K/an6g=
X-Received: by 2002:a05:6402:2072:: with SMTP id
 bd18mr31840538edb.280.1640902545590; 
 Thu, 30 Dec 2021 14:15:45 -0800 (PST)
MIME-Version: 1.0
References: <20211230094434.3053195-1-shunzhou.jiang@amlogic.com>
 <20211230094434.3053195-3-shunzhou.jiang@amlogic.com>
In-Reply-To: <20211230094434.3053195-3-shunzhou.jiang@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 30 Dec 2021 23:15:34 +0100
Message-ID: <CAFBinCALAOJz16=u7r8tLM6ditriq=-NOACS2HRLrWs5B_FkVA@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] soc: s4: Add support for power domains controller
To: "Shunzhou.Jiang" <shunzhou.jiang@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 jbrunet@baylibre.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_141547_234306_2C395FBD 
X-CRM114-Status: GOOD (  12.05  )
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

On Thu, Dec 30, 2021 at 10:44 AM Shunzhou.Jiang
<shunzhou.jiang@amlogic.com> wrote:
>
> From: Shunzhou Jiang <shunzhou.jiang@amlogic.com>
>
> Add support s4 Power controller. In s4, power control
> registers are in secure domain, and should be accessed by smc.
>
> Signed-off-by: Shunzhou Jiang <shunzhou.jiang@amlogic.com>
Also here I don't have any datasheet to compare this with, so this gets my:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> +       SEC_PD(S4_VPU_HDMI,     GENPD_FLAG_ALWAYS_ON),
> +       SEC_PD(S4_USB_COMB,     GENPD_FLAG_ALWAYS_ON),
> +       SEC_PD(S4_GE2D,         0),
> +       SEC_PD(S4_ETH,          GENPD_FLAG_ALWAYS_ON),
For the A1 SoC's UART entry we have the following comment which
explains why we want to to be "always on":
  UART should keep working in ATF after suspend and before resume

If for some reason you need to re-send this series then it would be
great if you could add a comment above each entry with
GENPD_FLAG_ALWAYS_ON.
It will help others (like me) understand these SoCs better.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
