Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0122CD8CB2
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jun 2026 16:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YN+a94KoJ2VmCrRLS3xtm6ePA11r+0PdYvY9pOXd8ys=; b=k7dnamr5z9JfBK
	sOlrXIbgPpy9ME/8EFC/3jqPnafiiHEI9zFdDcUFy7nl12wIjXMZFUtQiPHjY/FdxdVDiAXz+WqDQ
	CBRft/Fhl5Xch6CLVSHtr52uSgIWGYKhMtIMf0ogvtXCqE7xzTUi1UX1kVmak/wpoDnz6Y5P8FUsj
	H+d8FXftfnOxgRxpJWHLbCpzvIDsyq1M/3mdDsYoxoO9sVFVvXSJjkAhbThP0bGOqgYucY8H/DBK/
	r+T021kmCGV+EwTqbYhga9skSF1fOAFRyKQflCoB5hKa2o8ObRKgBLbWc68DLSVL6aWg9miRf83jR
	EtrXxzu+JkVmjXHpSC7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXLm1-000000086lo-0lTD;
	Wed, 10 Jun 2026 16:27:25 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXLlx-000000086kp-3u1X
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Jun 2026 16:27:23 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-36d8b644473so6543706a91.3
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Jun 2026 09:27:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781108841; cv=none;
        d=google.com; s=arc-20240605;
        b=lxV1z8gjXOokRoGApPjY+XS6oEDLuou7vG/m7Ic5nbv8rLgUXw43mB0Z/BwGevXJga
         YJDw5/j5V0wkJJdCQi9pquGXvRJcjAgbIvCzKE28EzvOuvUGZa8dNNpvsG+wFz4zdhKJ
         3CFXnZFkXp7/XWuQTBImcSYNRTXX/FWRmvbP9wkMYB5LoBIYQJjSYs1PaUz+FKHw/vWH
         qBkQzWeefVlarYiQ4PEl1kfamnpikohPHTuLkFTf65QojUhjQwQ11LtnoreCOl90zYrC
         0Pn/rUh0OIVGk70sgip0n8sBRzofNS3b6EP1URcJJBeUwyPr6sKk6sAxoKxJ7B57y5dQ
         QOfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4DDEYJyH5QFUo14+NzGkdFMpja2S/pLE36Gor4bYTt4=;
        fh=LXo6NMEUGm2vYan5sIeHOHzL07qEFmIRt2abYSLZyFA=;
        b=lvczCmNxb3+3zkQh6sfbBKvmYnEjZMsmVcM+IT9+CCJOrX1WgVMJ1QbWmDAhpXMpox
         8l96S47oKfJghGGscenRLle95eANIF+S1L6RVGh3t+BcdT2iPdopGgysUMSig5wBgLN0
         jVAIQ1shIoNSCrOwjSE9FM32rf10FJIQxvFTPa+DceVeGnXrcxH2T/25udPDPRHtDQj1
         Ctp/tNO8QtfBjj0zvWSJc/Vc73yfqjE54rfuCI2/p1Qj678p5OYpfbWz3Mh18QOmnqGL
         1ZFXzzYRsSuoYgfNlbBykDNsPs4AaYmmOm5SWs+aHZCFWMg/XQWg78CvNsM7kjl53yrv
         DjdQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781108841; x=1781713641; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4DDEYJyH5QFUo14+NzGkdFMpja2S/pLE36Gor4bYTt4=;
        b=prTlZ1c4q7uv6ve6gPRTlmhtDPukGftqHf1DShkbWRslz3g3nuobZKww4yQWzTXBXT
         sHiLcwv1e6unWLGkYFXy6Cla4xlWBVZ2jOb/+P2TsMaLPaEHOdJjyDqbekE4dfMy6Jp1
         QRyRgaqHxvNHI1nYwkBNipVIHUadJx0a2Bgsjm30XJ6r9u5WiB82XNPAWvkv+OJ6iSqw
         wxuJOUxjazfiPtZpJFMRmzQka8jnXY//q7BUesT26atBwXxcXw/8JOhr5t+DrNEz/nkC
         kr34SeScPc351aF6m7+5ks93lpsxW32Um24XLYubMAr5bEPdiN5SdJpAETP0WnPniqBL
         H+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781108841; x=1781713641;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DDEYJyH5QFUo14+NzGkdFMpja2S/pLE36Gor4bYTt4=;
        b=dd22kvEDmwJagDahcAu10JDQFQw187ZKzHXidgdIcIZb34vlvtBYDtZO9f0waam8Qd
         xMIeOMynk/Rn7ojKlK5qG7Cnw1nCKwKHEDlUd71EiIN08GoJ3RHRdgpZRSqWGjaJBeyi
         GbY094QdJ9KnGa23EGzdjMdLapsMRFRyUfXHCHVI9gVC5Gwcx7KCUweUrs+YnzPGv9EP
         MbYw1C6hxPYNbtvYSoIRib3rzL0p9i4WDqoJWrl/lJaYrXNO+EqTlspKW+/z14JAyxai
         DxAVVxQJj7eBtIJ9lD/krumownmGv7luySC53AZTwpQuRURA3yDGnvtPTLhgaJJhHz9V
         7REg==
