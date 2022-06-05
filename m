Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CB7C433EF
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Jun 2022 22:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqgCfx7wavisDfTgNpqqucIZEw6J9MHABOUzGpQ/IaU=; b=rKqbImOKTzC1dm
	E5sWLANYpjHsM/ed/F1dAAykQ2/Pt8TmqkS6Op1nkNNmmBT7q04A7l5KxcO28qzLIDzBuESO45FOw
	RWqvpWwXOaKm/oMU+dY22GbRnYS53SDeJRN6ElLxQRX+fqeoCbhNz2MGmNkz6jTI4BY+qalf6sUxz
	AyTIyAdq4YZIJ4jQ/dF1FwPAqaq4YVxvv4M2sf1NoXtX/qDW43f15pzbZrF1WqZORRSqlNeHXRocw
	oIs6rSr/tzVmFUDopjVkUIgYCPV1PTGg1d8aqz6e5XVAvrESqWDhZYpZWNmFbtOU/cL+4mUn7UipN
	xpH0VCMH8XwZX+Q8/ElQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxyOx-00FWWz-1J; Sun, 05 Jun 2022 22:07:15 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxyOu-00FWW0-BI; Sun, 05 Jun 2022 22:07:13 +0000
Received: by mail-ej1-x62c.google.com with SMTP id h23so14572487ejj.12;
        Sun, 05 Jun 2022 15:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EvdrzNnwpDnDn9YN3OQw+McxNhWHrslS9QPN5TMLp4w=;
        b=jvBhc6+k40HESfBa2/kHjiPXNsmhn9RWusQQuekRCoRpZQxLjI+/bUUbQl40oGkXNZ
         DDlDD3Kts3OXg3AmYrDeujl79CfM+aMVcarycdisbklXcuz9M6WyPexFrr+ZQMwsJ7fn
         dYHoHaT6aA2SCKYliWMEXzOsKPHOWWDi99Y6hRp5dv1oHYwcBWUEXQlnm+bbcGdQQLZH
         LV2qZDFjXplNKazciGbp3xseWSxXEVDm6+uGpG8oJEcAMulX+6vxNeX0qqBb+3f0vEKP
         okp7x7oGotXEuPMC3aAd5a+4/PqZ12tcenMvg6drAosssBmSjmuhpmp/86uuoPdeDk2c
         QyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EvdrzNnwpDnDn9YN3OQw+McxNhWHrslS9QPN5TMLp4w=;
        b=1Elzd4TqOEklN+RFHG6NnGW5XwrJvksh/6C5G5CSWwlULQedajhOKcC9RvAPUjFqWK
         YyFUlf+zJgW2Je2/MEHc4aNCN6hfaXjs8WiTjkDWOdIrGPfi1tnS6gJLUwSLhBw6NHbl
         KqBDCyvCdAxJBkNLGlYoqeFscRq5EXEKlrWhaKUI7lkc4bluBH3uaOoIkef25xiXSQ/S
         GfN3/b8G0ufiFl0Rtf/17wDVu5XwgDdCZvjPzEKkn8pOVOE8klVkCHS/yQ2KIvxsJ+cZ
         AFv490SD5HmOKwwRWYD/KTqWwfd/n4JPH+NWEfRQ+hfnwBkNjjRc+e6H8eAFtYVPLamJ
         JHAA==
X-Gm-Message-State: AOAM530QeFJ+EC1WMQKzCJvn3M/7fe2QR8VIrm0WStdmhkjKOL6/3Kcu
	Am/QF9q0kKdxhYW6BHcqYv+7JLJc5bWh2ILZlBU=
X-Google-Smtp-Source: ABdhPJyum2q6NTjWpptCxZaYoHpCsIXUQommOK3UQGv2TUoY11eOyZCV12TIf8OGUqFO9UJM26QCVQsp7K7VJczHj2I=
X-Received: by 2002:a17:907:1b19:b0:6f0:1022:1430 with SMTP id
 mp25-20020a1709071b1900b006f010221430mr19174262ejc.13.1654466831106; Sun, 05
 Jun 2022 15:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220601033927.47814-1-linmq006@gmail.com> <20220601033927.47814-3-linmq006@gmail.com>
In-Reply-To: <20220601033927.47814-3-linmq006@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 6 Jun 2022 00:07:00 +0200
Message-ID: <CAFBinCCS2ypuv8jWCyhTVruGJTUfq394CySDDaXExHq4R526rQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/meson: encoder_hdmi: Fix refcount leak in meson_encoder_hdmi_init
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_150712_445136_B65D0CEE 
X-CRM114-Status: GOOD (  11.01  )
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

thank you for working on this!

On Wed, Jun 1, 2022 at 5:40 AM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> of_graph_get_remote_node() returns remote device nodepointer with
> refcount incremented, we should use of_node_put() on it when done.
> Add missing of_node_put() to avoid refcount leak.
>
> Fixes: e67f6037ae1b ("drm/meson: split out encoder from meson_dw_hdmi")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Note to self: at first I thought the following code needs to be changed as well:
  notifier = cec_notifier_conn_register(&pdev->dev, NULL, &conn_info);
  if (!notifier)
    return -ENOMEM;
But a few lines before this we already have:
of_node_put(remote);
Meaning: this patch is fine as is.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
