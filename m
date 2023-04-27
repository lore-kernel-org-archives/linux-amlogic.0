Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39E1C77B61
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Apr 2023 12:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ITfwG6U0MPSxs51+6SrIDMdJjDOZD2R3Mts6f5mGO/8=; b=Pz1+OVJ8+8LKDG
	UUNj41kJt1/OtVmNLZpN5rmEeRsjYI0gHL8xMYvwpJmcTY1u45kRzZjMMeWXS6bMLkpxCEumMujds
	UMGA/NrBbon4JJsUHTjBCCjDwDy9w5sslKcKhUbk9mKJiX8qyu+m5KKckI7tk+nHlGSe/HHQ+YHJ7
	JE3z47hStQY0N85E+FP9bUF3fMCG4sGDyY6QAa8onU9JtqYmgL+olRuUP21FAvTEnlsvwlGotNpj5
	sZO/1kKWbO3UQ1FoEndsc8U+x97VIH5Cd5b7GuA1RqSgb/2PFAQs0IjiIHWBbXeow45q5kpZNi1XU
	/Xr9TaVDsPvs3KeGLI0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ps16c-006ZrE-1N;
	Thu, 27 Apr 2023 12:52:14 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ps16Z-006Zow-2i
	for linux-amlogic@lists.infradead.org;
	Thu, 27 Apr 2023 12:52:13 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-2f625d52275so8157666f8f.3
        for <linux-amlogic@lists.infradead.org>; Thu, 27 Apr 2023 05:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682599920; x=1685191920;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfWLAe/fF1E4LgUmECNUtdr8sZ/Z/BT/KZ2q+zP0IlY=;
        b=ssf4q2tqkQe8GWV2NhnHzlfB1EFlj2xlT5+L+5STyjYwTHyNixHH/xbHNLJ8WQbhDM
         W9Qy/goPwiyWfsS8LeXJSrrqnZI0ibD7BeHltDffIADyQhnklKeJPHc73w/7A/lfFPii
         iuTWxKaE4O+PZBxhfX3Rz8Xw/ZQuoixe5wDDUa3a3ow6YZGUORJC3G8/eTBYqPwLn2cG
         PAHptahVaA7eYA4WoUSXBpAKh0x9DPnoo+boaAWB2y1Cxgl7exLimNNekvidA3nosQvm
         2mHEib5vZ76wooGH11x6nOUXluNRp5mrMM9/gncTpG02QUqKl/pv93mArpb3Il7ciOq3
         1uQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682599920; x=1685191920;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfWLAe/fF1E4LgUmECNUtdr8sZ/Z/BT/KZ2q+zP0IlY=;
        b=FI8Qsd6/0xkIqreoqHZtdXwMw0a5T/+IDIoL7aqRu6iCzvyQi40suFLlayC1tGPnl/
         fxshf3JNCdENmd2euDxe9+MB1GFHqmtaeyfJauFobrKv5/GMeWauC8uJNpSD3EJq754v
         F7PmrLS/zlCcUfVXqEJMUs8AMnpmkJt7XsCoPNyzkQ4iPPtyV8ngk4BE2ENDq8Nos4sl
         v4Q6Y2Q5kePPr1YD3Rm4xMdAKv4OtABtO9uiIfVJfmWwzkgahdifIMZgay2z/QIPKa7w
         HjX/jnvw0F9oUq0849Qfr8PyWcOZWY216mmdjmb/W388Q0vu+TBp+i/0E+zQUV87HgaU
         Vh1g==
X-Gm-Message-State: AC+VfDzr3kn3Htl9ZQD5UFjjsdYUmMLIdN7eYryha/e1VGncDOAvXgU1
	5/WoIaL2QNuP8n2I4ARPLCapDg==
X-Google-Smtp-Source: ACHHUZ6jkZGtDsfDwIEI40ww2DZomo1siHaiNuHWw1JgWvoQFqIbKz2YXzN8VVmfDkjJ6lOmgvBLeQ==
X-Received: by 2002:a5d:6a83:0:b0:2fb:283a:1757 with SMTP id s3-20020a5d6a83000000b002fb283a1757mr1413955wru.26.1682599920684;
        Thu, 27 Apr 2023 05:52:00 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d5950000000b0030490c8ccafsm6499980wri.52.2023.04.27.05.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 05:52:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: airlied@gmail.com, daniel@ffwll.ch, khilman@baylibre.com, 
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, 
 Tom Rix <trix@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230423145300.3937831-1-trix@redhat.com>
References: <20230423145300.3937831-1-trix@redhat.com>
Subject: Re: [PATCH] drm/meson: set variables meson_hdmi_*
 storage-class-specifier to static
Message-Id: <168259991963.3093924.6221745093198482770.b4-ty@linaro.org>
Date: Thu, 27 Apr 2023 14:51:59 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_055211_900066_DC4F1474 
X-CRM114-Status: UNSURE (   5.75  )
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

Hi,

On Sun, 23 Apr 2023 10:53:00 -0400, Tom Rix wrote:
> smatch has several simailar warnings to
> drivers/gpu/drm/meson/meson_venc.c:189:28: warning: symbol
>   'meson_hdmi_enci_mode_480i' was not declared. Should it be static?
> 
> These variables are only used in their defining file so should be static
> 
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/meson: set variables meson_hdmi_* storage-class-specifier to static
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=4b733b2c38b7c9304bbb92cf88f1b23f43ca575d

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
