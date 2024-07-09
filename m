Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E593C2BD09
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jul 2024 15:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0lkXgzJaZMOYOMGL8yIKaSe/RYZ11DC7pgir2cyIrtU=; b=qWh92dyL1UIC+j
	ZuuKhqBZ6txCR8BsqIo1yaV5oEM/aoKPAasRFaVNHvU1+xnXMpBrhmdJhQrqV2er02ZoWbUwni9uU
	Ullv64on5moMn8WpL/Au0Q+mWCvevjEFly7iyzwbpjOv+tq4vr060qkrQKLgufpR0cavFGjcFnFRX
	nbKrSK/ardQp3LxsQdluyjDB6s6gTQOo4Dn+Km/jMP1VIN/VgFfbZsv9L/+8dSrzLBYhdaGrEQpnk
	ZpwyeU2Ubvk8Hd1lQE9geWCzpzDsgUGr1L/6kGZ9hcAqeBusQIzaEhloG/JNyIDYsPL00KC273pwD
	lrhYxg8uT2h8ZdmM5cPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRCri-00000007lQJ-1eHQ;
	Tue, 09 Jul 2024 15:34:50 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRCrf-00000007lOZ-1gmt
	for linux-amlogic@lists.infradead.org;
	Tue, 09 Jul 2024 15:34:48 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-52ea2ce7abaso7159913e87.0
        for <linux-amlogic@lists.infradead.org>; Tue, 09 Jul 2024 08:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720539285; x=1721144085; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7yG/ZDYim4z9LC6qifUBZG0/p5bmD5z8CTGL0U90n4A=;
        b=ychcvwMbUAunbmvg0nl3yz//3yhEmipSJBOwvSujKHAr/u+1h7QGg1XUc94rztvMSr
         krxRmP+2B5EXDvT6+o21ELEYFkCnnBLQWned4DVZIjMGkJ3o/5E47zv6Z1b69hfaWYsX
         4cUx00/fvV7e0AmBBAMTHh8S1fyG26Sg5CPhaeReOD217UlPBNu1WJshOt0Enao7m5S2
         ljzoQRFS8r5Ved9jq0yJV1/2PtgJ7OJf5j5hcNs4MuuJgZIexmMMDav4oe38ew+EEGLJ
         VU9zKP4AXW/QswyTX3g7ZufjQi9Tm8IXKixvxNz2WNi0YD8TfwN8putzHt/TxUogOUi8
         YRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720539285; x=1721144085;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7yG/ZDYim4z9LC6qifUBZG0/p5bmD5z8CTGL0U90n4A=;
        b=MVxy/iwUHke1zZyF75sIMhHVtahXn+DRfvOcUWJVIeHGwmcGg8uM+tpml9TkLP79GC
         LVaA2SGHIzVUT56iWwlxVP1rZWF1HhPN/+wffNNdVl6H+kM26/bh0CRLo+GQwXW827IF
         qQAFXEC3FrrXPKrHH7c/+E1w0W/Ng+RjYsLB+/FJkavbsPp6n+Ok1Dh4kxyFKEeGSJ0F
         pRSuMlWvr0HCr+oapLi6zT8hTHBUennsDpPlKpIcSdsjucwxn1r2B9lIvYSRzltHSpSN
         OGx92shHSy+Valg8ZUJeBTuOgozmsKeZh7HkwP9xGoeZQI8lsKnAG36jcJBkL8G7txmf
         Nu6A==
X-Forwarded-Encrypted: i=1; AJvYcCUxfEahz1PpqbPGP3MDigUSTOUHUP0C8OpG6551tzJgB7kSAxRgeqv60clTZ2yvc21TYjf2c45rL5PQIi5hA27UQrqGtp3qiuRipMxv/Tcu+fU=
X-Gm-Message-State: AOJu0YyY8wKGuE6pG9Y53zEvRBEfijTOf535oeUELFbDscgEGgHIwN/d
	yCgsfJlj4b8sFt5Ee0ma1OyxILEyWlHVVY2WZsu7I8j4faBEmCuQJtdqc+PbSkE=
X-Google-Smtp-Source: AGHT+IGM3pUx5C/Cg6m7uBP+vTz1fPg9IUGzC77G9bSZyWmRGAOxTkESVD8m4RIjQ+Lwn/adRidfWA==
X-Received: by 2002:a19:6b19:0:b0:52e:9f43:c13f with SMTP id 2adb3069b0e04-52eb9990cecmr1756059e87.7.1720539285216;
        Tue, 09 Jul 2024 08:34:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6f1182sm44663495e9.14.2024.07.09.08.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 08:34:44 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Jourdan <mjourdan@baylibre.com>, Yao Zi <ziyao@disroot.org>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240703155826.10385-2-ziyao@disroot.org>
References: <20240703155826.10385-2-ziyao@disroot.org>
Subject: Re: [PATCH] drm/meson: fix canvas release in bind function
Message-Id: <172053928435.1226690.16610517501511162578.b4-ty@linaro.org>
Date: Tue, 09 Jul 2024 17:34:44 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_083447_478465_239CDAFB 
X-CRM114-Status: UNSURE (   5.85  )
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

On Wed, 03 Jul 2024 15:58:27 +0000, Yao Zi wrote:
> Allocated canvases may not be released on the error exit path of
> meson_drv_bind_master(), leading to resource leaking. Rewrite exit path
> to release canvases on error.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/meson: fix canvas release in bind function
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a695949b2e9bb6b6700a764c704731a306c4bebf

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
