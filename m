Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE5FC6FD1D
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 18:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tMegeTXTXP0cGmue6M5PROjtkEBCiofouqvivd22dNg=; b=sYXX2vMCT4NbpA
	6RGIu7yPDEvtrQLgNk680xzNfYHsSOg22wEYzEHtlmz8YCCWVrKtbqU41onWLQbFjySxn69izLwPT
	bgckL7+C4+e2NG/Jza+SGPgpDEBYg+54gcY2HodmvkaugKn+z7o+U+3TihIC/2lkrk6Xwg81P8V4J
	qYQpHtvhTJhkfjdbSEN7kbs8lBeUL1ni0qF53lJXcjnAhTjNXOwESA/VisA78O1LEpiKbH1o7c38q
	StSIB95EaaSHLm/rN1zDP3qdFsw5lnkXHHwkHHx0N/4p2GfzE3AYVMx4iChn80OtY0nAfC2sSEJzX
	uO9HH1s0jhWFPXGtpeqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peKQl-00AA0J-0G;
	Mon, 20 Mar 2023 18:40:27 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peKQh-00A9zG-2o
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 18:40:25 +0000
Received: by mail-ed1-x533.google.com with SMTP id cy23so50487506edb.12
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 11:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679337617;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3nex+dYLNCBBtJyKwdMGEzfFF0tvSiT7XPExuf7eSRE=;
        b=HGjf8anoWagidMceSvk2B1/HzTzLfNLdSaut8o4ZJuYHO9mrgokiJ9bw+xaXns/mUI
         KxGlZmBIhVih5wQx6Mk4hqisfQjOX3QuazbatOgY12GwPWtqkeuAzJ6FVpjwAStc1ggx
         v/yDut3RKRtcQm7g7xjCloqoAwX89yr36Mfqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679337617;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nex+dYLNCBBtJyKwdMGEzfFF0tvSiT7XPExuf7eSRE=;
        b=b3B36xuopJdF1Sh64m2LKxv25EKd4NhWXJIF5aarZnzTrP/vc6wLWB4887k1eo44J/
         EYXcWng6tamVUQTHKMfWeVztfFIh0o8i7Q80A+MaUYb2EvJdmWGH1AnlpRIskPW8QqTE
         6hj/scf5jgEZiy9tJ5berM8w9rZm5LVAu9ZpwFszyVw+GuCzoxhQTFRLpkz28sSibNML
         0i41XRw/0uRgmUCJ7GWbvklcZOwq/G99YRzHb4vJZE0sNeTKFTKK5VQos8DBb1pGpjnw
         iL2uBzU+/UXlg+zpsekMSodZxBFf6KfsFlGsiVeIguzD15KBMhRDyeU3vq7ii3JvJeut
         V0oQ==
X-Gm-Message-State: AO0yUKXRYNA6BE3dxawQV4AocftCKQeaG3vY6qDCPeO55ZkglHU/Y92R
	dGDPL2gjpnFe89MGJNLMWGAoLnp2TTWW8q8JQYE0Ld0qAVPmz5q8xxBV4w==
X-Google-Smtp-Source: AK7set9Za6yWPYDoJHROlVt1Ba1bODkOM7t5fMsmX+7PhA+wv1mIUhL+L4054Dt2s/EK0qjBx/4d/StqWyqYmVNg0Bg=
X-Received: by 2002:a17:906:7f8f:b0:932:4d97:a370 with SMTP id
 f15-20020a1709067f8f00b009324d97a370mr8122ejr.14.1679337616931; Mon, 20 Mar
 2023 11:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230320114609.930145-1-christianshewitt@gmail.com> <20230320114609.930145-30-christianshewitt@gmail.com>
In-Reply-To: <20230320114609.930145-30-christianshewitt@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 21 Mar 2023 07:40:05 +1300
Message-ID: <CAPnjgZ1HW1x3CJ27icDifh4+hjUJjpwCM--FtatzJhrWjkEueA@mail.gmail.com>
Subject: Re: [PATCH 29/33] doc: boards: amlogic: update documentation for
 WeTek Core2
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: u-boot@lists.denx.de, u-boot-amlogic@groups.io, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_114023_934777_B2177C55 
X-CRM114-Status: UNSURE (   9.37  )
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

Hi Christian,

On Tue, 21 Mar 2023 at 06:05, Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> Improve documentation.
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  doc/board/amlogic/wetek-core2.rst | 83 +++++++++++++++++--------------
>  1 file changed, 47 insertions(+), 36 deletions(-)

This should really move to binman. Would you like to take a look?

I sent a patch for this a while ago but it needs something to review
and try out.

https://patchwork.ozlabs.org/project/uboot/patch/20220110031413.1970836-39-sjg@chromium.org/

I am happy to do more on it as needed.

Regards.

Simon

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
