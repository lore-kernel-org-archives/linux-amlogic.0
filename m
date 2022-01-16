Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEA4C433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Jan 2022 23:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U67zMaB5s/J6d/7G5EnU1n6IbgB2brWZGuJ+h5acRfA=; b=KDvilL/c5GCV5W
	d9XLZZ022ZFsjkKoeFUBLhJm+JmkAekp3qwx5Bi3istnY/aSR5qyNdywc26ycPYX7Jaw8IqpJAwAu
	sP8S7ZYlLBQ8fLVUFY6UG/8oGNkGPM/ZiKdQm1RzY6GJsok7n64PVEo+kWgItpSuKYccr2BtUKeNw
	CjX4gg8ZubYSE2sHyESU5iSgofoLzvXm8BKXUyZxaMHxXOXerI84zFFQ2AodLVyQ9DZO91Kr4VOjr
	JCCjqw/K/YX2T/Ms4TOjXETgpB7pmK7RY3cTEHWLR7P6ol2wrDiIRbHMEee0Gonskmnc3iN0tJN07
	Csa7rr9gKyy9w3D88IoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9EX4-00D7d6-5p; Sun, 16 Jan 2022 23:01:54 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9EWs-00D7bL-55; Sun, 16 Jan 2022 23:01:43 +0000
Received: by mail-ed1-x52c.google.com with SMTP id u21so58004763edd.5;
 Sun, 16 Jan 2022 15:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s/Nq4QhxxH6TvASap+JSynns/x7p4+2FE5gYsfa20fQ=;
 b=K0SAKM7Z4RB5TeMm8UCWcpG7HyCwLdHOD0h//vpyIo8FxWNNjKSMKieCg/nzmOXn3J
 kg84rkoOqHCskvcOJE6vse7hBk6l2fr0PblIN4Ry/ekKIpNsgpP1Z1OH6ENIZCDzBYkq
 mYqqT6PYTSoYx+9pKoMevVJhnHEX9yZ6H2/lQuQAAx/ELafyLHGtmozLgQzKtuXzmDVp
 GVWviNuJDUtG0ws0gRKInEZyRQgr+s7xdTOasUHODHuwf74S1qRn+XqVBpI4B+gKGR6n
 /JUu2vmekG89c8sJTI2pvgQu+ep+7auoSB0ZCXkLluBxRn6X2fGDtZs+ob6PjnTKDpSt
 cJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s/Nq4QhxxH6TvASap+JSynns/x7p4+2FE5gYsfa20fQ=;
 b=dwRuHx6TD9GB2P2IVJdAWc/fnYD44l9Xc+5rELCsD6T9f8jumNwhGuXfdKX4ECjQHF
 6VoRJV3wtgl88TNQRmqGXqaQe8sVQN81HRADG2j9QEhk3+X71HjY/l6uPI+83N4Rwqyp
 mL7VJyTI0Z/D3kqaoH4wmPDezxfxa+VUuXl6XKzSasUaPm1QfJSfQhJ0IyOAPK43BZM7
 YI2K0jhRxh9GFiPlvxufhAe+88mrXpb1Oc1Kia9QhYpu9HHSA6egrXVZ8QqZP775S0vK
 63KJ3N4JbRhy1Ei/I1ZSpD0loP+Z+tJwfCx1gOOasCR1piTfwv/T35LGmDg0xosS3/Gg
 ka6w==
X-Gm-Message-State: AOAM531Vd2MlxqFSVXGi7StsyP+L2vTFFP9O+O6DoqN3TlvFs+l6Z+K9
 nyVTfqpj9eFEn+6e9D9NhyiHzAHH0035a3KAQgo=
X-Google-Smtp-Source: ABdhPJzZ7lcIBvR+V7X/PUTXu4n9JFiImkUSOHW8oqJ6w4dOIKb5T3WH1CsLnYZKUTL5JVwOlhWCBkc8/Ml0No92hMI=
X-Received: by 2002:a05:6402:3456:: with SMTP id
 l22mr13804982edc.280.1642374098685; 
 Sun, 16 Jan 2022 15:01:38 -0800 (PST)
MIME-Version: 1.0
References: <tencent_0F8E090AA07050A5857F1E9067E6B9DC0C07@qq.com>
In-Reply-To: <tencent_0F8E090AA07050A5857F1E9067E6B9DC0C07@qq.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 17 Jan 2022 00:01:27 +0100
Message-ID: <CAFBinCDigiSYT+AkRmCgEB6u_v2uJLg49aNrt8ddxq97FkEMxw@mail.gmail.com>
Subject: Re: [PATCH] nvmem: meson-mx-efuse: check the return value of
 devm_kstrdup()
To: xkernel.wang@foxmail.com
Cc: srinivas.kandagatla@linaro.org, Neil Armstrong <narmstrong@baylibre.com>, 
 khilman@baylibre.com, jbrunet@baylibre.com, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_150142_252502_07B864FE 
X-CRM114-Status: UNSURE (   9.93  )
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

Hello,

First of all: thank you for this patch!

On Sun, Jan 16, 2022 at 6:37 AM <xkernel.wang@foxmail.com> wrote:
[...]
> @@ -211,6 +211,9 @@ static int meson_mx_efuse_probe(struct platform_device *pdev)
>
>         efuse->config.name = devm_kstrdup(&pdev->dev, drvdata->name,
>                                           GFP_KERNEL);
> +       if (!efuse->config.name)
> +               return -ENOMEM;
Looking at other drivers and also at drivers/nvmem/core.c I believe
that the whole devm_kstrdup is unnecessary.
Instead I think the code can be simplified as:
    efuse->config.name = drvdata->name;

What do you think?


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
