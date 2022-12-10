Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58FBC4332F
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Dec 2022 20:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NfUii2p7kZOQTuKAMVa0N6do3gaJcYlXXU+r3xYVWmg=; b=Ec7vpNMO2hQZ1o
	ZdCkmRkRZ+f3y1tYVsAlYk8465XhDQsqE1eU13BOxuUnjeFLDsGufmVR87XJYzmn2WCM16eIScrSQ
	zGLq7mn3IBYeK0CBx/Mbd8U4UHqGiaAe2MDhb8h8a4h86+pUNa/P/qxf+A5+QmcHZioK8i1XDd/Yb
	JBj6jERmYcLWT1gHW/A0vGGoNJQFfafmtDYaV+/adSwuSriSo7wMFF0UwwUmb0iwyr/Vqkksa4LRI
	Seh9HR+XVTjM8rUF+/2H/mfcsrvp4QIViq1xcggIidwynxSkFTtWYYLxD2J7W9V1TfLz8WvfXga22
	vYjcwRo5FKJKUNxqlarw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p46l1-005FGb-7s; Sat, 10 Dec 2022 20:47:39 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p46ko-005F81-O1; Sat, 10 Dec 2022 20:47:28 +0000
Received: by mail-qv1-xf31.google.com with SMTP id o12so5564457qvn.3;
        Sat, 10 Dec 2022 12:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CEKDlkVHglW99KqRbYgf1kkkoJ7bs9WkvbGtzTesMCs=;
        b=hwC5B2Bgy2YVuZuCIuWyBobOEB0Fe1BJpWJkSIc4oQwwNvQsHqnsFDkYfFz2xJg/P8
         KyDos3k7Ukf7s5O9TUgyvWEiFEkj48jNTv3JBjNNV73hqsqiQLrriLriz4KkLZDk0dl5
         KwC56ngev8pyOYgI1TwGdv/aQ4JedTsClDKuUpKnjTZs6QfzCgyggCRqIH4tWKI2Waxf
         hU7dZwT8YJYsR6L70zml9KojkBtwJi/hU7NH1JWVNcq3QNhFuJI4JQ3FEjk+mBsnaQ8/
         0RN5lUIhJG/9ePxr6E0U0WJwjQsLRP+UfUUzQ/jivadqgHfFYQmiXTP91rw36oZLjBWy
         u2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CEKDlkVHglW99KqRbYgf1kkkoJ7bs9WkvbGtzTesMCs=;
        b=IrwWgO72b9VzL1ttN3utnrTlX30Dg2yiwU07Kly7W9KgT9TOGev4jmfV1catLp7boW
         7trLxFWbH8TzKTg1qYXb8Qv2Trr3C+/RWiVcII41+qPzWn/w0RAojWIttLB1LLsZK46y
         NWpP1ElF4i1+An9uOKChjtZ2t4UvgQNBL7lfLW4761xFJCvMhffGM05q6Pjvtou2tOfI
         wbawC/aXstBuQsmZRxyiN6T96m8Ha8pUC7m05mODVYB66sS+VDtuvneEUoc7wMomSRn1
         KKNgWJyJ12xkg/1D8W3yPfhD7/tsZbF8MUr3EtJPXBhfxwxKE8BF5IiB/9qpGkfWDzaj
         9DCg==
X-Gm-Message-State: ANoB5pn78L7etuUcmJ2GOVD3nZwytV8lRwjr/RgTxjkKPgfDanyOBlSl
	MVwRXQ0sGwrDtA656VzuXXSGkHD/pV9X4n9z84I=
X-Google-Smtp-Source: AA0mqf4JTJfe7jmmA7m3FjSkVUtgmodjbVf1DUnU0IQstXdpNbVdR2cLfJKeSgJLRqc8cS7xZkvdLPapsgCpdzuloPU=
X-Received: by 2002:a05:6214:c5:b0:4c6:f93f:1cfd with SMTP id
 f5-20020a05621400c500b004c6f93f1cfdmr45555224qvs.35.1670705244513; Sat, 10
 Dec 2022 12:47:24 -0800 (PST)
MIME-Version: 1.0
References: <20221204043530.1673752-1-jiucheng.xu@amlogic.com> <6e0dcfa8-6855-cc80-5e23-443d44cae07b@linaro.org>
In-Reply-To: <6e0dcfa8-6855-cc80-5e23-443d44cae07b@linaro.org>
From: Chris Healy <cphealy@gmail.com>
Date: Sat, 10 Dec 2022 12:47:13 -0800
Message-ID: <CAFXsbZr8yLOy2MnhX2SaCECY38DHcfpS1pOu3tZvt3xNBuH6HQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Add Meson DDR PMU as module
To: neil.armstrong@linaro.org
Cc: Jiucheng Xu <jiucheng.xu@amlogic.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Jianxin Pan <jianxin.pan@amlogic.com>, 
	Kelvin Zhang <kelvin.zhang@amlogic.com>, Chris Healy <healych@amazon.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221210_124726_840507_C0BC8B1A 
X-CRM114-Status: GOOD (  12.63  )
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

On Mon, Dec 5, 2022 at 12:40 AM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> +CC linux-amlogic@lists.infradead.org
>
> On 04/12/2022 05:35, Jiucheng Xu wrote:
> > Add Meson DDR PMU to defconfig so that build errors are caught.
> >
> > Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
> > ---
> >   arch/arm64/configs/defconfig | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index 0b6af3348e79..f2324b54a6ba 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -1265,6 +1265,7 @@ CONFIG_ARM_DMC620_PMU=m
> >   CONFIG_QCOM_L2_PMU=y
> >   CONFIG_QCOM_L3_PMU=y
> >   CONFIG_HISI_PMU=y
> > +CONFIG_MESON_DDR_PMU=m

Given that the other vendor specific PMU counter drivers are being
configured as built-in, perhaps it makes more sense to do the same
with the new MESON DDR PMU driver and also set it to "y"?

> >   CONFIG_NVMEM_IMX_OCOTP=y
> >   CONFIG_NVMEM_IMX_OCOTP_SCU=y
> >   CONFIG_NVMEM_MTK_EFUSE=y
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
