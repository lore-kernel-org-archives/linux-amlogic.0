Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360A6C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 May 2022 07:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CyKH+PvA2IPSPnlcplfo0c8mYJ5NkgyEhe2pyh4AE3g=; b=4d2EvRjeFJh2xT
	shrbkTDwjynx8C7nv2w/86a/mu2MzE/O8Hu9DQ7S4uwu86HWlPpUG4uUe6zwaURkBRmdW2p36MYWb
	o8QHjlTjcl/9d5GRnInM/WGpkXZ+5DxAuIcnCDm4Kn+ZomZGDaPMRxjytjxDQtUGNySrSJ9sEEbhF
	LiQ+s/kz5/H6RHH70xx8/IG0uOPXZku7WgBM+qdPdmtgJHbfP/JV7J8t2Qbz8wdJNlLYEFCY7FccE
	TLnzCsRrlYLcn3M7jWqHpf46Gg6b0O7ReI61BmyvcLfh5e/kjFKXcS4AoBqUxaPiWAC3r5Vs0NZWp
	x23oJkSEBJst2sLYjZmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrE2k-0003oL-5a; Wed, 18 May 2022 07:24:26 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrE2M-0003gE-TQ
 for linux-amlogic@lists.infradead.org; Wed, 18 May 2022 07:24:05 +0000
Received: by mail-wm1-x336.google.com with SMTP id bg25so587766wmb.4
 for <linux-amlogic@lists.infradead.org>; Wed, 18 May 2022 00:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C4huS1qwBfiQNftZ7pKsoc9bDCoDHvonAE+NZgu2h6c=;
 b=mycV6ZeRycT/wvEF8CfEOMQzj0VfQb3FGo7c12/Ep8ZqxNC4W2svH+pgfN95xKMgYn
 ufrTLl0vwd5hh4bNSD4f6D/Vz+7AxvTj30OA+7XweZrp2C4RhRSterHoxVAZWAJYBhgY
 rsjDHCcMqzCUYWv0q8ULwqSsrXHSySBgleLvoys/Zl7q1FfRHe9N/w10jsIcdG4Vws/V
 usqVnzRcc63YChfLUXpXTGnKI2/WeOSz7iVMTsJ+wQv0Qn4gXepNahyFUMLCI7JH1gKo
 hx4TIbFBZpbcUvE50tpbuJ55KIBSpddZfxc5LNrl+9ghRAqus9Ps4s8HHdyDXgTa3ht5
 DZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C4huS1qwBfiQNftZ7pKsoc9bDCoDHvonAE+NZgu2h6c=;
 b=gAZd3xz6tybfsKhP92M9j19K7bZmjZlHnUyKrD9fMJ/hp/1yms6Sqjj6RSfuYdtc6y
 xZU7UKWTkuQ6tDKYIwTpsq842NCQFt/DF3mo3DHx+YecNdMwzgSF1hGqaMxSLeevEcKp
 OtrB1p31+amOtXKiBT+tjiqjXTwZS3AZnvoHEUFMbFSiu4tMXX1HMySiirFYIvTstu6i
 TOg28mUT/Mja7Il0MwsgDwobIG5JmsiRguM6kWpS7Wer6x9PhykXD60uLyIt7aqMuM9F
 8VSL2Wy6pf32N6hsuD9DTdSXAQilMNy3p3tQA+kOOKKLcjFZedpYSe4PmPryuYaj/PSm
 IBuQ==
X-Gm-Message-State: AOAM5302BKYwC2xVSA4KpfCScdQhsDv0NakkqS3DoOgvJAfBz3D4BUjQ
 k28f22h2EzY5JLaiM/NPFy/9JB3tampCscGW
X-Google-Smtp-Source: ABdhPJxFJIKOj6RpfneFWB//eZ12oKA+Q0wI6It3Ms/9Bkk+MKHxerFLHNbKUh8rG8+aOHrrGwmJ9A==
X-Received: by 2002:a1c:4b14:0:b0:394:2ece:c049 with SMTP id
 y20-20020a1c4b14000000b003942ecec049mr36055344wma.158.1652858638809; 
 Wed, 18 May 2022 00:23:58 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:dea9:338d:d500:c574])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfa742000000b0020d0b2de858sm1112113wrd.33.2022.05.18.00.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 00:23:58 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-amlogic@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org,
 Miaoqian Lin <linmq006@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 David Airlie <airlied@linux.ie>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] drm/meson: Fix refcount leak in meson_encoder_hdmi_init
Date: Wed, 18 May 2022 09:23:54 +0200
Message-Id: <165285860562.1281822.5287516325245345657.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511054052.51981-1-linmq006@gmail.com>
References: <20220511054052.51981-1-linmq006@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_002402_978349_AB236292 
X-CRM114-Status: UNSURE (   8.76  )
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

On Wed, 11 May 2022 09:40:51 +0400, Miaoqian Lin wrote:
> of_find_device_by_node() takes reference, we should use put_device()
> to release it when not need anymore.
> Add missing put_device() in error path to avoid refcount
> leak.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/meson: Fix refcount leak in meson_encoder_hdmi_init
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=7381076809586528e2a812a709e2758916318a99

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
