Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE76EB64DA
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Jun 2023 07:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yqtoSNGXwWXEqm9HukGJCFe8soVHTMmpp3/Bu6U6Zgw=; b=krFbHVmzI0Btk1
	4fKKrrhfc+2SA88wJ4Ygh9TWr1fQjsu3DtTppIrKi+f0yzsY3BdoY0c1ZsgGELXMrVkWlTtsN3Y/Y
	vVymM3DwDJeLvJaFF+3z4f058R9ozrdu/qGvFUeAzgGGrCXiop2iD+NqWtmWWDpw6ypTjmztLqGAE
	Sx0ln3r0hvWtG/6kR/6dPLfUPjL6hEQn5Go147VP0UHUDD2BqmUSrnCsMFtup9xI66hGmJHVMWVaX
	wJAdvhxyLaG6HlG5iPdkI/lXQqNIH4DEPP284ef0xKsf6+mNGe6soJ3NvPhRoVMQCJfLtLyFBLQUN
	0+SdIIqT6io6eieurhMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCFCm-00HL1W-2v;
	Thu, 22 Jun 2023 07:58:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCFCh-00HKyQ-09
	for linux-amlogic@bombadil.infradead.org;
	Thu, 22 Jun 2023 07:58:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eoH4TBC0JXa4HF+16J32SMlFEUZb3HDAGDzfvr+ddQI=; b=NWBRIGI7CDs28yDfB0umIQWrP8
	AmTEZHlKsr4HPDI959AfoP7lRgTw+S128OUUpzE7F32f8edPHnAKcpcarAzll/oR12bljtSse5Ayi
	c9Qj1JthdLxu/+vurKMy6XInB3uP2lUPKpfne2x0FcK1zt/VLGQ3m3lltACJ1RNDfOTu3KjBstw9x
	ik+ev0nGo5L69RsJ4md0tnXtvzwY2qz2omAW+wb5klCdhUUGNQKoTRLp5kwxuZ2oulY9YU5dFOJEY
	kdZkqHKD+VtNuIwI8atkcr4/ZIzuWPDbKKzNK4Bv1BBj+HvFlip/GoCz1ZHW5WSErSO5T1SxMOf1z
	JbTCoRdw==;
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCFCc-00123S-1M
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Jun 2023 07:58:05 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b47354c658so68589831fa.1
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Jun 2023 00:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687420679; x=1690012679;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoH4TBC0JXa4HF+16J32SMlFEUZb3HDAGDzfvr+ddQI=;
        b=Cqk7bC+rMdN6LWVm4P1WxZhVVsQ1i+A2OBJpHjrP0dcYZ9kttyL616l4E4STIgjc8X
         sGq0F336C1y2Q0ixgy9e+Pk4UXNuUMEEaPURL6qo8R+6CuI/kbqVjfPq+/s0DG6xlktM
         sWsNr5G9uC6tzDfjhpDHt3XWtQ8pIt0tlRnATo5VLg1OUdV02xxhdVulbzeXc9G95Gki
         YI5kh4+wBKF2F36x0SASlSO6FGmHuRuz5UveUuuC8qL1c2DPGFkqaPX9DmPi40UYb+86
         HOw0qIcMPNzf1h1eYf4E9Ie7rrjwe+1F/5PAS7+FAIQLG/Dt+VTGHsqEir1KbsHsvq/b
         of3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687420679; x=1690012679;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eoH4TBC0JXa4HF+16J32SMlFEUZb3HDAGDzfvr+ddQI=;
        b=ICjkK92soE4OZJdFlmqbCbib3PmCkdDvOKRSf3QZInSpWZfQNZ09Nv5SNH7uq65EQI
         GQ8GPvrEJEkzr5Z3cUSSmLjOElyVrKYV0zO6Wx13DQHfsd6gH3m6BE7mvFEhASl90i5K
         Md8bteIwUTLc+vUj+4NrkdImiUhg5uZEltcMUpq6q9BQH3tqrPdUzLpJZEylV1c1wx28
         /+gmhgRIVCqhUVMvl8uuEXZF1jkZYiEfYaiSk0uO+PugCbjDTzcZjg2mYTE1p66GSSTl
         qiwKhH8cXEQoNTok1W5a7QWnpJ5GmErK+hHQypGh8tzmKs6mnLU/o5RH4O4akzLd76tg
         wO2w==
X-Gm-Message-State: AC+VfDydDObKJijwZT2gubRtowgP3oqui8Berr/z7JeFGTqPRlZAYzF0
	Z4VZfbO1E3ed9xg72d8py3T6Dw==
X-Google-Smtp-Source: ACHHUZ5UXqIo89zYUy4OGRb5+TvhvC+o+5R16dzg4IwyRN20Eiakd5XgdOMmN2DFgAkviZpRz1d8ug==
X-Received: by 2002:a2e:90d2:0:b0:2b5:80c9:126d with SMTP id o18-20020a2e90d2000000b002b580c9126dmr4225985ljg.46.1687420679046;
        Thu, 22 Jun 2023 00:57:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id u23-20020a05600c00d700b003f78fd2cf5esm7000683wmm.40.2023.06.22.00.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 00:57:58 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
In-Reply-To: <38f87b22-d9a8-b8d8-ba7b-a2c2d7311b04@gmail.com>
References: <38f87b22-d9a8-b8d8-ba7b-a2c2d7311b04@gmail.com>
Subject: Re: [PATCH resend] MAINTAINERS: add PHY-related files to Amlogic
 SoC file list
Message-Id: <168742067824.2178283.2801774863315651148.b4-ty@linaro.org>
Date: Thu, 22 Jun 2023 09:57:58 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_085802_853862_232B8B59 
X-CRM114-Status: UNSURE (   9.25  )
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

Hi,

On Sun, 15 Jan 2023 15:26:05 +0100, Heiner Kallweit wrote:
> Add PHY-related files to the Amlogic SoC file list.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.5/drivers)

[1/1] MAINTAINERS: add PHY-related files to Amlogic SoC file list
      https://git.kernel.org/amlogic/c/9e70e49474bb37ba8f43336d8a775d503b20aebc

These changes has been applied on the intermediate git tree [1].

The v6.5/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
