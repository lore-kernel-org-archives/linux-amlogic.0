Return-Path: <SRS0=VwQk=ZW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1911C432C0
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Nov 2019 14:58:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A17CE2073C
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Nov 2019 14:58:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ej1549CX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="T+B5MWx1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A17CE2073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pnR9TRXjlGbMgDRh4NsZ2WgIPpZ4YFarqFX0QSgDFBA=; b=Ej1549CXdIQ/XW
	iC9Cip8vAvm8CNlAW1fziglfOWNKdu+0AUOAxQpvxL3XsBMWl7zX+BOHUncj7WVzStrdE3g8cuoJV
	4qZcZb4+Ob6RfOw9HYct9BcU/qgZDvW/x7/4menKfjxXTgK2k8HL5cKSczF1sf0yUdAqYH3uiBUUb
	TKNMVbXUzi/7LOgCIbxASp7E8cIcaiCUgThDPlC6KKnaWSEmy9Ty2N3PBFma8eYDdHj6ZJdLs6kSB
	u0cGZZOJ2ZqkYQeej8jXuS1y4RrX7Pt9G6Vg1kboM11QwWC8hkI13GKQ3F8Bh09g0yNVGPPmk+4rs
	bhZeR/U5YJOfoX40Mceg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ib4Ce-0007eX-5y; Sat, 30 Nov 2019 14:58:32 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ib4Cb-0007dR-5U; Sat, 30 Nov 2019 14:58:30 +0000
Received: by mail-wr1-x441.google.com with SMTP id c14so13858194wrn.7;
 Sat, 30 Nov 2019 06:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=clpGjkWQjLwNVa9dG7ghNAn26+3WI/efWDFoEsdhUXk=;
 b=T+B5MWx1NUXbV9Bve4Cj2BaBZFPdpWBp8JvKYzy2fgm8gNV68Yur4CdWocG7nFEqs7
 QKTxDu7k5uOJDRn39E2x5FnXAZ13tZzV1iydluFTjUumiMwAqiJ4mKTidxQvZskfzeqm
 TqvjIVTROHaLGz2zMHuJlX2bVCxXbh/x1dafdLACR3WRq7NpUioDlVows2SZwEcMFxyG
 JeiY2613NZzisJmhXVZIkUlVqX/SX1ikNEr/jNOvEl3VREvoWG13xMbeKISMGQe5MMyK
 yxTIC+rt0lsxCAmbujUVPwSQFwyI6CAQMqD8GbyaTEixD7h49O97+Z7uq5vUh/NxRYjW
 1rgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=clpGjkWQjLwNVa9dG7ghNAn26+3WI/efWDFoEsdhUXk=;
 b=jC5869lIAsCRj0of6C9RnIHVdi0G7T6VZjqWwZZgWV2yVf9NLYInecriR5XvsF5GmC
 V2qRaJJOqs+4k29jZWYowV6Wxgru1qVNXmV7MOFSaq5iX8BhMlXge6T377pDjiscY603
 NElPkx1XV7WAJjIE5BhTnghzx+tFIUUaltDuHQOIVr2YJlj6oDaU3n1nsriJ9qNjmpAu
 FoS/t81SnrPgXSyhP80Jw/4A9V0/sZOTNPwV/mIplkDd/y5knVLunz9IYH4Gd7nnBg2p
 BK4VboRHfDvtPVU24KLbpJ0Ml4nVfpzChvzbkVaPV64sXLOYgan2xXe8dyNzVRlH/N6X
 Cr7w==
X-Gm-Message-State: APjAAAUek4Ko3L+/1PAhTvVDhMkFikDWzL3bSz4FMeiM24wpktyqIfPO
 3MayIl+VsBl4Wbv2jaljF9wL/MU5
X-Google-Smtp-Source: APXvYqxeq/6g/DE7fjLghbw4h3yd67AuhejpMU5WGS7hxkX9senxEe2MERpW1XPAo3YwA0fHLrozxQ==
X-Received: by 2002:adf:bc4f:: with SMTP id a15mr6836305wrh.160.1575125907164; 
 Sat, 30 Nov 2019 06:58:27 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1371CB100428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:371c:b100:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id c9sm3510202wmc.47.2019.11.30.06.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2019 06:58:26 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com,
 narmstrong@baylibre.com
Subject: [PATCH RESEND v1 0/2] amlogic: meson-ee-pwrc: two small fixes
Date: Sat, 30 Nov 2019 15:58:19 +0100
Message-Id: <20191130145821.1490349-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191130_065829_206495_AA92CD13 
X-CRM114-Status: UNSURE (   9.04  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

While working on power domain support for the 32-bit SoCs I had some
crashes when trying to actually use the power domains. Turns out I had
a bug in my patches which add support for the older SoCs to
meson-ee-pwrc. However, I didn't notice these because the driver probed
just fine.

This is my attempt to spot "problems" (bugs in my code) earlier.

RESEND: sorry for the noise, I forgot to add the linux-amlogic mailing
list. This is important so patchwork can pick up these patches.


Martin Blumenstingl (2):
  soc: amlogic: meson-ee-pwrc: propagate PD provider registration errors
  soc: amlogic: meson-ee-pwrc: propagate errors from pm_genpd_init()

 drivers/soc/amlogic/meson-ee-pwrc.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
