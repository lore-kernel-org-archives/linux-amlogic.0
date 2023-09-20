Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB11CE79D1
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Sep 2023 13:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L/MKok1GaH1au9tyGvNmEH0po2oKnvxZrhTQOWwij/s=; b=WRnv2wDwnF7+dJ
	NkQloUyDmMOTn2ITEqnE7PgqtGFdVldPm3+e5R+gnfkXXPDrsoPSNiU2N8y+P6t7JuK4ppobbrvKS
	3ChoZkbKQTPBOt+QbW6eJMU61lXRButxaCMrZyTZPQxRtlzMBFQjnPUYHZeDC5VtWRDGOShCUffqY
	IkLMSrfwh51tk8sxi63mlg5ry6zH6J8HijoLwfAA6cBhpVPjEAmFHLmTy5c1irBT07qHMTeUXl6RI
	BF2XFIcGqjGC6gii3ShZWMzpx4PPW72dWZyUrTHflTxnuT83LJOF6Iejh9dY7SJjcbI3yzE3EUOhb
	MNfgKxIE7OLcqyGXKYhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qixXP-003Ddo-0l;
	Wed, 20 Sep 2023 13:46:43 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qixXM-003DcQ-0n
	for linux-amlogic@lists.infradead.org;
	Wed, 20 Sep 2023 13:46:41 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-405082a8c77so37020175e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 20 Sep 2023 06:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695217597; x=1695822397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAM1wadeSyIjp7q3Vm93wQl3fXT/7CxJyrjA05VxHHI=;
        b=ZnhjL5mCybnzZ8Z2I3lussA+Rw8cJrukyibVeapecU91LSr76T9dkDs99PEk9ekaJj
         CDMt1IzDd3SlEp44EEVX54c9CCw5VhtxcbC+zzP5b8N42KcoRmM0f/dhQSDJrcVzfSAG
         a434J6RMXpY6QM4DTh3SDHEnE2CoxmiFNCHe12ac+FiJhj1vlJ4JK0LvmmbPiPyM+ybm
         /Yby2Pu0VBjnmotwHQ6Op9CHEcCMi3Jz3PYF00zFxYZdG4xgjNbOAEhuokalsrEe/xbW
         JgJD89nIR+aUYBMA/nvALPF2MNqYiT7n2A8LLxtwm0lf1OrdoGz8qZdHYrzVcu7AJX97
         LFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695217597; x=1695822397;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAM1wadeSyIjp7q3Vm93wQl3fXT/7CxJyrjA05VxHHI=;
        b=v8G8a1CrfKEJcNP+7SzwHM/8H/bMPnVoC10CNvJrBag7oBLHXiXkhe+FejVk+iduBF
         rOp2FRTjy5mDICzb3j8EqQAUz2gSd0z/JROQiV7RE6AOlZCm9egh0rtnKwu04ZOwvfHs
         FtxOWqUzxAZNHo278Dj6l2bY98+Rr8WuV7GIMX4NbjVb+ODJwG/AyLrSeVtIWw9+04S9
         0Hfr0rYQ0TJGkGaQkSAL/lNN5KQMLqYmPLXodA0Of5DLKCY2Tt70ugd/xOTdbpAJ49YV
         Fdjr9mt+gw+FjxDuTPcJxPLaQBh0QsRiaWot+9mB0+kcZnEcD64NXWL4h+Cf9/2+9GAP
         0QQw==
X-Gm-Message-State: AOJu0YyKrdwmjgGFmEIH8lgihaGsAf4Gl9UTxwMNtv3QSMceFyMx/FV5
	Krp2B2U5RrpV8ax5kDxJILmAuA==
X-Google-Smtp-Source: AGHT+IFbm0KhCiry33Vx93F5rLpq+lFcEYHKEkaTNlVhxvoLeU6XTDCsvfVSPISxoCiGd9wzuVCSWg==
X-Received: by 2002:a05:600c:144:b0:405:1ba2:4fc9 with SMTP id w4-20020a05600c014400b004051ba24fc9mr2524735wmm.15.1695217597366;
        Wed, 20 Sep 2023 06:46:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id u23-20020a05600c211700b004042dbb8925sm2010111wml.38.2023.09.20.06.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 06:46:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 stable@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20230914131015.2472029-1-jani.nikula@intel.com>
References: <20230914131015.2472029-1-jani.nikula@intel.com>
Subject: Re: [PATCH] drm/meson: fix memory leak on ->hpd_notify callback
Message-Id: <169521759637.2169873.6598076316992605754.b4-ty@linaro.org>
Date: Wed, 20 Sep 2023 15:46:36 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_064640_288268_5917484D 
X-CRM114-Status: UNSURE (   5.82  )
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

On Thu, 14 Sep 2023 16:10:15 +0300, Jani Nikula wrote:
> The EDID returned by drm_bridge_get_edid() needs to be freed.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/meson: fix memory leak on ->hpd_notify callback
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=099f0af9d98231bb74956ce92508e87cbcb896be

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
