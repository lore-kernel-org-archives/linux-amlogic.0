Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0D0C64EC4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 11:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Po+ZQShSUBvhBgO0Sppi4ix4D9HDRWQMBcE56Piy99g=; b=TG/G/5dd0E21J3
	uIyrOsn+mU6sPAfIh2z4tWSRg16n1NxoYPDmFjEeBUPIWEr59W4fEbPl//gbbG17lf3NkdUocfUTe
	IZqlClhjCyuZZQ5hVAmfxBuoaeuzskKS01EKbPtPQyLTHY6BOQsbiJUDT8NSOI1Z56JsYhdbtTUar
	MovxYsbEviLCANWU04n1vvyLS+l4zSdDSwG5KtTnh4rmINxtBOS0S4Ed8zRCAlJ/IgjybY/3JMT7S
	SgPh/ROkjxikBgfyRLyXCLSWeBWoahU2EhVuHWq5Pt5IPDbVw+mNrkrfL5/61P3ZwUX64aw53rQ82
	cd6VDFPn62G7Kk7Hm6DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEVl-009XWH-Q7; Thu, 09 Mar 2023 11:32:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEJw-009Quy-Sv
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 11:20:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=d1j71K7wfOiFcBlHogpxmlMQtkDBn+laXr/H/G+Ik19Du//9HJVuQLYxE4T0XyLQsdunRK
	p4XNZea43wFcmre2CnFmBK+PD9tJ4RAhAPv1vrYHRxd5Gtut38IuNETv6I3qmXUKwpgB+s
	zKB1OrHYCWHnW7my++RYp3Y6W6OTaw0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-GJFlo_6wNFO3csuYdMxBQg-1; Thu, 09 Mar 2023 06:20:26 -0500
X-MC-Unique: GJFlo_6wNFO3csuYdMxBQg-1
Received: by mail-wm1-f69.google.com with SMTP id j32-20020a05600c1c2000b003e9bdf02c9fso2242865wms.6
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 03:20:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360825;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=MbNdLnCjXgsuK154GjMJKhwFFWrI7uD/PgUobY3M0NRDREv9tLDTeYW1M0Kr5nNMOG
         Im8iZ4PMCKTVJAoxJaC4rBmHAueJdeOQk7/b9ia5ielaPiEEMQS+mXlTYbXc55sP75JX
         KAYhuM7hT8gcOoVaefWd2QlH9+jzdz8utBy9U07YXDTAoFqqF2sjkZNZql/XBxSnYJCX
         w9LyHJt2CvZzBX1Ha9tCXzYsqmZWYoDFGyozgEt9V5A+bRJQPOo4iPyeatS5qVLwdkPq
         YjZO48KbTMu9j9UxAOWHW4o5SADjsn43kGIY86Dns0bALdkYF+dy1uxNzqiN9XMOWP19
         2RlQ==
X-Gm-Message-State: AO0yUKVbqGwgDiPqxCqkNSsqVp6Fo8H6y8+qQodsA469eMYmZV0Nw7lA
	XtzY2yC05N+LFFTqJmmjm1MKYTi/jvwq8oVxc2OSD/yV+hTdfP1rrzILCLMJVLYkOa4Gtp3o+Hk
	Kc70ZBtckfP22rFAj6pHZOx/1B8uvHo0=
X-Received: by 2002:adf:e711:0:b0:2c7:40f6:d7fe with SMTP id c17-20020adfe711000000b002c740f6d7femr14224823wrm.64.1678360825571;
        Thu, 09 Mar 2023 03:20:25 -0800 (PST)
X-Google-Smtp-Source: AK7set9k96PNTBUz0TEByIG7gapEmsch0cL8AOD17b63GFBK4F6QUKC1zqFtEdtv5cA4DKM8r6l/1w==
X-Received: by 2002:adf:e711:0:b0:2c7:40f6:d7fe with SMTP id c17-20020adfe711000000b002c740f6d7femr14224778wrm.64.1678360825289;
        Thu, 09 Mar 2023 03:20:25 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id w12-20020a5d608c000000b002c552c6c8c2sm17742706wrt.87.2023.03.09.03.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:20:25 -0800 (PST)
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
Cc: dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 05/22] drm/atmel-hlcdc: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-6-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-6-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:20:24 +0100
Message-ID: <87pm9icgsn.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_032029_023931_E0858959 
X-CRM114-Status: UNSURE (   6.56  )
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
