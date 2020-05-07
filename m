Return-Path: <SRS0=qPrc=6V=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 109D0C28CBC
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 May 2020 03:10:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB1EC2075A
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 May 2020 03:10:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K/BIFnJP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB1EC2075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:MIME-Version:In-Reply-To:
	Subject:To:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=wA4sSt9zpPneVcq0bj728Wwy3CbgVfmQoU8bORRxVMs=; b=K/BIFnJPNRhMQj
	qijEByssofuwW4nQbsYlOgfNuNJyTJHds0y/Woy90gz8FpFezbAgBX+rSp7yQz3usnKSTFQHthqIP
	6Ad45kQtBl8TzN90Kb/RMV5QzHu3ne1mmvKwc7suv4ptb3+J3WJijF0W0X1WkYLzgMJzhRbE/jIat
	+y40G/iKWE5dFhR9CMjNFjjdu4kXDDWy0gMxDTdzgb4FltHLNhvI/BZgsOVew3fBxjSEfJOwZrlEG
	V41INK15oBz/F2nIxc6TbtUYCqLmnxVQIy+xLSn8IehQWkEPwp+SvurrUAsI4VwSbtDDbHS0kArvt
	vHwayqgqlovfMHvkiWtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWWvQ-0006MD-VY; Thu, 07 May 2020 03:10:16 +0000
Received: from m176150.mail.qiye.163.com ([59.111.176.150])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWWv6-0003lw-OL
 for linux-amlogic@lists.infradead.org; Thu, 07 May 2020 03:09:58 +0000
Received: from vivo.com (wm-10.qy.internal [127.0.0.1])
 by m176150.mail.qiye.163.com (Hmail) with ESMTP id E210C1A30A3;
 Thu,  7 May 2020 11:09:15 +0800 (CST)
Message-ID: <AAsA8gAQCF1C9rDJm0RSQaqC.3.1588820955909.Hmail.bernard@vivo.com>
To: Bernard Zhao <bernard@vivo.com>
Subject: =?UTF-8?B?UmU6W1BBVENIXSBkcm0vbWVzb246IHBtIHJlc3VtZSBhZGQgcmV0dXJuIGVycm5vIGJyYW5jaA==?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 157.0.31.122
In-Reply-To: <20200428131747.2099-1-bernard@vivo.com>
MIME-Version: 1.0
Received: from bernard@vivo.com( [157.0.31.122) ] by ajax-webmail (
 [127.0.0.1] ) ; Thu, 7 May 2020 11:09:15 +0800 (GMT+08:00)
From: Bernard <bernard@vivo.com>
Date: Thu, 7 May 2020 11:09:15 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZSFVNQ0lLS0tKTUtJSkxJQllXWShZQU
 hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kJHlYWEh9ZQUhMTktISU9MQk5JN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6Ogg6Qxw6Kjg9SjhCCT8xFkspKCoaCjhVSFVKTkNDQ0lLQk5NS0hIVTMWGhIXVRkeCRUaCR87
 DRINFFUYFBZFWVdZEgtZQVlKTkxVS1VISlVKSUlZV1kIAVlBT0tOSDcG
X-HM-Tid: 0a71ed1bd32393b4kuwse210c1a30a3
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_200957_329956_12FDC732 
X-CRM114-Status: UNSURE (   5.61  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: opensource.kernel@vivo.com, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


From: Bernard Zhao <bernard@vivo.com>
Date: 2020-04-28 21:17:47
To:  Neil Armstrong <narmstrong@baylibre.com>,David Airlie <airlied@linux.ie>,Daniel Vetter <daniel@ffwll.ch>,Kevin Hilman <khilman@baylibre.com>,dri-devel@lists.freedesktop.org,linux-amlogic@lists.infradead.org,linux-arm-kernel@lists.infradead.org,linux-kernel@vger.kernel.org
Cc:  opensource.kernel@vivo.com,Bernard Zhao <bernard@vivo.com>
Subject: [PATCH] drm/meson: pm resume add return errno branch>pm_resump api did not handle drm_mode_config_helper_resume error.
>This change add handle to return drm_mode_config_helper_resume`s
>error number. This code logic is aligned with api pm_suspend.
>After this change, the code maybe a bit readable.
>
>Signed-off-by: Bernard Zhao <bernard@vivo.com>
>---
> drivers/gpu/drm/meson/meson_drv.c | 4 +---
> 1 file changed, 1 insertion(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
>index b5f5eb7b4bb9..8c2e1b47e81a 100644
>--- a/drivers/gpu/drm/meson/meson_drv.c
>+++ b/drivers/gpu/drm/meson/meson_drv.c
>@@ -412,9 +412,7 @@ static int __maybe_unused meson_drv_pm_resume(struct device *dev)
> 	if (priv->afbcd.ops)
> 		priv->afbcd.ops->init(priv);
> 
>-	drm_mode_config_helper_resume(priv->drm);
>-
>-	return 0;
>+	return drm_mode_config_helper_resume(priv->drm);
> }
> 
> static int compare_of(struct device *dev, void *data)
>-- 
>2.26.2
>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
