Return-Path: <SRS0=sMge=MM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A73C07E9B
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Jul 2021 22:24:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AE2760FE9
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Jul 2021 22:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AE2760FE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j508fsE0MWbCQ2003bBvedkif3tsPj7u1SbbhYGt9Ew=; b=LChstulzDy1iCn
	sfILc/IpzouCm5Idq4yorv8zdZIblf2J7oaP8P7ey8EfqAZGAvTr3s2OWKQ91znzkjDgtvBn7w2wc
	vkPFKyaOqb7RhTJ1x4Z5KAzNPwvlGFi+vlOqYsQSv4HisM7plnqojoGTPKv/0ISuedG8s87pGnfru
	g4M09Wfq8hzGLEHxsr60szaxyTg5scPyvf7EpLYu17NExugLbTyqRp/6xwX5ZK247shKzTgk4WjTe
	j/WD8yH7uT4IPmYvitfLiEupxVMG72LxvZdLghn5xdLnpOaEr84PwW3xN/Yts66cBQ5DWahHqBuBa
	dujzBPyGLXeWKyrj27rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5yA3-00E4on-0s; Tue, 20 Jul 2021 22:24:23 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5y9p-00E4nP-IH; Tue, 20 Jul 2021 22:24:10 +0000
Received: by mail-ed1-x534.google.com with SMTP id h8so30382218eds.4;
 Tue, 20 Jul 2021 15:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lEppuy6RYBjr45xnEaHtJ8rovvDCczMbopW2pe2QH4A=;
 b=Qq7JPADE2lUz0crkONCNrpRz7beK6py+R7GVxhrIBmPY4Ot6R8fuU9Y84UBtQmb6iF
 Wl5Ch/kGqRt0wTQJ2UN3DjNR9Y0euuse9vY/Zg4TpixV6FaNBGWm9WOtj44nEi7xqJto
 FXH4b0iQjuvaWoP12qJAdb2jRso2HtxNPcfT0Qh5WgjCvQo4rdL3eUqJtt0+yz83+m4t
 rxbBFDwtwqZwI+5G1ImH2/9WhclL/77VqMEGjteJHMy7hWJF8OW2Isf59EDL/DWadsWq
 eic9wj3a8wAnbebaQJRL+SptDSFJ73KHaW1qfAV4nG+Uzu0JThcjLp2Yvs0Egg2whOVu
 4yMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lEppuy6RYBjr45xnEaHtJ8rovvDCczMbopW2pe2QH4A=;
 b=ddoDVGVoFqlhXpByHmceDn5914pxf+TjoUsdjB0fQ4HVMpBFHijbl6U3tEwj/BPnmo
 CJcuHXMUvDehQwWc6lJ7BUdWB3yMld8Qtk6WLFsR9PN/r/S07I/qu2Sjp9yDaFheVfhO
 LMlUyNzMOEtBJLLXP2Dy4wI5LSO3X2HLtYZOtxo0a0eRvNteahRV/lSEhsSKY8JcLnxQ
 9uHaLJGo8/MJ0ttDEP0qtcDKxa39mVVMcAPcYOxijg90halYqSi0Adximko7FVUxw+Wq
 m8YEm+ATFJHBXBiEWfodF30Zn1xs378xskpyTw8apcZZOy4Q9bTqjKsQnyaDVFStB9Vo
 y/+Q==
X-Gm-Message-State: AOAM531q7bAvNPSQUK0y0DQeXTe8jHII9LAZIEfF1G/S+D/J+Cc5ypVa
 BzYdxbxv/9KS9r932+VdcQeoRpkhqHL0MdoNvSU=
X-Google-Smtp-Source: ABdhPJyIKnL2YDkKvxCKwzXJwyZC6dY9lDWbPwqfQ8eyLCJ3/VhJ/lgVPZy+N9FPW0B9ZTzzYiMvhfFtTXNzE36gm+Q=
X-Received: by 2002:aa7:c74e:: with SMTP id c14mr43990778eds.40.1626819847757; 
 Tue, 20 Jul 2021 15:24:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210719170506.13539-1-viktor.prutyanov@phystech.edu>
 <20210719170506.13539-2-viktor.prutyanov@phystech.edu>
In-Reply-To: <20210719170506.13539-2-viktor.prutyanov@phystech.edu>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 21 Jul 2021 00:23:56 +0200
Message-ID: <CAFBinCAv6aF31GJxp7HUq0KXXEppdNx1Z4T=zA1KeH4cEovuTg@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] media: rc: meson-ir-tx: document device tree
 bindings
To: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc: sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org, 
 khilman@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 jbrunet@baylibre.com, 
 linux-media <linux-media@vger.kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, rockosov@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_152409_643381_87A20AF7 
X-CRM114-Status: UNSURE (   8.42  )
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

Hi Viktor,

thanks for your work!

On Mon, Jul 19, 2021 at 7:05 PM Viktor Prutyanov
<viktor.prutyanov@phystech.edu> wrote:
>
> This patch adds binding documentation for the IR transmitter
> available in Amlogic Meson SoCs.
>
> Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
