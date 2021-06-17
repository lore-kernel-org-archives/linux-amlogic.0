Return-Path: <SRS0=pHk5=LL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C51C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 22:24:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60BF561209
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 22:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60BF561209
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rcWENC/AxlwZYRA0jJ2nodpCpFL+vXgrP+zuk305Q5M=; b=ovfwHqIzS/6kde
	jAsvW+HO34qMaCwRQdnn+l3la+vr3VseR8T4V407PkB6ClgsytnvsftHYPp9Ib+fSrTzfYR5lXBk8
	PSpYqiQtGv1bs5qv4lx5Lgv3kf10mUW6H3WPn6GFicMu0+7DSggbe1/hdq1HVAIawMknurnrFMvac
	bvOWgJQ1NmCCK8QIshtEPDv6+S6jKHb1vnja89bnfgpKk3MCXCXFPbSgIDiZtp1u2fAIjbLLmsbPv
	GFe7NuDOxqL0wxIKfxXBasRbF7bPfD5h1/5LgZdtNisCzNnMRFgyg8kt1QMTypXxLqgW955iWbYp4
	rYGcBmLyu6x90RXQSdHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu0RN-00BxEK-UD; Thu, 17 Jun 2021 22:24:49 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu0RB-00BxCL-9T; Thu, 17 Jun 2021 22:24:38 +0000
Received: by mail-ej1-x633.google.com with SMTP id g20so12610355ejt.0;
 Thu, 17 Jun 2021 15:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T50KbAThdeevR6uB4Id+cbtEC5Z15njRViPF/2u5PCs=;
 b=Qkg/tIGdoJHarCmVrz02bhylDw6IuiZyhNKw+H0gSWcHJRB/YG0gHleAptmrer6rSV
 /hv9Y94OKoq4xycsRpuyRMdw4rpHsEGT/RRgrL7Oyksd+V4hkhKtEVND6fjMxhoP/b+e
 3Gl18bAkR13OPvp3GQ8tO/Fsm2pEKt7ykqz15UL5YyE3UNQH3U9kcJ4o3ai4b6h0zlZ8
 PyJbwvWNWn2g4X5AaHJ4MBE/Cnx3U2Ss3uCGOqiCX6peFidW/kx84GagopBeZFwCXMGm
 ceX1RdcIM4zIhsW1fGEJt1pSvfK4+CJsG3yy8TsVBO1JRvOAlp5llXGFmPXkDPEmvROv
 jTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T50KbAThdeevR6uB4Id+cbtEC5Z15njRViPF/2u5PCs=;
 b=teRLzPLVJDqtF/0II23eKYa/zTfO051Ky/mPUHi/PBXvMDLZJhyfdqnq4f65qyL/0l
 FWmZeSJe233Ck+LavHdPuj/fcFXK7WIEs48HgBAceGFhkAHUGVHmMf4gJaxx1eMRYJ5a
 6xqGFsha6Tcxe4iRSMYDTM554fpqLMVkCHx+LztlV3IySNj8YyO3Vv2LGB4av/WNlej6
 VxusyDOY0niodO5S5YZB0F84ZHSX3VGdVTDSCKCnyTudhF6szUxp1CCPFmwE+v5XSIQt
 hUvLBoLy0jkmkgH005NBFGtYbxGyX8BiEqidqalcVnRXVGK6EJkxb4kzOYELo3XTbVq5
 ZyuQ==
X-Gm-Message-State: AOAM533Eu9gQppX0ndZRu6qT5gGJUQDJlnxQIXi5dJrJ3x84YEdWFxbR
 hp/LACfqGLCYM/MCFiqLIeW47uzI4Rh9gWrmDka/kNY5c10=
X-Google-Smtp-Source: ABdhPJwrZod3kcnlN/pabK+bk5akynewCBmBuwQ8at429BZSEKzc0v/foDCSUvXSgXNf79VWmHNi7NTa+NIqa0VBSKQ=
X-Received: by 2002:a17:906:2c52:: with SMTP id
 f18mr7610434ejh.258.1623968675568; 
 Thu, 17 Jun 2021 15:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210617194154.2397-1-linux.amoon@gmail.com>
 <20210617194154.2397-7-linux.amoon@gmail.com>
In-Reply-To: <20210617194154.2397-7-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 18 Jun 2021 00:24:24 +0200
Message-ID: <CAFBinCCE+6G7QtDoxfbcZVVRf-MDX-epSo=_k_PJZgWX+_Whvg@mail.gmail.com>
Subject: Re: [RFCv1 6/8] phy: amlogic: meson8b-usb2: Use phy reset callback
 function
To: Anand Moon <linux.amoon@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_152437_394628_DA056229 
X-CRM114-Status: GOOD (  11.14  )
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

On Thu, Jun 17, 2021 at 9:44 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> +static int phy_meson8b_usb2_reset(struct phy *phy)
> +{
> +       struct phy_meson8b_usb2_priv *priv = phy_get_drvdata(phy);
> +       int ret;
> +
> +       if (priv->is_enabled) {
> +               ret = reset_control_reset(priv->reset);
> +               if (ret) {
> +                       dev_err(&phy->dev, "Failed to trigger USB reset\n");
> +                       return ret;
> +               }
> +       }
> +
> +       return 0;
> +}
will this reset change the register values back to some kind of default?
If it does then we're not re-applying our desired register values
afterwards - which is probably asking for trouble.

For shared resets (like the one we have here) reset_control_reset will
only trigger the reset line once until all drivers using that reset
line are unloaded.
So effectively this new phy_ops.reset callback will be a no-op.

[...]
> -       priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
> +       priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, "phy");
I think this breaks compatibility with existing .dtbs and our
dt-bindings (as we're not documenting a "reset-names" property).
What is the goal of this one?


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
