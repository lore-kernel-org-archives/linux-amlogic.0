Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4F8C4332F
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Dec 2022 21:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kwiXADrWtbBKTlGvtvm8umt6rfYuIZaLgN8yLc5TZw8=; b=PwvJ2+OgfHI4yy
	TkWjzPdNo0s5K5ms0MFDEBg1Reayr6jzNjaH6dkTNKt4ICdUaZbefeSpskiZ+eyzqfW3MKMHY/wO7
	uZWOMS83xtiAVGplkMFApF/wYv2A4ctHhKIpNf+jkZ5ZcyB6y5t470EvzuroMrnHVSOhN6VV8fpwe
	mJMxJEWTiiY3ue3tyDBs3uE6JrzlyoBbYVEBURVNjF2zs9va9FfkUrNLj9sF7eON0ZflA3YDMeX8L
	8N3VymF+d7WAs3io41HlvHJLRtMll9nwElkcftY/grVi/PSph44rJJe1otd1t8FEG88g5sQL86PPQ
	5/H8hioYmr5qjHFtc/sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3OdH-00CEeh-DX; Thu, 08 Dec 2022 21:40:43 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3OdE-00CEPV-JX
	for linux-amlogic@lists.infradead.org; Thu, 08 Dec 2022 21:40:41 +0000
Received: by mail-ej1-x62f.google.com with SMTP id vp12so7104727ejc.8
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Dec 2022 13:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PYLuTPsWM7se6ySuaSMamG6aPts7TGZWpMs3U3FouGE=;
        b=aqgo3Ft1AhDRDgLuO2n9Zdtkt5DJ0/2scJhkNAJXnmoM9qQoaYzEnqz31UWYdZ9VkZ
         yY89OtIw4K3TjkcDABmUuKB4ZzVGIfazqk8Wk0cFp66DqOaMtP1QkaxhOSYIJYWcN+Cx
         q342gyfZ0f4R55X1B3ABvCr51CoV00cNbROx940T37QUU152DnSnSJ7+CBl28IqF4/aE
         +G8P043PcUKhu2VEmhcGG2oEhBO9S+8SEshFdoZtadJt0/sf5RUet1TwoBrCHg0Ao7fJ
         2/kBW+8VpH3ihlBxAi+xUpTf+CgHBjKTxSLYSrS6e5oydM7j14BCsH72bD3y9u+rtT3W
         2u3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYLuTPsWM7se6ySuaSMamG6aPts7TGZWpMs3U3FouGE=;
        b=c65V6gaE6z00hCtwe/bHSXfzWU5XLZfv8X2VUlbj/ug9l8eE7cThCC8HUsWivXzR9p
         IxYZQCNpZ376RGxbhCnHzh9h+pUPMOHU1G+AlhV6unbuV2RhaFVYMsaqiZTU794SO17E
         1rJE81Fu0tcar+xkuDynd9RF9f/knEiP/PayzpuV3hrLhdSoG5+S+K1yol156uCwk6Z+
         RsXnhbURG1YESLEx1wCSkezNaTSBdy9t3n8LDli6fSlgPh0MwKzG3SSTWwMiGMtrDkQQ
         UnmlEVoEGSHG020sAQjjjUqvPPvTd4Pe2Doa3nc1w4cDgNSfjiEubx+PXVhYDv3mxLLA
         XTJw==
X-Gm-Message-State: ANoB5pmJDP/g1A6/YLkVXgh5XbqF9aE5d9SzLnVGNzvcq+ozWhEsKxaB
	uCAUz6DOUQtJ07ZJiwswpQctQJTdPSw9ZLA2nc4=
X-Google-Smtp-Source: AA0mqf7aE7tcTJ8/ozosM44yfeKrtwqKvJ8QrCf/aVfv78RojFmsjRK3i4abuYIBd4Z0G1XaCSjWZyaRj/VVmwwfcYk=
X-Received: by 2002:a17:906:b0b:b0:7c1:36:8ffe with SMTP id
 u11-20020a1709060b0b00b007c100368ffemr11974850ejg.725.1670535637601; Thu, 08
 Dec 2022 13:40:37 -0800 (PST)
MIME-Version: 1.0
References: <OS0P286MB0641C7CE54DE2CFD928AD1ADCD1D9@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <OS0P286MB0641C7CE54DE2CFD928AD1ADCD1D9@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 8 Dec 2022 22:40:26 +0100
Message-ID: <CAFBinCAa3C4KcOm8jLwcNGc_btUXUXUDGD+6yqVivxc+DDA5TQ@mail.gmail.com>
Subject: Re: VIM1's wifi doesn't work after update to Linux 6.1
To: Zhang Ning <zhangn1985@outlook.com>
Cc: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_134040_686479_58393BB9 
X-CRM114-Status: UNSURE (   8.13  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Ning,

On Thu, Dec 8, 2022 at 2:02 PM Zhang Ning <zhangn1985@outlook.com> wrote:
> After update khadas VIM1's kernel to 6.1-rc7, WIFI stop working, with
> below log:
[...]
That's unfortunate. Have you tried reverting commit 066ecde6d826b4
"mmc: meson-gx: add SDIO interrupt support"? I'm not saying that
reverting that patch is the correct way to fix this issue. It's one of
the few recent driver changes though, so at least it's a starting
point.

> I applied "WIP-arm64-dts-meson-set-p212-p23x-q20x-SDIO-to-100MH.patch"
> to VIM1's kernel 6.1.0-rc7, is it related?
Have you tried without that patch as well?


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
