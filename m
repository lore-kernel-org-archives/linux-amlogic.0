Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E59FC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Dec 2021 23:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mHRe2LPtcpvd5QZ27pSQkJMdJ7uiHdSjLgpcjNCB0zM=; b=PXd6qb+C5Eg1Sr
	WKeEPiG8MdY5rrinRxNHgjbR5ZEPovxHlaOXyne/uGGAE+Po7oQUjF+wokDUvBQlHSt2JU7BQ5xjt
	NML3Xh7idb7FGJB3mZ7slIPwuhcZWk4gAifQz7VvONycIRGtVVP6kV86kbvN8sEganXeJN6u/0MsW
	L3L5stiOhfYQm3IRO374aOD2klMceu7iBCykfCiyD7yrVArocLsnXQj1Vf2wT36Vpi2og8h/uzvPb
	QITOMhfDjMU8mvEMZ8iJDId209r1dQDEGgCHgbuxBr3QYQ9FQhslXlgI7Ee4YD2sGe/rjxOdaANAV
	wzxALgltmyyANW5c4/Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n35HO-005QX2-Ld; Thu, 30 Dec 2021 23:56:18 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n35HL-005QVz-Tb; Thu, 30 Dec 2021 23:56:17 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 n14-20020a7bcbce000000b00332f4abf43fso8323737wmi.0; 
 Thu, 30 Dec 2021 15:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=06S3zd2orIESj72FE3tHED43xQdHxTUMkfYYwe00wX0=;
 b=UN21p9i/HQBP5bIxdvrBzde1OUPTWPyofyKLJHtskKd+VUJIo4+fasBiQ1BZ38DGu2
 BS/OMU2bTo3CS0WrOgL+TfNYbfORze+G2kHzWVXQo1brPYoYmdoqoMr9juida9Pdr6lw
 2pYpTeV94yVc+jaaKNAgeSTYahZDSDK8IJfuSh8J2aiYFW3RwNabA0UgsSsA8BhLuoFn
 1Ofre4miz4RWoHxDkv9Wd3FKO7YKr18SHgt15sL4Ln4PJGuYO2UXTwzmey2tnGkeOJ2E
 dc7bWiOthsHX1JbCeT2A6N7eDF3aWYYMU9I1WXUleIAqcDKph89Ib54Rno3dzG59AX3d
 QfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=06S3zd2orIESj72FE3tHED43xQdHxTUMkfYYwe00wX0=;
 b=LHZi0xrIRABq9cQzjxePlHq2WKOob82NkUw2NHagVyPYLkSeeiixuqZbL02mFyNpe5
 AqbmyyTnybM1jWTvR+x+VGuhGLRGaWiD078fQ2hjvb0LqqeUhabD4HESiAG/O56ih0zO
 W/UxP419ztQAdH/27wBMALYFDkzTvXbxQMKHF6RcvceEi43eaS6TIMoCOgx2ggGi3Vgc
 HVMkC3ON/tjgqOJM9TdpqYGT5780fE8erCWxUlvYEofG06134/60V1gGHCag6Bm04xuO
 SzHc/1uLI9O1e8RXLRt/aZ23s0tRaqeR4abss1PUHTBPj1MQL1jAVCN2I+1jkwgZtHDE
 hxiQ==
X-Gm-Message-State: AOAM5316t3ORU3kqFmUW1S1zLFsDIYYK5sIWyhZVI+4q07MYaZcYwbk2
 v++L9p4GrAHRPE6nG7D5+wAjZB7Wc6A=
X-Google-Smtp-Source: ABdhPJzgh/ofqaEUf89LPraq5gBtOMLdMCVoLABcXbmXGl/gXmAtu34+N2JtT7fliiicXAQ/+OwVlw==
X-Received: by 2002:a05:600c:1c18:: with SMTP id
 j24mr28248546wms.189.1640908574243; 
 Thu, 30 Dec 2021 15:56:14 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c015-2400-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c015:2400:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id f16sm35137581wmg.27.2021.12.30.15.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 15:56:13 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/2] drm/meson: Error handling fix when AFBCD is used
Date: Fri, 31 Dec 2021 00:55:13 +0100
Message-Id: <20211230235515.1627522-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_155616_022489_DFF0A338 
X-CRM114-Status: UNSURE (   9.79  )
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

Hi Neil,

this series consists of a small cleanup patch and a fix for the error
handling in meson_drv_bind_master() when AFBCD is used.
The patches are based on drm-misc to not conflict with your previous
driver rework. Since the problem has not been observed in the wild I
decided not to Cc linux-stable.


Best regards,
Martin


Martin Blumenstingl (2):
  drm/meson: osd_afbcd: Add an exit callback to struct meson_afbcd_ops
  drm/meson: Fix error handling when afbcd.ops->init fails

 drivers/gpu/drm/meson/meson_drv.c       | 25 +++++++--------
 drivers/gpu/drm/meson/meson_osd_afbcd.c | 41 ++++++++++++++++---------
 drivers/gpu/drm/meson/meson_osd_afbcd.h |  1 +
 3 files changed, 41 insertions(+), 26 deletions(-)

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
