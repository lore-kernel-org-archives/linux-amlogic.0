Return-Path: <SRS0=fzDf=J5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FA4C433ED
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 May 2021 23:04:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5092061165
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 May 2021 23:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5092061165
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vNqlpO1ZiOAzuJJXvdImp4usrGK/A6f5PHLiIN/9894=; b=UxFHKG/NCwQkC9x+DSuV8AXai
	OnbBjleFVNnphSR31IfIcvyqeR2bV+OF7EnPxQk7q5z0Vyra1kDjyoRYG+hQtkP77ygQHZMe2SwKl
	nKaincvs9gq15R8/d2x/JcHys4PUM5aBVw6OaA4V0bxy/UnUtzb44aYPM2kSi1hxpMEmJ/+Aq81IA
	NWWWv77LbCrYWVfku8fSAx5uG6UQ257K+NjkEmSS9pWFzt2eIqVwi4+MIs/m+HEhHNHyTA/ZoH9Xd
	G2qoUpAl6+XXIsvIxmWGCPseCgrcbCtkVx9aVtS4sZYCRx4WTuIyKjTLo6YYUp8xtcntXzgoszLaR
	VMprnSHgw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldL8j-00Cfsr-0e; Sun, 02 May 2021 23:04:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldL8T-00CfrZ-EI; Sun, 02 May 2021 23:04:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=groRywuNlEF2UBp2F0MI+2GBRzz6sWwtdyxWNmpmmRY=; b=r9iM2DzicqzyMX4oIcax5/ud3D
 a9CFiHA4FOwt5lwG3OQnDaEcKG2UtfnUuCv6C4Hb+d2sVOEl5WiyUyjSbjuklla9hoxkzHJHRbDHA
 Cb60tam1etJTPkbLVFppakAJA3mpG698+/UM6hybDaYiGvw9ckkNnfArz6K61vOVPRmoSf57TTMAI
 4bYEUxS4qj2+vcsTfAsE3j2z2uHSNpxmPqnH2C7OzC+rnTa4S0Gli85BipDVRnUzFRR0iWg/I0cxU
 /VoS9B6uimwRXEGrwC6xMqHpbwnEVZ5oiE1RZy3obyEKPuERvOB3qoe/7HHMpYUQ7zVXdhdp2ueg7
 Ua0e2tLA==;
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldL8Q-002iuP-Ov; Sun, 02 May 2021 23:04:24 +0000
Received: by mail-ej1-x636.google.com with SMTP id b25so5202287eju.5;
 Sun, 02 May 2021 16:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=groRywuNlEF2UBp2F0MI+2GBRzz6sWwtdyxWNmpmmRY=;
 b=XlDPMzJXgrzyFIiIUejSgpr8siSc/rwclMr+de4rxvXJsRPZL9PIM7tbmtGascXm2n
 oVfjQqFS/OXhX1J3QXgr8i/yhufjyXvVrdlGN/vjcVPguwxgyCBBbiUitB6idSZy7RtX
 UUXg0ed+ZJF8e0VHN6v5VswddIAOVhHQn5wmXllUoRvnme867D4/+F/pvUAvxN6p+oZh
 tq/H/SyQO6ZaY0wWpnbjLEpfnIy2KdmNZtDaTv/+Sh26sVrQ1xjVoYBhV/Fi8xumHqZd
 TNEsfCmh9XyXZjF/bh8TWZaMAuEEu5P3oDFfhoy9rjHjMSM2abTsLsgPcQoDmxS7IqGR
 DjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=groRywuNlEF2UBp2F0MI+2GBRzz6sWwtdyxWNmpmmRY=;
 b=TDiCjnyxx96na9HSr7WXxhtSnG1D18ME854LYloEujkR0FfYK4fPIRDX/QAasl+b3J
 BkkM6MOFUISEUScANGAENOfoSaq1RWJ94Yr5TaGLiRLdDZkvi8Bt8WhJoxxcCAaSx3/6
 biRVkEmLLzg5YZ5RqQ8+3/tc9h1d57nXg1QGejTYGJXNXHqcjx3clQkpyw/rfJzPmxBU
 lMEO/h2/As0RZ6IVKRqa4SOuptg4G3J45CooImGryKvSpAPDQo6ouD8+yGDZGANsuHqg
 r9gRN0rXNKeXvYcQp5UUWYdpdidTvHXevORGGQLtVS9FeuvAu34atM+LNMyHHWH7o+Hl
 lvPQ==
X-Gm-Message-State: AOAM533lZAKUF5l5yNKxvkthnUgqSKiw6ysvjczHgMva9zy2NI3Bvwy+
 E53x22Qzg0ILFvjy4H3PcnZb1tROP90I6Ls4uCM=
X-Google-Smtp-Source: ABdhPJx+3/RZteOj6iiJHEdVbJAzXt75ZO0LERj7jXAZI+xt67C1ubzHFuEe4f2afzlwisHDLxFMnwvdAptTlOq+hZc=
X-Received: by 2002:a17:906:57c3:: with SMTP id
 u3mr3607793ejr.162.1619996660335; 
 Sun, 02 May 2021 16:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210430082744.3638743-1-narmstrong@baylibre.com>
In-Reply-To: <20210430082744.3638743-1-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 3 May 2021 01:04:09 +0200
Message-ID: <CAFBinCC5piZDgyxezJp8Yi3Ny5B6WRD-XdWN7s2gm8_aqza=fg@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: fix shutdown crash when component not probed
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Stefan Agner <stefan@agner.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210502_160422_829623_F3EAB380 
X-CRM114-Status: GOOD (  11.21  )
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

On Fri, Apr 30, 2021 at 10:28 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> When main component is not probed, by example when the dw-hdmi module is
> not loaded yet or in probe defer, the following crash appears on shutdown:
>
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000038
> ...
> pc : meson_drv_shutdown+0x24/0x50
> lr : platform_drv_shutdown+0x20/0x30
> ...
> Call trace:
> meson_drv_shutdown+0x24/0x50
> platform_drv_shutdown+0x20/0x30
> device_shutdown+0x158/0x360
> kernel_restart_prepare+0x38/0x48
> kernel_restart+0x18/0x68
> __do_sys_reboot+0x224/0x250
> __arm64_sys_reboot+0x24/0x30
> ...
>
> Simply check if the priv struct has been allocated before using it.
>
> Fixes: fa0c16caf3d7 ("drm: meson_drv add shutdown function")
> Reported-by: Stefan Agner <stefan@agner.ch>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
