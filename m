Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CAFC678D4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 08:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ll3cvkgSGuO4eVw4UxtsrzYlJxOv6K9EmPtn27iHPys=; b=l0LDSaDMPUYVvn
	Qi9CTs+e4mcKzU+IN154MjhV+JeKoRS1Rc8Rqv0eSINJEiHvlPxwF7PDeLOEdLD7/AT5RIPCwSRmq
	XtanlcJqamJ/qa+ql6BM/68azUA9sQ2hCz4xbmMHjIvehgbbczMUjLf9mlRYR4fTtp8Oo3bNaj9t5
	dOu6OmrZDfruhNIc9mV72Wly22zHk662Nh5dkUA0oF4tOHJ83B0rYlc/l56s7wZhXeCGbHkastIyG
	PNy+JDrvz+u6QL81h8mSYfupSmdkLN851KQorDD8kE84hM122AKhkwPcpWZCdwsNBKOaDxpyilVQa
	mrIXA2rRWb8SMWIhlb+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ6Rv-00BxUi-Hg; Mon, 06 Mar 2023 08:44:03 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ6Rf-00BxOF-CO
	for linux-amlogic@lists.infradead.org; Mon, 06 Mar 2023 08:43:48 +0000
Received: by mail-wr1-x42c.google.com with SMTP id q16so7939682wrw.2
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Mar 2023 00:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678092225;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZEJmZby2wtp2N/ubBCyHC+kgDBokSCAHmX4OKZIirk=;
        b=WPfJV8QUOFJvl3Hc2sJI436+4fZlyELC9lxav4xDCRrzwqw6bJIAy15vEd8ed4aC2g
         nUkftZtJAYGvoFUjsQlifxarTc06/hapOZIxCM1W+KhjL/hPicRfR94wRzrVKoc8uV6T
         VCV2v1o+qpckor9f4C4VaqZ2iMtMzCQ2dySiBto2ar7UtpCWThFbc/4E5yna7cfCQGHf
         /bWa5uvsv5ezSYs6aaThhc45rFz6LA97Oip+Mg+qazwrCvmQG9pawfKmmOF7Az14liJI
         ErKKYGoaMOvy+Vj7RT13BGVsM/6wrXK+JK4xT7nho8cD86S52MxVFoPXNFjVAV5P+kpl
         ++wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678092225;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZEJmZby2wtp2N/ubBCyHC+kgDBokSCAHmX4OKZIirk=;
        b=GQ1o9xlgVjuUe+qUG5+T4EUuZGwUhtcnXK7+bC7VGZT1hgzxaiDaxzQKHO7u95GPGv
         0RGUgnssZkiVrz7XevLWw3Yh7l1vaVKVFDAAjUx6g6vf2onPbZhyGV75TFbmsP59CCNX
         xddMxSSlr1RoQTKW7trnp4hDPGLDcVpMrzOr8UM5Zf8nfJ23wpxluRE9ja7o5v9XoqPB
         gmBQ+lBB8E4mc3K6jOKvHSrG8PgKBJfdDPVca7v0mnbQjGWq6fkJCYlJ7cJjiZbQkx4/
         wZ/NjMzz1HZjPT9l2KPVTds2VXGiie3A22lNfRdpKpOBrGKwygXHfQyELqD67u+rCJM/
         jx1A==
X-Gm-Message-State: AO0yUKV1YyA4aIkPQ4a46xLlXLouPhKHhDDdJ2v9PP5bUvPdPXg0cwC0
	7udvSjLo/kKGoTOBYW0PbRuRH8wIIEUjvXKvbXrANg==
X-Google-Smtp-Source: AK7set/ZxD7wiI2b8xRTQAmyrmK9gEAwsitbyEhRqHPRzYROYUlP0inT+LCKU6Vm2ybtKZPkfTr8yQ==
X-Received: by 2002:a5d:4452:0:b0:2ca:ab68:eff3 with SMTP id x18-20020a5d4452000000b002caab68eff3mr6081160wrr.67.1678092225447;
        Mon, 06 Mar 2023 00:43:45 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id s11-20020a5d510b000000b002c55b0e6ef1sm9495632wrt.4.2023.03.06.00.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 00:43:45 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20230303123312.155164-1-christianshewitt@gmail.com>
References: <20230303123312.155164-1-christianshewitt@gmail.com>
Subject: Re: [PATCH v2] drm/meson: fix 1px pink line on GXM when scaling
 video overlay
Message-Id: <167809222462.18238.7243626712537618474.b4-ty@linaro.org>
Date: Mon, 06 Mar 2023 09:43:44 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_004347_450319_432B4E09 
X-CRM114-Status: UNSURE (   7.46  )
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

On Fri, 03 Mar 2023 12:33:12 +0000, Christian Hewitt wrote:
> Playing media with a resolution smaller than the crtc size requires the
> video overlay to be scaled for output and GXM boards display a 1px pink
> line on the bottom of the scaled overlay. Comparing with the downstream
> vendor driver revealed VPP_DUMMY_DATA not being set [0].
> 
> Setting VPP_DUMMY_DATA prevents the 1px pink line from being seen.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/meson: fix 1px pink line on GXM when scaling video overlay
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=5c8cf1664f288098a971a1d1e65716a2b6a279e1

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
