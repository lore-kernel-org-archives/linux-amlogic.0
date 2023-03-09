Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27796C61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 11:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Po+ZQShSUBvhBgO0Sppi4ix4D9HDRWQMBcE56Piy99g=; b=ghej9VnFGP46gQ
	9fYkxpsfagPV3XBmNDpY7sr5tSlYdtIwnTusKOB113yYNUj8P/sSqBFvjWoJvLiXiXEDyrg+Gekif
	Sg7ecVwnFaeMTh6bOWBtuIIktQTU4e1/c6gcEYLKc5vhCwiVstsltHCqSZiPWbUGeh4UZHDyjmCIy
	TfEpiqXyrhg0kb2SORK1cgKcBXRH53ECUMgbzzK8nPE6S+26J6+sYEgPg8Qtr4p1me36Jkg2O61kO
	YTNqn/qF0JbJa0cQYwvQX3ap5YnaCkI8JlpSj36CkPgoFJ9/ejoOTSecr45HQXHZphPkraVZfQvli
	G7CBOeh46izSJZTresMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEnF-009fc1-HP; Thu, 09 Mar 2023 11:50:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paERx-009VR9-Al
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 11:28:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=Y0w9WY0anRnaOp5s5PVvSnqnK0gUmSfQDPj5w7KRjHBA9isrVwZCevt0G13wpgMz5zKWs5
	u+hrjU8ksyk/DJxBACl24ZHXKRoZltK9pOdOjn3sn/zpPvvhNsdYIwAXpYnd41d/Vy6yBa
	xTqWMM3TgbGklMK0X2X4eODs1ytlQJk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-402-pP5LQCwaNYOzKy1fBnX-HQ-1; Thu, 09 Mar 2023 06:28:43 -0500
X-MC-Unique: pP5LQCwaNYOzKy1fBnX-HQ-1
Received: by mail-wm1-f72.google.com with SMTP id l23-20020a7bc457000000b003e206cbce8dso545229wmi.7
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 03:28:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361322;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=V9mElMgerge1MNY5L5moWFqjL3XPCviIyoDlvjV9GI/Ih9li33URhKL7UtEVk6rmRe
         zSeVxL14QmR8JhTljEXUwqGEM3A8g/n5ck9m3G3Tfo3THaj31DSifgVqO0arCDRf1+Zr
         bTvxqrvMnQJLL2/MhoXGt9EtAm0qvhxfJNcxv/UWOFFPcsLnhq1Yijb0yESWo0nkTdAt
         12nTiwkWFvanwwaUZQNzKlBkQBj8QF7UWYXYYbCpYkYvK4llouSyPLIlXWzrb69B5h5m
         JE21JXiA8qBoJTvW1YKwBoWwhHFqQFV6XgbuVYIYezj9ceKob5XXMimMqM6aiqMXjbG4
         Hbwg==
X-Gm-Message-State: AO0yUKW1yBBKRhmJfnP2e93YLuybZZTpWcork1uCs93iJghmriioIkff
	UsHGBBis984QX3bLx5im3n+kIV64kLb6czWZS/HH+ftzQq4H3xIqWgFKbbxzIqP5yM8FV+52Hzq
	uSoer5W0bu1YJztMb677h90dYQqzwdsM=
X-Received: by 2002:adf:fb51:0:b0:2ce:7219:42b8 with SMTP id c17-20020adffb51000000b002ce721942b8mr7244752wrs.32.1678361322366;
        Thu, 09 Mar 2023 03:28:42 -0800 (PST)
X-Google-Smtp-Source: AK7set8Mn2JIY54bbfAArMm1jwHLD5d38GNHioh3xaVKkpiDjrBseSSAAHghi7SxByPhaXqMV5nmpg==
X-Received: by 2002:adf:fb51:0:b0:2ce:7219:42b8 with SMTP id c17-20020adffb51000000b002ce721942b8mr7244719wrs.32.1678361322054;
        Thu, 09 Mar 2023 03:28:42 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id c22-20020a7bc856000000b003dc4a47605fsm2372395wml.8.2023.03.09.03.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:28:41 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, andrew@aj.id.au, laurentiu.palcu@oss.nxp.com,
 l.stach@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 p.zabel@pengutronix.de, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, alain.volmat@foss.st.com,
 yannick.fertre@foss.st.com, raphael.gallais-pou@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, jernej.skrabec@gmail.com,
 samuel@sholland.org, jyri.sarha@iki.fi, tomba@kernel.org,
 linus.walleij@linaro.org, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, Thomas Zimmermann
 <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 21/22] drm/vc4: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-22-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-22-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:28:41 +0100
Message-ID: <878rg66u52.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_032845_468274_B9F6E1D3 
X-CRM114-Status: UNSURE (   6.64  )
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use the fbdev emulation that is optimized for DMA helpers. Avoids
> possible shadow buffering and makes the code simpler.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
