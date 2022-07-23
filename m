Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9882CCA489
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Jul 2022 20:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K1jGhJkw/MB2/p0rFM+YR1LziEHUCgwpCsQ7UyHB7Io=; b=BhajXq2RQ1aH/t
	jJJ+UY+jKWZDC9taEJ4pwsGGQlRslrUjyxeApvE4rsKux8QrISkoDRVh48o2E5vmnyyZ+QwhHEawZ
	7MJr7htdGYqEcpnKBBdBCEv05E5h6MHph87PmO0K52Qwn892FD87zldferuyL2wSBDH1O6DCs61pS
	gJgAsON8szAeQZ7gJupZ3FvYGrQ3+B305CqIswKJVvn9h6SqPrdWX6hLqJ0tL3JHK518L4nK1Nb+3
	PeivSV2mMWtx3rxAmpSAmlW+XsIiLHnMR6BwVQO1ra+HW8AoScE5Gib3boXvdZbvdfKI/WaCIaN7r
	QSw31odxgMa92qQ65yPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFLNd-006uQ1-KP; Sat, 23 Jul 2022 20:05:41 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFLNZ-006uNe-DL; Sat, 23 Jul 2022 20:05:38 +0000
Received: by mail-yb1-xb33.google.com with SMTP id e69so13439934ybh.2;
        Sat, 23 Jul 2022 13:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yxNqH7s5Rz3f+v8fqZj0/vCjFEHibCyuheCPD/aW+oc=;
        b=odGY58M7k02VmCGnlbzb6wQjEKIYUFnVmy2rwX+qvUhwTVmwJWICAz24VjhNAtp1cA
         k+KW5HZKFbSMLIlWLUJWqWJoaxtz626DBDiomWuhZ7sKIVYt4EPyfYtHQhmIsr/m2/ci
         oF8OVOuZhXZssrKtgQgpa1LinxENJTd0kA7FJEGzDSk6RnXwmuLnmQdXNwCMgqIFFqPk
         WB1c1tGDCLqRRXtlpq/lsqdXXzzIVwlM5kDlfVZaRROJC1lbq2okiGFlYtAP4nkQJgdF
         AxhrxznwkD3f0q1eHPoVp4YILARvlsW/8vRkZpa/dROu6Ycq6HWutya5L28jV8NIE8qi
         OgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yxNqH7s5Rz3f+v8fqZj0/vCjFEHibCyuheCPD/aW+oc=;
        b=NzJG4Ssm3jVbdNiiWLS1qrFk4NwAdbPJymenbu/95GzMKVLKlWqsMV/uwsMQQu7L5W
         0L7FHf23G9lPd2+rG+h5nmbtYdA/MBwld5e/LVwkDaYBUHqn2e9nOmiqyN0MWcI5f0G8
         SUpHvF8/QOfiHUHorrO9WwWbfbNyFNUHz/zfgy/plHD5Hv4ptV+Wc9Gxnw1znLOLUR6y
         1WgGkVCurSuIZKcYuBzAtf6d3kv/S/XChk+vA5pOo0NNN5zLSkacFywh0OsS15tOM9sr
         J1klQlvueqDFiLWs6ovxOovTOn1BysHu9WWRyhnBwNJr2vbK5h1WOQnKxLQphDoIRmZT
         +U/A==
X-Gm-Message-State: AJIora/saxWFN0Yn4qOiUgBHwI9GqTZYw3iFl5wWOL70dbj/IA/no5cp
	UFYbZN81T5abyNnTBRSxcw+bPDn98iRhDAr7j+g=
X-Google-Smtp-Source: AGRyM1vLCkmGrcMHJaxHg/n2nhWnQXycKco5363dXL+UeKBCQNmA+xRseVB5Ovlzd0ug/SCzIq3qTAJGMLgwA1WNB3Q=
X-Received: by 2002:a25:808c:0:b0:670:7d94:f2a with SMTP id
 n12-20020a25808c000000b006707d940f2amr4663495ybk.452.1658606735407; Sat, 23
 Jul 2022 13:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220723155502.127404-1-zhangn1985@qq.com> <tencent_ED01C585DBD86EFB91CD8074FB0460C3BA06@qq.com>
In-Reply-To: <tencent_ED01C585DBD86EFB91CD8074FB0460C3BA06@qq.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 23 Jul 2022 22:05:24 +0200
Message-ID: <CAFBinCATO6YPrZDpV4fyso0ReESSOGFzw0tk=KRfYZaXJMvDNg@mail.gmail.com>
Subject: Re: [PATCH 2/2] rc/keymap: add keymap for MagicBox M16S
To: Zhang Ning <zhangn1985@qq.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, sean@mess.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-media <linux-media@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_130537_487273_D0A8EAE3 
X-CRM114-Status: GOOD (  12.60  )
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

first of all: thank you for your patches!

On Sat, Jul 23, 2022 at 5:56 PM Zhang Ning <zhangn1985@qq.com> wrote:
>
I am not sure if the media subsystem requires it but most subsystem
maintainers want a description here.
See for example commit 7bb53f361c59b ("media: rc: add keymap for Tanix
TX5 max remote") which has been accepted previously.

> Signed-off-by: Zhang Ning <zhangn1985@qq.com>
> ---
>  .../dts/amlogic/meson-gxm-magicbox-m16s.dts   |  4 ++
This should be part of the .dts patch (patch #1)

>  drivers/media/rc/keymaps/Makefile             |  1 +
>  drivers/media/rc/keymaps/rc-magicbox.c        | 55 +++++++++++++++++++
>  include/media/rc-map.h                        |  1 +
Additionally we need a dt-bindings patch so the new value is
recognized by the .dts validation.
See commit d2fccf94495e57 ("media: dt-bindings: media: add new rc map
name") for an example.
dt-binding patches typically go first in the series.

[...]
> +static struct rc_map_table magicbox[] = {
> +       { 40791, KEY_POWER },
> +       { 40842, KEY_MUTE }, // M
> +
> +       { 40771, KEY_UP },
> +       { 40714, KEY_DOWN },
> +       { 40710, KEY_LEFT },
> +       { 40718, KEY_RIGHT },
> +       { 40706, KEY_OK },
> +
> +       { 40775, KEY_HOME },
> +       { 40783, KEY_BACK },
> +       { 40726, KEY_MENU },
> +
> +       { 40959, KEY_VOLUMEDOWN },
> +       { 40797, KEY_VOLUMEUP },
I checked a few other keymaps and they're using hex values for the key code.
That said, I am not familiar with the keymap code, so let's see what
the media maintainers think.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
