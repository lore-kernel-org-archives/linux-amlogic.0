Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6450FC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 May 2022 20:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gk831JSDzJmnswv7P6KOp/WGaar7oOJMiMxYrVYDaOg=; b=eJ4bDLyg++T0Z/
	XjXyZcSG54odW8Wt4cIHx6lBtZA0PTl6JNBDe/3groMgJ6dkrLFMMVDmNkgftGoAGgZEDUDP1J21u
	xxSdEOsqd2wFIEYsKoZm4XNIc8+FbHXUHV+upsaHdDEnm8V2uKJygjnQKo+htg1VaDKT2qFrZVbws
	7DKft3G0L3GKYio0nK2Y2YrtrUx+AYlqouO85h4GXXjVvtB3B75KQooc1KDsLOdytHwbuIzn+w5C9
	X09KKj+6ehmpAsUi8pUcVCRm287AOLveqCal+Sx7SJvJp6Oxhz+9KP3MWxdhovxauQ7mid0HkdHLU
	o8blHEyuK5uEzSTWk0mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw85b-00CQSH-Th; Tue, 31 May 2022 20:03:39 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw85Z-00CQRV-D3; Tue, 31 May 2022 20:03:38 +0000
Received: by mail-ed1-x534.google.com with SMTP id n28so10175483edb.9;
        Tue, 31 May 2022 13:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VeXRYquwBdQ1dOZMflf5nsQE+opZ3d34q51TacEF7HA=;
        b=XuZGseWjCdQCUpLS7SWx2X04gT9YVCZqwuF0O3a7BrK7scNXHX2Pml9WwshUdl5VkY
         aIC0pGpDEEEg1XCkAz3YScYnYGWVcrZhAa01mvHgfLyWtgES/O8bj8YwxPaWHWiFG5RH
         JpfoXo7eKL8C7fYzSGLdyfQp7ZXU7EO+3Qd3+Z+mUzaTeCxZNVZ4STp0XazAq2aZ5ohY
         8u51PbmoCd8sbikiANJVhCKkhLhIxyNjPxg4H4aFnAekHmz0TwaXFs22aOt5vetk5pEb
         a7KzE6z0jh43w3F2gnNfMAdv4T/h5fE54520BL7miy3XFym4oBBaf/qG/H8NOhsThB9A
         e1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VeXRYquwBdQ1dOZMflf5nsQE+opZ3d34q51TacEF7HA=;
        b=STzxGgG4RtexpaPyFXqaG0bIH+dN7pztVggWAGRM161TQJ5CdwSo1IGTshMh35Y20c
         LqXPO/+2Tqbg27hvFcFX53GQawx7EoYXfC1P861QACgYFBuOcv7qMbddF86/v2XLWqzX
         cOfNi7l/tAPO1gcoDYLymyH+H2ww5b1/nWm+wm6Ecgq1g3NP9dRAtSTcLp8aLENTopYA
         MNLnQA6FTcsVkz69ilS49D8sAq53tIkOd8s3HP2/VxiSI/6hqyay+WYBJV7Lo8VxA32m
         3th+XePyxZZ97Clvq47nZkctpckyIGO7ih2LFc8I6mbve1Cm4U0Bmu3DsGrSCLUOrtjg
         uIvg==
X-Gm-Message-State: AOAM533WPurKuk7hVymHkayD8YM8PSLwmk0omr553zNmE+d7u8CbO24M
	vAFaOP45vOKLLnNw8kEdw1orXeMdWrA9sZNBKVI=
X-Google-Smtp-Source: ABdhPJwjVOUsvRdeo5FK73NryLg6a7micfi5ToPTE2Sq7rMy5xFF/f8eN3aQLibNcx6ds/c/F7VnYcaMymS5mq+P96A=
X-Received: by 2002:a05:6402:254a:b0:42b:6c9a:c06c with SMTP id
 l10-20020a056402254a00b0042b6c9ac06cmr47415245edb.199.1654027413836; Tue, 31
 May 2022 13:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220531144818.26943-1-linmq006@gmail.com> <20220531144818.26943-2-linmq006@gmail.com>
In-Reply-To: <20220531144818.26943-2-linmq006@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 31 May 2022 22:03:23 +0200
Message-ID: <CAFBinCANaU4Tk42j-GDBWwUDk39_XiCfeu4D9vGFjFc_G4PZGQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/meson: encoder_hdmi: Fix refcount leak in meson_encoder_hdmi_init
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_130337_481933_86056C3C 
X-CRM114-Status: GOOD (  11.92  )
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

first of all: thank you for spotting this and sending a patch!

On Tue, May 31, 2022 at 4:49 PM Miaoqian Lin <linmq006@gmail.com> wrote:
[...]
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 5e306de6f485..f3341458f8b7 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -363,6 +363,7 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
>         }
>
>         meson_encoder_hdmi->next_bridge = of_drm_find_bridge(remote);
> +       of_node_put(remote);
further down in the same function remote is used again:
  pdev = of_find_device_by_node(remote);

My understanding is that we should only use of_node_put() once we
don't need to access the node (in this case the variable is "remote")
anymore.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
