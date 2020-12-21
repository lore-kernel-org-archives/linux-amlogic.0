Return-Path: <SRS0=3nIP=FZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 237E9C4332B
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Dec 2020 18:36:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D97AD23122
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Dec 2020 18:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D97AD23122
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mvlM2wbyhAsyucSCuphHDg5QH94iB5CRr8o8fLqCWB4=; b=MZF5ry23euC1pkkBP7V9F0oaku
	aSuPUHaa0CxDLCqqH1C4zFnekcxq2o+GelAmC/WgwmDorwp51iYZBqcU+G2HfsRXIUufiGqUlVDow
	Kbmvt7/L2NWToLeAfmyEMM2rnhlGGBdyPGTk+NhhH/4X6G154B/aLiPKebwsBDY2KFPa31pVyLRQj
	k//g0AgCoAAvuFpxTawS255dlHxMkIOVaUP9EdilR8iA91YYhzGiBGDcQnRU1R2kfWVY2DPg743i6
	Ur0y3bIFhk/UacyyLYCowEWyKlq7/61Tp04xmCdNMOkEHlc8TFR/6RgmS0PGRuL7qybEk23/ITCbv
	TF+PPEwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krQ2u-0005CQ-A6; Mon, 21 Dec 2020 18:36:36 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krQ2r-0005BD-O3; Mon, 21 Dec 2020 18:36:34 +0000
Received: by mail-ej1-x635.google.com with SMTP id ga15so14833332ejb.4;
 Mon, 21 Dec 2020 10:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fWkMbxsI1o+TKi40gvIKxOy8FUWY3wrnEaa8EBZzq+Y=;
 b=YSnJ3X3KJ1HnAexXXg1QCJQQSdejcczuBUdYz9NqTnTkMwjP2n8x7yq5/4yvSgO/jD
 iPcvjMPTevnDN1Dy6+O9vIM+gtaTcl8dbIz6wiGNlx/FqKLDGNWpXzlPc1t2xr8duVVe
 wydaoV00COj0+X+mrHjieCOUZa4zYBp8cSq9/dceDzvn+adBoFZ8vgA/fYzHKIQL1PyS
 xMbuPofmZiCl9T+PIYd9WWjh4Ow3TqYq1urW32enTAVV+l2vpB0I9mbM/qshXIYjP0z0
 nkFwWhmBEPf/tLkUnXAjbLdn5BihMqkNUyjBsnL8DoCRI8WBJkb8qAIRektRryYljCyA
 Yosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fWkMbxsI1o+TKi40gvIKxOy8FUWY3wrnEaa8EBZzq+Y=;
 b=qAPstJBl1h5osIszqnuaIJl1Ra/L8C3XK35k9/J912bwMVPjqKvnqUWN8Lv1NUHojo
 dkexVjNWQU3D+pyITkbvIs5O838xP9CWGutfDwmcvjhuANwtLCRQzp6fsuzv/InQovgM
 kkHiZBEZ29CHg4LN/f8bO5FXJ74zEkZ480EMHZCoa86b/HUPiFbR5TrkTlrtk9z0Vaqe
 EzYf5mpGv1dWN+UYT9qa8NSkAbPcvg/lvKvN5gFCaD4ThYJ/9pI9/eR6KQ16v2zH2kys
 8FWVR7KKn8ydjVNSD8Gxo/IIZkV8W7MoEXmcjFZclGvdn1TLbqMvEG0ZRtMBJnf9tmzJ
 hh9A==
X-Gm-Message-State: AOAM533pbBs1O49bCnQLDredNSaPdT1Ry6Nsa6RKM29B/BVTazYZLBol
 m80KMreiB8XW82IySHsnu4bUmRfwBI0=
X-Google-Smtp-Source: ABdhPJzYTKKKK7YdSQG4z2k5CUmkaYUnguR49SQ7yzoPQZ6lp44/ihPAGPP2FhdQucQPXMQKgdVqBw==
X-Received: by 2002:a17:906:eb49:: with SMTP id
 mc9mr16073411ejb.487.1608575791177; 
 Mon, 21 Dec 2020 10:36:31 -0800 (PST)
Received: from localhost.localdomain
 (p200300f137019000428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3701:9000:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id ld2sm9390408ejb.73.2020.12.21.10.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 10:36:30 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	jbrunet@baylibre.com
Subject: [PATCH 0/2] clk: meson8b: cleanup unused code
Date: Mon, 21 Dec 2020 19:36:22 +0100
Message-Id: <20201221183624.932649-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_133633_813461_12A2BBFD 
X-CRM114-Status: GOOD (  10.95  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

these patches are two small cleanups for code we don't need anymore.
The first patch removes support for old .dtbs. I am not sure if the
"fallback" logic still works as I have not tried this in a long time.


Martin Blumenstingl (2):
  clk: meson: meson8b: remove compatibility code for old .dtbs
  dt-bindings: clock: meson8b: remove non-existing clock macros

 drivers/clk/meson/meson8b.c              | 45 +++---------------------
 include/dt-bindings/clock/meson8b-clkc.h |  2 --
 2 files changed, 5 insertions(+), 42 deletions(-)

-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
