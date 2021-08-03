Return-Path: <SRS0=YX+9=M2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF3EC4338F
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Aug 2021 20:41:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C71560ED6
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Aug 2021 20:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C71560ED6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQB3P9E6UWCFmEAp4k1UUnyNxUVq5hUSX5nL/gI9fxc=; b=VWJrR2lqim4vZP
	vU0kXXvq8fj7xHq/yjYPODCV91UyzTHexc4oPcmfEnd+ITiBDrHSo2+sakpcxkrEiz/ihB4hGIPKS
	mJczwJCkgSErC4mqIg3MfWqE+L8hcE/+nSYFF+GHt21FmiX9cdue9kziQBwYrKpNKduM4IfsiytIi
	jh4fG1JA8KEQhXRvjb3YasyWF4axkvEAzQlOVqwrRWxBnd/FJrvdfEuj45jDaw3gnMKmDlSbargwv
	VF33i+qQwnHjTrl2Z5QpA63uBZ1zIyQaULZ0VUdsAUDJfPpLzGoGobnK0HZDlgD75kZl2cVA5tLtE
	AHyfeGgilRgNmUnJHLuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mB1EE-004BRJ-19; Tue, 03 Aug 2021 20:41:34 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mB1E0-004BPi-PN; Tue, 03 Aug 2021 20:41:22 +0000
Received: by mail-ej1-x635.google.com with SMTP id c25so466888ejb.3;
 Tue, 03 Aug 2021 13:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=muiFGHEiWM25TrMqBdRhYVOUT+BYpoCINhQGE9kEJ74=;
 b=MNlRcuGihDn3+Z15IGGZ551Y9IzqTYJz2RsPB/18HciIbgAh7DS4vs5qgpQzNuSd2+
 ZpzYlPq46RynZktqAvy2nZr+szds0M2MjV0g0++EgJgbFGgO3o68oLUnamcJJjZCzNut
 Yhq71OtVAfqNPzQmyEiV4kcaMF3h5ziwHE/c26ts1OlDE2LaJ8ZAFZ8kZW8QLsUeosqp
 WmmwPWnUiY1CbLZASkGIch1ltlXeQ/Z4rPTg3EiaQnUZdcZMRoaPTmN9jCnZw1FuTHSS
 dAY6evOYP7jawMRXnFBSTVvJC2GGYJen+gZUsPlHFQSmBbohMAesGlkHOnceCuQBpCGs
 nXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=muiFGHEiWM25TrMqBdRhYVOUT+BYpoCINhQGE9kEJ74=;
 b=HNULWNyhTUdcdW1ywflgTEfeZt2MbXKqsCIMgcXqI6OJbZbR26morVCRr5nDeotezx
 pcT1zycUPZzRy/EzinXfXrVKJpZ4rXSDdzWJBhjXGzKan18JvrDkozEDFG/IW1DQ3NAT
 qOba2VQrkD+MXP2iGJxIY5feUKG72m3UqfPmG70Rjkx+BSPW3Ao2tNZNfuE48WLHsnLU
 qgZCH8Qx+YicgptSHct5uaOVP6G4diNKH0l3lxeRzSusgqRahs3yI8FtVJ7EroXFZ1gb
 1rc/+jQO9QYOM7iYVu45cvNNA2eNaamnSOnKSKLddpJBB2ceeaeNsopI0MORoDfbfyjs
 nYYw==
X-Gm-Message-State: AOAM530kPaneC7UczQOpsK3zknUSAUfEoY3Gbxz582c1YvqfPDxe0Du9
 mPtsZFMKOg0e7S/un0kRNnsoFxfuiEurUkUZtJc=
X-Google-Smtp-Source: ABdhPJxC90iBtIQJh6nPIWU8pSAop+ICxI60kaovcWNRh3ZFPKMATs9wV8MtyZ5+vdEpGw66BuARlVTc44++ww1Ejkc=
X-Received: by 2002:a17:906:b0c5:: with SMTP id
 bk5mr22129214ejb.428.1628023278980; 
 Tue, 03 Aug 2021 13:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210729201100.3994-1-linux.amoon@gmail.com>
In-Reply-To: <20210729201100.3994-1-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 3 Aug 2021 22:41:08 +0200
Message-ID: <CAFBinCAPP7J-B53FCrY50oF9ttsOkkknG1NhBbL8BYZVPdkJSA@mail.gmail.com>
Subject: Re: [PATCHv1 0/3] Add Reset controller to Ethernet PHY
To: Anand Moon <linux.amoon@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org, 
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_134121_058533_04231D96 
X-CRM114-Status: GOOD (  11.24  )
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

Hi Anand,

On Thu, Jul 29, 2021 at 10:11 PM Anand Moon <linux.amoon@gmail.com> wrote:
>
> It is being observed some time the Ethernet interface
> will not send / recive any packet after reboot.
>
> Earlier I had submitted Ethernet reset ID patch
> but it did not resolve it issue much, Adding new
> reset controller of the Ethernet PHY for Amlogic SoC
> could help resolve the issue.
nowhere in this series you are addressing the issue from [0]
Some more comments in the individual patch


Best regards,
Martin


[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/arm64/boot/dts/amlogic?id=19f6fe976a61f9afc289b062b7ef67f99b72e7b9

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
