Return-Path: <SRS0=WmWE=PD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961C3C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Oct 2021 22:07:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C1E36058D
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Oct 2021 22:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C1E36058D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BD0C6kIp6LjohuGMgPvMskGjzOiKy7/O9aeFa5+kfT4=; b=zqk52AOwAMIEJz
	rVa/mqPcT+TutiB9fKkGjkBhOpDFeG2A1Qq8qFlYvR4CXchfqyxrS0CVyGCm5tw1cUJ9P6GS59Q4E
	FkU3Kf7lZhmpwZhC/m2bpaYjqv2cF2Y5Qg4Aj+ysFGjOM4rxCZZ4Gk+9ntszyO8Igi13Upwu+Nu1p
	PAvJ26D6ZUC8rDx/IFRj5mg1nSqBe4tuSQ8yYOv3Bn5Ob170I+7P0KsjEeiy4m3x3x/AwQ5kcLmAE
	cyvS5gCUZ7n8i4+EM0RGo+d9AEIMWP9tjnwvnO1M2dfm2xjNOqZgbgD8eMqv2+c5sFirHrypxevvv
	L7+55ZjhlpdW7uYdC/lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbVMH-008uzX-Td; Fri, 15 Oct 2021 22:07:21 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbVMF-008uyz-7o; Fri, 15 Oct 2021 22:07:20 +0000
Received: by mail-ed1-x52e.google.com with SMTP id y12so44996109eda.4;
 Fri, 15 Oct 2021 15:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KEPuILzn8A/tb4FgOT0nL/Q0aVprlx+TzeMfH0xSkng=;
 b=ItI+9yo9glXHT4IvBd+1RhAfsc5PnfbvkeLAGL38PcdKsXZ0kscSOA0bux1h24L5AJ
 R9R923qh5I98RpB26cp7oC8SgLgt1VkEEMJ9v5mrRWLB1BeDwW6nscU9ilENcIYSxyFR
 l2TYYmwAaRLibcHsp/u7Xxl6vz6eI4BCJROzsYU+NAe8Dwf/SOSko4OM57bipfymsKl7
 8LHRUcAlVr/YJb0tQpfu1BQjLPZM9X+9chhaob3Um5k9LGik3zZIiHquzNUWrpSIxi9o
 fYAHJ4eVoB+YkbDPLh5p/XlwO8l6U1zuZXxM05N13qkTxXFg0p1oGGvGUDgxLspsPxLx
 EwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KEPuILzn8A/tb4FgOT0nL/Q0aVprlx+TzeMfH0xSkng=;
 b=1+4lzIQd7ah7H2biLNlGyHiVlhdKBYAtqsh1B8sfoZ7rfAf0XySOOWjnsShQCm46vm
 +UdExDsGQisfPC4jpik8rHXolNsLlT4nAPRkUUQSXjHj6+tDQaFuJioh+pNqsFSTaZ5O
 1lycaRMhgQ8nf2EVJjZ5HCjPE8QpvnwPoOGZn+N/uZ5vjPgLSQnNRJx6LxvR1xTYOTZJ
 8kwnur5pBcYQNFW4vALp1mMODayEaGiC7kwqaOaVVsrtmbxMsqBoFg8R740YCR73GI5A
 XV+O5zlRKz6oCYHLCHLYLZYpCOkK4UwUWjpRcuq1UJVzf8aFCSG85NmCRkPZCAEuCJF4
 J4aA==
X-Gm-Message-State: AOAM53353w0XJhuxNPVKIG/Qbl0duwsZ9KJ+knr9+MK7eZg+plt0V0Jz
 Iw0C8ydqjOHDQfeSsa9FDqmnnGf19F6892Njoz0=
X-Google-Smtp-Source: ABdhPJz1ai8dR1OFBDh7IzSW9u4hxzvcUqM2tgq5qQyCsHsN1/wnXC4Qz2Hcy2NMTPIAjsBrcoY7rEAFdcOFm9FB9KQ=
X-Received: by 2002:aa7:cb41:: with SMTP id w1mr21546574edt.327.1634335634903; 
 Fri, 15 Oct 2021 15:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211015141107.2430800-1-narmstrong@baylibre.com>
 <20211015141107.2430800-5-narmstrong@baylibre.com>
In-Reply-To: <20211015141107.2430800-5-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 16 Oct 2021 00:07:04 +0200
Message-ID: <CAFBinCB_Z+errWL4C-K3WrPu2B7gxr3NRFsF3_Xoy48XDsOb-A@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] drm/meson: encoder_hdmi: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_150719_323041_B2F5F945 
X-CRM114-Status: GOOD (  16.41  )
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

Hi Neil,

On Fri, Oct 15, 2021 at 4:11 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This implements the necessary change to no more use the embedded
> connector in dw-hdmi and use the dedicated bridge connector driver
> by passing DRM_BRIDGE_ATTACH_NO_CONNECTOR to the bridge attach call.
>
> The necessary connector properties are added to handle the same
> functionalities as the embedded dw-hdmi connector, i.e. the HDR
> metadata, the CEC notifier & other flags.
>
> The dw-hdmi output_port is set to 1 in order to look for a connector
> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
another great piece which helps a lot with HDMI support for the 32-bit SoCs!
I have one question below - but regardless of the answer there this gets my:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> +       pdev = of_find_device_by_node(remote);
I am wondering if we should use something like:
    encoder_hdmi->cec_notifier_pdev

> +       if (pdev) {
> +               struct cec_connector_info conn_info;
> +               struct cec_notifier *notifier;
> +
> +               cec_fill_conn_info_from_drm(&conn_info, meson_encoder_hdmi->connector);
> +
> +               notifier = cec_notifier_conn_register(&pdev->dev, NULL, &conn_info);
> +               if (!notifier)
> +                       return -ENOMEM;
> +
> +               meson_encoder_hdmi->cec_notifier = notifier;
> +       }
and then move this logic to meson_encoder_hdmi_attach()
This would be important if .detach() and .attach() can be called
multiple times (for example during suspend and resume). But I am not
sure if that's a supported use-case.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
