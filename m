Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C241DC43334
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Jun 2022 22:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OGJTxl5Dx3d+rA+ZzvqWs+iccQCuSpQWV40QvVh3aMM=; b=QWVyMxCiXMnxAM
	Th8VgnS585ybK7S5VY6kG12JUMAm7BGrCdD62A0pQ6UXWgoJ0mQHQUQd8LKYXdomIroLOyxXbLbgY
	sB31q7uaiNBaAS0PubP+MEepa0RsUALBDrmz9P1WqbRvcZWYtGDTxgwYTv53vJbk882wqAXLp3lVf
	UmPf2TB2y/8WJEVMBNziqT0G6LX9ZxRJLZNZfDbsww/Sc0ud5D5081a9xpjnSYh9acJ0YyzWU4J0a
	DwixwYZStKJnCmZJ/4VTYO5ekkxwB9KFGvyGW9tHDm1mVn2j4CM4b+vfxP7oGRBDJ3J27174vsX8w
	MIr5gEHtsauwukXSidwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxyKl-00FVii-RE; Sun, 05 Jun 2022 22:02:55 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxyKi-00FVhE-Np; Sun, 05 Jun 2022 22:02:53 +0000
Received: by mail-ej1-x62c.google.com with SMTP id m20so25599382ejj.10;
        Sun, 05 Jun 2022 15:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zt9GSJY6oHFpCzwgjAcBrGgFRTLh7TnEuClTteoy+qI=;
        b=fD8XxZY1UodhyOBn79r1tZ+Q0MT0UQOxYmKuwWu9STl2WERhDyPRlrW76bSrHbR0p8
         h2jIOQMEfKo943/CfW+W7qD3jgv8tlDwjC38Z1qyfiROdPyldOBURnJyTjq+0wFyEQOv
         ZOymioOaqVofr8QXjy5bYg0FEnQs8GYNYYIlsIkqVeYAUXLIRFsmX/DXdu41cZy60tvx
         nqI9VHkEHq1z4KTzZ8pKcWGAa8ctpadE/cjcK3VZSw2YGKVjZAmRhoRlQ4FjZNlRYuq5
         1WxPCDQd8EDwxH/hZFWu2q0o7VouN3IK6vpONMII7jLb5dcT+6YyJJVv/6F5DKewRHt0
         GFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zt9GSJY6oHFpCzwgjAcBrGgFRTLh7TnEuClTteoy+qI=;
        b=eOA+x5MKy2iuVi5w+pm8RP0DbUCd33zCNLSxCIWyfcvxCQ9KTfYZXsE9VI43S77V+N
         WazRUVbBhl2VuaVh+JEQctN4c3PRBrfaIRz406ofVy61NfDwmwnJ97ymTHxP8GoGDxVt
         ZbPXDgdDTx3pD7GxBy7gMWSvsCefSj2ZfpcspJAo36PALi/SpZAt/3da0G+nLQpPRt7u
         cgrGUg++5Y/rlycgMd06x3iqNMfmG+ODXfmLRvWlGWBXaa8zzHKzdQhUpAvA2h1ljOMn
         8RfYbKDA6GepM9zK8DiZhdGrxmGcBWvL880WjxIGMOkNVtFUJaRWHTNxg/UZ9QF7+58K
         /eAw==
X-Gm-Message-State: AOAM531aefjwgyFwy64OPGXjApk7wQnz0MiqORHzkssQ1PYd24PC/JKw
	8QBltTjyIKY9/2PnVHcSeYX9wa1jKKRTOOEyGio=
X-Google-Smtp-Source: ABdhPJwPw8jFhUlGOroYyzAMGOrWBCkJypBlZn//O+7ZtQdDWM0D6LpkEi2VMyUEjPbLEZCd+AQhTQeVLI3Q18ByDY0=
X-Received: by 2002:a17:906:b18e:b0:710:26db:7a53 with SMTP id
 w14-20020a170906b18e00b0071026db7a53mr10185146ejy.290.1654466568353; Sun, 05
 Jun 2022 15:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220601033927.47814-1-linmq006@gmail.com> <20220601033927.47814-2-linmq006@gmail.com>
In-Reply-To: <20220601033927.47814-2-linmq006@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 6 Jun 2022 00:02:37 +0200
Message-ID: <CAFBinCAkdRrk+EcZvFFiGEU3r9QtKfxYEPgpkn-HtRmBdwRSmA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/meson: encoder_cvbs: Fix refcount leak in meson_encoder_cvbs_init
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_150252_812364_29D7D548 
X-CRM114-Status: GOOD (  10.81  )
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

thank you for your patch!

On Wed, Jun 1, 2022 at 5:39 AM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> of_graph_get_remote_node() returns remote device nodepointer with
> refcount incremented, we should use of_node_put() on it when done.
> Add missing of_node_put() to avoid refcount leak.
>
> Fixes: 318ba02cd8a8 ("drm/meson: encoder_cvbs: switch to bridge with ATTACH_NO_CONNECTOR")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
As far as I can tell this patch is identical to the one from v1.
Please keep my Reviewed-by from the previous version in case nothing
has changed for this specific patch:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