X-Forwarded-Encrypted: i=1; AFNElJ9/JQY+JQgaNAXDlIGtpb2GM1y6KE5IKOdazpbU4MpoFenFbg8pUsbbzzufZbLzS1tfi3XlSH+22TuS9cn9@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5GYJlwuQCdkucO5GE2cy7LtWK/+6Kq8XIS6Yf8r1YQ9XHBvJ4
	UwAuEMTAJwMa1tHF6ShuQuytLOdZr5RuAZ0MOo2QWx3kx87tCZNhlMnrFlnK+dHs/Bm6+H1fJ9x
	V+MfGTdS4Wu0DQZJMyYnKxjtcO3vSt5Y=
X-Gm-Gg: Acq92OEjFqw7yNWGu3oHOP/7ywszh/RyqnzJdzPBSP2iPGaa5YsqSpmLik2ahVGQmzS
	boyQZfKvhqnzQHAHq1P4Yw0vlE8J0suBKEOLzi4xRDWvKbbrvL2JZuUmifU1VzxoDFyiuxQoPM/
	ubytKhKS/zqxMs7piI1phrL+71IK/bv+hQ22DeGW39jWDOpEFaxRREBvh3PCbAshCcR/b6te67h
	9zlkFaEDAXF8cfQ561AY9brTrx00oPAmNjinDO7cF4vRf4o4HfYfOYhsVeCMm8YBpmXrsrSiD5g
	GLsS2VcFoSH/+WwonF/VWSVi/5SBSmV8TaOPJKWMTPVdrovICLinYRW+CK/yKtwnv3pe2/PD8AB
	+Pr/qgXE=
X-Received: by 2002:a17:90b:57ef:b0:366:52fe:e749 with SMTP id
 98e67ed59e1d1-370ee82fe8dmr27418313a91.5.1781108840969; Wed, 10 Jun 2026
 09:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260610102153.83367-1-phucduc.bui@gmail.com> <1j8q8mfte7.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j8q8mfte7.fsf@starbuckisacylon.baylibre.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 10 Jun 2026 23:27:09 +0700
X-Gm-Features: AVVi8CdWIBbIpW3MLG8tfEMGIpXySN-LRFKOF8FKPCNJzmWknUgBN9OHls3Pa6A
Message-ID: <CAABR9nGC=f_hO7FX2RnRHLb5D2Tt9=qT_yv-Fv2y32AAoQy+sw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: meson: axg-tdm-formatter: Use guard() for mutex locks
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_092722_004891_DA50AE86 
X-CRM114-Status: GOOD (  13.38  )
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

Hi Jerome,

Thank you for your feedback,

>
> I suppose it is OK but it does not seem to really clean anything and
> make the code easier to follow in that instance, from my perspective at
> least.
>
> If there is policy to systematically use guard() whenever
> possible then OK, otherwise it seems unnecessary.
>

I have noticed that guard() has been adopted in several subsystems.
Since this appears to be the only place in the Meson ASoC code currently using
mutex_lock()/mutex_unlock(), I converted it for consistency with the
newer style.

Going forward, should new Meson ASoC code use guard(), or should it continue
using the traditional mutex_lock()/mutex_unlock() pattern?

Best regards,
Phuc

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
